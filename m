Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id CFA9E60064
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 14:11:30 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r15-v6so10362658wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=w4ZhL0T44siMsYwxp7WEux2qZL1aqO3uhcS+JrHdT5E=;
	b=EvO4bMPU0BEvKjDmTYUtQTES9o/VjpVWcfHpxuH1e8uZHa71xO5sJVFwEjluDXRq2e
	2C5Iw++pav824CNf3/whcdjNquqeevA/mhnRts845X5XC38mILbOmmpZRsrShE3dp4gS
	9bT0EDNRs+KnFDUqQAsjRH7ux6O5OjMHMVUJyGLk94yBE7yuVITMUqGdNXEamG0UdHKi
	qg0En7BJkLsm5gYCcDgeL5nYOjfmCmdn9gq1Lr135YlWtKOefLaJJEa+FB3os1lxz5nb
	wANbLf0BCNOKV7AwJ+XE5HboNAPhqRF1d4m+vwsN8rfrePvGuTUosMdGc3YAxvkdl35b
	wFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w4ZhL0T44siMsYwxp7WEux2qZL1aqO3uhcS+JrHdT5E=;
	b=ccCtlpaijXV2+GY/1aZWcvIIMYcDn6TLQmEh8U01oeFLi8pkUm0y24F10hWF3ppV5S
	NSuiYf5IihikY1etNXvJy573BdLqEVKsnq+d6hhhmUHw1Lf71OT8lHe0XAJTMtGhbzcR
	ox6bTUBKghG+Usd289UkCEJYS+R6ipKcldknlaSU0sz/jyGz04+yIfHAHXZGFQ/I99lJ
	VJAkmm0Vgtv/2afU6mTIjWk/yntTFMNryPS4X4DOd+ZC/bOOvdDaGo8DhBFS45tgyVcF
	9vpu6BlyDNZOPEsgoZyqfIqXyMKXNVYIB6C4A/Jq71+2X/xcQAA9tnr1bizSwd1z1o4F
	k+5w==
X-Gm-Message-State: APt69E3ALrBdqXFxHf2li5FePjOxw2/fF1k7FpIjwhG90zmMNyjQRGTn
	o0DMV9eBLNyEeSGx6/kqR3Lk2w==
X-Google-Smtp-Source: ADUXVKIjX9UtrKP/ws04uAodQrcwBmBtKVp5gnfDBT8JrG0P0wSvwXZY+uQHGEvPQT9CxwIFJ+UEng==
X-Received: by 2002:a1c:d905:: with SMTP id q5-v6mr6416486wmg.78.1528639890240;
	Sun, 10 Jun 2018 07:11:30 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j13-v6sm61608914wre.38.2018.06.10.07.11.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 07:11:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 14:11:29 +0000
Message-Id: <20180610141129.4137-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][meta-qt5] qt5: refresh the patches and update them on meta-qt5 repositories
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
X-List-Received-Date: Sun, 10 Jun 2018 14:11:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch |  8 ++++----
 recipes-qt/qt5/qt3d_git.bb                       |  2 +-
 .../qtbase/0001-Add-linux-oe-g-platform.patch    | 16 ++++++++--------
 ...ke-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch |  8 ++++----
 ...allow-to-set-qt.conf-from-the-outside-u.patch |  4 ++--
 ...p-path-length-from-256-to-512-character.patch |  4 ++--
 ...nknown-features-instead-of-erroring-out.patch |  4 ++--
 ...asn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch |  6 +++---
 .../0007-Delete-qlonglong-and-qulonglong.patch   |  4 ++--
 ...-Replace-pthread_yield-with-sched_yield.patch |  6 +++---
 ...dd-OE-specific-specs-for-clang-compiler.patch |  8 ++++----
 recipes-qt/qt5/qtbase_git.bb                     |  2 +-
 ...ultimedia-fix-a-conflicting-declaration.patch | 14 +++++++-------
 recipes-qt/qt5/qtmultimedia_git.bb               |  2 +-
 .../0001-Allow-a-tools-only-build.patch          |  2 +-
 recipes-qt/qt5/qtremoteobjects_git.bb            |  2 +-
 ...e-external-host-bin-path-for-cmake-file.patch |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                    |  2 +-
 .../0001-add-noqtwebkit-configuration.patch      |  6 +++---
 ...s-cmake-allow-overriding-the-location-f.patch |  4 ++--
 recipes-qt/qt5/qttools_git.bb                    |  2 +-
 ...ickwebengineview_p_p.h-add-include-QCol.patch |  4 ++--
 ...mium-Force-host-toolchain-configuration.patch |  4 ++--
 ...ependency-to-QCoreApplication-translate.patch |  4 ++--
 ...-workaround-for-too-long-.rps-file-name.patch |  4 ++--
 ...0003-Force-host-toolchain-configuration.patch |  6 +++---
 ...-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch |  4 ++--
 ...-Avoid-mallinfo-APIs-on-non-glibc-linux.patch |  8 ++++----
 ...e-pvalloc-as-it-s-not-available-on-musl.patch |  4 ++--
 ...hromium-musl-include-fcntl.h-for-loff_t.patch |  6 +++---
 .../0005-musl-link-against-libexecinfo.patch     |  4 ++--
 ...-use-off64_t-instead-of-the-internal-__.patch |  6 +++---
 ...m-musl-linux-glibc-make-the-distinction.patch |  4 ++--
 ...-allocator-Do-not-include-glibc_weak_sy.patch |  4 ++--
 ...-Use-correct-member-name-__si_fields-fr.patch |  4 ++--
 ...-Define-res_ninit-and-res_nclose-for-no.patch | 14 +++++++-------
 ...omium-musl-Do-not-define-__sbrk-on-musl.patch |  6 +++---
 ...-musl-Adjust-default-pthread-stack-size.patch |  6 +++---
 ...-include-asm-generic-ioctl.h-for-TCGETS.patch |  4 ++--
 ...-tcmalloc-Use-off64_t-insread-of-__off6.patch |  6 +++---
 recipes-qt/qt5/qtwebengine_git.bb                |  4 ++--
 41 files changed, 107 insertions(+), 107 deletions(-)

diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index 30d32b4..3741b63 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 0fc2916634a213f38b81ae74160136cf384f6166 Mon Sep 17 00:00:00 2001
+From 991fd18a30002d964cf3a6ec9309750d0f7d4365 Mon Sep 17 00:00:00 2001
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
-index 64f2b9f..d108e7f 100644
+index 64f2b9fc7..d108e7fa7 100644
 --- a/tools/tools.pro
 +++ b/tools/tools.pro
 @@ -1,4 +1,4 @@
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 07b28ac..0b6640b 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -12,7 +12,7 @@ DEPENDS += "qtbase"
 DEPENDS_class-target += "qtdeclarative qt3d-native"
 
 # Patches from https://github.com/meta-qt5/qt3d/commits/b5.11
-# 5.11.meta-qt5.2
+# 5.11.meta-qt5.3
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
 "
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index dbb0b9d..c2a0d04 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 6a84c4a36742716b5db715c2538901f37ff8b1c5 Mon Sep 17 00:00:00 2001
+From 0152f09dc119c93cc92bc2bb9de38c64fb0a854e Mon Sep 17 00:00:00 2001
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
- mkspecs/linux-oe-g++/qmake.conf      | 42 ++++++++++++++++++++++++++++++++++++
+ mkspecs/linux-oe-g++/qmake.conf      | 42 ++++++++++++++++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h |  1 +
  5 files changed, 47 insertions(+), 4 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 2830a1b..6445dc2 100755
+index 2830a1b189..6445dc2d5a 100755
 --- a/configure
 +++ b/configure
 @@ -712,7 +712,7 @@ fi
@@ -43,7 +43,7 @@ index 2830a1b..6445dc2 100755
  
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
-index 0000000..30d31ed
+index 0000000000..30d31ed16d
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qmake.conf
 @@ -0,0 +1,42 @@
@@ -126,7 +126,7 @@ index 0000000..30d31ed
 +load(qt_config)
 diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
 new file mode 100644
-index 0000000..5d22fb4
+index 0000000000..5d22fb4101
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qplatformdefs.h
 @@ -0,0 +1 @@
diff --git a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
index 5c23052..81600f8 100644
--- a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
+++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
@@ -1,4 +1,4 @@
-From 7c0c897d0d534bfc9183f9da1d9b280e709b0917 Mon Sep 17 00:00:00 2001
+From eb39258656c27c72c34674201b946d27eeefe24a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
@@ -19,7 +19,7 @@ Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index e0652fd..215f435 100644
+index e0652fdcf9..215f4357f8 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
@@ -50,7 +50,7 @@ index e0652fd..215f435 100644
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
index d0d5390..e2c6ed4 100644
--- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From d52e2787db887056eed59b9020f1ca625cffa2e4 Mon Sep 17 00:00:00 2001
+From b5dac69f4309950b828566002d07662b77e34097 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 422d08f..a59df4f 100644
+index 422d08f32c..a59df4f20e 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -172,7 +172,10 @@ void QLibrarySettings::load()
diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
index e806fab..db4fd8d 100644
--- a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From eb7df134dff6991cf9d84ea0c8313dfa1f2cc4dc Mon Sep 17 00:00:00 2001
+From a635233ec28ce588ffb5a46fb9fbbda318dafb35 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -15,7 +15,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.pri b/configure.pri
-index 0512ef0..8a53223 100644
+index 0512ef0144..8a53223a4e 100644
 --- a/configure.pri
 +++ b/configure.pri
 @@ -817,10 +817,10 @@ defineTest(qtConfOutput_preparePaths) {
diff --git a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
index 88967e7..4d6e3f9 100644
--- a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
+++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -1,4 +1,4 @@
-From a1799db5d1b2e2e7d47c37872e887dfab4b4974a Mon Sep 17 00:00:00 2001
+From 245cca40e10db2f9528a03c4941308a52ab26844 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Mon, 24 Oct 2016 09:45:18 +0300
 Subject: [PATCH] Disable all unknown features instead of erroring out
@@ -10,7 +10,7 @@ Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_configure.prf
-index 6e29eaa..de8c8d2 100644
+index 6e29eaa2b7..de8c8d26e6 100644
 --- a/mkspecs/features/qt_configure.prf
 +++ b/mkspecs/features/qt_configure.prf
 @@ -1265,7 +1265,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
diff --git a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index 3d5a732..a24af4a 100644
--- a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From 2df6d12cfef0769f7801410cad012dd20d0497e2 Mon Sep 17 00:00:00 2001
+From 8d321a556a0fe17a549c4c07fb8a5ddf8a29ada1 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
@@ -30,7 +30,7 @@ Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
-index 27f4c27..01f68a5 100644
+index 27f4c277d6..01f68a569d 100644
 --- a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
 +++ b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
 @@ -3,6 +3,11 @@ if (CMAKE_VERSION VERSION_LESS 3.1.0)
@@ -46,7 +46,7 @@ index 27f4c27..01f68a5 100644
  !!IF !isEmpty(CMAKE_LIB_DIR_IS_ABSOLUTE)
  set(_qt5$${CMAKE_MODULE_NAME}_install_prefix \"$$[QT_INSTALL_PREFIX]\")
 diff --git a/src/corelib/Qt5Config.cmake.in b/src/corelib/Qt5Config.cmake.in
-index 6b6544f..d317912 100644
+index 6b6544f932..d317912632 100644
 --- a/src/corelib/Qt5Config.cmake.in
 +++ b/src/corelib/Qt5Config.cmake.in
 @@ -3,6 +3,11 @@ if (CMAKE_VERSION VERSION_LESS 3.1.0)
diff --git a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
index 57ad3f8..0a1b7c2 100644
--- a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
+++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
@@ -1,4 +1,4 @@
-From 6407bc53339920c16bf384145e4dd95ed0c325d0 Mon Sep 17 00:00:00 2001
+From b13e2643502bd8269515b79f296d3959ad43b100 Mon Sep 17 00:00:00 2001
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
index 1262ffe..e57c9e9 100644
--- a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
+++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
@@ -1,4 +1,4 @@
-From 9f9eac8d12531fe6ec3aa77f719c0b8ca7cfdd75 Mon Sep 17 00:00:00 2001
+From 7e6170bff92157204e2f08da0cb531c133654cc0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 27 Jul 2017 08:02:51 -0700
 Subject: [PATCH] Replace pthread_yield with sched_yield
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
-index c6fd5d1..7bf6bfd 100644
+index c6fd5d17c2..7bf6bfd0e6 100644
 --- a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 +++ b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 @@ -34,7 +34,7 @@
@@ -36,7 +36,7 @@ index c6fd5d1..7bf6bfd 100644
              QMetaType info(tp);
              if (!info.isValid()) {
 diff --git a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
-index fc92ed6..e59b858 100644
+index fc92ed6cbc..e59b858758 100644
 --- a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 +++ b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 @@ -78,6 +78,7 @@
diff --git a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
index 7eb78fa..480d492 100644
--- a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
+++ b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
@@ -1,11 +1,11 @@
-From ef4ff7241ee33819f11357d5a6ceee58146d63b4 Mon Sep 17 00:00:00 2001
+From fe973eb4d92470888e71996300dec146f31d9512 Mon Sep 17 00:00:00 2001
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
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index cc002b3..23e8344 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.11-shared
-# 5.11.meta-qt5-shared.2
+# 5.11.meta-qt5-shared.3
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
diff --git a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
index ddcc7f5..6f7351d 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
@@ -1,4 +1,4 @@
-From 556f69870fb3b5788ebae2baa9b832cb4d6fd996 Mon Sep 17 00:00:00 2001
+From 18faeda3b2c111ad0ceb31142ce2ab1e6075063e Mon Sep 17 00:00:00 2001
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
index 0f272e5..deb193f 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -28,7 +28,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstream
 CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DMESA_EGL_NO_X11_HEADERS=1', d)}"
 
 # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.11
-# 5.11.meta-qt5.2
+# 5.11.meta-qt5.3
 SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
diff --git a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
index 3d3599d..5a5f9fc 100644
--- a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 51cfd34b85738194616c7a9354d707cc96062450 Mon Sep 17 00:00:00 2001
+From fd662625b4954ee21897c40fe586eaa39fe0f44b Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 7 Jun 2017 15:17:12 +0300
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index ff61321..2ac9fa4 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -12,7 +12,7 @@ require qt5-git.inc
 DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
 
 # Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.11
-# 5.11.meta-qt5.2
+# 5.11.meta-qt5.3
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
 "
diff --git a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
index 348693d..1857614 100644
--- a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
+++ b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
@@ -1,4 +1,4 @@
-From 602abde351bcb2ac475253cf547e15f10620b6e7 Mon Sep 17 00:00:00 2001
+From 576c6859c460d10d1345e6ebbdcdb80accd191be Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 10 Jan 2017 15:28:26 +0200
 Subject: [PATCH] Use external host bin path for cmake file
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index dae2cde..655f060 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -13,7 +13,7 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 SRCREV = "71a101b5cbdbe9e32053ce61a5b6417a6990d780"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.11
-# 5.11.meta-qt5.2
+# 5.11.meta-qt5.3
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
 do_install_append_class-nativesdk() {
diff --git a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
index 5d3f984..2aa9083 100644
--- a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 2a61817d5eac01b1dbc445a65d14573294b7ed71 Mon Sep 17 00:00:00 2001
+From f54b0d7ee9af320971371c169b8d5c8d1432be71 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
@@ -16,7 +16,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
-index 1374c07..28c45a2 100644
+index 1374c073..28c45a25 100644
 --- a/src/assistant/assistant/assistant.pro
 +++ b/src/assistant/assistant/assistant.pro
 @@ -1,4 +1,4 @@
@@ -35,7 +35,7 @@ index 1374c07..28c45a2 100644
      QT += webkitwidgets
      SOURCES += helpviewer_qwv.cpp
 diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
-index 500a153..b60fa2d 100644
+index 500a1534..b60fa2d9 100644
 --- a/src/designer/src/plugins/plugins.pro
 +++ b/src/designer/src/plugins/plugins.pro
 @@ -1,6 +1,6 @@
diff --git a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 790657b..5e37500 100644
--- a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From db6995482d1bd290ea8f09a02ff31f8e769f87c4 Mon Sep 17 00:00:00 2001
+From a327c35e62bb1763652e7bcff71be088ba1d11fb Mon Sep 17 00:00:00 2001
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
index 447164c..ee68053 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 # Patches from https://github.com/meta-qt5/qttools/commits/b5.11
-# 5.11.meta-qt5.2
+# 5.11.meta-qt5.3
 SRC_URI += " \
     file://0001-add-noqtwebkit-configuration.patch \
     file://0002-linguist-tools-cmake-allow-overriding-the-location-f.patch \
diff --git a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 17f3405..1047b49 100644
--- a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From 882d9b41fd538c3dd4170bdcdb3938f8989d7700 Mon Sep 17 00:00:00 2001
+From 5df2dabfec0ea3d0cd7f666d25a8fcb4f415ca83 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index 73607aa..151d261 100644
+index 73607aa5..151d261d 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
 @@ -61,6 +61,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
index c5e9ea5..6de64b0 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 42ad6935a99271f9b481423162d9ead15ffa9ec9 Mon Sep 17 00:00:00 2001
+From e3b98ab1d2e08c0072bd83dd7f487f404cc3a44a Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] chromium: Force host toolchain configuration
@@ -14,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/chromium/tools/gn/bootstrap/bootstrap.py b/chromium/tools/gn/bootstrap/bootstrap.py
-index 93c6446..0fe7e67 100755
+index 93c6446f28..0fe7e6737d 100755
 --- a/chromium/tools/gn/bootstrap/bootstrap.py
 +++ b/chromium/tools/gn/bootstrap/bootstrap.py
 @@ -352,10 +352,10 @@ def write_gn_ninja(path, root_gen_dir, options):
diff --git a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
index e8cd395..1670ef6 100644
--- a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From 1095ff439340980b297eb988f23fceb5d198b18e Mon Sep 17 00:00:00 2001
+From 5cbb27925e55a3bf14f36938e32366905aca6b9f Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
-index 579d159..0904c46 100644
+index 579d159a..0904c468 100644
 --- a/src/core/media_capture_devices_dispatcher.h
 +++ b/src/core/media_capture_devices_dispatcher.h
 @@ -45,6 +45,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
index bc06664..42eb193 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
@@ -1,4 +1,4 @@
-From 95c0c42ca5103adef307fc29b53d8f95b4755baa Mon Sep 17 00:00:00 2001
+From d39590cf1ee3adcf6d93cc40263c377e2a5cf0e2 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 30 Mar 2017 11:37:24 +0300
 Subject: [PATCH] chromium: workaround for too long .rps file name
@@ -18,7 +18,7 @@ Change-Id: I73c5e64ae5174412be2a675e35b0b6047f2bf4c1
  1 file changed, 9 insertions(+)
 
 diff --git a/chromium/tools/gn/ninja_action_target_writer.cc b/chromium/tools/gn/ninja_action_target_writer.cc
-index bab07c5..8f889ae 100644
+index bab07c5d2b..8f889aebc1 100644
 --- a/chromium/tools/gn/ninja_action_target_writer.cc
 +++ b/chromium/tools/gn/ninja_action_target_writer.cc
 @@ -117,9 +117,18 @@ std::string NinjaActionTargetWriter::WriteRuleDefinition() {
diff --git a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
index 13e0dc9..c87537c 100644
--- a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From e0d8fe57a8bbd1c24ae35d93c54ab0c6e58eff20 Mon Sep 17 00:00:00 2001
+From 18a18b46eea62c7c58f78a7ee2c3c936d0d34c85 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] Force host toolchain configuration
@@ -18,7 +18,7 @@ Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/buildtools/configure_host.pro b/src/buildtools/configure_host.pro
-index dd0d3e3..70161c8 100644
+index dd0d3e32..70161c82 100644
 --- a/src/buildtools/configure_host.pro
 +++ b/src/buildtools/configure_host.pro
 @@ -4,7 +4,7 @@ TEMPLATE = aux
@@ -57,7 +57,7 @@ index dd0d3e3..70161c8 100644
  "  nm = \"$$which(nm)\" " \
  "  toolchain_args = { " \
 diff --git a/src/core/config/linux.pri b/src/core/config/linux.pri
-index 68d64fd..9ab43df 100644
+index 68d64fd4..9ab43df1 100644
 --- a/src/core/config/linux.pri
 +++ b/src/core/config/linux.pri
 @@ -91,7 +91,7 @@ contains(QT_ARCH, "mips") {
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index 375b01a..96dee6a 100644
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From 37e7051ef185d7b1a237db725d98f63a155fc95b Mon Sep 17 00:00:00 2001
+From b0f4e5412e2cd7eecd63e61c2903d27bad1e438f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/chromium/sandbox/linux/suid/sandbox.c b/chromium/sandbox/linux/suid/sandbox.c
-index 66f68ef..9284d0d 100644
+index 66f68ef138..9284d0d4fc 100644
 --- a/chromium/sandbox/linux/suid/sandbox.c
 +++ b/chromium/sandbox/linux/suid/sandbox.c
 @@ -44,6 +44,15 @@ static bool DropRoot();
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index 46f1c9c..12cdad8 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From 2ddd74e630db38b951697c0b020245c0c83b2316 Mon Sep 17 00:00:00 2001
+From e77a7338d6c25babab860fd1456047ec90297fe9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/chromium/base/process/process_metrics_posix.cc b/chromium/base/process/process_metrics_posix.cc
-index 73a52d6..4867198 100644
+index 73a52d6210..4867198a50 100644
 --- a/chromium/base/process/process_metrics_posix.cc
 +++ b/chromium/base/process/process_metrics_posix.cc
 @@ -94,14 +94,14 @@ size_t ProcessMetrics::GetMallocUsage() {
@@ -32,7 +32,7 @@ index 73a52d6..4867198 100644
    return 0;
  #endif
 diff --git a/chromium/base/trace_event/malloc_dump_provider.cc b/chromium/base/trace_event/malloc_dump_provider.cc
-index ffd5191..0c9131e 100644
+index ffd519133c..0c9131e98e 100644
 --- a/chromium/base/trace_event/malloc_dump_provider.cc
 +++ b/chromium/base/trace_event/malloc_dump_provider.cc
 @@ -197,6 +197,7 @@ MallocDumpProvider::~MallocDumpProvider() = default;
@@ -53,7 +53,7 @@ index ffd5191..0c9131e 100644
  }
  
 diff --git a/chromium/content/child/content_child_helpers.cc b/chromium/content/child/content_child_helpers.cc
-index 7ddeb4d..b8c73b0 100644
+index 7ddeb4d16a..b8c73b09c5 100644
 --- a/chromium/content/child/content_child_helpers.cc
 +++ b/chromium/content/child/content_child_helpers.cc
 @@ -25,7 +25,7 @@ namespace content {
diff --git a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch b/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
index f67baea..34e6909 100644
--- a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
@@ -1,4 +1,4 @@
-From 84d83fa843e72e2154375c8a002a74dc31ab8aae Mon Sep 17 00:00:00 2001
+From 036d00c37384ceef85728d22acdef0c4a97858ea Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 12 Dec 2017 16:06:14 +0200
 Subject: [PATCH] musl: don't use pvalloc as it's not available on musl
@@ -10,7 +10,7 @@ Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
  1 file changed, 8 deletions(-)
 
 diff --git a/src/core/api/qtbug-61521.cpp b/src/core/api/qtbug-61521.cpp
-index 002a1af..8fd2da3 100644
+index 002a1af2..8fd2da36 100644
 --- a/src/core/api/qtbug-61521.cpp
 +++ b/src/core/api/qtbug-61521.cpp
 @@ -74,10 +74,6 @@ SHIM_SYMBOL_VERSION(valloc);
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
index e9324b6..d30693b 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,15 +1,15 @@
-From e627afbd990a189d3eaf9992088bd506e306a680 Mon Sep 17 00:00:00 2001
+From 570159b9334b8eb242b597846cd2cfa82164babf Mon Sep 17 00:00:00 2001
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
diff --git a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch b/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
index 88d9542..5419b3b 100644
--- a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
@@ -1,4 +1,4 @@
-From acc9fd7805f48fc998f1733db1fd58b05d381582 Mon Sep 17 00:00:00 2001
+From 1cc4f23181c03adcf246c296ba188c11a1fe40f7 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 14 Dec 2017 11:28:10 +0200
 Subject: [PATCH] musl: link against libexecinfo
@@ -10,7 +10,7 @@ Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/core/core_module.pro b/src/core/core_module.pro
-index d21985e..eeebeb4 100644
+index d21985e6..eeebeb4f 100644
 --- a/src/core/core_module.pro
 +++ b/src/core/core_module.pro
 @@ -54,7 +54,7 @@ linux {
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index 6e63631..652d782 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From cfd8e1d9c17cc365c5d49d99b47ce8e06e725f86 Mon Sep 17 00:00:00 2001
+From 9e7821ff3f65bc6b5b541800c4911c28121e25d4 Mon Sep 17 00:00:00 2001
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
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
index dd2d7a3..328481e 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From 3bfe9fa1e05ae2faec6dc73895c2bf265ec66d3b Mon Sep 17 00:00:00 2001
+From 9e83cb6ba980a66563cc4c5b5c863180f0b538aa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/base/allocator/allocator_check.cc b/chromium/base/allocator/allocator_check.cc
-index 9cd5d22..1e70095 100644
+index 9cd5d2207d..1e70095648 100644
 --- a/chromium/base/allocator/allocator_check.cc
 +++ b/chromium/base/allocator/allocator_check.cc
 @@ -27,7 +27,7 @@ bool IsAllocatorInitialized() {
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index a9e5e2b..c730927 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From f9e47fe475eb60c4615215214cea344280e5b26f Mon Sep 17 00:00:00 2001
+From 6984ed77603d2c20f7cfdc3aa25d79bafaa475c0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
@@ -10,7 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/base/allocator/allocator_shim.cc b/chromium/base/allocator/allocator_shim.cc
-index 4b7de5e..fe56522 100644
+index 4b7de5e1a3..fe565223f2 100644
 --- a/chromium/base/allocator/allocator_shim.cc
 +++ b/chromium/base/allocator/allocator_shim.cc
 @@ -302,7 +302,7 @@ ALWAYS_INLINE void ShimFreeDefiniteSize(void* ptr, size_t size, void* context) {
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index 2d47fd2..f4eab30 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From 33fb1fa2f8a846734544db7b21f120f5924f9316 Mon Sep 17 00:00:00 2001
+From 7f6bef2fe015663d8218921835166f54266f126a Mon Sep 17 00:00:00 2001
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
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index 5f6dc25..3cb2517 100644
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From ea8b649d60037b08bbb2134f878098c8373a08b7 Mon Sep 17 00:00:00 2001
+From 1582b4305705d66e8f4c4d27c2edf5d4842c8a69 Mon Sep 17 00:00:00 2001
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
-index f2e6633..6fe84dd 100644
+index f2e66331e3..6fe84dd66a 100644
 --- a/chromium/net/dns/dns_config_service_posix.cc
 +++ b/chromium/net/dns/dns_config_service_posix.cc
 @@ -27,6 +27,10 @@
@@ -28,7 +28,7 @@ index f2e6633..6fe84dd 100644
  #include "net/dns/dns_config_watcher_mac.h"
  #endif
 diff --git a/chromium/net/dns/dns_reloader.cc b/chromium/net/dns/dns_reloader.cc
-index 322c8a5..72ff40d 100644
+index 322c8a5f0f..72ff40dbe1 100644
 --- a/chromium/net/dns/dns_reloader.cc
 +++ b/chromium/net/dns/dns_reloader.cc
 @@ -9,6 +9,10 @@
@@ -44,7 +44,7 @@ index 322c8a5..72ff40d 100644
  #include "base/macros.h"
 diff --git a/chromium/net/dns/resolv_compat.h b/chromium/net/dns/resolv_compat.h
 new file mode 100644
-index 0000000..4f0e852
+index 0000000000..4f0e852a19
 --- /dev/null
 +++ b/chromium/net/dns/resolv_compat.h
 @@ -0,0 +1,29 @@
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index 57f313c..9bd9756 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From 567105c9014cbad00aba5bcd172e6aed3e32c509 Mon Sep 17 00:00:00 2001
+From 291a34f1252619a654c0bdc7bd779890e9bd3b4b Mon Sep 17 00:00:00 2001
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
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
index a247eb8..57501f5 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,4 +1,4 @@
-From fdd90ccaebc488bdb68b020a9bc3d89232795559 Mon Sep 17 00:00:00 2001
+From 5ca95d5c90e867fb5e69414d4371be6cc7436f1e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
@@ -10,7 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/chromium/base/threading/platform_thread_linux.cc b/chromium/base/threading/platform_thread_linux.cc
-index 9917a7b..cb40665 100644
+index 9917a7b1fd..cb406659b9 100644
 --- a/chromium/base/threading/platform_thread_linux.cc
 +++ b/chromium/base/threading/platform_thread_linux.cc
 @@ -173,7 +173,8 @@ void TerminateOnThread() {}
@@ -24,7 +24,7 @@ index 9917a7b..cb40665 100644
    // ThreadSanitizer bloats the stack heavily. Evidence has been that the
    // default stack size isn't enough for some browser tests.
 diff --git a/chromium/third_party/WebKit/Source/platform/wtf/StackUtil.cpp b/chromium/third_party/WebKit/Source/platform/wtf/StackUtil.cpp
-index 13c3f90..07308e0 100644
+index 13c3f907f8..07308e0835 100644
 --- a/chromium/third_party/WebKit/Source/platform/wtf/StackUtil.cpp
 +++ b/chromium/third_party/WebKit/Source/platform/wtf/StackUtil.cpp
 @@ -28,7 +28,7 @@ size_t GetUnderestimatedStackSize() {
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index b97045d..00793ef 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From ba501cce8252a22a4baba2d9e524bd7538a079bd Mon Sep 17 00:00:00 2001
+From 1633367ce21f63a747b1523867a1bf431098f223 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/chromium/device/serial/serial_io_handler_posix.cc b/chromium/device/serial/serial_io_handler_posix.cc
-index d6ed5e1..b550f89 100644
+index d6ed5e1f88..b550f895ef 100644
 --- a/chromium/device/serial/serial_io_handler_posix.cc
 +++ b/chromium/device/serial/serial_io_handler_posix.cc
 @@ -6,6 +6,7 @@
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index adc2d82..1d037fd 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,15 +1,15 @@
-From fc03e0f3c36d4d20e00dfbcd02616a467e4b0a15 Mon Sep 17 00:00:00 2001
+From 597ec448bce31e3cb9fc000a516c799a85eb6ded Mon Sep 17 00:00:00 2001
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
index 1b8f933..24869f8 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -124,7 +124,7 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "65-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.11
-# 5.11.meta-qt5.2
+# 5.11.meta-qt5.3
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
@@ -137,7 +137,7 @@ SRC_URI_append_libc-musl = "\
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/65-based
-# 65-based.meta-qt5.2
+# 65-based.meta-qt5.3
 SRC_URI += " \
     file://0001-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
     file://0002-chromium-workaround-for-too-long-.rps-file-name.patch;patchdir=src/3rdparty \
-- 
2.17.1


