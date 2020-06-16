Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.21.1592321061867495970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 08:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45234 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jlDRi-0005Wg-4Y; Tue, 16 Jun 2020 18:24:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] xscreensaver: Upgrade 5.39 -> 5.44
Date: Tue, 16 Jun 2020 18:24:12 +0300
Message-Id: <20200616152412.3250-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=0.6
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 5.44. Rebase patches for fixing build scripts
and app defaults. Change the license checksum due to update of the
year. Add xuser-account as a run-time dependency because the
systemd service runs as xuser and fails if such user doesn't
exist. The new release brings:

- New hacks, `gibson', `etruscanvenus' and `scooter'.
- New color options in `romanboy', `projectiveplane', `hypertorus'
  and `klein'.
- X11: Always use $HOME/.xscreensaver, not getpwuid's directory.
- Various bug fixes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../xscreensaver/files/fix-buildscripts.patch | 90 ++++++++-----------
 .../files/tweak-app-defaults.patch            | 30 ++++---
 ...reensaver_5.39.bb => xscreensaver_5.44.bb} | 11 ++-
 3 files changed, 64 insertions(+), 67 deletions(-)
 rename meta-oe/recipes-graphics/xscreensaver/{xscreensaver_5.39.bb => xscreensaver_5.44.bb} (78%)

diff --git a/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
index 3a50eff83..afc8bc8e7 100644
--- a/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
+++ b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
@@ -1,5 +1,5 @@
---- xscreensaver-5.39.orig/configure.in
-+++ xscreensaver-5.39/configure.in
+--- xscreensaver-5.44.orig/configure.in	2020-06-16 12:49:55.384675395 +0000
++++ xscreensaver-5.44/configure.in	2020-06-16 12:51:49.451826729 +0000
 @@ -14,6 +14,9 @@
  #
  ###############################################################################
@@ -10,38 +10,9 @@
  AH_TOP([
  /* config.h.in --- xscreensaver, Copyright (c) 1991-2014 Jamie Zawinski.
   *
-@@ -422,12 +425,12 @@
- 
-   OBJCC="$CC"
- 
--  AC_MSG_CHECKING([whether the compiler works on ANSI C])
--  AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
--     AC_MSG_RESULT(yes),
--     AC_MSG_RESULT(no)
--     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.),
--     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.))
-+#  AC_MSG_CHECKING([whether the compiler works on ANSI C])
-+#  AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
-+#     AC_MSG_RESULT(yes),
-+#     AC_MSG_RESULT(no)
-+#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.),
-+#     AC_MSG_ERROR(Couldn't build even a trivial ANSI C program: check CC.))
- 
-   if test -n "$GCC"; then
-     AC_MSG_RESULT(Turning on gcc compiler warnings.)
---- xscreensaver-5.39.orig/Makefile.in
-+++ xscreensaver-5.39/Makefile.in
-@@ -6,7 +6,7 @@
- VPATH		= @srcdir@
- 
- SHELL		= /bin/sh
--SUBDIRS 	= utils jwxyz hacks/images hacks hacks/glx driver po
-+SUBDIRS 	= utils jwxyz hacks/images hacks driver
- SUBDIRS2	= $(SUBDIRS) OSX android
- TARFILES	= README README.hacking README.VMS INSTALL \
- 		  configure configure.in Makefile.in config.h.in \
---- xscreensaver-5.39.orig/driver/Makefile.in
-+++ xscreensaver-5.39/driver/Makefile.in
+diff -Naur xscreensaver-5.44.orig/driver/Makefile.in xscreensaver-5.44/driver/Makefile.in
+--- xscreensaver-5.44.orig/driver/Makefile.in	2020-06-16 12:49:55.388675365 +0000
++++ xscreensaver-5.44/driver/Makefile.in	2020-06-16 12:53:36.331038333 +0000
 @@ -10,7 +10,7 @@
  top_srcdir	= @top_srcdir@
  top_builddir	= ..
@@ -51,7 +22,7 @@
  prefix		= @prefix@
  exec_prefix	= @exec_prefix@
  bindir		= @bindir@
-@@ -221,7 +221,7 @@
+@@ -228,7 +228,7 @@
  SCRIPTS_1	= xscreensaver-getimage-file xscreensaver-getimage-video \
  		  xscreensaver-text
  SCRIPTS_OSX	= xscreensaver-getimage-desktop
@@ -60,8 +31,9 @@
  
  HDRS		= XScreenSaver_ad.h XScreenSaver_Xm_ad.h \
  		  xscreensaver.h prefs.h remote.h exec.h \
---- xscreensaver-5.39.orig/hacks/Makefile.in
-+++ xscreensaver-5.39/hacks/Makefile.in
+diff -Naur xscreensaver-5.44.orig/hacks/Makefile.in xscreensaver-5.44/hacks/Makefile.in
+--- xscreensaver-5.44.orig/hacks/Makefile.in	2020-06-16 12:49:55.532674285 +0000
++++ xscreensaver-5.44/hacks/Makefile.in	2020-06-16 12:58:54.364719996 +0000
 @@ -10,7 +10,7 @@
  top_srcdir	= @top_srcdir@
  top_builddir	= ..
@@ -71,40 +43,40 @@
  prefix		= @prefix@
  exec_prefix	= @exec_prefix@
  bindir		= @bindir@
-@@ -122,7 +122,7 @@
- 		  asm6502.c abstractile.c lcdscrub.c hexadrop.c \
+@@ -124,7 +124,7 @@
  		  tessellimage.c delaunay.c recanim.c binaryring.c \
- 		  webcollage-cocoa.m webcollage-helper-cocoa.m testx11.c
+ 		  glitchpeg.c vfeedback.c scooter.c webcollage-cocoa.m \
+ 		  webcollage-helper-cocoa.m testx11.c
 -SCRIPTS		= vidwhacker webcollage ljlatest
 +#SCRIPTS		= vidwhacker webcollage ljlatest
  
  # Programs that are mentioned in XScreenSaver.ad, and that have XML files,
  # but that are not shipped with xscreensaver itself.
-@@ -163,7 +163,13 @@
- 		  lcdscrub.o hexadrop.o tessellimage.o delaunay.o recanim.o \
- 		  binaryring.o testx11.o
+@@ -166,7 +166,13 @@
+ 		  tessellimage.o delaunay.o recanim.o binaryring.o \
+ 		  glitchpeg.o vfeedback.o scooter.o testx11.o
  
 -EXES		= attraction blitspin bouboule braid decayscreen deco \
-+EXES		= fontglide
-+JPEG_EXES	= webcollage-helper
++EXES           = fontglide
++JPEG_EXES      = webcollage-helper
 +
-+RETIRED_EXES	= ant bubbles critical flag forest hyperball hypercube laser \
-+		  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
-+		  whirlygig worm xsublim juggle testx11 \
-+		  attraction blitspin bouboule braid decayscreen deco \
++RETIRED_EXES   =  ant bubbles critical flag forest hyperball hypercube laser \
++                  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
++                  whirlygig worm xsublim juggle testx11 \
++                  attraction blitspin bouboule braid decayscreen deco \
  		  drift flame galaxy grav greynetic halo \
  		  helix hopalong ifs imsmap julia kaleidescope \
  		  maze moire noseguy pedal \
-@@ -179,17 +185,12 @@
+@@ -182,17 +188,12 @@
  		  speedmine vermiculate twang apollonian euler2d \
  		  polyominoes thornbird  fluidballs anemone halftone \
  		  metaballs eruption popsquares barcode piecewise cloudlife \
--		  fontglide apple2 xanalogtv pong  wormhole \
-+		  apple2 xanalogtv pong  wormhole \
+-		  fontglide apple2 xanalogtv pong filmleader wormhole \
++		  apple2 xanalogtv pong filmleader wormhole \
  		  pacman fuzzyflakes anemotaxis memscroller substrate \
  		  intermomentary fireworkx fiberlamp boxfit interaggregate \
  		  celtic cwaves m6502 abstractile lcdscrub hexadrop \
- 		  tessellimage binaryring \
+ 		  tessellimage binaryring glitchpeg vfeedback scooter \
  		  @JPEG_EXES@
 -JPEG_EXES	= webcollage-helper
 -
@@ -114,3 +86,15 @@
  
  HACK_OBJS_1	= fps.o $(UTILS_BIN)/resources.o $(UTILS_BIN)/visual.o \
  		  $(UTILS_BIN)/usleep.o $(UTILS_BIN)/yarandom.o \
+diff -Naur xscreensaver-5.44.orig/Makefile.in xscreensaver-5.44/Makefile.in
+--- xscreensaver-5.44.orig/Makefile.in	2020-06-16 12:49:55.384675395 +0000
++++ xscreensaver-5.44/Makefile.in	2020-06-16 12:52:49.395383836 +0000
+@@ -6,7 +6,7 @@
+ VPATH		= @srcdir@
+ 
+ SHELL		= /bin/sh
+-SUBDIRS 	= utils jwxyz hacks/images hacks hacks/glx driver po
++SUBDIRS         = utils jwxyz hacks/images hacks driver
+ SUBDIRS2	= $(SUBDIRS) OSX android
+ TARFILES	= README README.hacking README.VMS INSTALL \
+ 		  configure configure.in Makefile.in config.h.in \
diff --git a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
index 099a0b2f4..0f2e09aec 100644
--- a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
+++ b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
@@ -1,5 +1,5 @@
---- xscreensaver-5.39.orig/driver/XScreenSaver.ad.in
-+++ xscreensaver-5.39/driver/XScreenSaver.ad.in
+--- xscreensaver-5.44.orig/driver/XScreenSaver.ad.in	2020-06-16 13:13:14.950970569 +0000
++++ xscreensaver-5.44/driver/XScreenSaver.ad.in	2020-06-16 13:19:35.777000937 +0000
 @@ -29,7 +29,7 @@
  ! /* (xrdb prevention kludge: whole file)
  
@@ -31,10 +31,10 @@
 +*splash:		False
  *splashDuration:	0:00:05
  *visualID:		default
- *captureStderr: 	True
-@@ -158,236 +158,8 @@
- ! screen savers interactively.
- !
+ *installColormap:	True
+@@ -343,246 +343,8 @@
+ !=============================================================================
+ 
  *programs:								      \
 -				maze -root				    \n\
 -@GL_KLUDGE@ GL: 				superquadrics -root			    \n\
@@ -138,6 +138,7 @@
 -@GL_KLUDGE@ GL: 				menger -root				    \n\
 -@GL_KLUDGE@ GL: 				molecule -root				    \n\
 -				rotzoomer -root				    \n\
+-				scooter -root				    \n\
 -				speedmine -root				    \n\
 -@GL_KLUDGE@ GL: 				starwars -root				    \n\
 -@GL_KLUDGE@ GL: 				stonerview -root			    \n\
@@ -262,12 +263,21 @@
 -@GL_KLUDGE@ GL: 				esper -root				    \n\
 -@GL_KLUDGE@ GL: 				vigilance -root				    \n\
 -@GL_KLUDGE@ GL: 				crumbler -root				    \n\
+-				filmleader -root			    \n\
+-				glitchpeg -root				    \n\
+-@GL_KLUDGE@ GL: 				handsy -root				    \n\
 -@GL_KLUDGE@ GL: 				maze3d -root				    \n\
 -@GL_KLUDGE@ GL: 				peepers -root				    \n\
--@GL_KLUDGE@ GL: 				razzledazzle -root			    \n
+-@GL_KLUDGE@ GL: 				razzledazzle -root			    \n\
+-				vfeedback -root				    \n\
+-@GL_KLUDGE@ GL: 				deepstars -root				    \n\
+-@GL_KLUDGE@ GL: 				gravitywell -root			    \n\
+-@GL_KLUDGE@ GL: 				etruscanvenus -root			    \n\
+-@GL_KLUDGE@ GL: 				gibson -root				    \n
 -
-+-				fontglide -root -program "date +'%F %H:%M %z'"				    \n\
-+				gifview --window $XSCREENSAVER_WINDOW /usr/share/logo/bosch-black.gif			    \n
- 
+-
++-				fontglide -root -program "date +'%F %H:%M %z'"
++				gifview --window $XSCREENSAVER_WINDOW /usr/share/logo/bosch-black.gif
  
  !=============================================================================
+ !
diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb
similarity index 78%
rename from meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
rename to meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb
index b8c1881d9..6cad97f15 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb
@@ -1,11 +1,11 @@
 SUMMARY = "X screen saver and locker"
 
 LICENSE = "BSD-0-Clause"
-LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=e141ab5822fb2d43694e1e47b59fc0df"
+LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=2b97002f72fbfc9329b4336e798f2463"
 
 SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "a5da62b91271f4e8afcc73d44697364b"
-SRC_URI[sha256sum] = "48ce1880f18b5321182be0c033aeceb5ec5628a1505b9d1ff69dbf06093c2426"
+SRC_URI[md5sum] = "9f764e561f9939f8684a66ec98b27cba"
+SRC_URI[sha256sum] = "73d8089cfc7d7363b5dac99b5b01dffb3429d0a855e6af16ce9a4b7777017b95"
 
 SRC_URI += " \
     file://xscreensaver.service \
@@ -15,7 +15,10 @@ SRC_URI += " \
 
 DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native"
 # These are only needed as part of the stopgap screensaver implementation:
-RDEPENDS_${PN} += "liberation-fonts"
+RDEPENDS_${PN} = " \
+    liberation-fonts \
+    xuser-account \
+"
 
 inherit systemd perlnative pkgconfig gettext autotools-brokensep features_check
 
-- 
2.17.1

