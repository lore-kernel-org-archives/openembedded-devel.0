Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC5B71AD8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 14:26:48 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id p8so7146435wrf.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J4aVxg9J9GIFtTx8lsXnFCabA+j3gg6qaOUuEVnmK3g=;
	b=YZlyft/73uLO7ekr2xlC5N6DpOBYbTX9hzNHJ2B0k7RDIERrpcDhnY4VgUbbZLzzOA
	UjD3+5CiP6ec9ZZGfF0j7NsEY26QdjFQn0Tgl2iNoQKJhzLTgNB6SL4NQDkqYH/YF7L7
	BVEjA5xZ0aMK87Pd1FCFvM20Md3uQFFdSGRbzH+30o1PLIWcwfMPCG+lbxzkzyjoAX99
	Av5VN5Zp2hNmyDwNhi45HnXGLGrrfCXgf5eYj6cq+6Fgjm40EffFVCSHmakQIxm6pdkU
	hiQIraQCqKbSjvZDy+2vd3SH7rH/cSqgnIyYfixmVjkXVWCzKc3wJ4Nqs4I35LNtVYiW
	sZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J4aVxg9J9GIFtTx8lsXnFCabA+j3gg6qaOUuEVnmK3g=;
	b=WY/cQ1cOvrosmhdSsyfl5m/JT8p/ZOlZx4aYOoOvTqUdGR7ijK930O1E5UqBdXl6vM
	OKGSdOxh6mUDWF78E0fbbvZzTB1gOK8nvu9EJxS4cmGjUnpCPGkr1c90ZlBauKySkphV
	06eU8ngImGTGiDt7zoQkgQz9xXnn7SiUY+vrDN96dWuP5sMwJyZ4SDakUz6CB3oXKOEz
	K0FX4cPDkMVr3Ni9ppjF6ilAM7nqLCoHED2LOrpzjXjEdfYe3qxbVCZsiQ+zkZ4Y+Maz
	osPvY+VXEkxzT7S3VmIbgPjU9u5X5j2CAkGwbSLpgtUhPRajFehWCcIgBeJ5trCbzydr
	3PmQ==
X-Gm-Message-State: AHYfb5iOhE+wJYSiPaf5UOUZVYH1MxTrY6zsEQHRm4VwEY/sti3thQBh
	n6aFKARxtSJAWUSA
X-Received: by 10.223.139.7 with SMTP id n7mr6291823wra.138.1503152809542;
	Sat, 19 Aug 2017 07:26:49 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g17sm9263001wrc.28.2017.08.19.07.26.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Aug 2017 07:26:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Aug 2017 16:28:28 +0200
Message-Id: <20170819142828.4555-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qt: refresh remaining patches and add links to meta-qt5 repos
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
X-List-Received-Date: Sat, 19 Aug 2017 14:26:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* remove
  qtdeclarative/0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch
  qtwayland/0002-Fix-initial-window-property-values-being-propagated.patch
  which is already applied and fuzzy patch just apply the same section
  twice

* restore
  qttools/0001-add-noqtwebkit-configuration.patch
  which was removed from SRC_URI in 5.9 upgrade

* add comment with link to meta-qt5 repository where the meta-qt5 .patch
  files are maintained, include branch and tag name so that it's more
  clear from where these changes are exported (with:
  git format-patch --no-numbered --no-signature)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  4 +++
 recipes-qt/qt5/qt3d_git.bb                         |  2 ++
 recipes-qt/qt5/qtbase-native_git.bb                |  4 +++
 recipes-qt/qt5/qtbase_git.bb                       |  2 ++
 ...-QQmlExpression-leaking-QQmlError-objects.patch | 35 ----------------------
 recipes-qt/qt5/qtdeclarative_git.bb                |  4 ---
 recipes-qt/qt5/qtlocation_git.bb                   |  2 ++
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 ++
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 ++
 recipes-qt/qt5/qtremoteobjects_git.bb              |  2 ++
 recipes-qt/qt5/qtscxml_git.bb                      |  2 ++
 ...tch => 0001-add-noqtwebkit-configuration.patch} | 14 ++++-----
 ...ls-cmake-allow-overriding-the-location-f.patch} |  4 +--
 recipes-qt/qt5/qttools_git.bb                      |  5 +++-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  3 ++
 .../0001-fix-build-without-xkbcommon-evdev.patch   | 17 +++++------
 ...l-window-property-values-being-propagated.patch | 35 ----------------------
 recipes-qt/qt5/qtwayland_git.bb                    |  3 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  2 ++
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  4 +--
 ...de-backtrace-API-for-non-glibc-libraries.patch} |  4 +--
 ...atch => 0003-Fix-compilation-with-ICU-59.patch} |  5 +---
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 ++
 recipes-qt/qt5/qtwebview_git.bb                    |  2 ++
 24 files changed, 58 insertions(+), 103 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch
 rename recipes-qt/qt5/qttools/{0003-add-noqtwebkit-configuration.patch => 0001-add-noqtwebkit-configuration.patch} (80%)
 rename recipes-qt/qt5/qttools/{0004-linguist-tools-cmake-allow-overriding-the-location-f.patch => 0002-linguist-tools-cmake-allow-overriding-the-location-f.patch} (95%)
 delete mode 100644 recipes-qt/qt5/qtwayland/0002-Fix-initial-window-property-values-being-propagated.patch
 rename recipes-qt/qt5/qtwebkit/{0003-Exclude-backtrace-API-for-non-glibc-libraries.patch => 0002-Exclude-backtrace-API-for-non-glibc-libraries.patch} (93%)
 rename recipes-qt/qt5/qtwebkit/{0004-Fix-compilation-with-ICU-59.patch => 0003-Fix-compilation-with-ICU-59.patch} (98%)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index e1b30c9..d229c21 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -25,6 +25,8 @@ require qt5-git.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
+# Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
+# 5.9.meta-qt5-shared.1
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -37,6 +39,8 @@ SRC_URI += "\
 "
 
 # common for qtbase-native and nativesdk-qtbase
+# Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
+# 5.9.meta-qt5-native.1
 SRC_URI += " \
     file://0009-Always-build-uic.patch \
 "
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 41b5fbc..4226bac 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase"
 DEPENDS_class-target += "qtdeclarative qt3d-native"
 
+# Patches from https://github.com/meta-qt5/qt3d/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
     file://0002-Fix-BlenderDNA-for-clang-cross-compiler.patch \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 84cb2b0..336df95 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -20,6 +20,8 @@ require qt5-native.inc
 require qt5-git.inc
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
+# Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
+# 5.9.meta-qt5-shared.1
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -32,6 +34,8 @@ SRC_URI += "\
 "
 
 # common for qtbase-native and nativesdk-qtbase
+# Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-native
+# 5.9.meta-qt5-native.1
 SRC_URI += " \
     file://0009-Always-build-uic.patch \
 "
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 2eb5250..c4678e8 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = " \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
+# Patches from https://github.com/meta-qt5/qtbase/commits/b5.9-shared
+# 5.9.meta-qt5-shared.1
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
diff --git a/recipes-qt/qt5/qtdeclarative/0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch b/recipes-qt/qt5/qtdeclarative/0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch
deleted file mode 100644
index 050a914..0000000
--- a/recipes-qt/qt5/qtdeclarative/0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f9dcbf008b430aadd464985b7a618eca8173d264 Mon Sep 17 00:00:00 2001
-From: Robert Griebl <robert.griebl@pelagicore.com>
-Date: Thu, 23 Feb 2017 15:11:13 +0100
-Subject: [PATCH 1/3] Fix QQmlExpression leaking QQmlError objects
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If the user doesn't clear any potential errors manually via clearError(),
-then do it automatically in the destructor. Found with valgrind.
-
-[ChangeLog][QtQml][QQmlExpression] Fixed memory leak
-
-Change-Id: If5b1181850c7463c939a7ba536d74e7054c53d60
-Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
-Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
----
- src/qml/qml/qqmlexpression.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/qml/qml/qqmlexpression.cpp b/src/qml/qml/qqmlexpression.cpp
-index 6afbd05..5cb3d4d 100644
---- a/src/qml/qml/qqmlexpression.cpp
-+++ b/src/qml/qml/qqmlexpression.cpp
-@@ -200,6 +200,7 @@ QQmlExpression::QQmlExpression(QQmlContextData *ctxt, QObject *scope,
- */
- QQmlExpression::~QQmlExpression()
- {
-+    clearError();
- }
- 
- /*!
--- 
-2.9.3
-
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 2194d33..ecd64ee 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -11,10 +11,6 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
-SRC_URI += " \
-    file://0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch \
-"
-
 DEPENDS += "qtbase"
 
 PACKAGECONFIG ??= "qtxmlpatterns"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index ea24fe4..afcd1f8 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
 
+# Patches from https://github.com/meta-qt5/qtlocation/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += "file://0001-Make-mapbox-gl-build-configurable.patch"
 
 PACKAGECONFIG ??= ""
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index c1ae786..00d4026 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -25,6 +25,8 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 # Disable GStreamer if completely disabled
 EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
 
+# Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 83ed908..fe86f49 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -22,6 +22,8 @@ FILES_${PN}-qmlplugins += " \
   ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
 "
 
+# Patches from https://github.com/meta-qt5/qt3d/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index f563818..a7e3447 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -11,6 +11,8 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
 
+# Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
 "
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index c2c00e1..e9ca8c1 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -12,6 +12,8 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
 SRCREV = "eff82ac957e051f16f64c287f2dfaec9049bdfc1"
 
+# Patches from https://github.com/meta-qt5/qtscxml/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
 do_install_append_class-nativesdk() {
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
similarity index 80%
rename from recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
rename to recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
index 88c39c7..ed25390 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From a798e469e69e31248610a3b5f29c63c5d12cda26 Mon Sep 17 00:00:00 2001
+From e0387540876944a20461d60d2208191c734e00b1 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
@@ -16,16 +16,16 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
-index ef5c595..9c2dc1c 100644
+index 540c9689..2312b521 100644
 --- a/src/assistant/assistant/assistant.pro
 +++ b/src/assistant/assistant/assistant.pro
 @@ -1,4 +1,4 @@
--qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
-+qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
+-false:qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
++false:qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
+     # FIXME: currently broken
      BROWSER = qtwebkit
  } else {
-     BROWSER = qtextbrowser
-@@ -75,7 +75,7 @@ SOURCES += aboutdialog.cpp \
+@@ -76,7 +76,7 @@ SOURCES += aboutdialog.cpp \
      openpagesmanager.cpp \
      openpagesswitcher.cpp
  
@@ -35,7 +35,7 @@ index ef5c595..9c2dc1c 100644
      QT += webkitwidgets
      SOURCES += helpviewer_qwv.cpp
 diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
-index 500a153..b60fa2d 100644
+index 500a1534..b60fa2d9 100644
 --- a/src/designer/src/plugins/plugins.pro
 +++ b/src/designer/src/plugins/plugins.pro
 @@ -1,6 +1,6 @@
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
similarity index 95%
rename from recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
rename to recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 1a201de..b2e017e 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From f805a2bf4a0d35a01726d214279ba1caa81b278f Mon Sep 17 00:00:00 2001
+From 779278a109450ae84d5deb2e1e1c0dd9b737f1a2 Mon Sep 17 00:00:00 2001
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
index 9ca90a2..871b061 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -14,9 +14,12 @@ inherit ptest
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
+# Patches from https://github.com/meta-qt5/qttools/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += " \
     file://run-ptest \
-    file://0004-linguist-tools-cmake-allow-overriding-the-location-f.patch \
+    file://0001-add-noqtwebkit-configuration.patch \
+    file://0002-linguist-tools-cmake-allow-overriding-the-location-f.patch \
 "
 
 FILES_${PN}-tools += "${datadir}${QT_DIR_NAME}/phrasebooks"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 2b865bb..ec1dc42 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -5,6 +5,9 @@ LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
+
+# Patches from https://github.com/meta-qt5/qtvirtualkeyboard/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += "file://0001-include-sys-time.h-for-timeval.patch"
 
 # To enabled Nuance T9 Write support, you need to provide the licensed components
diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
index 555bb28..a86868e 100644
--- a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
+++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
@@ -1,4 +1,4 @@
-From 2b72ad7955fe19abb4a0b4ebb6bc7aa498e454bc Mon Sep 17 00:00:00 2001
+From 434be8d326adb02b7b0960481f045dc1a443cfce Mon Sep 17 00:00:00 2001
 From: Raphael Freudiger <laser_b@gmx.ch>
 Date: Tue, 10 Jan 2017 15:49:55 +0100
 Subject: [PATCH] fix build without xkbcommon-evdev
@@ -16,17 +16,17 @@ Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
  3 files changed, 11 insertions(+), 6 deletions(-)
 
 diff --git a/src/client/client.pro b/src/client/client.pro
-index 7482cfd..cb3578c 100644
+index eae7ad52..0bb7b188 100644
 --- a/src/client/client.pro
 +++ b/src/client/client.pro
-@@ -120,3 +120,5 @@ MODULE_PLUGIN_TYPES = \
+@@ -147,3 +147,5 @@ MODULE_PLUGIN_TYPES = \
              wayland-decoration-client \
              wayland-shell-integration
  load(qt_module)
 +
 +LIBS += -lxkbcommon
 diff --git a/src/compositor/compositor.pro b/src/compositor/compositor.pro
-index dc9000d..4eebfd6 100644
+index dc9000d9..4eebfd64 100644
 --- a/src/compositor/compositor.pro
 +++ b/src/compositor/compositor.pro
 @@ -32,3 +32,5 @@ include ($$PWD/extensions/extensions.pri)
@@ -36,10 +36,10 @@ index dc9000d..4eebfd6 100644
 +
 +LIBS += -lxkbcommon
 diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp b/src/compositor/compositor_api/qwaylandkeyboard.cpp
-index 55381b4..5c054c6 100644
+index c30f7b18..e6f1a0b3 100644
 --- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
 +++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
-@@ -338,12 +338,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
+@@ -349,12 +349,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
      xkb_state = xkb_state_new(keymap);
  }
  
@@ -52,7 +52,7 @@ index 55381b4..5c054c6 100644
  
  void QWaylandKeyboardPrivate::createXKBKeymap()
  {
-@@ -373,6 +367,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
+@@ -384,6 +378,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
  }
  #endif
  
@@ -66,6 +66,3 @@ index 55381b4..5c054c6 100644
  void QWaylandKeyboardPrivate::sendRepeatInfo()
  {
      Q_FOREACH (Resource *resource, resourceMap()) {
--- 
-2.9.3
-
diff --git a/recipes-qt/qt5/qtwayland/0002-Fix-initial-window-property-values-being-propagated.patch b/recipes-qt/qt5/qtwayland/0002-Fix-initial-window-property-values-being-propagated.patch
deleted file mode 100644
index 29c9180..0000000
--- a/recipes-qt/qt5/qtwayland/0002-Fix-initial-window-property-values-being-propagated.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3d30fd8df9b55449844207295ad3d51cc8bb44b1 Mon Sep 17 00:00:00 2001
-From: Robert Griebl <robert.griebl@pelagicore.com>
-Date: Thu, 15 Dec 2016 17:43:00 +0100
-Subject: [PATCH 2/2] Fix initial window property values being propagated
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This was broken since the the shell-surface refactoring.
-
-Change-Id: I130b7396e85c570a9d11d609af6b3016e3f706f0
-Reviewed-by: Dominik Holland <dominik.holland@pelagicore.com>
-Reviewed-by: Paul Olav Tvete <paul.tvete@qt.io>
-Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
----
- src/client/qwaylandwindow.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/client/qwaylandwindow.cpp b/src/client/qwaylandwindow.cpp
-index c8be9c1..b6f16f0 100644
---- a/src/client/qwaylandwindow.cpp
-+++ b/src/client/qwaylandwindow.cpp
-@@ -176,6 +176,9 @@ void QWaylandWindow::initWindow()
-                 mShellSurface->setAppId(appId);
-             }
-         }
-+        // the user may have already set some window properties, so make sure to send them out
-+        for (auto it = m_properties.cbegin(); it != m_properties.cend(); ++it)
-+            mShellSurface->sendProperty(it.key(), it.value());
-     }
- 
-     // Enable high-dpi rendering. Scale() returns the screen scale factor and will
--- 
-2.9.3
-
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 26ef853..9b973a5 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -39,10 +39,11 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
 SRCREV = "f1cf62fa8e9ffa2548c9968906848596f50dbc0b"
 
+# Patches from https://github.com/meta-qt5/qtwayland/commits/b5.9
+# 5.9.meta-qt5.1
 # From https://bugreports.qt.io/browse/QTBUG-57767
 SRC_URI += " \
     file://0001-fix-build-without-xkbcommon-evdev.patch \
-    file://0002-Fix-initial-window-property-values-being-propagated.patch \
 "
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 830e640..9879749 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -130,6 +130,7 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "56-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-allow-build-for-linux-oe-g-platform.patch \
@@ -140,6 +141,7 @@ SRC_URI += " \
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based 
+# 56-based.meta-qt5.1
 SRC_URI += " \
     file://0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
     file://0002-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index d96636e..d393dc4 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From 86bdd059606252b16c24432fbe4bba461406c1e4 Mon Sep 17 00:00:00 2001
+From f8bcac01fd5d95d0df8342809c53917aff1bf798 Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
@@ -14,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
-index fd66af6..ef754c3 100644
+index fd66af670..ef754c367 100644
 --- a/Tools/qmake/mkspecs/features/unix/default_post.prf
 +++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
 @@ -61,7 +61,6 @@ linux-*g++* {
diff --git a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
similarity index 93%
rename from recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
rename to recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
index a16801b..147a7ba 100644
--- a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -1,4 +1,4 @@
-From ed626df67e8287fadbfe2801c241c9717472dcf4 Mon Sep 17 00:00:00 2001
+From 5d4f3219be0b66d63765e077644a51e18b1f4502 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 5 Jun 2015 19:55:05 -0700
 Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Source/WTF/wtf/Assertions.cpp b/Source/WTF/wtf/Assertions.cpp
-index 1b2091f..ba03a28 100644
+index 1b2091f53..ba03a28ec 100644
 --- a/Source/WTF/wtf/Assertions.cpp
 +++ b/Source/WTF/wtf/Assertions.cpp
 @@ -61,7 +61,7 @@
diff --git a/recipes-qt/qt5/qtwebkit/0004-Fix-compilation-with-ICU-59.patch b/recipes-qt/qt5/qtwebkit/0003-Fix-compilation-with-ICU-59.patch
similarity index 98%
rename from recipes-qt/qt5/qtwebkit/0004-Fix-compilation-with-ICU-59.patch
rename to recipes-qt/qt5/qtwebkit/0003-Fix-compilation-with-ICU-59.patch
index e4a108e..debbda1 100644
--- a/recipes-qt/qt5/qtwebkit/0004-Fix-compilation-with-ICU-59.patch
+++ b/recipes-qt/qt5/qtwebkit/0003-Fix-compilation-with-ICU-59.patch
@@ -1,4 +1,4 @@
-From d8d9b1eb468f5e5d5d9f0b196fc0acb641998c8b Mon Sep 17 00:00:00 2001
+From 240bd33ba3e78fcc0e5e3299d9e0e53299ea07f8 Mon Sep 17 00:00:00 2001
 From: Konstantin Tokarev <annulen@yandex.ru>
 Date: Thu, 4 May 2017 15:12:37 +0300
 Subject: [PATCH] Fix compilation with ICU 59
@@ -87,6 +87,3 @@ index cbac67dd8..23400a64e 100644
  }
  
  size_t WKStringGetMaximumUTF8CStringSize(WKStringRef stringRef)
--- 
-2.13.3
-
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 5c1ecfa..61e68ff 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -18,6 +18,8 @@ DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
+# Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
     file://0003-Exclude-backtrace-API-for-non-glibc-libraries.patch \
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index d48b6c4..8b79aa1 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = " \
 require qt5.inc
 require qt5-git.inc
 
+# Patches from https://github.com/meta-qt5/qtwebview/commits/b5.9
+# 5.9.meta-qt5.1
 SRC_URI += "file://0001-Add-missing-include-for-qWarning.patch"
 
 DEPENDS += "qtbase qtwebengine"
-- 
2.14.0


