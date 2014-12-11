Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 164B3601F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 12:23:32 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so14395577wiv.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 04:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=n24YMl2Z14Gt+YynLwwWcbvCMw2PxzdeNTZJuawknCU=;
	b=tVUQM8eqTSLvVEGjZHwKcweS85OjYZIKipwmUb5zbMXUfim+B0vFl3at7OkbEjOK/3
	Qy9VCcicNao5YdMIfsNz0E8dPY/G/jJpQE+DFZ1u5Swkd7MZF7AgdNnSm/IWxFy3J4xc
	f27YFgiSVrUs3aH00WuFI/Uuv3wzU3TwThEVPtdMZYat68UdG/XzVKLomwv0iB1rSpYY
	SpIQVumrO2i4cuJA7cI54lXTvn2fyLjimoHd1Ft2bH3fPPz8AKD/BwZYItpnl5rJAyfR
	6mMExzx4s4lySRuulqcdjd5O9CIWjjNWmmdrQaunji6TDD7dPq0Ej2T8T5K6kb0Dgft0
	yVrg==
X-Received: by 10.180.85.34 with SMTP id e2mr15784370wiz.0.1418300612775;
	Thu, 11 Dec 2014 04:23:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h14sm2134726wic.8.2014.12.11.04.23.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 04:23:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2014 13:23:30 +0100
Message-Id: <1418300612-1383-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/3] recipes: upgrade from 5.3.2 to 5.4.0
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
X-List-Received-Date: Thu, 11 Dec 2014 12:23:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonathan Liu <net147@gmail.com>

MJ: nativesdk-qtbase, nativesdk-qttools, qtbase-native: Drop unnecessary LICENSE/LIC_FILES_CHKSUM
MJ: qtwebkit: move leveldb dependency to .inc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 conf/distro/include/qt5-versions.inc               |   4 +-
 recipes-qt/qt5/nativesdk-qtbase.inc                |   7 +-
 recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb           |   5 -
 recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb           |   5 +
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   6 -
 recipes-qt/qt5/nativesdk-qttools.inc               |   6 -
 recipes-qt/qt5/nativesdk-qttools_5.3.2.bb          |   5 -
 recipes-qt/qt5/nativesdk-qttools_5.4.0.bb          |   5 +
 recipes-qt/qt5/nativesdk-qttools_git.bb            |   5 -
 recipes-qt/qt5/{qt5-5.3.2.inc => qt5-5.4.0.inc}    |   8 +-
 recipes-qt/qt5/qtbase-native.inc                   |   5 +-
 ...base-native_5.3.2.bb => qtbase-native_5.4.0.bb} |   4 +-
 recipes-qt/qt5/qtbase-native_git.bb                |   6 -
 recipes-qt/qt5/qtbase.inc                          |   5 +-
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  28 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  10 +-
 .../0003-Add-external-hostbindir-option.patch      |  50 ++--
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  10 +-
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  12 +-
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |  67 ++++-
 ...mintegration-Undefine-CursorShape-from-X..patch |  12 +-
 ...ump-path-length-from-256-to-512-character.patch |  10 +-
 ...gl-error-for-platforms-only-supporting-on.patch |  16 +-
 ...0010-QOpenGLPaintDevice-sub-area-support.patch} |  63 ++--
 ...10-Revert-Use-the-gcc-feature-in-simd.prf.patch |  26 --
 ...build-uic.patch => 0011-Always-build-uic.patch} |  10 +-
 ...build-it-in-configure-but-allow-to-build.patch} |  10 +-
 ...eserve-built-qmake-and-swap-with-native-.patch} |  10 +-
 recipes-qt/qt5/qtbase_5.3.2.bb                     |   5 -
 recipes-qt/qt5/qtbase_5.4.0.bb                     |   5 +
 recipes-qt/qt5/qtbase_git.bb                       |   6 -
 recipes-qt/qt5/qtconnectivity.inc                  |   3 +
 recipes-qt/qt5/qtconnectivity_5.3.2.bb             |  11 -
 recipes-qt/qt5/qtconnectivity_5.4.0.bb             |   5 +
 recipes-qt/qt5/qtconnectivity_git.bb               |   3 -
 recipes-qt/qt5/qtdeclarative.inc                   |   3 +
 recipes-qt/qt5/qtdeclarative_5.3.2.bb              |  11 -
 recipes-qt/qt5/qtdeclarative_5.4.0.bb              |   5 +
 recipes-qt/qt5/qtdeclarative_git.bb                |   3 -
 recipes-qt/qt5/qtenginio.inc                       |   4 +-
 recipes-qt/qt5/qtenginio_5.3.2.bb                  |   5 -
 recipes-qt/qt5/qtenginio_5.4.0.bb                  |   5 +
 recipes-qt/qt5/qtenginio_git.bb                    |   4 -
 recipes-qt/qt5/qtgraphicaleffects.inc              |   3 +
 recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb         |  11 -
 recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb         |   5 +
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |   3 -
 recipes-qt/qt5/qtimageformats.inc                  |   3 +
 recipes-qt/qt5/qtimageformats_5.3.2.bb             |  11 -
 recipes-qt/qt5/qtimageformats_5.4.0.bb             |   5 +
 recipes-qt/qt5/qtimageformats_git.bb               |   3 -
 recipes-qt/qt5/qtlocation.inc                      |   3 +
 recipes-qt/qt5/qtlocation_5.3.2.bb                 |  11 -
 recipes-qt/qt5/qtlocation_5.4.0.bb                 |   5 +
 recipes-qt/qt5/qtlocation_git.bb                   |   3 -
 recipes-qt/qt5/qtmultimedia.inc                    |   3 +
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 316 ++++++++++-----------
 ...a.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch |   4 +-
 recipes-qt/qt5/qtmultimedia_5.3.2.bb               |  11 -
 recipes-qt/qt5/qtmultimedia_5.4.0.bb               |   5 +
 recipes-qt/qt5/qtmultimedia_git.bb                 |   3 -
 recipes-qt/qt5/qtquick1.inc                        |   3 +
 recipes-qt/qt5/qtquick1_5.3.2.bb                   |  11 -
 recipes-qt/qt5/qtquick1_5.4.0.bb                   |   5 +
 recipes-qt/qt5/qtquick1_git.bb                     |   3 -
 recipes-qt/qt5/qtquickcontrols.inc                 |   3 +
 recipes-qt/qt5/qtquickcontrols_5.3.2.bb            |  11 -
 recipes-qt/qt5/qtquickcontrols_5.4.0.bb            |   5 +
 recipes-qt/qt5/qtquickcontrols_git.bb              |   3 -
 recipes-qt/qt5/qtscript.inc                        |   3 +
 recipes-qt/qt5/qtscript_5.3.2.bb                   |  11 -
 recipes-qt/qt5/qtscript_5.4.0.bb                   |   5 +
 recipes-qt/qt5/qtscript_git.bb                     |   3 -
 recipes-qt/qt5/qtsensors.inc                       |   3 +
 recipes-qt/qt5/qtsensors_5.3.2.bb                  |  11 -
 recipes-qt/qt5/qtsensors_5.4.0.bb                  |   5 +
 recipes-qt/qt5/qtsensors_git.bb                    |   3 -
 recipes-qt/qt5/qtserialport.inc                    |  14 +-
 recipes-qt/qt5/qtserialport_5.3.2.bb               |   5 -
 recipes-qt/qt5/qtserialport_5.4.0.bb               |   5 +
 recipes-qt/qt5/qtserialport_git.bb                 |   8 -
 recipes-qt/qt5/qtsvg.inc                           |   3 +
 recipes-qt/qt5/qtsvg_5.3.2.bb                      |  11 -
 recipes-qt/qt5/qtsvg_5.4.0.bb                      |   5 +
 recipes-qt/qt5/qtsvg_git.bb                        |   3 -
 recipes-qt/qt5/qtsystems.inc                       |   8 +-
 recipes-qt/qt5/qtsystems_5.3.2+git.bb              |  20 --
 recipes-qt/qt5/qtsystems_5.4.0+git.bb              |  14 +
 recipes-qt/qt5/qtsystems_git.bb                    |   5 -
 recipes-qt/qt5/qttools-native.inc                  |   6 -
 recipes-qt/qt5/qttools-native_5.3.2.bb             |   5 -
 .../{qttools_5.3.2.bb => qttools-native_5.4.0.bb}  |   0
 recipes-qt/qt5/qttools-native_git.bb               |   5 -
 recipes-qt/qt5/qttools.inc                         |   6 -
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  21 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |   4 +-
 .../0003-add-noqtwebkit-configuration.patch        |   4 +-
 recipes-qt/qt5/qttools_5.4.0.bb                    |   5 +
 recipes-qt/qt5/qttools_git.bb                      |   5 -
 recipes-qt/qt5/qtwayland-native.inc                |   5 +-
 recipes-qt/qt5/qtwayland-native_5.3.2+git.bb       |   9 -
 recipes-qt/qt5/qtwayland-native_5.4.0.bb           |   2 +
 recipes-qt/qt5/qtwayland.inc                       |   2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |   4 +-
 ...land-include-server-buffer-only-when-bui.patch} |  18 +-
 .../{qtwayland_5.3.2+git.bb => qtwayland_5.4.0.bb} |  15 +-
 recipes-qt/qt5/qtwebengine.inc                     |  10 +-
 ...upplied-by-environment-variable-NINJA_PAT.patch |  36 ---
 ...op-build-time-only-dependency-on-x11-libr.patch | 139 ---------
 ...f-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch} |  12 +-
 ...rip-unwanted-echo-compiling-prefix-from-C.patch |  40 ---
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  29 ++
 ...nclude-atomicops_internals_x86_gcc.cc-whe.patch |  27 --
 ...0003-functions.prf-Try-to-add-_moc-suffix.patch |  34 ---
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  29 ++
 ...e-to-empty-string-if-mtune-flag-is-not-se.patch |  34 ---
 ...ix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch |  30 --
 ...QMAKE_CC-when-extracting-C-compiler-flags.patch |  34 ---
 recipes-qt/qt5/qtwebengine_5.3.2+git.bb            |  28 --
 recipes-qt/qt5/qtwebengine_5.4.0.bb                |  11 +
 recipes-qt/qt5/qtwebengine_git.bb                  |   7 +-
 recipes-qt/qt5/qtwebkit-examples.inc               |   5 +-
 recipes-qt/qt5/qtwebkit-examples_5.3.2.bb          |   5 -
 recipes-qt/qt5/qtwebkit-examples_5.4.0.bb          |   5 +
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   3 -
 recipes-qt/qt5/qtwebkit.inc                        |   7 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  10 +-
 recipes-qt/qt5/qtwebkit_5.3.2.bb                   |   5 -
 recipes-qt/qt5/qtwebkit_5.4.0.bb                   |   5 +
 recipes-qt/qt5/qtwebkit_git.bb                     |   5 -
 recipes-qt/qt5/qtwebsockets.inc                    |   5 +-
 recipes-qt/qt5/qtwebsockets_5.3.2.bb               |   5 -
 recipes-qt/qt5/qtwebsockets_5.4.0.bb               |   5 +
 recipes-qt/qt5/qtwebsockets_git.bb                 |   3 -
 recipes-qt/qt5/qtx11extras.inc                     |   7 +-
 recipes-qt/qt5/qtx11extras_5.3.2.bb                |   5 -
 recipes-qt/qt5/qtx11extras_5.4.0.bb                |   5 +
 recipes-qt/qt5/qtx11extras_git.bb                  |   3 -
 recipes-qt/qt5/qtxmlpatterns.inc                   |   3 +
 recipes-qt/qt5/qtxmlpatterns_5.3.2.bb              |  11 -
 recipes-qt/qt5/qtxmlpatterns_5.4.0.bb              |   5 +
 recipes-qt/qt5/qtxmlpatterns_git.bb                |   3 -
 142 files changed, 658 insertions(+), 1153 deletions(-)
 delete mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.4.0.bb
 rename recipes-qt/qt5/{qt5-5.3.2.inc => qt5-5.4.0.inc} (70%)
 rename recipes-qt/qt5/{qtbase-native_5.3.2.bb => qtbase-native_5.4.0.bb} (63%)
 rename recipes-qt/qt5/qtbase/{0011-QOpenGLPaintDevice-sub-area-support.patch => 0010-QOpenGLPaintDevice-sub-area-support.patch} (78%)
 delete mode 100644 recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
 rename recipes-qt/qt5/qtbase/{0012-Always-build-uic.patch => 0011-Always-build-uic.patch} (77%)
 rename recipes-qt/qt5/qtbase/{0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch => 0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch} (84%)
 rename recipes-qt/qt5/qtbase/{0013-configure-preserve-built-qmake-and-swap-with-native-.patch => 0012-configure-preserve-built-qmake-and-swap-with-native-.patch} (74%)
 delete mode 100644 recipes-qt/qt5/qtbase_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtbase_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtconnectivity_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtconnectivity_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtdeclarative_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtdeclarative_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtenginio_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtenginio_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtimageformats_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtimageformats_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtlocation_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtlocation_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtmultimedia_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtmultimedia_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtquick1_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtquick1_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtquickcontrols_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtquickcontrols_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtscript_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtscript_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtsensors_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtsensors_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtserialport_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtserialport_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtsvg_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtsvg_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtsystems_5.3.2+git.bb
 create mode 100644 recipes-qt/qt5/qtsystems_5.4.0+git.bb
 delete mode 100644 recipes-qt/qt5/qttools-native_5.3.2.bb
 rename recipes-qt/qt5/{qttools_5.3.2.bb => qttools-native_5.4.0.bb} (100%)
 create mode 100644 recipes-qt/qt5/qttools_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtwayland-native_5.3.2+git.bb
 create mode 100644 recipes-qt/qt5/qtwayland-native_5.4.0.bb
 rename recipes-qt/qt5/qtwayland/{0001-examples.pro-include-server-buffer-only-when-buildin.patch => 0001-examples-wayland-include-server-buffer-only-when-bui.patch} (62%)
 rename recipes-qt/qt5/{qtwayland_5.3.2+git.bb => qtwayland_5.4.0.bb} (57%)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch
 rename recipes-qt/qt5/qtwebengine/{0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch => 0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch} (80%)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine_5.3.2+git.bb
 create mode 100644 recipes-qt/qt5/qtwebengine_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtwebkit-examples_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtwebkit_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtwebkit_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtwebsockets_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtwebsockets_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtx11extras_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtx11extras_5.4.0.bb
 delete mode 100644 recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
 create mode 100644 recipes-qt/qt5/qtxmlpatterns_5.4.0.bb

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index 3048e15..9acde7f 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,7 +1,7 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.3.2", "5.3.99+5.4.0-rc1+git%"
+# possible values now "5.4.0", "5.3.99+5.4.0-rc1+git%"
 
-QT5_VERSION ?= "5.3.2"
+QT5_VERSION ?= "5.4.0"
 
 PREFERRED_VERSION_qtbase-native = "${QT5_VERSION}"
 PREFERRED_VERSION_qtbase = "${QT5_VERSION}"
diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 06fb049..aec6ef8 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -21,18 +21,17 @@ SRC_URI += "\
     file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0008-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
-    file://0011-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0010-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0012-Always-build-uic.patch \
+    file://0011-Always-build-uic.patch \
 "
 
 # specific for nativesdk-qtbase
 SRC_URI += " \
-    file://0013-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb b/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
deleted file mode 100644
index 49b9072..0000000
--- a/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "563e2b10274171f1184b3fd7260b4991"
-SRC_URI[sha256sum] = "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb b/recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb
new file mode 100644
index 0000000..7414abd
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "eaaa72a5cb25713ca8d17f3a8d149765"
+SRC_URI[sha256sum] = "daea240ba5e77bc2d78ec21a2cb664eed83b3d4ad409b6277a6f7d4c0c8e91d1"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index b9dfdfb..728cefc 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -38,9 +38,3 @@ SRC_URI += " \
 "
 
 SRCREV = "cc23ebace8b7f343aca6e10f9ebd31b87c17c782"
-
-LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/nativesdk-qttools.inc b/recipes-qt/qt5/nativesdk-qttools.inc
index 6b8ba54..c67f9cd 100644
--- a/recipes-qt/qt5/nativesdk-qttools.inc
+++ b/recipes-qt/qt5/nativesdk-qttools.inc
@@ -9,12 +9,6 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qttools:"
 
 SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
 
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
-
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
 FILES_${PN}-dbg = " \
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb b/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
deleted file mode 100644
index 3efed85..0000000
--- a/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
-SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.4.0.bb b/recipes-qt/qt5/nativesdk-qttools_5.4.0.bb
new file mode 100644
index 0000000..f9384e9
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "3de5923257b365526856094d7da0ad85"
+SRC_URI[sha256sum] = "5a85a096ffd30463781dc3871ad9640a510eba0086188c7943d23adc3660741a"
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index 7107d5b..13305d1 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -5,8 +5,3 @@ require ${PN}.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
 SRCREV = "f3abe81d510bef5b984544a6d58551ce04cb8b48"
-
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qt5-5.3.2.inc b/recipes-qt/qt5/qt5-5.4.0.inc
similarity index 70%
rename from recipes-qt/qt5/qt5-5.3.2.inc
rename to recipes-qt/qt5/qt5-5.4.0.inc
index 21c1a22..7320bd9 100644
--- a/recipes-qt/qt5/qt5-5.3.2.inc
+++ b/recipes-qt/qt5/qt5-5.4.0.inc
@@ -4,7 +4,7 @@
 QT_VERSION ?= "${PV}"
 
 # it's different for RC versions
-QT_VERSION_DIR ?= "5.3"
+QT_VERSION_DIR ?= "5.4"
 
 SRC_URI += " \
     http://download.qt-project.org/official_releases/qt/${QT_VERSION_DIR}/${QT_VERSION}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
@@ -12,8 +12,8 @@ SRC_URI += " \
 
 S = "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
 
-LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=2abca611d56c23eb99943bde21c80a0d \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
                     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index 3ba7f8e..4023844 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -18,13 +18,12 @@ SRC_URI += "\
     file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0008-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
-    file://0011-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0010-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0012-Always-build-uic.patch \
+    file://0011-Always-build-uic.patch \
 "
 
 QT_CONF_PATH = "${B}/qt.conf"
diff --git a/recipes-qt/qt5/qtbase-native_5.3.2.bb b/recipes-qt/qt5/qtbase-native_5.4.0.bb
similarity index 63%
rename from recipes-qt/qt5/qtbase-native_5.3.2.bb
rename to recipes-qt/qt5/qtbase-native_5.4.0.bb
index 44dd984..26673ae 100644
--- a/recipes-qt/qt5/qtbase-native_5.3.2.bb
+++ b/recipes-qt/qt5/qtbase-native_5.4.0.bb
@@ -7,5 +7,5 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRC_URI[md5sum] = "563e2b10274171f1184b3fd7260b4991"
-SRC_URI[sha256sum] = "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8"
+SRC_URI[md5sum] = "eaaa72a5cb25713ca8d17f3a8d149765"
+SRC_URI[sha256sum] = "daea240ba5e77bc2d78ec21a2cb664eed83b3d4ad409b6277a6f7d4c0c8e91d1"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 9d7baed..dc10d0d 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -31,9 +31,3 @@ do_install_append() {
 }
 
 SRCREV = "cc23ebace8b7f343aca6e10f9ebd31b87c17c782"
-
-LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 17fc098..4c7e86c 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -11,13 +11,12 @@ SRC_URI += "\
     file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0008-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
-    file://0011-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0010-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # specific for qtbase
 SRC_URI += "\
-    file://0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 64829fa..081bcac 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 9816098355731afb60cd41d334be97d07f0dcc42 Mon Sep 17 00:00:00 2001
+From 81cd2947e9b1290498bdc2505a76fb053ff33be8 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/13] Add linux-oe-g++ platform
+Subject: [PATCH 01/11] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -51,10 +51,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index cb8d78f..3f7b41b 100755
+index 229fb4e..b7a6fe3 100755
 --- a/configure
 +++ b/configure
-@@ -324,6 +324,16 @@ getQMakeConf()
+@@ -316,6 +316,16 @@ getQMakeConf()
      getSingleQMakeVariable "$1" "$specvals"
  }
  
@@ -71,7 +71,7 @@ index cb8d78f..3f7b41b 100755
  getXQMakeConf()
  {
      if [ -z "$xspecvals" ]; then
-@@ -333,6 +343,16 @@ getXQMakeConf()
+@@ -325,6 +335,16 @@ getXQMakeConf()
      getSingleQMakeVariable "$1" "$xspecvals"
  }
  
@@ -88,7 +88,7 @@ index cb8d78f..3f7b41b 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -548,21 +568,19 @@ fi
+@@ -541,21 +561,19 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
@@ -118,7 +118,7 @@ index cb8d78f..3f7b41b 100755
  # Use CC/CXX to run config.tests
  mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
-@@ -3140,7 +3158,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3173,7 +3191,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -127,7 +127,7 @@ index cb8d78f..3f7b41b 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3175,7 +3193,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3211,7 +3229,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -136,7 +136,7 @@ index cb8d78f..3f7b41b 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3633,6 +3651,14 @@ setBootstrapVariable()
+@@ -3682,6 +3700,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -151,7 +151,7 @@ index cb8d78f..3f7b41b 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3671,14 +3697,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3720,14 +3746,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -175,10 +175,10 @@ index cb8d78f..3f7b41b 100755
          if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index fe41c54..e2db923 100644
+index 6b37a04..dcf6025 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -60,12 +60,12 @@ defineTest(qtCompileTest) {
+@@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
@@ -187,7 +187,7 @@ index fe41c54..e2db923 100644
  
      mkpath($$test_out_dir)|error("Aborting.")
  
-     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) $$qmake_configs $$shell_quote($$test_dir)") {
+     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) -spec $$QMAKESPEC $$qmake_configs $$shell_quote($$test_dir)") {
 -        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
 +        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
              log("yes$$escape_expand(\\n)")
@@ -346,5 +346,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 669ebb2..bae0dd3 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
-From 2749053c1a0670fea50f2f716fea0839fbbbb007 Mon Sep 17 00:00:00 2001
+From aae38b0ff226f287ad40f6eb423f1b974f548b73 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/13] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 02/11] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 174c1d0..69e614f 100644
+index 7ca0aa7..d68c51b 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -153,7 +153,10 @@ QLibrarySettings::QLibrarySettings()
+@@ -139,7 +139,10 @@ QLibrarySettings::QLibrarySettings()
  
  QSettings *QLibraryInfoPrivate::findConfiguration()
  {
@@ -35,5 +35,5 @@ index 174c1d0..69e614f 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 01d1e45..c633ea7 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From e263260c50051327e3f7f2ca8c46e014228e0078 Mon Sep 17 00:00:00 2001
+From f2d51e50a7fbdf485696d1b8b2d29e64c729c76b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/13] Add -external-hostbindir option
+Subject: [PATCH 03/11] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -28,20 +28,20 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  mkspecs/features/qt_functions.prf           |  6 +++++-
  mkspecs/features/qt_tool.prf                |  4 ++--
  qmake/property.cpp                          |  1 +
- qtbase.pro                                  | 14 +++++++++++---
+ qtbase.pro                                  | 13 ++++++++++---
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
  src/corelib/global/qlibraryinfo.cpp         |  3 ++-
  src/corelib/global/qlibraryinfo.h           |  1 +
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
  tools/configure/configureapp.cpp            |  8 ++++++++
- 11 files changed, 51 insertions(+), 13 deletions(-)
+ 11 files changed, 50 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
-index 3f7b41b..18d1a0b 100755
+index b7a6fe3..d715f6c 100755
 --- a/configure
 +++ b/configure
-@@ -777,6 +777,7 @@ QT_HOST_BINS=
+@@ -769,6 +769,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -49,7 +49,7 @@ index 3f7b41b..18d1a0b 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -896,6 +897,7 @@ while [ "$#" -gt 0 ]; do
+@@ -888,6 +889,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -57,7 +57,7 @@ index 3f7b41b..18d1a0b 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1110,6 +1112,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1102,6 +1104,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -67,7 +67,7 @@ index 3f7b41b..18d1a0b 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2248,6 +2253,10 @@ Installation options:
+@@ -2265,6 +2270,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -78,7 +78,7 @@ index 3f7b41b..18d1a0b 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2915,6 +2924,11 @@ fi
+@@ -2944,6 +2953,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,7 +90,7 @@ index 3f7b41b..18d1a0b 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3595,6 +3609,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3644,6 +3658,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -99,10 +99,10 @@ index 3f7b41b..18d1a0b 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 9a4d80e..dfc1cff 100644
+index a9a622d..b6f1db0 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -193,7 +193,11 @@ defineTest(qtAddRpathLink) {
+@@ -191,7 +191,11 @@ defineTest(qtAddRpathLink) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
@@ -134,10 +134,10 @@ index 1d3e88c..9b26adf 100644
  
      !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
 diff --git a/qmake/property.cpp b/qmake/property.cpp
-index e50485c..71291ad 100644
+index 051e056..50da6ed 100644
 --- a/qmake/property.cpp
 +++ b/qmake/property.cpp
-@@ -75,6 +75,7 @@ static const struct {
+@@ -67,6 +67,7 @@ static const struct {
      { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
      { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
      { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
@@ -146,7 +146,7 @@ index e50485c..71291ad 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/qtbase.pro b/qtbase.pro
-index d6861cf..7fb58a3 100644
+index 6d0de44..ddf7478 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
 @@ -69,18 +69,25 @@ CONFIG -= qt
@@ -210,10 +210,10 @@ index 9bda70e..6e3605a 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 69e614f..a95ca35 100644
+index d68c51b..7191159 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -336,7 +336,7 @@ QLibraryInfo::isDebugBuild()
+@@ -349,7 +349,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -222,7 +222,7 @@ index 69e614f..a95ca35 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -362,6 +362,7 @@ static const struct {
+@@ -375,6 +375,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -231,10 +231,10 @@ index 69e614f..a95ca35 100644
      { "HostSpec", "" },
  #endif
 diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 0b573c2..b5535ee 100644
+index 543c4b3..a02e03a 100644
 --- a/src/corelib/global/qlibraryinfo.h
 +++ b/src/corelib/global/qlibraryinfo.h
-@@ -88,6 +88,7 @@ public:
+@@ -80,6 +80,7 @@ public:
          HostBinariesPath,
          HostLibrariesPath,
          HostDataPath,
@@ -278,10 +278,10 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 90981f6..7d73882 100644
+index 92422c2..d0a62c8 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1215,6 +1215,13 @@ void Configure::parseCmdLine()
+@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -295,7 +295,7 @@ index 90981f6..7d73882 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4006,6 +4013,7 @@ void Configure::generateQConfigCpp()
+@@ -3995,6 +4002,7 @@ void Configure::generateQConfigCpp()
                    << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
                    << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
                    << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
@@ -304,5 +304,5 @@ index 90981f6..7d73882 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index adf1c4a..83694b7 100644
--- a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
-From 34a32208034a03c0d591dc79386f97ae020652e7 Mon Sep 17 00:00:00 2001
+From 13a61389aa33fdfd5d9a1adf824d98c5ebf1cdff Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 04/13] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 04/11] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 7d73882..c572fbb 100644
+index d0a62c8..b3f3ff8 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -3393,8 +3393,8 @@ void Configure::generateQConfigPri()
+@@ -3384,8 +3384,8 @@ void Configure::generateQConfigPri()
          configStream << "    QT_ARCH = " << dictionary["QT_ARCH"] << endl;
          if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
              // FIXME: add detection
@@ -26,5 +26,5 @@ index 7d73882..c572fbb 100644
          configStream << "}" << endl;
          configStream << "QT_CONFIG += " << qtConfig.join(' ') << endl;
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index fe2fd6a..a6e9089 100644
--- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From 9e7667c9124ab287dc0f7ad40c2b61c435ffc186 Mon Sep 17 00:00:00 2001
+From 5778f98f990781710e72be8275dae32a7999330d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 05/13] qt_module: Fix pkgconfig and libtool replacements
+Subject: [PATCH 05/11] qt_module: Fix pkgconfig and libtool replacements
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -67,7 +67,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  2 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index 4dcabe9..d04bc3e 100644
+index af9d6ca..a4781d6 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
@@ -80,10 +80,10 @@ index 4dcabe9..d04bc3e 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 8bf4c92..2e229fc 100644
+index d213f9e..915c596 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -188,10 +188,25 @@ unix|mingw {
+@@ -192,10 +192,25 @@ unix|mingw {
          QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
      QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
  
@@ -110,5 +110,5 @@ index 8bf4c92..2e229fc 100644
  }
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 08629f5..042d763 100644
--- a/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,19 +1,60 @@
-From ce38ab8b2167b74fa90eb3e17507dc9e799a3274 Mon Sep 17 00:00:00 2001
+From 4a067c162d08596e3ec89dcfb3ecdf197b1bf22a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH 06/13] Revert "eglfs: Print the chosen config in debug mode"
+Subject: [PATCH 06/11] Revert "eglfs: Print the chosen config in debug mode"
+
+With this change the build is failing with:
+| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/eglplatform.h:118:0,
+|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/egl.h:36,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext_p.h:51,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext.cpp:34:
+| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:10: error: expected identifier before 'int'
+|      enum Status {
+|           ^
+| In file included from ../../include/QtCore/qtextstream.h:1:0,
+|                  from ../../include/QtCore/../../../git/src/corelib/io/qdebug.h:42,
+|                  from ../../include/QtCore/qdebug.h:1,
+|                  from ../../include/QtCore/QDebug:1,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext.cpp:40:
+| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:17: error: expected unqualified-id before '{' token
+|      enum Status {
+|                  ^
+| Makefile:3896: recipe for target '.obj/qeglplatformcontext.o' failed
+| make[2]: *** [.obj/qeglplatformcontext.o] Error 1
+| make[2]: *** Waiting for unfinished jobs....
+| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:196:5: error: 'Display' redeclared as different kind of symbol
+|      Display
+|      ^
+| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/eglplatform.h:118:0,
+|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/egl.h:36,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration_p.h:51,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:55:
+| /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/X11/Xlib.h:499:26: note: previous declaration 'typedef struct _XDisplay Display'
+|  typedef struct _XDisplay Display;
+|                           ^
+| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp: In member function 'virtual void* QEGLPlatformIntegration::nativeResourceForScreen(const QByteArray&, QScreen*)':
+| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:239:17: error: expected primary-expression before ':' token
+|      case Display:
+|                  ^
+| Makefile:5486: recipe for target '.obj/qeglplatformintegration.o' failed
 
 This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
+
+Will be partially resolved in newer revision with:
+https://codereview.qt-project.org/96220
+
+Change-Id: I7a6a926b7525d4f137824c71f2ec8cd089c21f13
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
  src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
  2 files changed, 3 insertions(+), 8 deletions(-)
 
 diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index 5eed470..39c7c1f 100644
+index c1a491c..7a0fc87 100644
 --- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
 +++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-@@ -451,9 +451,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
+@@ -443,9 +443,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
      for (index = 0; attrs[index].attr != -1; ++index) {
          EGLint value;
          if (eglGetConfigAttrib(display, config, attrs[index].attr, &value)) {
@@ -25,20 +66,20 @@ index 5eed470..39c7c1f 100644
 +    qWarning("\n");
  }
  
- #ifdef Q_OS_LINUX
+ #ifdef Q_OS_UNIX
 diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-index eec6463..4a7c69b 100644
+index 7cc3300..ccbd974 100644
 --- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
 +++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-@@ -44,7 +44,6 @@
- #include "qeglpbuffer_p.h"
+@@ -37,7 +37,6 @@
  #include <qpa/qplatformwindow.h>
  #include <QOpenGLContext>
+ #include <QtPlatformHeaders/QEGLNativeContext>
 -#include <QDebug>
  
  QT_BEGIN_NAMESPACE
  
-@@ -192,12 +191,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
+@@ -181,12 +180,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
          return;
      }
  
@@ -48,9 +89,9 @@ index eec6463..4a7c69b 100644
 -        q_printEglConfig(m_eglDisplay, m_eglConfig);
 -    }
 -
- #ifndef QT_NO_OPENGL
-     // Make the context current to ensure the GL version query works. This needs a surface too.
-     const EGLint pbufferAttributes[] = {
+     updateFormatFromGL();
+ }
+ 
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index c1ffb91..c528f0c 100644
--- a/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From 7c16b57ecdddffb4bb52d32bb763791fd8aa8414 Mon Sep 17 00:00:00 2001
+From 8e152449beb18454347cfdb300c50d113fa48383 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 07/13] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 07/11] qeglplatformintegration: Undefine CursorShape from X.h
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -9,11 +9,11 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-index f665455..9eb783c 100644
+index 4d7adce..c9b6873 100644
 --- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
 +++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-@@ -46,6 +46,12 @@
- #include <qpa/qplatformnativeinterface.h>
+@@ -50,6 +50,12 @@
+ #include <QtCore/QVariant>
  #include <EGL/egl.h>
  
 +// Undefine CursorShape from X.h, which is causing breakage in Qt::CursorShape in platformsupport/eglconvenience/
@@ -26,5 +26,5 @@ index f665455..9eb783c 100644
  
  class QEGLPlatformScreen;
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
index 370cc48..c20d6f1 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 68e499a4a521f3876aca195ba8ed5b63d45d09ed Mon Sep 17 00:00:00 2001
+From 3a31a14c9c244a22337f22d083a680f69a1b1ce8 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 08/13] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 08/11] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -12,10 +12,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 18d1a0b..ca0824f 100755
+index d715f6c..bd43281 100755
 --- a/configure
 +++ b/configure
-@@ -3573,7 +3573,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3622,7 +3622,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
  
  /* Installation Info */
@@ -25,5 +25,5 @@ index 18d1a0b..ca0824f 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index bbd27b9..200864a 100644
--- a/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From 3408e6d6c56a18bed48353c2f1b2e18f6716fc4e Mon Sep 17 00:00:00 2001
+From 621d867223a135a9babd452d4918200bc6d0463b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 09/13] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 09/11] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -27,10 +27,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 15 insertions(+), 1 deletion(-)
 
 diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-index 2d36c0b..854531e 100644
+index f5839e0..5ebde6d 100644
 --- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
 +++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-@@ -74,6 +74,15 @@ void QEglFSWindow::create()
+@@ -66,6 +66,15 @@ void QEglFSWindow::create()
  
      m_flags = Created;
  
@@ -46,16 +46,16 @@ index 2d36c0b..854531e 100644
      if (window()->type() == Qt::Desktop)
          return;
  
-@@ -85,7 +94,7 @@ void QEglFSWindow::create()
-         if (isRaster() && screen->compositingWindow())
+@@ -79,7 +88,7 @@ void QEglFSWindow::create()
              return;
+         }
  
 -#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK)
 +#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK) || defined(EGL_API_FB)
          // We can have either a single OpenGL window or multiple raster windows.
          // Other combinations cannot work.
          qFatal("EGLFS: OpenGL windows cannot be mixed with others.");
-@@ -105,6 +114,11 @@ void QEglFSWindow::create()
+@@ -99,6 +108,11 @@ void QEglFSWindow::create()
  
      resetSurface();
  
@@ -68,5 +68,5 @@ index 2d36c0b..854531e 100644
  
      if (isRaster()) {
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0011-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0010-QOpenGLPaintDevice-sub-area-support.patch
similarity index 78%
rename from recipes-qt/qt5/qtbase/0011-QOpenGLPaintDevice-sub-area-support.patch
rename to recipes-qt/qt5/qtbase/0010-QOpenGLPaintDevice-sub-area-support.patch
index f2031f7..986d2a9 100644
--- a/recipes-qt/qt5/qtbase/0011-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0010-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From 3902dcd1d7da169229deffbff02ac1a159b08d44 Mon Sep 17 00:00:00 2001
+From 46074ffb4525e8217acd78c9cbe29f3d62f85c78 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 11/13] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 10/11] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
@@ -12,26 +12,19 @@ Change-Id: Ida2f079aa1ac0b87d36b54129e226399dbcdda80
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/gui/opengl/qopenglpaintdevice.cpp       | 12 ++++++++++++
+ src/gui/opengl/qopenglpaintdevice.cpp       | 11 +++++++++++
  src/gui/opengl/qopenglpaintdevice.h         |  2 ++
+ src/gui/opengl/qopenglpaintdevice_p.h       |  1 +
  src/gui/opengl/qopenglpaintengine.cpp       |  9 +++++++--
  src/gui/opengl/qopenglpaintengine_p.h       |  1 +
  src/gui/opengl/qopengltextureglyphcache.cpp |  2 +-
- 5 files changed, 23 insertions(+), 3 deletions(-)
+ 6 files changed, 23 insertions(+), 3 deletions(-)
 
 diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index 6750458..034630a 100644
+index a08d26f..cff3155 100644
 --- a/src/gui/opengl/qopenglpaintdevice.cpp
 +++ b/src/gui/opengl/qopenglpaintdevice.cpp
-@@ -111,6 +111,7 @@ class QOpenGLPaintDevicePrivate
- public:
-     QOpenGLPaintDevicePrivate(const QSize &size);
- 
-+    QPoint offset;
-     QSize size;
-     QOpenGLContext *ctx;
- 
-@@ -159,6 +160,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
+@@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
  {
  }
  
@@ -42,9 +35,9 @@ index 6750458..034630a 100644
 +}
 +
  /*!
-     Destroys the QOpenGLPaintDevice.
- */
-@@ -228,6 +235,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
+     \internal
+  */
+@@ -212,6 +218,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
      return d_ptr->ctx;
  }
  
@@ -57,10 +50,10 @@ index 6750458..034630a 100644
      Returns the pixel size of the paint device.
  
 diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
-index c05571c..01eb1bc 100644
+index 10cee84..a6683c5 100644
 --- a/src/gui/opengl/qopenglpaintdevice.h
 +++ b/src/gui/opengl/qopenglpaintdevice.h
-@@ -62,12 +62,14 @@ public:
+@@ -53,12 +53,14 @@ public:
      QOpenGLPaintDevice();
      explicit QOpenGLPaintDevice(const QSize &size);
      QOpenGLPaintDevice(int width, int height);
@@ -75,11 +68,23 @@ index c05571c..01eb1bc 100644
      QSize size() const;
      void setSize(const QSize &size);
      void setDevicePixelRatio(qreal devicePixelRatio);
+diff --git a/src/gui/opengl/qopenglpaintdevice_p.h b/src/gui/opengl/qopenglpaintdevice_p.h
+index 0b01129..211f2f3 100644
+--- a/src/gui/opengl/qopenglpaintdevice_p.h
++++ b/src/gui/opengl/qopenglpaintdevice_p.h
+@@ -65,6 +65,7 @@ public:
+ 
+ public:
+     QSize size;
++    QPoint offset;
+     QOpenGLContext *ctx;
+ 
+     qreal dpmx;
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 81a0d82..ce57261 100644
+index c490726..1d775fd 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -1985,7 +1985,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+@@ -2002,7 +2002,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
      for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
          d->vertexAttributeArraysEnabledState[i] = false;
  
@@ -90,7 +95,7 @@ index 81a0d82..ce57261 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2070,7 +2073,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2089,7 +2092,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
@@ -99,7 +104,7 @@ index 81a0d82..ce57261 100644
          d->needsSync = false;
          d->lastMaskTextureUsed = 0;
          d->shaderManager->setDirty();
-@@ -2113,6 +2116,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2132,6 +2135,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
          funcs.glDisable(GL_SCISSOR_TEST);
      } else {
@@ -107,7 +112,7 @@ index 81a0d82..ce57261 100644
          funcs.glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2121,12 +2125,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2140,12 +2144,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
@@ -123,10 +128,10 @@ index 81a0d82..ce57261 100644
  
      funcs.glScissor(left, bottom, width, height);
 diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index 4f0e2e5..f211de1 100644
+index 5ef0366..c5b517d 100644
 --- a/src/gui/opengl/qopenglpaintengine_p.h
 +++ b/src/gui/opengl/qopenglpaintengine_p.h
-@@ -264,6 +264,7 @@ public:
+@@ -256,6 +256,7 @@ public:
      QOpenGL2PaintEngineEx* q;
      QOpenGLEngineShaderManager* shaderManager;
      QOpenGLPaintDevice* device;
@@ -135,10 +140,10 @@ index 4f0e2e5..f211de1 100644
      QOpenGLContext *ctx;
      EngineMode mode;
 diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index 0610ab6..ea1e3b2 100644
+index cd268cd..997bc35 100644
 --- a/src/gui/opengl/qopengltextureglyphcache.cpp
 +++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -316,7 +316,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
+@@ -310,7 +310,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
      funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
  
      if (pex != 0) {
@@ -148,5 +153,5 @@ index 0610ab6..ea1e3b2 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch b/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
deleted file mode 100644
index 07f9795..0000000
--- a/recipes-qt/qt5/qtbase/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4a6476822784ca6a10f59cfb3e941854ccea8408 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 4 Jun 2014 15:26:11 +0200
-Subject: [PATCH 10/13] Revert "Use the "gcc" feature in simd.prf"
-
-This reverts commit 3b00cc480400d47c59c29d3507c7fcdc9be2a489.
----
- mkspecs/features/simd.prf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mkspecs/features/simd.prf b/mkspecs/features/simd.prf
-index 62a63f9..4f86f60 100644
---- a/mkspecs/features/simd.prf
-+++ b/mkspecs/features/simd.prf
-@@ -18,7 +18,7 @@ QT_CPU_FEATURES = $$eval(QT_CPU_FEATURES.$$QT_ARCH)
- #
- # Set up compilers for SIMD (SSE/AVX, NEON etc)
- #
--gcc {       # includes intel_icc and clang variants
-+*-g++*|intel_icc|*-clang*|*-qcc* {
-     sse2 {
-         HEADERS += $$SSE2_HEADERS
- 
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
similarity index 77%
rename from recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
index 46ae47f..86bf90d 100644
--- a/recipes-qt/qt5/qtbase/0012-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From bdcbca2fcb09d48af75e99b7dfa6ce211507925c Mon Sep 17 00:00:00 2001
+From d48323aae1bee4b2398d61e1777815ffac15ccce Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 12/13] Always build uic
+Subject: [PATCH 11/12] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 6a805a6..90623a6 100644
+index 81f4fa5..74ec23d 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -158,7 +158,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -162,7 +162,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
@@ -27,5 +27,5 @@ index 6a805a6..90623a6 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
similarity index 84%
rename from recipes-qt/qt5/qtbase/0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
rename to recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 7145796..21e0987 100644
--- a/recipes-qt/qt5/qtbase/0012-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,7 +1,7 @@
-From bb0958af49c1ad4d35b6b6b9033cd46eda4a3ac8 Mon Sep 17 00:00:00 2001
+From ee542556da221be99fa3344630b78529555be2bc Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 12/12] qmake: don't build it in configure, but allow to build
+Subject: [PATCH 11/11] qmake: don't build it in configure, but allow to build
  it separately
 
 * it is already built in qtbase-native, so we don't need it in configure
@@ -20,10 +20,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index ca0824f..5a09ae3 100755
+index bd43281..5d1b3aa 100755
 --- a/configure
 +++ b/configure
-@@ -3675,7 +3675,7 @@ setBootstrapEvalVariable()
+@@ -3724,7 +3724,7 @@ setBootstrapEvalVariable()
  
  
  # build qmake
@@ -46,5 +46,5 @@ index 89d6ea5..7c605b9 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
similarity index 74%
rename from recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
rename to recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
index 667c9ec..6a428ed 100644
--- a/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,7 +1,7 @@
-From 68bd66b37455f9b27b2f030948943942e12b3af1 Mon Sep 17 00:00:00 2001
+From 9089bf90632ffc983625816c5b0f2f2509ffc176 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 13/13] configure: preserve built qmake and swap with native
+Subject: [PATCH 12/12] configure: preserve built qmake and swap with native
  one
 
 Let configure script build the real qmake, but right after it's built, swap
@@ -13,10 +13,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index ca0824f..2c097c3 100755
+index bd43281..d331711 100755
 --- a/configure
 +++ b/configure
-@@ -3825,6 +3825,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3874,6 +3874,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
  
      (cd "$outpath/qmake"; "$MAKE") || exit 2
  fi # Build qmake
@@ -26,5 +26,5 @@ index ca0824f..2c097c3 100755
  echo "Running configuration tests..."
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtbase_5.3.2.bb b/recipes-qt/qt5/qtbase_5.3.2.bb
deleted file mode 100644
index 49b9072..0000000
--- a/recipes-qt/qt5/qtbase_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "563e2b10274171f1184b3fd7260b4991"
-SRC_URI[sha256sum] = "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8"
diff --git a/recipes-qt/qt5/qtbase_5.4.0.bb b/recipes-qt/qt5/qtbase_5.4.0.bb
new file mode 100644
index 0000000..7414abd
--- /dev/null
+++ b/recipes-qt/qt5/qtbase_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "eaaa72a5cb25713ca8d17f3a8d149765"
+SRC_URI[sha256sum] = "daea240ba5e77bc2d78ec21a2cb664eed83b3d4ad409b6277a6f7d4c0c8e91d1"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index f136651..441a281 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -25,9 +25,3 @@ SRC_URI += "\
 "
 
 SRCREV = "cc23ebace8b7f343aca6e10f9ebd31b87c17c782"
-
-LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtconnectivity.inc b/recipes-qt/qt5/qtconnectivity.inc
index c0a5147..10dcc22 100644
--- a/recipes-qt/qt5/qtconnectivity.inc
+++ b/recipes-qt/qt5/qtconnectivity.inc
@@ -11,3 +11,6 @@ do_configure_prepend() {
 }
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'bluez4', 'CONFIG+=OE_BLUEZ_ENABLED', '', d)}"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtconnectivity_5.3.2.bb b/recipes-qt/qt5/qtconnectivity_5.3.2.bb
deleted file mode 100644
index 4d9534b..0000000
--- a/recipes-qt/qt5/qtconnectivity_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "e496963407bb0c7b2e6c07133715a9cf"
-SRC_URI[sha256sum] = "2eb972b85697e9752ed2f2f7e194393650743737a9fe5f48177734c4dbd9096f"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtconnectivity_5.4.0.bb b/recipes-qt/qt5/qtconnectivity_5.4.0.bb
new file mode 100644
index 0000000..301da1e
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "c1fc247771a2fd1d238db8ffc4e65bbf"
+SRC_URI[sha256sum] = "636685bbcccac28f6c8c2d1bee7c9b06a74bc5c11d9c87a424d80093f19b1038"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 4e7323b..c68032b 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${BPN}.inc
 
 SRCREV = "73563f571e6dfd37a0e4cf90f4679d9901b9233c"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtdeclarative.inc b/recipes-qt/qt5/qtdeclarative.inc
index 4a186fd..6969c23 100644
--- a/recipes-qt/qt5/qtdeclarative.inc
+++ b/recipes-qt/qt5/qtdeclarative.inc
@@ -16,3 +16,6 @@ do_configure_prepend() {
 }
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtdeclarative_5.3.2.bb b/recipes-qt/qt5/qtdeclarative_5.3.2.bb
deleted file mode 100644
index ac7817e..0000000
--- a/recipes-qt/qt5/qtdeclarative_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "72ae60527ebb15f4b85cfbadc4c174de"
-SRC_URI[sha256sum] = "04108193b9642c0394c157e98b5c1d81f555f9f495289e07ebfb6f03448b2382"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtdeclarative_5.4.0.bb b/recipes-qt/qt5/qtdeclarative_5.4.0.bb
new file mode 100644
index 0000000..2233b69
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "4f928e52e72b5e867b50b4d409d5e99b"
+SRC_URI[sha256sum] = "e67c9275b0f6869a7c1e8023ad7c0a23fb19f8a8d2f350371e954ead0cfad7b6"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index e7f8871..a159edc 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "be6c91acc3ee5ebb8336b9e79df195662ac11788"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtenginio.inc b/recipes-qt/qt5/qtenginio.inc
index 5b74a35..d66b253 100644
--- a/recipes-qt/qt5/qtenginio.inc
+++ b/recipes-qt/qt5/qtenginio.inc
@@ -2,7 +2,7 @@ require qt5.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=66c98a57685a93d9adf4815b0d11827a \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
 LICENSE = "LGPL-2.1 | GPL-3.0"
diff --git a/recipes-qt/qt5/qtenginio_5.3.2.bb b/recipes-qt/qt5/qtenginio_5.3.2.bb
deleted file mode 100644
index f7a7b1e..0000000
--- a/recipes-qt/qt5/qtenginio_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "53b67cf5470dfa9bcfc59aa5b8bfd66d"
-SRC_URI[sha256sum] = "d5b84656dc6a349db380e42690a18137e562dbaba1930216bb3e3815df6af708"
diff --git a/recipes-qt/qt5/qtenginio_5.4.0.bb b/recipes-qt/qt5/qtenginio_5.4.0.bb
new file mode 100644
index 0000000..78f1e60
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "959a9ebac4faa0464368a318fa677ab6"
+SRC_URI[sha256sum] = "fa0954e5f100d38291fd3b3c8c92ade11710b25ae48018af7451c631982d924c"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index c54bec7..3be2134 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -3,7 +3,3 @@ require ${PN}.inc
 
 QT_MODULE_BRANCH = "1.1"
 SRCREV = "f8ad37de2d7170d1548252608f8c04aac6ec1035"
-
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
diff --git a/recipes-qt/qt5/qtgraphicaleffects.inc b/recipes-qt/qt5/qtgraphicaleffects.inc
index 2ced3c2..89bda5e 100644
--- a/recipes-qt/qt5/qtgraphicaleffects.inc
+++ b/recipes-qt/qt5/qtgraphicaleffects.inc
@@ -3,3 +3,6 @@ require qt5.inc
 DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb b/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
deleted file mode 100644
index bbf96d7..0000000
--- a/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "6dd8dd6906bbfb52a292cd25927bb9a8"
-SRC_URI[sha256sum] = "688f2658a13d2919487d3f5acacb037364ee5c8fe0319f524a7d0a4987ba7ffc"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb b/recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb
new file mode 100644
index 0000000..bf868af
--- /dev/null
+++ b/recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "4d26d56c55b0117c37d96e85755da6a4"
+SRC_URI[sha256sum] = "a43f10e532180eb8400fec65752b36c1adaa9aaf672146035ef630d324a38b19"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 3a64372..71c912a 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "9e9600d92224084f7942a6bd83b926c630a29747"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtimageformats.inc b/recipes-qt/qt5/qtimageformats.inc
index 39afd46..94c3a9d 100644
--- a/recipes-qt/qt5/qtimageformats.inc
+++ b/recipes-qt/qt5/qtimageformats.inc
@@ -16,3 +16,6 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libmng', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_JASPER_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtimageformats_5.3.2.bb b/recipes-qt/qt5/qtimageformats_5.3.2.bb
deleted file mode 100644
index f017df9..0000000
--- a/recipes-qt/qt5/qtimageformats_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "255bb7f28c667ab91303e6af271753b5"
-SRC_URI[sha256sum] = "d303cbceb73774edc0cfdbde6b97b0e41077e242ff6520710890f81bea40e2d4"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtimageformats_5.4.0.bb b/recipes-qt/qt5/qtimageformats_5.4.0.bb
new file mode 100644
index 0000000..1893b1c
--- /dev/null
+++ b/recipes-qt/qt5/qtimageformats_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "608dbe53d5d3a0872eb20025b681d1dc"
+SRC_URI[sha256sum] = "c89b678df71e44f8cff7b5f8362b7d61430a7aa7cd70147be1267d87ac8fe046"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 1923f87..6d444eb 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "9141782adabcfd374285c3a52b7c386b9b90aa9a"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtlocation.inc b/recipes-qt/qt5/qtlocation.inc
index 41f2d19..7941240 100644
--- a/recipes-qt/qt5/qtlocation.inc
+++ b/recipes-qt/qt5/qtlocation.inc
@@ -18,3 +18,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtlocation_5.3.2.bb b/recipes-qt/qt5/qtlocation_5.3.2.bb
deleted file mode 100644
index f8487a5..0000000
--- a/recipes-qt/qt5/qtlocation_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "1ad3ee98f6f5d71df8dda14edc06346c"
-SRC_URI[sha256sum] = "37b4072b531c35389b3acbbbd7259ab6ce4106177b96d67bfe5d3236139814d7"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtlocation_5.4.0.bb b/recipes-qt/qt5/qtlocation_5.4.0.bb
new file mode 100644
index 0000000..0f5be11
--- /dev/null
+++ b/recipes-qt/qt5/qtlocation_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "76cbd4d7acf5b319ed1d9454aac0477b"
+SRC_URI[sha256sum] = "e8420c1b5fdddbc44faa7aa1c653da91dc101055a869dcb518326188be81d456"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 35b06dd..4cd5a64 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "486874134b83672ae46bce315f632943829d5303"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 9e7c57a..8904ca5 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -13,3 +13,6 @@ SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
     file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch \
 "
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index c32ddaf..ab819f2 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From f8e3c6be700907a597ae706afeec14e26103b31e Mon Sep 17 00:00:00 2001
+From 4af76880d63e8d392eb8add8b8999e3f5031675a Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH 1/2] Initial porting effort to GStreamer 1.0.
@@ -38,7 +38,7 @@ Conflicts:
  src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
  src/gsttools/qgstutils.cpp                         |  27 ++-
  src/gsttools/qgstvideobuffer.cpp                   |  18 +-
- src/gsttools/qvideosurfacegstsink.cpp              | 143 +++++++++++++--
+ src/gsttools/qvideosurfacegstsink.cpp              | 138 +++++++++++++-
  src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
  .../qgstreameraudioprobecontrol_p.h                |   5 +-
  .../qgstreamervideoprobecontrol_p.h                |   4 +
@@ -58,7 +58,7 @@ Conflicts:
  .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
  .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++--
  .../mediaplayer/qgstreamerplayersession.h          |   9 +
- 36 files changed, 875 insertions(+), 132 deletions(-)
+ 36 files changed, 872 insertions(+), 130 deletions(-)
 
 diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstreamer/gstreamer.pro
 index 02a7e34..6b9843a 100644
@@ -244,10 +244,10 @@ index 7c809a7..6b9bf5d 100644
  
  config_linux_v4l: DEFINES += USE_V4L
 diff --git a/src/gsttools/gstvideoconnector.c b/src/gsttools/gstvideoconnector.c
-index 3e08fe5..ff3f9a3 100644
+index 3ed539e..ed0ed3c 100644
 --- a/src/gsttools/gstvideoconnector.c
 +++ b/src/gsttools/gstvideoconnector.c
-@@ -67,26 +67,93 @@ GST_STATIC_PAD_TEMPLATE ("src",
+@@ -59,26 +59,93 @@ GST_STATIC_PAD_TEMPLATE ("src",
                           GST_PAD_ALWAYS,
                           GST_STATIC_CAPS_ANY);
  
@@ -342,7 +342,7 @@ index 3e08fe5..ff3f9a3 100644
  
  static void
  gst_video_connector_base_init (gpointer g_class)
-@@ -128,18 +195,33 @@ gst_video_connector_class_init (GstVideoConnectorClass * klass)
+@@ -120,18 +187,33 @@ gst_video_connector_class_init (GstVideoConnectorClass * klass)
                            g_cclosure_marshal_VOID__VOID, G_TYPE_NONE, 0);
  }
  
@@ -378,7 +378,7 @@ index 3e08fe5..ff3f9a3 100644
      gst_pad_set_bufferalloc_function(element->sinkpad,
                                       GST_DEBUG_FUNCPTR (gst_video_connector_buffer_alloc));
      gst_pad_set_setcaps_function(element->sinkpad,
-@@ -148,14 +230,23 @@ gst_video_connector_init (GstVideoConnector *element,
+@@ -140,14 +222,23 @@ gst_video_connector_init (GstVideoConnector *element,
                                 GST_DEBUG_FUNCPTR(gst_video_connector_getcaps));
      gst_pad_set_acceptcaps_function(element->sinkpad,
                                 GST_DEBUG_FUNCPTR(gst_video_connector_acceptcaps));
@@ -403,7 +403,7 @@ index 3e08fe5..ff3f9a3 100644
      gst_element_add_pad (GST_ELEMENT (element), element->srcpad);
  
      element->relinked = FALSE;
-@@ -183,9 +274,16 @@ gst_video_connector_dispose (GObject * object)
+@@ -175,9 +266,16 @@ gst_video_connector_dispose (GObject * object)
  
      gst_video_connector_reset (element);
  
@@ -420,7 +420,7 @@ index 3e08fe5..ff3f9a3 100644
  // "When this function returns anything else than GST_FLOW_OK,
  // the buffer allocation failed and buf does not contain valid data."
  static GstFlowReturn
-@@ -229,6 +327,7 @@ gst_video_connector_buffer_alloc (GstPad * pad, guint64 offset, guint size,
+@@ -221,6 +319,7 @@ gst_video_connector_buffer_alloc (GstPad * pad, guint64 offset, guint size,
                  if (state == GST_STATE_NULL) {
                      GST_DEBUG_OBJECT (element, "Downstream element is in NULL state");
                      // Downstream filter seems to be in the wrong state
@@ -428,7 +428,7 @@ index 3e08fe5..ff3f9a3 100644
                      return GST_FLOW_UNEXPECTED;
                  }
              }
-@@ -301,6 +400,7 @@ static GstCaps *gst_video_connector_getcaps (GstPad * pad)
+@@ -293,6 +392,7 @@ static GstCaps *gst_video_connector_getcaps (GstPad * pad)
      return caps;
  }
  
@@ -436,7 +436,7 @@ index 3e08fe5..ff3f9a3 100644
  static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps)
  {
      GstVideoConnector *element;
-@@ -308,6 +408,7 @@ static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps)
+@@ -300,6 +400,7 @@ static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps)
  
      return gst_pad_peer_accept_caps(element->srcpad, caps);
  }
@@ -444,7 +444,7 @@ index 3e08fe5..ff3f9a3 100644
  
  static void
  gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal)
-@@ -319,11 +420,39 @@ gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailed
+@@ -311,11 +412,39 @@ gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailed
          connector->failedSignalEmited = FALSE;
  }
  
@@ -485,7 +485,7 @@ index 3e08fe5..ff3f9a3 100644
  
      GstVideoConnector *element = GST_VIDEO_CONNECTOR (object);
  
-@@ -335,16 +464,23 @@ static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *
+@@ -327,16 +456,23 @@ static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *
      if (element->relinked)
          GST_LOG_OBJECT(element, "rejected buffer because of new segment request");
  
@@ -511,7 +511,7 @@ index 3e08fe5..ff3f9a3 100644
      element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
  
      do {
-@@ -356,20 +492,29 @@ gst_video_connector_chain (GstPad * pad, GstBuffer * buf)
+@@ -348,20 +484,29 @@ gst_video_connector_chain (GstPad * pad, GstBuffer * buf)
          */
          while (element->relinked) {
              element->relinked = FALSE;
@@ -543,7 +543,7 @@ index 3e08fe5..ff3f9a3 100644
  
              GST_DEBUG_OBJECT (element, "Pushing new segment event");
              if (!gst_pad_push_event (element->srcpad, ev)) {
-@@ -432,8 +577,11 @@ gst_video_connector_change_state (GstElement * element,
+@@ -424,8 +569,11 @@ gst_video_connector_change_state (GstElement * element,
      GstStateChangeReturn result;
  
      connector = GST_VIDEO_CONNECTOR(element);
@@ -556,7 +556,7 @@ index 3e08fe5..ff3f9a3 100644
      switch (transition) {
      case GST_STATE_CHANGE_PAUSED_TO_READY:
          gst_video_connector_reset (connector);
-@@ -448,9 +596,32 @@ gst_video_connector_change_state (GstElement * element,
+@@ -440,9 +588,32 @@ gst_video_connector_change_state (GstElement * element,
      return result;
  }
  
@@ -591,7 +591,7 @@ index 3e08fe5..ff3f9a3 100644
      if (GST_EVENT_TYPE (event) == GST_EVENT_NEWSEGMENT) {
          GstVideoConnector *element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
  
-@@ -461,7 +632,6 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
+@@ -453,7 +624,6 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
  
          gst_event_parse_new_segment_full (event, &update, &rate, &arate, &format,
                                            &start, &stop, &time);
@@ -599,7 +599,7 @@ index 3e08fe5..ff3f9a3 100644
          GST_LOG_OBJECT (element,
                            "NEWSEGMENT update %d, rate %lf, applied rate %lf, "
                            "format %d, " "%" G_GINT64_FORMAT " -- %" G_GINT64_FORMAT ", time %"
-@@ -469,9 +639,10 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
+@@ -461,9 +631,10 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
  
          gst_segment_set_newsegment_full (&element->segment, update,
                                           rate, arate, format, start, stop, time);
@@ -612,10 +612,10 @@ index 3e08fe5..ff3f9a3 100644
 +
 +#endif
 diff --git a/src/gsttools/qgstappsrc.cpp b/src/gsttools/qgstappsrc.cpp
-index 2c9f64c..7916d89 100644
+index 561a96f..d5e106f 100644
 --- a/src/gsttools/qgstappsrc.cpp
 +++ b/src/gsttools/qgstappsrc.cpp
-@@ -155,23 +155,44 @@ void QGstAppSrc::pushDataToAppSrc()
+@@ -147,23 +147,44 @@ void QGstAppSrc::pushDataToAppSrc()
              size = qMin(m_stream->bytesAvailable(), (qint64)m_dataRequestSize);
  
          if (size) {
@@ -665,10 +665,10 @@ index 2c9f64c..7916d89 100644
          } else {
              sendEOS();
 diff --git a/src/gsttools/qgstreameraudioprobecontrol.cpp b/src/gsttools/qgstreameraudioprobecontrol.cpp
-index 94d07c9..8c85973 100644
+index 3baca53..be3de3f 100644
 --- a/src/gsttools/qgstreameraudioprobecontrol.cpp
 +++ b/src/gsttools/qgstreameraudioprobecontrol.cpp
-@@ -53,9 +53,14 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeControl()
+@@ -45,9 +45,14 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeControl()
  
  }
  
@@ -684,7 +684,7 @@ index 94d07c9..8c85973 100644
      if (!caps)
          return;
  
-@@ -64,8 +69,20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
+@@ -56,8 +61,20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
      if (!format.isValid())
          return;
  
@@ -706,10 +706,10 @@ index 94d07c9..8c85973 100644
          QMutexLocker locker(&m_bufferMutex);
          m_pendingBuffer = audioBuffer;
 diff --git a/src/gsttools/qgstreamerbushelper.cpp b/src/gsttools/qgstreamerbushelper.cpp
-index da7506e..6b4cdd2 100644
+index 84eda46..eb1fc36 100644
 --- a/src/gsttools/qgstreamerbushelper.cpp
 +++ b/src/gsttools/qgstreamerbushelper.cpp
-@@ -162,13 +162,21 @@ QGstreamerBusHelper::QGstreamerBusHelper(GstBus* bus, QObject* parent):
+@@ -154,13 +154,21 @@ QGstreamerBusHelper::QGstreamerBusHelper(GstBus* bus, QObject* parent):
      QObject(parent)
  {
      d = new QGstreamerBusHelperPrivate(this, bus);
@@ -732,10 +732,10 @@ index da7506e..6b4cdd2 100644
  }
  
 diff --git a/src/gsttools/qgstreamervideoprobecontrol.cpp b/src/gsttools/qgstreamervideoprobecontrol.cpp
-index f2e6c3f..55632ff 100644
+index a78a9da..9c31140 100644
 --- a/src/gsttools/qgstreamervideoprobecontrol.cpp
 +++ b/src/gsttools/qgstreamervideoprobecontrol.cpp
-@@ -75,12 +75,21 @@ void QGstreamerVideoProbeControl::stopFlushing()
+@@ -67,12 +67,21 @@ void QGstreamerVideoProbeControl::stopFlushing()
      m_flushing = false;
  }
  
@@ -758,10 +758,10 @@ index f2e6c3f..55632ff 100644
          return;
  
 diff --git a/src/gsttools/qgstreamervideorenderer.cpp b/src/gsttools/qgstreamervideorenderer.cpp
-index 36c9f78..da85dea 100644
+index 2b66f76..804dce9 100644
 --- a/src/gsttools/qgstreamervideorenderer.cpp
 +++ b/src/gsttools/qgstreamervideorenderer.cpp
-@@ -43,8 +43,7 @@
+@@ -35,8 +35,7 @@
  #include <private/qvideosurfacegstsink_p.h>
  #include <private/qgstutils_p.h>
  #include <qabstractvideosurface.h>
@@ -772,10 +772,10 @@ index 36c9f78..da85dea 100644
  #include <gst/gst.h>
  
 diff --git a/src/gsttools/qgstreamervideowidget.cpp b/src/gsttools/qgstreamervideowidget.cpp
-index 7e11bfb..7848f2f 100644
+index aa2e2a3..14c1f04 100644
 --- a/src/gsttools/qgstreamervideowidget.cpp
 +++ b/src/gsttools/qgstreamervideowidget.cpp
-@@ -48,8 +48,13 @@
+@@ -40,8 +40,13 @@
  #include <QtGui/qpainter.h>
  
  #include <gst/gst.h>
@@ -789,7 +789,7 @@ index 7e11bfb..7848f2f 100644
  
  QT_BEGIN_NAMESPACE
  
-@@ -177,9 +182,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
+@@ -169,9 +174,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
  {
      GstMessage* gm = message.rawMessage();
  
@@ -804,7 +804,7 @@ index 7e11bfb..7848f2f 100644
          setOverlay();
          QMetaObject::invokeMethod(this, "updateNativeVideoSize", Qt::QueuedConnection);
          return true;
-@@ -207,18 +216,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
+@@ -199,18 +208,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
  
  void QGstreamerVideoWidgetControl::setOverlay()
  {
@@ -835,7 +835,7 @@ index 7e11bfb..7848f2f 100644
  
          if (caps) {
              m_widget->setNativeSize(QGstUtils::capsCorrectedResolution(caps));
-@@ -233,8 +253,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
+@@ -225,8 +245,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
  
  void QGstreamerVideoWidgetControl::windowExposed()
  {
@@ -850,10 +850,10 @@ index 7e11bfb..7848f2f 100644
  
  QWidget *QGstreamerVideoWidgetControl::videoWidget()
 diff --git a/src/gsttools/qgstreamervideowindow.cpp b/src/gsttools/qgstreamervideowindow.cpp
-index 2dc3510..45e9374 100644
+index a373dcc..587b010 100644
 --- a/src/gsttools/qgstreamervideowindow.cpp
 +++ b/src/gsttools/qgstreamervideowindow.cpp
-@@ -45,8 +45,12 @@
+@@ -37,8 +37,12 @@
  #include <QtCore/qdebug.h>
  
  #include <gst/gst.h>
@@ -866,7 +866,7 @@ index 2dc3510..45e9374 100644
  
  
  QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char *elementName)
-@@ -57,18 +61,25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char *elemen
+@@ -49,18 +53,25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char *elemen
      , m_fullScreen(false)
      , m_colorKey(QColor::Invalid)
  {
@@ -894,7 +894,7 @@ index 2dc3510..45e9374 100644
  }
  
  QGstreamerVideoWindow::~QGstreamerVideoWindow()
-@@ -90,11 +101,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
+@@ -82,11 +93,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
      WId oldId = m_windowId;
  
      m_windowId = id;
@@ -912,7 +912,7 @@ index 2dc3510..45e9374 100644
      if (!oldId)
          emit readyChanged(true);
  
-@@ -105,7 +120,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
+@@ -97,7 +112,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
  bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &message)
  {
      GstMessage* gm = message.rawMessage();
@@ -933,7 +933,7 @@ index 2dc3510..45e9374 100644
      if ((GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
              gst_structure_has_name(gm->structure, "prepare-xwindow-id") &&
              m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-@@ -118,7 +146,7 @@ bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &message)
+@@ -110,7 +138,7 @@ bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &message)
  
          return true;
      }
@@ -942,7 +942,7 @@ index 2dc3510..45e9374 100644
      return false;
  }
  
-@@ -130,7 +158,19 @@ QRect QGstreamerVideoWindow::displayRect() const
+@@ -122,7 +150,19 @@ QRect QGstreamerVideoWindow::displayRect() const
  void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
  {
      m_displayRect = rect;
@@ -963,7 +963,7 @@ index 2dc3510..45e9374 100644
      if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
  #if GST_VERSION_MICRO >= 29
          if (m_displayRect.isEmpty())
-@@ -144,6 +184,7 @@ void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
+@@ -136,6 +176,7 @@ void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
          repaint();
  #endif
      }
@@ -971,7 +971,7 @@ index 2dc3510..45e9374 100644
  }
  
  Qt::AspectRatioMode QGstreamerVideoWindow::aspectRatioMode() const
-@@ -165,6 +206,16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt::AspectRatioMode mode)
+@@ -157,6 +198,16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt::AspectRatioMode mode)
  
  void QGstreamerVideoWindow::repaint()
  {
@@ -988,7 +988,7 @@ index 2dc3510..45e9374 100644
      if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
          //don't call gst_x_overlay_expose if the sink is in null state
          GstState state = GST_STATE_NULL;
-@@ -173,6 +224,7 @@ void QGstreamerVideoWindow::repaint()
+@@ -165,6 +216,7 @@ void QGstreamerVideoWindow::repaint()
              gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
          }
      }
@@ -996,7 +996,7 @@ index 2dc3510..45e9374 100644
  }
  
  QColor QGstreamerVideoWindow::colorKey() const
-@@ -304,11 +356,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
+@@ -296,11 +348,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
      return m_nativeSize;
  }
  
@@ -1019,7 +1019,7 @@ index 2dc3510..45e9374 100644
  }
  
  void QGstreamerVideoWindow::updateNativeVideoSize()
-@@ -319,7 +382,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
+@@ -311,7 +374,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
      if (m_videoSink) {
          //find video native size to update video widget size hint
          GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
@@ -1032,7 +1032,7 @@ index 2dc3510..45e9374 100644
  
          if (caps) {
 diff --git a/src/gsttools/qgstutils.cpp b/src/gsttools/qgstutils.cpp
-index 41bd005..3ca1921 100644
+index 556fc03..5ea2c59 100644
 --- a/src/gsttools/qgstutils.cpp
 +++ b/src/gsttools/qgstutils.cpp
 @@ -89,8 +89,13 @@ static void addTagToMap(const GstTagList *list,
@@ -1083,7 +1083,7 @@ index 41bd005..3ca1921 100644
  
  /*!
    Builds GstCaps for an audio format.
-@@ -403,7 +426,7 @@ QMultimedia::SupportEstimate QGstUtils::hasSupport(const QString &mimeType,
+@@ -579,7 +602,7 @@ QByteArray QGstUtils::cameraDriver(const QString &device, GstElementFactory *fac
  
  void qt_gst_object_ref_sink(gpointer object)
  {
@@ -1093,10 +1093,10 @@ index 41bd005..3ca1921 100644
  #else
      g_return_if_fail (GST_IS_OBJECT(object));
 diff --git a/src/gsttools/qgstvideobuffer.cpp b/src/gsttools/qgstvideobuffer.cpp
-index 45556d1..750a07f 100644
+index 18702ec..93f22f5 100644
 --- a/src/gsttools/qgstvideobuffer.cpp
 +++ b/src/gsttools/qgstvideobuffer.cpp
-@@ -78,21 +78,33 @@ QAbstractVideoBuffer::MapMode QGstVideoBuffer::mapMode() const
+@@ -70,21 +70,33 @@ QAbstractVideoBuffer::MapMode QGstVideoBuffer::mapMode() const
  uchar *QGstVideoBuffer::map(MapMode mode, int *numBytes, int *bytesPerLine)
  {
      if (mode != NotMapped && m_mode == NotMapped) {
@@ -1134,10 +1134,10 @@ index 45556d1..750a07f 100644
  }
  
 diff --git a/src/gsttools/qvideosurfacegstsink.cpp b/src/gsttools/qvideosurfacegstsink.cpp
-index 81d5f60..51c4107 100644
+index f3e2d88..a964e82 100644
 --- a/src/gsttools/qvideosurfacegstsink.cpp
 +++ b/src/gsttools/qvideosurfacegstsink.cpp
-@@ -51,7 +51,11 @@
+@@ -43,7 +43,11 @@
  
  #include "qvideosurfacegstsink_p.h"
  
@@ -1150,7 +1150,7 @@ index 81d5f60..51c4107 100644
  
  QT_BEGIN_NAMESPACE
  
-@@ -71,10 +75,12 @@ QVideoSurfaceGstDelegate::QVideoSurfaceGstDelegate(
+@@ -62,10 +66,12 @@ QVideoSurfaceGstDelegate::QVideoSurfaceGstDelegate(
      if (m_surface) {
          foreach (QObject *instance, bufferPoolLoader()->instances(QGstBufferPoolPluginKey)) {
              QGstBufferPoolInterface* plugin = qobject_cast<QGstBufferPoolInterface*>(instance);
@@ -1163,7 +1163,7 @@ index 81d5f60..51c4107 100644
          updateSupportedFormats();
          connect(m_surface, SIGNAL(supportedFormatsChanged()), this, SLOT(updateSupportedFormats()));
      }
-@@ -208,6 +214,8 @@ GstFlowReturn QVideoSurfaceGstDelegate::render(GstBuffer *buffer)
+@@ -198,6 +204,8 @@ GstFlowReturn QVideoSurfaceGstDelegate::render(GstBuffer *buffer)
      if (QThread::currentThread() == thread()) {
          if (!m_surface.isNull())
              m_surface->present(m_frame);
@@ -1172,7 +1172,7 @@ index 81d5f60..51c4107 100644
      } else {
          QMetaObject::invokeMethod(this, "queuedRender", Qt::QueuedConnection);
          m_renderCondition.wait(&m_mutex, 300);
-@@ -310,6 +318,27 @@ void QVideoSurfaceGstDelegate::updateSupportedFormats()
+@@ -283,6 +291,27 @@ void QVideoSurfaceGstDelegate::updateSupportedFormats()
      }
  }
  
@@ -1200,7 +1200,7 @@ index 81d5f60..51c4107 100644
  struct YuvFormat
  {
      QVideoFrame::PixelFormat pixelFormat;
-@@ -327,6 +356,7 @@ static const YuvFormat qt_yuvColorLookup[] =
+@@ -300,6 +329,7 @@ static const YuvFormat qt_yuvColorLookup[] =
      { QVideoFrame::Format_NV21,    GST_MAKE_FOURCC('N','V','2','1'), 8 },
      { QVideoFrame::Format_AYUV444, GST_MAKE_FOURCC('A','Y','U','V'), 32 }
  };
@@ -1208,7 +1208,7 @@ index 81d5f60..51c4107 100644
  
  static int indexOfYuvColor(QVideoFrame::PixelFormat format)
  {
-@@ -339,12 +369,20 @@ static int indexOfYuvColor(QVideoFrame::PixelFormat format)
+@@ -312,12 +342,20 @@ static int indexOfYuvColor(QVideoFrame::PixelFormat format)
      return -1;
  }
  
@@ -1229,7 +1229,7 @@ index 81d5f60..51c4107 100644
              return i;
  
      return -1;
-@@ -417,13 +455,13 @@ GType QVideoSurfaceGstSink::get_type()
+@@ -388,13 +426,13 @@ GType QVideoSurfaceGstSink::get_type()
      if (type == 0) {
          static const GTypeInfo info =
          {
@@ -1245,7 +1245,7 @@ index 81d5f60..51c4107 100644
              0,                                                 // n_preallocs
              instance_init,                                     // instance_init
              0                                                  // value_table
-@@ -445,7 +483,11 @@ void QVideoSurfaceGstSink::class_init(gpointer g_class, gpointer class_data)
+@@ -419,7 +457,11 @@ void QVideoSurfaceGstSink::class_init(gpointer g_class, gpointer class_data)
      GstBaseSinkClass *base_sink_class = reinterpret_cast<GstBaseSinkClass *>(g_class);
      base_sink_class->get_caps = QVideoSurfaceGstSink::get_caps;
      base_sink_class->set_caps = QVideoSurfaceGstSink::set_caps;
@@ -1256,8 +1256,8 @@ index 81d5f60..51c4107 100644
 +#endif
      base_sink_class->start = QVideoSurfaceGstSink::start;
      base_sink_class->stop = QVideoSurfaceGstSink::stop;
-     // base_sink_class->unlock = QVideoSurfaceGstSink::unlock; // Not implemented.
-@@ -464,6 +506,18 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
+ 
+@@ -434,6 +476,18 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
  {
      static GstStaticPadTemplate sink_pad_template = GST_STATIC_PAD_TEMPLATE(
              "sink", GST_PAD_SINK, GST_PAD_ALWAYS, GST_STATIC_CAPS(
@@ -1276,7 +1276,7 @@ index 81d5f60..51c4107 100644
                      "video/x-raw-rgb, "
                      "framerate = (fraction) [ 0, MAX ], "
                      "width = (int) [ 1, MAX ], "
-@@ -472,6 +526,7 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
+@@ -442,6 +496,7 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
                      "framerate = (fraction) [ 0, MAX ], "
                      "width = (int) [ 1, MAX ], "
                      "height = (int) [ 1, MAX ]"));
@@ -1284,7 +1284,7 @@ index 81d5f60..51c4107 100644
  
      gst_element_class_add_pad_template(
              GST_ELEMENT_CLASS(g_class), gst_static_pad_template_get(&sink_pad_template));
-@@ -520,7 +575,11 @@ GstStateChangeReturn QVideoSurfaceGstSink::change_state(
+@@ -490,7 +545,11 @@ GstStateChangeReturn QVideoSurfaceGstSink::change_state(
              element, transition);
  }
  
@@ -1297,7 +1297,7 @@ index 81d5f60..51c4107 100644
  {
      VO_SINK(base);
  
-@@ -533,6 +592,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
+@@ -503,6 +562,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
      QList<QVideoFrame::PixelFormat> poolHandleFormats;
      sink->delegate->poolMutex()->lock();
      QGstBufferPoolInterface *pool = sink->delegate->pool();
@@ -1305,7 +1305,7 @@ index 81d5f60..51c4107 100644
      if (pool)
          poolHandleFormats = sink->delegate->supportedPixelFormats(pool->handleType());
      sink->delegate->poolMutex()->unlock();
-@@ -548,11 +608,19 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
+@@ -518,11 +578,19 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
  
          if (index != -1) {
              gst_caps_append_structure(caps, gst_structure_new(
@@ -1326,7 +1326,7 @@ index 81d5f60..51c4107 100644
                      NULL));
              continue;
          }
-@@ -562,7 +630,18 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
+@@ -532,7 +600,18 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
          for (int i = 0; i < count; ++i) {
              if (qt_rgbColorLookup[i].pixelFormat == format) {
                  GstStructure *structure = gst_structure_new(
@@ -1345,7 +1345,7 @@ index 81d5f60..51c4107 100644
                          "framerate" , GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX, 1,
                          "width"     , GST_TYPE_INT_RANGE, 1, INT_MAX,
                          "height"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
-@@ -583,6 +662,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
+@@ -553,6 +632,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
          }
      }
  
@@ -1353,7 +1353,7 @@ index 81d5f60..51c4107 100644
      return caps;
  }
  
-@@ -622,7 +702,7 @@ gboolean QVideoSurfaceGstSink::set_caps(GstBaseSink *base, GstCaps *caps)
+@@ -592,7 +672,7 @@ gboolean QVideoSurfaceGstSink::set_caps(GstBaseSink *base, GstCaps *caps)
          sink->lastRequestedCaps = 0;
  
  #ifdef DEBUG_VIDEO_SURFACE_SINK
@@ -1362,7 +1362,7 @@ index 81d5f60..51c4107 100644
          qDebug() << format;
          qDebug() << "bytesPerLine:" << bytesPerLine;
  #endif
-@@ -647,11 +727,49 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
+@@ -617,11 +697,49 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
      gst_structure_get_int(structure, "width", &size.rwidth());
      gst_structure_get_int(structure, "height", &size.rheight());
  
@@ -1412,7 +1412,7 @@ index 81d5f60..51c4107 100644
          if (index != -1) {
              pixelFormat = qt_yuvColorLookup[index].pixelFormat;
              bitsPerPixel = qt_yuvColorLookup[index].bitsPerPixel;
-@@ -677,6 +795,7 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
+@@ -647,6 +765,7 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
          if (index != -1)
              pixelFormat = qt_rgbColorLookup[index].pixelFormat;
      }
@@ -1420,7 +1420,7 @@ index 81d5f60..51c4107 100644
  
      if (pixelFormat != QVideoFrame::Format_Invalid) {
          QVideoSurfaceFormat format(size, pixelFormat, handleType);
-@@ -773,7 +892,11 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
+@@ -722,7 +841,11 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
  
      poolLock.unlock();
  
@@ -1432,7 +1432,7 @@ index 81d5f60..51c4107 100644
  
      if (gst_caps_is_empty (intersection)) {
          gst_caps_unref(intersection);
-@@ -814,7 +937,7 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
+@@ -763,7 +886,7 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
      QVideoSurfaceFormat surfaceFormat = sink->delegate->surfaceFormat();
  
      if (!pool->isFormatSupported(surfaceFormat)) {
@@ -1441,7 +1441,7 @@ index 81d5f60..51c4107 100644
          return GST_FLOW_OK;
      }
  
-@@ -838,7 +961,6 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
+@@ -787,7 +910,6 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
  gboolean QVideoSurfaceGstSink::start(GstBaseSink *base)
  {
      Q_UNUSED(base);
@@ -1449,23 +1449,11 @@ index 81d5f60..51c4107 100644
      return TRUE;
  }
  
-@@ -864,8 +986,9 @@ gboolean QVideoSurfaceGstSink::event(GstBaseSink *base, GstEvent *event)
-         VO_SINK(base);
-         sink->delegate->setLastPrerolledBuffer(0);
-     }
--
--    return TRUE;
-+#if GST_CHECK_VERSION(1, 0, 0)
-+    return GST_BASE_SINK_CLASS (sink_parent_class)->event (base, event);
-+#endif
- }
- 
- GstFlowReturn QVideoSurfaceGstSink::preroll(GstBaseSink *base, GstBuffer *buffer)
 diff --git a/src/multimedia/gsttools_headers/qgstappsrc_p.h b/src/multimedia/gsttools_headers/qgstappsrc_p.h
-index bfb038e..a188e18 100644
+index 4af9252..0e0fc0a 100644
 --- a/src/multimedia/gsttools_headers/qgstappsrc_p.h
 +++ b/src/multimedia/gsttools_headers/qgstappsrc_p.h
-@@ -47,7 +47,10 @@
+@@ -39,7 +39,10 @@
  
  #include <gst/gst.h>
  #include <gst/app/gstappsrc.h>
@@ -1477,10 +1465,10 @@ index bfb038e..a188e18 100644
  QT_BEGIN_NAMESPACE
  
 diff --git a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
-index 71ea2ff..879f071 100644
+index 34669b8..0f3b165 100644
 --- a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
 +++ b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
-@@ -55,8 +55,11 @@ class QGstreamerAudioProbeControl : public QMediaAudioProbeControl
+@@ -47,8 +47,11 @@ class QGstreamerAudioProbeControl : public QMediaAudioProbeControl
  public:
      explicit QGstreamerAudioProbeControl(QObject *parent);
      virtual ~QGstreamerAudioProbeControl();
@@ -1494,10 +1482,10 @@ index 71ea2ff..879f071 100644
  private slots:
      void bufferProbed();
 diff --git a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
-index c512b48..0a8a654 100644
+index 49064f9..fce6309 100644
 --- a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
 +++ b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
-@@ -56,7 +56,11 @@ public:
+@@ -48,7 +48,11 @@ public:
      explicit QGstreamerVideoProbeControl(QObject *parent);
      virtual ~QGstreamerVideoProbeControl();
  
@@ -1510,10 +1498,10 @@ index c512b48..0a8a654 100644
      void stopFlushing();
  
 diff --git a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h b/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
-index 45582d6..4440337 100644
+index 81e5764..c9fdb5c 100644
 --- a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
 +++ b/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
-@@ -112,7 +112,11 @@ private slots:
+@@ -104,7 +104,11 @@ private slots:
      void updateNativeVideoSize();
  
  private:
@@ -1526,10 +1514,10 @@ index 45582d6..4440337 100644
      GstElement *m_videoSink;
      WId m_windowId;
 diff --git a/src/multimedia/gsttools_headers/qgstutils_p.h b/src/multimedia/gsttools_headers/qgstutils_p.h
-index eea1e15..6369df7 100644
+index 65ff759..6015980 100644
 --- a/src/multimedia/gsttools_headers/qgstutils_p.h
 +++ b/src/multimedia/gsttools_headers/qgstutils_p.h
-@@ -70,7 +70,11 @@ namespace QGstUtils {
+@@ -73,7 +73,11 @@ namespace QGstUtils {
      QSize capsResolution(const GstCaps *caps);
      QSize capsCorrectedResolution(const GstCaps *caps);
      QAudioFormat audioFormatForCaps(const GstCaps *caps);
@@ -1542,10 +1530,10 @@ index eea1e15..6369df7 100644
      void initializeGst();
      QMultimedia::SupportEstimate hasSupport(const QString &mimeType,
 diff --git a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h b/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
-index 505a6c6..9bde1e0 100644
+index 1e0fda8..be48820 100644
 --- a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
 +++ b/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
-@@ -79,6 +79,9 @@ private:
+@@ -71,6 +71,9 @@ private:
      int m_bytesPerLine;
      MapMode m_mode;
      QVariant m_handle;
@@ -1556,10 +1544,10 @@ index 505a6c6..9bde1e0 100644
  
  QT_END_NAMESPACE
 diff --git a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h b/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
-index 7563f06..505ff39 100644
+index 11b305d..01935f7 100644
 --- a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
 +++ b/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
-@@ -146,7 +146,11 @@ private:
+@@ -131,7 +131,11 @@ private:
  
      static GstStateChangeReturn change_state(GstElement *element, GstStateChange transition);
  
@@ -1573,10 +1561,10 @@ index 7563f06..505ff39 100644
  
      static GstFlowReturn buffer_alloc(
 diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
-index e6d2421..00291ab 100644
+index 3098aab..9c54663 100644
 --- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
 +++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
-@@ -82,29 +82,42 @@ void QGstreamerAudioDecoderServicePlugin::updateSupportedMimeTypes() const
+@@ -74,29 +74,42 @@ void QGstreamerAudioDecoderServicePlugin::updateSupportedMimeTypes() const
      gst_init(NULL, NULL);
  
      GList *plugins, *orig_plugins;
@@ -1627,10 +1615,10 @@ index e6d2421..00291ab 100644
                              GstStaticPadTemplate *padtemplate = (GstStaticPadTemplate*)(pads->data);
                              pads = g_list_next (pads);
 diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
-index 9f1a765..dd6bd02 100644
+index f944a60..72d1cf1 100644
 --- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
 +++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
-@@ -454,21 +454,40 @@ QAudioBuffer QGstreamerAudioDecoderSession::read()
+@@ -446,21 +446,40 @@ QAudioBuffer QGstreamerAudioDecoderSession::read()
          if (buffersAvailable == 1)
              emit bufferAvailableChanged(false);
  
@@ -1673,7 +1661,7 @@ index 9f1a765..dd6bd02 100644
      }
  
      return audioBuffer;
-@@ -539,7 +558,12 @@ void QGstreamerAudioDecoderSession::addAppSink()
+@@ -531,7 +550,12 @@ void QGstreamerAudioDecoderSession::addAppSink()
  
      GstAppSinkCallbacks callbacks;
      memset(&callbacks, 0, sizeof(callbacks));
@@ -1686,7 +1674,7 @@ index 9f1a765..dd6bd02 100644
      gst_app_sink_set_callbacks(m_appSink, &callbacks, this, NULL);
      gst_app_sink_set_max_buffers(m_appSink, MAX_BUFFERS_IN_QUEUE);
      gst_base_sink_set_sync(GST_BASE_SINK(m_appSink), FALSE);
-@@ -565,8 +589,13 @@ void QGstreamerAudioDecoderSession::updateDuration()
+@@ -557,8 +581,13 @@ void QGstreamerAudioDecoderSession::updateDuration()
      gint64 gstDuration = 0;
      int duration = -1;
  
@@ -1701,22 +1689,22 @@ index 9f1a765..dd6bd02 100644
      if (m_duration != duration) {
          m_duration = duration;
 diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-index a835b1c..6bd3682 100644
+index a4038c5..9d1fdfa 100644
 --- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
 +++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-@@ -731,7 +731,11 @@ qint64 CameraBinSession::duration() const
-     GstFormat   format = GST_FORMAT_TIME;
-     gint64      duration = 0;
- 
+@@ -760,7 +760,11 @@ qint64 CameraBinSession::duration() const
+         if (fileSink) {
+             GstFormat format = GST_FORMAT_TIME;
+             gint64 duration = 0;
 +#if GST_CHECK_VERSION(1,0,0)
-+    if ( m_camerabin && gst_element_query_duration(m_camerabin, format, &duration))
++            bool ret = gst_element_query_duration(fileSink, format, &duration);
 +#else
-     if ( m_camerabin && gst_element_query_position(m_camerabin, &format, &duration))
+             bool ret = gst_element_query_position(fileSink, &format, &duration);
 +#endif
-         return duration / 1000000;
-     else
-         return 0;
-@@ -764,8 +768,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
+             gst_object_unref(GST_OBJECT(fileSink));
+             if (ret)
+                 return duration / 1000000;
+@@ -797,8 +801,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
  
      if (m_camerabin) {
          GstIterator *elements = gst_bin_iterate_all_by_interface(GST_BIN(m_camerabin), GST_TYPE_TAG_SETTER);
@@ -1730,7 +1718,7 @@ index a835b1c..6bd3682 100644
              gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
  
              QMapIterator<QByteArray, QVariant> it(data);
-@@ -826,7 +835,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -859,7 +868,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
      if (gm && GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) {
          if (m_captureMode == QCamera::CaptureStillImage &&
@@ -1742,7 +1730,7 @@ index a835b1c..6bd3682 100644
              st = gst_message_get_structure(gm);
  
              if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BUFFER)) {
-@@ -836,7 +849,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -869,7 +882,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
                      QImage img;
  
@@ -1754,7 +1742,7 @@ index a835b1c..6bd3682 100644
                      if (caps) {
                          GstStructure *structure = gst_caps_get_structure(caps, 0);
                          gint width = 0;
-@@ -1109,7 +1126,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
+@@ -1142,7 +1159,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
          gst_structure_remove_all_fields(structure);
          gst_structure_set_value(structure, "framerate", &rate);
      }
@@ -1766,7 +1754,7 @@ index a835b1c..6bd3682 100644
  
  
      for (uint i=0; i<gst_caps_get_size(caps); i++) {
-@@ -1229,7 +1250,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
+@@ -1262,7 +1283,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
          gst_structure_set_value(structure, "width", &w);
          gst_structure_set_value(structure, "height", &h);
      }
@@ -1836,10 +1824,10 @@ index 7649010..fce55ac 100644
  
  OTHER_FILES += \
 diff --git a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-index b9114c6..97d9203 100644
+index a2bd80d..d12e9a5 100644
 --- a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
 +++ b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-@@ -506,6 +506,11 @@ GstElement *QGstreamerCaptureSession::buildImageCapture()
+@@ -498,6 +498,11 @@ GstElement *QGstreamerCaptureSession::buildImageCapture()
      gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
      gst_object_unref(GST_OBJECT(pad));
  
@@ -1861,10 +1849,10 @@ index 2ca9377..b986fc7 100644
      mediaplayer.json
 -
 diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
-index 99c471b..deec236 100644
+index fed756a..8239710 100644
 --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
 +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
-@@ -527,6 +527,8 @@ void QGstreamerPlayerControl::processEOS()
+@@ -537,6 +537,8 @@ void QGstreamerPlayerControl::processEOS()
          m_session->showPrerollFrames(false); // stop showing prerolled frames in stop state
      }
  
@@ -1874,10 +1862,10 @@ index 99c471b..deec236 100644
  }
  
 diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
-index 854da46..2fd4345 100644
+index ce267d7..062de07 100644
 --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
 +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
-@@ -59,7 +59,11 @@
+@@ -51,7 +51,11 @@
  #include <private/qgstreamervideorenderer_p.h>
  
  #if defined(Q_WS_MAEMO_6) && defined(__arm__)
@@ -1890,7 +1878,7 @@ index 854da46..2fd4345 100644
  #endif
  
  #include "qgstreamerstreamscontrol.h"
-@@ -90,6 +94,9 @@ QGstreamerPlayerService::QGstreamerPlayerService(QObject *parent):
+@@ -82,6 +86,9 @@ QGstreamerPlayerService::QGstreamerPlayerService(QObject *parent):
  
  #if defined(Q_WS_MAEMO_6) && defined(__arm__)
      m_videoRenderer = new QGstreamerGLTextureRenderer(this);
@@ -1901,10 +1889,10 @@ index 854da46..2fd4345 100644
      m_videoRenderer = new QGstreamerVideoRenderer(this);
  #endif
 diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
-index a9052ca..7968799 100644
+index 7d20b6d..bf2f9f8 100644
 --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
 +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
-@@ -95,7 +95,11 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
+@@ -87,7 +87,11 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
      gst_init(NULL, NULL);
  
      GList *plugins, *orig_plugins;
@@ -1916,7 +1904,7 @@ index a9052ca..7968799 100644
  
      while (plugins) {
          GList *features, *orig_features;
-@@ -103,22 +107,33 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
+@@ -95,22 +99,33 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
          GstPlugin *plugin = (GstPlugin *) (plugins->data);
          plugins = g_list_next (plugins);
  
@@ -1957,10 +1945,10 @@ index a9052ca..7968799 100644
                              GstStaticPadTemplate *padtemplate = (GstStaticPadTemplate*)(pads->data);
                              pads = g_list_next (pads);
 diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
-index 87b71d7..03185a2 100644
+index 15924a6..8013d0d 100644
 --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
 +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
-@@ -93,6 +93,16 @@ typedef enum {
+@@ -85,6 +85,16 @@ typedef enum {
      GST_PLAY_FLAG_BUFFERING     = 0x000000100
  } GstPlayFlags;
  
@@ -1977,7 +1965,7 @@ index 87b71d7..03185a2 100644
  #define DEFAULT_RAW_CAPS \
      "video/x-raw-yuv; " \
      "video/x-raw-rgb; " \
-@@ -105,6 +115,8 @@ typedef enum {
+@@ -97,6 +107,8 @@ typedef enum {
      "text/x-pango-markup; " \
      "video/x-dvd-subpicture; " \
      "subpicture/x-pgs"
@@ -1986,7 +1974,7 @@ index 87b71d7..03185a2 100644
  static GstStaticCaps static_RawCaps = GST_STATIC_CAPS(DEFAULT_RAW_CAPS);
  
  QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
-@@ -145,8 +157,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
+@@ -137,8 +149,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
      gboolean result = gst_type_find_register(0, "playlist", GST_RANK_MARGINAL, playlistTypeFindFunction, 0, 0, this, 0);
      Q_ASSERT(result == TRUE);
      Q_UNUSED(result);
@@ -1999,7 +1987,7 @@ index 87b71d7..03185a2 100644
  
      if (m_playbin) {
          //GST_PLAY_FLAG_NATIVE_VIDEO omits configuration of ffmpegcolorspace and videoscale,
-@@ -196,7 +211,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
+@@ -188,7 +203,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
      m_videoIdentity = GST_ELEMENT(g_object_new(gst_video_connector_get_type(), 0)); // floating ref
      g_signal_connect(G_OBJECT(m_videoIdentity), "connection-failed", G_CALLBACK(insertColorSpaceElement), (gpointer)this);
  
@@ -2011,7 +1999,7 @@ index 87b71d7..03185a2 100644
      // might not get a parent, take ownership to avoid leak
      qt_gst_object_ref_sink(GST_OBJECT(m_colorSpace));
  
-@@ -214,7 +233,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
+@@ -206,7 +225,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
  
      // add ghostpads
      GstPad *pad = gst_element_get_static_pad(m_videoIdentity,"sink");
@@ -2020,7 +2008,7 @@ index 87b71d7..03185a2 100644
      gst_object_unref(GST_OBJECT(pad));
  
      if (m_playbin != 0) {
-@@ -226,7 +245,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
+@@ -218,7 +237,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
          g_object_set(G_OBJECT(m_playbin), "video-sink", m_videoOutputBin, NULL);
  
          g_signal_connect(G_OBJECT(m_playbin), "notify::source", G_CALLBACK(playbinNotifySource), this);
@@ -2029,7 +2017,7 @@ index 87b71d7..03185a2 100644
  
          if (usePlaybinVolume()) {
              updateVolume();
-@@ -350,9 +369,13 @@ qint64 QGstreamerPlayerSession::position() const
+@@ -342,9 +361,13 @@ qint64 QGstreamerPlayerSession::position() const
      GstFormat   format = GST_FORMAT_TIME;
      gint64      position = 0;
  
@@ -2044,7 +2032,7 @@ index 87b71d7..03185a2 100644
      return m_lastPosition;
  }
  
-@@ -482,9 +505,18 @@ bool QGstreamerPlayerSession::isAudioAvailable() const
+@@ -474,9 +497,18 @@ bool QGstreamerPlayerSession::isAudioAvailable() const
      return m_audioAvailable;
  }
  
@@ -2063,7 +2051,7 @@ index 87b71d7..03185a2 100644
  #ifdef DEBUG_PLAYBIN
      qDebug() << "block_pad_cb, blocked:" << blocked;
  #endif
-@@ -493,6 +525,7 @@ static void block_pad_cb(GstPad *pad, gboolean blocked, gpointer user_data)
+@@ -485,6 +517,7 @@ static void block_pad_cb(GstPad *pad, gboolean blocked, gpointer user_data)
          QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
          QMetaObject::invokeMethod(session, "finishVideoOutputChange", Qt::QueuedConnection);
      }
@@ -2071,7 +2059,7 @@ index 87b71d7..03185a2 100644
  }
  
  void QGstreamerPlayerSession::updateVideoRenderer()
-@@ -537,7 +570,7 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
+@@ -529,7 +562,7 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
      m_renderer = renderer;
  
  #ifdef DEBUG_VO_BIN_DUMP
@@ -2080,7 +2068,7 @@ index 87b71d7..03185a2 100644
                                    GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES*/),
                                    "playbin_set");
  #endif
-@@ -641,7 +674,11 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
+@@ -633,7 +666,11 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
  
          //block pads, async to avoid locking in paused state
          GstPad *srcPad = gst_element_get_static_pad(m_videoIdentity, "src");
@@ -2092,7 +2080,7 @@ index 87b71d7..03185a2 100644
          gst_object_unref(GST_OBJECT(srcPad));
  
          //Unpause the sink to avoid waiting until the buffer is processed
-@@ -682,7 +719,11 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
+@@ -674,7 +711,11 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
          //video output was change back to the current one,
          //no need to torment the pipeline, just unblock the pad
          if (gst_pad_is_blocked(srcPad))
@@ -2104,7 +2092,7 @@ index 87b71d7..03185a2 100644
  
          m_pendingVideoSink = 0;
          gst_object_unref(GST_OBJECT(srcPad));
-@@ -768,12 +809,17 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
+@@ -760,12 +801,17 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
  
      //don't have to wait here, it will unblock eventually
      if (gst_pad_is_blocked(srcPad))
@@ -2125,7 +2113,7 @@ index 87b71d7..03185a2 100644
                                    "playbin_finish");
  #endif
  }
-@@ -838,6 +884,7 @@ bool QGstreamerPlayerSession::play()
+@@ -830,6 +876,7 @@ bool QGstreamerPlayerSession::play()
  #ifdef DEBUG_PLAYBIN
      qDebug() << Q_FUNC_INFO;
  #endif
@@ -2133,7 +2121,7 @@ index 87b71d7..03185a2 100644
      m_everPlayed = false;
      if (m_playbin) {
          m_pendingState = QMediaPlayer::PlayingState;
-@@ -1335,8 +1382,11 @@ void QGstreamerPlayerSession::getStreamsInfo()
+@@ -1327,8 +1374,11 @@ void QGstreamerPlayerSession::getStreamsInfo()
          default:
              break;
          }
@@ -2146,7 +2134,7 @@ index 87b71d7..03185a2 100644
              gchar *languageCode = 0;
              if (gst_tag_list_get_string(tags, GST_TAG_LANGUAGE_CODE, &languageCode))
                  streamProperties[QMediaMetaData::Language] = QString::fromUtf8(languageCode);
-@@ -1375,7 +1425,11 @@ void QGstreamerPlayerSession::updateVideoResolutionTag()
+@@ -1367,7 +1417,11 @@ void QGstreamerPlayerSession::updateVideoResolutionTag()
      QSize aspectRatio;
  
      GstPad *pad = gst_element_get_static_pad(m_videoIdentity, "src");
@@ -2158,7 +2146,7 @@ index 87b71d7..03185a2 100644
  
      if (caps) {
          const GstStructure *structure = gst_caps_get_structure(caps, 0);
-@@ -1419,7 +1473,11 @@ void QGstreamerPlayerSession::updateDuration()
+@@ -1411,7 +1465,11 @@ void QGstreamerPlayerSession::updateDuration()
      gint64 gstDuration = 0;
      int duration = -1;
  
@@ -2170,7 +2158,7 @@ index 87b71d7..03185a2 100644
          duration = gstDuration / 1000000;
  
      if (m_duration != duration) {
-@@ -1475,7 +1533,11 @@ void QGstreamerPlayerSession::playbinNotifySource(GObject *o, GParamSpec *p, gpo
+@@ -1467,7 +1525,11 @@ void QGstreamerPlayerSession::playbinNotifySource(GObject *o, GParamSpec *p, gpo
  
      // The rest
      if (g_object_class_find_property(G_OBJECT_GET_CLASS(source), "extra-headers") != 0) {
@@ -2182,7 +2170,7 @@ index 87b71d7..03185a2 100644
  
          foreach (const QByteArray &rawHeader, self->m_request.rawHeaderList()) {
              if (rawHeader == userAgentString) // Filter User-Agent
-@@ -1630,7 +1692,11 @@ GstAutoplugSelectResult QGstreamerPlayerSession::handleAutoplugSelect(GstBin *bi
+@@ -1623,7 +1685,11 @@ GstAutoplugSelectResult QGstreamerPlayerSession::handleAutoplugSelect(GstBin *bi
      const gchar *factoryName = gst_plugin_feature_get_name(GST_PLUGIN_FEATURE(factory));
      if (g_str_has_prefix(factoryName, "vaapi")) {
          GstPad *sinkPad = gst_element_get_static_pad(session->m_videoSink, "sink");
@@ -2194,7 +2182,7 @@ index 87b71d7..03185a2 100644
  
  #if (GST_VERSION_MAJOR == 0) && ((GST_VERSION_MINOR < 10) || (GST_VERSION_MICRO < 33))
          if (!factory_can_src_any_caps(factory, sinkCaps))
-@@ -1659,14 +1725,19 @@ void QGstreamerPlayerSession::handleElementAdded(GstBin *bin, GstElement *elemen
+@@ -1652,14 +1718,19 @@ void QGstreamerPlayerSession::handleElementAdded(GstBin *bin, GstElement *elemen
          // Disable on-disk buffering.
          g_object_set(G_OBJECT(element), "temp-template", NULL, NULL);
      } else if (g_str_has_prefix(elementName, "uridecodebin") ||
@@ -2216,7 +2204,7 @@ index 87b71d7..03185a2 100644
          }
  
          //listen for queue2 element added to uridecodebin/decodebin2 as well.
-@@ -1734,7 +1805,27 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerVideoProbeControl* probe)
+@@ -1727,7 +1798,27 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerVideoProbeControl* probe)
      // Assume user releases any outstanding references to video frames.
  }
  
@@ -2245,7 +2233,7 @@ index 87b71d7..03185a2 100644
  {
      Q_UNUSED(pad);
  
-@@ -1749,6 +1840,7 @@ gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *bu
+@@ -1742,6 +1833,7 @@ gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *bu
  
      return TRUE;
  }
@@ -2253,7 +2241,7 @@ index 87b71d7..03185a2 100644
  
  void QGstreamerPlayerSession::addProbe(QGstreamerAudioProbeControl* probe)
  {
-@@ -1766,6 +1858,24 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerAudioProbeControl* probe)
+@@ -1759,6 +1851,24 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerAudioProbeControl* probe)
      m_audioProbes.removeOne(probe);
  }
  
@@ -2278,7 +2266,7 @@ index 87b71d7..03185a2 100644
  gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
  {
      Q_UNUSED(pad);
-@@ -1781,7 +1891,7 @@ gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstBuffer *bu
+@@ -1774,7 +1884,7 @@ gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstBuffer *bu
  
      return TRUE;
  }
@@ -2287,7 +2275,7 @@ index 87b71d7..03185a2 100644
  // This function is similar to stop(),
  // but does not set m_everPlayed, m_lastPosition,
  // and setSeekable() values.
-@@ -1814,7 +1924,11 @@ void QGstreamerPlayerSession::removeVideoBufferProbe()
+@@ -1807,7 +1917,11 @@ void QGstreamerPlayerSession::removeVideoBufferProbe()
  
      GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
      if (pad) {
@@ -2299,7 +2287,7 @@ index 87b71d7..03185a2 100644
          gst_object_unref(GST_OBJECT(pad));
      }
  
-@@ -1829,7 +1943,11 @@ void QGstreamerPlayerSession::addVideoBufferProbe()
+@@ -1822,7 +1936,11 @@ void QGstreamerPlayerSession::addVideoBufferProbe()
  
      GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
      if (pad) {
@@ -2311,7 +2299,7 @@ index 87b71d7..03185a2 100644
          gst_object_unref(GST_OBJECT(pad));
      }
  }
-@@ -1846,7 +1964,11 @@ void QGstreamerPlayerSession::removeAudioBufferProbe()
+@@ -1839,7 +1957,11 @@ void QGstreamerPlayerSession::removeAudioBufferProbe()
  
      GstPad *pad = gst_element_get_static_pad(m_audioSink, "sink");
      if (pad) {
@@ -2323,7 +2311,7 @@ index 87b71d7..03185a2 100644
          gst_object_unref(GST_OBJECT(pad));
      }
  
-@@ -1861,7 +1983,11 @@ void QGstreamerPlayerSession::addAudioBufferProbe()
+@@ -1854,7 +1976,11 @@ void QGstreamerPlayerSession::addAudioBufferProbe()
  
      GstPad *pad = gst_element_get_static_pad(m_audioSink, "sink");
      if (pad) {
@@ -2335,7 +2323,7 @@ index 87b71d7..03185a2 100644
          gst_object_unref(GST_OBJECT(pad));
      }
  }
-@@ -1894,7 +2020,7 @@ void QGstreamerPlayerSession::playlistTypeFindFunction(GstTypeFind *find, gpoint
+@@ -1887,7 +2013,7 @@ void QGstreamerPlayerSession::playlistTypeFindFunction(GstTypeFind *find, gpoint
          length = qMin(length, guint64(1024));
  
      while (length > 0) {
@@ -2345,10 +2333,10 @@ index 87b71d7..03185a2 100644
              session->m_isPlaylist = (QPlaylistFileParser::findPlaylistType(QString::fromUtf8(uri), 0, data, length) != QPlaylistFileParser::UNKNOWN);
              return;
 diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
-index 23e7031..707779b 100644
+index f2e760a..50bda3d 100644
 --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
 +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
-@@ -127,11 +127,19 @@ public:
+@@ -119,11 +119,19 @@ public:
  
      void addProbe(QGstreamerVideoProbeControl* probe);
      void removeProbe(QGstreamerVideoProbeControl* probe);
@@ -2368,7 +2356,7 @@ index 23e7031..707779b 100644
  
      void endOfMediaReset();
  
-@@ -260,6 +268,7 @@ private:
+@@ -252,6 +260,7 @@ private:
      bool m_isLiveSource;
  
      bool m_isPlaylist;
@@ -2377,5 +2365,5 @@ index 23e7031..707779b 100644
  
  QT_END_NAMESPACE
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch b/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
index 23c400c..1654e00 100644
--- a/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
+++ b/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
@@ -1,4 +1,4 @@
-From 5b6ff7fc6a102c9dc00ba947efbe000f34addbd5 Mon Sep 17 00:00:00 2001
+From b5c058f62a79efa213e4492ac7209b3a92f45e3b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 5 Jul 2014 09:10:02 +0200
 Subject: [PATCH 2/2] qtmultimedia.pro: Respect
@@ -49,5 +49,5 @@ index 109dd81..54b67a8 100644
              cache(GST_VERSION, set, gstver);
              # Force a re-run of the test
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtmultimedia_5.3.2.bb b/recipes-qt/qt5/qtmultimedia_5.3.2.bb
deleted file mode 100644
index 658a630..0000000
--- a/recipes-qt/qt5/qtmultimedia_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "5ef68e85b9d32865a4bf7f491ff31f96"
-SRC_URI[sha256sum] = "255fac66c93f33743c707da3d41d95c7c562924fe4eb829cbb7b21b2274a0e0b"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtmultimedia_5.4.0.bb b/recipes-qt/qt5/qtmultimedia_5.4.0.bb
new file mode 100644
index 0000000..0fc982a
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "3a6a415813b54a54cf283a5e2906e012"
+SRC_URI[sha256sum] = "5ab9dba27ae64123f2d0124b6884da276d8982aa959d65aa44125f758ef9af51"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 65a83a0..9bfad28 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "59f2bf186400241c62a02044265d9ecab81c1749"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquick1.inc b/recipes-qt/qt5/qtquick1.inc
index a9ec211..e507636 100644
--- a/recipes-qt/qt5/qtquick1.inc
+++ b/recipes-qt/qt5/qtquick1.inc
@@ -2,3 +2,6 @@ require qt5.inc
 
 DEPENDS += "qtscript qtsvg qtxmlpatterns qtwebkit"
 # qttools
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquick1_5.3.2.bb b/recipes-qt/qt5/qtquick1_5.3.2.bb
deleted file mode 100644
index dfc08cf..0000000
--- a/recipes-qt/qt5/qtquick1_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "3a57c52d6d4d6632d67a4ebd35abe0c5"
-SRC_URI[sha256sum] = "9b7b2e895180e4e3e1ed4e7b5ad049b7d021a05c96be6edc5fc433c6de6273fb"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquick1_5.4.0.bb b/recipes-qt/qt5/qtquick1_5.4.0.bb
new file mode 100644
index 0000000..8ea6d6e
--- /dev/null
+++ b/recipes-qt/qt5/qtquick1_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "c1c5b1072137773d308c8b498cf35d05"
+SRC_URI[sha256sum] = "d5a8b77c1c4832383f3c5a39c6dc60e992e61e684e7fbbdf9a208c31d9d032dc"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 54cc990..5b24af5 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "1f92491bd95abc642dcd882846884a5271c8ba16"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquickcontrols.inc b/recipes-qt/qt5/qtquickcontrols.inc
index 2ced3c2..89bda5e 100644
--- a/recipes-qt/qt5/qtquickcontrols.inc
+++ b/recipes-qt/qt5/qtquickcontrols.inc
@@ -3,3 +3,6 @@ require qt5.inc
 DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.3.2.bb b/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
deleted file mode 100644
index 575bf16..0000000
--- a/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "05f490fd6a7d3bca0c4d4a59989daef0"
-SRC_URI[sha256sum] = "5f890f014d087141b0aaa8954b21b1f85740233b60a556e0e9624227bff6d94e"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.4.0.bb b/recipes-qt/qt5/qtquickcontrols_5.4.0.bb
new file mode 100644
index 0000000..e70b843
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "6d2b408526b6197ff2edc32ac3238252"
+SRC_URI[sha256sum] = "b59f43333291c3e73f9a9f92706a4c98d4d810b4efd6803a4edd3f1658fae61e"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 2e3b8b3..aba3d57 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "3704a616dfabb71ebd3ffc64f8efe32931c82a8b"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtscript.inc b/recipes-qt/qt5/qtscript.inc
index bbb05a6..40e1d5c 100644
--- a/recipes-qt/qt5/qtscript.inc
+++ b/recipes-qt/qt5/qtscript.inc
@@ -1,3 +1,6 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtscript_5.3.2.bb b/recipes-qt/qt5/qtscript_5.3.2.bb
deleted file mode 100644
index 604e375..0000000
--- a/recipes-qt/qt5/qtscript_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "d0e70adf7c993f33bad27290dae778d5"
-SRC_URI[sha256sum] = "6e18002c8c993402c7d28b3c0705092e41c18769b6d3ff741e9a3b3ce9d6d7be"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtscript_5.4.0.bb b/recipes-qt/qt5/qtscript_5.4.0.bb
new file mode 100644
index 0000000..a4755bc
--- /dev/null
+++ b/recipes-qt/qt5/qtscript_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "b38b35643d85aea25ff1cbea84f76a82"
+SRC_URI[sha256sum] = "f5f35702ec36f24b17878348af1aa1ecf93056a9ddf475097b3fdd52c3330ed0"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 8ef7f1d..94ee7fd 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "2bb2ebef4c86c588c3041569ffb090041ffc6b04"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsensors.inc b/recipes-qt/qt5/qtsensors.inc
index b2147f1..3bd9289 100644
--- a/recipes-qt/qt5/qtsensors.inc
+++ b/recipes-qt/qt5/qtsensors.inc
@@ -1,3 +1,6 @@
 require qt5.inc
 
 DEPENDS += "qtbase qtdeclarative"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsensors_5.3.2.bb b/recipes-qt/qt5/qtsensors_5.3.2.bb
deleted file mode 100644
index cc4a0c5..0000000
--- a/recipes-qt/qt5/qtsensors_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "d0a8dc3173bfc9dc9f2632d509a76e6f"
-SRC_URI[sha256sum] = "f9359dc42fbd7105eec7a1fb866e90aa772fd694075e5a5691d1a31d08953ae4"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsensors_5.4.0.bb b/recipes-qt/qt5/qtsensors_5.4.0.bb
new file mode 100644
index 0000000..2484636
--- /dev/null
+++ b/recipes-qt/qt5/qtsensors_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "044f7d3f92c45dd76072077826ca4a07"
+SRC_URI[sha256sum] = "8a0f33ccf572b9fbcdc46fca602d75270979a2f851b6a1f399d039b1f7aae159"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 289b3d9..d0a347d 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "ff98a9a27a18e6a48afa705e5cd84bd9461ad554"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtserialport.inc b/recipes-qt/qt5/qtserialport.inc
index d559677..8bb168e 100644
--- a/recipes-qt/qt5/qtserialport.inc
+++ b/recipes-qt/qt5/qtserialport.inc
@@ -1,9 +1,11 @@
 require qt5.inc
 
-# whitespace change in LGPL_EXCEPTION.txt and a bit different formating in LICENSE.LGPL
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c \
-                    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
-                    file://LGPL_EXCEPTION.txt;md5=eb6c371255e1262c55ae9b652a90b528\
-"
-
 DEPENDS += "qtbase"
+
+# text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
+# other qt* components use :/
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=eb6c371255e1262c55ae9b652a90b528 \
+                    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa"
diff --git a/recipes-qt/qt5/qtserialport_5.3.2.bb b/recipes-qt/qt5/qtserialport_5.3.2.bb
deleted file mode 100644
index 1f1126d..0000000
--- a/recipes-qt/qt5/qtserialport_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "0a38cfe5c81364f2b93d0d38b94d375f"
-SRC_URI[sha256sum] = "a886e0cb08be60e57958676dc91c6f649468184a03c89c2aeabc904d36fd5a4b"
diff --git a/recipes-qt/qt5/qtserialport_5.4.0.bb b/recipes-qt/qt5/qtserialport_5.4.0.bb
new file mode 100644
index 0000000..3058fdd
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "691b0b71e4ad791a37e288b41979662c"
+SRC_URI[sha256sum] = "0fc619ef714f5b920ff19ec811b6459c849fafcc697ef4091dbb74e45bd058c3"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index f3807af..adafefb 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -2,11 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "ab51ad6a5f4e533c31bd8e5b6f16a3bcd09a3ee6"
-
-# text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
-# other qt* components use :/
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=eb6c371255e1262c55ae9b652a90b528 \
-                    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa"
diff --git a/recipes-qt/qt5/qtsvg.inc b/recipes-qt/qt5/qtsvg.inc
index bbb05a6..40e1d5c 100644
--- a/recipes-qt/qt5/qtsvg.inc
+++ b/recipes-qt/qt5/qtsvg.inc
@@ -1,3 +1,6 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsvg_5.3.2.bb b/recipes-qt/qt5/qtsvg_5.3.2.bb
deleted file mode 100644
index 286cd92..0000000
--- a/recipes-qt/qt5/qtsvg_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "f7972e80970ff26a908c43defb3d10e6"
-SRC_URI[sha256sum] = "1ec5c2f307ee55740cc8c82dc2ca4037dbc0ca398b4e32abbd967535e71ae30f"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsvg_5.4.0.bb b/recipes-qt/qt5/qtsvg_5.4.0.bb
new file mode 100644
index 0000000..6b12200
--- /dev/null
+++ b/recipes-qt/qt5/qtsvg_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "1c9921a44060bd98096b105c97556e68"
+SRC_URI[sha256sum] = "68ee762bacc7b63aea29f446549ee6daae46e6fe2120e2460f30d47accc2b789"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index e2c0410..7940ee5 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "78dcdd807c06009460a949a7015b63f0f75ac61b"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsystems.inc b/recipes-qt/qt5/qtsystems.inc
index 4170eb2..cd2438f 100644
--- a/recipes-qt/qt5/qtsystems.inc
+++ b/recipes-qt/qt5/qtsystems.inc
@@ -2,9 +2,13 @@ require qt5.inc
 
 DEPENDS += "qtbase qtdeclarative udev bluez4 gconf"
 
-LICENSE = "BSD & LGPL-2.1 & GFDL-1.3"
-
 do_install_append() {
     # Remove example.pro file as it is useless
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
 }
+
+LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsystems_5.3.2+git.bb b/recipes-qt/qt5/qtsystems_5.3.2+git.bb
deleted file mode 100644
index a99a91b..0000000
--- a/recipes-qt/qt5/qtsystems_5.3.2+git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require qt5-git.inc
-require ${PN}.inc
-
-# LICENSE files are missing in 5.0.0
-LIC_FILES_CHKSUM = "file://${S}/src/imports/systeminfo/qsysteminfo.cpp;endline=40;md5=f28e1baba502dda6849d69d5c24e7356 \
-                    file://${S}/examples/systeminfo/qml-storageinfo/content/ProgressBar.qml;endline=39;md5=5213e8171c07d54db7107f29ac2f7b5e \
-                    file://${S}/doc/src/systeminfo/systeminfo.qdoc;endline=26;md5=757f4eda130ceff3ca0985dde715af07 \
-"
-
-# this wasn't released, the PV is set just to signify that this SRCREV was tested together
-# with 5.3.2 version of other modules
-PV = "5.3.2"
-DEFAULT_PREFERENCE = "1"
-
-QT_MODULE_BRANCH = "5.3"
-
-# qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
-# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.3.2
-
-SRCREV = "aa651c73bf7bc57c1b6b1bfcfa9afe901884a102"
diff --git a/recipes-qt/qt5/qtsystems_5.4.0+git.bb b/recipes-qt/qt5/qtsystems_5.4.0+git.bb
new file mode 100644
index 0000000..5814cf7
--- /dev/null
+++ b/recipes-qt/qt5/qtsystems_5.4.0+git.bb
@@ -0,0 +1,14 @@
+require qt5-git.inc
+require ${PN}.inc
+
+# this wasn't released, the PV is set just to signify that this SRCREV was tested together
+# with 5.4.0 version of other modules
+PV = "5.4.0"
+DEFAULT_PREFERENCE = "1"
+
+QT_MODULE_BRANCH = "dev"
+
+# qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
+# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.4.0
+
+SRCREV = "44f70d99a2ecd5f3f320650461f1d69142d11bcc"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 4762d8f..320bc7f 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -7,8 +7,3 @@ QT_MODULE_BRANCH = "dev"
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.4
 
 SRCREV = "3a0216301ad1338126abb326e8e4c22c6ea12f40"
-
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools-native.inc b/recipes-qt/qt5/qttools-native.inc
index 28fa3f8..03b88cd 100644
--- a/recipes-qt/qt5/qttools-native.inc
+++ b/recipes-qt/qt5/qttools-native.inc
@@ -13,9 +13,3 @@ do_configure() {
 do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools-native_5.3.2.bb b/recipes-qt/qt5/qttools-native_5.3.2.bb
deleted file mode 100644
index 3efed85..0000000
--- a/recipes-qt/qt5/qttools-native_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
-SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
diff --git a/recipes-qt/qt5/qttools_5.3.2.bb b/recipes-qt/qt5/qttools-native_5.4.0.bb
similarity index 100%
rename from recipes-qt/qt5/qttools_5.3.2.bb
rename to recipes-qt/qt5/qttools-native_5.4.0.bb
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index ceb972b..7c6905a 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -2,8 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "7e7d549d26028ff407a9a3d260955f95b403a406"
-
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools.inc b/recipes-qt/qt5/qttools.inc
index cd8a97f..8c97e24 100644
--- a/recipes-qt/qt5/qttools.inc
+++ b/recipes-qt/qt5/qttools.inc
@@ -7,12 +7,6 @@ SRC_URI += " \
     file://0003-add-noqtwebkit-configuration.patch \
 "
 
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
-
 FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
 
 PACKAGECONFIG ??= ""
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 5cebe25..e4ad221 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 7bd3f1feea0ec1121a73faa1214e72702954b317 Mon Sep 17 00:00:00 2001
+From ff3f521648906d07ddc1e1aecaddadb95b0314f3 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
@@ -11,23 +11,24 @@ Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- examples/examples.pro     |  4 ++--
+ examples/examples.pro     |  3 ++-
  src/designer/src/src.pro  | 16 +++++++++-------
  src/linguist/linguist.pro |  2 +-
  src/src.pro               | 14 ++++++++------
  tests/auto/auto.pro       | 24 +++++++++++++-----------
- 5 files changed, 33 insertions(+), 27 deletions(-)
+ 5 files changed, 33 insertions(+), 26 deletions(-)
 
 diff --git a/examples/examples.pro b/examples/examples.pro
-index 4955969..8e86419 100644
+index 69365d1..da7b38b 100644
 --- a/examples/examples.pro
 +++ b/examples/examples.pro
-@@ -1,3 +1,3 @@
+@@ -1,4 +1,5 @@
  TEMPLATE = subdirs
 -qtHaveModule(widgets): SUBDIRS += help designer linguist uitools assistant
--
 +!linguistonly:qtHaveModule(widgets): SUBDIRS += help designer assistant
 +qtHaveModule(widgets): SUBDIRS += linguist uitools
+ 
+ winrt: SUBDIRS -= assistant designer
 diff --git a/src/designer/src/src.pro b/src/designer/src/src.pro
 index e02ca8e..49527c5 100644
 --- a/src/designer/src/src.pro
@@ -74,7 +75,7 @@ index 3a70580..a977878 100644
  qtNomakeTools( \
      linguist \
 diff --git a/src/src.pro b/src/src.pro
-index a486d65..3aeac1e 100644
+index 722b32e..9453152 100644
 --- a/src/src.pro
 +++ b/src/src.pro
 @@ -4,10 +4,12 @@ qtHaveModule(widgets) {
@@ -110,14 +111,14 @@ index a486d65..3aeac1e 100644
 +!linguistonly:qtHaveModule(dbus): SUBDIRS += qdbus
  
  win32|winrt:SUBDIRS += windeployqt
- winrt:SUBDIRS += winrtrunner qtd3dservice
+ winrt:SUBDIRS += winrtrunner
 -qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
 +!linguistonly:qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
  
  qtNomakeTools( \
      pixeltool \
 diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
-index c3acfe3..f2f88f7 100644
+index df240e3..27ee687 100644
 --- a/tests/auto/auto.pro
 +++ b/tests/auto/auto.pro
 @@ -1,15 +1,17 @@
@@ -150,5 +151,5 @@ index c3acfe3..f2f88f7 100644
  installed_cmake.depends = cmake
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index d25904e..5cc317c 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From a74f00b2a64dde326a78f7523f875d7e14ee45f5 Mon Sep 17 00:00:00 2001
+From 20dd8d70eb3db17173eb3965e757711cc694de2a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 98a0bc6..bf5957b 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 7388296f5219725801aeb9d8b0a2f4ba01a7ca6d Mon Sep 17 00:00:00 2001
+From 1d8bf41acc2235528f1d08505cf2dc8afd793aef Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qttools_5.4.0.bb b/recipes-qt/qt5/qttools_5.4.0.bb
new file mode 100644
index 0000000..f9384e9
--- /dev/null
+++ b/recipes-qt/qt5/qttools_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "3de5923257b365526856094d7da0ad85"
+SRC_URI[sha256sum] = "5a85a096ffd30463781dc3871ad9640a510eba0086188c7943d23adc3660741a"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index ceb972b..7c6905a 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -2,8 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "7e7d549d26028ff407a9a3d260955f95b403a406"
-
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland-native.inc b/recipes-qt/qt5/qtwayland-native.inc
index bddcc22..95deeb7 100644
--- a/recipes-qt/qt5/qtwayland-native.inc
+++ b/recipes-qt/qt5/qtwayland-native.inc
@@ -4,6 +4,9 @@ QT_MODULE = "${BPN}"
 
 DEPENDS = "qtbase-native wayland-native"
 
+SRC_URI[md5sum] = "736fddb5f2018d57c8439455df9ec4dc"
+SRC_URI[sha256sum] = "601ef7f2e9145a084da34ff06dfa77577c4a792a639581d3bbb7417e8cd36f29"
+
 SRC_URI += " \
     file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch \
 "
@@ -16,7 +19,7 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-# older copyright year than what e.g. qtbase is using now
+LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
                     file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
diff --git a/recipes-qt/qt5/qtwayland-native_5.3.2+git.bb b/recipes-qt/qt5/qtwayland-native_5.3.2+git.bb
deleted file mode 100644
index e780810..0000000
--- a/recipes-qt/qt5/qtwayland-native_5.3.2+git.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require qt5-git.inc
-require ${PN}.inc
-
-SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
-
-# this wasn't released, the PV is set just to signify that this SRCREV was tested together
-# with 5.3.2 version of other modules
-PV = "5.3.2"
-DEFAULT_PREFERENCE = "1"
diff --git a/recipes-qt/qt5/qtwayland-native_5.4.0.bb b/recipes-qt/qt5/qtwayland-native_5.4.0.bb
new file mode 100644
index 0000000..c2a4453
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland-native_5.4.0.bb
@@ -0,0 +1,2 @@
+require qt5-${PV}.inc
+require ${PN}.inc
diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
index dc6be23..2f1cf2d 100644
--- a/recipes-qt/qt5/qtwayland.inc
+++ b/recipes-qt/qt5/qtwayland.inc
@@ -25,7 +25,7 @@ FILES_${PN}-plugins-dbg += " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
 "
 
-# older copyright year than what e.g. qtbase is using now
+LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
                     file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index e224e55..ae3d998 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From fd79724a05ee7fb52d8ac1b02057e7a1ba4efb14 Mon Sep 17 00:00:00 2001
+From 99c49a3304c1d08d164e0df252ca85f426381bb7 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -28,5 +28,5 @@ index ac2d07b..7a46a24 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtwayland/0001-examples.pro-include-server-buffer-only-when-buildin.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
similarity index 62%
rename from recipes-qt/qt5/qtwayland/0001-examples.pro-include-server-buffer-only-when-buildin.patch
rename to recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 1b46f9b..664fa3f 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples.pro-include-server-buffer-only-when-buildin.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,22 +1,22 @@
-From 6e554b116bfe57744a3de02370fd96b9ea13ecb2 Mon Sep 17 00:00:00 2001
+From cd1e17e8c6082fe8578d64baaff55f1f00c0f7a0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
-Subject: [PATCH] examples.pro: include server-buffer only when building with
- opengles2
+Subject: [PATCH] examples/wayland: include server-buffer only when building
+ with opengles2
 
 * it's using glBindBuffer in
   server-buffer/client/serverbufferrenderer.cpp
 
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Change-Id: I8412dfd4ebb95c147328ac6e4dfff14a0cff4e78
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- examples/examples.pro | 4 +++-
+ examples/wayland/wayland.pro | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/examples/examples.pro b/examples/examples.pro
+diff --git a/examples/wayland/wayland.pro b/examples/wayland/wayland.pro
 index d633fb9..643c7cd 100644
---- a/examples/examples.pro
-+++ b/examples/examples.pro
+--- a/examples/wayland/wayland.pro
++++ b/examples/wayland/wayland.pro
 @@ -9,5 +9,7 @@ contains(CONFIG, wayland-compositor) {
          SUBDIRS += qml-compositor
      }
@@ -27,5 +27,5 @@ index d633fb9..643c7cd 100644
 +    }
  }
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtwayland_5.3.2+git.bb b/recipes-qt/qt5/qtwayland_5.4.0.bb
similarity index 57%
rename from recipes-qt/qt5/qtwayland_5.3.2+git.bb
rename to recipes-qt/qt5/qtwayland_5.4.0.bb
index bfbeab1..99d9ba5 100644
--- a/recipes-qt/qt5/qtwayland_5.3.2+git.bb
+++ b/recipes-qt/qt5/qtwayland_5.4.0.bb
@@ -1,18 +1,13 @@
-require qt5-git.inc
+require qt5-${PV}.inc
 require ${PN}.inc
 
-SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
+SRC_URI[md5sum] = "736fddb5f2018d57c8439455df9ec4dc"
+SRC_URI[sha256sum] = "601ef7f2e9145a084da34ff06dfa77577c4a792a639581d3bbb7417e8cd36f29"
 
 SRC_URI += " \
-    file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
+    file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
-
-# this wasn't released, the PV is set just to signify that this SRCREV was tested together
-# with 5.3.2 version of other modules
-PV = "5.3.2"
-DEFAULT_PREFERENCE = "1"
-
-QT_VERSION ?= "5.3.0"
+QT_VERSION ?= "5.4.0"
 
 do_install_append() {
     # do install files created by qtwaylandscanner
diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
index 940fdfb..525e657 100644
--- a/recipes-qt/qt5/qtwebengine.inc
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -1,8 +1,8 @@
 SUMMARY = "QtWebEngine combines the power of Chromium and Qt"
 LICENSE = "LGPL-2.1 & BSD"
 LIC_FILES_CHKSUM = " \
-  file://src/core/browser_context_qt.cpp;md5=c23e24b6a534c8b6cc879a397b35db29;beginline=1;endline=40 \
-  file://src/3rdparty/chromium/LICENSE;md5=d2d164565cc10f298390174d9cb6d18d \
+  file://src/core/browser_context_qt.cpp;md5=91895ac1852e1b07202d9716194e8dd8;beginline=1;endline=35 \
+  file://src/3rdparty/chromium/LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5 \
 "
 DEPENDS += " \
     ninja-native \
@@ -23,8 +23,6 @@ inherit perlnative
 
 require recipes-qt/qt5/qt5.inc
 
-S = "${WORKDIR}/git"
-
 # To avoid trouble start with not separated build directory
 SEPB = "${S}"
 B = "${SEPB}"
@@ -32,6 +30,8 @@ B = "${SEPB}"
 # Project ERROR: Missing CMake tests. Either create tests in tests/auto/cmake, or disable cmake config file creation with CONFIG-=create_cmake.
 EXTRA_QMAKEVARS_POST += "CONFIG-=create_cmake"
 
+export NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja"
+
 do_configure() {
     # replace LD with CXX, to workaround a possible gyp inheritssue?
     LD="${CXX}" export LD
@@ -42,7 +42,7 @@ do_configure() {
 
     # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
     # arguments here
-    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} QTWEBENGINE_ROOT="${S}" NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja" \
+    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} QTWEBENGINE_ROOT="${S}" \
         QMAKE_CXX="${OE_QMAKE_CXX}" QMAKE_CC="${OE_QMAKE_CC}" \
         QMAKE_LINK="${OE_QMAKE_LINK}" \
         QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
diff --git a/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch b/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
deleted file mode 100644
index 915d3e8..0000000
--- a/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a6802bc4528205a9d3839a1f22d4fca32154f5f0 Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Fri, 20 Jun 2014 09:09:12 +0200
-Subject: [PATCH 1/6] Use ninja supplied by environment variable NINJA_PATH
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
----
- tools/qmake/mkspecs/features/functions.prf | 14 ++------------
- 1 file changed, 2 insertions(+), 12 deletions(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 4dcd8ed..8725fd2 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -84,16 +84,6 @@ defineReplace(which) {
- }
- 
- defineReplace(findOrBuildNinja) {
--    git_chromium_src_dir = $$system("git config qtwebengine.chromiumsrcdir")
--    # Fall back to the snapshot path if git does not know about chromium sources (i.e. init-repository.py has not been used)
--    isEmpty(git_chromium_src_dir): git_chromium_src_dir = "src/3rdparty/chromium"
--
--    out = $$absolute_path("$$git_chromium_src_dir/../ninja/ninja", "$$QTWEBENGINE_ROOT")
--    win32: out = $$system_path($${out}.exe)
--
--    # If we did not find ninja, then we bootstrap it.
--    !exists($$out) {
--        system("python $$dirname(out)/bootstrap.py")
--    }
--    return($$out)
-+    message(Using ninja from path $$NINJA_PATH)
-+    return($$NINJA_PATH)
- }
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch
deleted file mode 100644
index abd351a..0000000
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 0c59430e6b919d4ffec80bfa6b50b9ce9953ac21 Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Fri, 20 Jun 2014 09:05:12 +0200
-Subject: [PATCH 1/2] <chromium> Drop build time only dependency on x11
- libraries
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- chromium/build/linux/system.gyp | 114 ----------------------------------------
- 1 file changed, 114 deletions(-)
-
-diff --git a/src/3rdparty/chromium/build/linux/system.gyp b/src/3rdparty/chromium/build/linux/system.gyp
-index 9911317..85016b8 100644
---- a/src/3rdparty/chromium/build/linux/system.gyp
-+++ b/src/3rdparty/chromium/build/linux/system.gyp
-@@ -786,119 +786,5 @@
-         }],
-       ],
-     },
--    {
--      'target_name': 'x11',
--      'type': 'none',
--      'toolsets': ['host', 'target'],
--      'conditions': [
--        ['_toolset=="target"', {
--          'direct_dependent_settings': {
--            'cflags': [
--              '<!@(<(pkg-config) --cflags x11)',
--            ],
--          },
--          'link_settings': {
--            'ldflags': [
--              '<!@(<(pkg-config) --libs-only-L --libs-only-other x11 xi)',
--            ],
--            'libraries': [
--              '<!@(<(pkg-config) --libs-only-l x11 xi)',
--            ],
--          },
--        }, {
--          'direct_dependent_settings': {
--            'cflags': [
--              '<!@(pkg-config --cflags x11)',
--            ],
--          },
--          'link_settings': {
--            'ldflags': [
--              '<!@(pkg-config --libs-only-L --libs-only-other x11 xi)',
--            ],
--            'libraries': [
--              '<!@(pkg-config --libs-only-l x11 xi)',
--            ],
--          },
--        }],
--      ],
--    },
--    {
--      'target_name': 'xext',
--      'type': 'none',
--      'conditions': [
--        ['_toolset=="target"', {
--          'direct_dependent_settings': {
--            'cflags': [
--              '<!@(<(pkg-config) --cflags xext)',
--            ],
--          },
--          'link_settings': {
--            'ldflags': [
--              '<!@(<(pkg-config) --libs-only-L --libs-only-other xext)',
--            ],
--            'libraries': [
--              '<!@(<(pkg-config) --libs-only-l xext)',
--            ],
--          },
--        }],
--      ],
--    },
--    {
--      'target_name': 'xfixes',
--      'type': 'none',
--      'conditions': [
--        ['_toolset=="target"', {
--          'direct_dependent_settings': {
--            'cflags': [
--              '<!@(<(pkg-config) --cflags xfixes)',
--            ],
--          },
--          'link_settings': {
--            'ldflags': [
--              '<!@(<(pkg-config) --libs-only-L --libs-only-other xfixes)',
--            ],
--            'libraries': [
--              '<!@(<(pkg-config) --libs-only-l xfixes)',
--            ],
--          },
--        }],
--      ],
--    },
--    {
--      'target_name': 'xrandr',
--      'type': 'none',
--      'toolsets': ['host', 'target'],
--      'conditions': [
--        ['_toolset=="target"', {
--          'direct_dependent_settings': {
--            'cflags': [
--              '<!@(<(pkg-config) --cflags xrandr)',
--            ],
--          },
--          'link_settings': {
--            'ldflags': [
--              '<!@(<(pkg-config) --libs-only-L --libs-only-other xrandr)',
--            ],
--            'libraries': [
--              '<!@(<(pkg-config) --libs-only-l xrandr)',
--            ],
--          },
--        }, {
--          'direct_dependent_settings': {
--            'cflags': [
--              '<!@(pkg-config --cflags xrandr)',
--            ],
--          },
--          'link_settings': {
--            'ldflags': [
--              '<!@(pkg-config --libs-only-L --libs-only-other xrandr)',
--            ],
--            'libraries': [
--              '<!@(pkg-config --libs-only-l xrandr)',
--            ],
--          },
--        }],
--      ],
--    },
-   ],
- }
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
similarity index 80%
rename from recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
rename to recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index d043714..4587219 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,8 +1,8 @@
-From 7266e333c6568fec1e2ebbf0c2d68c4025397b2d Mon Sep 17 00:00:00 2001
+From 41f9b2c1521950e1e3e1f01260f18e698d948814 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 2/6] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
- anywhere in patch, but at the end
+Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+ anywhere in path, but at the end
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 8725fd2..15c2941 100644
+index acf15a8..08b2642 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -40,8 +40,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -84,8 +84,8 @@ defineReplace(findIncludedMocFiles) {
  defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
@@ -25,5 +25,5 @@ index 8725fd2..15c2941 100644
  }
  
 -- 
-2.1.1
+2.1.3
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch
deleted file mode 100644
index 0cbe7aa..0000000
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From faaba972642f1966b4e38394b022d79de114c71e Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Fri, 20 Jun 2014 19:04:14 +0200
-Subject: [PATCH 2/2] <chromium> Strip unwanted "@echo compiling &&" prefix
- from ${CC}
-
-Causes problems when called from a perl script:
-
-@echo compiling  && arm-webos-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon --sysroot=/home/morphis/work/wop/webos-ports/tmp-eglibc/sysroots/tenderloinCan't exec "@echo": No such file or directory at /home/morphis/work/wop/webos-ports/tmp-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/IPC/Open3.pm line 288.
-open2: exec of @echo compiling && arm-webos-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon --sysroot=/home/morphis/work/wop/webos-ports/tmp-eglibc/sysroots/tenderloin -E -P -x c++ -DENABLE_CUSTOM_SCHEME_HANDLER=0 -DENABLE_SVG_FONTS=1 -DENABLE_GDI_FONTS_ON_WINDOWS=0 -DENABLE_HARFBUZZ_ON_WINDOWS=1 -DWTF_USE_CONCATENATED_IMPULSE_RESPONSES=1 -DENABLE_INPUT_SPEECH=1 -DENABLE_INPUT_MULTIPLE_FIELDS_UI=1 -DENABLE_LEGACY_NOTIFICATIONS=1 -DENABLE_MEDIA_CAPTURE=0 -DENABLE_NAVIGATOR_CONTENT_UTILS=1 -DENABLE_ORIENTATION_EVENTS=0 -DENABLE_WEB_AUDIO=1 -DWTF_USE_WEBAUDIO_FFMPEG=1 -DENABLE_OPENTYPE_VERTICAL=1 -DWTF_USE_DEFAULT_RENDER_THEME=1 css/html.css failed at ../build/scripts/preprocessor.pm line 81
-Traceback (most recent call last):
-  File "../build/scripts/action_useragentstylesheets.py", line 124, in <module>
-    sys.exit(main(sys.argv))
-  File "../build/scripts/action_useragentstylesheets.py", line 118, in main
-    assert returnCode == 0
-AssertionError
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- .../WebKit/Source/build/scripts/action_useragentstylesheets.py         | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/action_useragentstylesheets.py b/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/action_useragentstylesheets.py
-index c0712b3..8460637 100644
---- a/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/action_useragentstylesheets.py
-+++ b/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/action_useragentstylesheets.py
-@@ -112,6 +112,9 @@ def main(args):
-     command.extend([outputH, outputCpp])
-     command.extend(styleSheets)
- 
-+    if os.environ["CC"].startswith("@echo"):
-+        os.environ["CC"] = os.environ["CC"].replace("@echo compiling  &&", "")
-+
-     # Do it. check_call is new in 2.5, so simulate its behavior with call and
-     # assert.
-     returnCode = subprocess.call(command)
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
new file mode 100644
index 0000000..58218a5
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -0,0 +1,29 @@
+From b36aeace50dc429cccbb9b84a6e538ebcd12ade9 Mon Sep 17 00:00:00 2001
+From: Simon Busch <morphis@gravedo.de>
+Date: Tue, 18 Nov 2014 10:38:18 +0100
+Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
+ generate it's moc'ed abbreviation
+
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/functions.prf | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index 08b2642..0123336 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -82,7 +82,8 @@ defineReplace(findIncludedMocFiles) {
+ }
+ 
+ defineReplace(mocOutput) {
+-  out = $$1
++  in = $$1
++  out = $$basename(in)
+   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
+   out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
+   out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
+-- 
+2.1.3
+
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch
deleted file mode 100644
index 1cf1242..0000000
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 9ad77853050ccd2102fe4c9ad0671b82554ce4c1 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH] base.gypi: include atomicops_internals_x86_gcc.cc when
- building for x64 arch
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- chromium/base/base.gypi | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
-index a5a990a..af30cfa 100644
---- a/src/3rdparty/chromium/base/base.gypi
-+++ b/src/3rdparty/chromium/base/base.gypi
-@@ -745,7 +745,7 @@
-                 ['include', '^nix/'],
-               ],
-           }],
--          ['use_qt==1 and target_arch=="ia32"', {
-+          ['use_qt==1 and target_arch=="ia32" or target_arch=="x64"', {
-               'sources/': [
-                 ['include', 'atomicops_internals_x86_gcc.cc'],
-               ],
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch
deleted file mode 100644
index 2e2c177..0000000
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 8e540a678a796d78ff9a98986d747afbca7f63be Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 1 Jul 2014 15:58:16 +0200
-Subject: [PATCH 3/6] functions.prf: Try to add _moc suffix
-
-* otherwise moc generated files have the same basename and do_configure fails with:
-  core_generated.gyp:QtWebEngineCore#target has several files with the same basename:
-  |   javascript_dialog_controller: javascript_dialog_controller.cpp
-  | /OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/qtwebengine/0.9.99+gitAUTOINC+21f6ce84ec-r0/git/src/core/.moc/moc_/OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/qtwebengine/0.9.99+gitAUTOI.moc+21f6ce84ec-r0/git/src/core/javascript_dialog_controller.cpp
-  ...
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 15c2941..78b1190 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -40,8 +40,8 @@ defineReplace(findIncludedMocFiles) {
- defineReplace(mocOutput) {
-   out = $$1
-   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1_moc$${QMAKE_EXT_CPP_MOC})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1_moc$${first(QMAKE_EXT_CPP)})
-   return($$out)
- }
- 
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
new file mode 100644
index 0000000..b19556f
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -0,0 +1,29 @@
+From 69e05cdc9000a1962101b2859d0ae3d77bb751d7 Mon Sep 17 00:00:00 2001
+From: Frieder Schrempf <frieder.schrempf@online.de>
+Date: Mon, 1 Dec 2014 14:34:40 +0000
+Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Frieder Schrempf <frieder.schrempf@online.de>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/functions.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index 0123336..5cea82a 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -7,7 +7,7 @@ defineTest(isPlatformSupported) {
+ 
+   linux-g++*:!isGCCVersionSupported():return(false)
+   !isPythonVersionSupported(): return(false)
+-  linux-g++*|win32-msvc2013|macx-clang: return(true)
++  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang: return(true)
+   boot2qt: return(true)
+ 
+   warning("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation".)
+-- 
+2.1.3
+
diff --git a/recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch b/recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch
deleted file mode 100644
index a3842ec..0000000
--- a/recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c99aed6ef28c4ac9c00024a40222331c0e682d28 Mon Sep 17 00:00:00 2001
-From: Andras Becsi <andras.becsi@digia.com>
-Date: Thu, 18 Sep 2014 18:22:37 +0200
-Subject: [PATCH 4/6] Set arm_tune to empty string if mtune flag is not set by
- toolchain
-
-Since the default arm_tune option applied by chromium is not
-recognized by our gcc toolchain set arm_tune to empty string
-to prevent chromium from setting a default. Our toolchains
-set the arm version which already implies the corresponding
-mtune option anyway.
-
-Change-Id: I0291bd4f0e5706597d37f914e4eeefbd75397bbf
-Reviewed-by: Jocelyn Turcotte <jocelyn.turcotte@digia.com>
----
- src/core/gyp_run.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/gyp_run.pro b/src/core/gyp_run.pro
-index ed592e1..4845af2 100644
---- a/src/core/gyp_run.pro
-+++ b/src/core/gyp_run.pro
-@@ -47,7 +47,7 @@ cross_compile {
-         !isEmpty(MARCH): GYP_ARGS += "-D arm_arch=\"$$MARCH\""
- 
-         MTUNE = $$extractCFlag("-mtune=.*")
--        !isEmpty(MTUNE): GYP_ARGS += "-D arm_tune=\"$$MTUNE\""
-+        GYP_ARGS += "-D arm_tune=\"$$MTUNE\""
- 
-         MFLOAT = $$extractCFlag("-mfloat-abi=.*")
-         !isEmpty(MFLOAT): GYP_ARGS += "-D arm_float_abi=\"$$MFLOAT\""
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtwebengine/0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch b/recipes-qt/qt5/qtwebengine/0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
deleted file mode 100644
index 943f671..0000000
--- a/recipes-qt/qt5/qtwebengine/0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 1331c66c937f1c3e10e193932db2037dc38434e9 Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Wed, 15 Oct 2014 17:02:16 +1100
-Subject: [PATCH 5/6] Fix ARM NEON detection for -mfpu=neon-vfpv4
-
-Upstream-Status: Backport
-
-Change-Id: I972d3560d6aa2640a2702f219cf802d2476b1c6e
-Reviewed-by: Andras Becsi <andras.becsi@digia.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/core/gyp_run.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/gyp_run.pro b/src/core/gyp_run.pro
-index 4845af2..66e97f4 100644
---- a/src/core/gyp_run.pro
-+++ b/src/core/gyp_run.pro
-@@ -64,7 +64,7 @@ cross_compile {
-             # If the toolchain does not explicitly specify to use NEON instructions
-             # we use arm_neon_optional for ARMv7 and newer and let chromium decide
-             # about the mfpu option.
--            contains(MFPU, "neon"): GYP_ARGS += "-D arm_fpu=\"$$MFPU\" -D arm_neon=1"
-+            contains(MFPU, "neon")|contains(MFPU, "neon-vfpv4"): GYP_ARGS += "-D arm_fpu=\"$$MFPU\" -D arm_neon=1"
-             else:!lessThan(MARMV, 7): GYP_ARGS += "-D arm_neon=0 -D arm_neon_optional=1"
-             else: GYP_ARGS += "-D arm_fpu=\"$$MFPU\" -D arm_neon=0 -D arm_neon_optional=0"
-         }
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtwebengine/0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch b/recipes-qt/qt5/qtwebengine/0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch
deleted file mode 100644
index 920dd91..0000000
--- a/recipes-qt/qt5/qtwebengine/0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d242c15eb961fbdee69c0a0989cd100d174a25db Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Wed, 15 Oct 2014 17:01:06 +1100
-Subject: [PATCH 6/6] Include QMAKE_CC when extracting C compiler flags
-
-This fixes cross-compile settings detection for cross-compilation
-environments where the C compiler cross-compilation flags are set in
-CC/QMAKE_CC instead of CFLAGS/QMAKE_CFLAGS (e.g. OpenEmbedded).
-
-Upstream-Status: Backport
-
-Change-Id: I0a7b0f6c47a00775ec18073a16359c8351363285
-Reviewed-by: Andras Becsi <andras.becsi@digia.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 78b1190..37dd615 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -14,7 +14,7 @@ defineReplace(getConfigDir) {
- }
- 
- defineReplace(extractCFlag) {
--    CFLAGS = $$QMAKE_CFLAGS
-+    CFLAGS = $$QMAKE_CC $$QMAKE_CFLAGS
-     !isEmpty(ANDROID_TARGET_CFLAGS): CFLAGS = $$ANDROID_TARGET_CFLAGS
-     OPTION = $$find(CFLAGS, $$1)
-     OPTION = $$split(OPTION, =)
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
deleted file mode 100644
index 99150e0..0000000
--- a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require qt5-git.inc
-require ${PN}.inc
-
-# this wasn't released, the PV is set just to signify that this SRCREV was tested together
-# with 5.3.2 version of other modules
-PV = "5.3.2"
-DEFAULT_PREFERENCE = "1"
-
-QT_MODULE_BRANCH = "1.0"
-QT_MODULE_BRANCH_CHROMIUM = "33.0.1750.170-based"
-
-SRC_URI += " \
-    git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
-    file://0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch \
-    file://0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
-    file://0003-functions.prf-Try-to-add-_moc-suffix.patch \
-    file://0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch \
-    file://0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch \
-    file://0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch \
-    file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch \
-    file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch \
-    file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
-"
-SRCREV_qtwebengine = "21f6ce84ecca9a4ff2aa980b21d2e5174c78d14b"
-SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
-SRCREV = "${SRCREV_qtwebengine}"
-
-SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebengine_5.4.0.bb b/recipes-qt/qt5/qtwebengine_5.4.0.bb
new file mode 100644
index 0000000..85ac397
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine_5.4.0.bb
@@ -0,0 +1,11 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "ec05c84be8b8d582d5321f0656c44005"
+SRC_URI[sha256sum] = "ab91a5c0d63f47de91310c8e56255ac1c8ec1b7f9c414cc7e040f72b28e4153b"
+
+SRC_URI += " \
+    file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
+    file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
+    file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
+"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index aac966b..f5699bc 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -1,11 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-LIC_FILES_CHKSUM = " \
-  file://src/core/browser_context_qt.cpp;md5=91895ac1852e1b07202d9716194e8dd8;beginline=1;endline=35 \
-  file://src/3rdparty/chromium/LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5 \
-"
-
 QT_MODULE_BRANCH = "5.4"
 QT_MODULE_BRANCH_CHROMIUM = "37.0.2062-based"
 
@@ -20,3 +15,5 @@ SRCREV_chromium = "66388297cf2ca42049fb099237134ec33465e2f5"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
+
+S = "${WORKDIR}/git"
diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebkit-examples.inc
index 84f16a4..5faf6f4 100644
--- a/recipes-qt/qt5/qtwebkit-examples.inc
+++ b/recipes-qt/qt5/qtwebkit-examples.inc
@@ -1,7 +1,8 @@
 require qt5.inc
 
-LICENSE = "BSD & LGPLv2+"
-LIC_FILES_CHKSUM = "file://examples/webkitwidgets/scroller/wheel/main.cpp;endline=112;md5=6f92d041824c63426993c8ce3ae0eb77 \
+LICENSE = "BSD & LGPLv2+ | GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://examples/webkitwidgets/scroller/wheel/main.cpp;endline=112;md5=6f92d041824c63426993c8ce3ae0eb77 \
                     file://examples/webkitwidgets/imageanalyzer/imageanalyzer.cpp;endline=223;md5=13ffb472fefe4bdf6464954a22251f35"
 
 SRC_URI += " \
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb b/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
deleted file mode 100644
index 9c93c20..0000000
--- a/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "6f88c2a99002801a1943483331f8b4f0"
-SRC_URI[sha256sum] = "c8081a0863b7d8e2e39ec0e2fe288331ddab093a682959ba7378392512296482"
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.4.0.bb b/recipes-qt/qt5/qtwebkit-examples_5.4.0.bb
new file mode 100644
index 0000000..adcea20
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-examples_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "369617a40e64b93686cebd12a99916c0"
+SRC_URI[sha256sum] = "b02a2f3d381e66e83fbf972416ad376e2a03ccfa8b4371867c83970bf0f0e9f6"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 1b7cf5d..27dd7ee 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "70bd4d5253f134bf48a30544030bb832f1eba8b3"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index cb652aa..bdc676b 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -1,11 +1,12 @@
 require qt5.inc
 
-LICENSE = "BSD & LGPLv2+"
-LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md5=fb9694013ad71b78f8913af7a5959680 \
+LICENSE = "BSD & LGPLv2+ | GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://Source/WebCore/rendering/RenderApplet.h;endline=22;md5=fb9694013ad71b78f8913af7a5959680 \
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
 
-DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
+DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt leveldb"
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors"
 PACKAGECONFIG[gstreamer] = "OE_GSTREAMER_ENABLED,,gstreamer1.0 gstreamer1.0-plugins-base"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 4073319..9324da9 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -9,23 +9,21 @@ adds a patch to not include the rpath.prf which causes this problem.
 
 Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
 ---
  Tools/qmake/mkspecs/features/unix/default_post.prf | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
-index 75df1c5..5d9a4d2 100644
+index 9c52406..7ece013 100644
 --- a/Tools/qmake/mkspecs/features/unix/default_post.prf
 +++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
-@@ -56,8 +56,6 @@ linux-*g++* {
+@@ -59,8 +59,6 @@ linux-*g++* {
      }
  }
  
 -contains(TEMPLATE, app): CONFIG += rpath
 -
- CONFIG(debug, debug|release)|force_debug_info|separate_debug_info {
+ CONFIG(debug, debug|release)|force_debug_info {
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
      !force_static_libs_as_shared:config_gnuld: QMAKE_LFLAGS += -Wl,--no-keep-memory
--- 
-2.1.1
-
diff --git a/recipes-qt/qt5/qtwebkit_5.3.2.bb b/recipes-qt/qt5/qtwebkit_5.3.2.bb
deleted file mode 100644
index aa49463..0000000
--- a/recipes-qt/qt5/qtwebkit_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "0497b5b46540848e0db6a9e219d756fb"
-SRC_URI[sha256sum] = "e47122ed15e8e1cc32e11b3cd89bacc056437215134a204899f2fddb4fd92e5b"
diff --git a/recipes-qt/qt5/qtwebkit_5.4.0.bb b/recipes-qt/qt5/qtwebkit_5.4.0.bb
new file mode 100644
index 0000000..8a276ab
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "e62d72c410dffe5129043f80f624c896"
+SRC_URI[sha256sum] = "6c672207765d5d2e88aa14b72b3876ad7bce453397a02e1a3d6e4670a8d188c1"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 0446d38..feb860c 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,9 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-DEPENDS += "leveldb"
-
 SRCREV = "18cb1a3ae907d76da9eb8c54528cf3bcb074d0e5"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtwebsockets.inc b/recipes-qt/qt5/qtwebsockets.inc
index eb442a6..6eb8da2 100644
--- a/recipes-qt/qt5/qtwebsockets.inc
+++ b/recipes-qt/qt5/qtwebsockets.inc
@@ -2,5 +2,6 @@ require qt5.inc
 
 DEPENDS += "qtbase qtdeclarative"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
-LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
+LICENSE = "LGPL-2.1 | GPL-2.0"
diff --git a/recipes-qt/qt5/qtwebsockets_5.3.2.bb b/recipes-qt/qt5/qtwebsockets_5.3.2.bb
deleted file mode 100644
index 8ebc50e..0000000
--- a/recipes-qt/qt5/qtwebsockets_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "093ddc113952e47bd0e251986e03f1e4"
-SRC_URI[sha256sum] = "60533d413b0fa27b1e08642ae77bcaa76a845fa39ddc3d49af573a77e73a38c2"
diff --git a/recipes-qt/qt5/qtwebsockets_5.4.0.bb b/recipes-qt/qt5/qtwebsockets_5.4.0.bb
new file mode 100644
index 0000000..cb3122d
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "0c406bca48296d0d99cc93b00f40aca7"
+SRC_URI[sha256sum] = "2acd274a4a983cdd2288678d9005429fded51b5277d0621c4a953fa4f4f4cbdf"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 5939e89..a4c0da2 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "64927e04f202d33b9a9a1f94141ef692c0b513ac"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtx11extras.inc b/recipes-qt/qt5/qtx11extras.inc
index 73f5898..40e1d5c 100644
--- a/recipes-qt/qt5/qtx11extras.inc
+++ b/recipes-qt/qt5/qtx11extras.inc
@@ -2,8 +2,5 @@ require qt5.inc
 
 DEPENDS += "qtbase"
 
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtx11extras_5.3.2.bb b/recipes-qt/qt5/qtx11extras_5.3.2.bb
deleted file mode 100644
index 9bfe71b..0000000
--- a/recipes-qt/qt5/qtx11extras_5.3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "59f6cbbdf2ad48c6b95b65f8b333df2d"
-SRC_URI[sha256sum] = "ca6a28c95be0bf18080b4a20ae9e2c24a77a45aaf557f06047e65b1280c17251"
diff --git a/recipes-qt/qt5/qtx11extras_5.4.0.bb b/recipes-qt/qt5/qtx11extras_5.4.0.bb
new file mode 100644
index 0000000..d36d1bd
--- /dev/null
+++ b/recipes-qt/qt5/qtx11extras_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "f3a7b9b20dd5f19fc5ed12ef030c59b7"
+SRC_URI[sha256sum] = "a3c66bc9e2b877109073f27bbc7865489fa1ed548584f5fc87c371380dc1474c"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index e01d1f4..6867e04 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "a21bbb45019e1bbc7b583811ff2e84757082a01a"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtxmlpatterns.inc b/recipes-qt/qt5/qtxmlpatterns.inc
index bbb05a6..40e1d5c 100644
--- a/recipes-qt/qt5/qtxmlpatterns.inc
+++ b/recipes-qt/qt5/qtxmlpatterns.inc
@@ -1,3 +1,6 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb b/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
deleted file mode 100644
index 455d56c..0000000
--- a/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "857e8040b2bf45c114a7d75ec6ef94ee"
-SRC_URI[sha256sum] = "acab0307039e117475caf2c95e425ead09ab5ee08ce15205fb3c0af7d7ec1abb"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.4.0.bb b/recipes-qt/qt5/qtxmlpatterns_5.4.0.bb
new file mode 100644
index 0000000..eb621b2
--- /dev/null
+++ b/recipes-qt/qt5/qtxmlpatterns_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "5ad30d6b478d4e5d71e9c5bef3f3fbf7"
+SRC_URI[sha256sum] = "791c697b9bc7a5384e3d0dbec56af7f2194fe7dc91f8b1e0fd502089135e5425"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 5be8f81..bb83c1a 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -2,6 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "2e8b90b33d1d8dce4acdb6a116a227f2a5d3e044"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
-- 
2.1.3


