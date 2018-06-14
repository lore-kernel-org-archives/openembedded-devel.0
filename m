Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9D26F789A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 08:03:50 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v16-v6so8878544wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KnhULOXnXvLMb8zOkHIl07T91EBoY8xIRAiy/uh0uog=;
	b=YpiykeY6ngtLQ8Za6N1xs5hLRXBOObqRbbHUrwV4XoIHDAXELymHIPToiGbeYn/TRE
	XQw4g5bENQC/DKDE2tjG9OJqAV/x3AClQ1PfdbBfNtsFRmBLsjgDWmWf8v923g5Q86on
	JaJ/4QM36IA3B/UTF/Cg2AIIQ/MhRddHDCBIfT6q8hrfONk1e5Re5QiufCSyafAPR5Vf
	AxJrKj+3ZjEvBtkYTjlMu54STk7AN5zGZQCT8vjeBlQGULofFmfKt3bEcAbaBDVNiFaK
	LxidOA32Y4j3nf7ym1X7BJcU5Mu8oOuM0nasliJATiV1Dd3ZPAdKpunAb/4gNYHdhjat
	7CxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KnhULOXnXvLMb8zOkHIl07T91EBoY8xIRAiy/uh0uog=;
	b=XvdsbyKfkD97o8HUbErejCb2DLfKWhj2zew5bnRl6Z2F2rRxai/yvw8JmLOp+VAwwD
	Gx+F13L2jxeMpXHImUYX4a3KARfELNxdH8Y0XS7fYToO9D+h3BUR/zRi/Y/CT3TuSU01
	uAFSpuLvcmALnG55stQp14x6/czZLMae3HCx2u48X9gZRLM9NZocLiWi97wSWKb8VgPK
	o50JTl7gb0lJq5LH1PoZNFH9fkj/EFVdb9rSQ62nerlnW2wREpyuG3txXutyHPO9Nm0u
	dqI2f2RKLajGgS7azMl0c8uWW7u0XFl5BoxYRmBqFX7IeBqP+ylR500771fpUqIedMPf
	y6Ow==
X-Gm-Message-State: APt69E0FJUbu/NRBt67AwVznF0ySTB7PtWFH+QtutEP48Tmck/LPDh0h
	EOKHQJyZwhbERNP4qSyE16hnoA==
X-Google-Smtp-Source: ADUXVKK+DEew1+A0lE0tj/hDAMoouSZZxBip9IfZf5rmK8n1VNm2r4qli2t8XcWcmYaAzu+0jsqvow==
X-Received: by 2002:a1c:45db:: with SMTP id l88-v6mr908831wmi.19.1528963429302;
	Thu, 14 Jun 2018 01:03:49 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v19-v6sm3712639wmc.9.2018.06.14.01.03.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Jun 2018 01:03:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jun 2018 08:03:45 +0000
Message-Id: <20180614080345.4945-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH][WIP][rocko][meta-qt5] qt: upgrade to 5.9.6
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
X-List-Received-Date: Thu, 14 Jun 2018 08:03:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* WIP: waiting for qtdeclarative v5.9.6 tag to be downmerged to 5.9
  branch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb           |  6 +++---
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch |  8 ++++----
 ...Fix-BlenderDNA-for-clang-cross-compiler.patch |  4 ++--
 recipes-qt/qt5/qt3d_git.bb                       |  4 ++--
 recipes-qt/qt5/qt5-git.inc                       |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb              |  6 +++---
 .../qtbase/0001-Add-linux-oe-g-platform.patch    | 16 ++++++++--------
 ...ke-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch |  8 ++++----
 ...allow-to-set-qt.conf-from-the-outside-u.patch |  4 ++--
 ...p-path-length-from-256-to-512-character.patch |  4 ++--
 ...nknown-features-instead-of-erroring-out.patch |  4 ++--
 ...asn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch |  6 +++---
 .../0007-Delete-qlonglong-and-qulonglong.patch   |  4 ++--
 ...-Replace-pthread_yield-with-sched_yield.patch |  6 +++---
 ...dd-OE-specific-specs-for-clang-compiler.patch |  8 ++++----
 ...nvert-conditional-for-defining-QT_SOCKL.patch |  4 ++--
 ...locale-Enable-QT_USE_FENV-only-on-glibc.patch |  4 ++--
 .../qt5/qtbase/0012-Always-build-uic.patch       |  4 ++--
 recipes-qt/qt5/qtbase_git.bb                     |  4 ++--
 recipes-qt/qt5/qtcanvas3d_git.bb                 |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                   |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb             |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb              |  2 +-
 recipes-qt/qt5/qtgamepad_git.bb                  |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb         |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb             |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                 |  2 +-
 ...ultimedia-fix-a-conflicting-declaration.patch | 14 +++++++-------
 recipes-qt/qt5/qtmultimedia_git.bb               |  4 ++--
 ...x-invalid-use-of-incomplete-type-class-.patch |  6 +++---
 recipes-qt/qt5/qtquickcontrols2_git.bb           |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb            |  4 ++--
 recipes-qt/qt5/qtremoteobjects_git.bb            |  2 +-
 recipes-qt/qt5/qtscript_git.bb                   |  2 +-
 ...e-external-host-bin-path-for-cmake-file.patch |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                    |  4 ++--
 recipes-qt/qt5/qtsensors_git.bb                  |  2 +-
 recipes-qt/qt5/qtserialbus_git.bb                |  2 +-
 recipes-qt/qt5/qtserialport_git.bb               |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                      |  2 +-
 .../0001-add-noqtwebkit-configuration.patch      |  6 +++---
 ...s-cmake-allow-overriding-the-location-f.patch |  4 ++--
 recipes-qt/qt5/qttools_git.bb                    |  4 ++--
 .../0001-include-sys-time.h-for-timeval.patch    |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb          |  4 ++--
 .../0001-fix-build-without-xkbcommon-evdev.patch |  8 ++++----
 recipes-qt/qt5/qtwayland_git.bb                  |  4 ++--
 recipes-qt/qt5/qtwebchannel_git.bb               |  2 +-
 ...ge-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |  4 ++--
 ...prf-allow-build-for-linux-oe-g-platform.patch |  4 ++--
 ...ickwebengineview_p_p.h-add-include-QCol.patch |  4 ++--
 ...mium-Force-host-toolchain-configuration.patch |  4 ++--
 ...ependency-to-QCoreApplication-translate.patch |  4 ++--
 ...-workaround-for-too-long-.rps-file-name.patch |  4 ++--
 ...0004-Force-host-toolchain-configuration.patch |  6 +++---
 ...-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch |  4 ++--
 ...-Avoid-mallinfo-APIs-on-non-glibc-linux.patch |  6 +++---
 ...hromium-musl-include-fcntl.h-for-loff_t.patch |  6 +++---
 ...-use-off64_t-instead-of-the-internal-__.patch |  6 +++---
 ...m-musl-linux-glibc-make-the-distinction.patch |  4 ++--
 ...-allocator-Do-not-include-glibc_weak_sy.patch |  4 ++--
 ...-Use-correct-member-name-__si_fields-fr.patch |  4 ++--
 ...omium-musl-Match-syscalls-to-match-musl.patch |  4 ++--
 ...-Define-res_ninit-and-res_nclose-for-no.patch | 14 +++++++-------
 ...omium-musl-Do-not-define-__sbrk-on-musl.patch |  6 +++---
 ...-musl-Adjust-default-pthread-stack-size.patch | 10 +++++-----
 ...-include-asm-generic-ioctl.h-for-TCGETS.patch |  4 ++--
 ...-tcmalloc-Use-off64_t-insread-of-__off6.patch |  6 +++---
 recipes-qt/qt5/qtwebengine_git.bb                |  8 ++++----
 recipes-qt/qt5/qtwebsockets_git.bb               |  2 +-
 recipes-qt/qt5/qtwebview_git.bb                  |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb              |  2 +-
 74 files changed, 165 insertions(+), 165 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 2b8a4d3..0b6b7ce 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -26,7 +26,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
-# 5.9.meta-qt5-shared.5
+# 5.9.meta-qt5-shared.6
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -43,7 +43,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
-# 5.9.meta-qt5-native.5
+# 5.9.meta-qt5-native.6
 SRC_URI += " \
     file://0012-Always-build-uic.patch \
 "
@@ -200,4 +200,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "f2095f2c66d0dae8525879f6c14165ace650e7f1"
+SRCREV = "9c50112304033c631e52f062496f3111f24835a2"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index 31598de..cbcf014 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From f61a6e50fbff57b17c113a70d8c50e460831fe70 Mon Sep 17 00:00:00 2001
+From 14826486fbde132cdea45837b645b3cfe26630ee Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
@@ -10,7 +10,7 @@ Subject: [PATCH] Allow a tools-only build
  3 files changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/qt3d.pro b/qt3d.pro
-index 2cc347a..81cdeef 100644
+index 2cc347a1c..81cdeefb0 100644
 --- a/qt3d.pro
 +++ b/qt3d.pro
 @@ -1,4 +1,4 @@
@@ -29,7 +29,7 @@ index 2cc347a..81cdeef 100644
 +    SUBDIRS = sub_tools
 +}
 diff --git a/src/3rdparty/assimp/assimp_dependency.pri b/src/3rdparty/assimp/assimp_dependency.pri
-index 8ba2d9a..e973d93 100644
+index 8ba2d9a41..e973d93dd 100644
 --- a/src/3rdparty/assimp/assimp_dependency.pri
 +++ b/src/3rdparty/assimp/assimp_dependency.pri
 @@ -1,5 +1,5 @@
@@ -40,7 +40,7 @@ index 8ba2d9a..e973d93 100644
  } else {
      include(assimp.pri)
 diff --git a/tools/tools.pro b/tools/tools.pro
-index 8e973ae..ad51db5 100644
+index 8e973aecb..ad51db585 100644
 --- a/tools/tools.pro
 +++ b/tools/tools.pro
 @@ -1,4 +1,4 @@
diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
index d6875f3..ef218a1 100644
--- a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
+++ b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
@@ -1,4 +1,4 @@
-From 535d2ecd0ccaae5a36d40e9b64ffa2ef32f09cdb Mon Sep 17 00:00:00 2001
+From 6e528d8c4d82f6e4a1948086ac41230b5f3a773b Mon Sep 17 00:00:00 2001
 From: Kim Kulling <kim.kulling@googlemail.com>
 Date: Mon, 7 Nov 2016 17:19:49 +0100
 Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
@@ -9,7 +9,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/3rdparty/assimp/code/BlenderDNA.cpp b/src/3rdparty/assimp/code/BlenderDNA.cpp
-index 18ec9f2..5b0b209 100644
+index 18ec9f2b4..5b0b2090f 100644
 --- a/src/3rdparty/assimp/code/BlenderDNA.cpp
 +++ b/src/3rdparty/assimp/code/BlenderDNA.cpp
 @@ -55,10 +55,10 @@ using namespace Assimp::Formatter;
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 19925b3..3eadbb9 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -12,7 +12,7 @@ DEPENDS += "qtbase"
 DEPENDS_class-target += "qtdeclarative qt3d-native"
 
 # Patches from https://github.com/meta-qt5/qt3d/commits/b5.9
-# 5.9.meta-qt5.5
+# 5.9.meta-qt5.6
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
     file://0002-Fix-BlenderDNA-for-clang-cross-compiler.patch \
@@ -37,6 +37,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "2970ef3dacda02fdf52ac25f3b93694eb06e6f7f"
+SRCREV = "ea18da8361e8406cf1cb567a407429afcd65552a"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index d7e3f34..f55a2c0 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
 
 S = "${WORKDIR}/git"
 
-PV = "5.9.5+git${SRCPV}"
+PV = "5.9.6+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 0115a97..698418d 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -21,7 +21,7 @@ require qt5-git.inc
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
-# 5.9.meta-qt5-shared.5
+# 5.9.meta-qt5-shared.6
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -38,7 +38,7 @@ SRC_URI += "\
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
-# 5.9.meta-qt5-native.5
+# 5.9.meta-qt5-native.6
 SRC_URI += " \
     file://0012-Always-build-uic.patch \
 "
@@ -125,4 +125,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "f2095f2c66d0dae8525879f6c14165ace650e7f1"
+SRCREV = "9c50112304033c631e52f062496f3111f24835a2"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index e99a0c2..9e815a9 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From f289763d524fb4012c95191f1ed9c5c680c33b28 Mon Sep 17 00:00:00 2001
+From 61220bdf923797b8d13b27c1601894a3743eeb7a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
@@ -21,16 +21,16 @@ Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  configure                            |  2 +-
- mkspecs/features/configure.prf       |  4 ++--
+ mkspecs/features/configure.prf       |  4 +--
  mkspecs/features/qt_functions.prf    |  2 +-
- mkspecs/linux-oe-g++/qmake.conf      | 43 ++++++++++++++++++++++++++++++++++++
+ mkspecs/linux-oe-g++/qmake.conf      | 43 ++++++++++++++++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h |  1 +
  5 files changed, 48 insertions(+), 4 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 08b49a8..5876721 100755
+index 08b49a8d12..5876721743 100755
 --- a/configure
 +++ b/configure
 @@ -712,7 +712,7 @@ fi
@@ -43,7 +43,7 @@ index 08b49a8..5876721 100755
  
  # build qmake
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 934a18a..0f5b1b6 100644
+index 934a18a924..0f5b1b6333 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
 @@ -46,14 +46,14 @@ defineTest(qtCompileTest) {
@@ -64,7 +64,7 @@ index 934a18a..0f5b1b6 100644
              msg = "test $$1 succeeded"
              write_file($$QMAKE_CONFIG_LOG, msg, append)
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 1903e50..c093dd4 100644
+index 1903e509c8..c093dd4592 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
 @@ -69,7 +69,7 @@ defineTest(qtHaveModule) {
@@ -78,7 +78,7 @@ index 1903e50..c093dd4 100644
              cmd = perl -w $$system_path($${cmd}.pl)
 diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
 new file mode 100644
-index 0000000..c1837e6
+index 0000000000..c1837e6d55
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qmake.conf
 @@ -0,0 +1,43 @@
@@ -127,7 +127,7 @@ index 0000000..c1837e6
 +load(qt_config)
 diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
 new file mode 100644
-index 0000000..5d22fb4
+index 0000000000..5d22fb4101
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qplatformdefs.h
 @@ -0,0 +1 @@
diff --git a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
index 5d247d1..f544e10 100644
--- a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
+++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
@@ -1,4 +1,4 @@
-From 3ffab93bd68226b63350a38fdb64b64ab66a808b Mon Sep 17 00:00:00 2001
+From 709a7e5e70927e07e66e57414c6b4ed67560217e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
@@ -19,7 +19,7 @@ Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index 545b9a3..c991a9b 100644
+index 545b9a3d1e..c991a9ba41 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
@@ -50,7 +50,7 @@ index 545b9a3..c991a9b 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/dbus/Qt5DBusConfigExtras.cmake.in b/src/dbus/Qt5DBusConfigExtras.cmake.in
-index 1d94715..301af8f 100644
+index 1d947159e2..301af8f1b2 100644
 --- a/src/dbus/Qt5DBusConfigExtras.cmake.in
 +++ b/src/dbus/Qt5DBusConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qdbuscpp2xml)
@@ -72,7 +72,7 @@ index 1d94715..301af8f 100644
      _qt5_DBus_check_file_exists(${imported_location})
  
 diff --git a/src/widgets/Qt5WidgetsConfigExtras.cmake.in b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-index 99d87e2..5621dc0 100644
+index 99d87e2e46..5621dc0fae 100644
 --- a/src/widgets/Qt5WidgetsConfigExtras.cmake.in
 +++ b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::uic)
diff --git a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index e137b08..7ab90df 100644
--- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From b3c893e8af76e64d59051401fd86acd24f4d5369 Mon Sep 17 00:00:00 2001
+From a1cb244c77c988b45b5597b4ffc4398ccb668fd4 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index b4ba0b5..11d4c00 100644
+index b4ba0b5b2e..11d4c00f39 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -172,7 +172,10 @@ void QLibrarySettings::load()
diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
index 9d1f296..44a20d4 100644
--- a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 4c827328e3d654b4e179864149cb9edee1a58f53 Mon Sep 17 00:00:00 2001
+From 0a1329319dcc60f041090abb4625054ed94d6097 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -15,7 +15,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.pri b/configure.pri
-index dc703ec..961b41e 100644
+index dc703ecb14..961b41e3f8 100644
 --- a/configure.pri
 +++ b/configure.pri
 @@ -796,10 +796,10 @@ defineTest(qtConfOutput_preparePaths) {
diff --git a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
index 8dade54..746b136 100644
--- a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
+++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -1,4 +1,4 @@
-From 6ca3f881b0d0f6feb824aad35ce85ddb3be2146b Mon Sep 17 00:00:00 2001
+From 7e7249e3355264733f1dbfbc7dc7d3f85d890951 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Mon, 24 Oct 2016 09:45:18 +0300
 Subject: [PATCH] Disable all unknown features instead of erroring out
@@ -10,7 +10,7 @@ Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_configure.prf
-index d5dcda2..501151d 100644
+index d5dcda22ac..501151d27f 100644
 --- a/mkspecs/features/qt_configure.prf
 +++ b/mkspecs/features/qt_configure.prf
 @@ -1251,7 +1251,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
diff --git a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index 9aefbf9..bfeedbe 100644
--- a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From 9c6fc0f0e5f2da02b6b2a21c113f6b29588fc52c Mon Sep 17 00:00:00 2001
+From d1303277bc34d8ab38082ead9733c25a3ab2a236 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
@@ -30,7 +30,7 @@ Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
-index 55c74aa..f9ec328 100644
+index 55c74aad66..f9ec328c83 100644
 --- a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
 +++ b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
 @@ -9,6 +9,11 @@ if (CMAKE_VERSION VERSION_LESS 3.0.0)
@@ -46,7 +46,7 @@ index 55c74aa..f9ec328 100644
  !!IF !isEmpty(CMAKE_LIB_DIR_IS_ABSOLUTE)
  set(_qt5$${CMAKE_MODULE_NAME}_install_prefix \"$$[QT_INSTALL_PREFIX]\")
 diff --git a/src/corelib/Qt5Config.cmake.in b/src/corelib/Qt5Config.cmake.in
-index 75b5348..ed31888 100644
+index 75b53485b7..ed31888c93 100644
 --- a/src/corelib/Qt5Config.cmake.in
 +++ b/src/corelib/Qt5Config.cmake.in
 @@ -3,6 +3,11 @@ if (CMAKE_VERSION VERSION_LESS 2.8.9)
diff --git a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
index 3d687c7..8f1bd59 100644
--- a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
+++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
@@ -1,4 +1,4 @@
-From 70eb95bcde17f4e67b4660caa8183e24ec876102 Mon Sep 17 00:00:00 2001
+From 98c2a414a359ad8ceba511292ac6962deba78356 Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Wed, 7 Jun 2017 21:00:49 +0900
 Subject: [PATCH] Delete qlonglong and qulonglong
@@ -9,7 +9,7 @@ Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
-index 09458bd..59a120e 100644
+index 09458bd9c3..59a120eb26 100644
 --- a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
 +++ b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
 @@ -5,10 +5,8 @@ SUBDIRS=\
diff --git a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
index 71ab6ff..f2e9d68 100644
--- a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
+++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
@@ -1,4 +1,4 @@
-From 08d705e3a5e16ba75b0ca281400bba0d85f64f77 Mon Sep 17 00:00:00 2001
+From 83d9a275c09352558e69445cb453020861ae3f6e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 27 Jul 2017 08:02:51 -0700
 Subject: [PATCH] Replace pthread_yield with sched_yield
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
-index f9ddd59..2f92db9 100644
+index f9ddd59aaa..2f92db983d 100644
 --- a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 +++ b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 @@ -34,7 +34,7 @@
@@ -36,7 +36,7 @@ index f9ddd59..2f92db9 100644
              QMetaType info(tp);
              if (!info.isValid()) {
 diff --git a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
-index f64a88c..997218b 100644
+index f64a88cc05..997218b2b4 100644
 --- a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 +++ b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 @@ -77,6 +77,7 @@
diff --git a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
index d393352..c3124b4 100644
--- a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
+++ b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
@@ -1,11 +1,11 @@
-From 1b576218b875cd10fcbcbd227d0011fc0bb917da Mon Sep 17 00:00:00 2001
+From eeb0e3cafc02ae185a75f932176339002f6338ba Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:11:44 -0700
 Subject: [PATCH] Add OE specific specs for clang compiler
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- mkspecs/linux-oe-clang/qmake.conf      | 43 ++++++++++++++++++++++++++++++++++
+ mkspecs/linux-oe-clang/qmake.conf      | 43 ++++++++++++++++++++++++++
  mkspecs/linux-oe-clang/qplatformdefs.h |  1 +
  2 files changed, 44 insertions(+)
  create mode 100644 mkspecs/linux-oe-clang/qmake.conf
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 diff --git a/mkspecs/linux-oe-clang/qmake.conf b/mkspecs/linux-oe-clang/qmake.conf
 new file mode 100644
-index 0000000..ffc9f05
+index 0000000000..ffc9f051db
 --- /dev/null
 +++ b/mkspecs/linux-oe-clang/qmake.conf
 @@ -0,0 +1,43 @@
@@ -62,7 +62,7 @@ index 0000000..ffc9f05
 +load(qt_config)
 diff --git a/mkspecs/linux-oe-clang/qplatformdefs.h b/mkspecs/linux-oe-clang/qplatformdefs.h
 new file mode 100644
-index 0000000..880c927
+index 0000000000..880c927b21
 --- /dev/null
 +++ b/mkspecs/linux-oe-clang/qplatformdefs.h
 @@ -0,0 +1 @@
diff --git a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
index 6e8aa73..9bcb793 100644
--- a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
+++ b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
@@ -1,4 +1,4 @@
-From c295b6fad2183ff47c8f5c061484713f2fe44583 Mon Sep 17 00:00:00 2001
+From 1bd6f92d57ff09665241343870ebf6c4882c62e4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:44:48 -0700
 Subject: [PATCH] linux-clang: Invert conditional for defining QT_SOCKLEN_T
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/mkspecs/linux-clang/qplatformdefs.h b/mkspecs/linux-clang/qplatformdefs.h
-index d29225f..a0cdb57 100644
+index d29225f12f..a0cdb57343 100644
 --- a/mkspecs/linux-clang/qplatformdefs.h
 +++ b/mkspecs/linux-clang/qplatformdefs.h
 @@ -84,10 +84,10 @@
diff --git a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
index ab124fe..ab52eef 100644
--- a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
+++ b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
@@ -1,4 +1,4 @@
-From 5d00d9490866ee2b3eb88463f45b7d5ea0a8654a Mon Sep 17 00:00:00 2001
+From e9aabbb5549dd76cbc3a6dc5723bbe56559a9fa7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 10:11:50 -0700
 Subject: [PATCH] tst_qlocale: Enable QT_USE_FENV only on glibc
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
-index 10d78b1..a59f358 100644
+index 10d78b1f2f..a59f358f80 100644
 --- a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
 +++ b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
 @@ -46,7 +46,7 @@
diff --git a/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
index 0cb36e1..ab65ce1 100644
--- a/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 7ad9a6e116879730543ae947abef0fe74a5b0dbb Mon Sep 17 00:00:00 2001
+From a3ec19c34cc14e21a66ee723827219f8c04965da Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic
@@ -14,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 3e32f7e..18b268b 100644
+index 3e32f7edb0..18b268bf5e 100644
 --- a/src/src.pro
 +++ b/src/src.pro
 @@ -205,7 +205,7 @@ qtConfig(gui) {
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index e03679e..307e407 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = " \
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
-# 5.9.meta-qt5-shared.5
+# 5.9.meta-qt5-shared.6
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -215,4 +215,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "f2095f2c66d0dae8525879f6c14165ace650e7f1"
+SRCREV = "9c50112304033c631e52f062496f3111f24835a2"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index bdb46f8..6fa5926 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "5b920d86dbc00f05f5679bcf8fe9ee1ba19b06f7"
+SRCREV = "569495de338821ad89153b69a59a5364fc96a49a"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 7a6f7a0..3035d5a 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "47e3a4b81832932f1500c61762fb6d47e0fa8cc2"
+SRCREV = "6acb93f08af0133d3230cd7f9db5f9e0146d7fbf"
 
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index d6f9c06..6995b97 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "b88b57c56b14c88dce83d7c267b5d52d18fd784a"
+SRCREV = "513e69bd6aca390d7e6ef28d3527c24dee99ee2b"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index aa1daeb..f1dfaa8 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "c3c6e604ee1193deb1bbff8e6f26ea2aeefdbe91"
+SRCREV = "4d2efb91ebbdc08ca70ee63a479367d75d5a6357"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 42fc6c6..8f49d97 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "f23d1d54a06b0f3473e17300c3a1c495bcc25fdc"
+SRCREV = "283a900c4e8518fef33a2c89cb597fbf1e6ad78c"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index e07cc99..01d97de 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "d1054b8e44d17ecbfae3cd455e07d6c379ef099a"
+SRCREV = "91b692255f5cb7012000694ff46ea0346293baf5"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 6df632f..27488ce 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "c9a0a0f661d5ce789e5ab6743782afa463dd289a"
+SRCREV = "f61dcaa5e5ef8f5da1b37b25e4bd17469e72ce55"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index bef03e0..c219098 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "bcc376e41f1e99a16bcf9c86b0d8112dd2010b52"
+SRCREV = "e9daef6d8f60015906c1e62e2875b2b6c1494465"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 0af3946..cd24167 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,7 +29,7 @@ SRC_URI += " \
     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "4f8604bf7a94e64f40f5bb769d2105ca4e2f8e9b"
+SRCREV_qtlocation = "b0dd210c2dccd7c1c295cc8cba9872fae6dffe54"
 SRCREV_qtlocation-mapboxgl = "8c1be4ec01ef46bf453856531ebf53b48ce3dbe7"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
index 0bcac42..f3d19de 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
@@ -1,4 +1,4 @@
-From bf2fa82b9ee1a9ab38ddbcdd68327bb5aed06c12 Mon Sep 17 00:00:00 2001
+From ee219bf33cf52c7a7eab7c02823b2e4960392ce0 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Thu, 8 Sep 2016 12:18:13 +0800
 Subject: [PATCH] qtmultimedia: fix a conflicting declaration
@@ -8,15 +8,15 @@ fix a "conflicting declaration" error.
 
 Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
 ---
- src/plugins/videonode/imx6/lgl2.h                  | 46 ++++++++++++++++++++++
- .../videonode/imx6/qsgvivantevideomaterial.cpp     |  5 ++-
- src/plugins/videonode/imx6/qsgvivantevideonode.cpp |  5 ++-
+ src/plugins/videonode/imx6/lgl2.h             | 46 +++++++++++++++++++
+ .../imx6/qsgvivantevideomaterial.cpp          |  5 +-
+ .../videonode/imx6/qsgvivantevideonode.cpp    |  5 +-
  3 files changed, 52 insertions(+), 4 deletions(-)
  create mode 100644 src/plugins/videonode/imx6/lgl2.h
 
 diff --git a/src/plugins/videonode/imx6/lgl2.h b/src/plugins/videonode/imx6/lgl2.h
 new file mode 100644
-index 0000000..2423697
+index 00000000..24236976
 --- /dev/null
 +++ b/src/plugins/videonode/imx6/lgl2.h
 @@ -0,0 +1,46 @@
@@ -67,7 +67,7 @@ index 0000000..2423697
 +
 +#endif
 diff --git a/src/plugins/videonode/imx6/qsgvivantevideomaterial.cpp b/src/plugins/videonode/imx6/qsgvivantevideomaterial.cpp
-index 465ccfa..40e7592 100644
+index 465ccfa7..40e7592b 100644
 --- a/src/plugins/videonode/imx6/qsgvivantevideomaterial.cpp
 +++ b/src/plugins/videonode/imx6/qsgvivantevideomaterial.cpp
 @@ -37,8 +37,9 @@
@@ -83,7 +83,7 @@ index 465ccfa..40e7592 100644
  #include "qsgvivantevideomaterial.h"
  #include "qsgvivantevideomaterialshader.h"
 diff --git a/src/plugins/videonode/imx6/qsgvivantevideonode.cpp b/src/plugins/videonode/imx6/qsgvivantevideonode.cpp
-index c8d83b4..5b1b8f2 100644
+index c8d83b4b..5b1b8f24 100644
 --- a/src/plugins/videonode/imx6/qsgvivantevideonode.cpp
 +++ b/src/plugins/videonode/imx6/qsgvivantevideonode.cpp
 @@ -37,8 +37,9 @@
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 0268c87..b68ec9f 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -26,7 +26,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
 
 # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.9
-# 5.9.meta-qt5.5
+# 5.9.meta-qt5.6
 SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
@@ -35,4 +35,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "01fd723848fd6007b03c27edd85d8e9c6b6ce881"
+SRCREV = "52f5785cfa8193f85859a27caebeb2a10f894f67"
diff --git a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
index 42156dc..930bb6d 100644
--- a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
+++ b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
@@ -1,4 +1,4 @@
-From 6af3818fd0008327839d27ab58cf2af5fa3bcce6 Mon Sep 17 00:00:00 2001
+From ad1e13ce8ff07ca8813e6129fb0525b086a6e3a6 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:57:01 -0400
 Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class QDebug'
@@ -7,11 +7,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- examples/quickcontrols/controls/texteditor/src/documenthandler.cpp | 1 +
+ .../quickcontrols/controls/texteditor/src/documenthandler.cpp    | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp b/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
-index 69da88f..9039191 100644
+index 69da88f0..9039191e 100644
 --- a/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
 +++ b/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
 @@ -54,6 +54,7 @@
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 8c8402e..0d4606d 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "9a2950600087b0784b06b0521b409fce69960a2d"
+SRCREV = "c48b314edef0595fbfa16dc62ce38b8d615326c8"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index c7c491d..4770875 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -20,9 +20,9 @@ FILES_${PN}-qmlplugins += " \
 "
 
 # Patches from https://github.com/meta-qt5/qtquickcontrols/commits/b5.9
-# 5.9.meta-qt5.5
+# 5.9.meta-qt5.6
 SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "75e9561d4fdf8e94c6d556b9a37bdccdaaf80c10"
+SRCREV = "ca6bba7163850222ea8b71dd7db9c70de56a0d4e"
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index 8673901..de5eca8 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -12,7 +12,7 @@ require qt5-git.inc
 DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
 
 # Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.9
-# 5.9.meta-qt5.5
+# 5.9.meta-qt5.6
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
 "
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index e2d5225..8b8a6ca 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "945a4b0ad718a3462660a9782d0a78974a0d8cb9"
+SRCREV = "bc1c3fb95cee0ee525642bd308abbff21572505e"
diff --git a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
index 36a6d03..1d421c5 100644
--- a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
+++ b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
@@ -1,4 +1,4 @@
-From c9886590333dce8a1dd1e198f5449bb841033bc8 Mon Sep 17 00:00:00 2001
+From be7c238b97f6cb104332d6bb956bf0dbe84c22a5 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 10 Jan 2017 15:28:26 +0200
 Subject: [PATCH] Use external host bin path for cmake file
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index 78f4459..7d53905 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,10 +10,10 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "e5bfed810cdceedb8b7597d03c9649cddf9a5f3f"
+SRCREV = "320735f9a43bd07e4c2b8e9019b5706b00475956"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.9
-# 5.9.meta-qt5.5
+# 5.9.meta-qt5.6
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
 do_install_append_class-nativesdk() {
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 2017e00..8d8597a 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "b50891d2d5c8677622eba5f2bb86af7be093c434"
+SRCREV = "30044c5a4a1be9553c3db7a3669acd07431b2512"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 7b86b4e..cee89df 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "5165c67091da4438f2d37290f6c5855250d87eb0"
+SRCREV = "6654d88750cf5431086fe1d3187ec87f52533b18"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 7f3b959..57fa103 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "e40bf5347cb9298cafdb1004366ab436c1493cfe"
+SRCREV = "0a242c49401571d6a5a294935af02c431cc32143"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 54268bf..fbe928e 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "24273f154a4e4930d233e6711cbf718887576002"
+SRCREV = "7a28db8f5bc0149eee67479c1e58d20a7a02be73"
diff --git a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
index f7ada98..84693d7 100644
--- a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From fcbe797b61e624e5859dabfbe932ace2e8022649 Mon Sep 17 00:00:00 2001
+From 1b9514a70d0947ff025762afd42b8f1c84b5d067 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
@@ -16,7 +16,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
-index 82f5509..ef07ee0 100644
+index 82f55092..ef07ee03 100644
 --- a/src/assistant/assistant/assistant.pro
 +++ b/src/assistant/assistant/assistant.pro
 @@ -1,4 +1,4 @@
@@ -35,7 +35,7 @@ index 82f5509..ef07ee0 100644
      QT += webkitwidgets
      SOURCES += helpviewer_qwv.cpp
 diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
-index 500a153..b60fa2d 100644
+index 500a1534..b60fa2d9 100644
 --- a/src/designer/src/plugins/plugins.pro
 +++ b/src/designer/src/plugins/plugins.pro
 @@ -1,6 +1,6 @@
diff --git a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 7abc9ea..4496363 100644
--- a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From f7102d4e5c5c1d9e285b6821e18fff7c2dcea9c0 Mon Sep 17 00:00:00 2001
+From 20d2656c69da63c33e0d15add3726f2c802bca5a Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH] linguist-tools cmake: allow overriding the location for
@@ -9,7 +9,7 @@ Subject: [PATCH] linguist-tools cmake: allow overriding the location for
  1 file changed, 3 insertions(+), 12 deletions(-)
 
 diff --git a/src/linguist/Qt5LinguistToolsConfig.cmake.in b/src/linguist/Qt5LinguistToolsConfig.cmake.in
-index 4318b16..2e3b70f 100644
+index 4318b16f..2e3b70fa 100644
 --- a/src/linguist/Qt5LinguistToolsConfig.cmake.in
 +++ b/src/linguist/Qt5LinguistToolsConfig.cmake.in
 @@ -26,6 +26,9 @@ get_filename_component(_qt5_linguisttools_install_prefix \"${CMAKE_CURRENT_LIST_
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 3ac5d48..660c085 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 # Patches from https://github.com/meta-qt5/qttools/commits/b5.9
-# 5.9.meta-qt5.5
+# 5.9.meta-qt5.6
 SRC_URI += " \
     file://0001-add-noqtwebkit-configuration.patch \
     file://0002-linguist-tools-cmake-allow-overriding-the-location-f.patch \
@@ -29,7 +29,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "0c112f5980a39d370a90c34f8dfb778a6bd6a780"
+SRCREV = "c9eeabc7a7f83eb5603cedf7336f50e089d025af"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
index 185bf50..cd1e4b8 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
+++ b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
@@ -1,4 +1,4 @@
-From c41773c12767dc6735cda8f8ad3d09454366283b Mon Sep 17 00:00:00 2001
+From 3ed215600a5c43d0e5312389a1acdef1a99d8b2f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Jul 2017 23:59:52 -0700
 Subject: [PATCH] include sys/time.h for timeval
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index e5906d6..c769793 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 # Patches from https://github.com/meta-qt5/qtvirtualkeyboard/commits/b5.9
-# 5.9.meta-qt5.5
+# 5.9.meta-qt5.6
 SRC_URI += "file://0001-include-sys-time.h-for-timeval.patch"
 
 # To enabled Nuance T9 Write support, you need to provide the licensed components
@@ -53,4 +53,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "5c9ce0adf6ef8b28bc6196326f711a9d039738ea"
+SRCREV = "3fd388fe385ba7941a77e6a27c9b1e0e57f07198"
diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
index b2ff754..13f0ce8 100644
--- a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
+++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
@@ -1,4 +1,4 @@
-From c9c02d1a7d48f97bcbf85dca884e65b6ed3ec7c1 Mon Sep 17 00:00:00 2001
+From 237d370278dd68fbb16308e2fad044cbcba9797a Mon Sep 17 00:00:00 2001
 From: Raphael Freudiger <laser_b@gmx.ch>
 Date: Tue, 10 Jan 2017 15:49:55 +0100
 Subject: [PATCH] fix build without xkbcommon-evdev
@@ -16,7 +16,7 @@ Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
  3 files changed, 11 insertions(+), 6 deletions(-)
 
 diff --git a/src/client/client.pro b/src/client/client.pro
-index eae7ad5..0bb7b18 100644
+index eae7ad52..0bb7b188 100644
 --- a/src/client/client.pro
 +++ b/src/client/client.pro
 @@ -147,3 +147,5 @@ MODULE_PLUGIN_TYPES = \
@@ -26,7 +26,7 @@ index eae7ad5..0bb7b18 100644
 +
 +LIBS += -lxkbcommon
 diff --git a/src/compositor/compositor.pro b/src/compositor/compositor.pro
-index dc9000d..4eebfd6 100644
+index dc9000d9..4eebfd64 100644
 --- a/src/compositor/compositor.pro
 +++ b/src/compositor/compositor.pro
 @@ -32,3 +32,5 @@ include ($$PWD/extensions/extensions.pri)
@@ -36,7 +36,7 @@ index dc9000d..4eebfd6 100644
 +
 +LIBS += -lxkbcommon
 diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp b/src/compositor/compositor_api/qwaylandkeyboard.cpp
-index c30f7b1..e6f1a0b 100644
+index c30f7b18..e6f1a0b3 100644
 --- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
 +++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
 @@ -349,12 +349,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index e29bc94..eef7d72 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,10 +37,10 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "51b84d998b03cb95b6496e85d804e2788fc122d7"
+SRCREV = "8c5999644c8a98dca74f7339c2c750dd063ae346"
 
 # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.9
-# 5.9.meta-qt5.5
+# 5.9.meta-qt5.6
 # From https://bugreports.qt.io/browse/QTBUG-57767
 SRC_URI += " \
     file://0001-fix-build-without-xkbcommon-evdev.patch \
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index a3d061a..5af9042 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "a9f8d06fe1a7e98f1fa38d8df1627dc66dc92c21"
+SRCREV = "56a155e68de96a80301ef8b9ad183fcb67e86142"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index 90a557f..51eec18 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,4 +1,4 @@
-From 78a0bfb1026cd1a66e25663266896db6920636b9 Mon Sep 17 00:00:00 2001
+From b3ef942f47b12546c558d94683719da8d23282f0 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
 Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
@@ -11,7 +11,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/chromium/ui/gfx/codec/jpeg_codec.cc b/chromium/ui/gfx/codec/jpeg_codec.cc
-index 6d92637..738d3fd 100644
+index 6d926378be..738d3fdedf 100644
 --- a/chromium/ui/gfx/codec/jpeg_codec.cc
 +++ b/chromium/ui/gfx/codec/jpeg_codec.cc
 @@ -121,7 +121,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinfo) {
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
index aa223e1..27ad346 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 7efbed6af08caf6ce2bedbb8fb653b60c3aaa920 Mon Sep 17 00:00:00 2001
+From 87b283dd966ef68df24fd4c988b348f53c59e11b Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
@@ -12,7 +12,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/mkspecs/features/functions.prf b/mkspecs/features/functions.prf
-index b78d2a1..14dd07e 100644
+index b78d2a11..14dd07e5 100644
 --- a/mkspecs/features/functions.prf
 +++ b/mkspecs/features/functions.prf
 @@ -21,6 +21,12 @@ defineTest(isPlatformSupported) {
diff --git a/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 94fa5a6..0a045b0 100644
--- a/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From fe4d996a8a6fe8e0c6b720ff30fa7bff95df2acb Mon Sep 17 00:00:00 2001
+From 68b44d6cd3b3653dd70da39e39eb40900207daff Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index 19ecf5e..f6f638e 100644
+index 19ecf5e1..f6f638ee 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
 @@ -59,6 +59,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
index a2eeee1..eeba5dc 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 7233c121fedcf73d10499afedd19c5e45ae0e4ec Mon Sep 17 00:00:00 2001
+From aba02f51bcaef2117aa8b413638af8134b563778 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] chromium: Force host toolchain configuration
@@ -14,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/chromium/tools/gn/bootstrap/bootstrap.py b/chromium/tools/gn/bootstrap/bootstrap.py
-index 43d252b..e583478 100755
+index 43d252b43e..e58347848e 100755
 --- a/chromium/tools/gn/bootstrap/bootstrap.py
 +++ b/chromium/tools/gn/bootstrap/bootstrap.py
 @@ -298,14 +298,14 @@ def write_gn_ninja(path, root_gen_dir, options):
diff --git a/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
index a61161d..c1aa58f 100644
--- a/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From 4e95d44468ed954d68402c585c6df3c6cd6c5638 Mon Sep 17 00:00:00 2001
+From c665697cce340faab080f45bf8a1e086a5bc7129 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
-index c378c32..1d33d95 100644
+index c378c327..1d33d956 100644
 --- a/src/core/media_capture_devices_dispatcher.h
 +++ b/src/core/media_capture_devices_dispatcher.h
 @@ -45,6 +45,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch
index 5d44489..d864a32 100644
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-workaround-for-too-long-.rps-file-name.patch
@@ -1,4 +1,4 @@
-From b220fb26cdcc7b3b9d2762c46b8e7604f3120cc3 Mon Sep 17 00:00:00 2001
+From e026637ca017f185697de536cf232c0f970286cf Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 30 Mar 2017 11:37:24 +0300
 Subject: [PATCH] chromium: workaround for too long .rps file name
@@ -18,7 +18,7 @@ Change-Id: I73c5e64ae5174412be2a675e35b0b6047f2bf4c1
  1 file changed, 9 insertions(+)
 
 diff --git a/chromium/tools/gn/ninja_action_target_writer.cc b/chromium/tools/gn/ninja_action_target_writer.cc
-index a5bc6cd..5cefbfe 100644
+index a5bc6cd526..5cefbfe77c 100644
 --- a/chromium/tools/gn/ninja_action_target_writer.cc
 +++ b/chromium/tools/gn/ninja_action_target_writer.cc
 @@ -115,9 +115,18 @@ std::string NinjaActionTargetWriter::WriteRuleDefinition() {
diff --git a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
index d85f46f..1ca5745 100644
--- a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From dbcfd868d551beb55a9411c26912050ea278ec48 Mon Sep 17 00:00:00 2001
+From f1f470227778b0f7068ec25e4d5db2aaa0ef4f3e Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] Force host toolchain configuration
@@ -18,7 +18,7 @@ Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/buildtools/configure_host.pro b/src/buildtools/configure_host.pro
-index f1b3d47..1212372 100644
+index f1b3d47b..12123729 100644
 --- a/src/buildtools/configure_host.pro
 +++ b/src/buildtools/configure_host.pro
 @@ -4,7 +4,7 @@ TEMPLATE = aux
@@ -57,7 +57,7 @@ index f1b3d47..1212372 100644
  "  nm = \"$$which(nm)\" " \
  "  toolchain_args = { " \
 diff --git a/src/core/config/linux.pri b/src/core/config/linux.pri
-index 831e195..8a28de5 100644
+index 831e1952..8a28de5d 100644
 --- a/src/core/config/linux.pri
 +++ b/src/core/config/linux.pri
 @@ -98,7 +98,7 @@ contains(QT_ARCH, "mips") {
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index 52d5143..e682b7f 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From 6d7823f7bd60aa63aa11b4c6ac9d8814122e8396 Mon Sep 17 00:00:00 2001
+From 48f6dbfb20364f5184d43959cb1a6b65e1a6cba6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/chromium/sandbox/linux/suid/sandbox.c b/chromium/sandbox/linux/suid/sandbox.c
-index b655d1c..3de34e3 100644
+index b655d1c79c..3de34e36f2 100644
 --- a/chromium/sandbox/linux/suid/sandbox.c
 +++ b/chromium/sandbox/linux/suid/sandbox.c
 @@ -44,6 +44,15 @@ static bool DropRoot();
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index f1e633c..fed2bca 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From 5e4ef7189876b1e2578f12824ad7b0405768f517 Mon Sep 17 00:00:00 2001
+From 4fce1a91096c8a2180f2126e176904b2a1e3275e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
@@ -10,7 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/chromium/base/trace_event/malloc_dump_provider.cc b/chromium/base/trace_event/malloc_dump_provider.cc
-index 7d0cb57..10be59e 100644
+index 7d0cb57931..10be59ebad 100644
 --- a/chromium/base/trace_event/malloc_dump_provider.cc
 +++ b/chromium/base/trace_event/malloc_dump_provider.cc
 @@ -210,6 +210,7 @@ MallocDumpProvider::~MallocDumpProvider() {}
@@ -31,7 +31,7 @@ index 7d0cb57..10be59e 100644
  }
  
 diff --git a/chromium/content/child/content_child_helpers.cc b/chromium/content/child/content_child_helpers.cc
-index 7ddeb4d..b8c73b0 100644
+index 7ddeb4d16a..b8c73b09c5 100644
 --- a/chromium/content/child/content_child_helpers.cc
 +++ b/chromium/content/child/content_child_helpers.cc
 @@ -25,7 +25,7 @@ namespace content {
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
index 6f58299..30a213a 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,15 +1,15 @@
-From d36b3a2fdc5aa94b4dd03bcb509f64e8722fae9d Mon Sep 17 00:00:00 2001
+From f9d402bd9e966ec05717ea3ef62dcbd2943c72b9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:37:49 -0700
 Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h | 1 +
+ .../tcmalloc/chromium/src/base/linux_syscall_support.h           | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-index b29ec2d..91f77dd 100644
+index b29ec2d29a..91f77dd88d 100644
 --- a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
 +++ b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
 @@ -150,6 +150,7 @@ extern "C" {
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index 3b96e06..f72c3a6 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From 536f4a41ea30faabac84ff5bd62b51238ba1cdc7 Mon Sep 17 00:00:00 2001
+From 2a143412893405591f67ec0a74356219e088dbcb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
 Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
@@ -8,11 +8,11 @@ Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- .../third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h | 10 +++++-----
+ .../tcmalloc/chromium/src/malloc_hook_mmap_linux.h     | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h b/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
-index 715c045..edc8cf2 100644
+index 715c045f66..edc8cf2db7 100644
 --- a/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
 +++ b/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
 @@ -77,7 +77,7 @@ typedef off64_t __off64_t;
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
index 77e896d..ed61cc1 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From 7336279ff0cca9216a095dcabf8872418372ee42 Mon Sep 17 00:00:00 2001
+From 00456ee9fa12e815066af7a159e321f274b81e36 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/base/allocator/allocator_check.cc b/chromium/base/allocator/allocator_check.cc
-index 5a0564d..8c2dc64 100644
+index 5a0564d2f3..8c2dc6491d 100644
 --- a/chromium/base/allocator/allocator_check.cc
 +++ b/chromium/base/allocator/allocator_check.cc
 @@ -21,7 +21,7 @@ bool IsAllocatorInitialized() {
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index 498b04d..cab250a 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From 51c5ff669beda6efec97f28bf6c94329e193eafd Mon Sep 17 00:00:00 2001
+From b5ca1e638adfc1241435cf27279b8e7ec05c18af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
@@ -10,7 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/base/allocator/allocator_shim.cc b/chromium/base/allocator/allocator_shim.cc
-index 95480ea..1de3d1a 100644
+index 95480ea4b6..1de3d1a532 100644
 --- a/chromium/base/allocator/allocator_shim.cc
 +++ b/chromium/base/allocator/allocator_shim.cc
 @@ -266,7 +266,7 @@ void ShimFree(void* address) {
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index 37da85e..7d1d43b 100644
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From 79ba4e54de16b6ef69ed4561edc694c0f4b77e5c Mon Sep 17 00:00:00 2001
+From 1b1ebf58dccdc53145a2778193e95987fcf464c9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
 Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
@@ -10,7 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/sandbox/linux/seccomp-bpf/trap.cc b/chromium/sandbox/linux/seccomp-bpf/trap.cc
-index 003708d..0fef314 100644
+index 003708d2c8..0fef3148f9 100644
 --- a/chromium/sandbox/linux/seccomp-bpf/trap.cc
 +++ b/chromium/sandbox/linux/seccomp-bpf/trap.cc
 @@ -168,7 +168,7 @@ void Trap::SigSys(int nr, LinuxSigInfo* info, ucontext_t* ctx) {
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch
index d713d3a..d80790d 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Match-syscalls-to-match-musl.patch
@@ -1,4 +1,4 @@
-From a8af55b0070d9cd9e80ccc8535437435d7f3960c Mon Sep 17 00:00:00 2001
+From 23892285ca39c626aa77bca3dbccffe7f7784b91 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:24:49 -0700
 Subject: [PATCH] chromium: musl: Match syscalls to match musl
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 16 insertions(+)
 
 diff --git a/chromium/third_party/lss/linux_syscall_support.h b/chromium/third_party/lss/linux_syscall_support.h
-index 9dbd239..a715de1 100644
+index 9dbd2391b2..a715de177c 100644
 --- a/chromium/third_party/lss/linux_syscall_support.h
 +++ b/chromium/third_party/lss/linux_syscall_support.h
 @@ -793,6 +793,14 @@ struct kernel_statfs {
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index 2258a50..0728aaf 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From 2268eab4b28c1817a2ecd69c27730f9a46807e93 Mon Sep 17 00:00:00 2001
+From 9c441f0780c663b3029eedd2a3589418e7c33604 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
 Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
@@ -6,14 +6,14 @@ Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- chromium/net/dns/dns_config_service_posix.cc |  4 ++++
- chromium/net/dns/dns_reloader.cc             |  4 ++++
- chromium/net/dns/resolv_compat.h             | 29 ++++++++++++++++++++++++++++
+ chromium/net/dns/dns_config_service_posix.cc |  4 +++
+ chromium/net/dns/dns_reloader.cc             |  4 +++
+ chromium/net/dns/resolv_compat.h             | 29 ++++++++++++++++++++
  3 files changed, 37 insertions(+)
  create mode 100644 chromium/net/dns/resolv_compat.h
 
 diff --git a/chromium/net/dns/dns_config_service_posix.cc b/chromium/net/dns/dns_config_service_posix.cc
-index ba8a369..e9b40d0 100644
+index ba8a369133..e9b40d07fc 100644
 --- a/chromium/net/dns/dns_config_service_posix.cc
 +++ b/chromium/net/dns/dns_config_service_posix.cc
 @@ -25,6 +25,10 @@
@@ -28,7 +28,7 @@ index ba8a369..e9b40d0 100644
  #include "net/dns/dns_config_watcher_mac.h"
  #endif
 diff --git a/chromium/net/dns/dns_reloader.cc b/chromium/net/dns/dns_reloader.cc
-index 74534e6..2780a77 100644
+index 74534e6b1b..2780a776e4 100644
 --- a/chromium/net/dns/dns_reloader.cc
 +++ b/chromium/net/dns/dns_reloader.cc
 @@ -9,6 +9,10 @@
@@ -44,7 +44,7 @@ index 74534e6..2780a77 100644
  #include "base/macros.h"
 diff --git a/chromium/net/dns/resolv_compat.h b/chromium/net/dns/resolv_compat.h
 new file mode 100644
-index 0000000..4f0e852
+index 0000000000..4f0e852a19
 --- /dev/null
 +++ b/chromium/net/dns/resolv_compat.h
 @@ -0,0 +1,29 @@
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index e4df9f6..e175b74 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From 8d4ab971e015059b3509dff4e7b7ff0382c2c6fa Mon Sep 17 00:00:00 2001
+From a6fc99a6328212972836d914d333f3670e3c4726 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
 Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
@@ -8,11 +8,11 @@ argument, so we just let it out for now
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h | 2 +-
+ .../third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h  | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h b/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
-index edc8cf2..a868b50 100644
+index edc8cf2db7..a868b50d30 100644
 --- a/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
 +++ b/chromium/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
 @@ -233,7 +233,7 @@ extern "C" void* mremap(void* old_addr, size_t old_size, size_t new_size,
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
index bec98b0..55739c8 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,16 +1,16 @@
-From 5a83638e13e6d5b1d8aa401af12dbe29bcea8cda Mon Sep 17 00:00:00 2001
+From c190fb457fbe9f1c3adedcdadbda581ac5ed2286 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- chromium/base/threading/platform_thread_linux.cc                     | 3 ++-
- chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp | 4 ++--
+ chromium/base/threading/platform_thread_linux.cc              | 3 ++-
+ .../WebKit/Source/platform/heap/StackFrameDepth.cpp           | 4 ++--
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/chromium/base/threading/platform_thread_linux.cc b/chromium/base/threading/platform_thread_linux.cc
-index 92fbda5..c41579d 100644
+index 92fbda5ee1..c41579d4ed 100644
 --- a/chromium/base/threading/platform_thread_linux.cc
 +++ b/chromium/base/threading/platform_thread_linux.cc
 @@ -175,7 +175,8 @@ void TerminateOnThread() {}
@@ -24,7 +24,7 @@ index 92fbda5..c41579d 100644
    // ThreadSanitizer bloats the stack heavily. Evidence has been that the
    // default stack size isn't enough for some browser tests.
 diff --git a/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp b/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
-index 1d164f5..3358deb 100644
+index 1d164f510a..3358deb256 100644
 --- a/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
 +++ b/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
 @@ -68,7 +68,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize() {
diff --git a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index 13ecb95..be406a7 100644
--- a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From 4394020a7bfbac6fb78cf498f7bdaa9adf153707 Mon Sep 17 00:00:00 2001
+From c4f2176d88f331d8fc150c4bf598d2f2a5f3a1e1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/chromium/device/serial/serial_io_handler_posix.cc b/chromium/device/serial/serial_io_handler_posix.cc
-index a2ca2e2..e139cdf 100644
+index a2ca2e2309..e139cdf9e9 100644
 --- a/chromium/device/serial/serial_io_handler_posix.cc
 +++ b/chromium/device/serial/serial_io_handler_posix.cc
 @@ -6,6 +6,7 @@
diff --git a/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index d4bdc8b..feaaca3 100644
--- a/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,15 +1,15 @@
-From 5e2fae4322189dc359c469fed55c7fadbf46418e Mon Sep 17 00:00:00 2001
+From 69ab8dd347721db368d2dad63987a69c9c4f128e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
 Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h | 2 +-
+ .../tcmalloc/chromium/src/base/linux_syscall_support.h          | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-index 91f77dd..bb84a0b 100644
+index 91f77dd88d..bb84a0b305 100644
 --- a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
 +++ b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
 @@ -1929,7 +1929,7 @@ typedef unsigned long int ulong;
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index e8f44c5..656ee30 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -131,7 +131,7 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "56-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.9
-# 5.9.meta-qt5.5
+# 5.9.meta-qt5.6
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-allow-build-for-linux-oe-g-platform.patch \
@@ -141,7 +141,7 @@ SRC_URI += " \
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based
-# 56-based.meta-qt5.5
+# 56-based.meta-qt5.6
 SRC_URI += " \
     file://0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
     file://0002-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
@@ -164,8 +164,8 @@ SRC_URI_append_libc-musl = "\
     file://0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "7af0066e50aa4c73cadafe2d47bc368a5b0187f6"
-SRCREV_chromium = "4f2e755be232c9083108e55a30876a19b67e25d4"
+SRCREV_qtwebengine = "cc526afe9c2cdd4502c90b8f9b505812c984ea08"
+SRCREV_chromium = "e5175271484644d6101ff3901aaabf2bceb06f28"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index ebf8a53..ccbe480 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "74ea21a46daa8c8e3c1814ec517e360cb9503a9e"
+SRCREV = "3dc383a8078d7478a230ca7acac922b373bb9930"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index e60cc20..f17b94e 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "4acd68bc1c8b97c3764442d95515c10d226e564b"
+SRCREV = "acc015e1cad69aa1a5224f6a3dcafa79df3a9286"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 57f8d85..2057ca8 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "4644f175b9abbe770818a77e058f08b888f6e8b7"
+SRCREV = "b51ac2d46ca54769e242702f87bc6762f9f68ea9"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 7f306f8..1e9c910 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -15,6 +15,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "3444bfc8039c5090b02fd7f98abe8064a73019d7"
+SRCREV = "4dcae15a5a7f848addfb1b6bc2a98a63dc7218b4"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.17.1


