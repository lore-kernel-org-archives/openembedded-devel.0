Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2044578589
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 18:43:08 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 49so3720672wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PoTyAEKvo6Af9YWyfNEMUVpwGFJX0g7PSeiVdjczrCE=;
	b=qH5l5yCQkc8L0e0K+r3dEHiONpz+wuPyhc5XETdsCEB2MuzqXRS2f9GC+3zLMg0Ord
	NJCuEraf8+TXoVfbS4B2nlVu0IFZQ3wUqfpPilAF18dogbIZxd4ookMHckRO3JNkqA5S
	/e1jgi3ZXgwJtpriFsIsAqD4HRWda7bBHoi5CGcrsuejSGhEVYU25xZdTTKTWvNEtwq7
	2wVEGj+uBg3Qi3r1elQSU1Vf/boe5u6jFPWoxekJMkcvaeZ5LWdtNKzsKwnrDycmsyXP
	DcBpElsxSuRS1ltiiE3UQpcX+VUK8x9akU6PYGA4ro8xZZfJxkvNieiwLLpq2et+02ta
	KmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PoTyAEKvo6Af9YWyfNEMUVpwGFJX0g7PSeiVdjczrCE=;
	b=cjN0vm5eX4Q+msbHya5gxraSfCOm3gdQMh9hdNdVh0lzgSDZvS3rmXjTcEkvuIW0et
	y9UoGnVPE0ms56BnK84kV6ycm3kqUTxVrxzZauW8KVBX9PyMUMrUKo8JHP7eYh6F3DST
	Nkhmifzz89+tNKK4JLNQsDl40ipT1djStrqCGSp7a9GSfF0njkNyRy1hcOOO9P3gG3jX
	4BigV+5yt1Maq7AphwMrGOCi+W4wHydyFUpYrrAQ3kZTwyEf3jv0tH6rIu44ybXuG5ay
	oMnciNnxgYBDp0CregI6cRp4Sq3buDDR38Yby2V5eZsP2FKMT/NbyyO2e1NWTF+suG1o
	llEg==
X-Gm-Message-State: AHYfb5jW4jNSbcDLIAz3jpAEDdHBTKjw8W7x5JYaubuvXxC+3dyVgSiW
	z9i4MaK+lpHrKfM7
X-Received: by 10.223.134.213 with SMTP id 21mr4197979wry.104.1502995389418;
	Thu, 17 Aug 2017 11:43:09 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 69sm3461793wrk.2.2017.08.17.11.43.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Aug 2017 11:43:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Aug 2017 20:44:42 +0200
Message-Id: <20170817184445.10108-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [meta-qt5][PATCH 1/4] qtbase: refresh the patches
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
X-List-Received-Date: Thu, 17 Aug 2017 18:43:09 -0000

* upload the patches to b5.8* branches on:
  https://github.com/meta-qt5/qtbase
* refresh the patches
* notice that some patches were in section which is meant to be
  common for target, native and nativesdk qtbase but were added
  only in target recipe, I've updated them to be included in all
  3, hopefully they can be used in all 3 (I don't use nativesdk at all)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb                   |  7 +++++--
 recipes-qt/qt5/qtbase-native_git.bb                      |  7 +++++--
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 16 ++++++++--------
 ...aryinfo-allow-to-set-qt.conf-from-the-outside-u.patch |  6 ++----
 .../qt5/qtbase/0003-Add-external-hostbindir-option.patch |  8 ++++----
 ...t_module-Fix-pkgconfig-and-libtool-replacements.patch |  8 ++++----
 ...gure-bump-path-length-from-256-to-512-character.patch |  6 +++---
 ...e-all-unknown-features-instead-of-erroring-out.patch} |  9 +++------
 ...d-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch} |  6 +++---
 ....patch => 0008-Delete-qlonglong-and-qulonglong.patch} |  7 ++-----
 ...tring-Disable-Wformat-security-with-clang-as-w.patch} |  8 ++------
 ...=> 0010-Replace-pthread_yield-with-sched_yield.patch} |  5 +----
 recipes-qt/qt5/qtbase/0011-Always-build-uic.patch        |  6 +++---
 ...0011-configure-paths-for-target-qmake-properly.patch} | 12 ++++++------
 recipes-qt/qt5/qtbase_git.bb                             | 12 ++++++------
 15 files changed, 57 insertions(+), 66 deletions(-)
 rename recipes-qt/qt5/qtbase/{0009-Disable-all-unknown-features-instead-of-erroring-out.patch => 0006-Disable-all-unknown-features-instead-of-erroring-out.patch} (85%)
 rename recipes-qt/qt5/qtbase/{0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch => 0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch} (94%)
 rename recipes-qt/qt5/qtbase/{0001-Delete-qlonglong-and-qulonglong.patch => 0008-Delete-qlonglong-and-qulonglong.patch} (87%)
 rename recipes-qt/qt5/qtbase/{0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch => 0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch} (84%)
 rename recipes-qt/qt5/qtbase/{0011-Replace-pthread_yield-with-sched_yield.patch => 0010-Replace-pthread_yield-with-sched_yield.patch} (96%)
 rename recipes-qt/qt5/qtbase/{0008-configure-paths-for-target-qmake-properly.patch => 0011-configure-paths-for-target-qmake-properly.patch} (87%)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index f2ff5f7..0f1c6d6 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -31,8 +31,11 @@ SRC_URI += "\
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
-    file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0006-Disable-all-unknown-features-instead-of-erroring-out.patch \
+    file://0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0008-Delete-qlonglong-and-qulonglong.patch \
+    file://0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch \
+    file://0010-Replace-pthread_yield-with-sched_yield.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 98cbecc..2420580 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -26,8 +26,11 @@ SRC_URI += "\
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
-    file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0006-Disable-all-unknown-features-instead-of-erroring-out.patch \
+    file://0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0008-Delete-qlonglong-and-qulonglong.patch \
+    file://0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch \
+    file://0010-Replace-pthread_yield-with-sched_yield.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index df2016e..3f373c7 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 2784921c40d0b523c75e613e48b7fd1e90ba3ef1 Mon Sep 17 00:00:00 2001
+From 805b338154ed0262a7b8bf5c582ff5b193a55492 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
@@ -30,10 +30,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 789ba4c..59cce01 100755
+index bc18e614d2..579a96d787 100755
 --- a/configure
 +++ b/configure
-@@ -1624,7 +1624,7 @@ fi
+@@ -1614,7 +1614,7 @@ fi
  # is where the resulting variable is written to
  setBootstrapVariable()
  {
@@ -43,10 +43,10 @@ index 789ba4c..59cce01 100755
  
  # build qmake
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index f275e3a..5aa15f5 100644
+index 4ca7c6ba07..5b5ac13f1d 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -37,14 +37,14 @@ defineTest(qtCompileTest) {
+@@ -44,14 +44,14 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
@@ -64,7 +64,7 @@ index f275e3a..5aa15f5 100644
              msg = "test $$1 succeeded"
              write_file($$QMAKE_CONFIG_LOG, msg, append)
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 708815d..097ac49 100644
+index 999cd18154..2ac91ba519 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
 @@ -67,7 +67,7 @@ defineTest(qtHaveModule) {
@@ -78,7 +78,7 @@ index 708815d..097ac49 100644
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
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 4b72ebf..f985962 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From e5f8607cfa1d2bcc798686cdf7c87ea0c6577d30 Mon Sep 17 00:00:00 2001
+From 18e2f4368f22bf5ac8b2a36c30a7ad39ed97bf49 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 27fe10a..29ffcda 100644
+index 27fe10a79e..29ffcda203 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -164,7 +164,10 @@ void QLibrarySettings::load()
@@ -34,5 +34,3 @@ index 27fe10a..29ffcda 100644
      if (QFile::exists(qtconfig))
          return new QSettings(qtconfig, QSettings::IniFormat);
  #else
--- 
-2.9.3
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 8224171..9f1a2b2 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 502b95b840a5f79e5a68e9bd5b10dbdc92485f1f Mon Sep 17 00:00:00 2001
+From 67977e16e5d0aecd931d8e4355c12cc907df592f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] Add -external-hostbindir option
@@ -19,7 +19,7 @@ Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index a5ed8b2..0e11a1e 100644
+index 545b9a3d1e..c991a9ba41 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
@@ -50,7 +50,7 @@ index a5ed8b2..0e11a1e 100644
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
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index c105488..aa97b56 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From bf1498618415e7b1e57b54881b1e56d74f2cdf6b Mon Sep 17 00:00:00 2001
+From fe9cfbde28c651d00b8f5fda7dc85a97af0c50a1 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
@@ -68,10 +68,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
-index 0c5f080..a6e4f09 100644
+index 98f794c485..bd8b7b52e4 100644
 --- a/mkspecs/features/qt.prf
 +++ b/mkspecs/features/qt.prf
-@@ -317,6 +317,19 @@ contains(TEMPLATE, .*app) {
+@@ -315,6 +315,19 @@ contains(TEMPLATE, .*app) {
      QTPLUGIN = $$manualplugs $$autoplugs
  }
  
@@ -92,7 +92,7 @@ index 0c5f080..a6e4f09 100644
  qtConfig(static) {
      QT_PLUGIN_VERIFY += QTPLUGIN
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index e754a17..4c1530e 100644
+index d30983f62b..6da07e032c 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -37,7 +37,7 @@ contains(TEMPLATE, .*lib) {
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
index d455d2c..0c0d2c7 100644
--- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 60f490b57faf979a912074506a75c74767a27d3b Mon Sep 17 00:00:00 2001
+From be9179d2cbb9009794940092d30dac7800708964 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -14,10 +14,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 1fcbb3a..f49a674 100755
+index 579a96d787..5af98cd77e 100755
 --- a/configure
 +++ b/configure
-@@ -3847,10 +3847,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -1551,10 +1551,10 @@ cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
  static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
  
  /* Installation Info */
diff --git a/recipes-qt/qt5/qtbase/0009-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0006-Disable-all-unknown-features-instead-of-erroring-out.patch
similarity index 85%
rename from recipes-qt/qt5/qtbase/0009-Disable-all-unknown-features-instead-of-erroring-out.patch
rename to recipes-qt/qt5/qtbase/0006-Disable-all-unknown-features-instead-of-erroring-out.patch
index cb9de79..c2b4438 100644
--- a/recipes-qt/qt5/qtbase/0009-Disable-all-unknown-features-instead-of-erroring-out.patch
+++ b/recipes-qt/qt5/qtbase/0006-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -1,4 +1,4 @@
-From 9eb81e3bdeda4f90e5f2942400aef38b51a356bd Mon Sep 17 00:00:00 2001
+From 8acdd69a4083080f4dd40001eee30209ec5de0b2 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Mon, 24 Oct 2016 09:45:18 +0300
 Subject: [PATCH] Disable all unknown features instead of erroring out
@@ -10,10 +10,10 @@ Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_configure.prf
-index e8fa0c6..0ca5670 100644
+index eaaa161270..fa3addae11 100644
 --- a/mkspecs/features/qt_configure.prf
 +++ b/mkspecs/features/qt_configure.prf
-@@ -1009,7 +1009,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
+@@ -1035,7 +1035,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
                      error("Expression '$$1' is accessing field '$$var' of non-local feature $${feature}.")
                  return($$result)
              }
@@ -23,6 +23,3 @@ index e8fa0c6..0ca5670 100644
          }
          !qtConfCheckFeature($$feature): \
              error("Expression '$$1' is accessing non-emitted feature $${feature}.")
--- 
-1.9.1
-
diff --git a/recipes-qt/qt5/qtbase/0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
similarity index 94%
rename from recipes-qt/qt5/qtbase/0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
rename to recipes-qt/qt5/qtbase/0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index 1d0ea3e..b70b0d3 100644
--- a/recipes-qt/qt5/qtbase/0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From b397a71531e31383ee86135e21072d033480f5bc Mon Sep 17 00:00:00 2001
+From 5316b420dc408d3a47daa3ba854a7883c911f6b9 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
@@ -30,7 +30,7 @@ Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
-index d2358ca..feb73c0 100644
+index d2358cae4b..feb73c02a5 100644
 --- a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
 +++ b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
 @@ -9,6 +9,11 @@ if (CMAKE_VERSION VERSION_LESS 3.0.0)
@@ -46,7 +46,7 @@ index d2358ca..feb73c0 100644
  !!IF !isEmpty(CMAKE_LIB_DIR_IS_ABSOLUTE)
  set(_qt5$${CMAKE_MODULE_NAME}_install_prefix \"$$[QT_INSTALL_PREFIX]\")
 diff --git a/src/corelib/Qt5Config.cmake.in b/src/corelib/Qt5Config.cmake.in
-index a872d0e..233d663 100644
+index 75b53485b7..ed31888c93 100644
 --- a/src/corelib/Qt5Config.cmake.in
 +++ b/src/corelib/Qt5Config.cmake.in
 @@ -3,6 +3,11 @@ if (CMAKE_VERSION VERSION_LESS 2.8.9)
diff --git a/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0008-Delete-qlonglong-and-qulonglong.patch
similarity index 87%
rename from recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
rename to recipes-qt/qt5/qtbase/0008-Delete-qlonglong-and-qulonglong.patch
index 975cd28..c992586 100644
--- a/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
+++ b/recipes-qt/qt5/qtbase/0008-Delete-qlonglong-and-qulonglong.patch
@@ -1,4 +1,4 @@
-From c67a4af2e5db4c1e2213961e6392b59affd1959f Mon Sep 17 00:00:00 2001
+From 2755a80114433e75f08fbb0df0fee9f7526172aa Mon Sep 17 00:00:00 2001
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
@@ -23,6 +23,3 @@ index 09458bd..59a120e 100644
      schar \
      short \
      uchar \
--- 
-2.7.4
-
diff --git a/recipes-qt/qt5/qtbase/0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch b/recipes-qt/qt5/qtbase/0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
similarity index 84%
rename from recipes-qt/qt5/qtbase/0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
rename to recipes-qt/qt5/qtbase/0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
index 77b357c..609cd84 100644
--- a/recipes-qt/qt5/qtbase/0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
+++ b/recipes-qt/qt5/qtbase/0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
@@ -1,8 +1,7 @@
-From 8284ebfe59c0011db71df7fb143b8e6a99f6952e Mon Sep 17 00:00:00 2001
+From 7bab0171601bc769403be62d145164137f1b7b66 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jul 2017 19:40:52 -0700
-Subject: [PATCH 10/10] tst_qstring: Disable Wformat-security with clang as
- well
+Subject: [PATCH] tst_qstring: Disable Wformat-security with clang as well
 
 Currently, its only disabled for gcc, but we need to disable
 it with clang as well in order to compile it successfully with
@@ -27,6 +26,3 @@ index a0a872710c..20a9a9f9db 100644
  
  void tst_QString::isNull()
  {
--- 
-2.13.3
-
diff --git a/recipes-qt/qt5/qtbase/0011-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0010-Replace-pthread_yield-with-sched_yield.patch
similarity index 96%
rename from recipes-qt/qt5/qtbase/0011-Replace-pthread_yield-with-sched_yield.patch
rename to recipes-qt/qt5/qtbase/0010-Replace-pthread_yield-with-sched_yield.patch
index ed0d4bc..5c625e0 100644
--- a/recipes-qt/qt5/qtbase/0011-Replace-pthread_yield-with-sched_yield.patch
+++ b/recipes-qt/qt5/qtbase/0010-Replace-pthread_yield-with-sched_yield.patch
@@ -1,4 +1,4 @@
-From d1d4b520e29b58e427fc7bd336d34b82d0d2b1f3 Mon Sep 17 00:00:00 2001
+From bbe822066913c0908b6366009517c19e828e1458 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 27 Jul 2017 08:02:51 -0700
 Subject: [PATCH] Replace pthread_yield with sched_yield
@@ -58,6 +58,3 @@ index fe1057bdde..e23e97b259 100644
  #endif
          if (!sock->waitForConnected()) {
              networkTimeout = true;
--- 
-2.13.3
-
diff --git a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
index fb3d316..244cc0b 100644
--- a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 1b94b0f2579edcf870bc953f820af8fb2ec4376f Mon Sep 17 00:00:00 2001
+From 7c42f9b42c34d75f6c8e21e55af9b0e58f5743cc Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 3d18540..d128b3a 100644
+index 90d7e2b76c..4ca6b0bd01 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -195,7 +195,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -188,7 +188,7 @@ qtConfig(gui) {
          }
      }
  }
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
similarity index 87%
rename from recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
rename to recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
index 6d64e6b..c527c13 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
+++ b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
@@ -1,4 +1,4 @@
-From cc926956758bf8170c4e49c66e1066524b43f65f Mon Sep 17 00:00:00 2001
+From b8e94df3d49be69659e8dfb0809c614f73c21706 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 13 Nov 2015 12:36:11 +0100
 Subject: [PATCH] configure paths for target qmake properly
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 19 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 8b33c5b..1df248f 100755
+index 5af98cd77e..34dedafe91 100755
 --- a/configure
 +++ b/configure
-@@ -1545,8 +1545,13 @@ if [ -z "$QT_REL_HOST_DATA" ]; then
+@@ -1500,8 +1500,13 @@ if [ -z "$QT_REL_HOST_DATA" ]; then
      fi
  fi
  
@@ -38,7 +38,7 @@ index 8b33c5b..1df248f 100755
  
  QT_CONFIGURE_STR_OFF=0
  
-@@ -1579,7 +1584,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
+@@ -1534,7 +1539,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
  
  QT_CONFIGURE_STR_OFFSETS=
  QT_CONFIGURE_STRS=
@@ -51,7 +51,7 @@ index 8b33c5b..1df248f 100755
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
-@@ -1591,6 +1600,12 @@ addConfStr "$shortspec"
+@@ -1546,6 +1555,12 @@ addConfStr "$shortspec"
  #-------------------------------------------------------------------------------
  [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
  
@@ -64,7 +64,7 @@ index 8b33c5b..1df248f 100755
  cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
  /* Installation date */
  static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
-@@ -1599,7 +1614,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+@@ -1554,7 +1569,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
  static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
  #ifdef QT_BUILD_QMAKE
  static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 368d07f..2115557 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -21,11 +21,11 @@ SRC_URI += "\
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
-    file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
-    file://0001-Delete-qlonglong-and-qulonglong.patch \
-    file://0010-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch \
-    file://0011-Replace-pthread_yield-with-sched_yield.patch \
+    file://0006-Disable-all-unknown-features-instead-of-erroring-out.patch \
+    file://0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0008-Delete-qlonglong-and-qulonglong.patch \
+    file://0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch \
+    file://0010-Replace-pthread_yield-with-sched_yield.patch \
     file://run-ptest \
 "
 
@@ -33,7 +33,7 @@ inherit ptest
 
 # only for target qtbase
 SRC_URI += "\
-    file://0008-configure-paths-for-target-qmake-properly.patch \
+    file://0011-configure-paths-for-target-qmake-properly.patch \
 "
 
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
-- 
2.14.0


