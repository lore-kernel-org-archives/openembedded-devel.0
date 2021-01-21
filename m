Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.2306.1611261898746034075
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 12:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=bS7/CPmO;
 spf=pass (domain: qtec.com, ip: 209.85.167.50, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f50.google.com with SMTP id h7so4469629lfc.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 12:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8sxn7JzzdJSQ2tfPBPimV5FiZPClhsTQA/pHwBBqVAk=;
        b=bS7/CPmOGC105O7AODJs1cj5ZpNT0YjN2udhX6ud310EaVHQMlX4qOuP/Ir5g50pE/
         ltHq7wjWNtDg+PSWLVViVF9JeGoPyL3G4kN7Fs4PAu+DmEViD/AW5bkzJspzRYCA7E96
         LBgYWemKId97gd5X3UJWIxB4fwSsE+oVSbSu4Wwjv9dSJXWngZTLxbBB1ih0Qd0p0nax
         AJEl57UmbfV5puWklWq1GNU3zfAGERaqbEWvYZOS7c/DJ8eWUaipifBzoMmfEHsancHC
         RusrgMB7pPcchoQWWfExQ1wb2K6j40i1AluRxhH3vvRh8FWHRchcqwDZh3ZsAtWae1Tz
         GeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8sxn7JzzdJSQ2tfPBPimV5FiZPClhsTQA/pHwBBqVAk=;
        b=IIWg3ZVDb9zFTxOUhQX03x1hjq5wP74LZGNLgpKsyntDxA07ighEikr6NM3WzjBCI+
         s0744mYdSLaG4BXkrDXGqK0mtvIbjoseKmUobSfT5Tw+3ZGVKVMBd0pM+kHyFxYDO/kH
         17lYLO0XyxuYIrDMX3gAe71ZJCuGyzL61gYBU4+cp2CzVVIYcSljTC9iS9g3qoivhEez
         zSXpGjeVf8t3d9CsYi3qW3MhTZ/q5I+eCMWWVumlGCO5mLfSOp29HfXuwdP8GntWTpnj
         b5Hk/1h5c3gWGhEZtZIImbqFhSEsWTOs+eM1stNRtmHuV2JML3KRKL4O6HicO1OE2wtY
         WHtg==
X-Gm-Message-State: AOAM531GLyzrHEGqsx4F84SJt1XHMcImbFzgZBP6Bu91DdsG6TmPMSaJ
	v6OrkFnhFSSUVfSobUNDvsEmzzv8Oo0VZOkYNJ3vlRUEaNZFHWMEIm2FlaRnEfah+Ukws4cnXGg
	F+ZQLUaDX64sCmenR9fdAes3dp9f6iw5CCBXDa0yq6ue9fJj3K/ZgprWm5jqvOTAIjpo3oQcLks
	NLFu21mu3nb8pHgw==
X-Google-Smtp-Source: ABdhPJzdcIUTJetKzyfBmm127Mvg9Z5OyICyzs2nTC28k7WPKJGmh5pja+JtBwJ2juPA/AfsZ2l6wA==
X-Received: by 2002:ac2:44ba:: with SMTP id c26mr497899lfm.132.1611261896221;
        Thu, 21 Jan 2021 12:44:56 -0800 (PST)
Return-Path: <daniel@qtec.com>
Received: from localhost.localdomain (80-167-86-46-cable.dk.customer.tdc.net. [80.167.86.46])
        by smtp.gmail.com with ESMTPSA id s2sm491855lfc.261.2021.01.21.12.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 12:44:55 -0800 (PST)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Gomez <daniel@qtec.com>
Subject: [oe][meta-oe][PATCH] zbar: Add support for mchehab/zbar
Date: Thu, 21 Jan 2021 21:44:51 +0100
Message-Id: <20210121204451.8110-1-daniel@qtec.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZBar project development stopped in 2012 but it was forked and
maintained by Mauro Carvalho Chehab to keep it up to date with V4L2 api.

Main repository:
https://github.com/mchehab/zbar

Add support for zbar library mantained by mchehab. Use latest
version available 0.23.1.

Compile by default with options: video & python3.

As ZBar (original project) and mchehab/zbar (new & updated) are
different, keep both recipes as:

-  zbar_0.10.bb: ZBar version 0.10
-  zbar_git.bb: mchehab/zbar Version 0.23.1

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 .../0001-qt-Create-subdir-in-Makefile.patch   | 35 +++++++++++
 ...02-zbarcam-Create-subdir-in-Makefile.patch | 40 ++++++++++++
 meta-oe/recipes-support/zbar/zbar_0.10.bb     | 31 ++++++++++
 meta-oe/recipes-support/zbar/zbar_git.bb      | 62 ++++++++++++++-----
 4 files changed, 151 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
 create mode 100644 meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
 create mode 100644 meta-oe/recipes-support/zbar/zbar_0.10.bb

diff --git a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
new file mode 100644
index 000000000..d7ca15207
--- /dev/null
+++ b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
@@ -0,0 +1,35 @@
+From 9c67f377477a07495a712f478eabfa8d33164c45 Mon Sep 17 00:00:00 2001
+From: Daniel Gomez <dagmcr@gmail.com>
+Date: Sun, 17 Jan 2021 23:32:51 +0100
+Subject: [PATCH 1/2] qt: Create subdir in Makefile
+
+Create builddir/qt subdir when --with-qt5 is enabled.
+
+Fixes the following error:
+
+moc -Iqt -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB
+-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
+-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
+-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
+-I../git/include ../git/include/zbar/QZBar.h -o qt/moc_QZBar.cpp
+moc: Cannot create qt/moc_QZBar.cpp
+make: *** [Makefile:2459: qt/moc_QZBar.cpp] Error 1
+
+Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
+---
+ qt/Makefile.am.inc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/qt/Makefile.am.inc b/qt/Makefile.am.inc
+index b099c2b..c98fbeb 100644
+--- a/qt/Makefile.am.inc
++++ b/qt/Makefile.am.inc
+@@ -15,4 +15,5 @@ qt/moc_%.cpp: qt/%.h
+ 	$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
+ 
+ qt/moc_%.cpp: include/zbar/%.h
++	@$(mkdir_p) qt 2>/dev/null
+ 	$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
new file mode 100644
index 000000000..a1c27b8b4
--- /dev/null
+++ b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
@@ -0,0 +1,40 @@
+From fe751929ccc8fd75e350ed6db9d28d04bd31fc79 Mon Sep 17 00:00:00 2001
+From: Daniel Gomez <dagmcr@gmail.com>
+Date: Sun, 17 Jan 2021 23:33:19 +0100
+Subject: [PATCH 2/2] zbarcam: Create subdir in Makefile
+
+Create builddir/zbarcam when --with-qt5 is enabled.
+
+Fixes the following error:
+
+moc -i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB
+-DQT_CORE_LIB
+-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
+-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtX11Extras
+-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
+-I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
+-I../git/include ../git/zbarcam/zbarcam-qt.cpp -o
+zbarcam/moc_zbarcam_qt.h
+moc: Cannot create zbarcam/moc_zbarcam_qt.h
+make: *** [Makefile:2438: zbarcam/moc_zbarcam_qt.h] Error 1
+
+Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
+---
+ zbarcam/Makefile.am.inc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/zbarcam/Makefile.am.inc b/zbarcam/Makefile.am.inc
+index b6de82c..e90c50c 100644
+--- a/zbarcam/Makefile.am.inc
++++ b/zbarcam/Makefile.am.inc
+@@ -28,6 +28,7 @@ DISTCLEANFILES += $(nodist_zbarcam_zbarcam_qt_SOURCES) zbarcam/moc_zbarcam_qt.h
+ 
+ 
+ zbarcam/moc_zbarcam_qt.h: zbarcam/zbarcam-qt.cpp
++	@$(mkdir_p) zbarcam 2>/dev/null
+ 	$(MOC) -i $(zbarcam_zbarcam_qt_CPPFLAGS) $< -o $@
+ endif
+ 
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb b/meta-oe/recipes-support/zbar/zbar_0.10.bb
new file mode 100644
index 000000000..181d7ae43
--- /dev/null
+++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "2D barcode scanner toolkit."
+SECTION = "graphics"
+LICENSE = "LGPL-2.1"
+
+DEPENDS = "pkgconfig intltool-native libpng jpeg"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4015840237ca7f0175cd626f78714ca8"
+
+PV = "0.10+git${SRCPV}"
+
+#  iPhoneSDK-1.3.1 tag
+SRCREV = "67003d2a985b5f9627bee2d8e3e0b26d0c474b57"
+SRC_URI = "git://github.com/ZBar/Zbar \
+           file://0001-make-relies-GNU-extentions.patch \
+"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+
+PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau libxext libxv libice libxdmcp"
+
+EXTRA_OECONF = "--without-imagemagick --without-qt --without-python --disable-video --without-gtk"
+
+CPPFLAGS += "-Wno-error"
+
+do_install_append() {
+    #remove usr/bin if empty
+    rmdir ${D}${bindir}
+}
diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
index 181d7ae43..dae912252 100644
--- a/meta-oe/recipes-support/zbar/zbar_git.bb
+++ b/meta-oe/recipes-support/zbar/zbar_git.bb
@@ -1,31 +1,59 @@
-DESCRIPTION = "2D barcode scanner toolkit."
+HOMEPAGE = "https://github.com/mchehab/zbar"
+SUMMARY = "A bar code library"
+DESRIPTION = "ZBar is an open source software suite for reading bar codes \
+from various sources, such as video streams, image files and raw \
+intensity sensors. It supports EAN-13/UPC-A, UPC-E, EAN-8, Code 128, \
+Code 93, Code 39, Codabar, Interleaved 2 of 5, QR Code and SQ Code"
 SECTION = "graphics"
+
 LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e9ee833a2118adc7d8b5ea38e5b1cef"
 
-DEPENDS = "pkgconfig intltool-native libpng jpeg"
+SRC_URI = "git://github.com/mchehab/zbar.git;branch=master \
+           file://0001-qt-Create-subdir-in-Makefile.patch \
+           file://0002-zbarcam-Create-subdir-in-Makefile.patch \
+"
+SRCREV = "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=4015840237ca7f0175cd626f78714ca8"
+S = "${WORKDIR}/git"
+PV = "0.23.1+git${SRCPV}"
 
-PV = "0.10+git${SRCPV}"
+DEPENDS += "xmlto-native"
 
-#  iPhoneSDK-1.3.1 tag
-SRCREV = "67003d2a985b5f9627bee2d8e3e0b26d0c474b57"
-SRC_URI = "git://github.com/ZBar/Zbar \
-           file://0001-make-relies-GNU-extentions.patch \
+PACKAGECONFIG ??= "\
+        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 "
-S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+PACKAGECONFIG ??= "video python3"
 
-PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+inherit autotools pkgconfig gettext \
+        ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'gtk3', 'gobject-introspection',	'', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
 
-PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau libxext libxv libice libxdmcp"
+PACKAGECONFIG[x11] = "--with-x, --without-x, libxv"
+PACKAGECONFIG[video] = "--enable-video, --disable-video, v4l-utils libv4l"
+PACKAGECONFIG[jpeg] = "--with-jpeg, --without-jpeg, jpeg"
+PACKAGECONFIG[python3] = "--with-python=auto, --without-python, python3"
+PACKAGECONFIG[gtk3] = "--with-gtk=gtk3, --without-gtk, gtk+3"
+PACKAGECONFIG[qt5] = "--with-qt5, --without-qt5, qtbase qtbase-native qtx11extras qtsvg, qtbase"
+PACKAGECONFIG[imagemagick] = "--with-imagemagick, --without-imagemagick, imagemagick"
 
-EXTRA_OECONF = "--without-imagemagick --without-qt --without-python --disable-video --without-gtk"
+FILES_${PN} += "${bindir} \
+        ${@bb.utils.contains('DEPENDS', 'python3-native', '${libdir}', '', d)} \
+"
+
+CPPFLAGS_append = "\
+        ${@bb.utils.contains('PACKAGECONFIG', 'qt5', '\
+        -I${STAGING_INCDIR}/QtX11Extras \
+        -I${STAGING_INCDIR}/dbus-1.0 \
+        -I${STAGING_LIBDIR}/dbus-1.0/include \
+        ', '', d)} \
+"
 
-CPPFLAGS += "-Wno-error"
+TARGET_CXXFLAGS_append = " -fPIC"
 
-do_install_append() {
-    #remove usr/bin if empty
-    rmdir ${D}${bindir}
+do_prepare_recipe_sysroot_gettext() {
+        install -m 755 ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${S}/
 }
+addtask do_prepare_recipe_sysroot_gettext after do_prepare_recipe_sysroot before do_configure
\ No newline at end of file
-- 
2.29.2

