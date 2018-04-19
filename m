Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4169071C7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 06:34:37 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v60-v6so10735741wrc.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 23:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=k1q/49l5C4IaO4jrQTzFYRn5tW/dVpajYdBi1DlymCA=;
	b=E+JqnG4V1zOcD7oD0/AW6wcOF3IG49XfbrfMyvyQftLyb/BH73DL915kUzkJhPGK70
	ogwxsPz6l9vOsxCstYc92xDpY5bghLKEGFsihOf2Dw8/xXM3Tlv8uC2L7EA7wJNFNnTG
	8rXYx+LPrUwA3wpFacatEhl9qdrQxObDtlOOiQ21ILWbppnXC9n54IefJxQjOrFjKKnr
	TOB8p/NjW5MxtbeQmwPRPBH+z+qKNBFu7WSXy5ZcMm0AMDb1TopIMBxyAMSu+MNvaD/1
	hKTErBd9nIDRN1arSV2uuXwJjexoHtEoOxkxJ0p79KYeAtaB25uozV7a6IYsaMSOBTFY
	DRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k1q/49l5C4IaO4jrQTzFYRn5tW/dVpajYdBi1DlymCA=;
	b=NOExxUY6m+CRexlfbN3Squghpqztesw7SdFe9PZR01Z/KY8mNd356z/hACB77T+1l8
	7VO/VsRRV9OpDuoKJxYUI30GYQi5edXgN3N819oymMjmXOOJ8RrwP2KqvOhLglUTskhw
	ioqCmKA6S0N2AiWxVgxl7Y6DksIrhX5EatjNQPgohbxiAHhR9PKHnLMrGUCGU3Q1M20V
	bZENPo8VG8L7CNO1LhLS5lImdnK/heLTx5fJr/+J/E3QNd5XQVXTE1LmkAFVT/QmK8od
	qCAPird4RvE2Bv+2dPPnFUmP/IfOeyopom5uPFrlpZu7QBcNHKnZpvWc5wS8YlTdw+Sn
	8/Gg==
X-Gm-Message-State: ALQs6tBR+tk2hsycNhmJtDFYNGjki62fMDct3vd8IE8hYJD0Ri3PRtjM
	7w/3SVFvwnwJMY7bECMYv8YKUg==
X-Google-Smtp-Source: AIpwx4+uUYFBdf/j36DOJDfcLX+c5gRx7AjpSp+71oFSZg4Bb3Wx8Qu1cjjaSid77SFxlEIyZUOuxw==
X-Received: by 2002:adf:9ec9:: with SMTP id
	b9-v6mr3508856wrf.215.1524119677674; 
	Wed, 18 Apr 2018 23:34:37 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k28-v6sm5003670wrk.96.2018.04.18.23.34.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Apr 2018 23:34:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Apr 2018 06:34:32 +0000
Message-Id: <20180419063433.4985-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-qt5][WIP][PATCH 1/2] qt5: upgrade to 5.11 beta3+
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
X-List-Received-Date: Thu, 19 Apr 2018 06:34:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb        | 11 +++--
 .../qt3d/0001-Allow-a-tools-only-build.patch  |  2 +-
 ...-BlenderDNA-for-clang-cross-compiler.patch | 44 -------------------
 recipes-qt/qt5/qt3d_git.bb                    |  5 +--
 recipes-qt/qt5/qt5-git.inc                    |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb           | 11 +++--
 .../qtbase/0001-Add-linux-oe-g-platform.patch |  4 +-
 ...Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch |  4 +-
 ...ow-to-set-qt.conf-from-the-outside-u.patch |  2 +-
 ...ath-length-from-256-to-512-character.patch |  6 +--
 ...own-features-instead-of-erroring-out.patch |  6 +--
 ...-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch | 14 +++---
 ...0007-Delete-qlonglong-and-qulonglong.patch |  2 +-
 ...place-pthread_yield-with-sched_yield.patch |  6 +--
 ...OE-specific-specs-for-clang-compiler.patch |  2 +-
 ...rt-conditional-for-defining-QT_SOCKL.patch |  2 +-
 ...ale-Enable-QT_USE_FENV-only-on-glibc.patch |  4 +-
 ...cc-base.conf-Use-I-instead-of-isyste.patch |  2 +-
 .../0013-Always-build-uic-and-qvkgen.patch    |  2 +-
 ...014-Bootstrap-without-linkat-feature.patch |  8 ++--
 recipes-qt/qt5/qtbase_git.bb                  | 11 ++---
 recipes-qt/qt5/qtcanvas3d_git.bb              |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb          |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb             |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb           |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb      |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb          |  2 +-
 recipes-qt/qt5/qtknx_git.bb                   |  2 +-
 recipes-qt/qt5/qtlocation_git.bb              |  2 +-
 recipes-qt/qt5/qtmqtt_git.bb                  |  2 +-
 ...imedia-fix-a-conflicting-declaration.patch |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb            |  4 +-
 recipes-qt/qt5/qtnetworkauth_git.bb           |  2 +-
 recipes-qt/qt5/qtpurchasing_git.bb            |  2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb        |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb         |  2 +-
 .../0001-Allow-a-tools-only-build.patch       |  2 +-
 recipes-qt/qt5/qtremoteobjects_git.bb         |  4 +-
 recipes-qt/qt5/qtscript_git.bb                |  2 +-
 ...xternal-host-bin-path-for-cmake-file.patch |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                 |  4 +-
 recipes-qt/qt5/qtsensors_git.bb               |  2 +-
 recipes-qt/qt5/qtserialbus_git.bb             |  2 +-
 recipes-qt/qt5/qtserialport_git.bb            |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                   |  2 +-
 .../0001-add-noqtwebkit-configuration.patch   |  2 +-
 ...make-allow-overriding-the-location-f.patch |  2 +-
 recipes-qt/qt5/qttools_git.bb                 |  4 +-
 recipes-qt/qt5/qttranslations_git.bb          |  2 +-
 .../0001-include-sys-time.h-for-timeval.patch | 25 -----------
 recipes-qt/qt5/qtvirtualkeyboard_git.bb       |  6 +--
 ...01-fix-build-without-xkbcommon-evdev.patch |  8 ++--
 recipes-qt/qt5/qtwayland_git.bb               | 10 ++---
 ...webengineview_p_p.h-add-include-QCol.patch |  4 +-
 ...m-Force-host-toolchain-configuration.patch |  6 +--
 ...ndency-to-QCoreApplication-translate.patch |  2 +-
 ...rkaround-for-too-long-.rps-file-name.patch |  6 +--
 ...3-Force-host-toolchain-configuration.patch |  6 +--
 ...ndbox-Define-TEMP_FAILURE_RETRY-if-n.patch |  2 +-
 ...oid-mallinfo-APIs-on-non-glibc-linux.patch | 16 +++----
 ...valloc-as-it-s-not-available-on-musl.patch |  2 +-
 ...mium-musl-include-fcntl.h-for-loff_t.patch |  2 +-
 .../0005-musl-link-against-libexecinfo.patch  |  2 +-
 ...e-off64_t-instead-of-the-internal-__.patch |  2 +-
 ...usl-linux-glibc-make-the-distinction.patch |  2 +-
 ...locator-Do-not-include-glibc_weak_sy.patch |  6 +--
 ...e-correct-member-name-__si_fields-fr.patch |  2 +-
 ...fine-res_ninit-and-res_nclose-for-no.patch |  6 +--
 ...um-musl-Do-not-define-__sbrk-on-musl.patch |  2 +-
 ...sl-Adjust-default-pthread-stack-size.patch |  2 +-
 ...clude-asm-generic-ioctl.h-for-TCGETS.patch |  4 +-
 ...malloc-Use-off64_t-insread-of-__off6.patch |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb             | 12 ++---
 recipes-qt/qt5/qtwebsockets_git.bb            |  2 +-
 recipes-qt/qt5/qtwebview_git.bb               |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb             |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb           |  2 +-
 78 files changed, 141 insertions(+), 220 deletions(-)
 delete mode 100644 recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
 delete mode 100644 recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index da0adbe..4189603 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -6,14 +6,13 @@ HOMEPAGE = "http://qt-project.org"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=fb91571854638f10b2e5f36562661a5a \
-    file://LICENSE.LGPLv3;md5=a909b94c1c9674b2aa15ff03a86f518a \
+    file://LICENSE.LGPLv3;md5=86d02ed8764e77c1c0b194fde895a51b \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.PREVIEW.COMMERCIAL;md5=8ee24b8d305ef7779e07647a7b70e1bc \
 "
 
 QT_MODULE = "qtbase"
@@ -26,7 +25,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
-# 5.11.meta-qt5-shared.1
+# 5.11.meta-qt5-shared.2
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -44,7 +43,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-native
-# 5.11.meta-qt5-native.1
+# 5.11.meta-qt5-native.2
 SRC_URI += " \
     file://0013-Always-build-uic-and-qvkgen.patch \
 "
@@ -211,4 +210,4 @@ fakeroot do_generate_qt_environment_file() {
 do_generate_qt_environment_file[umask] = "022"
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "17b73b0d2b8e0d643bdf13b543cc23d657a4b330"
+SRCREV = "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index 3709398..30d32b4 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From cab5a0bcf52370fede85ee02896ce1a2979d6631 Mon Sep 17 00:00:00 2001
+From 0fc2916634a213f38b81ae74160136cf384f6166 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
deleted file mode 100644
index 68b0f33..0000000
--- a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d6e714f9c2b1e5ed238084e254268d70d2093ae1 Mon Sep 17 00:00:00 2001
-From: Kim Kulling <kim.kulling@googlemail.com>
-Date: Mon, 7 Nov 2016 17:19:49 +0100
-Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/assimp/code/BlenderDNA.cpp | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/3rdparty/assimp/code/BlenderDNA.cpp b/src/3rdparty/assimp/code/BlenderDNA.cpp
-index 18ec9f2..5b0b209 100644
---- a/src/3rdparty/assimp/code/BlenderDNA.cpp
-+++ b/src/3rdparty/assimp/code/BlenderDNA.cpp
-@@ -55,10 +55,10 @@ using namespace Assimp::Formatter;
- 
- bool match4(StreamReaderAny& stream, const char* string) {
-     char tmp[] = {
--        (stream).GetI1(),
--        (stream).GetI1(),
--        (stream).GetI1(),
--        (stream).GetI1()
-+        (const char)(stream).GetI1(),
-+        (const char)(stream).GetI1(),
-+        (const char)(stream).GetI1(),
-+        (const char)(stream).GetI1()
-     };
-     return (tmp[0]==string[0] && tmp[1]==string[1] && tmp[2]==string[2] && tmp[3]==string[3]);
- }
-@@ -345,10 +345,10 @@ void SectionParser :: Next()
-     stream.SetCurrentPos(current.start + current.size);
- 
-     const char tmp[] = {
--        stream.GetI1(),
--        stream.GetI1(),
--        stream.GetI1(),
--        stream.GetI1()
-+        (const char)stream.GetI1(),
-+        (const char)stream.GetI1(),
-+        (const char)stream.GetI1(),
-+        (const char)stream.GetI1()
-     };
-     current.id = std::string(tmp,tmp[3]?4:tmp[2]?3:tmp[1]?2:1);
- 
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 3cbdfa5..6b5ddeb 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -12,10 +12,9 @@ DEPENDS += "qtbase"
 DEPENDS_class-target += "qtdeclarative qt3d-native"
 
 # Patches from https://github.com/meta-qt5/qt3d/commits/b5.11
-# 5.11.meta-qt5.1
+# 5.11.meta-qt5.2
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
-    file://0002-Fix-BlenderDNA-for-clang-cross-compiler.patch \
 "
 
 PACKAGECONFIG ??= ""
@@ -37,6 +36,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "e813fb36e782c5e0ab7c25b9c069cee709692506"
+SRCREV = "6d73c51d44d10925a05804cd8e70978f155643df"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 9698b31..ae7394c 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
 
 S = "${WORKDIR}/git"
 
-PV = "5.10.1+5.11-alpha+git${SRCPV}"
+PV = "5.10.1+5.11-beta3+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 52b0148..d6c53ad 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -6,14 +6,13 @@ HOMEPAGE = "http://qt-project.org"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=fb91571854638f10b2e5f36562661a5a \
-    file://LICENSE.LGPLv3;md5=a909b94c1c9674b2aa15ff03a86f518a \
+    file://LICENSE.LGPLv3;md5=86d02ed8764e77c1c0b194fde895a51b \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.PREVIEW.COMMERCIAL;md5=8ee24b8d305ef7779e07647a7b70e1bc \
 "
 
 require qt5-native.inc
@@ -21,7 +20,7 @@ require qt5-git.inc
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
-# 5.11.meta-qt5-shared.1
+# 5.11.meta-qt5-shared.2
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -39,7 +38,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-native
-# 5.11.meta-qt5-native.1
+# 5.11.meta-qt5-native.2
 SRC_URI += " \
     file://0013-Always-build-uic-and-qvkgen.patch \
 "
@@ -136,4 +135,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "17b73b0d2b8e0d643bdf13b543cc23d657a4b330"
+SRCREV = "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index bef6036..dbb0b9d 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 27bee79f05319c35a0538b5c876841563ecd42f6 Mon Sep 17 00:00:00 2001
+From 6a84c4a36742716b5db715c2538901f37ff8b1c5 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
@@ -30,7 +30,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 9757254..add3e56 100755
+index 2830a1b..6445dc2 100755
 --- a/configure
 +++ b/configure
 @@ -712,7 +712,7 @@ fi
diff --git a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
index 5809845..5c23052 100644
--- a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
+++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
@@ -1,4 +1,4 @@
-From 6918a52c286a7c174f048643038bac84bfd4ad76 Mon Sep 17 00:00:00 2001
+From 7c0c897d0d534bfc9183f9da1d9b280e709b0917 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
@@ -19,7 +19,7 @@ Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index 545b9a3..c991a9b 100644
+index e0652fd..215f435 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
diff --git a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index d29d07d..d0d5390 100644
--- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From e6ab481548fa56b388c6a18a11baf112bb3189dd Mon Sep 17 00:00:00 2001
+From d52e2787db887056eed59b9020f1ca625cffa2e4 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
index 9de8772..e806fab 100644
--- a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 91a51709be1af7b1b5444ea5725ad0dbcf7b2bbe Mon Sep 17 00:00:00 2001
+From eb7df134dff6991cf9d84ea0c8313dfa1f2cc4dc Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -15,10 +15,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.pri b/configure.pri
-index a67860f..30c4a63 100644
+index 0512ef0..8a53223 100644
 --- a/configure.pri
 +++ b/configure.pri
-@@ -819,10 +819,10 @@ defineTest(qtConfOutput_preparePaths) {
+@@ -817,10 +817,10 @@ defineTest(qtConfOutput_preparePaths) {
          "static const char qt_configure_installation     [12+11]  = \"qt_instdate=2012-12-20\";" \
          "" \
          "/* Installation Info */" \
diff --git a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
index 0b31a06..88967e7 100644
--- a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
+++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -1,4 +1,4 @@
-From bdd3fc615f2ea39dbf2c6d32e6f321582a49508d Mon Sep 17 00:00:00 2001
+From a1799db5d1b2e2e7d47c37872e887dfab4b4974a Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Mon, 24 Oct 2016 09:45:18 +0300
 Subject: [PATCH] Disable all unknown features instead of erroring out
@@ -10,10 +10,10 @@ Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_configure.prf
-index d5dcda2..501151d 100644
+index 6e29eaa..de8c8d2 100644
 --- a/mkspecs/features/qt_configure.prf
 +++ b/mkspecs/features/qt_configure.prf
-@@ -1251,7 +1251,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
+@@ -1265,7 +1265,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
                      error("Expression '$$1' is accessing field '$$var' of non-local feature $${feature}.")
                  return($$result)
              }
diff --git a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index 93404ea..3d5a732 100644
--- a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From abaf5cde503901aae1dc1cb1ede28a17ff51cee8 Mon Sep 17 00:00:00 2001
+From 2df6d12cfef0769f7801410cad012dd20d0497e2 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
@@ -30,12 +30,12 @@ Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
-index 55c74aa..f9ec328 100644
+index 27f4c27..01f68a5 100644
 --- a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
 +++ b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
-@@ -9,6 +9,11 @@ if (CMAKE_VERSION VERSION_LESS 3.0.0)
+@@ -3,6 +3,11 @@ if (CMAKE_VERSION VERSION_LESS 3.1.0)
+     message(FATAL_ERROR \"Qt 5 $${CMAKE_MODULE_NAME} module requires at least CMake version 3.1.0\")
  endif()
- !!ENDIF
  
 +if(NOT DEFINED OE_QMAKE_PATH_EXTERNAL_HOST_BINS)
 +    message(WARNING "Skipping because OE_QMAKE_PATH_EXTERNAL_HOST_BINS is not defined")
@@ -46,11 +46,11 @@ index 55c74aa..f9ec328 100644
  !!IF !isEmpty(CMAKE_LIB_DIR_IS_ABSOLUTE)
  set(_qt5$${CMAKE_MODULE_NAME}_install_prefix \"$$[QT_INSTALL_PREFIX]\")
 diff --git a/src/corelib/Qt5Config.cmake.in b/src/corelib/Qt5Config.cmake.in
-index 75b5348..ed31888 100644
+index 6b6544f..d317912 100644
 --- a/src/corelib/Qt5Config.cmake.in
 +++ b/src/corelib/Qt5Config.cmake.in
-@@ -3,6 +3,11 @@ if (CMAKE_VERSION VERSION_LESS 2.8.9)
-     message(FATAL_ERROR \"Qt5 requires at least CMake version 2.8.9\")
+@@ -3,6 +3,11 @@ if (CMAKE_VERSION VERSION_LESS 3.1.0)
+     message(FATAL_ERROR \"Qt5 requires at least CMake version 3.1.0\")
  endif()
  
 +if(NOT DEFINED OE_QMAKE_PATH_EXTERNAL_HOST_BINS)
diff --git a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
index 37914ad..57ad3f8 100644
--- a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
+++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
@@ -1,4 +1,4 @@
-From 6360a89c28bf5d48914ba2f947b55270c071f1b0 Mon Sep 17 00:00:00 2001
+From 6407bc53339920c16bf384145e4dd95ed0c325d0 Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Wed, 7 Jun 2017 21:00:49 +0900
 Subject: [PATCH] Delete qlonglong and qulonglong
diff --git a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
index 5f9c818..1262ffe 100644
--- a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
+++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
@@ -1,4 +1,4 @@
-From 48fb6a724a72ee28987124e238051234b8c95431 Mon Sep 17 00:00:00 2001
+From 9f9eac8d12531fe6ec3aa77f719c0b8ca7cfdd75 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 27 Jul 2017 08:02:51 -0700
 Subject: [PATCH] Replace pthread_yield with sched_yield
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
-index cc628ee..6b6aecc 100644
+index c6fd5d1..7bf6bfd 100644
 --- a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 +++ b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 @@ -34,7 +34,7 @@
@@ -26,7 +26,7 @@ index cc628ee..6b6aecc 100644
  #endif
  
  #include <algorithm>
-@@ -193,7 +193,7 @@ protected:
+@@ -205,7 +205,7 @@ protected:
              const char *nm = name.constData();
              int tp = qRegisterMetaType<Bar>(nm);
  #if defined(Q_OS_LINUX) && !defined(Q_OS_ANDROID)
diff --git a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
index b5e1fab..7eb78fa 100644
--- a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
+++ b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
@@ -1,4 +1,4 @@
-From 1b03528718e7665804c9e0443d45d43a6559034f Mon Sep 17 00:00:00 2001
+From ef4ff7241ee33819f11357d5a6ceee58146d63b4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:11:44 -0700
 Subject: [PATCH] Add OE specific specs for clang compiler
diff --git a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
index 994d6ab..e98b9b2 100644
--- a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
+++ b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
@@ -1,4 +1,4 @@
-From 05b42800ee62d3a25667d12dc5af3c7df860edc1 Mon Sep 17 00:00:00 2001
+From a3358cf43c523af046638337960686e942798d2c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:44:48 -0700
 Subject: [PATCH] linux-clang: Invert conditional for defining QT_SOCKLEN_T
diff --git a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
index 84f0ccb..94d2ea1 100644
--- a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
+++ b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
@@ -1,4 +1,4 @@
-From c042f0e9d25b1f4fe53c88f0c897b89cf2f8ab9f Mon Sep 17 00:00:00 2001
+From 8bf717e2ecda234f626f96ae08e0be3a6eca26d8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 10:11:50 -0700
 Subject: [PATCH] tst_qlocale: Enable QT_USE_FENV only on glibc
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
-index fc1ac7c..5bb715a 100644
+index 375cecd..46ca9b1 100644
 --- a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
 +++ b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
 @@ -46,7 +46,7 @@
diff --git a/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch b/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
index 5215130..89252de 100644
--- a/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
+++ b/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
@@ -1,4 +1,4 @@
-From aa45912a7543d1648cde7c3a8915ba5811294ef0 Mon Sep 17 00:00:00 2001
+From f09d998036af014a42c464eea72368c8f2920f6a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Feb 2018 17:08:43 -0800
 Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of -isystem
diff --git a/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch b/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
index 07bbd76..ea23cce 100644
--- a/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
+++ b/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
@@ -1,4 +1,4 @@
-From cfa510d03aad4e637d8956b6dc8923f80e3db36f Mon Sep 17 00:00:00 2001
+From 10f419678fe4f7087c973a8d8dd96bb0d781487b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic and qvkgen
diff --git a/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch b/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
index 58bc6d8..57cfe36 100644
--- a/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
+++ b/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
@@ -1,4 +1,4 @@
-From 58e3b74b86f64f67c07fedc2e3dc3b8e025ca411 Mon Sep 17 00:00:00 2001
+From 7691598a164737591068f8670f02a904ffce5dd2 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Fri, 24 Nov 2017 15:16:31 +0200
 Subject: [PATCH] Bootstrap without linkat feature
@@ -13,11 +13,11 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qconfig-bootstrapped.h b/src/corelib/global/qconfig-bootstrapped.h
-index 86ef1a2..52dc6ec 100644
+index 3469ebe..cb889f2 100644
 --- a/src/corelib/global/qconfig-bootstrapped.h
 +++ b/src/corelib/global/qconfig-bootstrapped.h
-@@ -89,7 +89,7 @@
- #define QT_FEATURE_futimes -1
+@@ -90,7 +90,7 @@
+ #define QT_FEATURE_itemmodel -1
  #define QT_FEATURE_library -1
  #ifdef __linux__
 -# define QT_FEATURE_linkat 1
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index a90a5ac..209a26b 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -5,19 +5,18 @@ require qt5-ptest.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=fb91571854638f10b2e5f36562661a5a \
-    file://LICENSE.LGPLv3;md5=a909b94c1c9674b2aa15ff03a86f518a \
+    file://LICENSE.LGPLv3;md5=86d02ed8764e77c1c0b194fde895a51b \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.PREVIEW.COMMERCIAL;md5=8ee24b8d305ef7779e07647a7b70e1bc \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
-# 5.11.meta-qt5-shared.1
+# 5.11.meta-qt5-shared.2
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -33,8 +32,6 @@ SRC_URI += "\
     file://0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
 "
 
-# LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
-
 # for syncqt
 RDEPENDS_${PN}-tools += "perl"
 
@@ -243,4 +240,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "17b73b0d2b8e0d643bdf13b543cc23d657a4b330"
+SRCREV = "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 4fed367..57e79be 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "80d7f92b9628076b681e509ddf8eae43cac550d5"
+SRCREV = "ff771b7d57eb3654f6321eb105129a594ec2841e"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index da0f852..8ef6826 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "1f78a69f4f6c33393a0b43a9151c698aa3d05bbb"
+SRCREV = "d3f9275cbaa6a6059298ec248dd28dd6ef065e51"
 
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 89f9254..6f1f7d3 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "d70fe2ac47dbf034991f0b2a4b0a3e1f16d171b9"
+SRCREV = "e68b5e17b071ca11974474546be04c7d564eae3a"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index f424016..b170b96 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "be7e45ca259d70d5f2ef0d11460261146fc1df95"
+SRCREV = "6c253768e2fb6c0892215f3d93f36be7cece637e"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index e8042af..33f15dd 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "0975a9c892f1cb30b9e11e6becc469a3101cc2db"
+SRCREV = "6069cc1cd1a6309cdffeb8bdd9c4035f33742228"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index f80ff56..5f820a5 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "3e28d47cea038ca64c2e14ff449cc183c51643ce"
+SRCREV = "df80153bf07b08e5d2ae8ba18f85a9ec15dbaef8"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 5e69926..05384b1 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "f878323a82fa69fcaeb37b42e10ba28759157f47"
+SRCREV = "b83a0a9460432abb82218da247710a1aaf321336"
diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
index 24d3527..9f15a57 100644
--- a/recipes-qt/qt5/qtknx_git.bb
+++ b/recipes-qt/qt5/qtknx_git.bb
@@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "4d5a04a0793ef05ade54a09cd469c9934f102753"
+SRCREV = "8a8a343446146f51056b6f530ce341f34199c811"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 3e9edd4..e197dfb 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -31,7 +31,7 @@ SRC_URI += " \
     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "d458bd47106dd849e6cf72b97a27f871735e4eed"
+SRCREV_qtlocation = "3d2281ccf7400a782f69b7b74cb45d0889708bcc"
 SRCREV_qtlocation-mapboxgl = "8c1be4ec01ef46bf453856531ebf53b48ce3dbe7"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
index a3e6da4..ca7886c 100644
--- a/recipes-qt/qt5/qtmqtt_git.bb
+++ b/recipes-qt/qt5/qtmqtt_git.bb
@@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "b61e7bd3182addd8675ae907fc681db402fb138f"
+SRCREV = "21aefc65d56d97284bf8122fb1b91726c1ae9768"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
index a9572c5..ddcc7f5 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
@@ -1,4 +1,4 @@
-From 4d020a4b5922c5c97bec661f39d978188d503c9c Mon Sep 17 00:00:00 2001
+From 556f69870fb3b5788ebae2baa9b832cb4d6fd996 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Thu, 8 Sep 2016 12:18:13 +0800
 Subject: [PATCH] qtmultimedia: fix a conflicting declaration
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 519e76b..7ae9a24 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -28,7 +28,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstream
 CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DMESA_EGL_NO_X11_HEADERS=1', d)}"
 
 # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.11
-# 5.11.meta-qt5.1
+# 5.11.meta-qt5.2
 SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
@@ -37,4 +37,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "0354fdda8b430f7749082ca55ad6c1dc781f3918"
+SRCREV = "bb7ffc4d847bb2b558693a4ca5d7f3a45c9b9231"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index 689d85c..96c78ea 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -9,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "e8552ddaf17dad91df3a03ccfc0d708ab13d6d0e"
+SRCREV = "0d845e00a000f376101165ec9a5c9096030db25c"
diff --git a/recipes-qt/qt5/qtpurchasing_git.bb b/recipes-qt/qt5/qtpurchasing_git.bb
index c39ec3d..df4a6e0 100644
--- a/recipes-qt/qt5/qtpurchasing_git.bb
+++ b/recipes-qt/qt5/qtpurchasing_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "51b83b74bb3d0ed406e28f89cbde1441782b82b2"
+SRCREV = "02246cd68ca14345d95cbd8893fd24ff60faa73f"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index ba6afa8..a8fc2c2 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtdeclarative-native"
 
-SRCREV = "e80d273e6f19ba0a6a0f4e830724a36785ef19f6"
+SRCREV = "c0232099a9fac03ef0f5287b6a26dbbd46669c06"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index a8c2870..372ed0c 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ FILES_${PN}-qmlplugins += " \
   ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
 "
 
-SRCREV = "6c9f0bfcc4bc6511686559dd87c29cfaa3e88b33"
+SRCREV = "0689a8256c0a21087c01fff3998fd3b606a5ac4c"
diff --git a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
index 977652e..3d3599d 100644
--- a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 2bf23e29ff3ec25e394fe1f633479013185a57d7 Mon Sep 17 00:00:00 2001
+From 51cfd34b85738194616c7a9354d707cc96062450 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 7 Jun 2017 15:17:12 +0300
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index 5d0dee1..1efac5c 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -12,7 +12,7 @@ require qt5-git.inc
 DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
 
 # Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.11
-# 5.11.meta-qt5.1
+# 5.11.meta-qt5.2
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
 "
@@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "db6d07b4a51813e72eee474a6ee2e91438841fa7"
+SRCREV = "556539365ab1eeaab339fc527c4c2130c2f804ff"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index f4b2faf..9982877 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "781c745277f9b4faa87d341b10ec0ca46eb45a73"
+SRCREV = "c2657d346455a5a7821fbfbe3b1107d7cf9b0949"
diff --git a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
index e4c7214..348693d 100644
--- a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
+++ b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
@@ -1,4 +1,4 @@
-From 550a56d5cea4ff0b332c2c4d53a0cb33ccf6102e Mon Sep 17 00:00:00 2001
+From 602abde351bcb2ac475253cf547e15f10620b6e7 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 10 Jan 2017 15:28:26 +0200
 Subject: [PATCH] Use external host bin path for cmake file
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index 2fd8973..1a81beb 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,10 +10,10 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "544f8c4ef7b77c5194605cba612fdde6fa02b06b"
+SRCREV = "67d48807b44735a2385b88db7ada01f7cd7eacfd"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.11
-# 5.11.meta-qt5.1
+# 5.11.meta-qt5.2
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
 do_install_append_class-nativesdk() {
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index addfe14..5c6a83d 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "e8588efb2fbd4a31aa1e4349f03b2bc18e3c0e2b"
+SRCREV = "29f2041f4da53815491affbf19ec008820c76e29"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index fca80af..5c196ec 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "7c6e9d8f29148793dc619a743a0b5d3a601ec34b"
+SRCREV = "fb561e9aa52d24b0156dc2c3987216954ad52107"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index b05c93d..9bac24e 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "aee027f581839caf44de1b176099ef2b22d2fc84"
+SRCREV = "b5f0519e8e6f8f125f711d61832072649d841dfe"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 2f0e98a..c15a9e3 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "f4554e29a44af2cdd9e518f5931e28cf349883c6"
+SRCREV = "1fd6226d52b8d3d201b117902ff1ecd84cc1a1e5"
diff --git a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
index 45be54f..5d3f984 100644
--- a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 1a20dc06de52a88691dc8270d449506aa0b9d457 Mon Sep 17 00:00:00 2001
+From 2a61817d5eac01b1dbc445a65d14573294b7ed71 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 5472ef5..790657b 100644
--- a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From 1a7ca3de9880a10cf4f4eb51fd3cf51e64eb5548 Mon Sep 17 00:00:00 2001
+From db6995482d1bd290ea8f09a02ff31f8e769f87c4 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index a8728a2..7fbf4ee 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 # Patches from https://github.com/meta-qt5/qttools/commits/b5.11
-# 5.11.meta-qt5.1
+# 5.11.meta-qt5.2
 SRC_URI += " \
     file://0001-add-noqtwebkit-configuration.patch \
     file://0002-linguist-tools-cmake-allow-overriding-the-location-f.patch \
@@ -29,7 +29,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "c29a1b03fd0fe6cc3496a6a14c56f6ef3390b713"
+SRCREV = "38b62511970b048b4a0edc5c8bcdea8c37fa76c7"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 00ffa7c..8c4e04a 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -106,4 +106,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "f1c17f060d09ea3d225803afa9f82fa22117cd3b"
+SRCREV = "0bf644a075634ca49ee28c0f42566f1012506f31"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
deleted file mode 100644
index 6f5bc45..0000000
--- a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c437e90e3bcf8457d300c49041f7e35fae37ebea Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Jul 2017 23:59:52 -0700
-Subject: [PATCH] include sys/time.h for timeval
-
-Musl exposes this issue since its not indirectly
-including sys/time.h like glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/virtualkeyboard/3rdparty/pinyin/include/userdict.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/virtualkeyboard/3rdparty/pinyin/include/userdict.h b/src/virtualkeyboard/3rdparty/pinyin/include/userdict.h
-index 1b9673f..924be7b 100644
---- a/src/virtualkeyboard/3rdparty/pinyin/include/userdict.h
-+++ b/src/virtualkeyboard/3rdparty/pinyin/include/userdict.h
-@@ -24,6 +24,7 @@
- // Debug performance for operations
- // #define ___DEBUG_PERF___
- 
-+#include <sys/time.h>
- #ifdef _WIN32
- #include <winsock.h> // timeval
- #else
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index b89aae9..f8759f1 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -6,10 +6,6 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
 
-# Patches from https://github.com/meta-qt5/qtvirtualkeyboard/commits/b5.11
-# 5.11.meta-qt5.1
-SRC_URI += "file://0001-include-sys-time.h-for-timeval.patch"
-
 # To enabled Nuance T9 Write support, you need to provide the licensed components
 # and enable "t9write" in PACKAGECONFIG. This can be done in a separate .bbappend file.
 # for example:
@@ -53,4 +49,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns qtdeclarative-native"
 
-SRCREV = "9055bd56653d2e488b52c66d884109fcccd23c2d"
+SRCREV = "14f4ea59491e40e7f95df9d7307433ef2c249ab5"
diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
index cfb2ee3..2842807 100644
--- a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
+++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
@@ -1,4 +1,4 @@
-From 4e1945bd0867c018d06b5fa9c2dcb60619f260b2 Mon Sep 17 00:00:00 2001
+From ca13ad2d1a5c119fb3f45c805d2f3caaede95a7d Mon Sep 17 00:00:00 2001
 From: Raphael Freudiger <laser_b@gmx.ch>
 Date: Tue, 10 Jan 2017 15:49:55 +0100
 Subject: [PATCH] fix build without xkbcommon-evdev
@@ -36,10 +36,10 @@ index 47be591..805c81e 100644
 +
 +LIBS += -lxkbcommon
 diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp b/src/compositor/compositor_api/qwaylandkeyboard.cpp
-index e35c0f3..45e82ca 100644
+index 7ab8bff..8c36774 100644
 --- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
 +++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
-@@ -349,12 +349,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
+@@ -334,12 +334,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
      xkb_state = xkb_state_new(keymap);
  }
  
@@ -52,7 +52,7 @@ index e35c0f3..45e82ca 100644
  
  void QWaylandKeyboardPrivate::createXKBKeymap()
  {
-@@ -384,6 +378,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
+@@ -369,6 +363,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
  }
  #endif
  
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 272bed1..762e612 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,14 +37,14 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "ec495c98189f1d849e793108b09b5af0ce2c8984"
+SRCREV = "434f3e9a952b5858abc1f0ed1179ea5d2fca6a19"
 
 # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.11
-# 5.11.meta-qt5.1
+# 5.11.meta-qt5.2
 # From https://bugreports.qt.io/browse/QTBUG-57767
-SRC_URI += " \
-    file://0001-fix-build-without-xkbcommon-evdev.patch \
-"
+#SRC_URI += " \
+#    file://0001-fix-build-without-xkbcommon-evdev.patch \
+#"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
diff --git a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index f7cbad5..17f3405 100644
--- a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From ded0b78fe690b5c6ddfca08a098e824ed23ae80d Mon Sep 17 00:00:00 2001
+From 882d9b41fd538c3dd4170bdcdb3938f8989d7700 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index 1b718a3..8c1de74 100644
+index 73607aa..151d261 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
 @@ -61,6 +61,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
index 3d5d286..c5e9ea5 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 3e08f22dbe2ca570bf853b6dfad8831f21ddbe14 Mon Sep 17 00:00:00 2001
+From 42ad6935a99271f9b481423162d9ead15ffa9ec9 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] chromium: Force host toolchain configuration
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/chromium/tools/gn/bootstrap/bootstrap.py b/chromium/tools/gn/bootstrap/bootstrap.py
-index 43392ef..9ef521f 100755
+index 93c6446..0fe7e67 100755
 --- a/chromium/tools/gn/bootstrap/bootstrap.py
 +++ b/chromium/tools/gn/bootstrap/bootstrap.py
-@@ -326,10 +326,10 @@ def write_gn_ninja(path, root_gen_dir, options):
+@@ -352,10 +352,10 @@ def write_gn_ninja(path, root_gen_dir, options):
      ld = os.environ.get('LD', cxx)
      ar = os.environ.get('AR', 'ar -X64')
    else:
diff --git a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
index 061df82..e8cd395 100644
--- a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From 695e80ba773eae1d6239828b8b3218ac6584e1e1 Mon Sep 17 00:00:00 2001
+From 1095ff439340980b297eb988f23fceb5d198b18e Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
index 3e30ac5..bc06664 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
@@ -1,4 +1,4 @@
-From 51313e2d2739c9a9ca5e86979e868e9bd80e9bfd Mon Sep 17 00:00:00 2001
+From 95c0c42ca5103adef307fc29b53d8f95b4755baa Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 30 Mar 2017 11:37:24 +0300
 Subject: [PATCH] chromium: workaround for too long .rps file name
@@ -18,10 +18,10 @@ Change-Id: I73c5e64ae5174412be2a675e35b0b6047f2bf4c1
  1 file changed, 9 insertions(+)
 
 diff --git a/chromium/tools/gn/ninja_action_target_writer.cc b/chromium/tools/gn/ninja_action_target_writer.cc
-index eaf1b3d..ddf456e 100644
+index bab07c5..8f889ae 100644
 --- a/chromium/tools/gn/ninja_action_target_writer.cc
 +++ b/chromium/tools/gn/ninja_action_target_writer.cc
-@@ -118,9 +118,18 @@ std::string NinjaActionTargetWriter::WriteRuleDefinition() {
+@@ -117,9 +117,18 @@ std::string NinjaActionTargetWriter::WriteRuleDefinition() {
      // strictly necessary for regular one-shot actions, but it's easier to
      // just always define unique_name.
      std::string rspfile = custom_rule_name;
diff --git a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
index 8cdab4b..13e0dc9 100644
--- a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From afbaa51b52482f71e683389e7565aceb6c59e8a6 Mon Sep 17 00:00:00 2001
+From e0d8fe57a8bbd1c24ae35d93c54ab0c6e58eff20 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] Force host toolchain configuration
@@ -57,10 +57,10 @@ index dd0d3e3..70161c8 100644
  "  nm = \"$$which(nm)\" " \
  "  toolchain_args = { " \
 diff --git a/src/core/config/linux.pri b/src/core/config/linux.pri
-index daac6fa..d858021 100644
+index 68d64fd..9ab43df 100644
 --- a/src/core/config/linux.pri
 +++ b/src/core/config/linux.pri
-@@ -90,7 +90,7 @@ contains(QT_ARCH, "mips") {
+@@ -91,7 +91,7 @@ contains(QT_ARCH, "mips") {
  
  host_build {
      gn_args += custom_toolchain=\"$$QTWEBENGINE_OUT_ROOT/src/toolchain:host\"
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index e808eb7..375b01a 100644
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From 5d7080bf2001a022223c4089a199605b5f9a5cce Mon Sep 17 00:00:00 2001
+From 37e7051ef185d7b1a237db725d98f63a155fc95b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index 359ee26..46f1c9c 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From f3478cde99da29faebbdb3d13a479b50af9804fd Mon Sep 17 00:00:00 2001
+From 2ddd74e630db38b951697c0b020245c0c83b2316 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/chromium/base/process/process_metrics_posix.cc b/chromium/base/process/process_metrics_posix.cc
-index 0eb5c1f..8af7799 100644
+index 73a52d6..4867198 100644
 --- a/chromium/base/process/process_metrics_posix.cc
 +++ b/chromium/base/process/process_metrics_posix.cc
 @@ -94,14 +94,14 @@ size_t ProcessMetrics::GetMallocUsage() {
@@ -32,18 +32,18 @@ index 0eb5c1f..8af7799 100644
    return 0;
  #endif
 diff --git a/chromium/base/trace_event/malloc_dump_provider.cc b/chromium/base/trace_event/malloc_dump_provider.cc
-index f1cc52a..256138d 100644
+index ffd5191..0c9131e 100644
 --- a/chromium/base/trace_event/malloc_dump_provider.cc
 +++ b/chromium/base/trace_event/malloc_dump_provider.cc
-@@ -197,6 +197,7 @@ MallocDumpProvider::~MallocDumpProvider() {}
+@@ -197,6 +197,7 @@ MallocDumpProvider::~MallocDumpProvider() = default;
  // the current process.
  bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
                                        ProcessMemoryDump* pmd) {
 +#if defined(__GLIBC__)
-   size_t total_virtual_size = 0;
-   size_t resident_size = 0;
-   size_t allocated_objects_size = 0;
-@@ -316,7 +317,7 @@ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
+   {
+     base::AutoLock auto_lock(emit_metrics_on_memory_dump_lock_);
+     if (!emit_metrics_on_memory_dump_)
+@@ -322,7 +323,7 @@ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
      pmd->DumpHeapUsage(metrics_by_context, overhead, "malloc");
    }
    tid_dumping_heap_ = kInvalidThreadId;
diff --git a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch b/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
index e4d44f3..f67baea 100644
--- a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
@@ -1,4 +1,4 @@
-From ac6d09a3bb56dee9fc377f4042b23b209fd0726d Mon Sep 17 00:00:00 2001
+From 84d83fa843e72e2154375c8a002a74dc31ab8aae Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 12 Dec 2017 16:06:14 +0200
 Subject: [PATCH] musl: don't use pvalloc as it's not available on musl
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
index 2af1f3c..e9324b6 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,4 +1,4 @@
-From 660cc2ad6e2c92e0a86948c80f356b754ecd43f5 Mon Sep 17 00:00:00 2001
+From e627afbd990a189d3eaf9992088bd506e306a680 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:37:49 -0700
 Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
diff --git a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch b/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
index 84c1cec..88d9542 100644
--- a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
@@ -1,4 +1,4 @@
-From 52ef357f629a2c210b3b0fe13cba90fe379afee9 Mon Sep 17 00:00:00 2001
+From acc9fd7805f48fc998f1733db1fd58b05d381582 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 14 Dec 2017 11:28:10 +0200
 Subject: [PATCH] musl: link against libexecinfo
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index c07ffa4..6e63631 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From 80e2b20ed6aa48b692b7de585c8ea92263c99d72 Mon Sep 17 00:00:00 2001
+From cfd8e1d9c17cc365c5d49d99b47ce8e06e725f86 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
 Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
index 6f578a0..dd2d7a3 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From 671dc6a1d7d507a81d5a53a106d72d6c14f50e13 Mon Sep 17 00:00:00 2001
+From 3bfe9fa1e05ae2faec6dc73895c2bf265ec66d3b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index 1ef7e40..a9e5e2b 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From f1c0433093b5511dceb0cf80287d281fd24ac941 Mon Sep 17 00:00:00 2001
+From f9e47fe475eb60c4615215214cea344280e5b26f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/base/allocator/allocator_shim.cc b/chromium/base/allocator/allocator_shim.cc
-index 41adbf8..091971e 100644
+index 4b7de5e..fe56522 100644
 --- a/chromium/base/allocator/allocator_shim.cc
 +++ b/chromium/base/allocator/allocator_shim.cc
-@@ -319,7 +319,7 @@ ALWAYS_INLINE void ShimFreeDefiniteSize(void* ptr, size_t size, void* context) {
+@@ -302,7 +302,7 @@ ALWAYS_INLINE void ShimFreeDefiniteSize(void* ptr, size_t size, void* context) {
  // In the case of tcmalloc we also want to plumb into the glibc hooks
  // to avoid that allocations made in glibc itself (e.g., strdup()) get
  // accidentally performed on the glibc heap instead of the tcmalloc one.
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index aba7c05..2d47fd2 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From 3789c3d611ee4fd258f85eac9d575af09791585e Mon Sep 17 00:00:00 2001
+From 33fb1fa2f8a846734544db7b21f120f5924f9316 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
 Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index 032ff30..5f6dc25 100644
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From b4cc182b9cc6b6362cf4039883e4e1953357843a Mon Sep 17 00:00:00 2001
+From ea8b649d60037b08bbb2134f878098c8373a08b7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
 Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 chromium/net/dns/resolv_compat.h
 
 diff --git a/chromium/net/dns/dns_config_service_posix.cc b/chromium/net/dns/dns_config_service_posix.cc
-index 8898f85..28530d5 100644
+index f2e6633..6fe84dd 100644
 --- a/chromium/net/dns/dns_config_service_posix.cc
 +++ b/chromium/net/dns/dns_config_service_posix.cc
-@@ -28,6 +28,10 @@
+@@ -27,6 +27,10 @@
  #include "net/dns/notify_watcher_mac.h"
  #include "net/dns/serial_worker.h"
  
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index 6223ee5..57f313c 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From e8172c5252dec386fbd95a18f2c59f08307f65c0 Mon Sep 17 00:00:00 2001
+From 567105c9014cbad00aba5bcd172e6aed3e32c509 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
 Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
index cacd623..a247eb8 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,4 +1,4 @@
-From 6c3233f1eec1a80bc771848af062cc92445b143b Mon Sep 17 00:00:00 2001
+From fdd90ccaebc488bdb68b020a9bc3d89232795559 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index d9c7601..b97045d 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From 9624b45166cd5e7976a6ecf99f2545c9cc883986 Mon Sep 17 00:00:00 2001
+From ba501cce8252a22a4baba2d9e524bd7538a079bd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/chromium/device/serial/serial_io_handler_posix.cc b/chromium/device/serial/serial_io_handler_posix.cc
-index eca131f..80a6cec 100644
+index d6ed5e1..b550f89 100644
 --- a/chromium/device/serial/serial_io_handler_posix.cc
 +++ b/chromium/device/serial/serial_io_handler_posix.cc
 @@ -6,6 +6,7 @@
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index f7880f8..adc2d82 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,4 +1,4 @@
-From d723d506ff8b5e0dd1bb3f2c11805a2ec1f0b712 Mon Sep 17 00:00:00 2001
+From fc03e0f3c36d4d20e00dfbcd02616a467e4b0a15 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
 Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 1d1763d..80928a4 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -121,10 +121,10 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "63-based"
+QT_MODULE_BRANCH_CHROMIUM = "65-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.11
-# 5.11.meta-qt5.1
+# 5.11.meta-qt5.2
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
@@ -136,8 +136,8 @@ SRC_URI_append_libc-musl = "\
     file://0005-musl-link-against-libexecinfo.patch \
 "
 
-# Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/63-based
-# 63-based.meta-qt5.1
+# Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/65-based
+# 65-based.meta-qt5.2
 SRC_URI += " \
     file://0001-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
     file://0002-chromium-workaround-for-too-long-.rps-file-name.patch;patchdir=src/3rdparty \
@@ -158,8 +158,8 @@ SRC_URI_append_libc-musl = "\
     file://0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "732d09331c1e4efa51501aae9bcd6924eecdd5c3"
-SRCREV_chromium = "3fa04d22883e42bd987e4f83d394a1040b410024"
+SRCREV_qtwebengine = "b7e5722cce95730004ef6cb9f4aabde5bbd5685d"
+SRCREV_chromium = "e173cb17d97aa3c2065189275c85db79eb7d1748"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 1e8719a..cd55bdd 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "8a549aca7b371722cbf012d85216e4560ef1cf33"
+SRCREV = "34ce4b65ba35a487bdb8afa5e59b57cfa3f9b0e0"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index ceecfb0..f8c2425 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "cf23a402b97b459309ec32fe49c82a845a3636af"
+SRCREV = "bb7dda99936b97cc262f07b25fcb500f8a552c8a"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 8a98f54..b3ce945 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "78a10dad08d1c354f7afb539bd89f0d75a9fe3b1"
+SRCREV = "d80236f50559f4fe785fba598a03aaa7f05d37ac"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 2325eb0..399adc3 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "c892ceec1c301f12d5c276e12be0bee8fd7d4cbf"
+SRCREV = "e4abf2c6e3de158d3a6eb3c46b5158f741136c9d"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
-- 
2.17.0


