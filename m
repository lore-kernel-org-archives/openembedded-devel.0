Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1B172786C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 15:33:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k87so4665699wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 07:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=J0+5QmI/1Pz07RV52RKTMIMxAH3bi8reRftvRaZkhN4=;
	b=NhR73lJaQlRwjCUNC/T5yd6hetiYgwwXlA9DRO74Tt0s2G8xf4VfdpitxE/jb0Sutu
	L9eN42WLEQhUmTjkOyrrsy1XrmpP9jJcx82eOpe4itUfjB0xCeiYo6UWmAceSiKXO/zI
	yzYNAWmn1nkpHnHbms0YrKFLXhhG2txyVyvrz+Gy1OpQP4XJIEb6nLlTsJn0M9tEYah/
	9LykcwX09Id+Q/ESBQa9QuCO7MJwwY9b0gOsIA/pJ7p28pErsVoBaaXQxxkH9x0gnw/R
	bmXBh9zozKQcQc3E/DfVGw3XvT5T6F7dU75Q2yZ1GYacGjoQOk9D+M7haYBWs7An/crL
	ziFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=J0+5QmI/1Pz07RV52RKTMIMxAH3bi8reRftvRaZkhN4=;
	b=sjiioNoAJLIa1wKtpRU1k7mNYSWaSWAOYPf3UO2XTbyQrE/ZorsWTBqBXDWOcsecmP
	LgWY/GYRP5/QSaks3bWTvvI7bLjnvSGLI3XVbAu+Hv9XWsNH8IJPu31ixq3EaEqxdiuJ
	ZMahmPL4IbLyU2AQWHhy3IYdN19mlG4pAINNAIa+N16WCtsu/VPCLC4kFO8Hovr6ZObU
	NNEE4pNJj9vM5c2iiV5qS61DXG991qP9WfQrPuBZTIyawRzAaOe0ew2PUfW3EqNHeSwF
	n9gKQVyISwqEpzbLF10UbpJDDo7iA/2R3Bu5n/orHLfP572f5DvDedVKN++qzjwky8NN
	yMhQ==
X-Gm-Message-State: APf1xPBQM7lLGM44am73tU5KVl0+lVmpjBhSFYQs7Hz/2ma0cQ6XGo7v
	UypkDKTihpESXeKlGRcR6VNs2A==
X-Google-Smtp-Source: AH8x225Ich7RMI4hNmyNp7O7+xQXJpz4TTfeejnu5JQxYod7hrmkS5bAcHF2cPT1s6gAPRkm/qC/fg==
X-Received: by 10.28.206.75 with SMTP id e72mr5679753wmg.100.1519313613765;
	Thu, 22 Feb 2018 07:33:33 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 42sm351964wrx.92.2018.02.22.07.33.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 07:33:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Feb 2018 15:33:31 +0000
Message-Id: <20180222153331.20918-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-qt5][WIP][PATCH] qt5: upgrade to 5.11 Alpha
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
X-List-Received-Date: Thu, 22 Feb 2018 15:33:34 -0000

* use qtwebkit and qtwebkit-examples from dev branch, because there is
  no 5.11 branch (there isn't 5.10 as well, but because nobranch=1 in
  qt5-git.inc nobody noticed).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             | 10 ++---
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |  8 ++--
 ...2-Fix-BlenderDNA-for-clang-cross-compiler.patch |  2 +-
 recipes-qt/qt5/qt3d_git.bb                         |  6 +--
 recipes-qt/qt5/qt5-git.inc                         |  4 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  8 ++--
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  4 +-
 ...make-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch |  2 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  4 +-
 ...ump-path-length-from-256-to-512-character.patch |  6 +--
 ...-unknown-features-instead-of-erroring-out.patch |  2 +-
 ...-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch |  2 +-
 .../0007-Delete-qlonglong-and-qulonglong.patch     |  2 +-
 ...08-Replace-pthread_yield-with-sched_yield.patch |  8 ++--
 ...-Add-OE-specific-specs-for-clang-compiler.patch |  2 +-
 ...-Invert-conditional-for-defining-QT_SOCKL.patch |  6 +--
 ..._qlocale-Enable-QT_USE_FENV-only-on-glibc.patch |  4 +-
 ...mon-gcc-base.conf-Use-I-instead-of-isyste.patch |  2 +-
 .../qtbase/0013-Always-build-uic-and-qvkgen.patch  |  6 +--
 .../0014-Bootstrap-without-linkat-feature.patch    |  6 +--
 recipes-qt/qt5/qtbase_git.bb                       |  6 +--
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                     |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtgamepad_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtknx_git.bb                        |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 recipes-qt/qt5/qtmqtt_git.bb                       |  2 +-
 ...tmultimedia-fix-a-conflicting-declaration.patch |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  6 +--
 recipes-qt/qt5/qtnetworkauth_git.bb                |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 .../0001-Allow-a-tools-only-build.patch            |  2 +-
 recipes-qt/qt5/qtremoteobjects_git.bb              |  6 +--
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 ...Use-external-host-bin-path-for-cmake-file.patch |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                      |  6 +--
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialbus_git.bb                  |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 .../0001-add-noqtwebkit-configuration.patch        |  2 +-
 ...ols-cmake-allow-overriding-the-location-f.patch |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  6 +--
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 .../0001-include-sys-time.h-for-timeval.patch      |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  6 +--
 .../0001-fix-build-without-xkbcommon-evdev.patch   | 12 +++---
 recipes-qt/qt5/qtwayland_git.bb                    |  6 +--
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...quickwebengineview_p_p.h-add-include-QCol.patch |  6 +--
 ...romium-Force-host-toolchain-configuration.patch |  6 +--
 ...-dependency-to-QCoreApplication-translate.patch |  2 +-
 ...um-workaround-for-too-long-.rps-file-name.patch |  2 +-
 .../0003-Force-host-toolchain-configuration.patch  |  6 +--
 ...sl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch |  2 +-
 ...sl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch |  6 +--
 ...use-pvalloc-as-it-s-not-available-on-musl.patch |  2 +-
 ...-chromium-musl-include-fcntl.h-for-loff_t.patch |  2 +-
 .../0005-musl-link-against-libexecinfo.patch       |  2 +-
 ...sl-use-off64_t-instead-of-the-internal-__.patch |  2 +-
 ...ium-musl-linux-glibc-make-the-distinction.patch |  2 +-
 ...sl-allocator-Do-not-include-glibc_weak_sy.patch |  2 +-
 ...sl-Use-correct-member-name-__si_fields-fr.patch |  2 +-
 ...l-Define-res_ninit-and-res_nclose-for-no.patch} |  6 +--
 ...hromium-musl-Match-syscalls-to-match-musl.patch | 44 ----------------------
 ...romium-musl-Do-not-define-__sbrk-on-musl.patch} |  2 +-
 ...m-musl-Adjust-default-pthread-stack-size.patch} |  6 +--
 ...l-include-asm-generic-ioctl.h-for-TCGETS.patch} |  4 +-
 ...l-tcmalloc-Use-off64_t-insread-of-__off6.patch} |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb                  | 25 ++++++------
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  4 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     | 27 -------------
 ...ude-backtrace-API-for-non-glibc-libraries.patch | 35 -----------------
 recipes-qt/qt5/qtwebkit_git.bb                     | 11 ++----
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtwebview_git.bb                    |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 85 files changed, 156 insertions(+), 266 deletions(-)
 rename recipes-qt/qt5/qtwebengine/{0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch => 0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch} (95%)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch
 rename recipes-qt/qt5/qtwebengine/{0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch => 0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0013-chromium-musl-Adjust-default-pthread-stack-size.patch => 0012-chromium-musl-Adjust-default-pthread-stack-size.patch} (93%)
 rename recipes-qt/qt5/qtwebengine/{0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch => 0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch} (88%)
 rename recipes-qt/qt5/qtwebengine/{0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch => 0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch} (95%)
 delete mode 100644 recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
 delete mode 100644 recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index efcb82c..dbf5492 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -25,8 +25,8 @@ require qt5-git.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
-# Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-shared
-# 5.10.meta-qt5-shared.2
+# Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
+# 5.11.meta-qt5-shared.1
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -43,8 +43,8 @@ SRC_URI += "\
 "
 
 # common for qtbase-native and nativesdk-qtbase
-# Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-native
-# 5.10.meta-qt5-native.2
+# Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-native
+# 5.11.meta-qt5-native.1
 SRC_URI += " \
     file://0013-Always-build-uic-and-qvkgen.patch \
 "
@@ -211,4 +211,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "6c6ace9d23f90845fd424e474d38fe30f070775e"
+SRCREV = "17b73b0d2b8e0d643bdf13b543cc23d657a4b330"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index 66c8017..3709398 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 05562960b7a3ed7753c9a39a7032fea873fc4098 Mon Sep 17 00:00:00 2001
+From cab5a0bcf52370fede85ee02896ce1a2979d6631 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
@@ -40,12 +40,12 @@ index 8ba2d9a..e973d93 100644
  } else {
      include(assimp.pri)
 diff --git a/tools/tools.pro b/tools/tools.pro
-index 8e973ae..ad51db5 100644
+index 64f2b9f..d108e7f 100644
 --- a/tools/tools.pro
 +++ b/tools/tools.pro
 @@ -1,4 +1,4 @@
  TEMPLATE = subdirs
  QT_FOR_CONFIG += 3dcore-private
--!android:qtConfig(assimp):qtConfig(commandlineparser): \
-+!android:tools-only|qtConfig(assimp):qtConfig(commandlineparser): \
+-qtConfig(assimp):qtConfig(commandlineparser): \
++tools-only|qtConfig(assimp):qtConfig(commandlineparser): \
      SUBDIRS += qgltf
diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
index 3357fa3..68b0f33 100644
--- a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
+++ b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
@@ -1,4 +1,4 @@
-From fc23039612ab9aed4f994b4390016e71ceee8165 Mon Sep 17 00:00:00 2001
+From d6e714f9c2b1e5ed238084e254268d70d2093ae1 Mon Sep 17 00:00:00 2001
 From: Kim Kulling <kim.kulling@googlemail.com>
 Date: Mon, 7 Nov 2016 17:19:49 +0100
 Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index dbd1b27..3cbdfa5 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase"
 DEPENDS_class-target += "qtdeclarative qt3d-native"
 
-# Patches from https://github.com/meta-qt5/qt3d/commits/b5.10
-# 5.10.meta-qt5.2
+# Patches from https://github.com/meta-qt5/qt3d/commits/b5.11
+# 5.11.meta-qt5.1
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
     file://0002-Fix-BlenderDNA-for-clang-cross-compiler.patch \
@@ -37,6 +37,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "31f424bb81cd2583920d3d521e1e01f01c2d28e2"
+SRCREV = "e813fb36e782c5e0ab7c25b9c069cee709692506"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 37c742f..9698b31 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -2,7 +2,7 @@
 # Copyright (C) 2013-2018 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
-QT_MODULE_BRANCH ?= "5.10"
+QT_MODULE_BRANCH ?= "5.11"
 QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
 
 # each module needs to define valid SRCREV
@@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
 
 S = "${WORKDIR}/git"
 
-PV = "5.10.1+git${SRCPV}"
+PV = "5.10.1+5.11-alpha+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 36eeae8..cae4fe3 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -20,8 +20,8 @@ require qt5-native.inc
 require qt5-git.inc
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
-# Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-shared
-# 5.10.meta-qt5-shared.2
+# Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
+# 5.11.meta-qt5-shared.1
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -39,7 +39,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-native
-# 5.10.meta-qt5-native.2
+# 5.11.meta-qt5-native.1
 SRC_URI += " \
     file://0013-Always-build-uic-and-qvkgen.patch \
 "
@@ -137,4 +137,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "6c6ace9d23f90845fd424e474d38fe30f070775e"
+SRCREV = "17b73b0d2b8e0d643bdf13b543cc23d657a4b330"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 07fc2f7..bef6036 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 1ed7a2e9a883fe1240d89b7b70fb0f296bb2b54f Mon Sep 17 00:00:00 2001
+From 27bee79f05319c35a0538b5c876841563ecd42f6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
@@ -30,7 +30,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 08b49a8..5876721 100755
+index 9757254..add3e56 100755
 --- a/configure
 +++ b/configure
 @@ -712,7 +712,7 @@ fi
diff --git a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
index fa59883..5809845 100644
--- a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
+++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
@@ -1,4 +1,4 @@
-From c7dd4e5de1fac8c35df79a86418b6cd552024bd0 Mon Sep 17 00:00:00 2001
+From 6918a52c286a7c174f048643038bac84bfd4ad76 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
diff --git a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index cc0a330..d29d07d 100644
--- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From f1d359e60e76867cee1df636c5c834fe829f5316 Mon Sep 17 00:00:00 2001
+From e6ab481548fa56b388c6a18a11baf112bb3189dd Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index b4ba0b5..11d4c00 100644
+index 422d08f..a59df4f 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -172,7 +172,10 @@ void QLibrarySettings::load()
diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
index 5a3dfea..9de8772 100644
--- a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From cb813ec552f965208ecfc9750a0fbf10841322fb Mon Sep 17 00:00:00 2001
+From 91a51709be1af7b1b5444ea5725ad0dbcf7b2bbe Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -15,10 +15,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.pri b/configure.pri
-index ea48255..0699701 100644
+index a67860f..30c4a63 100644
 --- a/configure.pri
 +++ b/configure.pri
-@@ -796,10 +796,10 @@ defineTest(qtConfOutput_preparePaths) {
+@@ -819,10 +819,10 @@ defineTest(qtConfOutput_preparePaths) {
          "static const char qt_configure_installation     [12+11]  = \"qt_instdate=2012-12-20\";" \
          "" \
          "/* Installation Info */" \
diff --git a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
index 2e261b8..0b31a06 100644
--- a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
+++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -1,4 +1,4 @@
-From 6cd8e808e0eb8fa26976da66dd3dfdd58c1d026a Mon Sep 17 00:00:00 2001
+From bdd3fc615f2ea39dbf2c6d32e6f321582a49508d Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Mon, 24 Oct 2016 09:45:18 +0300
 Subject: [PATCH] Disable all unknown features instead of erroring out
diff --git a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index cf1a716..93404ea 100644
--- a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From e3fe48be51aa67227ac1b34c01e4c913d82866c2 Mon Sep 17 00:00:00 2001
+From abaf5cde503901aae1dc1cb1ede28a17ff51cee8 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
diff --git a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
index fd9a9e5..37914ad 100644
--- a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
+++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
@@ -1,4 +1,4 @@
-From efaae3535a1ac006ec1b3003258b83d905265fd3 Mon Sep 17 00:00:00 2001
+From 6360a89c28bf5d48914ba2f947b55270c071f1b0 Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Wed, 7 Jun 2017 21:00:49 +0900
 Subject: [PATCH] Delete qlonglong and qulonglong
diff --git a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
index 81269d2..5f9c818 100644
--- a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
+++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
@@ -1,4 +1,4 @@
-From d79fecb4e8d2040efdc295d06c5e24bdf3cf6b60 Mon Sep 17 00:00:00 2001
+From 48fb6a724a72ee28987124e238051234b8c95431 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 27 Jul 2017 08:02:51 -0700
 Subject: [PATCH] Replace pthread_yield with sched_yield
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
-index 076610a..cb8431f 100644
+index cc628ee..6b6aecc 100644
 --- a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 +++ b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 @@ -34,7 +34,7 @@
@@ -26,7 +26,7 @@ index 076610a..cb8431f 100644
  #endif
  
  #include <algorithm>
-@@ -199,7 +199,7 @@ protected:
+@@ -193,7 +193,7 @@ protected:
              const char *nm = name.constData();
              int tp = qRegisterMetaType<Bar>(nm);
  #if defined(Q_OS_LINUX) && !defined(Q_OS_ANDROID)
@@ -36,7 +36,7 @@ index 076610a..cb8431f 100644
              QMetaType info(tp);
              if (!info.isValid()) {
 diff --git a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
-index e45eda2..e64f329 100644
+index fc92ed6..e59b858 100644
 --- a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 +++ b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 @@ -78,6 +78,7 @@
diff --git a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
index c210d64..b5e1fab 100644
--- a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
+++ b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
@@ -1,4 +1,4 @@
-From aaeadb4326f1f9df7bbafa0b9fa6937504a1c035 Mon Sep 17 00:00:00 2001
+From 1b03528718e7665804c9e0443d45d43a6559034f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:11:44 -0700
 Subject: [PATCH] Add OE specific specs for clang compiler
diff --git a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
index 5fed2ff..994d6ab 100644
--- a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
+++ b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
@@ -1,4 +1,4 @@
-From 7c7545fc64e78b2a4a411aa392df6f424ee27c5a Mon Sep 17 00:00:00 2001
+From 05b42800ee62d3a25667d12dc5af3c7df860edc1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:44:48 -0700
 Subject: [PATCH] linux-clang: Invert conditional for defining QT_SOCKLEN_T
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/mkspecs/linux-clang/qplatformdefs.h b/mkspecs/linux-clang/qplatformdefs.h
-index d29225f..a0cdb57 100644
+index a818d97..959a508 100644
 --- a/mkspecs/linux-clang/qplatformdefs.h
 +++ b/mkspecs/linux-clang/qplatformdefs.h
-@@ -84,10 +84,10 @@
+@@ -81,10 +81,10 @@
  
  #undef QT_SOCKLEN_T
  
diff --git a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
index a0aaa52..84f0ccb 100644
--- a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
+++ b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
@@ -1,4 +1,4 @@
-From ba70f3ca46d921c20bebb5cb9d4b41e64bd02d8b Mon Sep 17 00:00:00 2001
+From c042f0e9d25b1f4fe53c88f0c897b89cf2f8ab9f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 10:11:50 -0700
 Subject: [PATCH] tst_qlocale: Enable QT_USE_FENV only on glibc
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
-index d424e60..3eae828 100644
+index fc1ac7c..5bb715a 100644
 --- a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
 +++ b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
 @@ -46,7 +46,7 @@
diff --git a/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch b/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
index fe1fcf5..5215130 100644
--- a/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
+++ b/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
@@ -1,4 +1,4 @@
-From 81fc64f7f3a8b0554fd8d1b96b113bc04b5f0b5c Mon Sep 17 00:00:00 2001
+From aa45912a7543d1648cde7c3a8915ba5811294ef0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Feb 2018 17:08:43 -0800
 Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of -isystem
diff --git a/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch b/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
index 3d40515..07bbd76 100644
--- a/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
+++ b/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
@@ -1,4 +1,4 @@
-From 2ea3a1612452f1dc9c2febb4ae610194f67e39d6 Mon Sep 17 00:00:00 2001
+From cfa510d03aad4e637d8956b6dc8923f80e3db36f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic and qvkgen
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index a73729a..c7668b5 100644
+index 1f7c5d9..6b39379 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -213,7 +213,7 @@ qtConfig(gui) {
+@@ -222,7 +222,7 @@ qtConfig(gui) {
          }
      }
  }
diff --git a/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch b/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
index c733c15..58bc6d8 100644
--- a/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
+++ b/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
@@ -1,4 +1,4 @@
-From 77365eda4dd1c4c26803b3f0d1f411b7416ad531 Mon Sep 17 00:00:00 2001
+From 58e3b74b86f64f67c07fedc2e3dc3b8e025ca411 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Fri, 24 Nov 2017 15:16:31 +0200
 Subject: [PATCH] Bootstrap without linkat feature
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qconfig-bootstrapped.h b/src/corelib/global/qconfig-bootstrapped.h
-index dabb715..5b4ff86 100644
+index 86ef1a2..52dc6ec 100644
 --- a/src/corelib/global/qconfig-bootstrapped.h
 +++ b/src/corelib/global/qconfig-bootstrapped.h
-@@ -88,7 +88,7 @@
+@@ -89,7 +89,7 @@
  #define QT_FEATURE_futimes -1
  #define QT_FEATURE_library -1
  #ifdef __linux__
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 6144c14..b5374b2 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = " \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
-# Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-shared
-# 5.10.meta-qt5-shared.2
+# Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
+# 5.11.meta-qt5-shared.1
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -249,4 +249,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "6c6ace9d23f90845fd424e474d38fe30f070775e"
+SRCREV = "17b73b0d2b8e0d643bdf13b543cc23d657a4b330"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index af0b118..4fed367 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "0eecd96a7b83e8b1fc2811ec366b4ca1980296e0"
+SRCREV = "80d7f92b9628076b681e509ddf8eae43cac550d5"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index a2d4ced..da0f852 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "9a4f99f518a49716cc9cc300eb456c6b13f9e8d1"
+SRCREV = "1f78a69f4f6c33393a0b43a9151c698aa3d05bbb"
 
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 32ccdce..89f9254 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "2331b915d207fe794a07b834ec2bf8578965bc4d"
+SRCREV = "d70fe2ac47dbf034991f0b2a4b0a3e1f16d171b9"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index ea0ba59..f424016 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "397e50147407c16a16b6505558992ca3180f9aff"
+SRCREV = "be7e45ca259d70d5f2ef0d11460261146fc1df95"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index d6f468f..e8042af 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "3e91062877c0853aff693799bc5e33cdf7aaad42"
+SRCREV = "0975a9c892f1cb30b9e11e6becc469a3101cc2db"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index e91754c..485a6d9 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "e6f366618dc9a3d232446197d6fea7c814e53828"
+SRCREV = "313f221381507eee36c8e3bd0069b3e7962da140"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 658420b..1be7b62 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "a38c4da7b598f5a185d7c9f824482d418353e6bf"
+SRCREV = "3e28d47cea038ca64c2e14ff449cc183c51643ce"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index d804b01..5e69926 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "892d4a0df7dccc6e70586835bb1211cf1b79bc69"
+SRCREV = "f878323a82fa69fcaeb37b42e10ba28759157f47"
diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
index 5e01e3c..24d3527 100644
--- a/recipes-qt/qt5/qtknx_git.bb
+++ b/recipes-qt/qt5/qtknx_git.bb
@@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "29c34e8f072afd01002ed3847d752b4e065f977e"
+SRCREV = "4d5a04a0793ef05ade54a09cd469c9934f102753"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 13667b2..4811887 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -30,7 +30,7 @@ SRC_URI += " \
     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "ec00ff89bee900a1b8925e227a892bc57839cd60"
+SRCREV_qtlocation = "d458bd47106dd849e6cf72b97a27f871735e4eed"
 SRCREV_qtlocation-mapboxgl = "8c1be4ec01ef46bf453856531ebf53b48ce3dbe7"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
index b705f7c..a3e6da4 100644
--- a/recipes-qt/qt5/qtmqtt_git.bb
+++ b/recipes-qt/qt5/qtmqtt_git.bb
@@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "2c3c2a41c55a179332ec2a076856990f36dd5ef9"
+SRCREV = "b61e7bd3182addd8675ae907fc681db402fb138f"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
index 4fb0f72..a9572c5 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
@@ -1,4 +1,4 @@
-From ec1740a7bce48435e65ede530e0b96593ac619ea Mon Sep 17 00:00:00 2001
+From 4d020a4b5922c5c97bec661f39d978188d503c9c Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Thu, 8 Sep 2016 12:18:13 +0800
 Subject: [PATCH] qtmultimedia: fix a conflicting declaration
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 2cb1bd5..69f713b 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -25,8 +25,8 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 # Disable GStreamer if completely disabled
 EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
 
-# Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.10
-# 5.10.meta-qt5.2
+# Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.11
+# 5.11.meta-qt5.1
 SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
@@ -35,4 +35,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "038716bb1f2d9b95f2d638e2d61d297563343af9"
+SRCREV = "0354fdda8b430f7749082ca55ad6c1dc781f3918"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index 0180376..689d85c 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -9,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "8f4f2e0cae642ff5eb0b87ae1d4e9c5e6ccf2bd8"
+SRCREV = "e8552ddaf17dad91df3a03ccfc0d708ab13d6d0e"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 85b8462..fd440b7 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -26,4 +26,4 @@ do_configure_prepend() {
 
 QT_MODULE_BRANCH = "dev"
 
-SRCREV = "b2476dcd53f0dea1e9eb38df5add3a771d64c4a1"
+SRCREV = "fa02271a18837f20e82006de23c2af1899294aa1"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index d922cd6..1ddaeb4 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "e693ad2c4ae22f8813befd5fe825c855537497ed"
+SRCREV = "e80d273e6f19ba0a6a0f4e830724a36785ef19f6"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 17dd0fc..5aa1539 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ FILES_${PN}-qmlplugins += " \
   ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
 "
 
-SRCREV = "09ebb25aa686fc3f47f860905c2abb32a95c75d1"
+SRCREV = "6c9f0bfcc4bc6511686559dd87c29cfaa3e88b33"
diff --git a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
index 19b526c..977652e 100644
--- a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 6235a3fdd0807205c818d70582033970ee008013 Mon Sep 17 00:00:00 2001
+From 2bf23e29ff3ec25e394fe1f633479013185a57d7 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 7 Jun 2017 15:17:12 +0300
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index e70579a..5d0dee1 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -11,8 +11,8 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
 
-# Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.10
-# 5.10.meta-qt5.2
+# Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.11
+# 5.11.meta-qt5.1
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
 "
@@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "61d2de26db7b90ad0ed3923b5deecd1c5b3be46a"
+SRCREV = "db6d07b4a51813e72eee474a6ee2e91438841fa7"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index d73eb44..f4b2faf 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "76bcf9b526f96edb35469e9de4b032a112a2b1c0"
+SRCREV = "781c745277f9b4faa87d341b10ec0ca46eb45a73"
diff --git a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
index e734cf3..e4c7214 100644
--- a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
+++ b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
@@ -1,4 +1,4 @@
-From f83817b29477f33ee3b4abf8468a7b01bb347d2b Mon Sep 17 00:00:00 2001
+From 550a56d5cea4ff0b332c2c4d53a0cb33ccf6102e Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 10 Jan 2017 15:28:26 +0200
 Subject: [PATCH] Use external host bin path for cmake file
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index feb333f..2fd8973 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,10 +10,10 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "d9b2f8c56d162c108d5427769a8e496dd7a3b62e"
+SRCREV = "544f8c4ef7b77c5194605cba612fdde6fa02b06b"
 
-# Patches from https://github.com/meta-qt5/qtscxml/commits/b5.10
-# 5.10.meta-qt5.2
+# Patches from https://github.com/meta-qt5/qtscxml/commits/b5.11
+# 5.11.meta-qt5.1
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
 do_install_append_class-nativesdk() {
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 09e8e8b..addfe14 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "d5a94c5595170fed9a0f7d3d42ef4b0216909d0d"
+SRCREV = "e8588efb2fbd4a31aa1e4349f03b2bc18e3c0e2b"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 85c4669..fca80af 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "d5d35d64d06729322c80327de40badaf553df87e"
+SRCREV = "7c6e9d8f29148793dc619a743a0b5d3a601ec34b"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index ddc6957..b05c93d 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "fa688ac5c36a16aa3b44d4ca1509f9386e670a89"
+SRCREV = "aee027f581839caf44de1b176099ef2b22d2fc84"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 12fcff1..2f0e98a 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "af35137016f082c3fa15e61414f3c78c73ac322f"
+SRCREV = "f4554e29a44af2cdd9e518f5931e28cf349883c6"
diff --git a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
index 7a081a1..45be54f 100644
--- a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 9557b7b0100c335b42503c3f3b6a9a193c3bf9cf Mon Sep 17 00:00:00 2001
+From 1a20dc06de52a88691dc8270d449506aa0b9d457 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
index a4909f7..5472ef5 100644
--- a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From a260d3a5b1664027e09c7de368ee5e94d22ff8bf Mon Sep 17 00:00:00 2001
+From 1a7ca3de9880a10cf4f4eb51fd3cf51e64eb5548 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index df15d88..a8728a2 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-# Patches from https://github.com/meta-qt5/qttools/commits/b5.10
-# 5.10.meta-qt5.2
+# Patches from https://github.com/meta-qt5/qttools/commits/b5.11
+# 5.11.meta-qt5.1
 SRC_URI += " \
     file://0001-add-noqtwebkit-configuration.patch \
     file://0002-linguist-tools-cmake-allow-overriding-the-location-f.patch \
@@ -29,7 +29,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "03ebf1c3d6ceae715c696a171920a0204c58dd0a"
+SRCREV = "c29a1b03fd0fe6cc3496a6a14c56f6ef3390b713"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 9535737..4c4ae00 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -111,4 +111,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "c3486e072ebc704f9c82c005044143b07bb88f12"
+SRCREV = "f1c17f060d09ea3d225803afa9f82fa22117cd3b"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
index 1e50d5a..6f5bc45 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
+++ b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
@@ -1,4 +1,4 @@
-From d479fe395566ed84cde2579011e2ca2358f22c41 Mon Sep 17 00:00:00 2001
+From c437e90e3bcf8457d300c49041f7e35fae37ebea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Jul 2017 23:59:52 -0700
 Subject: [PATCH] include sys/time.h for timeval
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 0029170..c6cc485 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
 
-# Patches from https://github.com/meta-qt5/qtvirtualkeyboard/commits/b5.10
-# 5.10.meta-qt5.2
+# Patches from https://github.com/meta-qt5/qtvirtualkeyboard/commits/b5.11
+# 5.11.meta-qt5.1
 SRC_URI += "file://0001-include-sys-time.h-for-timeval.patch"
 
 # To enabled Nuance T9 Write support, you need to provide the licensed components
@@ -53,4 +53,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "85d35bb12235dd6b92c898ddb6d6e84703d25d48"
+SRCREV = "9055bd56653d2e488b52c66d884109fcccd23c2d"
diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
index 04ae7e0..cfb2ee3 100644
--- a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
+++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
@@ -1,4 +1,4 @@
-From e41bc392aa79073926aba917796e836f5b0d9f32 Mon Sep 17 00:00:00 2001
+From 4e1945bd0867c018d06b5fa9c2dcb60619f260b2 Mon Sep 17 00:00:00 2001
 From: Raphael Freudiger <laser_b@gmx.ch>
 Date: Tue, 10 Jan 2017 15:49:55 +0100
 Subject: [PATCH] fix build without xkbcommon-evdev
@@ -26,17 +26,17 @@ index eae7ad5..0bb7b18 100644
 +
 +LIBS += -lxkbcommon
 diff --git a/src/compositor/compositor.pro b/src/compositor/compositor.pro
-index dc9000d..4eebfd6 100644
+index 47be591..805c81e 100644
 --- a/src/compositor/compositor.pro
 +++ b/src/compositor/compositor.pro
-@@ -32,3 +32,5 @@ include ($$PWD/extensions/extensions.pri)
- MODULE_PLUGIN_TYPES = \
-     wayland-graphics-integration-server
+@@ -34,3 +34,5 @@ MODULE_PLUGIN_TYPES = \
+     wayland-hardware-layer-integration \
+ 
  load(qt_module)
 +
 +LIBS += -lxkbcommon
 diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp b/src/compositor/compositor_api/qwaylandkeyboard.cpp
-index c30f7b1..e6f1a0b 100644
+index e35c0f3..45e82ca 100644
 --- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
 +++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
 @@ -349,12 +349,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 91ffcd7..272bed1 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,10 +37,10 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "db36bc0d9ccae21e84cd54be3e18ae539542eadc"
+SRCREV = "ec495c98189f1d849e793108b09b5af0ce2c8984"
 
-# Patches from https://github.com/meta-qt5/qtwayland/commits/b5.10
-# 5.10.meta-qt5.2
+# Patches from https://github.com/meta-qt5/qtwayland/commits/b5.11
+# 5.11.meta-qt5.1
 # From https://bugreports.qt.io/browse/QTBUG-57767
 SRC_URI += " \
     file://0001-fix-build-without-xkbcommon-evdev.patch \
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 2b4a487..0bcbf56 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "7540a85c82cd940b7da3ea75eccad7e733bd0ae6"
+SRCREV = "01241eb3704af785e8d98fb2f6e223ca62a64175"
diff --git a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index a324dc6..f7cbad5 100644
--- a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From a70b6d2183934e4d9a3ad00167acfaf0a78a90a9 Mon Sep 17 00:00:00 2001
+From ded0b78fe690b5c6ddfca08a098e824ed23ae80d Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,10 +9,10 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index 1b8edc8..03d6558 100644
+index 1b718a3..8c1de74 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
-@@ -59,6 +59,8 @@
+@@ -61,6 +61,8 @@
  #include <QString>
  #include <QtCore/qcompilerdetection.h>
  #include <QtGui/qaccessibleobject.h>
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
index 69e0566..3d5d286 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From d760fcdd764985f05a480ba475855f92844a6f0d Mon Sep 17 00:00:00 2001
+From 3e08f22dbe2ca570bf853b6dfad8831f21ddbe14 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] chromium: Force host toolchain configuration
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/chromium/tools/gn/bootstrap/bootstrap.py b/chromium/tools/gn/bootstrap/bootstrap.py
-index b1ff7e7..bccabbb 100755
+index 43392ef..9ef521f 100755
 --- a/chromium/tools/gn/bootstrap/bootstrap.py
 +++ b/chromium/tools/gn/bootstrap/bootstrap.py
-@@ -318,10 +318,10 @@ def write_gn_ninja(path, root_gen_dir, options):
+@@ -326,10 +326,10 @@ def write_gn_ninja(path, root_gen_dir, options):
      ld = os.environ.get('LD', cxx)
      ar = os.environ.get('AR', 'ar -X64')
    else:
diff --git a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
index e41636a..061df82 100644
--- a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From 838bb0afe93321ae3d225988728a5736cd4844fc Mon Sep 17 00:00:00 2001
+From 695e80ba773eae1d6239828b8b3218ac6584e1e1 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
index 592a30f..3e30ac5 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
@@ -1,4 +1,4 @@
-From d76853bd469881625bedc85afabc69d36ecb05ed Mon Sep 17 00:00:00 2001
+From 51313e2d2739c9a9ca5e86979e868e9bd80e9bfd Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 30 Mar 2017 11:37:24 +0300
 Subject: [PATCH] chromium: workaround for too long .rps file name
diff --git a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
index 84e430b..8cdab4b 100644
--- a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 36657d556e4f97d06aa44d874d7256c970cdad3c Mon Sep 17 00:00:00 2001
+From afbaa51b52482f71e683389e7565aceb6c59e8a6 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] Force host toolchain configuration
@@ -57,10 +57,10 @@ index dd0d3e3..70161c8 100644
  "  nm = \"$$which(nm)\" " \
  "  toolchain_args = { " \
 diff --git a/src/core/config/linux.pri b/src/core/config/linux.pri
-index 1ce3ea8..23d0793 100644
+index daac6fa..d858021 100644
 --- a/src/core/config/linux.pri
 +++ b/src/core/config/linux.pri
-@@ -91,7 +91,7 @@ contains(QT_ARCH, "mips") {
+@@ -90,7 +90,7 @@ contains(QT_ARCH, "mips") {
  
  host_build {
      gn_args += custom_toolchain=\"$$QTWEBENGINE_OUT_ROOT/src/toolchain:host\"
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index 1fb85fb..e808eb7 100644
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From c6e7171bf8f5ecb8b82d911581a45defe93854e1 Mon Sep 17 00:00:00 2001
+From 5d7080bf2001a022223c4089a199605b5f9a5cce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index 5dbd07f..359ee26 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From 104d93f24a44dc4a1939d6e2c99f346526a5a7d9 Mon Sep 17 00:00:00 2001
+From f3478cde99da29faebbdb3d13a479b50af9804fd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
@@ -32,7 +32,7 @@ index 0eb5c1f..8af7799 100644
    return 0;
  #endif
 diff --git a/chromium/base/trace_event/malloc_dump_provider.cc b/chromium/base/trace_event/malloc_dump_provider.cc
-index 14ba0a2..e5d9581 100644
+index f1cc52a..256138d 100644
 --- a/chromium/base/trace_event/malloc_dump_provider.cc
 +++ b/chromium/base/trace_event/malloc_dump_provider.cc
 @@ -197,6 +197,7 @@ MallocDumpProvider::~MallocDumpProvider() {}
@@ -43,7 +43,7 @@ index 14ba0a2..e5d9581 100644
    size_t total_virtual_size = 0;
    size_t resident_size = 0;
    size_t allocated_objects_size = 0;
-@@ -317,7 +318,7 @@ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
+@@ -316,7 +317,7 @@ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
      pmd->DumpHeapUsage(metrics_by_context, overhead, "malloc");
    }
    tid_dumping_heap_ = kInvalidThreadId;
diff --git a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch b/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
index 76160d1..e4d44f3 100644
--- a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
@@ -1,4 +1,4 @@
-From 1a23cb4027692535aeace4c6070864af672de70d Mon Sep 17 00:00:00 2001
+From ac6d09a3bb56dee9fc377f4042b23b209fd0726d Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 12 Dec 2017 16:06:14 +0200
 Subject: [PATCH] musl: don't use pvalloc as it's not available on musl
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
index e0a3f80..2af1f3c 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,4 +1,4 @@
-From 1e51c5e3a299213b632dd2d448c86dabf45b2258 Mon Sep 17 00:00:00 2001
+From 660cc2ad6e2c92e0a86948c80f356b754ecd43f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:37:49 -0700
 Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
diff --git a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch b/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
index 45a45f9..84c1cec 100644
--- a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
@@ -1,4 +1,4 @@
-From e735b0adfa9b1dcaa93e3ce65d9cc01255ab340b Mon Sep 17 00:00:00 2001
+From 52ef357f629a2c210b3b0fe13cba90fe379afee9 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 14 Dec 2017 11:28:10 +0200
 Subject: [PATCH] musl: link against libexecinfo
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index f8c4150..c07ffa4 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From f0fba131a285144c5d71dad8b98ff0f15ce454ad Mon Sep 17 00:00:00 2001
+From 80e2b20ed6aa48b692b7de585c8ea92263c99d72 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
 Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
index fbff288..6f578a0 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From 42a0586aa7040caef931db8657b2ac8d345e4dd3 Mon Sep 17 00:00:00 2001
+From 671dc6a1d7d507a81d5a53a106d72d6c14f50e13 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index d040057..1ef7e40 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From ff7af7ff21d259cfc580541b931d478e3d604f01 Mon Sep 17 00:00:00 2001
+From f1c0433093b5511dceb0cf80287d281fd24ac941 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index c2a9c8a..aba7c05 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From 74171f47edb76dc89edcc7116cd33d234e0e0490 Mon Sep 17 00:00:00 2001
+From 3789c3d611ee4fd258f85eac9d575af09791585e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
 Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
similarity index 95%
rename from recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
rename to recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index 9b27491..032ff30 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From 1781911655bddf8a8352f9bd0a7ce4867df6981b Mon Sep 17 00:00:00 2001
+From b4cc182b9cc6b6362cf4039883e4e1953357843a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
 Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 chromium/net/dns/resolv_compat.h
 
 diff --git a/chromium/net/dns/dns_config_service_posix.cc b/chromium/net/dns/dns_config_service_posix.cc
-index 088fb9b..98d0a35 100644
+index 8898f85..28530d5 100644
 --- a/chromium/net/dns/dns_config_service_posix.cc
 +++ b/chromium/net/dns/dns_config_service_posix.cc
-@@ -26,6 +26,10 @@
+@@ -28,6 +28,10 @@
  #include "net/dns/notify_watcher_mac.h"
  #include "net/dns/serial_worker.h"
  
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch
deleted file mode 100644
index 7be83c5..0000000
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ce23b6a6e5a5ebae15dedeebf7044ac9a0249a80 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jul 2017 15:24:49 -0700
-Subject: [PATCH] chromium: musl: Match syscalls to match musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- chromium/third_party/lss/linux_syscall_support.h | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/chromium/third_party/lss/linux_syscall_support.h b/chromium/third_party/lss/linux_syscall_support.h
-index 80a3e56..1e57b1a 100644
---- a/chromium/third_party/lss/linux_syscall_support.h
-+++ b/chromium/third_party/lss/linux_syscall_support.h
-@@ -794,6 +794,14 @@ struct kernel_statfs {
- #endif
- 
- 
-+#undef stat64
-+#undef fstat64
-+
-+#ifndef __NR_fstatat
-+#define __NR_fstatat __NR_fstatat64
-+#endif
-+
-+
- #if defined(__x86_64__)
- #ifndef ARCH_SET_GS
- #define ARCH_SET_GS             0x1001
-@@ -1211,6 +1219,14 @@ struct kernel_statfs {
- #ifndef __NR_fallocate
- #define __NR_fallocate          285
- #endif
-+
-+#ifndef __NR_pread
-+#define __NR_pread __NR_pread64
-+#endif
-+#ifndef __NR_pwrite
-+#define __NR_pwrite __NR_pwrite64
-+#endif
-+
- /* End of x86-64 definitions                                                 */
- #elif defined(__mips__)
- #if _MIPS_SIM == _MIPS_SIM_ABI32
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
rename to recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index e686325..6223ee5 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From a968ea31e3ac6a007fd157c61faf9f6f632d8230 Mon Sep 17 00:00:00 2001
+From e8172c5252dec386fbd95a18f2c59f08307f65c0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
 Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
similarity index 93%
rename from recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
rename to recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
index c1d6ec3..cacd623 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,4 +1,4 @@
-From a56debd9f26bacf76f0d734e98191485deba03fa Mon Sep 17 00:00:00 2001
+From 6c3233f1eec1a80bc771848af062cc92445b143b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/chromium/base/threading/platform_thread_linux.cc b/chromium/base/threading/platform_thread_linux.cc
-index 8d411ed..4b56cf3 100644
+index 9917a7b..cb40665 100644
 --- a/chromium/base/threading/platform_thread_linux.cc
 +++ b/chromium/base/threading/platform_thread_linux.cc
-@@ -175,7 +175,8 @@ void TerminateOnThread() {}
+@@ -173,7 +173,8 @@ void TerminateOnThread() {}
  
  size_t GetDefaultThreadStackSize(const pthread_attr_t& attributes) {
  #if !defined(THREAD_SANITIZER)
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
similarity index 88%
rename from recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
rename to recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index 81e71e7..d9c7601 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From 5809e73146cdf43d13aa1b3789bfc7ff2ff723af Mon Sep 17 00:00:00 2001
+From 9624b45166cd5e7976a6ecf99f2545c9cc883986 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/chromium/device/serial/serial_io_handler_posix.cc b/chromium/device/serial/serial_io_handler_posix.cc
-index 8ffba12..82fb09f 100644
+index eca131f..80a6cec 100644
 --- a/chromium/device/serial/serial_io_handler_posix.cc
 +++ b/chromium/device/serial/serial_io_handler_posix.cc
 @@ -6,6 +6,7 @@
diff --git a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
similarity index 95%
rename from recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
rename to recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index 03aa77a..f7880f8 100644
--- a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,4 +1,4 @@
-From 0aca8610a03cc100464d0d52a2c5425c52ab1e66 Mon Sep 17 00:00:00 2001
+From d723d506ff8b5e0dd1bb3f2c11805a2ec1f0b712 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
 Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index db089c1..1d1763d 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -121,10 +121,10 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "61-based"
+QT_MODULE_BRANCH_CHROMIUM = "63-based"
 
-# Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.10
-# 5.10.meta-qt5.2
+# Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.11
+# 5.11.meta-qt5.1
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
@@ -136,8 +136,8 @@ SRC_URI_append_libc-musl = "\
     file://0005-musl-link-against-libexecinfo.patch \
 "
 
-# Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/61-based
-# 61-based.meta-qt5.2
+# Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/63-based
+# 63-based.meta-qt5.1
 SRC_URI += " \
     file://0001-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
     file://0002-chromium-workaround-for-too-long-.rps-file-name.patch;patchdir=src/3rdparty \
@@ -151,16 +151,15 @@ SRC_URI_append_libc-musl = "\
     file://0007-chromium-musl-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty \
     file://0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch;patchdir=src/3rdparty \
     file://0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch;patchdir=src/3rdparty \
-    file://0010-chromium-musl-Match-syscalls-to-match-musl.patch;patchdir=src/3rdparty \
-    file://0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch;patchdir=src/3rdparty \
-    file://0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty \
-    file://0013-chromium-musl-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty \
-    file://0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch;patchdir=src/3rdparty \
-    file://0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
+    file://0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch;patchdir=src/3rdparty \
+    file://0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty \
+    file://0012-chromium-musl-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty \
+    file://0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch;patchdir=src/3rdparty \
+    file://0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "9dc8dff7a8f4d58f71d816375d49f8829f06aae5"
-SRCREV_chromium = "c858cc76099db0af82a264b3c6f921a287cfcb42"
+SRCREV_qtwebengine = "732d09331c1e4efa51501aae9bcd6924eecdd5c3"
+SRCREV_chromium = "3fa04d22883e42bd987e4f83d394a1040b410024"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 3e3e4a0..c19fecd 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -17,4 +17,6 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "a24c780b60d7d8bc00c4a48042cf7f32db777d55"
+QT_MODULE_BRANCH = "dev"
+
+SRCREV = "2d68492004bf4ba49cf58c9bd72706cb282cf59b"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
deleted file mode 100644
index f35c5d4..0000000
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From c4e691a8dd2037d9b359e0de9d4790da9078f74e Mon Sep 17 00:00:00 2001
-From: Trevor Woerner <trevor.woerner@linaro.org>
-Date: Fri, 7 Feb 2014 04:07:17 +0100
-Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
-
-Building qtwebkit causes a QA issue such that QtWebPluginProcess and
-QtWebProcess contain bad RPATHs which point into the build location. This fix
-adds a patch to not include the rpath.prf which causes this problem.
-
-Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Tools/qmake/mkspecs/features/unix/default_post.prf | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
-index fd66af6..ef754c3 100644
---- a/Tools/qmake/mkspecs/features/unix/default_post.prf
-+++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
-@@ -61,7 +61,6 @@ linux-*g++* {
-     }
- }
- 
--contains(TEMPLATE, app): CONFIG += rpath
- 
- CONFIG(debug, debug|release)|force_debug_info {
-     # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
diff --git a/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
deleted file mode 100644
index 6affd2e..0000000
--- a/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From fc2773961eaa536e6a617ded7c1a972d979fa2e4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 5 Jun 2015 19:55:05 -0700
-Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
-
-It was excluding musl with current checks, so lets make it such that it
-considers only glibc when using backtrace API
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WTF/wtf/Assertions.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Source/WTF/wtf/Assertions.cpp b/Source/WTF/wtf/Assertions.cpp
-index 1b2091f..ba03a28 100644
---- a/Source/WTF/wtf/Assertions.cpp
-+++ b/Source/WTF/wtf/Assertions.cpp
-@@ -61,7 +61,7 @@
- #include <windows.h>
- #endif
- 
--#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
-+#if (OS(DARWIN) || (OS(LINUX) && defined (__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
- #include <cxxabi.h>
- #include <dlfcn.h>
- #include <execinfo.h>
-@@ -245,7 +245,7 @@ void WTFReportArgumentAssertionFailure(const char* file, int line, const char* f
- 
- void WTFGetBacktrace(void** stack, int* size)
- {
--#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
-+#if (OS(DARWIN) || (OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
-     *size = backtrace(stack, *size);
- #elif OS(WINDOWS) && !OS(WINCE)
-     // The CaptureStackBackTrace function is available in XP, but it is not defined
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 5dee6a4..b3aa815 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -18,13 +18,6 @@ DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-# Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
-# 5.10.meta-qt5.1
-SRC_URI += "\
-    file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
-    file://0002-Exclude-backtrace-API-for-non-glibc-libraries.patch \
-"
-
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxcomposite libxrender', '', d)} \
     fontconfig \
@@ -87,4 +80,6 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "97c4a80a1282c8c3eaa343011286b76fd4838c5f"
+QT_MODULE_BRANCH = "dev"
+
+SRCREV = "beaeeb99881184fd368c121fcbb1a31c78b794a3"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 5d429ca..1e8719a 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "2160c268ec80012f86be3eef20e05c267cdd2926"
+SRCREV = "8a549aca7b371722cbf012d85216e4560ef1cf33"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index f164c6a..ceecfb0 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "7445cd28616e68af3cf5e074a5576cbe6c5bf491"
+SRCREV = "cf23a402b97b459309ec32fe49c82a845a3636af"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 443e9d5..8a98f54 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "a751298bc381b0fd0c6867e43d2613b98c2cb71f"
+SRCREV = "78a10dad08d1c354f7afb539bd89f0d75a9fe3b1"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 77d7fe2..2325eb0 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "7c4113d6e6215b26b866ed2a0da0fa5e0c12b8ea"
+SRCREV = "c892ceec1c301f12d5c276e12be0bee8fd7d4cbf"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
-- 
2.15.1


