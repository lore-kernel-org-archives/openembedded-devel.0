Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.7599.1625811875905824373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 23:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WdgkjzR2;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id h1-20020a17090a3d01b0290172d33bb8bcso7680938pjc.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jul 2021 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sHwhq1ceGSYqj3RYmaP4Pw6O7zWgdkjniSKyCFBeYgw=;
        b=WdgkjzR2ZPbLFZm1Npj95iLXTUyJS5AknPY+OQcLfzpeHSCcatynMUv55buqxazSWP
         8vVa/4yTVEV4HnSjxN4I4YUP71ImxVv7BHFsIZMe/TnplEJOW1Z0bvlRi/TiGDjI5ZDx
         NcNnvDZcSjur4MRJvgdZuaKn2vDkCzOwfS6AAWD49WsZeGNCRnG5sYN/gN4hR6nQ2nIs
         c1VG2jQi6xUCk8lPxWt7AHQR2Lx+yeEJyp529FhHJpoeQRv8qC0AKM7MFDrXv8kmt1iX
         u2mcMZR64fuaqZC2g3gRIj4kCpOFq2uwD/l3xrK4891Q4oW9A2O4i3cXisK6UiJo/vBA
         50yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sHwhq1ceGSYqj3RYmaP4Pw6O7zWgdkjniSKyCFBeYgw=;
        b=q+JPerrTLab7dv2+NC3np21omlbrgCAS/sqdt3lkn0Kkot0GCpXLiqsWJ2ipP2Rfcg
         j8aCEEzzlsWRd2gEdFWncvCohiA94/asigdlCvFn1vtR06SIoMPoXrM484j0IEZ3BBcC
         EkBd4XYv8VFNVpAMZjk2Dl51BhUjXFB4Krho/zFoCoOaq/8rF0nQ4XN10DW+lWSnVw7U
         jNAbWvdEWT6SDdWqmKAoR7LkN1d2Uq+gnKtlmivgWponeQ/OU/HSb9YOXQwaKl/8p6ka
         Zw4vVVya4yYHFe+yVulKmfb8Ag/dBNjPZu8arcYed267JjLAmErMcjNX61Zavivcrn/z
         ka9g==
X-Gm-Message-State: AOAM5332z4peiJ5uUAwu8ABGGwLB3i2t5BH37dw25tnLcu1hcb4P4QH2
	9cGWoyVZ++iHfQhI6SH+raEcgZGKBH7lOg==
X-Google-Smtp-Source: ABdhPJxJYp/Zp4eDK/zVUecln8nF0JNpN457tmFmvw4asl53Pjurgp+rCeQWissQG2Yw58+m00os3w==
X-Received: by 2002:a17:90a:a27:: with SMTP id o36mr9242766pjo.32.1625811875082;
        Thu, 08 Jul 2021 23:24:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id j3sm665018pfc.10.2021.07.08.23.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 23:24:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xscreensaver: Update to 6.01
Date: Thu,  8 Jul 2021 23:24:32 -0700
Message-Id: <20210709062432.3058221-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop fix-buildscripts.patch and move the required changes into recipe
Refresh tweak-app-defaults.patch to apply on latest release
Do not build po files as they are not buildable and are not used in
cross builds as much

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-build-Do-not-build-po-files.patch    |  44 ++++++++
 .../xscreensaver/files/fix-buildscripts.patch | 100 ------------------
 .../files/tweak-app-defaults.patch            |  18 ++--
 .../xscreensaver/xscreensaver_5.44.bb         |  36 -------
 .../xscreensaver/xscreensaver_6.01.bb         |  53 ++++++++++
 5 files changed, 108 insertions(+), 143 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch
 delete mode 100644 meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
 delete mode 100644 meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb
 create mode 100644 meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb

diff --git a/meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch b/meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch
new file mode 100644
index 0000000000..7703a43204
--- /dev/null
+++ b/meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch
@@ -0,0 +1,44 @@
+From 19bd0a979677a81d7399d5b567998398ec81f38b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 8 Jul 2021 15:40:10 -0700
+Subject: [PATCH] build: Do not build po files
+
+Fixes
+| make[1]: Entering directory '/mnt/b/yoe/master/build/tmp/work/cortexa57-yoe-linux/xscreensaver/6.01-r0/xscreensaver-6.01/po'
+| make[1]: *** No rule to make target 'default'.  Stop.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -6,8 +6,8 @@ srcdir		= @srcdir@
+ VPATH		= @srcdir@
+
+ SHELL		= /bin/sh
+-SUBDIRS 	= utils jwxyz hacks/images hacks hacks/glx hacks/fonts \
+-		  driver po
++SUBDIRS 	= utils jwxyz hacks/images hacks hacks/fonts \
++		  driver
+ SUBDIRS2	= $(SUBDIRS) OSX android
+ TARFILES	= README README.hacking INSTALL \
+ 		  configure configure.ac Makefile.in config.h.in \
+@@ -451,4 +451,3 @@ cerebrum::
+ 	--include 'configure*' \
+ 	--include '*/' \
+ 	--exclude '*'
+-
+--- a/driver/Makefile.in
++++ b/driver/Makefile.in
+@@ -212,7 +212,7 @@ TEST_EXES	= test-passwd   test-uid
+ 		  xdpyinfo      test-screens    test-yarandom   test-xinput   \
+ 	          test-xkb
+
+-EXES		= xscreensaver xscreensaver-command xscreensaver-settings
++EXES		= xscreensaver xscreensaver-command
+ UTIL_EXES	= xscreensaver-gfx @EXES_SYSTEMD@
+ SETUID_EXES	= xscreensaver-auth
+ DEMO_EXES	= @ALL_DEMO_PROGRAMS@
diff --git a/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch b/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
deleted file mode 100644
index afc8bc8e74..0000000000
--- a/meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
+++ /dev/null
@@ -1,100 +0,0 @@
---- xscreensaver-5.44.orig/configure.in	2020-06-16 12:49:55.384675395 +0000
-+++ xscreensaver-5.44/configure.in	2020-06-16 12:51:49.451826729 +0000
-@@ -14,6 +14,9 @@
- #
- ###############################################################################
-
-+includedir=''
-+libdir=''
-+
- AH_TOP([
- /* config.h.in --- xscreensaver, Copyright (c) 1991-2014 Jamie Zawinski.
-  *
-diff -Naur xscreensaver-5.44.orig/driver/Makefile.in xscreensaver-5.44/driver/Makefile.in
---- xscreensaver-5.44.orig/driver/Makefile.in	2020-06-16 12:49:55.388675365 +0000
-+++ xscreensaver-5.44/driver/Makefile.in	2020-06-16 12:53:36.331038333 +0000
-@@ -10,7 +10,7 @@
- top_srcdir	= @top_srcdir@
- top_builddir	= ..
-
--install_prefix	=
-+install_prefix	= ${DESTDIR}
- prefix		= @prefix@
- exec_prefix	= @exec_prefix@
- bindir		= @bindir@
-@@ -228,7 +228,7 @@
- SCRIPTS_1	= xscreensaver-getimage-file xscreensaver-getimage-video \
- 		  xscreensaver-text
- SCRIPTS_OSX	= xscreensaver-getimage-desktop
--SCRIPTS		= $(SCRIPTS_1) @SCRIPTS_OSX@
-+#SCRIPTS		= $(SCRIPTS_1) @SCRIPTS_OSX@
-
- HDRS		= XScreenSaver_ad.h XScreenSaver_Xm_ad.h \
- 		  xscreensaver.h prefs.h remote.h exec.h \
-diff -Naur xscreensaver-5.44.orig/hacks/Makefile.in xscreensaver-5.44/hacks/Makefile.in
---- xscreensaver-5.44.orig/hacks/Makefile.in	2020-06-16 12:49:55.532674285 +0000
-+++ xscreensaver-5.44/hacks/Makefile.in	2020-06-16 12:58:54.364719996 +0000
-@@ -10,7 +10,7 @@
- top_srcdir	= @top_srcdir@
- top_builddir	= ..
-
--install_prefix	=
-+install_prefix	= ${DESTDIR}
- prefix		= @prefix@
- exec_prefix	= @exec_prefix@
- bindir		= @bindir@
-@@ -124,7 +124,7 @@
- 		  tessellimage.c delaunay.c recanim.c binaryring.c \
- 		  glitchpeg.c vfeedback.c scooter.c webcollage-cocoa.m \
- 		  webcollage-helper-cocoa.m testx11.c
--SCRIPTS		= vidwhacker webcollage ljlatest
-+#SCRIPTS		= vidwhacker webcollage ljlatest
-
- # Programs that are mentioned in XScreenSaver.ad, and that have XML files,
- # but that are not shipped with xscreensaver itself.
-@@ -166,7 +166,13 @@
- 		  tessellimage.o delaunay.o recanim.o binaryring.o \
- 		  glitchpeg.o vfeedback.o scooter.o testx11.o
-
--EXES		= attraction blitspin bouboule braid decayscreen deco \
-+EXES           = fontglide
-+JPEG_EXES      = webcollage-helper
-+
-+RETIRED_EXES   =  ant bubbles critical flag forest hyperball hypercube laser \
-+                  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
-+                  whirlygig worm xsublim juggle testx11 \
-+                  attraction blitspin bouboule braid decayscreen deco \
- 		  drift flame galaxy grav greynetic halo \
- 		  helix hopalong ifs imsmap julia kaleidescope \
- 		  maze moire noseguy pedal \
-@@ -182,17 +188,12 @@
- 		  speedmine vermiculate twang apollonian euler2d \
- 		  polyominoes thornbird  fluidballs anemone halftone \
- 		  metaballs eruption popsquares barcode piecewise cloudlife \
--		  fontglide apple2 xanalogtv pong filmleader wormhole \
-+		  apple2 xanalogtv pong filmleader wormhole \
- 		  pacman fuzzyflakes anemotaxis memscroller substrate \
- 		  intermomentary fireworkx fiberlamp boxfit interaggregate \
- 		  celtic cwaves m6502 abstractile lcdscrub hexadrop \
- 		  tessellimage binaryring glitchpeg vfeedback scooter \
- 		  @JPEG_EXES@
--JPEG_EXES	= webcollage-helper
--
--RETIRED_EXES	= ant bubbles critical flag forest hyperball hypercube laser \
--		  lightning lisa lissie lmorph rotor sphere spiral t3d vines \
--		  whirlygig worm xsublim juggle testx11
-
- HACK_OBJS_1	= fps.o $(UTILS_BIN)/resources.o $(UTILS_BIN)/visual.o \
- 		  $(UTILS_BIN)/usleep.o $(UTILS_BIN)/yarandom.o \
-diff -Naur xscreensaver-5.44.orig/Makefile.in xscreensaver-5.44/Makefile.in
---- xscreensaver-5.44.orig/Makefile.in	2020-06-16 12:49:55.384675395 +0000
-+++ xscreensaver-5.44/Makefile.in	2020-06-16 12:52:49.395383836 +0000
-@@ -6,7 +6,7 @@
- VPATH		= @srcdir@
-
- SHELL		= /bin/sh
--SUBDIRS 	= utils jwxyz hacks/images hacks hacks/glx driver po
-+SUBDIRS         = utils jwxyz hacks/images hacks driver
- SUBDIRS2	= $(SUBDIRS) OSX android
- TARFILES	= README README.hacking README.VMS INSTALL \
- 		  configure configure.in Makefile.in config.h.in \
diff --git a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
index 0f2e09aec7..4ce2faed5d 100644
--- a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
+++ b/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
@@ -1,5 +1,5 @@
---- xscreensaver-5.44.orig/driver/XScreenSaver.ad.in	2020-06-16 13:13:14.950970569 +0000
-+++ xscreensaver-5.44/driver/XScreenSaver.ad.in	2020-06-16 13:19:35.777000937 +0000
+--- a/driver/XScreenSaver.ad.in
++++ b/driver/XScreenSaver.ad.in
 @@ -29,7 +29,7 @@
  ! /* (xrdb prevention kludge: whole file)

@@ -18,13 +18,13 @@
  *grabVideoFrames:	False
  *chooseRandomImages:	@DEFAULT_IMAGES_P@
  ! This can be a local directory name, or the URL of an RSS or Atom feed.
-@@ -48,11 +48,11 @@
+@@ -47,11 +47,11 @@
+ *memoryLimit:		0
  *lock:			False
  *verbose:		False
- *timestamp:		True
 -*fade:			True
 +*fade:			False
- *unfade:		False
+ *unfade:		True
  *fadeSeconds:		0:00:03
  *fadeTicks:		20
 -*splash:		True
@@ -32,7 +32,7 @@
  *splashDuration:	0:00:05
  *visualID:		default
  *installColormap:	True
-@@ -343,246 +343,8 @@
+@@ -324,250 +324,8 @@ XScreenSaver.bourneShell:		/bin/sh
  !=============================================================================

  *programs:								      \
@@ -272,8 +272,12 @@
 -				vfeedback -root				    \n\
 -@GL_KLUDGE@ GL: 				deepstars -root				    \n\
 -@GL_KLUDGE@ GL: 				gravitywell -root			    \n\
+-@GL_KLUDGE@ GL: 				beats -root				    \n\
+-@GL_KLUDGE@ GL: 				covid19 -root				    \n\
 -@GL_KLUDGE@ GL: 				etruscanvenus -root			    \n\
--@GL_KLUDGE@ GL: 				gibson -root				    \n
+-@GL_KLUDGE@ GL: 				gibson -root				    \n\
+-@GL_KLUDGE@ GL: 				headroom -root				    \n\
+-@GL_KLUDGE@ GL: 				sphereeversion -root			    \n
 -
 -
 +-				fontglide -root -program "date +'%F %H:%M %z'"
diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb
deleted file mode 100644
index 9131c754d5..0000000000
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "X screen saver and locker"
-HOMEPAGE = "https://www.jwz.org/xscreensaver/"
-LICENSE = "BSD-0-Clause"
-LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=2b97002f72fbfc9329b4336e798f2463"
-
-SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "9f764e561f9939f8684a66ec98b27cba"
-SRC_URI[sha256sum] = "73d8089cfc7d7363b5dac99b5b01dffb3429d0a855e6af16ce9a4b7777017b95"
-
-SRC_URI += " \
-    file://xscreensaver.service \
-    file://fix-buildscripts.patch \
-    file://tweak-app-defaults.patch \
-"
-
-DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native"
-# These are only needed as part of the stopgap screensaver implementation:
-RDEPENDS_${PN} = " \
-    liberation-fonts \
-    xuser-account \
-"
-
-inherit systemd perlnative pkgconfig gettext autotools-brokensep features_check
-
-EXTRA_OECONF += "--with-x-app-defaults=${datadir}/X11/app-defaults"
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-do_install_append() {
-    install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
-}
-
-FILES_${PN} += "${datadir}/X11/app-defaults/XScreenSaver"
-SYSTEMD_SERVICE_${PN} = "xscreensaver.service"
-
-CLEANBROKEN = "1"
diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb
new file mode 100644
index 0000000000..d67e05844f
--- /dev/null
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb
@@ -0,0 +1,53 @@
+SUMMARY = "X screen saver and locker"
+HOMEPAGE = "https://www.jwz.org/xscreensaver/"
+LICENSE = "BSD-0-Clause"
+LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=c3ce41cdff745eb1dc9d4fcfbffb4d51"
+
+SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "085484665d91f60b4a1dedacd94bcf9b74b0fb096bcedc89ff1c245168e5473b"
+
+SRC_URI += " \
+    file://xscreensaver.service \
+    file://0001-build-Do-not-build-po-files.patch \
+    file://tweak-app-defaults.patch \
+"
+
+DEPENDS = "intltool-native libx11 libxext libxt libxft libxi glib-2.0-native bc-native libpam"
+# These are only needed as part of the stopgap screensaver implementation:
+RDEPENDS_${PN} = " \
+    liberation-fonts \
+    xuser-account \
+"
+
+inherit systemd perlnative pkgconfig gettext autotools-brokensep features_check
+
+
+EXTRA_OECONF += "--with-app-defaults=${datadir}/X11/app-defaults --libdir=${STAGING_LIBDIR} \
+                 --includedir=${STAGING_INCDIR} --with-pam --with-login-manager"
+
+EXTRA_OEMAKE += "install_prefix=${D}"
+REQUIRED_DISTRO_FEATURES = "x11 pam"
+
+do_install_append() {
+    install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
+    for f in xscreensaver-getimage-file xscreensaver-getimage-video webcollage xscreensaver-text vidwhacker
+    do
+        sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native/perl|/usr/bin/perl|g" ${D}/${libexecdir}/${PN}/$f
+    done
+}
+
+PACKAGES =+ "${PN}-perl"
+
+FILES_${PN}-perl = "\
+    ${libexecdir}/${PN}/xscreensaver-getimage-file \
+    ${libexecdir}/${PN}/xscreensaver-getimage-video \
+    ${libexecdir}/${PN}/webcollage \
+    ${libexecdir}/${PN}/xscreensaver-text \
+    ${libexecdir}/${PN}/vidwhacker \
+    "
+FILES_${PN} += "${datadir}/X11/app-defaults/XScreenSaver ${datadir}/fonts"
+SYSTEMD_SERVICE_${PN} = "xscreensaver.service"
+
+RDEPENDS_${PN}-perl = "perl"
+
+CLEANBROKEN = "1"
--
2.32.0
