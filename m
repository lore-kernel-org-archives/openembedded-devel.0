Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3C46B510
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 09:53:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z16-v6so12548248wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 01:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xf0MPxWIYYbs3F0yBuma77FU18FjofIqApN88oI5/1U=;
	b=D+VhF+FBjfmMllM8izug85vaU1BJgEZl5NI4LhczK4OY9KvtSwvy6mP7ybBZNT2Mi/
	hNrSfZY/IyffQk58OuADdFa+veNH1+po82Hn8krFyKMrjzLKuXWCQD6jHV0m14bYsEJI
	E37maVaOxLPauEmuaRC2H/vlHzHkRoJEyNoeOwbkQg/ZVAIzh1wcbFc4fdSmPlbeT0Di
	PGjL5rKjyDr8Nxo10SVgq8NoAgPtPx+sZRCCb0DQg7rkXvlAjPQa2r2rsZX0wbDl3A9G
	F1m4kVDhDPx/HvwUtkAlhQ1C8YCOmE9l0a4DYx1FRA8MyQWwzeGof39TzeoBTxdY59eo
	/QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xf0MPxWIYYbs3F0yBuma77FU18FjofIqApN88oI5/1U=;
	b=Sf9Oj4HVKHU+3QKHykOV9ujMQpTlADBMcRCipKgKuduBHNPzr1jg08r8hHASoIYZ0+
	j2PicfTqjFL9ko1VOv29hX6IqckpqD3HxsnMk4yvcpujJfhpn0G8eEv699a3Heap4/4R
	rXBV51+L0Bh5EaLYIBaUerSHtBX089qS2+Kq9DzZCmej8oH4MhwZlZQB9XNTjx8ZE6nJ
	2Roj9wy0/ziR0ocEW8cZBMybrfaWG6t0wLCVchxrSqgjNm6YBn2Bi6F0gO/UfFqi4+AO
	n3YWMj2iXqkBFufGYYH0RE7/ga2B+jNobK0lPAEPwH5lL/3sTZPmlasnnn9DTsfKyqGE
	4boQ==
X-Gm-Message-State: AGRZ1gKj/R7kkBmBbNYU3/c9d73aKfuuj3R9VwXjLoTTsBATUrz3aFQX
	utAf++rf42OgAo3nqQImqHwRM1yDT6Uy/+fLvvskdo6R
X-Google-Smtp-Source: AJdET5dvxTeWRJ2gfSPWyEupZd1mzvvuNmCskEKjVSAGErW3SfI1VJG9Wgudcm5pokNfNYAx/LqjIzQkKr8TPhXExOc=
X-Received: by 2002:a5d:4cc6:: with SMTP id c6-v6mr4458501wrt.75.1542102798609;
	Tue, 13 Nov 2018 01:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20181106155712.4180523-1-pn@denx.de>
In-Reply-To: <20181106155712.4180523-1-pn@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 13 Nov 2018 10:53:09 +0100
Message-ID: <CA+chaQe-odXPBtfwRY3-SVJkexAa2WzyekTe-4w4z8tPPNAuEw@mail.gmail.com>
To: pn@denx.de
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] Adding support for xscreensaver-5.39
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
X-List-Received-Date: Tue, 13 Nov 2018 09:53:18 -0000
Content-Type: text/plain; charset="UTF-8"

It depends on libx11, you should add:

inherit distro_features_check
REQUIRED_DISTRO_FEATURES = "x11"

to prevent errors in world builds.

On Tue, Nov 6, 2018 at 4:57 PM Parthiban Nallathambi <pn@denx.de> wrote:

> - This patch enables the support for xscreensaver 5.39 version
> - xscreensaver.service created for the system with systemd
>
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> ---
>  .../xscreensaver/files/fix-buildscripts.patch | 116 ++++++++
>  .../files/tweak-app-defaults.patch            | 273 ++++++++++++++++++
>  .../xscreensaver/files/xscreensaver.service   |  14 +
>  .../xscreensaver/xscreensaver_5.39.bb         |  25 ++
>  4 files changed, 428 insertions(+)
>  create mode 100644
> meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
>  create mode 100644
> meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
>  create mode 100755
> meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
>  create mode 100644 meta-oe/recipes-graphics/xscreensaver/
> xscreensaver_5.39.bb
>
> diff --git
> a/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
> b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
> new file mode 100644
> index 000000000..3a50eff83
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
> @@ -0,0 +1,116 @@
> +--- xscreensaver-5.39.orig/configure.in
> ++++ xscreensaver-5.39/configure.in
> +@@ -14,6 +14,9 @@
> + #
> +
> ###############################################################################
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
> +-     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check
> CC.),
> +-     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check
> CC.))
> ++#  AC_MSG_CHECKING([whether the compiler works on ANSI C])
> ++#  AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
> ++#     AC_MSG_RESULT(yes),
> ++#     AC_MSG_RESULT(no)
> ++#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check
> CC.),
> ++#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check
> CC.))
> +
> +   if test -n "$GCC"; then
> +     AC_MSG_RESULT(Turning on gcc compiler warnings.)
> +--- xscreensaver-5.39.orig/Makefile.in
> ++++ xscreensaver-5.39/Makefile.in
> +@@ -6,7 +6,7 @@
> + VPATH         = @srcdir@
> +
> + SHELL         = /bin/sh
> +-SUBDIRS       = utils jwxyz hacks/images hacks hacks/glx driver po
> ++SUBDIRS       = utils jwxyz hacks/images hacks driver
> + SUBDIRS2      = $(SUBDIRS) OSX android
> + TARFILES      = README README.hacking README.VMS INSTALL \
> +                 configure configure.in Makefile.in config.h.in \
> +--- xscreensaver-5.39.orig/driver/Makefile.in
> ++++ xscreensaver-5.39/driver/Makefile.in
> +@@ -10,7 +10,7 @@
> + top_srcdir    = @top_srcdir@
> + top_builddir  = ..
> +
> +-install_prefix        =
> ++install_prefix        = ${DESTDIR}
> + prefix                = @prefix@
> + exec_prefix   = @exec_prefix@
> + bindir                = @bindir@
> +@@ -221,7 +221,7 @@
> + SCRIPTS_1     = xscreensaver-getimage-file xscreensaver-getimage-video \
> +                 xscreensaver-text
> + SCRIPTS_OSX   = xscreensaver-getimage-desktop
> +-SCRIPTS               = $(SCRIPTS_1) @SCRIPTS_OSX@
> ++#SCRIPTS              = $(SCRIPTS_1) @SCRIPTS_OSX@
> +
> + HDRS          = XScreenSaver_ad.h XScreenSaver_Xm_ad.h \
> +                 xscreensaver.h prefs.h remote.h exec.h \
> +--- xscreensaver-5.39.orig/hacks/Makefile.in
> ++++ xscreensaver-5.39/hacks/Makefile.in
> +@@ -10,7 +10,7 @@
> + top_srcdir    = @top_srcdir@
> + top_builddir  = ..
> +
> +-install_prefix        =
> ++install_prefix        = ${DESTDIR}
> + prefix                = @prefix@
> + exec_prefix   = @exec_prefix@
> + bindir                = @bindir@
> +@@ -122,7 +122,7 @@
> +                 asm6502.c abstractile.c lcdscrub.c hexadrop.c \
> +                 tessellimage.c delaunay.c recanim.c binaryring.c \
> +                 webcollage-cocoa.m webcollage-helper-cocoa.m testx11.c
> +-SCRIPTS               = vidwhacker webcollage ljlatest
> ++#SCRIPTS              = vidwhacker webcollage ljlatest
> +
> + # Programs that are mentioned in XScreenSaver.ad, and that have XML
> files,
> + # but that are not shipped with xscreensaver itself.
> +@@ -163,7 +163,13 @@
> +                 lcdscrub.o hexadrop.o tessellimage.o delaunay.o
> recanim.o \
> +                 binaryring.o testx11.o
> +
> +-EXES          = attraction blitspin bouboule braid decayscreen deco \
> ++EXES          = fontglide
> ++JPEG_EXES     = webcollage-helper
> ++
> ++RETIRED_EXES  = ant bubbles critical flag forest hyperball hypercube
> laser \
> ++                lightning lisa lissie lmorph rotor sphere spiral t3d
> vines \
> ++                whirlygig worm xsublim juggle testx11 \
> ++                attraction blitspin bouboule braid decayscreen deco \
> +                 drift flame galaxy grav greynetic halo \
> +                 helix hopalong ifs imsmap julia kaleidescope \
> +                 maze moire noseguy pedal \
> +@@ -179,17 +185,12 @@
> +                 speedmine vermiculate twang apollonian euler2d \
> +                 polyominoes thornbird  fluidballs anemone halftone \
> +                 metaballs eruption popsquares barcode piecewise
> cloudlife \
> +-                fontglide apple2 xanalogtv pong  wormhole \
> ++                apple2 xanalogtv pong  wormhole \
> +                 pacman fuzzyflakes anemotaxis memscroller substrate \
> +                 intermomentary fireworkx fiberlamp boxfit interaggregate
> \
> +                 celtic cwaves m6502 abstractile lcdscrub hexadrop \
> +                 tessellimage binaryring \
> +                 @JPEG_EXES@
> +-JPEG_EXES     = webcollage-helper
> +-
> +-RETIRED_EXES  = ant bubbles critical flag forest hyperball hypercube
> laser \
> +-                lightning lisa lissie lmorph rotor sphere spiral t3d
> vines \
> +-                whirlygig worm xsublim juggle testx11
> +
> + HACK_OBJS_1   = fps.o $(UTILS_BIN)/resources.o $(UTILS_BIN)/visual.o \
> +                 $(UTILS_BIN)/usleep.o $(UTILS_BIN)/yarandom.o \
> diff --git
> a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
> b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
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
> + *mode:                        random
> +-*timeout:             0:10:00
> ++*timeout:             0:15:00
> + *cycle:                       0:10:00
> + *lockTimeout:         0:00:00
> + *passwdTimeout:               0:00:30
> +@@ -38,7 +38,7 @@
> + *dpmsStandby:         2:00:00
> + *dpmsSuspend:         2:00:00
> + *dpmsOff:             4:00:00
> +-*grabDesktopImages:   True
> ++*grabDesktopImages:   False
> + *grabVideoFrames:     False
> + *chooseRandomImages:  @DEFAULT_IMAGES_P@
> + ! This can be a local directory name, or the URL of an RSS or Atom feed.
> +@@ -48,11 +48,11 @@
> + *lock:                        False
> + *verbose:             False
> + *timestamp:           True
> +-*fade:                        True
> ++*fade:                        False
> + *unfade:              False
> + *fadeSeconds:         0:00:03
> + *fadeTicks:           20
> +-*splash:              True
> ++*splash:              False
> + *splashDuration:      0:00:05
> + *visualID:            default
> + *captureStderr:       True
> +@@ -158,236 +158,8 @@
> + ! screen savers interactively.
> + !
> + *programs:
>     \
> +-                              maze -root
>   \n\
> +-@GL_KLUDGE@ GL:                               superquadrics -root
>                    \n\
> +-                              attraction -root
>   \n\
> +-                              blitspin -root
>   \n\
> +-                              greynetic -root
>  \n\
> +-                              helix -root
>  \n\
> +-                              hopalong -root
>   \n\
> +-                              imsmap -root
>   \n\
> +--                             noseguy -root
>  \n\
> +--                             pyro -root
>   \n\
> +-                              qix -root
>  \n\
> +--                             rocks -root
>  \n\
> +-                              rorschach -root
>  \n\
> +-                              decayscreen -root
>  \n\
> +-                              flame -root
>  \n\
> +-                              halo -root
>   \n\
> +-                              slidescreen -root
>  \n\
> +-                              pedal -root
>  \n\
> +-                              bouboule -root
>   \n\
> +--                             braid -root
>  \n\
> +-                              coral -root
>  \n\
> +-                              deco -root
>   \n\
> +-                              drift -root
>  \n\
> +--                             fadeplot -root
>   \n\
> +-                              galaxy -root
>   \n\
> +-                              goop -root
>   \n\
> +-                              grav -root
>   \n\
> +-                              ifs -root
>  \n\
> +-@GL_KLUDGE@ GL:                               jigsaw -root
>                   \n\
> +-                              julia -root
>  \n\
> +--                             kaleidescope -root
>   \n\
> +-@GL_KLUDGE@ GL:                               moebius -root
>                    \n\
> +-                              moire -root
>  \n\
> +-@GL_KLUDGE@ GL:                               morph3d -root
>                    \n\
> +-                              mountain -root
>   \n\
> +-                              munch -root
>  \n\
> +-                              penrose -root
>  \n\
> +-@GL_KLUDGE@ GL:                               pipes -root
>                    \n\
> +-                              rd-bomb -root
>  \n\
> +-@GL_KLUDGE@ GL:                               rubik -root
>                    \n\
> +--                             sierpinski -root
>   \n\
> +-                              slip -root
>   \n\
> +-@GL_KLUDGE@ GL:                               sproingies -root
>                   \n\
> +-                              starfish -root
>   \n\
> +-                              strange -root
>  \n\
> +-                              swirl -root
>  \n\
> +-                              triangle -root
>   \n\
> +-                              xjack -root
>  \n\
> +-                              xlyap -root
>  \n\
> +-@GL_KLUDGE@ GL:                               atlantis -root
>                   \n\
> +-                              bsod -root
>   \n\
> +-@GL_KLUDGE@ GL:                               bubble3d -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               cage -root
>                   \n\
> +--                             crystal -root
>  \n\
> +-                              cynosure -root
>   \n\
> +-                              discrete -root
>   \n\
> +-                              distort -root
>  \n\
> +-                              epicycle -root
>   \n\
> +-                              flow -root
>   \n\
> +-@GL_KLUDGE@ GL:                               glplanet -root
>                   \n\
> +-                              interference -root
>   \n\
> +-                              kumppa -root
>   \n\
> +-@GL_KLUDGE@ GL:                               lament -root
>                   \n\
> +-                              moire2 -root
>   \n\
> +-@GL_KLUDGE@ GL:                               sonar -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               stairs -root
>                   \n\
> +-                              truchet -root
>  \n\
> +--                             vidwhacker -root
>   \n\
> +-                              blaster -root
>  \n\
> +-                              bumps -root
>  \n\
> +-                              ccurve -root
>   \n\
> +-                              compass -root
>  \n\
> +-                              deluxe -root
>   \n\
> +--                             demon -root
>  \n\
> +-@GLE_KLUDGE@ GL:                              extrusion -root
>                    \n\
> +--                             loop -root
>   \n\
> +-                              penetrate -root
>  \n\
> +-                              petri -root
>  \n\
> +-                              phosphor -root
>   \n\
> +-@GL_KLUDGE@ GL:                               pulsar -root
>                   \n\
> +-                              ripples -root
>  \n\
> +-                              shadebobs -root
>  \n\
> +-@GL_KLUDGE@ GL:                               sierpinski3d -root
>                   \n\
> +-                              spotlight -root
>  \n\
> +-                              squiral -root
>  \n\
> +-                              wander -root
>   \n\
> +--                             webcollage -root
>   \n\
> +-                              xflame -root
>   \n\
> +-                              xmatrix -root
>  \n\
> +-@GL_KLUDGE@ GL:                               gflux -root
>                    \n\
> +--                             nerverot -root
>   \n\
> +-                              xrayswarm -root
>  \n\
> +-                              xspirograph -root
>  \n\
> +-@GL_KLUDGE@ GL:                               circuit -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               dangerball -root
>                   \n\
> +-- GL:                                 dnalogo -root
>          \n\
> +-@GL_KLUDGE@ GL:                               engine -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               flipscreen3d -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               gltext -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               menger -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               molecule -root
>                   \n\
> +-                              rotzoomer -root
>  \n\
> +-                              speedmine -root
>  \n\
> +-@GL_KLUDGE@ GL:                               starwars -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               stonerview -root
>                   \n\
> +-                              vermiculate -root
>  \n\
> +-                              whirlwindwarp -root
>  \n\
> +-                              zoom -root
>   \n\
> +-                              anemone -root
>  \n\
> +-                              apollonian -root
>   \n\
> +-@GL_KLUDGE@ GL:                               boxed -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               cubenetic -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               endgame -root
>                    \n\
> +-                              euler2d -root
>  \n\
> +-                              fluidballs -root
>   \n\
> +-@GL_KLUDGE@ GL:                               flurry -root
>                   \n\
> +-- GL:                                 glblur -root
>           \n\
> +-@GL_KLUDGE@ GL:                               glsnake -root
>                    \n\
> +-                              halftone -root
>   \n\
> +-@GL_KLUDGE@ GL:                               juggler3d -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               lavalite -root
>                   \n\
> +--                             polyominoes -root
>  \n\
> +-@GL_KLUDGE@ GL:                               queens -root
>                   \n\
> +-- GL:                                 sballs -root
>           \n\
> +-@GL_KLUDGE@ GL:                               spheremonics -root
>                   \n\
> +--                             thornbird -root
>  \n\
> +-                              twang -root
>  \n\
> +-- GL:                                 antspotlight -root
>           \n\
> +-                              apple2 -root
>   \n\
> +-@GL_KLUDGE@ GL:                               atunnel -root
>                    \n\
> +-                              barcode -root
>  \n\
> +-@GL_KLUDGE@ GL:                               blinkbox -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               blocktube -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               bouncingcow -root
>                    \n\
> +-                              cloudlife -root
>  \n\
> +-@GL_KLUDGE@ GL:                               cubestorm -root
>                    \n\
> +-                              eruption -root
>   \n\
> +-@GL_KLUDGE@ GL:                               flipflop -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               flyingtoasters -root
>                   \n\
> +-                              fontglide -root
>  \n\
> +-@GL_KLUDGE@ GL:                               gleidescope -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               glknots -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               glmatrix -root
>                   \n\
> +-- GL:                                 glslideshow -root
>          \n\
> +-@GL_KLUDGE@ GL:                               hypertorus -root
>                   \n\
> +-- GL:                                 jigglypuff -root
>           \n\
> +-                              metaballs -root
>  \n\
> +-@GL_KLUDGE@ GL:                               mirrorblob -root
>                   \n\
> +-                              piecewise -root
>  \n\
> +-@GL_KLUDGE@ GL:                               polytopes -root
>                    \n\
> +-                              pong -root
>   \n\
> +-                              popsquares -root
>   \n\
> +-@GL_KLUDGE@ GL:                               surfaces -root
>                   \n\
> +-                              xanalogtv -root
>  \n\
> +-                              abstractile -root
>  \n\
> +-                              anemotaxis -root
>   \n\
> +-- GL:                                 antinspect -root
>           \n\
> +-                              fireworkx -root
>  \n\
> +-                              fuzzyflakes -root
>  \n\
> +-                              interaggregate -root
>   \n\
> +-                              intermomentary -root
>   \n\
> +-                              memscroller -root
>  \n\
> +-@GL_KLUDGE@ GL:                               noof -root
>                   \n\
> +-                              pacman -root
>   \n\
> +-@GL_KLUDGE@ GL:                               pinion -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               polyhedra -root
>                    \n\
> +-- GL:                                 providence -root
>           \n\
> +-                              substrate -root
>  \n\
> +-                              wormhole -root
>   \n\
> +-- GL:                                 antmaze -root
>          \n\
> +-@GL_KLUDGE@ GL:                               boing -root
>                    \n\
> +-                              boxfit -root
>   \n\
> +-@GL_KLUDGE@ GL:                               carousel -root
>                   \n\
> +-                              celtic -root
>   \n\
> +-@GL_KLUDGE@ GL:                               crackberg -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               cube21 -root
>                   \n\
> +-                              fiberlamp -root
>  \n\
> +-@GL_KLUDGE@ GL:                               fliptext -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               glhanoi -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               tangram -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               timetunnel -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               glschool -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               topblock -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               cubicgrid -root
>                    \n\
> +-                              cwaves -root
>   \n\
> +-@GL_KLUDGE@ GL:                               gears -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               glcells -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               lockward -root
>                   \n\
> +-                              m6502 -root
>  \n\
> +-@GL_KLUDGE@ GL:                               moebiusgears -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               voronoi -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               hypnowheel -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               klein -root
>                    \n\
> +--                             lcdscrub -root
>   \n\
> +-@GL_KLUDGE@ GL:                               photopile -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               skytentacles -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               rubikblocks -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               companioncube -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               hilbert -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               tronbit -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               geodesic -root
>                   \n\
> +-                              hexadrop -root
>   \n\
> +-@GL_KLUDGE@ GL:                               kaleidocycle -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               quasicrystal -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               unknownpleasures -root
>                   \n\
> +-                              binaryring -root
>   \n\
> +-@GL_KLUDGE@ GL:                               cityflow -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               geodesicgears -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               projectiveplane -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               romanboy -root
>                   \n\
> +-                              tessellimage -root
>   \n\
> +-@GL_KLUDGE@ GL:                               winduprobot -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               splitflap -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               cubestack -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               cubetwist -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               discoball -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               dymaxionmap -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               energystream -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               hexstrut -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               hydrostat -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               raverhoop -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               splodesic -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               unicrud -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               esper -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               vigilance -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               crumbler -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               maze3d -root
>                   \n\
> +-@GL_KLUDGE@ GL:                               peepers -root
>                    \n\
> +-@GL_KLUDGE@ GL:                               razzledazzle -root
>                   \n
> +-
> ++-                             fontglide -root -program "date +'%F %H:%M
> %z'"                              \n\
> ++                              gifview --window $XSCREENSAVER_WINDOW
> /usr/share/logo/bosch-black.gif                       \n
> +
> +
> +
> !=============================================================================
> diff --git
> a/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
> b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
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
> diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> new file mode 100644
> index 000000000..e7f97b61a
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "X screen saver and locker"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM =
> "file://driver/xscreensaver.h;endline=10;md5=e141ab5822fb2d43694e1e47b59fc0df"
> +SRC_URI = "https://www.jwz.org/xscreensaver/xscreensaver-${PV}.tar.gz"
> +SRC_URI[md5sum] = "a5da62b91271f4e8afcc73d44697364b"
> +SRC_URI[sha256sum] =
> "48ce1880f18b5321182be0c033aeceb5ec5628a1505b9d1ff69dbf06093c2426"
> +
> +SRC_URI += " \
> +       file://xscreensaver.service \
> +       file://fix-buildscripts.patch \
> +       file://tweak-app-defaults.patch \
> +       "
> +
> +DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native
> bc-native"
> +# These are only needed as part of the stopgap screensaver implementation:
> +RDEPENDS_${PN} += "xserver-nodm-init liberation-fonts"
> +
> +inherit systemd perlnative pkgconfig gettext autotools-brokensep
> +
> +do_install_append() {
> +    install -D ${WORKDIR}/xscreensaver.service
> ${D}${systemd_unitdir}/system/xscreensaver.service
> +}
> +
> +FILES_${PN} += "${datadir}/X11/app-defaults/XScreenSaver"
> +SYSTEMD_SERVICE_${PN} = "xscreensaver.service"
> --
> 2.17.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

