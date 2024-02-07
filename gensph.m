function [x,y,z] = gensph(r,spacing)
%generate spherical sensor layout
phi = [-pi+2*pi/spacing:2*pi/spacing:pi]';
thmax = pi/2;
thmin = -pi/10;%change to angle desired above/below z=0 plane %was -pi/6
thdiff = thmax - thmin;
th = [thmin:thdiff/spacing:thmax-thdiff/spacing]'; 

sphcor = zeros(length(th)*length(phi),3);
j = 1;
for k = 1:length(th)
    for l = 1:length(phi)
        sphcor(j,:) = [phi(l),th(k),r];
        j = j + 1;
    end
end

[x,y,z] = sph2cart(sphcor(:,1),sphcor(:,2),sphcor(:,3));

end