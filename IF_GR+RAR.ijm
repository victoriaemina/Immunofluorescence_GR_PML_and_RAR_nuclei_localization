dir=getDirectory("elijan la carpeta con las imagenes");
fileList=getFileList(dir);
dirOut=getDirectory("elijan la carpeta para guardar las cuantificaciones");

for(i=0;i<fileList.length;i++){
	
		open(dir+fileList[i]);
		run("Subtract Background...", "rolling=50");
	
		run("Stack to Images");
 		
		dapi=getTitle();
		run("Put Behind [tab]");
		
		bf=getTitle();
		run("Put Behind [tab]");
		
		rar=getTitle();
		
		run("Put Behind [tab]");
	
		gr=getTitle();

		selectWindow(dapi);	
		
	
		run("Gaussian Blur...", "sigma=2");
		//run("8-bit");
		run("Threshold...");
		setAutoThreshold("Default dark");
		
		run("Set Measurements...", "mean display redirect="+gr+" decimal=3");
		run("Analyze Particles...", "size=25.00-250.00 show=[Overlay Masks] display exclude clear");

		saveAs("Results", dirOut+"Results_"+gr+".csv");

		close("Results");

		
		selectWindow(dapi);	
		
		run("Set Measurements...", "mean display redirect="+rar+" decimal=3");
		run("Analyze Particles...", "size=25.00-250.00 show=[Overlay Masks] display exclude clear");
		
		saveAs("Results", dirOut+"Results_"+rar+".csv");
		close("Results");


		selectWindow(dapi);	
		
		run("Set Measurements...", "mean display redirect="+dapi+" decimal=3");
		run("Analyze Particles...", "size=25.00-250.00 show=[Overlay Masks] display exclude clear");
		
		saveAs("Results", dirOut+"Results_"+dapi+".csv");
		close("Results");
		
		
		selectWindow(dapi);	
		
		saveAs("Tiff", dirOut+"segm_"+fileList[i]);

		close("Tiff");

		run("Close All");
		
		}
		
