Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id DC55679501
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 23:21:50 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id g2-v6so6910615pgu.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=n3IoX8noaof/qGpkBSB+8yc9WThZ1BeScl3hXKNniF4=;
	b=OoxkPA3RJfLWqJxOIowyShYjcDq8R1FJlfidMnWSkRl8c++RkB/SHi3/hZ3lX2rgoc
	rvwyad7NklSjwbEBfBPjCau4CBQwkGN0rsZcQWF7uVTkmNeRCWEh5JUpZ/98XqU7sUPq
	0W97H3bghCEnn6SPm7buFsVvGJ+kHqAYFuU2d4kJuOxV5KmpF4CI8D7IHTPA9dCa8NWD
	EHrRlZPshRVxud2DzAHNXOSH5KLfIaL+pzPKhzqlIOMtDFsuJg4JM5ppEf9wN6DH8OTr
	B1p/Y4N0Wb/jL6jZTKQvnaCMLhIBZ5lHmdto9M9ClQAwc+uyI+TC9hR9U6+bqu0FI5KH
	cKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=n3IoX8noaof/qGpkBSB+8yc9WThZ1BeScl3hXKNniF4=;
	b=A7rBZ7NSPP06W7BlN5eShLwKvqlK0cvS0x7avpAX1mokLmuSJU9udCWtHFUEZpE6dY
	57q8l5/6VK3sXsjQQOu58i7EeNeRZ2Sa8PGeS2Oiz8F3Zx8CZnf7p0b7LpJaazcId7tw
	0P3CU2lyU2CDJWuKfkt65CSouMhcOZiqzIn3iWX6rjj5zaik5zN30jCWikydRP0kpfzm
	FkOJQFsDq7QxRY5Om1QiDjidlWpYIirOzDHhYzUC4fl2H3U8IHRVT2EXNhD+6dn3RPkC
	9CVkSIwEP2jpuqjHq8Dzx267ELcLkAZKLse5dXu0S1CwafqnTI0viQT7sdoF3VOaLNoO
	Q3Hw==
X-Gm-Message-State: ABuFfojbA6pwUtviEjl0oPg1ID6Kt7kDCSIS8nirN8W3pK5yvKgsxwqQ
	nOgaA2pZ6220vto9yRsHnE/a66C/
X-Google-Smtp-Source: ACcGV62SNABRJWc2Lh6QHrZLZXoQ3ITospU33x5y5I1iXGwxIPdMAch4IM1n7V2YIUQSHrc5dJLw+A==
X-Received: by 2002:a63:1342:: with SMTP id 2-v6mr4492068pgt.19.1538263311794; 
	Sat, 29 Sep 2018 16:21:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d58e:d32:beb0:c4a3?
	([2601:202:4180:c33:d58e:d32:beb0:c4a3])
	by smtp.gmail.com with ESMTPSA id
	187-v6sm14301291pfu.129.2018.09.29.16.21.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 16:21:50 -0700 (PDT)
To: Parthiban Nallathambi <pn@denx.de>,
	openembedded-devel@lists.openembedded.org
References: <20180929213137.1798271-1-pn@denx.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <60209f45-e4e0-5868-c65c-c6284e0599d2@gmail.com>
Date: Sat, 29 Sep 2018 16:21:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180929213137.1798271-1-pn@denx.de>
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
X-List-Received-Date: Sat, 29 Sep 2018 23:21:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/29/2018 02:31 PM, Parthiban Nallathambi wrote:
> - This patch enables the support for xscreensaver 5.39 version
> - xscreensaver.service created for the system with systemd
>
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> ---
>  .../xscreensaver/files/fix-buildscripts.patch      | 116 +++++++++
>  .../xscreensaver/files/tweak-app-defaults.patch    | 273 +++++++++++++++++++++
>  .../xscreensaver/files/xscreensaver.service        |  14 ++
>  .../xscreensaver/xscreensaver_5.39.bb              |  25 ++
>  4 files changed, 428 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
>  create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
>  create mode 100755 meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
>  create mode 100644 meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb

Have you run yocto-check-script to ensure this recipe is not introducing
anything the Maintainer will have to cleanup later?
- armin
>
> diff --git a/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
> new file mode 100644
> index 000000000..3a50eff83
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
> @@ -0,0 +1,116 @@
> +--- xscreensaver-5.39.orig/configure.in
> ++++ xscreensaver-5.39/configure.in
> +@@ -14,6 +14,9 @@
> + #
> + ###############################################################################
> + 
> ++includedir=''
> ++libdir=''
> ++
> + AH_TOP([
> + /* config.h.in --- xscreensaver, Copyright (c) 1991-2014 Jamie Zawinski.
> +  *
> +@@ -422,12 +425,12 @@
> + 
> +   OBJCC="$CC"
> + 
> +-  AC_MSG_CHECKING([whether the compiler works on ANSI C])
> +-  AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
> +-     AC_MSG_RESULT(yes),
> +-     AC_MSG_RESULT(no)
> +-     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.),
> +-     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.))
> ++#  AC_MSG_CHECKING([whether the compiler works on ANSI C])
> ++#  AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
> ++#     AC_MSG_RESULT(yes),
> ++#     AC_MSG_RESULT(no)
> ++#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.),
> ++#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.))
> + 
> +   if test -n "$GCC"; then
> +     AC_MSG_RESULT(Turning on gcc compiler warnings.)
> +--- xscreensaver-5.39.orig/Makefile.in
> ++++ xscreensaver-5.39/Makefile.in
> +@@ -6,7 +6,7 @@
> + VPATH		= @srcdir@
> + 
> + SHELL		= /bin/sh
> +-SUBDIRS 	= utils jwxyz hacks/images hacks hacks/glx driver po
> ++SUBDIRS 	= utils jwxyz hacks/images hacks driver
> + SUBDIRS2	= $(SUBDIRS) OSX android
> + TARFILES	= README README.hacking README.VMS INSTALL \
> + 		  configure configure.in Makefile.in config.h.in \
> +--- xscreensaver-5.39.orig/driver/Makefile.in
> ++++ xscreensaver-5.39/driver/Makefile.in
> +@@ -10,7 +10,7 @@
> + top_srcdir	= @top_srcdir@
> + top_builddir	= ..
> + 
> +-install_prefix	=
> ++install_prefix	= ${DESTDIR}
> + prefix		= @prefix@
> + exec_prefix	= @exec_prefix@
> + bindir		= @bindir@
> +@@ -221,7 +221,7 @@
> + SCRIPTS_1	= xscreensaver-getimage-file xscreensaver-getimage-video \
> + 		  xscreensaver-text
> + SCRIPTS_OSX	= xscreensaver-getimage-desktop
> +-SCRIPTS		= $(SCRIPTS_1) @SCRIPTS_OSX@
> ++#SCRIPTS		= $(SCRIPTS_1) @SCRIPTS_OSX@
> + 
> + HDRS		= XScreenSaver_ad.h XScreenSaver_Xm_ad.h \
> + 		  xscreensaver.h prefs.h remote.h exec.h \
> +--- xscreensaver-5.39.orig/hacks/Makefile.in
> ++++ xscreensaver-5.39/hacks/Makefile.in
> +@@ -10,7 +10,7 @@
> + top_srcdir	= @top_srcdir@
> + top_builddir	= ..
> + 
> +-install_prefix	=
> ++install_prefix	= ${DESTDIR}
> + prefix		= @prefix@
> + exec_prefix	= @exec_prefix@
> + bindir		= @bindir@
> +@@ -122,7 +122,7 @@
> + 		  asm6502.c abstractile.c lcdscrub.c hexadrop.c \
> + 		  tessellimage.c delaunay.c recanim.c binaryring.c \
> + 		  webcollage-cocoa.m webcollage-helper-cocoa.m testx11.c
> +-SCRIPTS		= vidwhacker webcollage ljlatest
> ++#SCRIPTS		= vidwhacker webcollage ljlatest
> + 
> + # Programs that are mentioned in XScreenSaver.ad, and that have XML files,
> + # but that are not shipped with xscreensaver itself.
> +@@ -163,7 +163,13 @@
> + 		  lcdscrub.o hexadrop.o tessellimage.o delaunay.o recanim.o \
> + 		  binaryring.o testx11.o
> + 
> +-EXES		= attraction blitspin bouboule braid decayscreen deco \
> ++EXES		= fontglide
> ++JPEG_EXES	= webcollage-helper
> ++
> ++RETIRED_EXES	= ant bubbles critical flag forest hyperball hypercube laser \
> ++		  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
> ++		  whirlygig worm xsublim juggle testx11 \
> ++		  attraction blitspin bouboule braid decayscreen deco \
> + 		  drift flame galaxy grav greynetic halo \
> + 		  helix hopalong ifs imsmap julia kaleidescope \
> + 		  maze moire noseguy pedal \
> +@@ -179,17 +185,12 @@
> + 		  speedmine vermiculate twang apollonian euler2d \
> + 		  polyominoes thornbird  fluidballs anemone halftone \
> + 		  metaballs eruption popsquares barcode piecewise cloudlife \
> +-		  fontglide apple2 xanalogtv pong  wormhole \
> ++		  apple2 xanalogtv pong  wormhole \
> + 		  pacman fuzzyflakes anemotaxis memscroller substrate \
> + 		  intermomentary fireworkx fiberlamp boxfit interaggregate \
> + 		  celtic cwaves m6502 abstractile lcdscrub hexadrop \
> + 		  tessellimage binaryring \
> + 		  @JPEG_EXES@
> +-JPEG_EXES	= webcollage-helper
> +-
> +-RETIRED_EXES	= ant bubbles critical flag forest hyperball hypercube laser \
> +-		  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
> +-		  whirlygig worm xsublim juggle testx11
> + 
> + HACK_OBJS_1	= fps.o $(UTILS_BIN)/resources.o $(UTILS_BIN)/visual.o \
> + 		  $(UTILS_BIN)/usleep.o $(UTILS_BIN)/yarandom.o \
> diff --git a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
> new file mode 100644
> index 000000000..099a0b2f4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
> @@ -0,0 +1,273 @@
> +--- xscreensaver-5.39.orig/driver/XScreenSaver.ad.in
> ++++ xscreensaver-5.39/driver/XScreenSaver.ad.in
> +@@ -29,7 +29,7 @@
> + ! /* (xrdb prevention kludge: whole file)
> + 
> + *mode:			random
> +-*timeout:		0:10:00
> ++*timeout:		0:15:00
> + *cycle:			0:10:00
> + *lockTimeout:		0:00:00
> + *passwdTimeout:		0:00:30
> +@@ -38,7 +38,7 @@
> + *dpmsStandby:		2:00:00
> + *dpmsSuspend:		2:00:00
> + *dpmsOff:		4:00:00
> +-*grabDesktopImages:	True
> ++*grabDesktopImages:	False
> + *grabVideoFrames:	False
> + *chooseRandomImages:	@DEFAULT_IMAGES_P@
> + ! This can be a local directory name, or the URL of an RSS or Atom feed.
> +@@ -48,11 +48,11 @@
> + *lock:			False
> + *verbose:		False
> + *timestamp:		True
> +-*fade:			True
> ++*fade:			False
> + *unfade:		False
> + *fadeSeconds:		0:00:03
> + *fadeTicks:		20
> +-*splash:		True
> ++*splash:		False
> + *splashDuration:	0:00:05
> + *visualID:		default
> + *captureStderr: 	True
> +@@ -158,236 +158,8 @@
> + ! screen savers interactively.
> + !
> + *programs:								      \
> +-				maze -root				    \n\
> +-@GL_KLUDGE@ GL: 				superquadrics -root			    \n\
> +-				attraction -root			    \n\
> +-				blitspin -root				    \n\
> +-				greynetic -root				    \n\
> +-				helix -root				    \n\
> +-				hopalong -root				    \n\
> +-				imsmap -root				    \n\
> +--				noseguy -root				    \n\
> +--				pyro -root				    \n\
> +-				qix -root				    \n\
> +--				rocks -root				    \n\
> +-				rorschach -root				    \n\
> +-				decayscreen -root			    \n\
> +-				flame -root				    \n\
> +-				halo -root				    \n\
> +-				slidescreen -root			    \n\
> +-				pedal -root				    \n\
> +-				bouboule -root				    \n\
> +--				braid -root				    \n\
> +-				coral -root				    \n\
> +-				deco -root				    \n\
> +-				drift -root				    \n\
> +--				fadeplot -root				    \n\
> +-				galaxy -root				    \n\
> +-				goop -root				    \n\
> +-				grav -root				    \n\
> +-				ifs -root				    \n\
> +-@GL_KLUDGE@ GL: 				jigsaw -root				    \n\
> +-				julia -root				    \n\
> +--				kaleidescope -root			    \n\
> +-@GL_KLUDGE@ GL: 				moebius -root				    \n\
> +-				moire -root				    \n\
> +-@GL_KLUDGE@ GL: 				morph3d -root				    \n\
> +-				mountain -root				    \n\
> +-				munch -root				    \n\
> +-				penrose -root				    \n\
> +-@GL_KLUDGE@ GL: 				pipes -root				    \n\
> +-				rd-bomb -root				    \n\
> +-@GL_KLUDGE@ GL: 				rubik -root				    \n\
> +--				sierpinski -root			    \n\
> +-				slip -root				    \n\
> +-@GL_KLUDGE@ GL: 				sproingies -root			    \n\
> +-				starfish -root				    \n\
> +-				strange -root				    \n\
> +-				swirl -root				    \n\
> +-				triangle -root				    \n\
> +-				xjack -root				    \n\
> +-				xlyap -root				    \n\
> +-@GL_KLUDGE@ GL: 				atlantis -root				    \n\
> +-				bsod -root				    \n\
> +-@GL_KLUDGE@ GL: 				bubble3d -root				    \n\
> +-@GL_KLUDGE@ GL: 				cage -root				    \n\
> +--				crystal -root				    \n\
> +-				cynosure -root				    \n\
> +-				discrete -root				    \n\
> +-				distort -root				    \n\
> +-				epicycle -root				    \n\
> +-				flow -root				    \n\
> +-@GL_KLUDGE@ GL: 				glplanet -root				    \n\
> +-				interference -root			    \n\
> +-				kumppa -root				    \n\
> +-@GL_KLUDGE@ GL: 				lament -root				    \n\
> +-				moire2 -root				    \n\
> +-@GL_KLUDGE@ GL: 				sonar -root				    \n\
> +-@GL_KLUDGE@ GL: 				stairs -root				    \n\
> +-				truchet -root				    \n\
> +--				vidwhacker -root			    \n\
> +-				blaster -root				    \n\
> +-				bumps -root				    \n\
> +-				ccurve -root				    \n\
> +-				compass -root				    \n\
> +-				deluxe -root				    \n\
> +--				demon -root				    \n\
> +-@GLE_KLUDGE@ GL: 				extrusion -root				    \n\
> +--				loop -root				    \n\
> +-				penetrate -root				    \n\
> +-				petri -root				    \n\
> +-				phosphor -root				    \n\
> +-@GL_KLUDGE@ GL: 				pulsar -root				    \n\
> +-				ripples -root				    \n\
> +-				shadebobs -root				    \n\
> +-@GL_KLUDGE@ GL: 				sierpinski3d -root			    \n\
> +-				spotlight -root				    \n\
> +-				squiral -root				    \n\
> +-				wander -root				    \n\
> +--				webcollage -root			    \n\
> +-				xflame -root				    \n\
> +-				xmatrix -root				    \n\
> +-@GL_KLUDGE@ GL: 				gflux -root				    \n\
> +--				nerverot -root				    \n\
> +-				xrayswarm -root				    \n\
> +-				xspirograph -root			    \n\
> +-@GL_KLUDGE@ GL: 				circuit -root				    \n\
> +-@GL_KLUDGE@ GL: 				dangerball -root			    \n\
> +-- GL: 				dnalogo -root				    \n\
> +-@GL_KLUDGE@ GL: 				engine -root				    \n\
> +-@GL_KLUDGE@ GL: 				flipscreen3d -root			    \n\
> +-@GL_KLUDGE@ GL: 				gltext -root				    \n\
> +-@GL_KLUDGE@ GL: 				menger -root				    \n\
> +-@GL_KLUDGE@ GL: 				molecule -root				    \n\
> +-				rotzoomer -root				    \n\
> +-				speedmine -root				    \n\
> +-@GL_KLUDGE@ GL: 				starwars -root				    \n\
> +-@GL_KLUDGE@ GL: 				stonerview -root			    \n\
> +-				vermiculate -root			    \n\
> +-				whirlwindwarp -root			    \n\
> +-				zoom -root				    \n\
> +-				anemone -root				    \n\
> +-				apollonian -root			    \n\
> +-@GL_KLUDGE@ GL: 				boxed -root				    \n\
> +-@GL_KLUDGE@ GL: 				cubenetic -root				    \n\
> +-@GL_KLUDGE@ GL: 				endgame -root				    \n\
> +-				euler2d -root				    \n\
> +-				fluidballs -root			    \n\
> +-@GL_KLUDGE@ GL: 				flurry -root				    \n\
> +-- GL: 				glblur -root				    \n\
> +-@GL_KLUDGE@ GL: 				glsnake -root				    \n\
> +-				halftone -root				    \n\
> +-@GL_KLUDGE@ GL: 				juggler3d -root				    \n\
> +-@GL_KLUDGE@ GL: 				lavalite -root				    \n\
> +--				polyominoes -root			    \n\
> +-@GL_KLUDGE@ GL: 				queens -root				    \n\
> +-- GL: 				sballs -root				    \n\
> +-@GL_KLUDGE@ GL: 				spheremonics -root			    \n\
> +--				thornbird -root				    \n\
> +-				twang -root				    \n\
> +-- GL: 				antspotlight -root			    \n\
> +-				apple2 -root				    \n\
> +-@GL_KLUDGE@ GL: 				atunnel -root				    \n\
> +-				barcode -root				    \n\
> +-@GL_KLUDGE@ GL: 				blinkbox -root				    \n\
> +-@GL_KLUDGE@ GL: 				blocktube -root				    \n\
> +-@GL_KLUDGE@ GL: 				bouncingcow -root			    \n\
> +-				cloudlife -root				    \n\
> +-@GL_KLUDGE@ GL: 				cubestorm -root				    \n\
> +-				eruption -root				    \n\
> +-@GL_KLUDGE@ GL: 				flipflop -root				    \n\
> +-@GL_KLUDGE@ GL: 				flyingtoasters -root			    \n\
> +-				fontglide -root				    \n\
> +-@GL_KLUDGE@ GL: 				gleidescope -root			    \n\
> +-@GL_KLUDGE@ GL: 				glknots -root				    \n\
> +-@GL_KLUDGE@ GL: 				glmatrix -root				    \n\
> +-- GL: 				glslideshow -root			    \n\
> +-@GL_KLUDGE@ GL: 				hypertorus -root			    \n\
> +-- GL: 				jigglypuff -root			    \n\
> +-				metaballs -root				    \n\
> +-@GL_KLUDGE@ GL: 				mirrorblob -root			    \n\
> +-				piecewise -root				    \n\
> +-@GL_KLUDGE@ GL: 				polytopes -root				    \n\
> +-				pong -root				    \n\
> +-				popsquares -root			    \n\
> +-@GL_KLUDGE@ GL: 				surfaces -root				    \n\
> +-				xanalogtv -root				    \n\
> +-				abstractile -root			    \n\
> +-				anemotaxis -root			    \n\
> +-- GL: 				antinspect -root			    \n\
> +-				fireworkx -root				    \n\
> +-				fuzzyflakes -root			    \n\
> +-				interaggregate -root			    \n\
> +-				intermomentary -root			    \n\
> +-				memscroller -root			    \n\
> +-@GL_KLUDGE@ GL: 				noof -root				    \n\
> +-				pacman -root				    \n\
> +-@GL_KLUDGE@ GL: 				pinion -root				    \n\
> +-@GL_KLUDGE@ GL: 				polyhedra -root				    \n\
> +-- GL: 				providence -root			    \n\
> +-				substrate -root				    \n\
> +-				wormhole -root				    \n\
> +-- GL: 				antmaze -root				    \n\
> +-@GL_KLUDGE@ GL: 				boing -root				    \n\
> +-				boxfit -root				    \n\
> +-@GL_KLUDGE@ GL: 				carousel -root				    \n\
> +-				celtic -root				    \n\
> +-@GL_KLUDGE@ GL: 				crackberg -root				    \n\
> +-@GL_KLUDGE@ GL: 				cube21 -root				    \n\
> +-				fiberlamp -root				    \n\
> +-@GL_KLUDGE@ GL: 				fliptext -root				    \n\
> +-@GL_KLUDGE@ GL: 				glhanoi -root				    \n\
> +-@GL_KLUDGE@ GL: 				tangram -root				    \n\
> +-@GL_KLUDGE@ GL: 				timetunnel -root			    \n\
> +-@GL_KLUDGE@ GL: 				glschool -root				    \n\
> +-@GL_KLUDGE@ GL: 				topblock -root				    \n\
> +-@GL_KLUDGE@ GL: 				cubicgrid -root				    \n\
> +-				cwaves -root				    \n\
> +-@GL_KLUDGE@ GL: 				gears -root				    \n\
> +-@GL_KLUDGE@ GL: 				glcells -root				    \n\
> +-@GL_KLUDGE@ GL: 				lockward -root				    \n\
> +-				m6502 -root				    \n\
> +-@GL_KLUDGE@ GL: 				moebiusgears -root			    \n\
> +-@GL_KLUDGE@ GL: 				voronoi -root				    \n\
> +-@GL_KLUDGE@ GL: 				hypnowheel -root			    \n\
> +-@GL_KLUDGE@ GL: 				klein -root				    \n\
> +--				lcdscrub -root				    \n\
> +-@GL_KLUDGE@ GL: 				photopile -root				    \n\
> +-@GL_KLUDGE@ GL: 				skytentacles -root			    \n\
> +-@GL_KLUDGE@ GL: 				rubikblocks -root			    \n\
> +-@GL_KLUDGE@ GL: 				companioncube -root			    \n\
> +-@GL_KLUDGE@ GL: 				hilbert -root				    \n\
> +-@GL_KLUDGE@ GL: 				tronbit -root				    \n\
> +-@GL_KLUDGE@ GL: 				geodesic -root				    \n\
> +-				hexadrop -root				    \n\
> +-@GL_KLUDGE@ GL: 				kaleidocycle -root			    \n\
> +-@GL_KLUDGE@ GL: 				quasicrystal -root			    \n\
> +-@GL_KLUDGE@ GL: 				unknownpleasures -root			    \n\
> +-				binaryring -root			    \n\
> +-@GL_KLUDGE@ GL: 				cityflow -root				    \n\
> +-@GL_KLUDGE@ GL: 				geodesicgears -root			    \n\
> +-@GL_KLUDGE@ GL: 				projectiveplane -root			    \n\
> +-@GL_KLUDGE@ GL: 				romanboy -root				    \n\
> +-				tessellimage -root			    \n\
> +-@GL_KLUDGE@ GL: 				winduprobot -root			    \n\
> +-@GL_KLUDGE@ GL: 				splitflap -root				    \n\
> +-@GL_KLUDGE@ GL: 				cubestack -root				    \n\
> +-@GL_KLUDGE@ GL: 				cubetwist -root				    \n\
> +-@GL_KLUDGE@ GL: 				discoball -root				    \n\
> +-@GL_KLUDGE@ GL: 				dymaxionmap -root			    \n\
> +-@GL_KLUDGE@ GL: 				energystream -root			    \n\
> +-@GL_KLUDGE@ GL: 				hexstrut -root				    \n\
> +-@GL_KLUDGE@ GL: 				hydrostat -root				    \n\
> +-@GL_KLUDGE@ GL: 				raverhoop -root				    \n\
> +-@GL_KLUDGE@ GL: 				splodesic -root				    \n\
> +-@GL_KLUDGE@ GL: 				unicrud -root				    \n\
> +-@GL_KLUDGE@ GL: 				esper -root				    \n\
> +-@GL_KLUDGE@ GL: 				vigilance -root				    \n\
> +-@GL_KLUDGE@ GL: 				crumbler -root				    \n\
> +-@GL_KLUDGE@ GL: 				maze3d -root				    \n\
> +-@GL_KLUDGE@ GL: 				peepers -root				    \n\
> +-@GL_KLUDGE@ GL: 				razzledazzle -root			    \n
> +-
> ++-				fontglide -root -program "date +'%F %H:%M %z'"				    \n\
> ++				gifview --window $XSCREENSAVER_WINDOW /usr/share/logo/bosch-black.gif			    \n
> + 
> + 
> + !=============================================================================
> diff --git a/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
> new file mode 100755
> index 000000000..17dfe75ef
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Xscreensaver service
> +PartOf=xserver-nodm.service
> +After=xserver-nodm.service
> +
> +[Service]
> +ExecStart=/usr/bin/xscreensaver
> +Environment="DISPLAY=:0"
> +User=xuser
> +Restart=always
> +RestartSec=1
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> new file mode 100644
> index 000000000..6b17f9b09
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "X screen saver and locker"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=e141ab5822fb2d43694e1e47b59fc0df"
> +SRC_URI = "https://www.jwz.org/xscreensaver/xscreensaver-${PV}.tar.gz"
> +SRC_URI[md5sum] = "a5da62b91271f4e8afcc73d44697364b"
> +SRC_URI[sha256sum] = "48ce1880f18b5321182be0c033aeceb5ec5628a1505b9d1ff69dbf06093c2426"
> +
> +SRC_URI += " \
> +	file://xscreensaver.service \
> +	file://fix-buildscripts.patch \
> +	file://tweak-app-defaults.patch \
> +	"
> +
> +DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native"
> +# These are only needed as part of the stopgap screensaver implementation:
> +RDEPENDS_${PN} += "xserver-nodm-init gifview liberation-fonts"
> +
> +inherit systemd perlnative pkgconfig gettext autotools-brokensep
> +
> +do_install_append() {
> +    install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
> +}
> +
> +FILES_${PN} += "${datadir}/X11/app-defaults/XScreenSaver"
> +SYSTEMD_SERVICE_${PN} = "xscreensaver.service"


