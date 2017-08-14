Return-Path: <idealsim@laposte.net>
X-Greylist: delayed 1420 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Aug 2017 13:50:25 UTC
Received: from smtp.laposte.net (smtpoutz27.laposte.net [194.117.213.102])
	by mail.openembedded.org (Postfix) with ESMTP id C20937846B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 13:50:25 +0000 (UTC)
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout015 (Postfix) with ESMTP id 2C6021CC32D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
	t=1502717206; bh=RDnbl1liAUmwxnkKFlHTHT6DOnVXKvos9pFhEht5mRs=;
	h=From:Subject:To:Date;
	b=hxVQovmdLeQ+dwENmDipKaHc+sGg6jh+DwsW5EunFBLi7moszkppRJX/zUQwJEa6G
	mm3FWn8ADDn44hTVR32Up7N8nbHAD/WRwOV885o8m+LcyagyUq8A/Ckhos3BsOrP+W
	h1MqLWj3SdeUaAIzxT7zLQk0kV9vfoBgZom+5UuiR8fnM2KgCs83MlcXqUMknRGq5/
	u9pXSk4u+80vLM5EFGYn0q49CBi2sZ0UypMVHmA1k15rK1xajNHWO0foLJPPrMzXQV
	QxixoEMbTLKdl+vQ9Fo8vUF1zwbphaGz5ynpcOe5kasEqLDMKYXI80bhjYowwRIMcb
	aMp0hHQQHz8dw==
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout015 (Postfix) with ESMTP id 1DA9B1CC383
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:26:46 +0200 (CEST)
Received: from lpn-prd-vrin002 (lpn-prd-vrin002.prosodie [10.128.63.3])
	by lpn-prd-vrout015 (Postfix) with ESMTP id 185AE1CC32D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:26:46 +0200 (CEST)
Received: from lpn-prd-vrin002 (localhost [127.0.0.1])
	by lpn-prd-vrin002 (Postfix) with ESMTP id 0A2865C3684
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:26:46 +0200 (CEST)
Received: from [192.168.1.19] (ARennes-654-1-262-25.w2-13.abo.wanadoo.fr
	[2.13.73.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lpn-prd-vrin002 (Postfix) with ESMTPSA id 83E105C367C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:26:45 +0200 (CEST)
From: idealsim <idealsim@laposte.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <b53934ef-2480-8d0e-27ce-fe2fc1eb4d39@laposte.net>
Date: Mon, 14 Aug 2017 15:26:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
X-VR-SrcIP: 2.13.73.25
X-VR-FullState: 0
X-VR-Score: 0
X-VR-Cause-1: gggruggvucftvghtrhhoucdtuddrfeelkedrleehgdeijecutefuodetggdotefrodftvfcurfhrohhf
X-VR-Cause-2: ihhlvgemucfntefrqffuvffgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffuvffkffgf
X-VR-Cause-3: gggtsegrtderredtfeejnecuhfhrohhmpehiuggvrghlshhimhcuoehiuggvrghlshhimheslhgrphho
X-VR-Cause-4: shhtvgdrnhgvtheqnecukfhppedvrddufedrjeefrddvheenucfrrghrrghmpehmohguvgepshhmthhp
X-VR-Cause-5: ohhuthdphhgvlhhopegludelvddrudeikedruddrudelngdpihhnvghtpedvrddufedrjeefrddvhedp
X-VR-Cause-6: mhgrihhlfhhrohhmpehiuggvrghlshhimheslhgrphhoshhtvgdrnhgvthdprhgtphhtthhopehophgv
X-VR-Cause-7: nhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-VR-AvState: No
X-VR-State: 0
X-VR-State: 0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [qtwebengine] build failed in pyro branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Aug 2017 13:50:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all, i'm trying to build webengine in pyro branch but i have this 
error during the build :

/| ERROR: oe_runmake failed//
//| make[3]: Entering directory 
'/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core/api'//
//| compiling 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qtwebenginecoreglobal.cpp//
//| compiling 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebenginecookiestore.cpp//
//| compiling 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlrequestinfo.cpp//
//| compiling 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlrequestjob.cpp//
//| compiling 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlschemehandler.cpp//
//| generating .moc/moc_predefs.h//
//| moc 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebenginecookiestore.h//
//| moc 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlrequestinterceptor.h//
//| moc 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlrequestjob.h//
//| moc 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlschemehandler.h//
//| compiling .moc/moc_qwebenginecookiestore.cpp//
//| compiling .moc/moc_qwebengineurlrequestinterceptor.cpp//
//| compiling .moc/moc_qwebengineurlrequestjob.cpp//
//| compiling .moc/moc_qwebengineurlschemehandler.cpp//
//| rm -f Release/libqtwebenginecoreapi.a//
//| arm-poky-linux-gnueabi-ar cqs Release/libqtwebenginecoreapi.a 
.obj/qtwebenginecoreglobal.o .obj/qwebenginecookiestore.o 
.obj/qwebengineurlrequestinfo.o .obj/qwebengineurlrequestjob.o 
.obj/qwebengineurlschemehandler.o .obj/moc_qwebenginecookiestore.o 
.obj/moc_qwebengineurlrequestinterceptor.o 
.obj/moc_qwebengineurlrequestjob.o .obj/moc_qwebengineurlschemehandler.o//
//| make[3]: Leaving directory 
'/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core/api'//
//| ( test -e Makefile.core_module || 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot-native/usr/bin/qt5/qmake 
-o Makefile.core_module 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/core_module.pro 
GYP_CONFIG+=use_system_yasm GYP_CONFIG+=generate_character_data=0 
WEBENGINE_CONFIG+=use_system_flac WEBENGINE_CONFIG+=use_system_libevent 
WEBENGINE_CONFIG+=use_system_libwebp 
WEBENGINE_CONFIG+=use_system_libxslt WEBENGINE_CONFIG+=use_system_speex 
'QMAKE_CXX=arm-poky-linux-gnueabi-g++  -march=armv7-a -marm -mfpu=neon  
-mfloat-abi=hard -mcpu=cortex-a9 
--sysroot=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot' 
'QMAKE_CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -marm -mfpu=neon  
-mfloat-abi=hard -mcpu=cortex-a9 
--sysroot=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot' 
'QMAKE_LINK=arm-poky-linux-gnueabi-g++  -march=armv7-a -marm -mfpu=neon  
-mfloat-abi=hard -mcpu=cortex-a9 
--sysroot=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot' 
'QMAKE_CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types 
-fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0=/usr/src/debug/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0 
-fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot-native= 
-fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot= 
' 'QMAKE_CXXFLAGS= -O2 -pipe -g -feliminate-unused-debug-types 
-fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0=/usr/src/debug/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0 
-fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot-native= 
-fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot= 
-fvisibility-inlines-hidden' 'QMAKE_AR=arm-poky-linux-gnueabi-ar cqs' 
-after ) && make -f Makefile.core_module//
//| make[3]: Entering directory 
'/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core'//
//| creating linker version script QtWebEngineCore.version//
//| rm -f libQt5WebEngineCore.so.5.8.0 libQt5WebEngineCore.so 
libQt5WebEngineCore.so.5 libQt5WebEngineCore.so.5.8//
//| linking ../../lib/libQt5WebEngineCore.so.5.8.0//
//| collect2: fatal error: ld terminated with signal 9 [Killed]//
//| compilation terminated.//
//| Makefile.core_module:157: recipe for target 
'../../lib/libQt5WebEngineCore.so.5.8.0' failed//
//| make[3]: *** [../../lib/libQt5WebEngineCore.so.5.8.0] Error 1//
//| make[3]: Leaving directory 
'/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core'//
//| Makefile:158: recipe for target 'sub-core_module-pro-make_first' 
failed//
//| make[2]: *** [sub-core_module-pro-make_first] Error 2//
//| make[2]: Leaving directory 
'/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core'//
//| Makefile:49: recipe for target 'sub-core-make_first' failed//
//| make[1]: *** [sub-core-make_first] Error 2//
//| make[1]: Leaving directory 
'/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src'//
//| Makefile:44: recipe for target 'sub-src-make_first' failed//
//| make: *** [sub-src-make_first] Error 2//
//| ERROR: Function failed: do_compile (log file is located at 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/temp/log.do_compile.30193)//
//ERROR: Task 
(/media/modjo/data1TO/yocto/pyro/sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile) 
failed with exit code '1'//
//NOTE: Tasks Summary: Attempted 6306 tasks of which 6175 didn't need to 
be rerun and 1 failed.//
//
//Summary: 1 task failed://
///media/modjo/data1TO/yocto/pyro/sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile//
//Summary: There was 1 WARNING message shown.//
//Summary: There were 2 ERROR messages shown, returning a non-zero exit 
code./

an idea where is the issue ?

regards

Mickaël

