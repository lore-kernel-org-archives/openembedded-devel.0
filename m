Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 99C5A745F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 13:36:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x4so9597432wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GVmldFnhA76zQd8zqbOA+JNu8b6rE6RmsKB3hyEx394=;
	b=sz6y25NXSBQDBQ+zvS7220MCjgpj7panuKuOKC5Q0xwvYUVXL6q11n9Kdrd8ATTQ67
	yUOmE3toqePL2U9suhCgEmBdynZB6UzgXG8/NGUKO+sdsBw339cB3EolZ9roSbVnzjdI
	6A4AhssQ8JfWyo9eicR+L0VZOXmz+On2jndz359wDK36GY7C9Q7XK9ZeHLK0V0PoL378
	8ZwpTZoH8nI8zP565jUTTsVLeXM2M9NkuW3glnU5QPLL4H69lux91G1nyaSM3G4JjOmM
	IX7ciiH9LVgb7SkLjU7IhQfwI7jCXeLycz19oBWy+pFZR1JVExD2za7WXbudIhwXHoge
	zxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GVmldFnhA76zQd8zqbOA+JNu8b6rE6RmsKB3hyEx394=;
	b=tD33PXZEWBxgXZasJJSQqAWrp7Zj0jfhZ7hCj8FOl4+l5OY/eMbzWdnsRmbjTxyv+I
	+Vsm9PYe7mBvI5D/m+N83wAzDDrxDOT7R7xE1VvfSzhOVDew+ADUM9PIeeFJbevvTSFI
	kzvY2ZEMYsLIwIx96EVgmhbxfANYBxB1txZU8EjLEKPeSUMN1GxowbXQh9RGyeHUMVdM
	K375su6ytLQVMY5pq2MLqJuxrsFK2lVPgMjU2tbPHbTiG3/9DVPRWTFgsWGX4+hrMZuC
	UM7MLTKm6U2UgwNeJTCDTopJq2yeWocTHPptvGV/U3ps0kKf/WDssN9/JFXJgjMQhaOL
	vkog==
X-Gm-Message-State: ALQs6tD3kQ5Y1Z1QFE1snMl/cb/xLb7iuTGs0lw+0vtWnUmvhzScu9T8
	aoeFVeJ1+f05pKSPH1lGAZbctg==
X-Google-Smtp-Source: AIpwx49Xo2+aBZPUFo9c2wtS9fXJDTgPe3B2xLk3kusXQKcPEmrKRoJ/CIXJBuHS6TNCfnvkIGfnGQ==
X-Received: by 10.28.139.18 with SMTP id n18mr762589wmd.26.1523540161956;
	Thu, 12 Apr 2018 06:36:01 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s65sm3270973wms.26.2018.04.12.06.36.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Apr 2018 06:36:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Apr 2018 13:35:58 +0000
Message-Id: <20180412133558.9655-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-qt5][rocko][WIP][PATCH] qt5: upgrade to 5.9.5
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
X-List-Received-Date: Thu, 12 Apr 2018 13:36:03 -0000

* use latest revision from 5.9, because 5.9.5 tag is only on 5.9.5
  branch which might get removed in future I was told

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb                            | 6 +++---
 recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch           | 2 +-
 .../qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch   | 2 +-
 recipes-qt/qt5/qt3d_git.bb                                        | 4 ++--
 recipes-qt/qt5/qtbase-native_git.bb                               | 6 +++---
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch          | 2 +-
 .../qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch  | 2 +-
 ...003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch | 2 +-
 ...004-configure-bump-path-length-from-256-to-512-character.patch | 2 +-
 ...005-Disable-all-unknown-features-instead-of-erroring-out.patch | 2 +-
 ...006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch | 2 +-
 recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch  | 2 +-
 .../qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch  | 2 +-
 .../qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch    | 2 +-
 ...010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch | 2 +-
 .../0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch       | 2 +-
 recipes-qt/qt5/qtbase/0012-Always-build-uic.patch                 | 6 +++---
 recipes-qt/qt5/qtbase_git.bb                                      | 4 ++--
 recipes-qt/qt5/qtcanvas3d_git.bb                                  | 2 +-
 recipes-qt/qt5/qtcharts_git.bb                                    | 2 +-
 recipes-qt/qt5/qtconnectivity_git.bb                              | 2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                                 | 2 +-
 recipes-qt/qt5/qtgamepad_git.bb                                   | 2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb                          | 2 +-
 recipes-qt/qt5/qtimageformats_git.bb                              | 2 +-
 recipes-qt/qt5/qtlocation_git.bb                                  | 2 +-
 .../0001-qtmultimedia-fix-a-conflicting-declaration.patch         | 2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                                | 4 ++--
 recipes-qt/qt5/qtnetworkauth_git.bb                               | 2 +-
 ...001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch | 2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb                            | 2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb                             | 4 ++--
 .../qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch       | 2 +-
 recipes-qt/qt5/qtremoteobjects_git.bb                             | 4 ++--
 recipes-qt/qt5/qtscript_git.bb                                    | 2 +-
 .../qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch  | 2 +-
 recipes-qt/qt5/qtscxml_git.bb                                     | 4 ++--
 recipes-qt/qt5/qtsensors_git.bb                                   | 2 +-
 recipes-qt/qt5/qtserialbus_git.bb                                 | 2 +-
 recipes-qt/qt5/qtserialport_git.bb                                | 2 +-
 recipes-qt/qt5/qtsvg_git.bb                                       | 2 +-
 recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch    | 2 +-
 ...002-linguist-tools-cmake-allow-overriding-the-location-f.patch | 2 +-
 recipes-qt/qt5/qttools_git.bb                                     | 4 ++--
 recipes-qt/qt5/qttranslations_git.bb                              | 2 +-
 .../qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch   | 2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb                           | 4 ++--
 .../qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch    | 2 +-
 recipes-qt/qt5/qtwayland_git.bb                                   | 4 ++--
 recipes-qt/qt5/qtwebchannel_git.bb                                | 2 +-
 ...001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch | 2 +-
 .../0001-functions.prf-allow-build-for-linux-oe-g-platform.patch  | 2 +-
 ...002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch | 2 +-
 .../0002-chromium-Force-host-toolchain-configuration.patch        | 2 +-
 .../0003-Include-dependency-to-QCoreApplication-translate.patch   | 2 +-
 .../0003-chromium-workaround-for-too-long-.rps-file-name.patch    | 2 +-
 .../qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch | 2 +-
 ...004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch | 2 +-
 ...005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch | 2 +-
 .../0006-chromium-musl-include-fcntl.h-for-loff_t.patch           | 2 +-
 ...007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch | 2 +-
 .../0008-chromium-musl-linux-glibc-make-the-distinction.patch     | 2 +-
 ...009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch | 2 +-
 ...010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch | 2 +-
 .../0011-chromium-musl-Match-syscalls-to-match-musl.patch         | 2 +-
 ...012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch | 2 +-
 .../0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch         | 2 +-
 .../0014-chromium-musl-Adjust-default-pthread-stack-size.patch    | 2 +-
 ...015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch | 2 +-
 ...016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch | 2 +-
 recipes-qt/qt5/qtwebengine_git.bb                                 | 8 ++++----
 recipes-qt/qt5/qtwebkit_git.bb                                    | 2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                                | 2 +-
 recipes-qt/qt5/qtwebview_git.bb                                   | 2 +-
 recipes-qt/qt5/qtx11extras_git.bb                                 | 2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                               | 2 +-
 76 files changed, 94 insertions(+), 94 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 5b20b0a..2b8a4d3 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -26,7 +26,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
-# 5.9.meta-qt5-shared.4
+# 5.9.meta-qt5-shared.5
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -43,7 +43,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
-# 5.9.meta-qt5-native.4
+# 5.9.meta-qt5-native.5
 SRC_URI += " \
     file://0012-Always-build-uic.patch \
 "
@@ -200,4 +200,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "0d9208cecbbd9ed08e4ffb6540729668e3bd7754"
+SRCREV = "f2095f2c66d0dae8525879f6c14165ace650e7f1"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index a0a9531..31598de 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From ab6cf59817fa72a4ac357d6132974eeb4980f662 Mon Sep 17 00:00:00 2001
+From f61a6e50fbff57b17c113a70d8c50e460831fe70 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
index 9f72106..d6875f3 100644
--- a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
+++ b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
@@ -1,4 +1,4 @@
-From 9077cda0426de08c2d4ce74bf793316171427bfc Mon Sep 17 00:00:00 2001
+From 535d2ecd0ccaae5a36d40e9b64ffa2ef32f09cdb Mon Sep 17 00:00:00 2001
 From: Kim Kulling <kim.kulling@googlemail.com>
 Date: Mon, 7 Nov 2016 17:19:49 +0100
 Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index c0a878a..19925b3 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -12,7 +12,7 @@ DEPENDS += "qtbase"
 DEPENDS_class-target += "qtdeclarative qt3d-native"
 
 # Patches from https://github.com/meta-qt5/qt3d/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
     file://0002-Fix-BlenderDNA-for-clang-cross-compiler.patch \
@@ -37,6 +37,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "02d01a68971747f01a270226f6474190736939cf"
+SRCREV = "2970ef3dacda02fdf52ac25f3b93694eb06e6f7f"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index a04aeb5..0115a97 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -21,7 +21,7 @@ require qt5-git.inc
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
-# 5.9.meta-qt5-shared.4
+# 5.9.meta-qt5-shared.5
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -38,7 +38,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
-# 5.9.meta-qt5-native.4
+# 5.9.meta-qt5-native.5
 SRC_URI += " \
     file://0012-Always-build-uic.patch \
 "
@@ -125,4 +125,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "0d9208cecbbd9ed08e4ffb6540729668e3bd7754"
+SRCREV = "f2095f2c66d0dae8525879f6c14165ace650e7f1"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 254eb12..e99a0c2 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 3e3ba87fc8158a0c11b16f72e931ca3c19eff6d9 Mon Sep 17 00:00:00 2001
+From f289763d524fb4012c95191f1ed9c5c680c33b28 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
diff --git a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
index 9684f13..5d247d1 100644
--- a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
+++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
@@ -1,4 +1,4 @@
-From 911364cfc7ce239a602aa546430efbcfcc194d04 Mon Sep 17 00:00:00 2001
+From 3ffab93bd68226b63350a38fdb64b64ab66a808b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
diff --git a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 09adc2b..e137b08 100644
--- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From d40a14e077729252146533f4d1635a66d61efd10 Mon Sep 17 00:00:00 2001
+From b3c893e8af76e64d59051401fd86acd24f4d5369 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
index ce99086..9d1f296 100644
--- a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From f3b3aa5bde4f9461dcdfbbbe32efb1741bfa1b00 Mon Sep 17 00:00:00 2001
+From 4c827328e3d654b4e179864149cb9edee1a58f53 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
diff --git a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
index c89f11d..8dade54 100644
--- a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
+++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -1,4 +1,4 @@
-From 00570dbfe9760bdc1ee0cf143ad8c34329fcd388 Mon Sep 17 00:00:00 2001
+From 6ca3f881b0d0f6feb824aad35ce85ddb3be2146b Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Mon, 24 Oct 2016 09:45:18 +0300
 Subject: [PATCH] Disable all unknown features instead of erroring out
diff --git a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index 6d877bd..9aefbf9 100644
--- a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From 4711f276a72cac060d827c909dc69e7a2def457e Mon Sep 17 00:00:00 2001
+From 9c6fc0f0e5f2da02b6b2a21c113f6b29588fc52c Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
diff --git a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
index 95870da..3d687c7 100644
--- a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
+++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
@@ -1,4 +1,4 @@
-From 7b551a4cf2502be62b42ba2374c4bf6e6224269e Mon Sep 17 00:00:00 2001
+From 70eb95bcde17f4e67b4660caa8183e24ec876102 Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Wed, 7 Jun 2017 21:00:49 +0900
 Subject: [PATCH] Delete qlonglong and qulonglong
diff --git a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
index c4e101b..71ab6ff 100644
--- a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
+++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
@@ -1,4 +1,4 @@
-From ae66a692b862b2433a59b737a1f817efd5878433 Mon Sep 17 00:00:00 2001
+From 08d705e3a5e16ba75b0ca281400bba0d85f64f77 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 27 Jul 2017 08:02:51 -0700
 Subject: [PATCH] Replace pthread_yield with sched_yield
diff --git a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
index 05d88cb..d393352 100644
--- a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
+++ b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
@@ -1,4 +1,4 @@
-From aa4792720ae1553549fa4228390251f03e6520e2 Mon Sep 17 00:00:00 2001
+From 1b576218b875cd10fcbcbd227d0011fc0bb917da Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:11:44 -0700
 Subject: [PATCH] Add OE specific specs for clang compiler
diff --git a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
index 09a7002..6e8aa73 100644
--- a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
+++ b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
@@ -1,4 +1,4 @@
-From cd179b5af4c479fa6deb6c8eace75a04848d7498 Mon Sep 17 00:00:00 2001
+From c295b6fad2183ff47c8f5c061484713f2fe44583 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:44:48 -0700
 Subject: [PATCH] linux-clang: Invert conditional for defining QT_SOCKLEN_T
diff --git a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
index 874addd..ab124fe 100644
--- a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
+++ b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
@@ -1,4 +1,4 @@
-From cac2d0666a09f7858ef2ea7d9b0bfc419c133619 Mon Sep 17 00:00:00 2001
+From 5d00d9490866ee2b3eb88463f45b7d5ea0a8654a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 10:11:50 -0700
 Subject: [PATCH] tst_qlocale: Enable QT_USE_FENV only on glibc
diff --git a/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
index 1e0b516..0cb36e1 100644
--- a/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From b7ca9eb9abd3cb0b3966519c3a34e74b5e0c6c0e Mon Sep 17 00:00:00 2001
+From 7ad9a6e116879730543ae947abef0fe74a5b0dbb Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 43fc06f..1e9d4dc 100644
+index 3e32f7e..18b268b 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -203,7 +203,7 @@ qtConfig(gui) {
+@@ -205,7 +205,7 @@ qtConfig(gui) {
          }
      }
  }
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 0e3a8ac..13f401d 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
-# 5.9.meta-qt5-shared.4
+# 5.9.meta-qt5-shared.5
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -228,4 +228,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "0d9208cecbbd9ed08e4ffb6540729668e3bd7754"
+SRCREV = "f2095f2c66d0dae8525879f6c14165ace650e7f1"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 7077dec..bdb46f8 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "6fb3a31e79731b27eccb7ff816a73df6b6b5f14c"
+SRCREV = "5b920d86dbc00f05f5679bcf8fe9ee1ba19b06f7"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 1a1424c..7a6f7a0 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "0bc38b76e2aca205a0a96cc637395652d31684ba"
+SRCREV = "47e3a4b81832932f1500c61762fb6d47e0fa8cc2"
 
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 76d8541..d6f9c06 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "6eba2055ba2cf29ab8c2cbc8de10a1533b6404cc"
+SRCREV = "b88b57c56b14c88dce83d7c267b5d52d18fd784a"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 41b1c10..aa1daeb 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "66315056141a6c51329f66cdabb9bf1f83f6f918"
+SRCREV = "c3c6e604ee1193deb1bbff8e6f26ea2aeefdbe91"
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index d5f7592..e07cc99 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "992c0825c5bd56a0051b2ffdcd7f7c3458c2ae4f"
+SRCREV = "d1054b8e44d17ecbfae3cd455e07d6c379ef099a"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index ec54ba3..6df632f 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "5d6bcaddf72093b29b4811b60ae663a7705bd95a"
+SRCREV = "c9a0a0f661d5ce789e5ab6743782afa463dd289a"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index cba83d1..bef03e0 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "3c607b324ffbf84ce9803d80a04c7d663e847496"
+SRCREV = "bcc376e41f1e99a16bcf9c86b0d8112dd2010b52"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 0235620..0af3946 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,7 +29,7 @@ SRC_URI += " \
     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "a34e08740d55b606bbaa4963a3ba9887459fd8ce"
+SRCREV_qtlocation = "4f8604bf7a94e64f40f5bb769d2105ca4e2f8e9b"
 SRCREV_qtlocation-mapboxgl = "8c1be4ec01ef46bf453856531ebf53b48ce3dbe7"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
index ae3f2e3..0bcac42 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
@@ -1,4 +1,4 @@
-From aaa3d0e57ea0eea6dbd4179eecc3756fdddc0681 Mon Sep 17 00:00:00 2001
+From bf2fa82b9ee1a9ab38ddbcdd68327bb5aed06c12 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Thu, 8 Sep 2016 12:18:13 +0800
 Subject: [PATCH] qtmultimedia: fix a conflicting declaration
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index f0ac483..0268c87 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -26,7 +26,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
 
 # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
@@ -35,4 +35,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "d83467be15486090ee23709dc325c2c28d34c0cd"
+SRCREV = "01fd723848fd6007b03c27edd85d8e9c6b6ce881"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index 1a74347..7c89245 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -9,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "eee494c12a70fa0aa6fce427f47f44ff60281dca"
+SRCREV = "92f6d5d612ec3f6ef702ab55d4887c7b06883bc8"
diff --git a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
index 7e6fb79..42156dc 100644
--- a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
+++ b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
@@ -1,4 +1,4 @@
-From ae3bedf79b92ab4ce4d14f8738733cbd854f8902 Mon Sep 17 00:00:00 2001
+From 6af3818fd0008327839d27ab58cf2af5fa3bcce6 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:57:01 -0400
 Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class QDebug'
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 9d13bbe..8c8402e 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "99264fcfb98c01040a1edccba70ce7c268c41de4"
+SRCREV = "9a2950600087b0784b06b0521b409fce69960a2d"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 266e570..14b465a 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -23,9 +23,9 @@ FILES_${PN}-qmlplugins += " \
 "
 
 # Patches from https://github.com/meta-qt5/qtquickcontrols/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "8da20ddef88cb48b7bb09ff7dc1db6517add8e72"
+SRCREV = "75e9561d4fdf8e94c6d556b9a37bdccdaaf80c10"
diff --git a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
index 218248d..4a49b62 100644
--- a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 584e2655314113893eae91e79368fc7bc7ed3a29 Mon Sep 17 00:00:00 2001
+From a83e4f796c44cda70ac839f5cd545e88097c8e91 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 7 Jun 2017 15:17:12 +0300
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index cdc11fb..8673901 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -12,7 +12,7 @@ require qt5-git.inc
 DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
 
 # Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
 "
@@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "286f3c626087635cb24708b8e42b1d8af0401640"
+SRCREV = "7aef155a56954da9cb29b36672b0ef7e8727010a"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 0ee39af..e2d5225 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "8399cdfbaf2aceab9c22fdcb10d2369ddb39b5df"
+SRCREV = "945a4b0ad718a3462660a9782d0a78974a0d8cb9"
diff --git a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
index 8666255..36a6d03 100644
--- a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
+++ b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
@@ -1,4 +1,4 @@
-From abb8a52ae86ab62c88b4423823ae6104255cddff Mon Sep 17 00:00:00 2001
+From c9886590333dce8a1dd1e198f5449bb841033bc8 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 10 Jan 2017 15:28:26 +0200
 Subject: [PATCH] Use external host bin path for cmake file
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index 8f2ec1d..78f4459 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,10 +10,10 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "6950e4cf63a575925b829a8ca7424c55dac77066"
+SRCREV = "e5bfed810cdceedb8b7597d03c9649cddf9a5f3f"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
 do_install_append_class-nativesdk() {
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 44251c3..2017e00 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "e94bbed18aaa4461af68727fb9a41076b4669676"
+SRCREV = "b50891d2d5c8677622eba5f2bb86af7be093c434"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index fdc07e0..7b86b4e 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "6e3e86f947fcbdf19cfad5d9cc6407f3a9e3f51e"
+SRCREV = "5165c67091da4438f2d37290f6c5855250d87eb0"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index c39d996..dae4e0a 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "f1b44e67578b38732668c75b2549e4a8f9ea3f91"
+SRCREV = "e40bf5347cb9298cafdb1004366ab436c1493cfe"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index bffc388..54268bf 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "fc81943b3eb88227b9fa0a5e8afaaad65d3174fc"
+SRCREV = "24273f154a4e4930d233e6711cbf718887576002"
diff --git a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
index 9bf5204..f7ada98 100644
--- a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From b9fc247bbb1e65f558da7924b452965b5b7fbf59 Mon Sep 17 00:00:00 2001
+From fcbe797b61e624e5859dabfbe932ace2e8022649 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 98f97a2..7abc9ea 100644
--- a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From 0c6740c11fb24d592d2506424ccc1ad2aa07ca30 Mon Sep 17 00:00:00 2001
+From f7102d4e5c5c1d9e285b6821e18fff7c2dcea9c0 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index a95771f..1f24d29 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -16,7 +16,7 @@ inherit ptest
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 # Patches from https://github.com/meta-qt5/qttools/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 SRC_URI += " \
     file://run-ptest \
     file://0001-add-noqtwebkit-configuration.patch \
@@ -31,7 +31,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "98f8f4971e6c2ffcb0ac5793ffe834197ab034ab"
+SRCREV = "0c112f5980a39d370a90c34f8dfb778a6bd6a780"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index eb89e71..59949cf 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -111,4 +111,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "b3684346bd60983cecf2524f9f8081df514b5cb0"
+SRCREV = "23cc9020b9ed8a39d217d391d052bed62c1ed0cb"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
index 93ce333..185bf50 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
+++ b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
@@ -1,4 +1,4 @@
-From 0b2ce7eb5be73947cc87435a81425a95f50736d8 Mon Sep 17 00:00:00 2001
+From c41773c12767dc6735cda8f8ad3d09454366283b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Jul 2017 23:59:52 -0700
 Subject: [PATCH] include sys/time.h for timeval
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 41c96d0..e5906d6 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 # Patches from https://github.com/meta-qt5/qtvirtualkeyboard/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 SRC_URI += "file://0001-include-sys-time.h-for-timeval.patch"
 
 # To enabled Nuance T9 Write support, you need to provide the licensed components
@@ -53,4 +53,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "e078c5e237142270f5d85a22a1e8adc969668695"
+SRCREV = "5c9ce0adf6ef8b28bc6196326f711a9d039738ea"
diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
index d44396f..b2ff754 100644
--- a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
+++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
@@ -1,4 +1,4 @@
-From 04cab2db5b179f0ff3a223385e7505f9756fbb3c Mon Sep 17 00:00:00 2001
+From c9c02d1a7d48f97bcbf85dca884e65b6ed3ec7c1 Mon Sep 17 00:00:00 2001
 From: Raphael Freudiger <laser_b@gmx.ch>
 Date: Tue, 10 Jan 2017 15:49:55 +0100
 Subject: [PATCH] fix build without xkbcommon-evdev
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 9466d28..e29bc94 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,10 +37,10 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "83db09bd0acaafb256880e3a217ed9df0641a00a"
+SRCREV = "51b84d998b03cb95b6496e85d804e2788fc122d7"
 
 # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 # From https://bugreports.qt.io/browse/QTBUG-57767
 SRC_URI += " \
     file://0001-fix-build-without-xkbcommon-evdev.patch \
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index a6d5877..a3d061a 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "2661593df95b8a5a56af0a8fd22af5be7f7ea8fb"
+SRCREV = "a9f8d06fe1a7e98f1fa38d8df1627dc66dc92c21"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index e5ecb92..90a557f 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,4 +1,4 @@
-From 7dff6e15ab7347867ff32cbabe5b1836d2b9567b Mon Sep 17 00:00:00 2001
+From 78a0bfb1026cd1a66e25663266896db6920636b9 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
 Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 2cd90cd..aa223e1 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 5de61b012625e73a9c487c8e679a64b82d7eda81 Mon Sep 17 00:00:00 2001
+From 7efbed6af08caf6ce2bedbb8fb653b60c3aaa920 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
diff --git a/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 8f8ebf5..94fa5a6 100644
--- a/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From 3ab41eb0e6afd0f8a9196da93ec43f0be755f84f Mon Sep 17 00:00:00 2001
+From fe4d996a8a6fe8e0c6b720ff30fa7bff95df2acb Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
index a5ccbf1..a2eeee1 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From cb5db71f4b2872976d2a5af247c7267d03e914da Mon Sep 17 00:00:00 2001
+From 7233c121fedcf73d10499afedd19c5e45ae0e4ec Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] chromium: Force host toolchain configuration
diff --git a/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
index 42aa214..a61161d 100644
--- a/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From 11779e40fbf007f7c77e0170adb6cc88a3ec5d74 Mon Sep 17 00:00:00 2001
+From 4e95d44468ed954d68402c585c6df3c6cd6c5638 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch
index 0cf5c3a..5d44489 100644
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch
@@ -1,4 +1,4 @@
-From 388b1923e6890e1bee8b0973a3374a57a90fbb6b Mon Sep 17 00:00:00 2001
+From b220fb26cdcc7b3b9d2762c46b8e7604f3120cc3 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 30 Mar 2017 11:37:24 +0300
 Subject: [PATCH] chromium: workaround for too long .rps file name
diff --git a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
index a969797..d85f46f 100644
--- a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 0f3236a53f7d08ab5f2d9f02e97b037f2a7fc77e Mon Sep 17 00:00:00 2001
+From dbcfd868d551beb55a9411c26912050ea278ec48 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] Force host toolchain configuration
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index 36c835c..52d5143 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From 4461fe785f4c7a039b501cc8c97b08de423ccd74 Mon Sep 17 00:00:00 2001
+From 6d7823f7bd60aa63aa11b4c6ac9d8814122e8396 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index 8cdf85b..f1e633c 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From 0ac90beaf11ea7f07ca50feb5f9e19498fd89cd4 Mon Sep 17 00:00:00 2001
+From 5e4ef7189876b1e2578f12824ad7b0405768f517 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
index 77496ba..6f58299 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,4 +1,4 @@
-From 39e02612e0822eda0331caeac4c9fcd10610bf57 Mon Sep 17 00:00:00 2001
+From d36b3a2fdc5aa94b4dd03bcb509f64e8722fae9d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:37:49 -0700
 Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index c4ab56d..3b96e06 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From 73ee545bf92ce03b367563903b5b3d5ea0fe5c18 Mon Sep 17 00:00:00 2001
+From 536f4a41ea30faabac84ff5bd62b51238ba1cdc7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
 Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
index ef9eb86..77e896d 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From 972d4ce6841e29b120e631e6c16e6080f595ee43 Mon Sep 17 00:00:00 2001
+From 7336279ff0cca9216a095dcabf8872418372ee42 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index 3b91dc1..498b04d 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From 2411f6d877ecf6d613cc7607332d9539781b800c Mon Sep 17 00:00:00 2001
+From 51c5ff669beda6efec97f28bf6c94329e193eafd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index f39a65a..37da85e 100644
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From d66036da7d3944580a0f2cf9ab18a2fab402ece7 Mon Sep 17 00:00:00 2001
+From 79ba4e54de16b6ef69ed4561edc694c0f4b77e5c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
 Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch
index 8cd4211..d713d3a 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch
@@ -1,4 +1,4 @@
-From d667a0d8d17f87e58220cda73dc7cb9ad701d923 Mon Sep 17 00:00:00 2001
+From a8af55b0070d9cd9e80ccc8535437435d7f3960c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:24:49 -0700
 Subject: [PATCH] chromium: musl: Match syscalls to match musl
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index fc44f05..2258a50 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From fdbedcdbeff97d11b6d79d46c7d3dbeb5871fa60 Mon Sep 17 00:00:00 2001
+From 2268eab4b28c1817a2ecd69c27730f9a46807e93 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
 Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index 8420971..e4df9f6 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From f2ad400acf2c1f20dc9c4a903965d304589a2b93 Mon Sep 17 00:00:00 2001
+From 8d4ab971e015059b3509dff4e7b7ff0382c2c6fa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
 Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
index 9e3d696..bec98b0 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,4 +1,4 @@
-From c27fd437298e0d0149032be63107ab7170864513 Mon Sep 17 00:00:00 2001
+From 5a83638e13e6d5b1d8aa401af12dbe29bcea8cda Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
diff --git a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index 920c1d7..13ecb95 100644
--- a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From ef3bad289c3fab594df84090d4a75c58d88f7f6d Mon Sep 17 00:00:00 2001
+From 4394020a7bfbac6fb78cf498f7bdaa9adf153707 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
diff --git a/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index 107bea3..d4bdc8b 100644
--- a/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,4 +1,4 @@
-From 634bef4346219a8566d909778247f71556a0eabc Mon Sep 17 00:00:00 2001
+From 5e2fae4322189dc359c469fed55c7fadbf46418e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
 Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index f299f6e..e8f44c5 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -131,7 +131,7 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "56-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-allow-build-for-linux-oe-g-platform.patch \
@@ -141,7 +141,7 @@ SRC_URI += " \
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based
-# 56-based.meta-qt5.4
+# 56-based.meta-qt5.5
 SRC_URI += " \
     file://0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
     file://0002-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
@@ -164,8 +164,8 @@ SRC_URI_append_libc-musl = "\
     file://0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "a86ac3eb0a917766897284a6404ada00bf327629"
-SRCREV_chromium = "b7a9c9bf5b6bc08ae8746b7679317a9027868681"
+SRCREV_qtwebengine = "7af0066e50aa4c73cadafe2d47bc368a5b0187f6"
+SRCREV_chromium = "4f2e755be232c9083108e55a30876a19b67e25d4"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 99f21b7..3cce567 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -19,7 +19,7 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
 # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.9
-# 5.9.meta-qt5.4
+# 5.9.meta-qt5.5
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
     file://0002-Exclude-backtrace-API-for-non-glibc-libraries.patch \
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 087ce8c..ebf8a53 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "fc5247f669d0aecfef861191682fba5518175e34"
+SRCREV = "74ea21a46daa8c8e3c1814ec517e360cb9503a9e"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index 12acc86..e60cc20 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "e00b5892ac4c658ac9e26168bc027031dcac0110"
+SRCREV = "4acd68bc1c8b97c3764442d95515c10d226e564b"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 19e9eef..57f8d85 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "922a92b533edc9bbefee729a8d91b28fbe0e3945"
+SRCREV = "4644f175b9abbe770818a77e058f08b888f6e8b7"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 50a1811..3787b86 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "757fc816578fcc9b6bf6f787327504a3b39cc533"
+SRCREV = "3444bfc8039c5090b02fd7f98abe8064a73019d7"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
-- 
2.15.1


