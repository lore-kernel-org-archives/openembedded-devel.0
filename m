Return-Path: <pn@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7DAC0791FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Nov 2018 14:30:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42pZpr4c3Hz1qx8t;
	Mon,  5 Nov 2018 15:30:44 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42pZpr4G36z1qtf6;
	Mon,  5 Nov 2018 15:30:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id q07ai0p6LgQ9; Mon,  5 Nov 2018 15:30:42 +0100 (CET)
X-Auth-Info: qqmiNi61b5IzmgUJrDSIBfU8ZCQS237nz0e7AQTpzOA=
Received: from antares.denx.de (unknown [62.91.23.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  5 Nov 2018 15:30:42 +0100 (CET)
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180929213137.1798271-1-pn@denx.de>
	<60209f45-e4e0-5868-c65c-c6284e0599d2@gmail.com>
From: Parthiban Nallathambi <pn@denx.de>
Message-ID: <b0eb96b6-6862-c87b-3cf1-8c4cac5fd4fc@denx.de>
Date: Mon, 5 Nov 2018 15:30:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <60209f45-e4e0-5868-c65c-c6284e0599d2@gmail.com>
Subject: Re: [PATCH] Adding support for xscreensaver-5.39
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
X-List-Received-Date: Mon, 05 Nov 2018 14:30:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/30/18 1:21 AM, akuster808 wrote:
> 
> 
> On 09/29/2018 02:31 PM, Parthiban Nallathambi wrote:
>> - This patch enables the support for xscreensaver 5.39 version
>> - xscreensaver.service created for the system with systemd
>>
>> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
>> ---
>>   .../xscreensaver/files/fix-buildscripts.patch      | 116 +++++++++
>>   .../xscreensaver/files/tweak-app-defaults.patch    | 273 +++++++++++++++++++++
>>   .../xscreensaver/files/xscreensaver.service        |  14 ++
>>   .../xscreensaver/xscreensaver_5.39.bb              |  25 ++
>>   4 files changed, 428 insertions(+)
>>   create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
>>   create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
>>   create mode 100755 meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
>>   create mode 100644 meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> 
> Have you run yocto-check-script to ensure this recipe is not introducing
> anything the Maintainer will have to cleanup later?
> - armin

I wasn't aware of this script. Could you share the path of this script?

Thanks,
Parthiban N

>>
>> diff --git a/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
>> new file mode 100644
>> index 000000000..3a50eff83
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
>> @@ -0,0 +1,116 @@
>> +--- xscreensaver-5.39.orig/configure.in
>> ++++ xscreensaver-5.39/configure.in
>> +@@ -14,6 +14,9 @@
>> + #
>> + ###############################################################################
>> +
>> ++includedir=''
>> ++libdir=''
>> ++
>> + AH_TOP([
>> + /* config.h.in --- xscreensaver, Copyright (c) 1991-2014 Jamie Zawinski.
>> +  *
>> +@@ -422,12 +425,12 @@
>> +
>> +   OBJCC="$CC"
>> +
>> +-  AC_MSG_CHECKING([whether the compiler works on ANSI C])
>> +-  AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
>> +-     AC_MSG_RESULT(yes),
>> +-     AC_MSG_RESULT(no)
>> +-     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.),
>> +-     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.))
>> ++#  AC_MSG_CHECKING([whether the compiler works on ANSI C])
>> ++#  AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
>> ++#     AC_MSG_RESULT(yes),
>> ++#     AC_MSG_RESULT(no)
>> ++#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.),
>> ++#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.))
>> +
>> +   if test -n "$GCC"; then
>> +     AC_MSG_RESULT(Turning on gcc compiler warnings.)
>> +--- xscreensaver-5.39.orig/Makefile.in
>> ++++ xscreensaver-5.39/Makefile.in
>> +@@ -6,7 +6,7 @@
>> + VPATH		= @srcdir@
>> +
>> + SHELL		= /bin/sh
>> +-SUBDIRS 	= utils jwxyz hacks/images hacks hacks/glx driver po
>> ++SUBDIRS 	= utils jwxyz hacks/images hacks driver
>> + SUBDIRS2	= $(SUBDIRS) OSX android
>> + TARFILES	= README README.hacking README.VMS INSTALL \
>> + 		  configure configure.in Makefile.in config.h.in \
>> +--- xscreensaver-5.39.orig/driver/Makefile.in
>> ++++ xscreensaver-5.39/driver/Makefile.in
>> +@@ -10,7 +10,7 @@
>> + top_srcdir	= @top_srcdir@
>> + top_builddir	= ..
>> +
>> +-install_prefix	=
>> ++install_prefix	= ${DESTDIR}
>> + prefix		= @prefix@
>> + exec_prefix	= @exec_prefix@
>> + bindir		= @bindir@
>> +@@ -221,7 +221,7 @@
>> + SCRIPTS_1	= xscreensaver-getimage-file xscreensaver-getimage-video \
>> + 		  xscreensaver-text
>> + SCRIPTS_OSX	= xscreensaver-getimage-desktop
>> +-SCRIPTS		= $(SCRIPTS_1) @SCRIPTS_OSX@
>> ++#SCRIPTS		= $(SCRIPTS_1) @SCRIPTS_OSX@
>> +
>> + HDRS		= XScreenSaver_ad.h XScreenSaver_Xm_ad.h \
>> + 		  xscreensaver.h prefs.h remote.h exec.h \
>> +--- xscreensaver-5.39.orig/hacks/Makefile.in
>> ++++ xscreensaver-5.39/hacks/Makefile.in
>> +@@ -10,7 +10,7 @@
>> + top_srcdir	= @top_srcdir@
>> + top_builddir	= ..
>> +
>> +-install_prefix	=
>> ++install_prefix	= ${DESTDIR}
>> + prefix		= @prefix@
>> + exec_prefix	= @exec_prefix@
>> + bindir		= @bindir@
>> +@@ -122,7 +122,7 @@
>> + 		  asm6502.c abstractile.c lcdscrub.c hexadrop.c \
>> + 		  tessellimage.c delaunay.c recanim.c binaryring.c \
>> + 		  webcollage-cocoa.m webcollage-helper-cocoa.m testx11.c
>> +-SCRIPTS		= vidwhacker webcollage ljlatest
>> ++#SCRIPTS		= vidwhacker webcollage ljlatest
>> +
>> + # Programs that are mentioned in XScreenSaver.ad, and that have XML files,
>> + # but that are not shipped with xscreensaver itself.
>> +@@ -163,7 +163,13 @@
>> + 		  lcdscrub.o hexadrop.o tessellimage.o delaunay.o recanim.o \
>> + 		  binaryring.o testx11.o
>> +
>> +-EXES		= attraction blitspin bouboule braid decayscreen deco \
>> ++EXES		= fontglide
>> ++JPEG_EXES	= webcollage-helper
>> ++
>> ++RETIRED_EXES	= ant bubbles critical flag forest hyperball hypercube laser \
>> ++		  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
>> ++		  whirlygig worm xsublim juggle testx11 \
>> ++		  attraction blitspin bouboule braid decayscreen deco \
>> + 		  drift flame galaxy grav greynetic halo \
>> + 		  helix hopalong ifs imsmap julia kaleidescope \
>> + 		  maze moire noseguy pedal \
>> +@@ -179,17 +185,12 @@
>> + 		  speedmine vermiculate twang apollonian euler2d \
>> + 		  polyominoes thornbird  fluidballs anemone halftone \
>> + 		  metaballs eruption popsquares barcode piecewise cloudlife \
>> +-		  fontglide apple2 xanalogtv pong  wormhole \
>> ++		  apple2 xanalogtv pong  wormhole \
>> + 		  pacman fuzzyflakes anemotaxis memscroller substrate \
>> + 		  intermomentary fireworkx fiberlamp boxfit interaggregate \
>> + 		  celtic cwaves m6502 abstractile lcdscrub hexadrop \
>> + 		  tessellimage binaryring \
>> + 		  @JPEG_EXES@
>> +-JPEG_EXES	= webcollage-helper
>> +-
>> +-RETIRED_EXES	= ant bubbles critical flag forest hyperball hypercube laser \
>> +-		  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
>> +-		  whirlygig worm xsublim juggle testx11
>> +
>> + HACK_OBJS_1	= fps.o $(UTILS_BIN)/resources.o $(UTILS_BIN)/visual.o \
>> + 		  $(UTILS_BIN)/usleep.o $(UTILS_BIN)/yarandom.o \
>> diff --git a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
>> new file mode 100644
>> index 000000000..099a0b2f4
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
>> @@ -0,0 +1,273 @@
>> +--- xscreensaver-5.39.orig/driver/XScreenSaver.ad.in
>> ++++ xscreensaver-5.39/driver/XScreenSaver.ad.in
>> +@@ -29,7 +29,7 @@
>> + ! /* (xrdb prevention kludge: whole file)
>> +
>> + *mode:			random
>> +-*timeout:		0:10:00
>> ++*timeout:		0:15:00
>> + *cycle:			0:10:00
>> + *lockTimeout:		0:00:00
>> + *passwdTimeout:		0:00:30
>> +@@ -38,7 +38,7 @@
>> + *dpmsStandby:		2:00:00
>> + *dpmsSuspend:		2:00:00
>> + *dpmsOff:		4:00:00
>> +-*grabDesktopImages:	True
>> ++*grabDesktopImages:	False
>> + *grabVideoFrames:	False
>> + *chooseRandomImages:	@DEFAULT_IMAGES_P@
>> + ! This can be a local directory name, or the URL of an RSS or Atom feed.
>> +@@ -48,11 +48,11 @@
>> + *lock:			False
>> + *verbose:		False
>> + *timestamp:		True
>> +-*fade:			True
>> ++*fade:			False
>> + *unfade:		False
>> + *fadeSeconds:		0:00:03
>> + *fadeTicks:		20
>> +-*splash:		True
>> ++*splash:		False
>> + *splashDuration:	0:00:05
>> + *visualID:		default
>> + *captureStderr: 	True
>> +@@ -158,236 +158,8 @@
>> + ! screen savers interactively.
>> + !
>> + *programs:								      \
>> +-				maze -root				    \n\
>> +-@GL_KLUDGE@ GL: 				superquadrics -root			    \n\
>> +-				attraction -root			    \n\
>> +-				blitspin -root				    \n\
>> +-				greynetic -root				    \n\
>> +-				helix -root				    \n\
>> +-				hopalong -root				    \n\
>> +-				imsmap -root				    \n\
>> +--				noseguy -root				    \n\
>> +--				pyro -root				    \n\
>> +-				qix -root				    \n\
>> +--				rocks -root				    \n\
>> +-				rorschach -root				    \n\
>> +-				decayscreen -root			    \n\
>> +-				flame -root				    \n\
>> +-				halo -root				    \n\
>> +-				slidescreen -root			    \n\
>> +-				pedal -root				    \n\
>> +-				bouboule -root				    \n\
>> +--				braid -root				    \n\
>> +-				coral -root				    \n\
>> +-				deco -root				    \n\
>> +-				drift -root				    \n\
>> +--				fadeplot -root				    \n\
>> +-				galaxy -root				    \n\
>> +-				goop -root				    \n\
>> +-				grav -root				    \n\
>> +-				ifs -root				    \n\
>> +-@GL_KLUDGE@ GL: 				jigsaw -root				    \n\
>> +-				julia -root				    \n\
>> +--				kaleidescope -root			    \n\
>> +-@GL_KLUDGE@ GL: 				moebius -root				    \n\
>> +-				moire -root				    \n\
>> +-@GL_KLUDGE@ GL: 				morph3d -root				    \n\
>> +-				mountain -root				    \n\
>> +-				munch -root				    \n\
>> +-				penrose -root				    \n\
>> +-@GL_KLUDGE@ GL: 				pipes -root				    \n\
>> +-				rd-bomb -root				    \n\
>> +-@GL_KLUDGE@ GL: 				rubik -root				    \n\
>> +--				sierpinski -root			    \n\
>> +-				slip -root				    \n\
>> +-@GL_KLUDGE@ GL: 				sproingies -root			    \n\
>> +-				starfish -root				    \n\
>> +-				strange -root				    \n\
>> +-				swirl -root				    \n\
>> +-				triangle -root				    \n\
>> +-				xjack -root				    \n\
>> +-				xlyap -root				    \n\
>> +-@GL_KLUDGE@ GL: 				atlantis -root				    \n\
>> +-				bsod -root				    \n\
>> +-@GL_KLUDGE@ GL: 				bubble3d -root				    \n\
>> +-@GL_KLUDGE@ GL: 				cage -root				    \n\
>> +--				crystal -root				    \n\
>> +-				cynosure -root				    \n\
>> +-				discrete -root				    \n\
>> +-				distort -root				    \n\
>> +-				epicycle -root				    \n\
>> +-				flow -root				    \n\
>> +-@GL_KLUDGE@ GL: 				glplanet -root				    \n\
>> +-				interference -root			    \n\
>> +-				kumppa -root				    \n\
>> +-@GL_KLUDGE@ GL: 				lament -root				    \n\
>> +-				moire2 -root				    \n\
>> +-@GL_KLUDGE@ GL: 				sonar -root				    \n\
>> +-@GL_KLUDGE@ GL: 				stairs -root				    \n\
>> +-				truchet -root				    \n\
>> +--				vidwhacker -root			    \n\
>> +-				blaster -root				    \n\
>> +-				bumps -root				    \n\
>> +-				ccurve -root				    \n\
>> +-				compass -root				    \n\
>> +-				deluxe -root				    \n\
>> +--				demon -root				    \n\
>> +-@GLE_KLUDGE@ GL: 				extrusion -root				    \n\
>> +--				loop -root				    \n\
>> +-				penetrate -root				    \n\
>> +-				petri -root				    \n\
>> +-				phosphor -root				    \n\
>> +-@GL_KLUDGE@ GL: 				pulsar -root				    \n\
>> +-				ripples -root				    \n\
>> +-				shadebobs -root				    \n\
>> +-@GL_KLUDGE@ GL: 				sierpinski3d -root			    \n\
>> +-				spotlight -root				    \n\
>> +-				squiral -root				    \n\
>> +-				wander -root				    \n\
>> +--				webcollage -root			    \n\
>> +-				xflame -root				    \n\
>> +-				xmatrix -root				    \n\
>> +-@GL_KLUDGE@ GL: 				gflux -root				    \n\
>> +--				nerverot -root				    \n\
>> +-				xrayswarm -root				    \n\
>> +-				xspirograph -root			    \n\
>> +-@GL_KLUDGE@ GL: 				circuit -root				    \n\
>> +-@GL_KLUDGE@ GL: 				dangerball -root			    \n\
>> +-- GL: 				dnalogo -root				    \n\
>> +-@GL_KLUDGE@ GL: 				engine -root				    \n\
>> +-@GL_KLUDGE@ GL: 				flipscreen3d -root			    \n\
>> +-@GL_KLUDGE@ GL: 				gltext -root				    \n\
>> +-@GL_KLUDGE@ GL: 				menger -root				    \n\
>> +-@GL_KLUDGE@ GL: 				molecule -root				    \n\
>> +-				rotzoomer -root				    \n\
>> +-				speedmine -root				    \n\
>> +-@GL_KLUDGE@ GL: 				starwars -root				    \n\
>> +-@GL_KLUDGE@ GL: 				stonerview -root			    \n\
>> +-				vermiculate -root			    \n\
>> +-				whirlwindwarp -root			    \n\
>> +-				zoom -root				    \n\
>> +-				anemone -root				    \n\
>> +-				apollonian -root			    \n\
>> +-@GL_KLUDGE@ GL: 				boxed -root				    \n\
>> +-@GL_KLUDGE@ GL: 				cubenetic -root				    \n\
>> +-@GL_KLUDGE@ GL: 				endgame -root				    \n\
>> +-				euler2d -root				    \n\
>> +-				fluidballs -root			    \n\
>> +-@GL_KLUDGE@ GL: 				flurry -root				    \n\
>> +-- GL: 				glblur -root				    \n\
>> +-@GL_KLUDGE@ GL: 				glsnake -root				    \n\
>> +-				halftone -root				    \n\
>> +-@GL_KLUDGE@ GL: 				juggler3d -root				    \n\
>> +-@GL_KLUDGE@ GL: 				lavalite -root				    \n\
>> +--				polyominoes -root			    \n\
>> +-@GL_KLUDGE@ GL: 				queens -root				    \n\
>> +-- GL: 				sballs -root				    \n\
>> +-@GL_KLUDGE@ GL: 				spheremonics -root			    \n\
>> +--				thornbird -root				    \n\
>> +-				twang -root				    \n\
>> +-- GL: 				antspotlight -root			    \n\
>> +-				apple2 -root				    \n\
>> +-@GL_KLUDGE@ GL: 				atunnel -root				    \n\
>> +-				barcode -root				    \n\
>> +-@GL_KLUDGE@ GL: 				blinkbox -root				    \n\
>> +-@GL_KLUDGE@ GL: 				blocktube -root				    \n\
>> +-@GL_KLUDGE@ GL: 				bouncingcow -root			    \n\
>> +-				cloudlife -root				    \n\
>> +-@GL_KLUDGE@ GL: 				cubestorm -root				    \n\
>> +-				eruption -root				    \n\
>> +-@GL_KLUDGE@ GL: 				flipflop -root				    \n\
>> +-@GL_KLUDGE@ GL: 				flyingtoasters -root			    \n\
>> +-				fontglide -root				    \n\
>> +-@GL_KLUDGE@ GL: 				gleidescope -root			    \n\
>> +-@GL_KLUDGE@ GL: 				glknots -root				    \n\
>> +-@GL_KLUDGE@ GL: 				glmatrix -root				    \n\
>> +-- GL: 				glslideshow -root			    \n\
>> +-@GL_KLUDGE@ GL: 				hypertorus -root			    \n\
>> +-- GL: 				jigglypuff -root			    \n\
>> +-				metaballs -root				    \n\
>> +-@GL_KLUDGE@ GL: 				mirrorblob -root			    \n\
>> +-				piecewise -root				    \n\
>> +-@GL_KLUDGE@ GL: 				polytopes -root				    \n\
>> +-				pong -root				    \n\
>> +-				popsquares -root			    \n\
>> +-@GL_KLUDGE@ GL: 				surfaces -root				    \n\
>> +-				xanalogtv -root				    \n\
>> +-				abstractile -root			    \n\
>> +-				anemotaxis -root			    \n\
>> +-- GL: 				antinspect -root			    \n\
>> +-				fireworkx -root				    \n\
>> +-				fuzzyflakes -root			    \n\
>> +-				interaggregate -root			    \n\
>> +-				intermomentary -root			    \n\
>> +-				memscroller -root			    \n\
>> +-@GL_KLUDGE@ GL: 				noof -root				    \n\
>> +-				pacman -root				    \n\
>> +-@GL_KLUDGE@ GL: 				pinion -root				    \n\
>> +-@GL_KLUDGE@ GL: 				polyhedra -root				    \n\
>> +-- GL: 				providence -root			    \n\
>> +-				substrate -root				    \n\
>> +-				wormhole -root				    \n\
>> +-- GL: 				antmaze -root				    \n\
>> +-@GL_KLUDGE@ GL: 				boing -root				    \n\
>> +-				boxfit -root				    \n\
>> +-@GL_KLUDGE@ GL: 				carousel -root				    \n\
>> +-				celtic -root				    \n\
>> +-@GL_KLUDGE@ GL: 				crackberg -root				    \n\
>> +-@GL_KLUDGE@ GL: 				cube21 -root				    \n\
>> +-				fiberlamp -root				    \n\
>> +-@GL_KLUDGE@ GL: 				fliptext -root				    \n\
>> +-@GL_KLUDGE@ GL: 				glhanoi -root				    \n\
>> +-@GL_KLUDGE@ GL: 				tangram -root				    \n\
>> +-@GL_KLUDGE@ GL: 				timetunnel -root			    \n\
>> +-@GL_KLUDGE@ GL: 				glschool -root				    \n\
>> +-@GL_KLUDGE@ GL: 				topblock -root				    \n\
>> +-@GL_KLUDGE@ GL: 				cubicgrid -root				    \n\
>> +-				cwaves -root				    \n\
>> +-@GL_KLUDGE@ GL: 				gears -root				    \n\
>> +-@GL_KLUDGE@ GL: 				glcells -root				    \n\
>> +-@GL_KLUDGE@ GL: 				lockward -root				    \n\
>> +-				m6502 -root				    \n\
>> +-@GL_KLUDGE@ GL: 				moebiusgears -root			    \n\
>> +-@GL_KLUDGE@ GL: 				voronoi -root				    \n\
>> +-@GL_KLUDGE@ GL: 				hypnowheel -root			    \n\
>> +-@GL_KLUDGE@ GL: 				klein -root				    \n\
>> +--				lcdscrub -root				    \n\
>> +-@GL_KLUDGE@ GL: 				photopile -root				    \n\
>> +-@GL_KLUDGE@ GL: 				skytentacles -root			    \n\
>> +-@GL_KLUDGE@ GL: 				rubikblocks -root			    \n\
>> +-@GL_KLUDGE@ GL: 				companioncube -root			    \n\
>> +-@GL_KLUDGE@ GL: 				hilbert -root				    \n\
>> +-@GL_KLUDGE@ GL: 				tronbit -root				    \n\
>> +-@GL_KLUDGE@ GL: 				geodesic -root				    \n\
>> +-				hexadrop -root				    \n\
>> +-@GL_KLUDGE@ GL: 				kaleidocycle -root			    \n\
>> +-@GL_KLUDGE@ GL: 				quasicrystal -root			    \n\
>> +-@GL_KLUDGE@ GL: 				unknownpleasures -root			    \n\
>> +-				binaryring -root			    \n\
>> +-@GL_KLUDGE@ GL: 				cityflow -root				    \n\
>> +-@GL_KLUDGE@ GL: 				geodesicgears -root			    \n\
>> +-@GL_KLUDGE@ GL: 				projectiveplane -root			    \n\
>> +-@GL_KLUDGE@ GL: 				romanboy -root				    \n\
>> +-				tessellimage -root			    \n\
>> +-@GL_KLUDGE@ GL: 				winduprobot -root			    \n\
>> +-@GL_KLUDGE@ GL: 				splitflap -root				    \n\
>> +-@GL_KLUDGE@ GL: 				cubestack -root				    \n\
>> +-@GL_KLUDGE@ GL: 				cubetwist -root				    \n\
>> +-@GL_KLUDGE@ GL: 				discoball -root				    \n\
>> +-@GL_KLUDGE@ GL: 				dymaxionmap -root			    \n\
>> +-@GL_KLUDGE@ GL: 				energystream -root			    \n\
>> +-@GL_KLUDGE@ GL: 				hexstrut -root				    \n\
>> +-@GL_KLUDGE@ GL: 				hydrostat -root				    \n\
>> +-@GL_KLUDGE@ GL: 				raverhoop -root				    \n\
>> +-@GL_KLUDGE@ GL: 				splodesic -root				    \n\
>> +-@GL_KLUDGE@ GL: 				unicrud -root				    \n\
>> +-@GL_KLUDGE@ GL: 				esper -root				    \n\
>> +-@GL_KLUDGE@ GL: 				vigilance -root				    \n\
>> +-@GL_KLUDGE@ GL: 				crumbler -root				    \n\
>> +-@GL_KLUDGE@ GL: 				maze3d -root				    \n\
>> +-@GL_KLUDGE@ GL: 				peepers -root				    \n\
>> +-@GL_KLUDGE@ GL: 				razzledazzle -root			    \n
>> +-
>> ++-				fontglide -root -program "date +'%F %H:%M %z'"				    \n\
>> ++				gifview --window $XSCREENSAVER_WINDOW /usr/share/logo/bosch-black.gif			    \n
>> +
>> +
>> + !=============================================================================
>> diff --git a/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
>> new file mode 100755
>> index 000000000..17dfe75ef
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
>> @@ -0,0 +1,14 @@
>> +[Unit]
>> +Description=Xscreensaver service
>> +PartOf=xserver-nodm.service
>> +After=xserver-nodm.service
>> +
>> +[Service]
>> +ExecStart=/usr/bin/xscreensaver
>> +Environment="DISPLAY=:0"
>> +User=xuser
>> +Restart=always
>> +RestartSec=1
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
>> new file mode 100644
>> index 000000000..6b17f9b09
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "X screen saver and locker"
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=e141ab5822fb2d43694e1e47b59fc0df"
>> +SRC_URI = "https://www.jwz.org/xscreensaver/xscreensaver-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "a5da62b91271f4e8afcc73d44697364b"
>> +SRC_URI[sha256sum] = "48ce1880f18b5321182be0c033aeceb5ec5628a1505b9d1ff69dbf06093c2426"
>> +
>> +SRC_URI += " \
>> +	file://xscreensaver.service \
>> +	file://fix-buildscripts.patch \
>> +	file://tweak-app-defaults.patch \
>> +	"
>> +
>> +DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native"
>> +# These are only needed as part of the stopgap screensaver implementation:
>> +RDEPENDS_${PN} += "xserver-nodm-init gifview liberation-fonts"
>> +
>> +inherit systemd perlnative pkgconfig gettext autotools-brokensep
>> +
>> +do_install_append() {
>> +    install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
>> +}
>> +
>> +FILES_${PN} += "${datadir}/X11/app-defaults/XScreenSaver"
>> +SYSTEMD_SERVICE_${PN} = "xscreensaver.service"
> 
> 

