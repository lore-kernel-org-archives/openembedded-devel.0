Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 84B5C75580
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:56:07 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id f1-v6so7829752plt.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 00:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HizPuZ1Fi/PYKrnPCne5wRbx3svKHG6Emo85VUwpKTQ=;
	b=tZC26KP169ffQOklMuncQYu+h4v7HgzldOE2/rXonkVfeo2HtfRxj8xwg/CgW4X3oQ
	BPaXSAfA9ZTsjawpMFa0YJXi819isxuoZRPWzyTjGupLJBBg0mfNEnAOuzu0j/JteBet
	zwGhTqLQvtnjFHbnbX3WJqnQVxuBmqqaZNHX4PCQcEfbN5xBkfx6911uIGWJNjmk3iOr
	2nW3DnsgD6A9mfRTHNq4z+OxY6L9oY1YWej4jQJN/ugWFi/zNi560kZBJdexZFMLRSg6
	f8147vN+ULOJ6ie1FOlAZVxYNS0ENw15uVbMGl3/GzmByjVHhTPO8t6VyWzr5pKlRsjO
	p6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=HizPuZ1Fi/PYKrnPCne5wRbx3svKHG6Emo85VUwpKTQ=;
	b=eq8kS5jko0BektNP1SqOsuXrCFDPV8l7L8SgU7wrUZqoAZz03aKO+IhW1OCm+RaQCW
	DVc260I0pQu1bfXnouHeKu96EP9asdwSWhUWqYcZpv5vTga3W9nps7q4Kg2HaCDznERv
	aH0jQsE9bY8r2hiwYZlrZ8Rz4a7d9gPJNrLTYwOBgRaanbp4m3paXboqpSIrYIsCKRRM
	bBFECbx6rJodCfRUxHnOB8PbxoAIwwcqaTc6yg2SIZ4jr20Lh29K457m5tR7Z8Bvonxe
	98pa9UDDIjP78ecjKfDT5ZsZQnywiOYV2RvmlU0SOr0YtP8pmOE2e0w3FOD8FFUV+GMY
	8VuQ==
X-Gm-Message-State: APt69E2LSAFdgPxAutK91FzqbfnH8BxP/2hz/IqIKrVMmtuKRK6m+D2z
	5Ti6dw9cReZFpu+8d6DeI5YtoyNs
X-Google-Smtp-Source: ADUXVKIAL1jBNjaeDfM4zHCiy5sdjwx/QzALTAGUphfAfuPEuFsGi/6iypUDZUKmbOuvdl6ojLmGiA==
X-Received: by 2002:a17:902:8d85:: with SMTP id
	v5-v6mr5506068plo.93.1528444568146; 
	Fri, 08 Jun 2018 00:56:08 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:cc7d:178e:51d6:ef12])
	by smtp.gmail.com with ESMTPSA id
	v6-v6sm86834305pfm.120.2018.06.08.00.56.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 00:56:07 -0700 (PDT)
To: Parthiban Nallathambi <pn@denx.de>, gurrieristefano@gmail.com
References: <20180606080558.3620048-1-pn@denx.de>
	<20180606080558.3620048-2-pn@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b861b7d2-3ef7-0bfb-1c4e-d0494e325708@gmail.com>
Date: Fri, 8 Jun 2018 00:56:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180606080558.3620048-2-pn@denx.de>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 08 Jun 2018 07:56:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Parthiban

it has a rdep on gifview but there is no recipe with such a name in any 
of meta-openembedded layers.


ERROR: Nothing RPROVIDES 'gifview' (but 
/mnt/a/oe/sources/meta-openembedded/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb 
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'gifview' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gifview']
NOTE: Runtime target 'xscreensaver-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xscreensaver-dev', 'gifview']
ERROR: Nothing RPROVIDES 'xscreensaver' (but 
/mnt/a/oe/sources/meta-openembedded/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb 
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'xscreensaver'
NOTE: Runtime target 'xscreensaver' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xscreensaver']

On 6/6/18 1:05 AM, Parthiban Nallathambi wrote:
> - This patch enables the support for xscreensaver 5.39 version
> - xscreensaver.service created for the system with systemd
> 
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> ---
>   .../xscreensaver/files/fix-buildscripts.patch      | 116 +++++++++
>   .../xscreensaver/files/tweak-app-defaults.patch    | 273 +++++++++++++++++++++
>   .../xscreensaver/files/xscreensaver.service        |  14 ++
>   .../xscreensaver/xscreensaver_5.39.bb              |  25 ++
>   4 files changed, 428 insertions(+)
>   create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
>   create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
>   create mode 100755 meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
>   create mode 100644 meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
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
> 

