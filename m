Return-Path: <miralipoor.meysam@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 31D17606E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 10:22:09 +0000 (UTC)
Received: by padhz1 with SMTP id hz1so5330648pad.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 02:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=4nEz2TfTmqIlEQkAO+SVpl5I/YMcgfcYsZiEDmkvZOY=;
	b=oMlGfEUhNJCPPo5lr9Pzf7mIDkw3iaypSC941d9yaVonYRBRS28etnkurKBnqJ2Zue
	cjkg8QLy9fMFzNVm7drHaJavq5vVBB/yv05t1OUIgC9Rv+PoKTdGQkzmTBJOumkVTt02
	MskKLOLteQcgzQxJtRvdn6PvPbOwJ3udBQXME3ZA+nh/c6C4opsC5WvwhhNZS/rcR5Uz
	nM6pEu3T61BvlSgpdZMevGghPU38Ndn0W5qTfjvgFGheU5iqfk+4AjUjwCVeemgKqekQ
	nVIWKXzVga9SsG/ahyg5Ml0bKV27wJsnHP933EZl8BcWXEMX6abF+tFg2S8Q/cMn9ZLK
	sHTg==
MIME-Version: 1.0
X-Received: by 10.70.128.79 with SMTP id nm15mr48290981pdb.104.1424168530866; 
	Tue, 17 Feb 2015 02:22:10 -0800 (PST)
Received: by 10.70.29.194 with HTTP; Tue, 17 Feb 2015 02:22:10 -0800 (PST)
Date: Tue, 17 Feb 2015 13:52:10 +0330
Message-ID: <CAH+2B08mwFc40uX3_S2Oq3CFS+j8-7gpnVBeAFA-if_mQqQY3w@mail.gmail.com>
From: Meysam Miralipoor <miralipoor.meysam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: inconsistency in VLC recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Feb 2015 10:22:11 -0000
Content-Type: text/plain; charset=UTF-8

I use https://github.com/Freescale/fsl-community-bsp-platform,  dizzy
branch to build VLC for my RiotBoard which use an IMX Freescale
processor so my machine is imx6dl-riotboard. After long time bitbake
failed with following error.
ERROR: Task 214 (blah
blah/sources/poky/meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb,
do_compile) failed with exit code '1'
 also there is part of log file that tell special header file not found.

"arm-poky-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork
-mfloat-abi=hard -m
fpu=neon -mtune=cortex-a9 --sysroot=/home/meysam/SHard/copy/build/tmp/sysroots/i
mx6dl-riotboard -c -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inli
nes-hidden -I/home/meysam/SHard/copy/build/tmp/sysroots/imx6dl-riotboard/usr/src
/kernel/include/uapi -I/home/meysam/SHard/copy/build/tmp/sysroots/imx6dl-riotboa
rd/usr/src/kernel/include/
-I/home/meysam/SHard/copy/build/tmp/sysroots/imx6dl-riotboard/usr/include
-I/home/meysam/SHard/copy/build/tmp/sysroots/imx6dl-riotboard/usr/include/freetype2
-pthread -I/home/meysam/SHard/copy/build/tmp/sysroots/imx6dl-riotboard/usr/include/gstreamer-0.10
-I/home/meysam/SHard/copy/build/tmp/sysroots/imx6dl-riotboard/usr/include/glib-2.0
-I/home/meysam/SHard/copy/build/tmp/sysroots/imx6dl-riotboard/usr/lib/glib-2.0/include
-I/home/meysam/SHard/copy/build/tmp/sysroots/imx6dl-riotboard/usr/include/libxml2
-O2 -O2 -fvisibility=hidden -fvisibility-inlines-hidden
-fvisibility=hidden -fvisibility=hidden -fvisibility-inlines-hidden
-D_REENTRANT -Wall -W -Wall -W -Wall -W -fPIC -fPIC -fPIC -DLINUX=1
-DEGL_API_FB=1 -DQT_QPA_EXPERIMENTAL_TOUCHEVENT=1 -DQT_NO_DEBUG
-DQT_PLUGIN -DQT_PHONON_LIB -DQT_OPENGL_LIB -DQT_GUI_LIB -DQT_CORE_LIB
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_SHARED
-I../../../../mkspecs/linux-g++ -I. -I../../../../include/QtCore
-I../../../../include/QtGui -I../../../../include/QtOpenGL
-I../../../../include/phonon -I../../../../include -I.
-I/home/meysam/SHard/copy/build/tmp/sysroots/imx6dl-riotboard/usr/include/freetype2
-I../../../../include/phonon_compat -I.moc/release-shared -o
.obj/release-shared/moc_glrenderer.o
.moc/release-shared/moc_glrenderer.cpp
../../../3rdparty/phonon/gstreamer/widgetrenderer.cpp:36:25: fatal
error: linux/mxcfb.h: No such file or directory
 #include <linux/mxcfb.h>
"
Actually this header file exist for QEMU in X86 architecture in the
following address
build/tmp/work/x86_64-linux/qemu-native/2.1.0-r0/qemu-2.1.0/roms/u-boot/drivers/video/mxcfb.h
I am confused because i never build vlc or any other package or image
for X86 or QEMU. Why bitbake create this address?
Any help appreciated.
With Best Wishes

