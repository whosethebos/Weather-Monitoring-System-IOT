% BACKPROPAGATION ALGORITHM TESTING: ONLY FOR SINGLE HIDDEN LAYER

pattern=csvread('test.csv'); %Open test data file
Q=8;  
fid1 = fopen('bpnout.dat','w'); % Store the output of test data
fid = fopen('wih.dat'); % input-hidden values
a = fscanf(fid,'%g %g %g %g %g',[5 inf]); % It has five rows now.
Wih = a;
fclose(fid);

fid = fopen('who.dat'); % hidden-output values
a = fscanf(fid,'%g %g %g',[3 inf]); % It has two rows now.
Whj = a;
fclose(fid);

actout=csvread('actout.csv');
figure;
t=plot(actout);
t.Color=[0 0 0.5];
t.Marker='o';
hold on;

for k = 1:Q % for loop for input test pattern
      Si = [ pattern(:,1:5)];	% Input signals
      Zh = Si(k,:) * Wih;				% Hidden activations
      Sh = [1./(1 + exp(-Zh))];	% Binary activation function Hidden signals
      Yj = Sh * Whj;						% Output activations
      Sy(k) = 1./(1 + exp(-Yj));			% Output signals     

      fprintf(fid1,'%12.8f\n',Sy(k));     
  
 
   end
  % status = fclose(fid);   
   Sy
   z=plot(Sy);
   z.Color=[0.5 0 0];
   z.Marker='o';
   hold off;
   fclose(fid1);
   