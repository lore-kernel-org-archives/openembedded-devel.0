Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0C56760E24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 14:03:20 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so2638914wiv.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 07:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=WwInhZUqSh4uHJ7qNMQk+IfF+e+729onkx3l03kBhZE=;
	b=c5enhgAQAG6sBEv1rvyMz4hY9gkhZ7Ia/3VEkeyqVXIRauwk26a4dln993hrcAXz5Z
	62bJMPsxxbHcII+ncLwbPTYxCgRbGr+y3lPUtzw0LXC7xEoiItGZTLKx9RRp2Y590bhV
	IzuM1k2JqGqkjqTsmBe5N+o2mSTiwb3AJudgmnGpDOjOggAG1U6vBuWvhsawbHqvkGB/
	bxDU/MnVyjkzp5xZn+SNtfReU5jwyb/I1IpWvReoreD7GWEwBNqqDjmGI6eb3e6elQYU
	eqWMasfBF416cs4s82DfQPrFitmHwAOd079IWy8WHv6pZUThM0avXXux+qVkCoctMwAx
	8Z3A==
X-Received: by 10.180.73.106 with SMTP id k10mr42310430wiv.11.1403704996187;
	Wed, 25 Jun 2014 07:03:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vp5sm7681205wjc.31.2014.06.25.07.03.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jun 2014 07:03:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jun 2014 16:03:13 +0200
Message-Id: <1403704993-10570-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-qt5][WIP][PATCH] recipes: upgrade from 5.3.0 to 5.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jun 2014 14:03:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/qt5-versions.inc               |   4 +-
 recipes-qt/qt5/nativesdk-qtbase.inc                |  29 ++--
 recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb           |   5 -
 recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb           |   5 +
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   6 +-
 recipes-qt/qt5/nativesdk-qttools_5.3.0.bb          |   5 -
 recipes-qt/qt5/nativesdk-qttools_5.3.1.bb          |   5 +
 recipes-qt/qt5/{qt5-5.3.0.inc => qt5-5.3.1.inc}    |   0
 recipes-qt/qt5/qtbase-native.inc                   |  23 ++--
 ...base-native_5.3.0.bb => qtbase-native_5.3.1.bb} |   4 +-
 recipes-qt/qt5/qtbase-native_git.bb                |   4 +-
 recipes-qt/qt5/qtbase.inc                          |  23 ++--
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  84 +++++++++---
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  11 +-
 .../0003-Add-external-hostbindir-option.patch      | 144 +++++++++++++------
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |   9 +-
 ...e-Fix-pkgconfig-and-libtool-replacements.patch} |  74 ++++------
 ...fs-Print-the-chosen-config-in-debug-mode.patch} |   8 +-
 ...on-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch |  43 ------
 ....prf-Allow-to-add-extra-arguments-to-make.patch |  37 -----
 ...integration-Undefine-CursorShape-from-X..patch} |   4 +-
 ...mp-path-length-from-256-to-512-character.patch} |   8 +-
 ...ake-pulseaudio-alsa-freetype-a-configurab.patch |  52 -------
 ...E_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch |  85 ------------
 ...l-error-for-platforms-only-supporting-on.patch} |  37 +++--
 .../qt5/qtbase/0010-Fix-missing-plugin_types.patch |  30 ----
 ...10-Revert-Use-the-gcc-feature-in-simd.prf.patch |  26 ++++
 ...build-uic.patch => 0011-Always-build-uic.patch} |   4 +-
 ...-build-it-in-configure-but-allow-to-build.patch |  50 +++++++
 ...eserve-built-qmake-and-swap-with-native-.patch} |   8 +-
 .../0014-QOpenGLPaintDevice-sub-area-support.patch | 152 ---------------------
 ...6-qmake-is-already-built-in-qtbase-native.patch |  30 ----
 ...-building-a-separate-qmake-for-the-target.patch |  30 ----
 recipes-qt/qt5/qtbase_5.3.0.bb                     |   5 -
 recipes-qt/qt5/qtbase_5.3.1.bb                     |   5 +
 recipes-qt/qt5/qtbase_git.bb                       |   4 +-
 recipes-qt/qt5/qtconnectivity_5.3.0.bb             |   5 -
 recipes-qt/qt5/qtconnectivity_5.3.1.bb             |   5 +
 .../0001-qmltestexample-fix-link.patch             |   6 +-
 ...x-improper-antialiasing-property-behavior.patch |  60 --------
 recipes-qt/qt5/qtdeclarative_5.3.0.bb              |   9 --
 recipes-qt/qt5/qtdeclarative_5.3.1.bb              |   5 +
 recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb         |   5 -
 recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb         |   5 +
 recipes-qt/qt5/qtimageformats_5.3.0.bb             |   5 -
 recipes-qt/qt5/qtimageformats_5.3.1.bb             |   5 +
 recipes-qt/qt5/qtlocation_5.3.0.bb                 |   5 -
 recipes-qt/qt5/qtlocation_5.3.1.bb                 |   5 +
 recipes-qt/qt5/qtmultimedia_5.3.0.bb               |   5 -
 recipes-qt/qt5/qtmultimedia_5.3.1.bb               |   5 +
 recipes-qt/qt5/qtquick1_5.3.0.bb                   |   5 -
 recipes-qt/qt5/qtquick1_5.3.1.bb                   |   5 +
 recipes-qt/qt5/qtquickcontrols_5.3.0.bb            |   5 -
 recipes-qt/qt5/qtquickcontrols_5.3.1.bb            |   5 +
 recipes-qt/qt5/qtscript_5.3.0.bb                   |   5 -
 recipes-qt/qt5/qtscript_5.3.1.bb                   |   5 +
 recipes-qt/qt5/qtsensors_5.3.0.bb                  |   5 -
 recipes-qt/qt5/qtsensors_5.3.1.bb                  |   5 +
 recipes-qt/qt5/qtserialport_5.3.0.bb               |   5 -
 recipes-qt/qt5/qtserialport_5.3.1.bb               |   5 +
 recipes-qt/qt5/qtsvg_5.3.0.bb                      |   5 -
 recipes-qt/qt5/qtsvg_5.3.1.bb                      |   5 +
 recipes-qt/qt5/qttools-native_5.3.0.bb             |   5 -
 recipes-qt/qt5/qttools-native_5.3.1.bb             |   5 +
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  23 ++--
 ...t-help-fix-linking-of-dependent-libraries.patch |  10 +-
 .../0003-add-noqtwebkit-configuration.patch        |  13 +-
 recipes-qt/qt5/qttools_5.3.0.bb                    |   5 -
 recipes-qt/qt5/qttools_5.3.1.bb                    |   5 +
 recipes-qt/qt5/qtwebkit-examples_5.3.0.bb          |   5 -
 recipes-qt/qt5/qtwebkit-examples_5.3.1.bb          |   5 +
 recipes-qt/qt5/qtwebkit_5.3.0.bb                   |   5 -
 recipes-qt/qt5/qtwebkit_5.3.1.bb                   |   5 +
 recipes-qt/qt5/qtwebsockets_5.3.0.bb               |   5 -
 recipes-qt/qt5/qtwebsockets_5.3.1.bb               |   5 +
 recipes-qt/qt5/qtx11extras_5.3.0.bb                |   5 -
 recipes-qt/qt5/qtx11extras_5.3.1.bb                |   5 +
 recipes-qt/qt5/qtxmlpatterns_5.3.0.bb              |   5 -
 recipes-qt/qt5/qtxmlpatterns_5.3.1.bb              |   5 +
 79 files changed, 502 insertions(+), 857 deletions(-)
 delete mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools_5.3.0.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.3.1.bb
 rename recipes-qt/qt5/{qt5-5.3.0.inc => qt5-5.3.1.inc} (100%)
 rename recipes-qt/qt5/{qtbase-native_5.3.0.bb => qtbase-native_5.3.1.bb} (63%)
 rename recipes-qt/qt5/qtbase/{0005-qt_module-Fix-pkgconfig-replacement.patch => 0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch} (51%)
 rename recipes-qt/qt5/qtbase/{0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch => 0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch} (89%)
 delete mode 100644 recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
 rename recipes-qt/qt5/qtbase/{0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch => 0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch} (88%)
 rename recipes-qt/qt5/qtbase/{0013-configure-bump-path-length-from-256-to-512-character.patch => 0008-configure-bump-path-length-from-256-to-512-character.patch} (78%)
 delete mode 100644 recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
 rename recipes-qt/qt5/qtbase/{0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch => 0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch} (55%)
 delete mode 100644 recipes-qt/qt5/qtbase/0010-Fix-missing-plugin_types.patch
 create mode 100644 recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
 rename recipes-qt/qt5/qtbase/{0016-Always-build-uic.patch => 0011-Always-build-uic.patch} (88%)
 create mode 100644 recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 rename recipes-qt/qt5/qtbase/{0017-configure-preserve-built-qmake-and-swap-with-native-.patch => 0012-configure-preserve-built-qmake-and-swap-with-native-.patch} (74%)
 delete mode 100644 recipes-qt/qt5/qtbase/0014-QOpenGLPaintDevice-sub-area-support.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0016-qmake-is-already-built-in-qtbase-native.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0017-Allow-building-a-separate-qmake-for-the-target.patch
 delete mode 100644 recipes-qt/qt5/qtbase_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtbase_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtconnectivity_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtconnectivity_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0002-Fix-improper-antialiasing-property-behavior.patch
 delete mode 100644 recipes-qt/qt5/qtdeclarative_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtdeclarative_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtimageformats_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtimageformats_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtlocation_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtlocation_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtmultimedia_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtmultimedia_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtquick1_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtquick1_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtquickcontrols_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtquickcontrols_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtscript_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtscript_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtsensors_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtsensors_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtserialport_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtserialport_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtsvg_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtsvg_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qttools-native_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qttools-native_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qttools_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qttools_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtwebkit-examples_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtwebkit-examples_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtwebkit_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtwebkit_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtwebsockets_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtwebsockets_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtx11extras_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtx11extras_5.3.1.bb
 delete mode 100644 recipes-qt/qt5/qtxmlpatterns_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtxmlpatterns_5.3.1.bb

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index 94b0462..48d9baf 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,7 +1,7 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.3.0", "5.3.0+git%"
+# possible values now "5.3.1", "5.3.0+git%"
 
-QT5_VERSION ?= "5.3.0"
+QT5_VERSION ?= "5.3.1"
 
 PREFERRED_VERSION_qtbase-native = "${QT5_VERSION}"
 PREFERRED_VERSION_qtbase = "${QT5_VERSION}"
diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 5424ce9..be85b65 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -10,35 +10,28 @@ require nativesdk-qt5.inc
 # it's already included with newer oe-core, but include it here for dylan
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 
-PR = "r1"
-
-# common with -native and target version
+# common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-qt_module-Fix-pkgconfig-replacement.patch \
-    file://0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch \
-    file://0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
-    file://0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch \
-    file://0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch \
-    file://0010-Fix-missing-plugin_types.patch \
-    file://0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0013-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0014-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
+    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
-# common with -native
+# common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0016-Always-build-uic.patch \
+    file://0011-Always-build-uic.patch \
 "
 
-# specific for nativesdk version
+# specific for nativesdk-qtbase
 SRC_URI += " \
-    file://0017-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
 PACKAGES = "${PN}-tools-dbg ${PN}-tools-dev ${PN}-tools-staticdev ${PN}-tools"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb b/recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb
deleted file mode 100644
index 95d3af7..0000000
--- a/recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "4bc43a72e1b3d804171e5b52640e8d96"
-SRC_URI[sha256sum] = "07320bc8bbb718c420e22486942985c79fb2e2743981a19954aa09cc8a7147ab"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb b/recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb
new file mode 100644
index 0000000..dfab4a1
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "572c9953847d391f2d33b420bbcdca46"
+SRC_URI[sha256sum] = "7b5a138d30d7c0228a51084407d5210f6d1acfbee2f95b87f189872cfcd3a569"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 183eaa8..fda58c9 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
-# common with -native and -nativesdk
+# common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
@@ -22,12 +22,12 @@ SRC_URI += "\
     file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
-# common with -native version
+# common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
 "    
 
-# specific for nativesdk version
+# specific for nativesdk-qtbase
 SRC_URI += " \
     file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.3.0.bb b/recipes-qt/qt5/nativesdk-qttools_5.3.0.bb
deleted file mode 100644
index d3956a7..0000000
--- a/recipes-qt/qt5/nativesdk-qttools_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "628a91ddfe34efc6622fdba8c6348855"
-SRC_URI[sha256sum] = "f64d2ca5dc59ab8980987649bcef4597a7c0194e802e64d93448cac892fd8250"
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.3.1.bb b/recipes-qt/qt5/nativesdk-qttools_5.3.1.bb
new file mode 100644
index 0000000..cce0210
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "7264920fc489ac878d40218263df8c4e"
+SRC_URI[sha256sum] = "edf59eeead3c1d202883c2e6091abd1d40ac37b6e6b0e240b29ab75f86c515a7"
diff --git a/recipes-qt/qt5/qt5-5.3.0.inc b/recipes-qt/qt5/qt5-5.3.1.inc
similarity index 100%
rename from recipes-qt/qt5/qt5-5.3.0.inc
rename to recipes-qt/qt5/qt5-5.3.1.inc
diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index fae7888..415cda2 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -7,28 +7,23 @@ QT_MODULE = "qtbase"
 
 require qt5-native.inc
 
-# common with nativesdk- and target version
+# common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-qt_module-Fix-pkgconfig-replacement.patch \
-    file://0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch \
-    file://0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
-    file://0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch \
-    file://0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch \
-    file://0010-Fix-missing-plugin_types.patch \
-    file://0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0013-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0014-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
+    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
-# common with nativesdk- version
+# common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0016-Always-build-uic.patch \
+    file://0011-Always-build-uic.patch \
 "
 
 QT_CONF_PATH = "${B}/qt.conf"
diff --git a/recipes-qt/qt5/qtbase-native_5.3.0.bb b/recipes-qt/qt5/qtbase-native_5.3.1.bb
similarity index 63%
rename from recipes-qt/qt5/qtbase-native_5.3.0.bb
rename to recipes-qt/qt5/qtbase-native_5.3.1.bb
index 8468b4f..a23f80f 100644
--- a/recipes-qt/qt5/qtbase-native_5.3.0.bb
+++ b/recipes-qt/qt5/qtbase-native_5.3.1.bb
@@ -7,5 +7,5 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRC_URI[md5sum] = "4bc43a72e1b3d804171e5b52640e8d96"
-SRC_URI[sha256sum] = "07320bc8bbb718c420e22486942985c79fb2e2743981a19954aa09cc8a7147ab"
+SRC_URI[md5sum] = "572c9953847d391f2d33b420bbcdca46"
+SRC_URI[sha256sum] = "7b5a138d30d7c0228a51084407d5210f6d1acfbee2f95b87f189872cfcd3a569"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index ce85172..df2f662 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -5,7 +5,7 @@ SRC_URI = "\
     git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
-# common with -native and -nativesdk
+# common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
@@ -19,7 +19,7 @@ SRC_URI += "\
     file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
-# common with -nativesdk version
+# common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
 "
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index c4d1b84..ce35410 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -1,27 +1,22 @@
 require qt5.inc
 
-# common with qtbase-native and nativesdk-qtbase
+# common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-qt_module-Fix-pkgconfig-replacement.patch \
-    file://0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch \
-    file://0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
-    file://0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch \
-    file://0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch \
-    file://0010-Fix-missing-plugin_types.patch \
-    file://0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0013-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0014-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
+    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
 
+# specific for qtbase
 SRC_URI += "\
-    file://0016-qmake-is-already-built-in-qtbase-native.patch \
-    file://0017-Allow-building-a-separate-qmake-for-the-target.patch \
+    file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index cddd621..f2a7c0e 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 2c2e479049c49539049db7e53d500e673285025f Mon Sep 17 00:00:00 2001
+From c5b50848ead7de12ec18cd30940d74d92b974280 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/17] Add linux-oe-g++ platform
+Subject: [PATCH 01/12] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -11,6 +11,14 @@ Subject: [PATCH 01/17] Add linux-oe-g++ platform
   Allow expansion of $(...) references from qmake.conf to generate
   qmake environment from shell environment as exported by qmake5_base
 
+* configure: don't export SYSTEM_VARIABLES to .qmake.vars
+  linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
+  causing issues as we need g++ to be used as linker
+
+* configure.prf: Allow to add extra arguments to make
+  sometimes we would like to add -e or define some variable and respect it from both
+  Makefiles used in configure tests and also Makefiles to build the application
+
 * OE_QMAKE_CXX in order to allow compiler version check to succeed
   which allows WebKit to be enabled.
 
@@ -29,19 +37,21 @@ Subject: [PATCH 01/17] Add linux-oe-g++ platform
     /bin/sh: line 0: test: -gt: unary operator expected
     which are not fatal, but still misleading in do_configure output
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
+                 too OE specific, probably cannot be upstreamed
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure                            |  54 ++++++++++++++++---
+ configure                            |  66 ++++++++++++++++-------
+ mkspecs/features/configure.prf       |   4 +-
  mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 3 files changed, 187 insertions(+), 7 deletions(-)
+ 4 files changed, 188 insertions(+), 22 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 601d84a..eaa4092 100755
+index d5c2b08..4eae0d3 100755
 --- a/configure
 +++ b/configure
 @@ -324,6 +324,16 @@ getQMakeConf()
@@ -78,26 +88,37 @@ index 601d84a..eaa4092 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -548,6 +568,18 @@ fi
+@@ -548,21 +568,19 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
+-SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
+-for varname in $SYSTEM_VARIABLES; do
 +# Export all OE variables for qmake.conf from shell env to QMakeVars
 +OE_VARIABLES="AR CC CFLAGS COMPILER CXX CXXFLAGS LDFLAGS LINK QT_CONFIG STRIP"
 +for varname in $OE_VARIABLES; do
-+    qmakevarname="${varname}"
-+    cmd=`echo \
+     qmakevarname="${varname}"
+-    # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
+-    if [ "${varname}" = "LDFLAGS" ]; then
+-        qmakevarname="LFLAGS"
+-    elif [ "${varname}" = "LD" ]; then
+-        qmakevarname="LINK"
+-    fi
+     cmd=`echo \
+-'if [ -n "\$'${varname}'" ]; then
+-    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}'"
 +'if [ -n "\$OE_QMAKE_'${varname}'" ]; then
 +    QMakeVar set OE_QMAKE_'${qmakevarname}' "\$OE_QMAKE_'${varname}'"
 +#    echo "Exporting OE_QMAKE_'${qmakevarname}' value=\"\$OE_QMAKE_'${varname}'\"" >&2
-+fi'`
-+    eval "$cmd"
-+done
+ fi'`
+     eval "$cmd"
+ done
 +
- SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
- for varname in $SYSTEM_VARIABLES; do
-     qmakevarname="${varname}"
-@@ -3117,7 +3149,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
++SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
+ # Use CC/CXX to run config.tests
+ mkdir -p "$outpath/config.tests"
+ rm -f "$outpath/config.tests/.qmake.cache"
+@@ -3140,7 +3158,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -106,7 +127,7 @@ index 601d84a..eaa4092 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3152,7 +3184,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3175,7 +3193,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -115,7 +136,7 @@ index 601d84a..eaa4092 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3617,6 +3649,14 @@ setBootstrapVariable()
+@@ -3633,6 +3651,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -130,23 +151,48 @@ index 601d84a..eaa4092 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3655,11 +3695,11 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3671,14 +3697,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
 -        setBootstrapVariable QMAKE_CC CC "$CC_TRANSFORM"
 -        setBootstrapVariable QMAKE_CXX CXX "$CC_TRANSFORM"
 -        setBootstrapVariable QMAKE_CFLAGS
+-        setBootstrapVariable QMAKE_CFLAGS_SPLIT_SECTIONS
 -        setBootstrapVariable QMAKE_CXXFLAGS
+-        setBootstrapVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
 -        setBootstrapVariable QMAKE_LFLAGS
+-        setBootstrapVariable QMAKE_LFLAGS_GCSECTIONS
 +        setBootstrapEvalVariable QMAKE_CC CC "$CC_TRANSFORM"
 +        setBootstrapEvalVariable QMAKE_CXX CXX "$CC_TRANSFORM"
 +        setBootstrapEvalVariable QMAKE_CFLAGS
++        setBootstrapEvalVariable QMAKE_CFLAGS_SPLIT_SECTIONS
 +        setBootstrapEvalVariable QMAKE_CXXFLAGS
++        setBootstrapEvalVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
 +        setBootstrapEvalVariable QMAKE_LFLAGS
++        setBootstrapEvalVariable QMAKE_LFLAGS_GCSECTIONS
  
          if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
+diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
+index fe41c54..e2db923 100644
+--- a/mkspecs/features/configure.prf
++++ b/mkspecs/features/configure.prf
+@@ -60,12 +60,12 @@ defineTest(qtCompileTest) {
+     }
+ 
+     # Clean up after previous run
+-    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE distclean")
++    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS) distclean")
+ 
+     mkpath($$test_out_dir)|error("Aborting.")
+ 
+     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) $$qmake_configs $$shell_quote($$test_dir)") {
+-        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
++        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
+             log("yes$$escape_expand(\\n)")
+             msg = "test $$1 succeeded"
+             write_file($$QMAKE_CONFIG_LOG, msg, append)
 diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
 new file mode 100644
 index 0000000..ca26b10
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 14f0fc7..247bfb7 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,14 +1,17 @@
-From c45a30d1301f85e49eef66c06cccf2a16741a932 Mon Sep 17 00:00:00 2001
+From 5d83d8ce8b601a983b055f32dc67a418a0ce06ab Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/17] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
 to inject new prefixes and other paths into qmake. This is needed when using
 the same qmake binary to build qt/x11 and qt/embedded
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
+  again very OE specific to read everything from environment (reusing the same
+  qmake from sstate and replacing all configured paths in it with qt.conf from
+  environment).
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -16,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 6d25325..80e0f30 100644
+index 174c1d0..69e614f 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -153,7 +153,10 @@ QLibrarySettings::QLibrarySettings()
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index f8253ec..66903a3 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From 5c2a17167e89f8f6cf26cbc289e57fa466678d2d Mon Sep 17 00:00:00 2001
+From 1fd06315781ada843e473ba2c28c594e05808ca2 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/17] Add -external-hostbindir option
+Subject: [PATCH 03/12] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -13,25 +13,34 @@ Subject: [PATCH 03/17] Add -external-hostbindir option
 * isEmpty works correctly only with qmake variables (e.g. $$FOO -
   isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
 
+* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
+
 Upstream-Status: Pending
+  is a lot better for upstreaming (and it was already sort of approved by
+  Oswald) but in 5.2.0 I've noticed that he added something similar for
+  android builds
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Simon Busch <morphis@gravedo.de>
 ---
- configure                           | 15 +++++++++++++++
- mkspecs/features/qt_functions.prf   |  9 ++++++++-
- mkspecs/features/qt_tool.prf        |  3 +--
- qmake/property.cpp                  |  1 +
- qtbase.pro                          | 12 +++++++++---
- src/corelib/global/qlibraryinfo.cpp |  3 ++-
- src/corelib/global/qlibraryinfo.h   |  1 +
- tools/configure/configureapp.cpp    |  8 ++++++++
- 8 files changed, 45 insertions(+), 7 deletions(-)
+ configure                                   | 15 +++++++++++++++
+ mkspecs/features/qt_functions.prf           |  2 +-
+ mkspecs/features/qt_tool.prf                |  3 +--
+ qmake/property.cpp                          |  1 +
+ qtbase.pro                                  | 12 +++++++++---
+ src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
+ src/corelib/global/qlibraryinfo.cpp         |  3 ++-
+ src/corelib/global/qlibraryinfo.h           |  1 +
+ src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
+ src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
+ tools/configure/configureapp.cpp            |  8 ++++++++
+ 11 files changed, 44 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
-index eaa4092..43ad8df 100755
+index 4eae0d3..48d5119 100755
 --- a/configure
 +++ b/configure
-@@ -791,6 +791,7 @@ QT_HOST_BINS=
+@@ -777,6 +777,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -39,7 +48,7 @@ index eaa4092..43ad8df 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -910,6 +911,7 @@ while [ "$#" -gt 0 ]; do
+@@ -896,6 +897,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -47,7 +56,7 @@ index eaa4092..43ad8df 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1124,6 +1126,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1110,6 +1112,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -68,7 +77,7 @@ index eaa4092..43ad8df 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2906,6 +2915,11 @@ fi
+@@ -2915,6 +2924,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -80,7 +89,7 @@ index eaa4092..43ad8df 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3593,6 +3607,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3595,6 +3609,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -89,27 +98,20 @@ index eaa4092..43ad8df 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 1dacfed..7229845 100644
+index 9a4d80e..e60ce37 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -193,7 +193,14 @@ defineTest(qtAddRpathLink) {
+@@ -193,7 +193,7 @@ defineTest(qtAddRpathLink) {
  defineTest(qtPrepareTool) {
-     $$1 = $$eval(QT_TOOL.$${2}.binary)
-     isEmpty($$1) {
--        $$1 = $$[QT_HOST_BINS]/$$2
-+        $$1 = $$[QT_EXTERNAL_HOST_BINS]/$$2
-+        # for some reason isEmpty does not work here, FIXME before submitting upstream
-+        # DEBUG 1: mkspecs/features/qt_functions.prf:198: calling built-in isEmpty(/OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/qt5)
-+        # DEBUG 1: mkspecs/features/qt_functions.prf:198: test function returned true
-+        # DEBUG 1: mkspecs/features/qt_functions.prf:198: taking 'then' branch
-+        !exists($$[QT_EXTERNAL_HOST_BINS]/$$2) {
-+            $$1 = $$[QT_HOST_BINS]/$$2
-+        }
-         exists($$eval($$1).pl) {
-             $$1 = perl -w $$eval($$1).pl
+     cmd = $$eval(QT_TOOL.$${2}.binary)
+     isEmpty(cmd) {
+-        cmd = $$[QT_HOST_BINS]/$$2
++        cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
+         exists($${cmd}.pl) {
+             cmd = perl -w $$system_path($${cmd}.pl)
          } else: contains(QMAKE_HOST.os, Windows) {
 diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index f0864f9..50bfac8 100644
+index 1d3e88c..bd44754 100644
 --- a/mkspecs/features/qt_tool.prf
 +++ b/mkspecs/features/qt_tool.prf
 @@ -15,8 +15,7 @@ CONFIG += console
@@ -135,7 +137,7 @@ index e50485c..71291ad 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/qtbase.pro b/qtbase.pro
-index ed6fc39..2421f41 100644
+index d6861cf..92e6a83 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
 @@ -71,16 +71,22 @@ CONFIG -= qt
@@ -164,8 +166,39 @@ index ed6fc39..2421f41 100644
  INSTALLS += syncqt
  
  # If we are doing a prefix build, create a "module" pri which enables
+diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
+index 9bda70e..6e3605a 100644
+--- a/src/corelib/Qt5CoreConfigExtras.cmake.in
++++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
+@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qmake$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_Core_check_file_exists(${imported_location})
+ 
+@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::moc)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/moc$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_Core_check_file_exists(${imported_location})
+ 
+@@ -37,7 +37,7 @@ if (NOT TARGET Qt5::rcc)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/rcc$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_Core_check_file_exists(${imported_location})
+ 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 80e0f30..89e13cf 100644
+index 69e614f..a95ca35 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -336,7 +336,7 @@ QLibraryInfo::isDebugBuild()
@@ -197,11 +230,46 @@ index 0b573c2..b5535ee 100644
          TargetSpecPath,
          HostSpecPath,
          LastHostPath = HostSpecPath,
+diff --git a/src/dbus/Qt5DBusConfigExtras.cmake.in b/src/dbus/Qt5DBusConfigExtras.cmake.in
+index 1d94715..301af8f 100644
+--- a/src/dbus/Qt5DBusConfigExtras.cmake.in
++++ b/src/dbus/Qt5DBusConfigExtras.cmake.in
+@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qdbuscpp2xml)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_DBus_check_file_exists(${imported_location})
+ 
+@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::qdbusxml2cpp)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_DBus_check_file_exists(${imported_location})
+ 
+diff --git a/src/widgets/Qt5WidgetsConfigExtras.cmake.in b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
+index 99d87e2..5621dc0 100644
+--- a/src/widgets/Qt5WidgetsConfigExtras.cmake.in
++++ b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
+@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::uic)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5Widgets_install_prefix}/$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/uic$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_Widgets_check_file_exists(${imported_location})
+ 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index fe2caa2..eb472db 100644
+index b756509..7e61845 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1208,6 +1208,13 @@ void Configure::parseCmdLine()
+@@ -1213,6 +1213,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -215,7 +283,7 @@ index fe2caa2..eb472db 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -3957,6 +3964,7 @@ void Configure::generateQConfigCpp()
+@@ -3983,6 +3990,7 @@ void Configure::generateQConfigCpp()
                    << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
                    << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
                    << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
diff --git a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index d24e193..db6266d 100644
--- a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,19 +1,20 @@
-From 15b871b694cead18fcb750c0bb393440ea929e06 Mon Sep 17 00:00:00 2001
+From 4a86d338f04c2bfa4d3f63a2fa9d1252503757fd Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 04/17] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 04/12] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
+  again a bit OE specific
 ---
  tools/configure/configureapp.cpp | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index eb472db..808c8dd 100644
+index 7e61845..29c6358 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -3344,8 +3344,8 @@ void Configure::generateQConfigPri()
+@@ -3370,8 +3370,8 @@ void Configure::generateQConfigPri()
          configStream << "    QT_ARCH = " << dictionary["QT_ARCH"] << endl;
          if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
              // FIXME: add detection
diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
similarity index 51%
rename from recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
rename to recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 751ba27..6a7d714 100644
--- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
+++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From ad57786c39de2a192c0972bca6ffde2ce7a05d91 Mon Sep 17 00:00:00 2001
+From 71e5a4c62ca38b30a14c9957db21a7cbf5fcf54d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 05/17] qt_module: Fix pkgconfig replacement
+Subject: [PATCH 05/12] qt_module: Fix pkgconfig and libtool replacements
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -40,60 +40,42 @@ Content-Transfer-Encoding: 8bit
   Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
   Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
 
+Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- mkspecs/features/qt_module.prf | 20 +++++++++++++-------
- 1 file changed, 13 insertions(+), 7 deletions(-)
+ mkspecs/features/qt_module.prf | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
 
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 2134077..a88b8cc 100644
+index 8bf4c92..9737f8c 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -170,30 +170,36 @@ load(qt_installs)
-     rplbase = $$dirname(_QMAKE_SUPER_CACHE_)/[^/][^/]*
- else: \
-     rplbase = $$MODULE_BASE_OUTDIR
--include_replace.match = $$rplbase/include
--include_replace.replace = $$[QT_INSTALL_HEADERS/raw]
--include_replace.CONFIG = path
-+pkgconfig_include_replace.match = $$rplbase/include
-+pkgconfig_include_replace.replace = "\$$\\{includedir}"
-+pkgconfig_include_replace.CONFIG = path
-+pkgconfig_lib_replace.match = $$rplbase/lib
-+pkgconfig_lib_replace.replace = "\$$\\{libdir}"
-+pkgconfig_lib_replace.CONFIG = path
- lib_replace.match = $$rplbase/lib
- host_build: \
-     lib_replace.replace = $$[QT_HOST_LIBS]
- else: \
-     lib_replace.replace = $$[QT_INSTALL_LIBS/raw]
- lib_replace.CONFIG = path
--QMAKE_PRL_INSTALL_REPLACE += include_replace lib_replace
-+lafile_replace.match = "-L$$[QT_INSTALL_LIBS/raw]"
-+lafile_replace.replace = ""
-+lafile_replace.CONFIG = path
-+QMAKE_PRL_INSTALL_REPLACE += lib_replace lafile_replace
+@@ -188,10 +188,24 @@ unix|mingw {
+         QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
+     QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
  
- unix|mingw {
-    CONFIG += create_pc
-    QMAKE_PKGCONFIG_LIBDIR = $$lib_replace.replace
--   QMAKE_PKGCONFIG_INCDIR = $$include_replace.replace
-+   QMAKE_PKGCONFIG_INCDIR = $$[QT_INSTALL_HEADERS/raw]
-    QMAKE_PKGCONFIG_CFLAGS = -I${includedir}/$$MODULE_INCNAME
-    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
--   QMAKE_PKGCONFIG_INSTALL_REPLACE += include_replace lib_replace
-+   QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace pkgconfig_lib_replace
++    pkgconfig_include_replace.match = $$rplbase/include
++    pkgconfig_include_replace.replace = "\$$\\{includedir}"
++    pkgconfig_include_replace.CONFIG = path
++    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
++
++    pkgconfig_lib_replace.match = $$rplbase/lib
++    pkgconfig_lib_replace.replace = "\$$\\{libdir}"
++    pkgconfig_lib_replace.CONFIG = path
++    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_lib_replace
++
+     unix {
+         CONFIG += create_libtool explicitlib
+         QMAKE_LIBTOOL_LIBDIR = $$qt_libdir
+         QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace
++        lafile_replace.match = "-L$$[QT_INSTALL_LIBS/raw]"
++        lafile_replace.replace = ""
++        lafile_replace.CONFIG = path
++        QMAKE_LIBTOOL_INSTALL_REPLACE += lafile_replace
+     }
  }
  
- unix {
-    CONFIG += create_libtool explicitlib
-    QMAKE_LIBTOOL_LIBDIR = $$lib_replace.replace
--   QMAKE_LIBTOOL_INSTALL_REPLACE += include_replace lib_replace
-+   QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace lafile_replace
- }
- 
- unix|mingw {
 -- 
 2.0.0
 
diff --git a/recipes-qt/qt5/qtbase/0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
similarity index 89%
rename from recipes-qt/qt5/qtbase/0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
rename to recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 412ff35..e70417c 100644
--- a/recipes-qt/qt5/qtbase/0011-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,7 +1,7 @@
-From 13d45f81c26b22668c58d56a797db6f4309b5469 Mon Sep 17 00:00:00 2001
+From a3e87ebdf7dff6b9d4b1d8191f044cfb56b9da3d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH 11/17] Revert "eglfs: Print the chosen config in debug mode"
+Subject: [PATCH 06/12] Revert "eglfs: Print the chosen config in debug mode"
 
 This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
 ---
@@ -10,10 +10,10 @@ This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
  2 files changed, 3 insertions(+), 8 deletions(-)
 
 diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index 75789db..cd732d9 100644
+index 5eed470..39c7c1f 100644
 --- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
 +++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-@@ -437,9 +437,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
+@@ -451,9 +451,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
      for (index = 0; attrs[index].attr != -1; ++index) {
          EGLint value;
          if (eglGetConfigAttrib(display, config, attrs[index].attr, &value)) {
diff --git a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch b/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
deleted file mode 100644
index 2ad412e..0000000
--- a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 96b69ad415b4883782841fa1d7723cf182e4ce6e Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 8 May 2013 23:54:35 +0200
-Subject: [PATCH 06/17] configure: don't export SYSTEM_VARIABLES to .qmake.vars
-
-* linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
-  causing issues as we need g++ to be used as linker
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 14 --------------
- 1 file changed, 14 deletions(-)
-
-diff --git a/configure b/configure
-index 43ad8df..341a01b 100755
---- a/configure
-+++ b/configure
-@@ -581,20 +581,6 @@ fi'`
- done
- 
- SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
--for varname in $SYSTEM_VARIABLES; do
--    qmakevarname="${varname}"
--    # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
--    if [ "${varname}" = "LDFLAGS" ]; then
--        qmakevarname="LFLAGS"
--    elif [ "${varname}" = "LD" ]; then
--        qmakevarname="LINK"
--    fi
--    cmd=`echo \
--'if [ -n "\$'${varname}'" ]; then
--    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}'"
--fi'`
--    eval "$cmd"
--done
- # Use CC/CXX to run config.tests
- mkdir -p "$outpath/config.tests"
- rm -f "$outpath/config.tests/.qmake.cache"
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch b/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
deleted file mode 100644
index 66eb898..0000000
--- a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 28fa609f9726993dd5b52de45c3458a1bdff6149 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 9 May 2013 10:06:50 +0200
-Subject: [PATCH 07/17] configure.prf: Allow to add extra arguments to make
-
-* sometimes we would like to add -e or define some variable and respect it from both
-  Makefiles used in configure tests and also Makefiles to build the application
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mkspecs/features/configure.prf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index fe41c54..e2db923 100644
---- a/mkspecs/features/configure.prf
-+++ b/mkspecs/features/configure.prf
-@@ -60,12 +60,12 @@ defineTest(qtCompileTest) {
-     }
- 
-     # Clean up after previous run
--    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE distclean")
-+    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS) distclean")
- 
-     mkpath($$test_out_dir)|error("Aborting.")
- 
-     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) $$qmake_configs $$shell_quote($$test_dir)") {
--        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
-+        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
-             log("yes$$escape_expand(\\n)")
-             msg = "test $$1 succeeded"
-             write_file($$QMAKE_CONFIG_LOG, msg, append)
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase/0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
similarity index 88%
rename from recipes-qt/qt5/qtbase/0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch
rename to recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 6c7d139..b5e46d7 100644
--- a/recipes-qt/qt5/qtbase/0012-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From ebe56bbaf8916bae94e7cef7932b87fd0fe13959 Mon Sep 17 00:00:00 2001
+From 75fbeec66d98aacad5be1e3fcfd92f42b1ef0da7 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 12/17] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 07/12] qeglplatformintegration: Undefine CursorShape from X.h
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
diff --git a/recipes-qt/qt5/qtbase/0013-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
similarity index 78%
rename from recipes-qt/qt5/qtbase/0013-configure-bump-path-length-from-256-to-512-character.patch
rename to recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
index a215a5d..5df8330 100644
--- a/recipes-qt/qt5/qtbase/0013-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 2fd1d381e0202296303f296965467f3252d72e25 Mon Sep 17 00:00:00 2001
+From a3beca1f4ba231baf38e7de0221e55681437966d Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 13/17] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 08/12] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -12,10 +12,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 7d33403..53eb65d 100755
+index 48d5119..3c0347a 100755
 --- a/configure
 +++ b/configure
-@@ -3578,7 +3578,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3573,7 +3573,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
  
  /* Installation Info */
diff --git a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch b/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
deleted file mode 100644
index d1d5873..0000000
--- a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 8cca7892a65992369bb50a965293ebd2198ce40a Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH 08/17] configure: make pulseaudio, alsa, freetype a
- configurable option
-
-Allows disabling pulseaudio, alsa, freetype support at configure time
-making builds more deterministic.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/configure b/configure
-index 341a01b..7d33403 100755
---- a/configure
-+++ b/configure
-@@ -1826,6 +1826,27 @@ while [ "$#" -gt 0 ]; do
-             UNKNOWN_OPT=yes
-         fi
-         ;;
-+    pulseaudio)
-+        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-+            CFG_PULSEAUDIO="$VAL"
-+        else
-+            UNKNOWN_OPT=yes
-+        fi
-+        ;;
-+    alsa)
-+        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-+            CFG_ALSA="$VAL"
-+        else
-+            UNKNOWN_OPT=yes
-+        fi
-+        ;;
-+    freetype)
-+        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ] || [ "$VAL" = "system" ]; then
-+            CFG_LIBFREETYPE="$VAL"
-+        else
-+            UNKNOWN_OPT=yes
-+        fi
-+        ;;
-     gtkstyle)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_QGTKSTYLE="$VAL"
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
deleted file mode 100644
index c83e330..0000000
--- a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From c1c28fa202519d6af0ca5aac942c3e18aaeda602 Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Mon, 22 Jul 2013 21:09:41 +0000
-Subject: [PATCH 09/17] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to
- determine path to host binaries
-
-Upstream-Status: Inappropiate (configuration)
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/corelib/Qt5CoreConfigExtras.cmake.in    | 6 +++---
- src/dbus/Qt5DBusConfigExtras.cmake.in       | 4 ++--
- src/widgets/Qt5WidgetsConfigExtras.cmake.in | 2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index 9bda70e..6e3605a 100644
---- a/src/corelib/Qt5CoreConfigExtras.cmake.in
-+++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
-@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qmake$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Core_check_file_exists(${imported_location})
- 
-@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::moc)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/moc$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Core_check_file_exists(${imported_location})
- 
-@@ -37,7 +37,7 @@ if (NOT TARGET Qt5::rcc)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/rcc$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Core_check_file_exists(${imported_location})
- 
-diff --git a/src/dbus/Qt5DBusConfigExtras.cmake.in b/src/dbus/Qt5DBusConfigExtras.cmake.in
-index 1d94715..301af8f 100644
---- a/src/dbus/Qt5DBusConfigExtras.cmake.in
-+++ b/src/dbus/Qt5DBusConfigExtras.cmake.in
-@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qdbuscpp2xml)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_DBus_check_file_exists(${imported_location})
- 
-@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::qdbusxml2cpp)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_DBus_check_file_exists(${imported_location})
- 
-diff --git a/src/widgets/Qt5WidgetsConfigExtras.cmake.in b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-index e5650ff..16ff007 100644
---- a/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-+++ b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::uic)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Widgets_install_prefix}/$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/uic$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Widgets_check_file_exists(${imported_location})
- 
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
similarity index 55%
rename from recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
rename to recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index 92b9ddd..c3750b8 100644
--- a/recipes-qt/qt5/qtbase/0015-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From c209e7648bc0c59707fe18874789a826f8beb47b Mon Sep 17 00:00:00 2001
+From 6d1123116233e55c4ade13378eec41fb7441cec6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 15/17] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 09/12] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -21,32 +21,41 @@ Upstream-Status: unknown
 [2] https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/qeglfswindow.cpp.patch
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/plugins/platforms/eglfs/qeglfswindow.cpp | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
+ src/plugins/platforms/eglfs/qeglfswindow.cpp | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
 
 diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-index 2d36c0b..f2b68d3 100644
+index 2d36c0b..854531e 100644
 --- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
 +++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-@@ -72,6 +72,16 @@ void QEglFSWindow::create()
+@@ -74,6 +74,15 @@ void QEglFSWindow::create()
  
-     QEGLPlatformWindow::create();
+     m_flags = Created;
  
 +    static EGLSurface __singleWindowSurface;
-+    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::MultipleWindows) && (__singleWindowSurface))
-+    {
++    if(QEglFSHooks::hooks() && ! QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::MultipleWindows) && (__singleWindowSurface)) {
 +        m_surface = __singleWindowSurface;
 +#ifdef QEGL_EXTRA_DEBUG
-+    qWarning("Surface recreate request, re-using %x\n", m_surface);
++        qWarning("Surface recreate request, re-using %x\n", m_surface);
 +#endif
-+       return;
++        return;
 +    }
 +
-     m_flags = Created;
- 
      if (window()->type() == Qt::Desktop)
-@@ -105,6 +115,11 @@ void QEglFSWindow::create()
+         return;
+ 
+@@ -85,7 +94,7 @@ void QEglFSWindow::create()
+         if (isRaster() && screen->compositingWindow())
+             return;
+ 
+-#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK)
++#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK) || defined(EGL_API_FB)
+         // We can have either a single OpenGL window or multiple raster windows.
+         // Other combinations cannot work.
+         qFatal("EGLFS: OpenGL windows cannot be mixed with others.");
+@@ -105,6 +114,11 @@ void QEglFSWindow::create()
  
      resetSurface();
  
diff --git a/recipes-qt/qt5/qtbase/0010-Fix-missing-plugin_types.patch b/recipes-qt/qt5/qtbase/0010-Fix-missing-plugin_types.patch
deleted file mode 100644
index 8defd45..0000000
--- a/recipes-qt/qt5/qtbase/0010-Fix-missing-plugin_types.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 92cd73cb679dec203484cd76deff50cf329d8c44 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 21 Apr 2014 15:09:23 +0200
-Subject: [PATCH 10/17] Fix missing plugin_types
-
-* bearer/generic was failing with:
-  Project ERROR: No module claims plugin type 'bearer'
-
-Change-Id: I90848856a8b0a4df52e599983cf7dde0bc0e6623
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mkspecs/features/qt_module_pris.prf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mkspecs/features/qt_module_pris.prf b/mkspecs/features/qt_module_pris.prf
-index f31bc38..415e780 100644
---- a/mkspecs/features/qt_module_pris.prf
-+++ b/mkspecs/features/qt_module_pris.prf
-@@ -177,7 +177,7 @@ MODULE_FWD_PRI = $$mod_work_pfx/qt_lib_$${MODULE_ID}.pri
-         include($$mod_work_pfx/qt_lib_$${pri}.pri)
-     for(mod, mods_to_load) {
-         for(var, $$list(VERSION MAJOR_VERSION MINOR_VERSION PATCH_VERSION \
--                        name depends module_config CONFIG DEFINES sources \
-+                        name depends module_config plugin_types CONFIG DEFINES sources \
-                         includes bins libs libexecs plugins imports qml \
-                         rpath_link \
-                 )):defined(QT.$${mod}.$$var, var):cache(QT.$${mod}.$$var, transient)
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch b/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
new file mode 100644
index 0000000..9fb7e08
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
@@ -0,0 +1,26 @@
+From 2a6891f2cbf221b51b214a527adb4602e20b100b Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 4 Jun 2014 15:26:11 +0200
+Subject: [PATCH 10/12] Revert "Use the "gcc" feature in simd.prf"
+
+This reverts commit 3b00cc480400d47c59c29d3507c7fcdc9be2a489.
+---
+ mkspecs/features/simd.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/simd.prf b/mkspecs/features/simd.prf
+index 62a63f9..4f86f60 100644
+--- a/mkspecs/features/simd.prf
++++ b/mkspecs/features/simd.prf
+@@ -18,7 +18,7 @@ QT_CPU_FEATURES = $$eval(QT_CPU_FEATURES.$$QT_ARCH)
+ #
+ # Set up compilers for SIMD (SSE/AVX, NEON etc)
+ #
+-gcc {       # includes intel_icc and clang variants
++*-g++*|intel_icc|*-clang*|*-qcc* {
+     sse2 {
+         HEADERS += $$SSE2_HEADERS
+ 
+-- 
+2.0.0
+
diff --git a/recipes-qt/qt5/qtbase/0016-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
similarity index 88%
rename from recipes-qt/qt5/qtbase/0016-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
index a466dbc..dcd10bd 100644
--- a/recipes-qt/qt5/qtbase/0016-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From 981cbf981b4a36d790b4ebf1a3434ef439ad3e52 Mon Sep 17 00:00:00 2001
+From bf4593d727fa673734bb1930f79fc012e52250ec Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 16/17] Always build uic
+Subject: [PATCH 11/12] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
diff --git a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
new file mode 100644
index 0000000..7135a49
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -0,0 +1,50 @@
+From 6317e81c96cec598da266d0c863afa4320d1e38a Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 29 Oct 2012 20:07:49 -0700
+Subject: [PATCH 11/11] qmake: don't build it in configure, but allow to build
+ it separately
+
+* it is already built in qtbase-native, so we don't need it in configure
+* allow building a separate qmake for the target
+
+Upstream-Status: Inappropriate [configuration]
+  OE specific for native/target builds
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure       | 2 +-
+ qmake/qmake.pro | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 3c0347a..a75ca11 100755
+--- a/configure
++++ b/configure
+@@ -3675,7 +3675,7 @@ setBootstrapEvalVariable()
+ 
+ 
+ # build qmake
+-if true; then ###[ '!' -f "$outpath/bin/qmake" ];
++if false; then ###[ '!' -f "$outpath/bin/qmake" ];
+     echo "Creating qmake..."
+ 
+     mkdir -p "$outpath/qmake" || exit
+diff --git a/qmake/qmake.pro b/qmake/qmake.pro
+index 89d6ea5..7c605b9 100644
+--- a/qmake/qmake.pro
++++ b/qmake/qmake.pro
+@@ -8,6 +8,8 @@ CONFIG -= qt
+ DEFINES += \
+     QT_BUILD_QMAKE \
+     PROEVALUATOR_FULL
++DESTDIR = ../bin/
++TARGET = qmake
+ 
+ VPATH += \
+     ../src/corelib/global \
+-- 
+2.0.0
+
diff --git a/recipes-qt/qt5/qtbase/0017-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
similarity index 74%
rename from recipes-qt/qt5/qtbase/0017-configure-preserve-built-qmake-and-swap-with-native-.patch
rename to recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
index 0d5bc2f..32d67db 100644
--- a/recipes-qt/qt5/qtbase/0017-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,7 +1,7 @@
-From 88e1910cc2e0c2890d7084cc66ebb7c3c9981bf3 Mon Sep 17 00:00:00 2001
+From bfc795c5af38731dbd18d20467e27dd710df374c Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 17/17] configure: preserve built qmake and swap with native
+Subject: [PATCH 12/12] configure: preserve built qmake and swap with native
  one
 
 Let configure script build the real qmake, but right after it's built, swap
@@ -13,10 +13,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 53eb65d..01832e6 100755
+index 3c0347a..c51f785 100755
 --- a/configure
 +++ b/configure
-@@ -3827,6 +3827,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3825,6 +3825,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
  
      (cd "$outpath/qmake"; "$MAKE") || exit 2
  fi # Build qmake
diff --git a/recipes-qt/qt5/qtbase/0014-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0014-QOpenGLPaintDevice-sub-area-support.patch
deleted file mode 100644
index 64dd18a..0000000
--- a/recipes-qt/qt5/qtbase/0014-QOpenGLPaintDevice-sub-area-support.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From d252513e388358e52865a29374840327369cb479 Mon Sep 17 00:00:00 2001
-From: Jani Hautakangas <jani.hautakangas@ixonos.com>
-Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 14/17] QOpenGLPaintDevice sub-area support
-
-Allows creating QOpenGLPaintDevice targetting sub-area
-of binded framebuffer.
-
-Upstream-Status: Pending
-
-Change-Id: Ida2f079aa1ac0b87d36b54129e226399dbcdda80
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/gui/opengl/qopenglpaintdevice.cpp       | 12 ++++++++++++
- src/gui/opengl/qopenglpaintdevice.h         |  2 ++
- src/gui/opengl/qopenglpaintengine.cpp       |  9 +++++++--
- src/gui/opengl/qopenglpaintengine_p.h       |  1 +
- src/gui/opengl/qopengltextureglyphcache.cpp |  2 +-
- 5 files changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index 6750458..034630a 100644
---- a/src/gui/opengl/qopenglpaintdevice.cpp
-+++ b/src/gui/opengl/qopenglpaintdevice.cpp
-@@ -111,6 +111,7 @@ class QOpenGLPaintDevicePrivate
- public:
-     QOpenGLPaintDevicePrivate(const QSize &size);
- 
-+    QPoint offset;
-     QSize size;
-     QOpenGLContext *ctx;
- 
-@@ -159,6 +160,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
- {
- }
- 
-+QOpenGLPaintDevice::QOpenGLPaintDevice(int x, int y, int width, int height)
-+    : d_ptr(new QOpenGLPaintDevicePrivate(QSize(width, height)))
-+{
-+    d_ptr->offset = QPoint(x,y);
-+}
-+
- /*!
-     Destroys the QOpenGLPaintDevice.
- */
-@@ -228,6 +235,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
-     return d_ptr->ctx;
- }
- 
-+QPoint QOpenGLPaintDevice::offset() const
-+{
-+    return d_ptr->offset;
-+}
-+
- /*!
-     Returns the pixel size of the paint device.
- 
-diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
-index c05571c..01eb1bc 100644
---- a/src/gui/opengl/qopenglpaintdevice.h
-+++ b/src/gui/opengl/qopenglpaintdevice.h
-@@ -62,12 +62,14 @@ public:
-     QOpenGLPaintDevice();
-     explicit QOpenGLPaintDevice(const QSize &size);
-     QOpenGLPaintDevice(int width, int height);
-+    QOpenGLPaintDevice(int x, int y, int width, int height);
-     virtual ~QOpenGLPaintDevice();
- 
-     int devType() const { return QInternal::OpenGL; }
-     QPaintEngine *paintEngine() const;
- 
-     QOpenGLContext *context() const;
-+    QPoint offset() const;
-     QSize size() const;
-     void setSize(const QSize &size);
-     void setDevicePixelRatio(qreal devicePixelRatio);
-diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 81a0d82..ce57261 100644
---- a/src/gui/opengl/qopenglpaintengine.cpp
-+++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -1985,7 +1985,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
-     for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
-         d->vertexAttributeArraysEnabledState[i] = false;
- 
-+    const QPoint offset = d->device->offset();
-     const QSize sz = d->device->size();
-+    d->x = offset.x();
-+    d->y = offset.y();
-     d->width = sz.width();
-     d->height = sz.height();
-     d->mode = BrushDrawingMode;
-@@ -2070,7 +2073,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
-         d->device->ensureActiveTarget();
- 
-         d->transferMode(BrushDrawingMode);
--        d->funcs.glViewport(0, 0, d->width, d->height);
-+        d->funcs.glViewport(d->x, d->y, d->width, d->height);
-         d->needsSync = false;
-         d->lastMaskTextureUsed = 0;
-         d->shaderManager->setDirty();
-@@ -2113,6 +2116,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
-     if (bounds == QRect(0, 0, width, height)) {
-         funcs.glDisable(GL_SCISSOR_TEST);
-     } else {
-+        bounds = QRect(bounds.x(), bounds.y(), bounds.width(), bounds.height());
-         funcs.glEnable(GL_SCISSOR_TEST);
-         setScissor(bounds);
-     }
-@@ -2121,12 +2125,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
- 
- void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
- {
--    const int left = rect.left();
-+    const int left = rect.left() + x;
-     const int width = rect.width();
-     int bottom = height - (rect.top() + rect.height());
-     if (device->paintFlipped()) {
-         bottom = rect.top();
-     }
-+    bottom += y;
-     const int height = rect.height();
- 
-     funcs.glScissor(left, bottom, width, height);
-diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index 4f0e2e5..f211de1 100644
---- a/src/gui/opengl/qopenglpaintengine_p.h
-+++ b/src/gui/opengl/qopenglpaintengine_p.h
-@@ -264,6 +264,7 @@ public:
-     QOpenGL2PaintEngineEx* q;
-     QOpenGLEngineShaderManager* shaderManager;
-     QOpenGLPaintDevice* device;
-+    int x, y;
-     int width, height;
-     QOpenGLContext *ctx;
-     EngineMode mode;
-diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index ac88d9d..6c77f10 100644
---- a/src/gui/opengl/qopengltextureglyphcache.cpp
-+++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -315,7 +315,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
-     funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
- 
-     if (pex != 0) {
--        funcs->glViewport(0, 0, pex->width, pex->height);
-+        funcs->glViewport(pex->x, pex->y, pex->width, pex->height);
-         pex->updateClipScissorTest();
-     } else {
-         if (m_vao.isCreated()) {
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase/0016-qmake-is-already-built-in-qtbase-native.patch b/recipes-qt/qt5/qtbase/0016-qmake-is-already-built-in-qtbase-native.patch
deleted file mode 100644
index b807862..0000000
--- a/recipes-qt/qt5/qtbase/0016-qmake-is-already-built-in-qtbase-native.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9a83bdba584d2a816c4f54fbc903f9f8f9fc0a2d Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 16/17] qmake is already built in qtbase-native
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 53eb65d..b61c82b 100755
---- a/configure
-+++ b/configure
-@@ -3680,7 +3680,7 @@ setBootstrapEvalVariable()
- 
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if false; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake..."
- 
-     mkdir -p "$outpath/qmake" || exit
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase/0017-Allow-building-a-separate-qmake-for-the-target.patch b/recipes-qt/qt5/qtbase/0017-Allow-building-a-separate-qmake-for-the-target.patch
deleted file mode 100644
index a6fcfe5..0000000
--- a/recipes-qt/qt5/qtbase/0017-Allow-building-a-separate-qmake-for-the-target.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a850a288fb526e6a4003616aa11dd992688ccc89 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Mon, 29 Oct 2012 20:26:36 -0700
-Subject: [PATCH 17/17] Allow building a separate qmake for the target
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- qmake/qmake.pro | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/qmake/qmake.pro b/qmake/qmake.pro
-index 89d6ea5..7c605b9 100644
---- a/qmake/qmake.pro
-+++ b/qmake/qmake.pro
-@@ -8,6 +8,8 @@ CONFIG -= qt
- DEFINES += \
-     QT_BUILD_QMAKE \
-     PROEVALUATOR_FULL
-+DESTDIR = ../bin/
-+TARGET = qmake
- 
- VPATH += \
-     ../src/corelib/global \
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase_5.3.0.bb b/recipes-qt/qt5/qtbase_5.3.0.bb
deleted file mode 100644
index 95d3af7..0000000
--- a/recipes-qt/qt5/qtbase_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "4bc43a72e1b3d804171e5b52640e8d96"
-SRC_URI[sha256sum] = "07320bc8bbb718c420e22486942985c79fb2e2743981a19954aa09cc8a7147ab"
diff --git a/recipes-qt/qt5/qtbase_5.3.1.bb b/recipes-qt/qt5/qtbase_5.3.1.bb
new file mode 100644
index 0000000..dfab4a1
--- /dev/null
+++ b/recipes-qt/qt5/qtbase_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "572c9953847d391f2d33b420bbcdca46"
+SRC_URI[sha256sum] = "7b5a138d30d7c0228a51084407d5210f6d1acfbee2f95b87f189872cfcd3a569"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index e682622..b6de95f 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -5,7 +5,7 @@ SRC_URI = "\
     git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
-# common with -native and -nativesdk
+# common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\  
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
@@ -19,7 +19,7 @@ SRC_URI += "\
     file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
 "
  
-# target specific
+# specific for qtbase
 SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
diff --git a/recipes-qt/qt5/qtconnectivity_5.3.0.bb b/recipes-qt/qt5/qtconnectivity_5.3.0.bb
deleted file mode 100644
index 2fb3f09..0000000
--- a/recipes-qt/qt5/qtconnectivity_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "46e4e8df94b4da4415aa5f5076b8bc45"
-SRC_URI[sha256sum] = "d83555be4fc805afe9ef307cf8633d9c0cebc678042e384b24e0aa61d7bc1d02"
diff --git a/recipes-qt/qt5/qtconnectivity_5.3.1.bb b/recipes-qt/qt5/qtconnectivity_5.3.1.bb
new file mode 100644
index 0000000..10b2b4d
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "2693394de6dd97d3a054791cef77b928"
+SRC_URI[sha256sum] = "dc5253a62e178a0882a74dc48114c7fd2a3e8feea91df0d9670f11d16361ee67"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index 05aa364..b1e8dff 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,7 +1,7 @@
-From 64ca7961376fa896d82c2a3db2d42cbb6b68c069 Mon Sep 17 00:00:00 2001
+From c38b854abffbae52c118a361e49987a7623e231a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
-Subject: [PATCH 1/2] qmltestexample: fix link
+Subject: [PATCH] qmltestexample: fix link
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qtdeclarative/0002-Fix-improper-antialiasing-property-behavior.patch b/recipes-qt/qt5/qtdeclarative/0002-Fix-improper-antialiasing-property-behavior.patch
deleted file mode 100644
index 821149f..0000000
--- a/recipes-qt/qt5/qtdeclarative/0002-Fix-improper-antialiasing-property-behavior.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 009ad875f89d7d7bc4447e18c2fbbd485a75e0b5 Mon Sep 17 00:00:00 2001
-From: Oleg Shparber <trollixx@gmail.com>
-Date: Mon, 19 May 2014 00:53:39 -0700
-Subject: [PATCH] Fix improper antialiasing property behavior
-
-For components antialiased by default the property was returned
-as false if default true value was set to true again.
-
-Upstream-Status: Backport
-
-Task-number: QTBUG-39047
-Change-Id: I16960a12b6d38a0d9e487fc6612610c39c4949d4
-Reviewed-by: Gunnar Sletta <gunnar.sletta@jollamobile.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/quick/items/qquickitem.cpp                 | 8 +++++---
- tests/auto/quick/qquicktext/tst_qquicktext.cpp | 7 +++++++
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/src/quick/items/qquickitem.cpp b/src/quick/items/qquickitem.cpp
-index 3f0dae8..ef2eac4 100644
---- a/src/quick/items/qquickitem.cpp
-+++ b/src/quick/items/qquickitem.cpp
-@@ -5691,10 +5691,12 @@ void QQuickItem::setAntialiasing(bool aa)
- {
-     Q_D(QQuickItem);
- 
--    bool changed = (aa != antialiasing());
--    d->antialiasingValid = true;
-+    if (!d->antialiasingValid) {
-+        d->antialiasingValid = true;
-+        d->antialiasing = d->implicitAntialiasing;
-+    }
- 
--    if (!changed)
-+    if (aa == d->antialiasing)
-         return;
- 
-     d->antialiasing = aa;
-diff --git a/tests/auto/quick/qquicktext/tst_qquicktext.cpp b/tests/auto/quick/qquicktext/tst_qquicktext.cpp
-index 0b69981..d36c55d 100644
---- a/tests/auto/quick/qquicktext/tst_qquicktext.cpp
-+++ b/tests/auto/quick/qquicktext/tst_qquicktext.cpp
-@@ -1334,6 +1334,13 @@ void tst_qquicktext::antialiasing()
-     text->resetAntialiasing();
-     QCOMPARE(text->antialiasing(), true);
-     QCOMPARE(spy.count(), 2);
-+
-+    // QTBUG-39047
-+    component.setData("import QtQuick 2.0\n Text { antialiasing: true }", QUrl());
-+    object.reset(component.create());
-+    text = qobject_cast<QQuickText *>(object.data());
-+    QVERIFY(text);
-+    QCOMPARE(text->antialiasing(), true);
- }
- 
- void tst_qquicktext::weight()
--- 
-1.9.3
-
diff --git a/recipes-qt/qt5/qtdeclarative_5.3.0.bb b/recipes-qt/qt5/qtdeclarative_5.3.0.bb
deleted file mode 100644
index 7bd6bb4..0000000
--- a/recipes-qt/qt5/qtdeclarative_5.3.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI += " \
-    file://0002-Fix-improper-antialiasing-property-behavior.patch \
-"
-
-SRC_URI[md5sum] = "9e29d2b481c771ce5c798a3319835673"
-SRC_URI[sha256sum] = "fab07eb4f4b2091e1d88b27b84ac49d7e8daaa1eb72fd62e602ee9ac3ed7f42f"
diff --git a/recipes-qt/qt5/qtdeclarative_5.3.1.bb b/recipes-qt/qt5/qtdeclarative_5.3.1.bb
new file mode 100644
index 0000000..51606ce
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "765579f4f64cb64a812c8a80104eb8ec"
+SRC_URI[sha256sum] = "9a80d401dfbb64f109abf210cb32775a102f7b2420b3a3175b8dab0792220380"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb b/recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb
deleted file mode 100644
index f63e05a..0000000
--- a/recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "a4170d057978794c2c3c477e841a0e08"
-SRC_URI[sha256sum] = "3f95fb603fb3c7fbb54587b3dfe423491e058fd61af2d7371b1f12881cff20c1"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb b/recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb
new file mode 100644
index 0000000..870387c
--- /dev/null
+++ b/recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "bed5b36e721de1e356b879e5c811d799"
+SRC_URI[sha256sum] = "53d8a4846f1fefb13aba4cebf3d3f808df69ec187cc435e895eb34152c4e860f"
diff --git a/recipes-qt/qt5/qtimageformats_5.3.0.bb b/recipes-qt/qt5/qtimageformats_5.3.0.bb
deleted file mode 100644
index 509d815..0000000
--- a/recipes-qt/qt5/qtimageformats_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "90c751ffe23c005eb411d1f081bf116d"
-SRC_URI[sha256sum] = "f3b895847d27eaa98979ad146e6c0f46f38e23471a87ef496b8b777c578db2dc"
diff --git a/recipes-qt/qt5/qtimageformats_5.3.1.bb b/recipes-qt/qt5/qtimageformats_5.3.1.bb
new file mode 100644
index 0000000..608ce9a
--- /dev/null
+++ b/recipes-qt/qt5/qtimageformats_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "8bf9b65e5a586091d0ce9f9107367f4a"
+SRC_URI[sha256sum] = "62e790029ddf0c5eea7623958ef97144b3c94113cab1e9fa5fbf326625dba3bf"
diff --git a/recipes-qt/qt5/qtlocation_5.3.0.bb b/recipes-qt/qt5/qtlocation_5.3.0.bb
deleted file mode 100644
index 4af556f..0000000
--- a/recipes-qt/qt5/qtlocation_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "bfc7678bfe7d78f12fb20a54ac54e610"
-SRC_URI[sha256sum] = "ca34224a8aa5e6f81c04cbeb05ecc440b82cf27ac24f7c2b1d297a3497110414"
diff --git a/recipes-qt/qt5/qtlocation_5.3.1.bb b/recipes-qt/qt5/qtlocation_5.3.1.bb
new file mode 100644
index 0000000..babec18
--- /dev/null
+++ b/recipes-qt/qt5/qtlocation_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "697731ec5aaf482826495cd419cab4f0"
+SRC_URI[sha256sum] = "1b3f262569c329cddfd9355994a47b7f62b70f15343e1d818c706bf4473dbbf5"
diff --git a/recipes-qt/qt5/qtmultimedia_5.3.0.bb b/recipes-qt/qt5/qtmultimedia_5.3.0.bb
deleted file mode 100644
index 4d72587..0000000
--- a/recipes-qt/qt5/qtmultimedia_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "921f4596ca39b78851663369db0bbcee"
-SRC_URI[sha256sum] = "9f30b9f0f758c44db4743d2de409cfa0aef297bc6b81c929b1875dfb638d517b"
diff --git a/recipes-qt/qt5/qtmultimedia_5.3.1.bb b/recipes-qt/qt5/qtmultimedia_5.3.1.bb
new file mode 100644
index 0000000..9056dce
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "b373739f085207dda92b3399d477faf8"
+SRC_URI[sha256sum] = "c4108979f869645d91d7bcc2004b4bcfbae7332c1281ed5697a551a0d046e98c"
diff --git a/recipes-qt/qt5/qtquick1_5.3.0.bb b/recipes-qt/qt5/qtquick1_5.3.0.bb
deleted file mode 100644
index bf6e8df..0000000
--- a/recipes-qt/qt5/qtquick1_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "cd6ffd4a29f7050f71670e7afec09e5d"
-SRC_URI[sha256sum] = "74b03938df58e7825b0e46efb8266ac8d53741fff1c467b5b1fbfe2f3b840b68"
diff --git a/recipes-qt/qt5/qtquick1_5.3.1.bb b/recipes-qt/qt5/qtquick1_5.3.1.bb
new file mode 100644
index 0000000..fdb9a0e
--- /dev/null
+++ b/recipes-qt/qt5/qtquick1_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "401ebe552dc76041e2485507ecbdfc80"
+SRC_URI[sha256sum] = "44902d12a0a711e39f611db1cedff4e4144c21d9f0d6527181a132224381191f"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.3.0.bb b/recipes-qt/qt5/qtquickcontrols_5.3.0.bb
deleted file mode 100644
index 365d511..0000000
--- a/recipes-qt/qt5/qtquickcontrols_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "808b5a28f152f1af19dad30a10e5dbf1"
-SRC_URI[sha256sum] = "b8df0d64b69e765971fd6c71d8f0c4f7aabec73343a98225a4655a0b8b82df1c"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.3.1.bb b/recipes-qt/qt5/qtquickcontrols_5.3.1.bb
new file mode 100644
index 0000000..4d94305
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "90bffd1ea73d2f13322b25aa1b2d5e25"
+SRC_URI[sha256sum] = "f6936130d7d2f08062dd9b9b19dcde56511ff038e57ae813fbb0943477871c1d"
diff --git a/recipes-qt/qt5/qtscript_5.3.0.bb b/recipes-qt/qt5/qtscript_5.3.0.bb
deleted file mode 100644
index 6065e6b..0000000
--- a/recipes-qt/qt5/qtscript_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "4f755c8810946246adcfbaa74fafae62"
-SRC_URI[sha256sum] = "a86067103ffb4c307619aeaef68fbe25e7219ffd34b369e445cdd4deb4108390"
diff --git a/recipes-qt/qt5/qtscript_5.3.1.bb b/recipes-qt/qt5/qtscript_5.3.1.bb
new file mode 100644
index 0000000..4d088cb
--- /dev/null
+++ b/recipes-qt/qt5/qtscript_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "262c142aac926b492a1bf7fa3f9a96c2"
+SRC_URI[sha256sum] = "5bbfa86bf646fbc863f2a674c83b366b65301d3e1529ffe86860eb90fca13a85"
diff --git a/recipes-qt/qt5/qtsensors_5.3.0.bb b/recipes-qt/qt5/qtsensors_5.3.0.bb
deleted file mode 100644
index 03df1fc..0000000
--- a/recipes-qt/qt5/qtsensors_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "3f8c7e7ed87785d8c1fbab4fec6f458d"
-SRC_URI[sha256sum] = "dde4d55635e616406adaf8e100dc468ccdd296c6589eff1208f0dce0ffc597c1"
diff --git a/recipes-qt/qt5/qtsensors_5.3.1.bb b/recipes-qt/qt5/qtsensors_5.3.1.bb
new file mode 100644
index 0000000..a5e20d2
--- /dev/null
+++ b/recipes-qt/qt5/qtsensors_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "ce3868ac3be057ba112f4c8f6da67e94"
+SRC_URI[sha256sum] = "8f41113571ace59f88e91d74e113e24f8f934f6b571da3c976b53bd42e86c238"
diff --git a/recipes-qt/qt5/qtserialport_5.3.0.bb b/recipes-qt/qt5/qtserialport_5.3.0.bb
deleted file mode 100644
index 0df68e4..0000000
--- a/recipes-qt/qt5/qtserialport_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "393a352f82f1f0000157834751a29578"
-SRC_URI[sha256sum] = "772d230019c52452dc661e864debf1fd520460bddce8d8abda70a4dcc00e8d5f"
diff --git a/recipes-qt/qt5/qtserialport_5.3.1.bb b/recipes-qt/qt5/qtserialport_5.3.1.bb
new file mode 100644
index 0000000..b7db9a0
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "d9557391a3ab696089d657cb3a2b608e"
+SRC_URI[sha256sum] = "83dc0b1152043d4e04e6135ea65accc749424b498ee018de9b390d712ccbc065"
diff --git a/recipes-qt/qt5/qtsvg_5.3.0.bb b/recipes-qt/qt5/qtsvg_5.3.0.bb
deleted file mode 100644
index 77b591b..0000000
--- a/recipes-qt/qt5/qtsvg_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "a35e2df8ff2d6b99e4b33443165359f4"
-SRC_URI[sha256sum] = "8006ca1cb13844772ac2926e662ab7a0eb16cb26157954cd415e0f6d641b4ed0"
diff --git a/recipes-qt/qt5/qtsvg_5.3.1.bb b/recipes-qt/qt5/qtsvg_5.3.1.bb
new file mode 100644
index 0000000..5a7512f
--- /dev/null
+++ b/recipes-qt/qt5/qtsvg_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "1a54f0495ad7239038f57d8a2715203c"
+SRC_URI[sha256sum] = "c2daa131cd41f230d5903e1b754249ed16609df98a08e70b62b5610c4a3a1774"
diff --git a/recipes-qt/qt5/qttools-native_5.3.0.bb b/recipes-qt/qt5/qttools-native_5.3.0.bb
deleted file mode 100644
index d3956a7..0000000
--- a/recipes-qt/qt5/qttools-native_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "628a91ddfe34efc6622fdba8c6348855"
-SRC_URI[sha256sum] = "f64d2ca5dc59ab8980987649bcef4597a7c0194e802e64d93448cac892fd8250"
diff --git a/recipes-qt/qt5/qttools-native_5.3.1.bb b/recipes-qt/qt5/qttools-native_5.3.1.bb
new file mode 100644
index 0000000..cce0210
--- /dev/null
+++ b/recipes-qt/qt5/qttools-native_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "7264920fc489ac878d40218263df8c4e"
+SRC_URI[sha256sum] = "edf59eeead3c1d202883c2e6091abd1d40ac37b6e6b0e240b29ab75f86c515a7"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 0479bec..e668edd 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,7 +1,7 @@
-From 5eb3dd427bca8bbc13b7554e8e21993b2fc708e7 Mon Sep 17 00:00:00 2001
+From f4eb217f9b706a13e7f8256b8540970cfc78d805 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
-Subject: [PATCH 1/2] Allow to build only lrelease + lupdate + lconvert
+Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
 
 This is useful e.g. when cross compiling with OpenEmbedded where qtbase-native
 is built without GUI support (no-png is set) and we still want to build
@@ -9,7 +9,7 @@ native lrelease + lupdate + lconvert tools.
 
 Upstream-Status: Pending
 
-Signed-off-by: Martin Jansa <Martin.jansa@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  examples/examples.pro     |  4 ++--
  src/designer/src/src.pro  | 16 +++++++++-------
@@ -74,7 +74,7 @@ index 3a70580..a977878 100644
  qtNomakeTools( \
      linguist \
 diff --git a/src/src.pro b/src/src.pro
-index a07a3bb..4c6b463 100644
+index a486d65..3aeac1e 100644
 --- a/src/src.pro
 +++ b/src/src.pro
 @@ -4,10 +4,12 @@ qtHaveModule(widgets) {
@@ -98,11 +98,11 @@ index a07a3bb..4c6b463 100644
  
  SUBDIRS += linguist
 -if(!android|android_app):!ios: SUBDIRS += qtpaths
-+!linguistonly:if(!android|android_app):!ios: SUBDIRS += qtpaths
++if(!android|android_app):!linguistonly:!ios: SUBDIRS += qtpaths
  
  mac {
      SUBDIRS += macdeployqt
-@@ -25,7 +27,7 @@ android {
+@@ -25,11 +27,11 @@ android {
      SUBDIRS += androiddeployqt
  }
  
@@ -111,12 +111,11 @@ index a07a3bb..4c6b463 100644
  
  win32|winrt:SUBDIRS += windeployqt
  winrt:SUBDIRS += winrtrunner qtd3dservice
-@@ -36,4 +38,4 @@ qtNomakeTools( \
-     macdeployqt \
- )
+-qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
++!linguistonly:qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
  
--!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
-+!linguistonly:!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
+ qtNomakeTools( \
+     pixeltool \
 diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
 index c3acfe3..f2f88f7 100644
 --- a/tests/auto/auto.pro
@@ -151,5 +150,5 @@ index c3acfe3..f2f88f7 100644
  installed_cmake.depends = cmake
  
 -- 
-1.9.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 3e4cf4e..042605c 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,7 +1,7 @@
-From 6837c212d388a3b679b7420c5f1c98ef85d04a39 Mon Sep 17 00:00:00 2001
+From 2b9829a4aa1379a69343371991a81b3769ac7dec Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
-Subject: [PATCH 2/2] assistant/help: fix linking of dependent libraries
+Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -18,15 +18,15 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
-index ed75c37..a2c55c7 100644
+index 168d23d..a9c3b59 100644
 --- a/src/assistant/help/help.pro
 +++ b/src/assistant/help/help.pro
-@@ -70,3 +70,5 @@ HEADERS += qhelpenginecore.h \
+@@ -59,3 +59,5 @@ HEADERS += qhelpenginecore.h \
  # access to clucene
  HEADERS += qhelpsearchindexwriter_clucene_p.h \
      qhelpsearchindexreader_clucene_p.h
 +
 +LIBS += -lQt5CLucene
 -- 
-1.8.5.3
+2.0.0
 
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 3238d79..956bff2 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,7 +1,7 @@
-From e6b77a5732610816948a8a860a9cb9e92b02c33e Mon Sep 17 00:00:00 2001
+From d59c24913f7edb0809ed32cf6dfeea874860d783 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
-Subject: [PATCH] add noqtwebkit configuration
+Subject: [PATCH 3/3] add noqtwebkit configuration
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -15,7 +15,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
-index 5f96377..e461d4b 100644
+index 5f96377..e2dfa61 100644
 --- a/src/assistant/assistant/assistant.pro
 +++ b/src/assistant/assistant/assistant.pro
 @@ -1,4 +1,4 @@
@@ -25,16 +25,17 @@ index 5f96377..e461d4b 100644
  } else {
      DEFINES += QT_NO_WEBKIT
 diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
-index b7ee661..0c6e50a 100644
+index 500a153..12a6127 100644
 --- a/src/designer/src/plugins/plugins.pro
 +++ b/src/designer/src/plugins/plugins.pro
-@@ -1,5 +1,5 @@
+@@ -1,6 +1,6 @@
  TEMPLATE = subdirs
  
  # qtHaveModule(opengl): SUBDIRS += tools/view3d
 -qtHaveModule(webkitwidgets): SUBDIRS += qwebview
 +qtHaveModule(webkitwidgets):!contains(QT_CONFIG, noqtwebkit): SUBDIRS += qwebview
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
+ qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-1.8.3.1
+2.0.0
 
diff --git a/recipes-qt/qt5/qttools_5.3.0.bb b/recipes-qt/qt5/qttools_5.3.0.bb
deleted file mode 100644
index d3956a7..0000000
--- a/recipes-qt/qt5/qttools_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "628a91ddfe34efc6622fdba8c6348855"
-SRC_URI[sha256sum] = "f64d2ca5dc59ab8980987649bcef4597a7c0194e802e64d93448cac892fd8250"
diff --git a/recipes-qt/qt5/qttools_5.3.1.bb b/recipes-qt/qt5/qttools_5.3.1.bb
new file mode 100644
index 0000000..cce0210
--- /dev/null
+++ b/recipes-qt/qt5/qttools_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "7264920fc489ac878d40218263df8c4e"
+SRC_URI[sha256sum] = "edf59eeead3c1d202883c2e6091abd1d40ac37b6e6b0e240b29ab75f86c515a7"
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.3.0.bb b/recipes-qt/qt5/qtwebkit-examples_5.3.0.bb
deleted file mode 100644
index d1400fd..0000000
--- a/recipes-qt/qt5/qtwebkit-examples_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "4ab24c0bf04f21207a48f261ce0d7943"
-SRC_URI[sha256sum] = "7e491050000c9608bf36f78bb3db5938b92e0dce89d686d903c85dc8fdadef38"
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.3.1.bb b/recipes-qt/qt5/qtwebkit-examples_5.3.1.bb
new file mode 100644
index 0000000..a25d285
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-examples_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "5827c61adba1d6921c51ef7ba1adce68"
+SRC_URI[sha256sum] = "8d4b5845b0fd99511ea7e7901d46ba8d50dc1f19cbce4496f279677e7ac45aca"
diff --git a/recipes-qt/qt5/qtwebkit_5.3.0.bb b/recipes-qt/qt5/qtwebkit_5.3.0.bb
deleted file mode 100644
index 6e4b001..0000000
--- a/recipes-qt/qt5/qtwebkit_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "cc9197eaef9e7950e907635f9bde1e98"
-SRC_URI[sha256sum] = "ceb1aeeede1febddbc10c5c23e6bcb18a90a5eb4d162d6f0b5075ff4ff3ba335"
diff --git a/recipes-qt/qt5/qtwebkit_5.3.1.bb b/recipes-qt/qt5/qtwebkit_5.3.1.bb
new file mode 100644
index 0000000..a622ef3
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "0f2bb8af6be2306b2b4d194a7ebf6fcc"
+SRC_URI[sha256sum] = "69a47c5645918fc27bff630275685f300e42b4dfd99ccd3e5aa1c8a6d0725156"
diff --git a/recipes-qt/qt5/qtwebsockets_5.3.0.bb b/recipes-qt/qt5/qtwebsockets_5.3.0.bb
deleted file mode 100644
index 2437060..0000000
--- a/recipes-qt/qt5/qtwebsockets_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "0ced83d5555e969f05e1ea89607ad584"
-SRC_URI[sha256sum] = "715f2e5196a29176bdb9980bf99334e5c8aefe5f4aac961d7de3c53b0a432ce6"
diff --git a/recipes-qt/qt5/qtwebsockets_5.3.1.bb b/recipes-qt/qt5/qtwebsockets_5.3.1.bb
new file mode 100644
index 0000000..95ad22d
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "275078e21f8d84c29e0cce6fd58ae28c"
+SRC_URI[sha256sum] = "5b68ce55bab94d0d9dfa86ef7a2c3f402e931cc12fd028766f531148b9e31ddc"
diff --git a/recipes-qt/qt5/qtx11extras_5.3.0.bb b/recipes-qt/qt5/qtx11extras_5.3.0.bb
deleted file mode 100644
index 61b5814..0000000
--- a/recipes-qt/qt5/qtx11extras_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "83fc516c7f6ab82599b3f6e46744cb85"
-SRC_URI[sha256sum] = "92d1c051294d92a250a405c120673721865b37d8f5db4eaac4b3f7fe46707719"
diff --git a/recipes-qt/qt5/qtx11extras_5.3.1.bb b/recipes-qt/qt5/qtx11extras_5.3.1.bb
new file mode 100644
index 0000000..071ac6d
--- /dev/null
+++ b/recipes-qt/qt5/qtx11extras_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "184cdea8945a6d62131fae75c673225d"
+SRC_URI[sha256sum] = "25fa2801367c050ac19ad3b6f92d38890314c9cbf2d833b1571e1a7ea22b4f71"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.3.0.bb b/recipes-qt/qt5/qtxmlpatterns_5.3.0.bb
deleted file mode 100644
index 754350f..0000000
--- a/recipes-qt/qt5/qtxmlpatterns_5.3.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "68c6e1311ecf8727368961739243d3b2"
-SRC_URI[sha256sum] = "ac66c182f28a3909dc939a111d2bf701056f6c68cecde54074c9c34637cdc988"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.3.1.bb b/recipes-qt/qt5/qtxmlpatterns_5.3.1.bb
new file mode 100644
index 0000000..8242d0f
--- /dev/null
+++ b/recipes-qt/qt5/qtxmlpatterns_5.3.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "d263163cc6e9ba7a4e8bd6c558f3ae42"
+SRC_URI[sha256sum] = "c597ed383d1d433960ffeb4a3784979235a399e62b27b60b5d67aa2c9aa8653f"
-- 
2.0.0


