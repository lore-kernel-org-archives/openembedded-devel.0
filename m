Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45C5C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 17:25:06 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.18061.1658078700337886517
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 10:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IpcJJD9o;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id l124so8811911pfl.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 10:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Mde324aHsJ8Pi8RhS5nXrJXy+Y4wkKlvBdnlub0rSc=;
        b=IpcJJD9of03eW3RU64s9bXZ5C/Z8qkYslgw4wjQAb6vSWY3V0X2gJkSUj75EcXHva2
         9yIjM47bL7p1/hevjHGgxLdpeD6aoM1OOKXwVzRVQ5DWh1NcagkVns3BcLDPxnNLwbav
         +4prCd+4Yz4Wu80KPPxxyVeFGrZJbD3q1twIEgzP2oLCmglxVqfVxgQ3OVph8rAYofqD
         ZBQxE9vDiVYrBKSkXexeN3wCgm7A5H+sHws/orxNIwfCCNljIk3ncWlFvnSvh2lZwatO
         uD+wEMa7MxYWcU9rzSn2aaxw3mVbukriPcEdO2Uo1k7EL4P0SDs6ciPyizC3YQILnLYT
         3zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Mde324aHsJ8Pi8RhS5nXrJXy+Y4wkKlvBdnlub0rSc=;
        b=EfYNmADlvN/L8Z8lHflVp43WFxbIz3kj9+7WVBMKaqo6T5g6qMwRZWOdVSeKIZ/EW/
         RQPk+tFSThxFiLqkKWCk1I5w2bdUVItWMWpIWhO1GsINlGDp9tnxBejVFeoVpbBnzRNe
         NZuodpjtMfyT/zVH8zp/Yr1UENP08TAGrWYSMZLEoOO9IqwXOQMaRBJcsuP2BGR7I4mC
         20c4+aTsysfWs6M+fqvflhcIRwOp2ex5gdakuIkX13kcOBPujBP2+JAKTv/vD2QFXqSG
         yN7E4ikBWjToXn1W5dHDk+Q3e8+pJDNpgi6iPFM8wQeir+sTnQai5/t1D3vq+P+ebJDa
         JAIw==
X-Gm-Message-State: AJIora8OxI29jUQROsBiGdHx9oFMXiU6+slamgsgjnymTPRmW57ke5yk
	D7T9hsLVT+wTs1Wyd8OEOeq0Ycx5sjNlLw==
X-Google-Smtp-Source: 
 AGRyM1twJgtU7gFg+y6iqUwbPkK3vhyIKwVoSmvYbz+Z4mqaKW38LRFcd5RBPOkoWg5iwtezp/Ys6Q==
X-Received: by 2002:a05:6a00:815:b0:52a:dea8:269b with SMTP id
 m21-20020a056a00081500b0052adea8269bmr24500652pfk.66.1658078699308;
        Sun, 17 Jul 2022 10:24:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 c14-20020a170903234e00b0016c0593876csm7531139plh.157.2022.07.17.10.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 10:24:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] xscreensaver: Upgrade to 6.04
Date: Sun, 17 Jul 2022 10:24:56 -0700
Message-Id: <20220717172456.779121-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Jul 2022 17:25:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97859

Forward port patches as needed.
Add a patch to ignore stringent errors dues to configure warning

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ts.patch => 0001-Tweak-app-defaults.patch} | 23 +++++++--
 ...-CONF_STATUS-for-gtk-and-openGL-need.patch | 47 +++++++++++++++++++
 ...=> 0002-build-Do-not-build-po-files.patch} | 25 ++++++----
 ...reensaver_6.01.bb => xscreensaver_6.04.bb} | 23 +++++----
 4 files changed, 99 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-graphics/xscreensaver/files/{tweak-app-defaults.patch => 0001-Tweak-app-defaults.patch} (92%)
 create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/0001-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch
 rename meta-oe/recipes-graphics/xscreensaver/files/{0001-build-Do-not-build-po-files.patch => 0002-build-Do-not-build-po-files.patch} (65%)
 rename meta-oe/recipes-graphics/xscreensaver/{xscreensaver_6.01.bb => xscreensaver_6.04.bb} (66%)

diff --git a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch b/meta-oe/recipes-graphics/xscreensaver/files/0001-Tweak-app-defaults.patch
similarity index 92%
rename from meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
rename to meta-oe/recipes-graphics/xscreensaver/files/0001-Tweak-app-defaults.patch
index 4ce2faed5d..1d0d20da2f 100644
--- a/meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
+++ b/meta-oe/recipes-graphics/xscreensaver/files/0001-Tweak-app-defaults.patch
@@ -1,3 +1,14 @@
+From f2c592352360e52a7c817a1adcc8b09fd92cd941 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 16 Jul 2022 09:58:24 -0700
+Subject: [PATCH 1/2] Tweak app defaults
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ driver/XScreenSaver.ad.in | 259 +-------------------------------------
+ 1 file changed, 6 insertions(+), 253 deletions(-)
+
 --- a/driver/XScreenSaver.ad.in
 +++ b/driver/XScreenSaver.ad.in
 @@ -29,7 +29,7 @@
@@ -32,7 +43,7 @@
  *splashDuration:	0:00:05
  *visualID:		default
  *installColormap:	True
-@@ -324,250 +324,8 @@ XScreenSaver.bourneShell:		/bin/sh
+@@ -324,256 +324,8 @@ XScreenSaver.bourneShell:		/bin/sh
  !=============================================================================
  
  *programs:								      \
@@ -74,7 +85,7 @@
 -				munch -root				    \n\
 -				penrose -root				    \n\
 -@GL_KLUDGE@ GL: 				pipes -root				    \n\
--				rd-bomb -root				    \n\
+-				rdbomb -root				    \n\
 -@GL_KLUDGE@ GL: 				rubik -root				    \n\
 --				sierpinski -root			    \n\
 -				slip -root				    \n\
@@ -277,7 +288,13 @@
 -@GL_KLUDGE@ GL: 				etruscanvenus -root			    \n\
 -@GL_KLUDGE@ GL: 				gibson -root				    \n\
 -@GL_KLUDGE@ GL: 				headroom -root				    \n\
--@GL_KLUDGE@ GL: 				sphereeversion -root			    \n
+-@GL_KLUDGE@ GL: 				sphereeversion -root			    \n\
+-				binaryhorizon -root			    \n\
+-				marbling -root				    \n\
+-@GL_KLUDGE@ GL: 				chompytower -root			    \n\
+-@GL_KLUDGE@ GL: 				mapscroller -root			    \n\
+-@GL_KLUDGE@ GL: 				nakagin -root				    \n\
+-@GL_KLUDGE@ GL: 				squirtorus -root			    \n
 -
 -
 +-				fontglide -root -program "date +'%F %H:%M %z'"
diff --git a/meta-oe/recipes-graphics/xscreensaver/files/0001-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch b/meta-oe/recipes-graphics/xscreensaver/files/0001-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch
new file mode 100644
index 0000000000..ea3f25a2f2
--- /dev/null
+++ b/meta-oe/recipes-graphics/xscreensaver/files/0001-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch
@@ -0,0 +1,47 @@
+From 516fbcdcfe6343b1d64d35957ddb768346713ff6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 17 Jul 2022 09:47:35 -0700
+Subject: [PATCH] configure: Ignore CONF_STATUS for gtk and openGL needs
+
+These are just warnings
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c4fd38f..d7463cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4522,7 +4522,6 @@ fi
+ if test "$gtk_halfassed" != no ; then
+   warnL "GTK was found, but $gtk_halfassed_lib was not, so GTK"
+   warn2 "can't be used."
+-  CONF_STATUS=1
+ 
+   if ( echo $gtk_halfassed_lib | grep -qi pixbuf-xlib ); then
+     echo ''
+@@ -4549,7 +4548,6 @@ if test "$have_motif" = no -a "$have_gtk" = no; then
+   else
+     warnL "The GTK libraries do not seem to be available; the"
+     warn2 "\`xscreensaver-settings' program requires them."
+-    CONF_STATUS=1
+ #   echo ''
+ #   warn2 'You can use Motif or Lesstif instead of GTK (use the'
+ #   warn2 "\`--with-motif' option) but that is NOT recommended."
+@@ -4735,10 +4733,8 @@ if test "$have_gl" = no ; then
+     CONF_STATUS=1
+   elif test "$with_gl_req" = no ; then
+     noteL 'The OpenGL 3D library is not being used.'
+-    CONF_STATUS=1
+   else
+     noteL 'The OpenGL 3D library was not found.'
+-    CONF_STATUS=1
+   fi
+ 
+   if test "$gl_halfassed" = yes ; then
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch b/meta-oe/recipes-graphics/xscreensaver/files/0002-build-Do-not-build-po-files.patch
similarity index 65%
rename from meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch
rename to meta-oe/recipes-graphics/xscreensaver/files/0002-build-Do-not-build-po-files.patch
index 7703a43204..0ceba7be02 100644
--- a/meta-oe/recipes-graphics/xscreensaver/files/0001-build-Do-not-build-po-files.patch
+++ b/meta-oe/recipes-graphics/xscreensaver/files/0002-build-Do-not-build-po-files.patch
@@ -1,18 +1,22 @@
-From 19bd0a979677a81d7399d5b567998398ec81f38b Mon Sep 17 00:00:00 2001
+From 6b5d022f6dd9848a2d5ca08a1968929b8c140981 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 8 Jul 2021 15:40:10 -0700
-Subject: [PATCH] build: Do not build po files
+Date: Sat, 16 Jul 2022 09:59:40 -0700
+Subject: [PATCH 2/2] build: Do not build po files
 
 Fixes
 | make[1]: Entering directory '/mnt/b/yoe/master/build/tmp/work/cortexa57-yoe-linux/xscreensaver/6.01-r0/xscreensaver-6.01/po'
 | make[1]: *** No rule to make target 'default'.  Stop.
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- Makefile.in | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ Makefile.in        | 5 ++---
+ driver/Makefile.in | 2 +-
+ 2 files changed, 3 insertions(+), 4 deletions(-)
 
+diff --git a/Makefile.in b/Makefile.in
+index 9de79b2..1c1d16c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -6,8 +6,8 @@ srcdir		= @srcdir@
@@ -26,14 +30,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  SUBDIRS2	= $(SUBDIRS) OSX android
  TARFILES	= README README.hacking INSTALL \
  		  configure configure.ac Makefile.in config.h.in \
-@@ -451,4 +451,3 @@ cerebrum::
- 	--include 'configure*' \
+@@ -461,4 +461,3 @@ cerebrum::
+ 	--include 'ad2c' \
  	--include '*/' \
  	--exclude '*'
 -
+diff --git a/driver/Makefile.in b/driver/Makefile.in
+index e1fa1b2..feca6fc 100644
 --- a/driver/Makefile.in
 +++ b/driver/Makefile.in
-@@ -212,7 +212,7 @@ TEST_EXES	= test-passwd   test-uid
+@@ -211,7 +211,7 @@ TEST_EXES	= test-passwd   test-uid        test-xdpms      test-grab     \
  		  xdpyinfo      test-screens    test-yarandom   test-xinput   \
  	          test-xkb
  
@@ -42,3 +48,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  UTIL_EXES	= xscreensaver-gfx @EXES_SYSTEMD@
  SETUID_EXES	= xscreensaver-auth
  DEMO_EXES	= @ALL_DEMO_PROGRAMS@
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
similarity index 66%
rename from meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb
rename to meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
index 2ab5297949..d24f666bcf 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.01.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_6.04.bb
@@ -3,16 +3,15 @@ HOMEPAGE = "https://www.jwz.org/xscreensaver/"
 LICENSE = "0BSD"
 LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=c3ce41cdff745eb1dc9d4fcfbffb4d51"
 
-SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "085484665d91f60b4a1dedacd94bcf9b74b0fb096bcedc89ff1c245168e5473b"
-
-SRC_URI += " \
+SRC_URI = "https://www.jwz.org/${BPN}/${BP}.tar.gz \
     file://xscreensaver.service \
-    file://0001-build-Do-not-build-po-files.patch \
-    file://tweak-app-defaults.patch \
+    file://0001-Tweak-app-defaults.patch \
+    file://0002-build-Do-not-build-po-files.patch \
+    file://0001-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch \
 "
+SRC_URI[sha256sum] = "787014b29f0c5793ecc2d93e1109a049ff48ab0c29b851dab34f683ceef6b152"
 
-DEPENDS = "intltool-native libx11 libxext libxt libxft libxi glib-2.0-native bc-native libpam"
+DEPENDS = "intltool-native libx11 libxext libxt libxft libxi glib-2.0-native bc-native libpam jpeg"
 # These are only needed as part of the stopgap screensaver implementation:
 RDEPENDS:${PN} = " \
     liberation-fonts \
@@ -25,9 +24,17 @@ inherit systemd perlnative pkgconfig gettext autotools-brokensep features_check
 EXTRA_OECONF += "--with-app-defaults=${datadir}/X11/app-defaults --libdir=${STAGING_LIBDIR} \
                  --includedir=${STAGING_INCDIR} --with-pam --with-login-manager"
 
-EXTRA_OEMAKE += "install_prefix=${D}"
+EXTRA_OEMAKE += "install_prefix=${D} GTK_DATADIR=${datadir}"
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
+PACKAGECONFIG = "png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+
+PACKAGECONFIG[systemd] = "--with-systemd=yes,--with-systemd=no,systemd"
+PACKAGECONFIG[png] = "--with-png=yes,--with-png=no,libpng"
+
+CONFIGUREOPTS:remove = "--disable-silent-rules --disable-dependency-tracking ${@append_libtool_sysroot(d)}"
+EXTRA_OECONF:remove = "--disable-static"
+
 do_install:append() {
     install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
     for f in xscreensaver-getimage-file xscreensaver-getimage-video webcollage xscreensaver-text vidwhacker
-- 
2.37.1


