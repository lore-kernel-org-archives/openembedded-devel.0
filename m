Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3B07504B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2018 00:36:16 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id c10-v6so6990550pgq.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 17:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=M6YjvB7lBWGp2j2ZEDEVi9s25KkhbHzlx3reeLnz74c=;
	b=C2Jlqa5moDjHIZoaDGZCOI8rV35jTCX/nRgK6BeSK/Pg890Bk5Ce6fMAfLymABP5le
	aETKNYxfK207jFWAJHtRB6dNM4FmZHMS8ebTD8kBzqNu/6VGlLbZcLcVGS4HHJqNcvQI
	Fpl7ziRxW0kaFBHuQG9rxY3KNvNsAMltU7qKILRSzN8bdGeDnUAtnLduhVTR+PewWkM0
	4c1ZrdeeiiQWPXDfP7xPXB0BFRRCJEXvp6X5IRPko9Z5coUUtXA+EE0nZfMtsP/rML7q
	IXFsUOVcRCc13DNqaysKNinoMjbR6Q/lxXeoqeDQe17qdQc1KNCGtluos2ObukhlX0NO
	ymLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=M6YjvB7lBWGp2j2ZEDEVi9s25KkhbHzlx3reeLnz74c=;
	b=glj1JWKaYk+SO9+I4DQuSjMCBTZlv50d+0WTE9tFQihZ8VzJtAHhjMARldIMABi+x8
	KBRJO+JOICUgxOMXn60oRGBOV233L84mYS1mni5DuZDGYq4dOC4arbo868aQSF1S4+3R
	L4X50nw4fbMjllvR7menV6gbsSKbkTXQBYFkKjiq4T8+DnNgzyAK45Om5qiu35M4ey/q
	A4ArerJqaAPAvid479le4Ri4elIyWmjOjgZaovoFZkm8ur2EO/Fwh4n92r0T7rx64isZ
	qyoSmhSuhxc8H5d+ZsSQO9fbx27hfDH3aHZdCjmApcPC9v7s1ZE9rQTvgS/McqQfZtcl
	xTdA==
X-Gm-Message-State: ABuFfohB75bNkHySLky8kSY9OuSJrujhP/e/92nGAiBrHC97SCqauN0m
	w9HKvm3LZMl/za7yJh/Es0rN3eKX
X-Google-Smtp-Source: ACcGV62N9gpNlfWfQOnk+l8DvSgUK+/JhwGzElolkkBOIrMS/hdYMkDeXkYBrL13uVGS1rItgAwjIQ==
X-Received: by 2002:a63:8dc1:: with SMTP id
	z184-v6mr4522064pgd.328.1538267777598; 
	Sat, 29 Sep 2018 17:36:17 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:687f:1383:f8bd:d883])
	by smtp.gmail.com with ESMTPSA id
	77-v6sm12380421pfw.159.2018.09.29.17.36.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 17:36:17 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>, Parthiban Nallathambi <pn@denx.de>,
	openembedded-devel@lists.openembedded.org
References: <20180929213137.1798271-1-pn@denx.de>
	<60209f45-e4e0-5868-c65c-c6284e0599d2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <f6eae2e4-a8d6-f8d0-d2be-5b831bf774e7@gmail.com>
Date: Sat, 29 Sep 2018 17:36:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
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
X-List-Received-Date: Sun, 30 Sep 2018 00:36:17 -0000
X-Groupsio-MsgNum: 74798
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="89doePrcNLyWnieQY1kkzLKLtbpBZjkrq"

--89doePrcNLyWnieQY1kkzLKLtbpBZjkrq
Content-Type: multipart/mixed; boundary="U15z52YIvAI01GkxCzynpHpeWC5wGwUbN";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: akuster808 <akuster808@gmail.com>, Parthiban Nallathambi <pn@denx.de>,
 openembedded-devel@lists.openembedded.org
Message-ID: <f6eae2e4-a8d6-f8d0-d2be-5b831bf774e7@gmail.com>
Subject: Re: [oe] [PATCH] Adding support for xscreensaver-5.39
References: <20180929213137.1798271-1-pn@denx.de>
 <60209f45-e4e0-5868-c65c-c6284e0599d2@gmail.com>
In-Reply-To: <60209f45-e4e0-5868-c65c-c6284e0599d2@gmail.com>

--U15z52YIvAI01GkxCzynpHpeWC5wGwUbN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/29/18 4:21 PM, akuster808 wrote:
>=20
>=20
> On 09/29/2018 02:31 PM, Parthiban Nallathambi wrote:
>> - This patch enables the support for xscreensaver 5.39 version
>> - xscreensaver.service created for the system with systemd
>>
>> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
>> ---
>>  .../xscreensaver/files/fix-buildscripts.patch      | 116 +++++++++
>>  .../xscreensaver/files/tweak-app-defaults.patch    | 273 ++++++++++++=
+++++++++
>>  .../xscreensaver/files/xscreensaver.service        |  14 ++
>>  .../xscreensaver/xscreensaver_5.39.bb              |  25 ++
>>  4 files changed, 428 insertions(+)
>>  create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/fix-bu=
ildscripts.patch
>>  create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/tweak-=
app-defaults.patch
>>  create mode 100755 meta-oe/recipes-graphics/xscreensaver/files/xscree=
nsaver.service
>>  create mode 100644 meta-oe/recipes-graphics/xscreensaver/xscreensaver=
_5.39.bb
>=20
> Have you run yocto-check-script to ensure this recipe is not introducin=
g
> anything the Maintainer will have to cleanup later?

secondly, there was comments on the previous patch, have they been
addressed ?

see

https://patchwork.openembedded.org/series/12438/#

> - armin
>>
>> diff --git a/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscri=
pts.patch b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.=
patch
>> new file mode 100644
>> index 000000000..3a50eff83
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.pat=
ch
>> @@ -0,0 +1,116 @@
>> +--- xscreensaver-5.39.orig/configure.in
>> ++++ xscreensaver-5.39/configure.in
>> +@@ -14,6 +14,9 @@
>> + #
>> + ####################################################################=
###########
>> +=20
>> ++includedir=3D''
>> ++libdir=3D''
>> ++
>> + AH_TOP([
>> + /* config.h.in --- xscreensaver, Copyright (c) 1991-2014 Jamie Zawin=
ski.
>> +  *
>> +@@ -422,12 +425,12 @@
>> +=20
>> +   OBJCC=3D"$CC"
>> +=20
>> +-  AC_MSG_CHECKING([whether the compiler works on ANSI C])
>> +-  AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
>> +-     AC_MSG_RESULT(yes),
>> +-     AC_MSG_RESULT(no)
>> +-     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: chec=
k CC.),
>> +-     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: chec=
k CC.))
>> ++#  AC_MSG_CHECKING([whether the compiler works on ANSI C])
>> ++#  AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
>> ++#     AC_MSG_RESULT(yes),
>> ++#     AC_MSG_RESULT(no)
>> ++#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: che=
ck CC.),
>> ++#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: che=
ck CC.))
>> +=20
>> +   if test -n "$GCC"; then
>> +     AC_MSG_RESULT(Turning on gcc compiler warnings.)
>> +--- xscreensaver-5.39.orig/Makefile.in
>> ++++ xscreensaver-5.39/Makefile.in
>> +@@ -6,7 +6,7 @@
>> + VPATH		=3D @srcdir@
>> +=20
>> + SHELL		=3D /bin/sh
>> +-SUBDIRS 	=3D utils jwxyz hacks/images hacks hacks/glx driver po
>> ++SUBDIRS 	=3D utils jwxyz hacks/images hacks driver
>> + SUBDIRS2	=3D $(SUBDIRS) OSX android
>> + TARFILES	=3D README README.hacking README.VMS INSTALL \
>> + 		  configure configure.in Makefile.in config.h.in \
>> +--- xscreensaver-5.39.orig/driver/Makefile.in
>> ++++ xscreensaver-5.39/driver/Makefile.in
>> +@@ -10,7 +10,7 @@
>> + top_srcdir	=3D @top_srcdir@
>> + top_builddir	=3D ..
>> +=20
>> +-install_prefix	=3D
>> ++install_prefix	=3D ${DESTDIR}
>> + prefix		=3D @prefix@
>> + exec_prefix	=3D @exec_prefix@
>> + bindir		=3D @bindir@
>> +@@ -221,7 +221,7 @@
>> + SCRIPTS_1	=3D xscreensaver-getimage-file xscreensaver-getimage-video=
 \
>> + 		  xscreensaver-text
>> + SCRIPTS_OSX	=3D xscreensaver-getimage-desktop
>> +-SCRIPTS		=3D $(SCRIPTS_1) @SCRIPTS_OSX@
>> ++#SCRIPTS		=3D $(SCRIPTS_1) @SCRIPTS_OSX@
>> +=20
>> + HDRS		=3D XScreenSaver_ad.h XScreenSaver_Xm_ad.h \
>> + 		  xscreensaver.h prefs.h remote.h exec.h \
>> +--- xscreensaver-5.39.orig/hacks/Makefile.in
>> ++++ xscreensaver-5.39/hacks/Makefile.in
>> +@@ -10,7 +10,7 @@
>> + top_srcdir	=3D @top_srcdir@
>> + top_builddir	=3D ..
>> +=20
>> +-install_prefix	=3D
>> ++install_prefix	=3D ${DESTDIR}
>> + prefix		=3D @prefix@
>> + exec_prefix	=3D @exec_prefix@
>> + bindir		=3D @bindir@
>> +@@ -122,7 +122,7 @@
>> + 		  asm6502.c abstractile.c lcdscrub.c hexadrop.c \
>> + 		  tessellimage.c delaunay.c recanim.c binaryring.c \
>> + 		  webcollage-cocoa.m webcollage-helper-cocoa.m testx11.c
>> +-SCRIPTS		=3D vidwhacker webcollage ljlatest
>> ++#SCRIPTS		=3D vidwhacker webcollage ljlatest
>> +=20
>> + # Programs that are mentioned in XScreenSaver.ad, and that have XML =
files,
>> + # but that are not shipped with xscreensaver itself.
>> +@@ -163,7 +163,13 @@
>> + 		  lcdscrub.o hexadrop.o tessellimage.o delaunay.o recanim.o \
>> + 		  binaryring.o testx11.o
>> +=20
>> +-EXES		=3D attraction blitspin bouboule braid decayscreen deco \
>> ++EXES		=3D fontglide
>> ++JPEG_EXES	=3D webcollage-helper
>> ++
>> ++RETIRED_EXES	=3D ant bubbles critical flag forest hyperball hypercub=
e laser \
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
>> +-JPEG_EXES	=3D webcollage-helper
>> +-
>> +-RETIRED_EXES	=3D ant bubbles critical flag forest hyperball hypercub=
e laser \
>> +-		  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
>> +-		  whirlygig worm xsublim juggle testx11
>> +=20
>> + HACK_OBJS_1	=3D fps.o $(UTILS_BIN)/resources.o $(UTILS_BIN)/visual.o=
 \
>> + 		  $(UTILS_BIN)/usleep.o $(UTILS_BIN)/yarandom.o \
>> diff --git a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-def=
aults.patch b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defau=
lts.patch
>> new file mode 100644
>> index 000000000..099a0b2f4
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.p=
atch
>> @@ -0,0 +1,273 @@
>> +--- xscreensaver-5.39.orig/driver/XScreenSaver.ad.in
>> ++++ xscreensaver-5.39/driver/XScreenSaver.ad.in
>> +@@ -29,7 +29,7 @@
>> + ! /* (xrdb prevention kludge: whole file)
>> +=20
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
>> + ! This can be a local directory name, or the URL of an RSS or Atom f=
eed.
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
>> ++				gifview --window $XSCREENSAVER_WINDOW /usr/share/logo/bosch-blac=
k.gif			    \n
>> +=20
>> +=20
>> + !=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> diff --git a/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.=
service b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.servic=
e
>> new file mode 100755
>> index 000000000..17dfe75ef
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service=

>> @@ -0,0 +1,14 @@
>> +[Unit]
>> +Description=3DXscreensaver service
>> +PartOf=3Dxserver-nodm.service
>> +After=3Dxserver-nodm.service
>> +
>> +[Service]
>> +ExecStart=3D/usr/bin/xscreensaver
>> +Environment=3D"DISPLAY=3D:0"
>> +User=3Dxuser
>> +Restart=3Dalways
>> +RestartSec=3D1
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.b=
b b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
>> new file mode 100644
>> index 000000000..6b17f9b09
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY =3D "X screen saver and locker"
>> +LICENSE =3D "BSD"
>> +LIC_FILES_CHKSUM =3D "file://driver/xscreensaver.h;endline=3D10;md5=3D=
e141ab5822fb2d43694e1e47b59fc0df"
>> +SRC_URI =3D "https://www.jwz.org/xscreensaver/xscreensaver-${PV}.tar.=
gz"
>> +SRC_URI[md5sum] =3D "a5da62b91271f4e8afcc73d44697364b"
>> +SRC_URI[sha256sum] =3D "48ce1880f18b5321182be0c033aeceb5ec5628a1505b9=
d1ff69dbf06093c2426"
>> +
>> +SRC_URI +=3D " \
>> +	file://xscreensaver.service \
>> +	file://fix-buildscripts.patch \
>> +	file://tweak-app-defaults.patch \
>> +	"
>> +
>> +DEPENDS =3D "intltool-native libx11 libxext libxt libxft glib-2.0-nat=
ive bc-native"
>> +# These are only needed as part of the stopgap screensaver implementa=
tion:
>> +RDEPENDS_${PN} +=3D "xserver-nodm-init gifview liberation-fonts"
>> +
>> +inherit systemd perlnative pkgconfig gettext autotools-brokensep
>> +
>> +do_install_append() {
>> +    install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}=
/system/xscreensaver.service
>> +}
>> +
>> +FILES_${PN} +=3D "${datadir}/X11/app-defaults/XScreenSaver"
>> +SYSTEMD_SERVICE_${PN} =3D "xscreensaver.service"
>=20


--U15z52YIvAI01GkxCzynpHpeWC5wGwUbN--

--89doePrcNLyWnieQY1kkzLKLtbpBZjkrq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW7AafAAKCRC7BTNVkZ0z
FN7KAJ93Aggoai0yrUoWpM/41utq0HOLHgCffr/XjCGTjoPnDv4m2Y3CovTT89Q=
=XzlS
-----END PGP SIGNATURE-----

--89doePrcNLyWnieQY1kkzLKLtbpBZjkrq--
