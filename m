Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD5CF782A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 12:05:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i186so7999339wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 04:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L7KcQvTphcdX1X7fmuquVlPAwY82JEBtNNY5oS6OvTA=;
	b=Mq2PvmMZtxFbRqDtvDroSIRU7MMtRomNNZ+tNlRiHlg4i3EEP/3YSbDjFsSK1/r7um
	y1+98YDeA6Kug9chsRw35HPP4bQ4sDNu5RkFwzECcG8wKxnU3Wo0AWYSRJ6TXvHQcmvV
	oabnNY2HHj/qphGmJk+/+JfW4j0bQxap8Fh/NZIsC0qeym4nGnzZzAFzBjKz7o9gK5l4
	UEru6N6BUdSedGH80VXeM9FxFFhEKV++gUtaXu6DCssUpwTo7mjtmLHHbXguRlIB9l1H
	0yRLiczGsKp/iqH7uzKBN6WufpodQj20BoJ4sUukq/Kv8JmUMJ1/n8f8QZvwP0oWOrMg
	+ovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L7KcQvTphcdX1X7fmuquVlPAwY82JEBtNNY5oS6OvTA=;
	b=f/Gg1e0OLZqXyOkp/IY6JM4OqSOUV1u8Afx3esc8E/TL8Ei9TcUMARkAFuyOwjeBpd
	vK0Frlib3pTBnDdCDrmcRWprUdDE/6EFwRAnCoR/QsqoaFRWnlUoAavgDfQHWwMOImvD
	zn1U05cvP5OVLV47Bq4IvBCiH8Hx4OY+C5rgaFOuMmBxC5TA76tmbmhv//Bd41SGS/pv
	qGer8VrDLjNHLnM/8mIFBXppij6pD5fgwRcLTDkvAXuaDUjgbb1NjjBSW6cxmNoVAN55
	Yw+0iOLLD5p5nUJGMXQH0gZS/YJTVIc9PizeCvNonwH6SQ/xHkSZLkgSnHSmw7xm4Zsu
	hYXg==
X-Gm-Message-State: AKwxyteCPZjBdzmoQ8t0tsOp1hZpoAVuKx1W+al0zEsR/MSKPaEYYcmB
	5+PNPAZ7dtvsu/7wbUW7NSuNYA==
X-Google-Smtp-Source: AH8x224NlIG9dJP2KsiZSwUcVADrFRi+opiJ41+hNC1lGkjknBN/GlNljUa0p7aljMOjZcWWJ7Zw9w==
X-Received: by 10.28.22.145 with SMTP id 139mr4389773wmw.56.1516795543442;
	Wed, 24 Jan 2018 04:05:43 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k20sm5160477wrk.37.2018.01.24.04.05.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Jan 2018 04:05:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jan 2018 12:05:46 +0000
Message-Id: <20180124120546.17991-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-qt5][rocko][PATCH] qt5: upgrade to 5.9.4
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
X-List-Received-Date: Wed, 24 Jan 2018 12:05:44 -0000

* update LICENSE in qtsystems which was updated to match other
  qt modules

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb                        |  6 +++---
 recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch       |  2 +-
 .../qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch   |  2 +-
 recipes-qt/qt5/qt3d_git.bb                                    |  4 ++--
 recipes-qt/qt5/qt5-git.inc                                    |  4 ++--
 recipes-qt/qt5/qtbase-native_git.bb                           |  6 +++---
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch      |  2 +-
 .../0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch     |  2 +-
 ...qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch |  2 +-
 ...configure-bump-path-length-from-256-to-512-character.patch |  4 ++--
 ...Disable-all-unknown-features-instead-of-erroring-out.patch |  6 +++---
 ...Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch |  2 +-
 .../qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch     |  2 +-
 .../qtbase/0008-Replace-pthread_yield-with-sched_yield.patch  |  6 +++---
 .../0009-Add-OE-specific-specs-for-clang-compiler.patch       |  2 +-
 ...linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch |  2 +-
 .../0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch   |  2 +-
 recipes-qt/qt5/qtbase/0012-Always-build-uic.patch             |  2 +-
 recipes-qt/qt5/qtbase_git.bb                                  |  4 ++--
 recipes-qt/qt5/qtcanvas3d_git.bb                              |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                                |  4 ++--
 recipes-qt/qt5/qtconnectivity_git.bb                          |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                             |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                           |  2 +-
 recipes-qt/qt5/qtgamepad_git.bb                               |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb                      |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb                          |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                              |  4 ++--
 .../0001-qtmultimedia-fix-a-conflicting-declaration.patch     |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                            |  4 ++--
 recipes-qt/qt5/qtnetworkauth_git.bb                           |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                                |  5 +----
 ...texteditor-fix-invalid-use-of-incomplete-type-class-.patch |  2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb                        |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb                         |  4 ++--
 .../qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch   |  2 +-
 recipes-qt/qt5/qtremoteobjects_git.bb                         |  4 ++--
 recipes-qt/qt5/qtscript_git.bb                                |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                                 |  4 ++--
 recipes-qt/qt5/qtsensors_git.bb                               |  2 +-
 recipes-qt/qt5/qtserialbus_git.bb                             |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                            |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                                   |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                               | 11 ++++++-----
 .../qt5/qttools/0001-add-noqtwebkit-configuration.patch       |  2 +-
 ...linguist-tools-cmake-allow-overriding-the-location-f.patch |  2 +-
 recipes-qt/qt5/qttools_git.bb                                 |  4 ++--
 recipes-qt/qt5/qttranslations_git.bb                          |  2 +-
 .../0001-include-sys-time.h-for-timeval.patch                 |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb                       |  4 ++--
 recipes-qt/qt5/qtwayland_git.bb                               |  4 ++--
 recipes-qt/qt5/qtwebchannel_git.bb                            |  2 +-
 ...chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |  2 +-
 ...01-functions.prf-allow-build-for-linux-oe-g-platform.patch |  2 +-
 ...WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch |  2 +-
 .../0002-chromium-Force-host-toolchain-configuration.patch    |  2 +-
 ...003-Include-dependency-to-QCoreApplication-translate.patch |  2 +-
 ...0003-chromium-workaround-for-too-long-.rps-file-name.patch |  2 +-
 .../qtwebengine/0004-Force-host-toolchain-configuration.patch |  2 +-
 ...chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch |  2 +-
 ...chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch |  2 +-
 .../0006-chromium-musl-include-fcntl.h-for-loff_t.patch       |  2 +-
 ...chromium-musl-use-off64_t-instead-of-the-internal-__.patch |  2 +-
 .../0008-chromium-musl-linux-glibc-make-the-distinction.patch |  2 +-
 ...chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch |  2 +-
 ...chromium-musl-Use-correct-member-name-__si_fields-fr.patch |  2 +-
 .../0011-chromium-musl-Match-syscalls-to-match-musl.patch     |  2 +-
 ...chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch |  2 +-
 .../0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch     |  2 +-
 ...0014-chromium-musl-Adjust-default-pthread-stack-size.patch |  2 +-
 ...chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch |  2 +-
 ...chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb                             |  8 ++++----
 .../qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch   |  2 +-
 .../0002-Exclude-backtrace-API-for-non-glibc-libraries.patch  |  2 +-
 recipes-qt/qt5/qtwebkit_git.bb                                |  4 ++--
 recipes-qt/qt5/qtwebsockets_git.bb                            |  2 +-
 recipes-qt/qt5/qtwebview_git.bb                               |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                             |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                           |  2 +-
 80 files changed, 110 insertions(+), 112 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index f40c807..5b20b0a 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -26,7 +26,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
-# 5.9.meta-qt5-shared.3
+# 5.9.meta-qt5-shared.4
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -43,7 +43,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
-# 5.9.meta-qt5-native.3
+# 5.9.meta-qt5-native.4
 SRC_URI += " \
     file://0012-Always-build-uic.patch \
 "
@@ -200,4 +200,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "4d8ae444c2b15ec7da5ef133aa5ad5a548180e21"
+SRCREV = "0d9208cecbbd9ed08e4ffb6540729668e3bd7754"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index 89cc3d5..a0a9531 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From a1435496b5a5ad4c51fc0d5f5a3a439c3a575426 Mon Sep 17 00:00:00 2001
+From ab6cf59817fa72a4ac357d6132974eeb4980f662 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
index 6e5fb7b..9f72106 100644
--- a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
+++ b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
@@ -1,4 +1,4 @@
-From 223eebb055ebaaf5533782a3fde5842fb80c715b Mon Sep 17 00:00:00 2001
+From 9077cda0426de08c2d4ce74bf793316171427bfc Mon Sep 17 00:00:00 2001
 From: Kim Kulling <kim.kulling@googlemail.com>
 Date: Mon, 7 Nov 2016 17:19:49 +0100
 Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index d89c46f..c0a878a 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -12,7 +12,7 @@ DEPENDS += "qtbase"
 DEPENDS_class-target += "qtdeclarative qt3d-native"
 
 # Patches from https://github.com/meta-qt5/qt3d/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
     file://0002-Fix-BlenderDNA-for-clang-cross-compiler.patch \
@@ -37,6 +37,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "6399bcf7a9564f3566e160803f6f2837ce8727af"
+SRCREV = "02d01a68971747f01a270226f6474190736939cf"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index a653011..44f8d71 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,5 +1,5 @@
 # Copyright (C) 2012-2016 O.S. Systems Software LTDA.
-# Copyright (C) 2013-2017 Martin Jansa <martin.jansa@gmail.com>
+# Copyright (C) 2013-2018 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
 QT_MODULE_BRANCH ?= "5.9"
@@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
 
 S = "${WORKDIR}/git"
 
-PV = "5.9.3+git${SRCPV}"
+PV = "5.9.4+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 84e4872..a04aeb5 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -21,7 +21,7 @@ require qt5-git.inc
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
-# 5.9.meta-qt5-shared.3
+# 5.9.meta-qt5-shared.4
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -38,7 +38,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
-# 5.9.meta-qt5-native.3
+# 5.9.meta-qt5-native.4
 SRC_URI += " \
     file://0012-Always-build-uic.patch \
 "
@@ -125,4 +125,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "4d8ae444c2b15ec7da5ef133aa5ad5a548180e21"
+SRCREV = "0d9208cecbbd9ed08e4ffb6540729668e3bd7754"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 62feb77..254eb12 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From a77e7c2996ca25cc59b04b165a24575440dd7efa Mon Sep 17 00:00:00 2001
+From 3e3ba87fc8158a0c11b16f72e931ca3c19eff6d9 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
diff --git a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
index e972959..9684f13 100644
--- a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
+++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
@@ -1,4 +1,4 @@
-From 7f7324682b5c5780efd72ed005ff9c160f316ddf Mon Sep 17 00:00:00 2001
+From 911364cfc7ce239a602aa546430efbcfcc194d04 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
diff --git a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 2b608d0..09adc2b 100644
--- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 7fd1f1ee99848e470f214687ad7e0020827c8dd7 Mon Sep 17 00:00:00 2001
+From d40a14e077729252146533f4d1635a66d61efd10 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
index 495acc9..ce99086 100644
--- a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 88896be2c8d9a0901c8a171539c77c858a080a95 Mon Sep 17 00:00:00 2001
+From f3b3aa5bde4f9461dcdfbbbe32efb1741bfa1b00 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -15,7 +15,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.pri b/configure.pri
-index 83c0dee..d60ba84 100644
+index dc703ec..961b41e 100644
 --- a/configure.pri
 +++ b/configure.pri
 @@ -796,10 +796,10 @@ defineTest(qtConfOutput_preparePaths) {
diff --git a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
index 9cc180f..c89f11d 100644
--- a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
+++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -1,4 +1,4 @@
-From 7bce2f7299d74ca9f19d1b8602f64e042d4daff9 Mon Sep 17 00:00:00 2001
+From 00570dbfe9760bdc1ee0cf143ad8c34329fcd388 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Mon, 24 Oct 2016 09:45:18 +0300
 Subject: [PATCH] Disable all unknown features instead of erroring out
@@ -10,10 +10,10 @@ Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_configure.prf
-index 1ba9676..5b5bcdf 100644
+index d5dcda2..501151d 100644
 --- a/mkspecs/features/qt_configure.prf
 +++ b/mkspecs/features/qt_configure.prf
-@@ -1238,7 +1238,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
+@@ -1251,7 +1251,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
                      error("Expression '$$1' is accessing field '$$var' of non-local feature $${feature}.")
                  return($$result)
              }
diff --git a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index 1b3a0e5..6d877bd 100644
--- a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From 10846494f582c0102d908a4d25488874cb3162be Mon Sep 17 00:00:00 2001
+From 4711f276a72cac060d827c909dc69e7a2def457e Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
diff --git a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
index 99d001b..95870da 100644
--- a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
+++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
@@ -1,4 +1,4 @@
-From a71c3b3df73a045e952da8384a40d04b68b0f06d Mon Sep 17 00:00:00 2001
+From 7b551a4cf2502be62b42ba2374c4bf6e6224269e Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Wed, 7 Jun 2017 21:00:49 +0900
 Subject: [PATCH] Delete qlonglong and qulonglong
diff --git a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
index 38f695d..c4e101b 100644
--- a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
+++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
@@ -1,4 +1,4 @@
-From 008a5f2b416c0eba249472e66bb14ef24b6961aa Mon Sep 17 00:00:00 2001
+From ae66a692b862b2433a59b737a1f817efd5878433 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 27 Jul 2017 08:02:51 -0700
 Subject: [PATCH] Replace pthread_yield with sched_yield
@@ -36,7 +36,7 @@ index f9ddd59..2f92db9 100644
              QMetaType info(tp);
              if (!info.isValid()) {
 diff --git a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
-index 7340817..f34162a 100644
+index f64a88c..997218b 100644
 --- a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 +++ b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 @@ -77,6 +77,7 @@
@@ -47,7 +47,7 @@ index 7340817..f34162a 100644
  #endif
  
  #include "private/qhostinfo_p.h"
-@@ -2131,8 +2132,8 @@ public slots:
+@@ -2138,8 +2139,8 @@ public slots:
  
  #if defined(Q_OS_MAC)
          pthread_yield_np();
diff --git a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
index 558039f..05d88cb 100644
--- a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
+++ b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
@@ -1,4 +1,4 @@
-From 096d8538fdde74606fc0b9da7465ec8d78fea0a0 Mon Sep 17 00:00:00 2001
+From aa4792720ae1553549fa4228390251f03e6520e2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:11:44 -0700
 Subject: [PATCH] Add OE specific specs for clang compiler
diff --git a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
index f4dff91..09a7002 100644
--- a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
+++ b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
@@ -1,4 +1,4 @@
-From dc8aed8056a69fc86b80203f49024f6d30043eb9 Mon Sep 17 00:00:00 2001
+From cd179b5af4c479fa6deb6c8eace75a04848d7498 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:44:48 -0700
 Subject: [PATCH] linux-clang: Invert conditional for defining QT_SOCKLEN_T
diff --git a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
index c9f491c..874addd 100644
--- a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
+++ b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
@@ -1,4 +1,4 @@
-From a7fdafb37c590f8bd7fe3c4f9791113bb0d755b7 Mon Sep 17 00:00:00 2001
+From cac2d0666a09f7858ef2ea7d9b0bfc419c133619 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 10:11:50 -0700
 Subject: [PATCH] tst_qlocale: Enable QT_USE_FENV only on glibc
diff --git a/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
index 4a4e2ed..1e0b516 100644
--- a/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 4959437c202598a3398b3253daaf2432a2725a35 Mon Sep 17 00:00:00 2001
+From b7ca9eb9abd3cb0b3966519c3a34e74b5e0c6c0e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 26de4c8..0e3a8ac 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
-# 5.9.meta-qt5-shared.3
+# 5.9.meta-qt5-shared.4
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -228,4 +228,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "4d8ae444c2b15ec7da5ef133aa5ad5a548180e21"
+SRCREV = "0d9208cecbbd9ed08e4ffb6540729668e3bd7754"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 3907dc4..7077dec 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "3ec47336f19a00e590c75ee520ff123266aa53b0"
+SRCREV = "6fb3a31e79731b27eccb7ff816a73df6b6b5f14c"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index a1cb286..1a1424c 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "def384b950c7a21a14a4eaf27e5bfe9c487f7520"
+SRCREV = "0bc38b76e2aca205a0a96cc637395652d31684ba"
 
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
-LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
\ No newline at end of file
+LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 3da0853..76d8541 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "475d1bad05c14bfb06eb4472c2ba7b0f95bfa051"
+SRCREV = "6eba2055ba2cf29ab8c2cbc8de10a1533b6404cc"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 0ffdc18..41b1c10 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "b94345779087f6598ab1204d6aebffa4ba581932"
+SRCREV = "66315056141a6c51329f66cdabb9bf1f83f6f918"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 3a66d0e..827745d 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "08778586413adad7b3af35c7cb97416757d599c0"
+SRCREV = "317908e72a6ea0b4ca179690539cb352bbf60832"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index b9de279..d5f7592 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "2ed733d1cbf7cdafdc084f74e9897faad578f648"
+SRCREV = "992c0825c5bd56a0051b2ffdcd7f7c3458c2ae4f"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index ad5a36f..ec54ba3 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "cb007fee657f8bc2e48c3c1969834114e06a4307"
+SRCREV = "5d6bcaddf72093b29b4811b60ae663a7705bd95a"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 2c5ac1a..cba83d1 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "18f057c28a169285dd9df18728baa152b22b29e3"
+SRCREV = "3c607b324ffbf84ce9803d80a04c7d663e847496"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 3d94767..0235620 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,7 +29,7 @@ SRC_URI += " \
     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "64e8ed5fa20d343904a27ad86411223504367e89"
-SRCREV_qtlocation-mapboxgl = "1c633072fcea7ad153ab6f8ec40dd72d83541ead"
+SRCREV_qtlocation = "a34e08740d55b606bbaa4963a3ba9887459fd8ce"
+SRCREV_qtlocation-mapboxgl = "8c1be4ec01ef46bf453856531ebf53b48ce3dbe7"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
index 34aef48..ae3f2e3 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
@@ -1,4 +1,4 @@
-From 6119c88abf41f36b790e86e07e7a73d39e5f936b Mon Sep 17 00:00:00 2001
+From aaa3d0e57ea0eea6dbd4179eecc3756fdddc0681 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Thu, 8 Sep 2016 12:18:13 +0800
 Subject: [PATCH] qtmultimedia: fix a conflicting declaration
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index de99926..f0ac483 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -26,7 +26,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
 
 # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
@@ -35,4 +35,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "f771b34d7e288c172f773d440d9ee46e85548f2f"
+SRCREV = "d83467be15486090ee23709dc325c2c28d34c0cd"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index d32986c..1a74347 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -9,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "da3963e3d406b445223081cbdfe10858ba2036ae"
+SRCREV = "eee494c12a70fa0aa6fce427f47f44ff60281dca"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index c1bbc8a..a8fbb8e 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -25,7 +25,4 @@ do_configure_prepend() {
 }
 
 QT_MODULE_BRANCH = "dev"
-# one commit behind:
-# 8a7b80eb Use QRandomGenerator instead of q?rand
-# because QRandomGenerator is only since Qt 5.10
-SRCREV = "9bf0edd9bd46ecb900bcdc3349d14869b87ab7de"
+SRCREV = "fa02271a18837f20e82006de23c2af1899294aa1"
diff --git a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
index 7e02aee..7e6fb79 100644
--- a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
+++ b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
@@ -1,4 +1,4 @@
-From c90b7784c3b4ec3cbc9de2c84cee9646d547f021 Mon Sep 17 00:00:00 2001
+From ae3bedf79b92ab4ce4d14f8738733cbd854f8902 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:57:01 -0400
 Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class QDebug'
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 522f1d7..9d13bbe 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "2eb1d259c6441faa62dc1834664e71995dca9165"
+SRCREV = "99264fcfb98c01040a1edccba70ce7c268c41de4"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 8886865..266e570 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -23,9 +23,9 @@ FILES_${PN}-qmlplugins += " \
 "
 
 # Patches from https://github.com/meta-qt5/qtquickcontrols/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "118c63b8b5c129b2566f19b7931529fbe60850f8"
+SRCREV = "8da20ddef88cb48b7bb09ff7dc1db6517add8e72"
diff --git a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
index c12dfce..218248d 100644
--- a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 873931a0ae4223e97ca9534b2c2ec99e974ee234 Mon Sep 17 00:00:00 2001
+From 584e2655314113893eae91e79368fc7bc7ed3a29 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 7 Jun 2017 15:17:12 +0300
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index f8d8ddb..cdc11fb 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -12,7 +12,7 @@ require qt5-git.inc
 DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
 
 # Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
 "
@@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "c10eaf9148ec111c3fb752cc15e854e5c7fd3ea7"
+SRCREV = "286f3c626087635cb24708b8e42b1d8af0401640"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 7a141b4..0ee39af 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "c5b7db2e5cbc4477da75691602af1cc5fad10af0"
+SRCREV = "8399cdfbaf2aceab9c22fdcb10d2369ddb39b5df"
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index 8918fa2..8f2ec1d 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,10 +10,10 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "04a0d00d41087c431626cc82f6f01297b6d31e1d"
+SRCREV = "6950e4cf63a575925b829a8ca7424c55dac77066"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
 do_install_append_class-nativesdk() {
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index e691945..44251c3 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "5a76227267a118cbda84cdee6d4fd3008ea5d34a"
+SRCREV = "e94bbed18aaa4461af68727fb9a41076b4669676"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 960cc1e..fdc07e0 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "43845adcb402b2a55cac423b142a9139b4cac17d"
+SRCREV = "6e3e86f947fcbdf19cfad5d9cc6407f3a9e3f51e"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 6eea082..c39d996 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "f0d63a2f88ea88dcebdb1d9240006b35768f740d"
+SRCREV = "f1b44e67578b38732668c75b2549e4a8f9ea3f91"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index e1a622d..bffc388 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "c4c9b60dc4bbe3c3837c80ea63682f3ef9403277"
+SRCREV = "fc81943b3eb88227b9fa0a5e8afaaad65d3174fc"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 0c6ce7e..d459f59 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -1,11 +1,12 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
+LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-    file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -30,4 +31,4 @@ do_install_append() {
 
 QT_MODULE_BRANCH = "dev"
 
-SRCREV = "9c204e05ae7fefe9525b30238b469b1bb65d2537"
+SRCREV = "66e45676f5f5c6251ccab36906c6324fd0065e08"
diff --git a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
index 3c8edb3..9bf5204 100644
--- a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 10555f6883c2b7c2a5516a115ce2b7fa7932258a Mon Sep 17 00:00:00 2001
+From b9fc247bbb1e65f558da7924b452965b5b7fbf59 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 9089b02..98f97a2 100644
--- a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From b51d4f3f98c3ccccae6dccbaca97a5fca15c364e Mon Sep 17 00:00:00 2001
+From 0c6740c11fb24d592d2506424ccc1ad2aa07ca30 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 6719206..a95771f 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -16,7 +16,7 @@ inherit ptest
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 # Patches from https://github.com/meta-qt5/qttools/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 SRC_URI += " \
     file://run-ptest \
     file://0001-add-noqtwebkit-configuration.patch \
@@ -31,7 +31,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "87a54985321a3b9785619cdeeef44fa469cce594"
+SRCREV = "98f8f4971e6c2ffcb0ac5793ffe834197ab034ab"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 4d3a99b..eb89e71 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -111,4 +111,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "2578a31f573d4f80a33153f4165216be59a51162"
+SRCREV = "b3684346bd60983cecf2524f9f8081df514b5cb0"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
index 0873163..93ce333 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
+++ b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
@@ -1,4 +1,4 @@
-From f2303ad7a82758c3c854f8ff404e8a98fd8b7e72 Mon Sep 17 00:00:00 2001
+From 0b2ce7eb5be73947cc87435a81425a95f50736d8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Jul 2017 23:59:52 -0700
 Subject: [PATCH] include sys/time.h for timeval
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 8eaddc9..41c96d0 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 # Patches from https://github.com/meta-qt5/qtvirtualkeyboard/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 SRC_URI += "file://0001-include-sys-time.h-for-timeval.patch"
 
 # To enabled Nuance T9 Write support, you need to provide the licensed components
@@ -53,4 +53,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "e0d5dbf0b83d72109ff3e69b9ef64bb2e8dd6153"
+SRCREV = "e078c5e237142270f5d85a22a1e8adc969668695"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 188290e..9466d28 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,10 +37,10 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "916f9f843f31329669a8ec4864c929179bc5f737"
+SRCREV = "83db09bd0acaafb256880e3a217ed9df0641a00a"
 
 # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 # From https://bugreports.qt.io/browse/QTBUG-57767
 SRC_URI += " \
     file://0001-fix-build-without-xkbcommon-evdev.patch \
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index e47ef9f..a6d5877 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "10a2704788f0bdf8dad3f7872db11f76ca2f4a18"
+SRCREV = "2661593df95b8a5a56af0a8fd22af5be7f7ea8fb"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index 1ef4278..e5ecb92 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,4 +1,4 @@
-From 10203d0a213e49e7bb6c454eb430c4e1f3f37c27 Mon Sep 17 00:00:00 2001
+From 7dff6e15ab7347867ff32cbabe5b1836d2b9567b Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
 Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 8210a0b..2cd90cd 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 3ac9de8380ec071cded2d870bd0b2f37c6c5ea09 Mon Sep 17 00:00:00 2001
+From 5de61b012625e73a9c487c8e679a64b82d7eda81 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
diff --git a/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 58188c4..8f8ebf5 100644
--- a/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From e9bc049b13a9600de485df60ace3516052476baf Mon Sep 17 00:00:00 2001
+From 3ab41eb0e6afd0f8a9196da93ec43f0be755f84f Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
index 99d79e0..a5ccbf1 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 4bb0cabf3228d74fa0a596dd8edfde116630c11f Mon Sep 17 00:00:00 2001
+From cb5db71f4b2872976d2a5af247c7267d03e914da Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] chromium: Force host toolchain configuration
diff --git a/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
index 9e6a56e..42aa214 100644
--- a/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From 81e0e2bec7cda9177d5655c308dd60c20ea08ce3 Mon Sep 17 00:00:00 2001
+From 11779e40fbf007f7c77e0170adb6cc88a3ec5d74 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch
index 92110c9..0cf5c3a 100644
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch
@@ -1,4 +1,4 @@
-From 36717ceab139d7fab1f9d8889fffba139a09f80f Mon Sep 17 00:00:00 2001
+From 388b1923e6890e1bee8b0973a3374a57a90fbb6b Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 30 Mar 2017 11:37:24 +0300
 Subject: [PATCH] chromium: workaround for too long .rps file name
diff --git a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
index 43a5519..a969797 100644
--- a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 35a0ddb8fa4c1002ff6e522c72ed63116572a225 Mon Sep 17 00:00:00 2001
+From 0f3236a53f7d08ab5f2d9f02e97b037f2a7fc77e Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] Force host toolchain configuration
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index f91428e..36c835c 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From 5e88b82267d3e9fa6739640fe19aa7d8e5d18c60 Mon Sep 17 00:00:00 2001
+From 4461fe785f4c7a039b501cc8c97b08de423ccd74 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index 4d7e429..8cdf85b 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From 63c82c6127204cab5f65c26ca96cc52ce16a438a Mon Sep 17 00:00:00 2001
+From 0ac90beaf11ea7f07ca50feb5f9e19498fd89cd4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
index 9068cda..77496ba 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,4 +1,4 @@
-From eccda1ac1ffa38fe1844c6893de7919ed072e87f Mon Sep 17 00:00:00 2001
+From 39e02612e0822eda0331caeac4c9fcd10610bf57 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:37:49 -0700
 Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index 5f0da6f..c4ab56d 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From 0ec073d35ca020f77933bef83458f7ef54f0f19a Mon Sep 17 00:00:00 2001
+From 73ee545bf92ce03b367563903b5b3d5ea0fe5c18 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
 Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
index 0ccae28..ef9eb86 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From bfad34f463ba6effe1ad55b0139f858060caaac3 Mon Sep 17 00:00:00 2001
+From 972d4ce6841e29b120e631e6c16e6080f595ee43 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index 9089d09..3b91dc1 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From d9df900e4b77277fca26a0148b556aa6eea28a21 Mon Sep 17 00:00:00 2001
+From 2411f6d877ecf6d613cc7607332d9539781b800c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index b99fbf9..f39a65a 100644
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From 342d89e5d30cc99da457aceda0cfd1e2087404dd Mon Sep 17 00:00:00 2001
+From d66036da7d3944580a0f2cf9ab18a2fab402ece7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
 Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch
index 34a908c..8cd4211 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch
@@ -1,4 +1,4 @@
-From 2b395d8cdc8180c897ffc0d876fd9023dcfd6ffa Mon Sep 17 00:00:00 2001
+From d667a0d8d17f87e58220cda73dc7cb9ad701d923 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:24:49 -0700
 Subject: [PATCH] chromium: musl: Match syscalls to match musl
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index 09c288f..fc44f05 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From bc9239f4d89fb3143f76f5e44dd54b4dfa604195 Mon Sep 17 00:00:00 2001
+From fdbedcdbeff97d11b6d79d46c7d3dbeb5871fa60 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
 Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index 8a1877e..8420971 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From a15558818ed6903e0244f13dce7160f8d189389c Mon Sep 17 00:00:00 2001
+From f2ad400acf2c1f20dc9c4a903965d304589a2b93 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
 Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
index c560e55..9e3d696 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,4 +1,4 @@
-From dd2cfda84c3eac553a1be3041c01e2231af868ad Mon Sep 17 00:00:00 2001
+From c27fd437298e0d0149032be63107ab7170864513 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
diff --git a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index c1fe8c0..920c1d7 100644
--- a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From 39e0b9ab92d618b7600fc0a43ff93f4686e25c0f Mon Sep 17 00:00:00 2001
+From ef3bad289c3fab594df84090d4a75c58d88f7f6d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
diff --git a/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index 86b9d9b..107bea3 100644
--- a/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,4 +1,4 @@
-From 4c90e1270af4da7041b88b03319515ea4d60df94 Mon Sep 17 00:00:00 2001
+From 634bef4346219a8566d909778247f71556a0eabc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
 Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 9cae120..f299f6e 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -131,7 +131,7 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "56-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-allow-build-for-linux-oe-g-platform.patch \
@@ -141,7 +141,7 @@ SRC_URI += " \
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based
-# 56-based.meta-qt5.3
+# 56-based.meta-qt5.4
 SRC_URI += " \
     file://0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
     file://0002-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
@@ -164,8 +164,8 @@ SRC_URI_append_libc-musl = "\
     file://0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "bc6915f0ae19a5bd5223b2b722c4c7f684972e4f"
-SRCREV_chromium = "a83d8cdb8d8361eadb86ac48d020486f56543114"
+SRCREV_qtwebengine = "a86ac3eb0a917766897284a6404ada00bf327629"
+SRCREV_chromium = "b7a9c9bf5b6bc08ae8746b7679317a9027868681"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index f35c5d4..b26c891 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From c4e691a8dd2037d9b359e0de9d4790da9078f74e Mon Sep 17 00:00:00 2001
+From 4de28e3b349dd5d5fbecea7ee9b7af46aac60d76 Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
diff --git a/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
index 6affd2e..dabfbb5 100644
--- a/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -1,4 +1,4 @@
-From fc2773961eaa536e6a617ded7c1a972d979fa2e4 Mon Sep 17 00:00:00 2001
+From 0c2be869a8fde2a0d2e8cbe9bf093077166f0942 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 5 Jun 2015 19:55:05 -0700
 Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index bf6e26e..99f21b7 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -19,7 +19,7 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
 # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.9
-# 5.9.meta-qt5.3
+# 5.9.meta-qt5.4
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
     file://0002-Exclude-backtrace-API-for-non-glibc-libraries.patch \
@@ -87,4 +87,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "97c4a80a1282c8c3eaa343011286b76fd4838c5f"
+SRCREV = "bd0657f98aff85b9f06d85a8cf4da6a27f61a56e"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 4730752..087ce8c 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "67f6e5e282c21495794741dd2242e4965b716b96"
+SRCREV = "fc5247f669d0aecfef861191682fba5518175e34"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index e419ab6..12acc86 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "abc6a559f2369e82018568ece2b2dcce268e3777"
+SRCREV = "e00b5892ac4c658ac9e26168bc027031dcac0110"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index ed504dc..19e9eef 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "2ee45df917c1c3b93a4584d5bb3e887dba55fed8"
+SRCREV = "922a92b533edc9bbefee729a8d91b28fbe0e3945"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index cbf1cec..50a1811 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "fedfe78518ad4025d9fafbd408e448311edbc478"
+SRCREV = "757fc816578fcc9b6bf6f787327504a3b39cc533"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
-- 
2.15.1


