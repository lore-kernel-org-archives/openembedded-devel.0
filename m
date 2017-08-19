Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2120E71985
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:17:24 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c14so4884929wmh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=znXoWk2uSm40vD+L4YX/ABR2JUcaDNjJQWzcNARf6k0=;
	b=a/kOdg5nLgpFN14Ap7C2+hsECHVz9rt0rJgrSZnVDThQbUP0+BpoFVS2pfl6mmBrKN
	1pSqejJNyOqqpYhWXCxZKcYCV1s6kKRBUxO+kEjSEgvOsK6u+qWmROOCvixmHnZBdqJQ
	UMRIHQ4WAnQw7nnEDVvbALVdM3rhYSZlYYMiv2pWZm+eOIuqZbD1yo6y9yN+YE5lDok3
	zLelxwClmNWgDuXNa76mcz+5QYHZeLc5SVPWexNAX6epnGmXuGcriY1X19U1x7bop2C3
	Bn002fIMU2AIOMHk2Y9Iqlo/cqK/nG+G7VUG3xKhIPPZsToRjAHIuZAknKnW5zal6crm
	T6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=znXoWk2uSm40vD+L4YX/ABR2JUcaDNjJQWzcNARf6k0=;
	b=JFGfVNe+on4fozvb8OMCKB51ey4aUzVRlkf9JP+JAsYEXHhStSBjLgMLKQBcgORGmZ
	JJLe2RLVSlCwqTUzqt6UBh/HihVmsHXPhRJgekVG9o1SSxynmZr+CAi+M+P+BNtit2Pl
	IB43mEDS3T9RmiFXdLn9IrSczh3NIj512Ad6aoebt76ZQ6dAmHZTR/wEpQygpIZjP+Vg
	n1/frW/CPgMDPG/FTF+W/5AGBQzxMqMe8WPxgz30adpsuJ/z/eipGS9zT4hKk8Rnadbv
	HlMzTVqsGZyeOd10AA4IoDFongI8GPWYhzf90pqm2tXDFo2O43IqzUw9qv6ZKIQpx2eJ
	crXQ==
X-Gm-Message-State: AHYfb5ifr1qo8CFoOhcRawiDUqC/uWqr4YoGuMwSXKlLeR33mwdCaDpu
	yvIBbIwRBC/B4rm1
X-Received: by 10.28.73.193 with SMTP id w184mr3532070wma.178.1503137844101;
	Sat, 19 Aug 2017 03:17:24 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	a70sm1746519wma.32.2017.08.19.03.17.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Aug 2017 03:17:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Aug 2017 12:19:00 +0200
Message-Id: <20170819101901.22156-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/2] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Sat, 19 Aug 2017 10:17:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Samuli Piippo <samuli.piippo@qt.io>

* adapt QtWebEngine recipe to use GN instead of GYP
* add QtRemoteObjects and QtWebView as a new Qt modules
* update available QtBase configure arguments
* remove obsolete patches
* patch all .pc files to remove build paths
* include generated QML cache files in packages
* the patch "configure paths for target qmake properly" could not
  be applied anymore and support must be done differently

* QtWebEngine now requires gcc-multilib to be installed on the host
  system, because the host tools are built to the same bitness as
  the target (arm -> x86, aarch64 -> x86-64)

* refresh the patches to match with b5.9* branches on:
  https://github.com/meta-qt5/qtbase
  https://github.com/meta-qt5/qtwebengine
  and 56-based branch on
  https://github.com/meta-qt5/qtwebengine-chromium

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/qmake5_base.bbclass                        |   6 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  22 ++--
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |  15 ++-
 ...2-Fix-BlenderDNA-for-clang-cross-compiler.patch |  56 ++++-----
 recipes-qt/qt5/qt3d_git.bb                         |   2 +-
 recipes-qt/qt5/qt5-git.inc                         |   4 +-
 recipes-qt/qt5/qt5.inc                             |  10 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  24 ++--
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  14 +--
 ...ake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch} |   6 +-
 ...-allow-to-set-qt.conf-from-the-outside-u.patch} |   6 +-
 ...ump-path-length-from-256-to-512-character.patch |  34 ++++++
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 106 -----------------
 ...unknown-features-instead-of-erroring-out.patch} |   6 +-
 ...ump-path-length-from-256-to-512-character.patch |  33 ------
 ...wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch} |   4 +-
 ... => 0007-Delete-qlonglong-and-qulonglong.patch} |   2 +-
 ...8-Replace-pthread_yield-with-sched_yield.patch} |  10 +-
 ...build-uic.patch => 0009-Always-build-uic.patch} |   6 +-
 ...-Disable-Wformat-security-with-clang-as-w.patch |  28 -----
 ...configure-paths-for-target-qmake-properly.patch |  75 ------------
 recipes-qt/qt5/qtbase_git.bb                       |  26 ++--
 recipes-qt/qt5/qtcanvas3d_git.bb                   |   2 +-
 recipes-qt/qt5/qtcharts_git.bb                     |   2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |   6 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |   2 +-
 .../qtdeclarative/0002-Fix-memory-leak-in-V4.patch |  44 -------
 ...leak-in-QQuickWindowPrivate-deliverTouchA.patch |  84 -------------
 recipes-qt/qt5/qtdeclarative_git.bb                |   8 +-
 recipes-qt/qt5/qtenginio_git.bb                    |   5 -
 recipes-qt/qt5/qtgamepad_git.bb                    |   2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |   2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |   2 +-
 .../0001-Make-mapbox-gl-build-configurable.patch   |  27 +++++
 recipes-qt/qt5/qtlocation_git.bb                   |  13 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |   6 +-
 recipes-qt/qt5/qtnetworkauth_git.bb                |   3 +-
 recipes-qt/qt5/qtquick1_git.bb                     |   2 +-
 ...rols2-fix-compilation-of-examples-textedi.patch |  28 -----
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  10 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |   7 +-
 .../0001-Allow-a-tools-only-build.patch            |  37 ++++++
 recipes-qt/qt5/qtremoteobjects_git.bb              |  27 +++++
 recipes-qt/qt5/qtscript_git.bb                     |   2 +-
 recipes-qt/qt5/qtscxml_git.bb                      |   2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |   2 +-
 recipes-qt/qt5/qtserialbus_git.bb                  |   2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |   2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |   2 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |  29 -----
 recipes-qt/qt5/qttools_git.bb                      |   8 +-
 recipes-qt/qt5/qttranslations_git.bb               |   2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |   2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |   6 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |   2 +-
 ...nge-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch} |   2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |  24 ----
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  27 -----
 ....prf-allow-build-for-linux-oe-g-platform.patch} |  14 +--
 ...uickwebengineview_p_p.h-add-include-QCol.patch} |   4 +-
 ...romium-Force-host-toolchain-configuration.patch |  40 +++++++
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  26 ----
 ...dependency-to-QCoreApplication-translate.patch} |   8 +-
 ...l-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch} |   2 +-
 .../0003-chromium-v8-fix-build-with-gcc7.patch     | 131 ---------------------
 .../0004-Force-host-toolchain-configuration.patch  |  44 +++++++
 .../0004-chromium-WebKit-fix-build-with-gcc7.patch |  41 -------
 ...l-Avoid-mallinfo-APIs-on-non-glibc-linux.patch} |   8 +-
 ...chromium-musl-include-fcntl.h-for-loff_t.patch} |   6 +-
 ...l-use-off64_t-instead-of-the-internal-__.patch} |   2 +-
 ...um-musl-linux-glibc-make-the-distinction.patch} |   2 +-
 ...l-allocator-Do-not-include-glibc_weak_sy.patch} |   6 +-
 ...l-Use-correct-member-name-__si_fields-fr.patch} |   2 +-
 ...romium-musl-Match-syscalls-to-match-musl.patch} |   8 +-
 ...l-Define-res_ninit-and-res_nclose-for-no.patch} |   2 +-
 ...romium-musl-Do-not-define-__sbrk-on-musl.patch} |   2 +-
 ...m-musl-Adjust-default-pthread-stack-size.patch} |  30 ++---
 ...l-include-asm-generic-ioctl.h-for-TCGETS.patch} |   6 +-
 ...l-tcmalloc-Use-off64_t-insread-of-__off6.patch} |   6 +-
 ...romium-musl-link-with-libexecinfo-on-musl.patch |  22 ----
 recipes-qt/qt5/qtwebengine_git.bb                  |  88 +++++++-------
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |  76 ------------
 recipes-qt/qt5/qtwebkit_git.bb                     |   3 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |   2 +-
 .../0001-Add-missing-include-for-qWarning.patch    |  22 ++++
 recipes-qt/qt5/qtwebview_git.bb                    |  24 ++++
 recipes-qt/qt5/qtx11extras_git.bb                  |   2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
 89 files changed, 514 insertions(+), 1047 deletions(-)
 rename recipes-qt/qt5/qtbase/{0003-Add-external-hostbindir-option.patch => 0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch} (95%)
 rename recipes-qt/qt5/qtbase/{0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch => 0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch} (89%)
 create mode 100644 recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
 rename recipes-qt/qt5/qtbase/{0006-Disable-all-unknown-features-instead-of-erroring-out.patch => 0005-Disable-all-unknown-features-instead-of-erroring-out.patch} (85%)
 delete mode 100644 recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
 rename recipes-qt/qt5/qtbase/{0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch => 0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch} (95%)
 rename recipes-qt/qt5/qtbase/{0008-Delete-qlonglong-and-qulonglong.patch => 0007-Delete-qlonglong-and-qulonglong.patch} (92%)
 rename recipes-qt/qt5/qtbase/{0010-Replace-pthread_yield-with-sched_yield.patch => 0008-Replace-pthread_yield-with-sched_yield.patch} (90%)
 rename recipes-qt/qt5/qtbase/{0011-Always-build-uic.patch => 0009-Always-build-uic.patch} (83%)
 delete mode 100644 recipes-qt/qt5/qtbase/0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch
 create mode 100644 recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch
 delete mode 100644 recipes-qt/qt5/qtquickcontrols2/0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch
 create mode 100644 recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
 create mode 100644 recipes-qt/qt5/qtremoteobjects_git.bb
 delete mode 100644 recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
 rename recipes-qt/qt5/qtwebengine/{0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch => 0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch} (97%)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
 rename recipes-qt/qt5/qtwebengine/{0003-functions.prf-allow-build-for-linux-oe-g-platform.patch => 0001-functions.prf-allow-build-for-linux-oe-g-platform.patch} (64%)
 rename recipes-qt/qt5/qtwebengine/{0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch => 0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch} (88%)
 create mode 100644 recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
 rename recipes-qt/qt5/qtwebengine/{0005-Include-dependency-to-QCoreApplication-translate.patch => 0003-Include-dependency-to-QCoreApplication-translate.patch} (80%)
 rename recipes-qt/qt5/qtwebengine/{0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch => 0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch} (93%)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch
 rename recipes-qt/qt5/qtwebengine/{0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch => 0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch} (88%)
 rename recipes-qt/qt5/qtwebengine/{0007-chromium-musl-include-fcntl.h-for-loff_t.patch => 0005-chromium-musl-include-fcntl.h-for-loff_t.patch} (85%)
 rename recipes-qt/qt5/qtwebengine/{0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch => 0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0009-chromium-musl-linux-glibc-make-the-distinction.patch => 0007-chromium-musl-linux-glibc-make-the-distinction.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch => 0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch} (85%)
 rename recipes-qt/qt5/qtwebengine/{0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch => 0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0012-chromium-musl-Match-syscalls-to-match-musl.patch => 0010-chromium-musl-Match-syscalls-to-match-musl.patch} (84%)
 rename recipes-qt/qt5/qtwebengine/{0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch => 0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch => 0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0015-chromium-musl-Adjust-default-pthread-stack-size.patch => 0013-chromium-musl-Adjust-default-pthread-stack-size.patch} (70%)
 rename recipes-qt/qt5/qtwebengine/{0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch => 0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch} (82%)
 rename recipes-qt/qt5/qtwebengine/{0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch => 0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch} (88%)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0017-chromium-musl-link-with-libexecinfo-on-musl.patch
 delete mode 100644 recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
 create mode 100644 recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-qWarning.patch
 create mode 100644 recipes-qt/qt5/qtwebview_git.bb

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index df8f624..a556f4f 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -214,7 +214,9 @@ qmake5_base_do_install() {
     qmake5_base_fix_install ${STAGING_DIR_HOST}
     qmake5_base_fix_install ${STAGING_DIR_NATIVE}
 
-    if ls ${D}${libdir}/pkgconfig/Qt5*.pc >/dev/null 2>/dev/null; then
-        sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" ${D}${libdir}/pkgconfig/Qt5*.pc
+    if ls ${D}${libdir}/pkgconfig/*.pc >/dev/null 2>/dev/null; then
+        sed -i ${D}${libdir}/pkgconfig/*.pc \
+            -e "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" \
+            -e "s@${STAGING_DIR_TARGET}@@g"
     fi
 }
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 0f1c6d6..f40a66d 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -27,20 +27,18 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0006-Disable-all-unknown-features-instead-of-erroring-out.patch \
-    file://0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
-    file://0008-Delete-qlonglong-and-qulonglong.patch \
-    file://0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch \
-    file://0010-Replace-pthread_yield-with-sched_yield.patch \
+    file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
+    file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0004-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0005-Disable-all-unknown-features-instead-of-erroring-out.patch \
+    file://0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0007-Delete-qlonglong-and-qulonglong.patch \
+    file://0008-Replace-pthread_yield-with-sched_yield.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0011-Always-build-uic.patch \
+    file://0009-Always-build-uic.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
@@ -118,6 +116,7 @@ do_configure() {
         -no-opengl \
         -no-openssl \
         -no-xcb \
+        -no-feature-bearermanagement \
         -no-icu \
         -verbose \
         -release \
@@ -137,7 +136,6 @@ do_configure() {
         -testsdir ${OE_QMAKE_PATH_TESTS} \
         -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
         -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
-        -host-option CROSS_COMPILE=${HOST_PREFIX} \
         -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
         -no-glib \
         -no-iconv \
@@ -195,4 +193,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "49dc9aa409d727824f26b246054a22b5a7dd5980"
+SRCREV = "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index ba4e2d0..8cf1f50 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 22ccc94b5501509b516fce17195a598d04dcc2f3 Mon Sep 17 00:00:00 2001
+From dd0f3fefeeefb31ec8cf2417bd3f447f7b9c25c6 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
@@ -6,7 +6,8 @@ Subject: [PATCH] Allow a tools-only build
 ---
  qt3d.pro                                  | 7 ++++++-
  src/3rdparty/assimp/assimp_dependency.pri | 2 +-
- 2 files changed, 7 insertions(+), 2 deletions(-)
+ tools/tools.pro                           | 2 +-
+ 3 files changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/qt3d.pro b/qt3d.pro
 index 2cc347a1c..81cdeefb0 100644
@@ -38,3 +39,13 @@ index 8ba2d9a41..e973d93dd 100644
      QMAKE_USE_PRIVATE += assimp
  } else {
      include(assimp.pri)
+diff --git a/tools/tools.pro b/tools/tools.pro
+index 8e973aecb..ad51db585 100644
+--- a/tools/tools.pro
++++ b/tools/tools.pro
+@@ -1,4 +1,4 @@
+ TEMPLATE = subdirs
+ QT_FOR_CONFIG += 3dcore-private
+-!android:qtConfig(assimp):qtConfig(commandlineparser): \
++!android:tools-only|qtConfig(assimp):qtConfig(commandlineparser): \
+     SUBDIRS += qgltf
diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
index 95b5479..eeb402f 100644
--- a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
+++ b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
@@ -1,4 +1,4 @@
-From bc5ef10fc6f71cb340ad339bc43f6ce48adb1f59 Mon Sep 17 00:00:00 2001
+From ec40913bc563e3cb0abc1965ce457d3a2fe663b3 Mon Sep 17 00:00:00 2001
 From: Kim Kulling <kim.kulling@googlemail.com>
 Date: Mon, 7 Nov 2016 17:19:49 +0100
 Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
@@ -9,36 +9,36 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/3rdparty/assimp/code/BlenderDNA.cpp b/src/3rdparty/assimp/code/BlenderDNA.cpp
-index b380fbe8d..3cc27dff1 100644
+index 18ec9f2b4..5b0b2090f 100644
 --- a/src/3rdparty/assimp/code/BlenderDNA.cpp
 +++ b/src/3rdparty/assimp/code/BlenderDNA.cpp
-@@ -56,10 +56,10 @@ using namespace Assimp::Formatter;
- #define for_each BOOST_FOREACH
+@@ -55,10 +55,10 @@ using namespace Assimp::Formatter;
+ 
  bool match4(StreamReaderAny& stream, const char* string) {
- 	char tmp[] = { 
--		(stream).GetI1(), 
--		(stream).GetI1(),  
--		(stream).GetI1(), 
--		(stream).GetI1()
-+		(const char)(stream).GetI1(),
-+		(const char)(stream).GetI1(),
-+		(const char)(stream).GetI1(),
-+		(const char)(stream).GetI1()
- 	};
- 	return (tmp[0]==string[0] && tmp[1]==string[1] && tmp[2]==string[2] && tmp[3]==string[3]);
+     char tmp[] = {
+-        (stream).GetI1(),
+-        (stream).GetI1(),
+-        (stream).GetI1(),
+-        (stream).GetI1()
++        (const char)(stream).GetI1(),
++        (const char)(stream).GetI1(),
++        (const char)(stream).GetI1(),
++        (const char)(stream).GetI1()
+     };
+     return (tmp[0]==string[0] && tmp[1]==string[1] && tmp[2]==string[2] && tmp[3]==string[3]);
  }
-@@ -344,10 +344,10 @@ void SectionParser :: Next()
- 	stream.SetCurrentPos(current.start + current.size);
+@@ -345,10 +345,10 @@ void SectionParser :: Next()
+     stream.SetCurrentPos(current.start + current.size);
  
- 	const char tmp[] = {
--		stream.GetI1(),
--		stream.GetI1(),
--		stream.GetI1(),
--		stream.GetI1()
-+		(const char)stream.GetI1(),
-+		(const char)stream.GetI1(),
-+		(const char)stream.GetI1(),
-+		(const char)stream.GetI1()
- 	};
- 	current.id = std::string(tmp,tmp[3]?4:tmp[2]?3:tmp[1]?2:1);
+     const char tmp[] = {
+-        stream.GetI1(),
+-        stream.GetI1(),
+-        stream.GetI1(),
+-        stream.GetI1()
++        (const char)stream.GetI1(),
++        (const char)stream.GetI1(),
++        (const char)stream.GetI1(),
++        (const char)stream.GetI1()
+     };
+     current.id = std::string(tmp,tmp[3]?4:tmp[2]?3:tmp[1]?2:1);
  
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 2891470..41b5fbc 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -35,6 +35,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "440589a0747d9668fec3ff924b390d75be5c6733"
+SRCREV = "f39d0a0c32cc489849a0cd5c2880f6e824223485"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 1cb115f..927912f 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -2,7 +2,7 @@
 # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
-QT_MODULE_BRANCH ?= "5.8"
+QT_MODULE_BRANCH ?= "5.9"
 QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
 
 # each module needs to define valid SRCREV
@@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
 
 S = "${WORKDIR}/git"
 
-PV = "5.8.0+git${SRCPV}"
+PV = "5.9.0+git${SRCPV}"
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 90d7896..4b5fe8a 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -97,34 +97,42 @@ FILES_${PN}-qmldesigner += " \
     ${OE_QMAKE_PATH_QML}/*/*/*/designer \
 "
 
-# qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*js}
+# qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*.qmlc,*.js,*.jsc}
 FILES_${PN}-qmlplugins = " \
     ${OE_QMAKE_PATH_QML}/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*.qml \
+    ${OE_QMAKE_PATH_QML}/*/*.qmlc \
     ${OE_QMAKE_PATH_QML}/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*.jsc \
     ${OE_QMAKE_PATH_QML}/*/*.png \
     ${OE_QMAKE_PATH_QML}/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*/*.qml \
+    ${OE_QMAKE_PATH_QML}/*/*/*.qmlc \
     ${OE_QMAKE_PATH_QML}/*/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*/*.jsc \
     ${OE_QMAKE_PATH_QML}/*/*/*.png \
     ${OE_QMAKE_PATH_QML}/*/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*/*/images \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.qml \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*.qmlc \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*.jsc \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.png \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.metainfo \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qml \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmlc \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*/*.jsc \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*/*.png \
     ${OE_QMAKE_PATH_IMPORTS}/*.qmltypes \
     ${OE_QMAKE_PATH_IMPORTS}/*/*${SOLIBSDEV} \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 2420580..b5a1f1f 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -22,20 +22,18 @@ require qt5-git.inc
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0006-Disable-all-unknown-features-instead-of-erroring-out.patch \
-    file://0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
-    file://0008-Delete-qlonglong-and-qulonglong.patch \
-    file://0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch \
-    file://0010-Replace-pthread_yield-with-sched_yield.patch \
+    file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
+    file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0004-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0005-Disable-all-unknown-features-instead-of-erroring-out.patch \
+    file://0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0007-Delete-qlonglong-and-qulonglong.patch \
+    file://0008-Replace-pthread_yield-with-sched_yield.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0011-Always-build-uic.patch \
+    file://0009-Always-build-uic.patch \
 "
 
 CLEANBROKEN = "1"
@@ -109,9 +107,7 @@ do_install() {
         done
     fi
 
-    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
-    # e.g. qt3d, qtwayland
-    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
+    install -m 755 ${B}/bin/qfloat16-tables ${D}${OE_QMAKE_PATH_BINS}
 }
 
-SRCREV = "49dc9aa409d727824f26b246054a22b5a7dd5980"
+SRCREV = "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 3f373c7..28c2660 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 805b338154ed0262a7b8bf5c582ff5b193a55492 Mon Sep 17 00:00:00 2001
+From e13425e6f1e784b0b016cf68a54dfbae32995b86 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
@@ -30,10 +30,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index bc18e614d2..579a96d787 100755
+index 73679de621..5a0eebce50 100755
 --- a/configure
 +++ b/configure
-@@ -1614,7 +1614,7 @@ fi
+@@ -709,7 +709,7 @@ fi
  # is where the resulting variable is written to
  setBootstrapVariable()
  {
@@ -43,10 +43,10 @@ index bc18e614d2..579a96d787 100755
  
  # build qmake
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 4ca7c6ba07..5b5ac13f1d 100644
+index 934a18a924..0f5b1b6333 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -44,14 +44,14 @@ defineTest(qtCompileTest) {
+@@ -46,14 +46,14 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
@@ -64,10 +64,10 @@ index 4ca7c6ba07..5b5ac13f1d 100644
              msg = "test $$1 succeeded"
              write_file($$QMAKE_CONFIG_LOG, msg, append)
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 999cd18154..2ac91ba519 100644
+index c00fdb73f8..0cf4de7b49 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -67,7 +67,7 @@ defineTest(qtHaveModule) {
+@@ -69,7 +69,7 @@ defineTest(qtHaveModule) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
similarity index 95%
rename from recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
rename to recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
index 9f1a2b2..5ee6e04 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
@@ -1,9 +1,9 @@
-From 67977e16e5d0aecd931d8e4355c12cc907df592f Mon Sep 17 00:00:00 2001
+From 5ed152f8caa7ef00fb20d19a06ab5f7887e9aba6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH] Add -external-hostbindir option
+Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
 
-* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
+... to determine path to host binaries
 
 Upstream-Status: Inappropriate [OE specific]
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
similarity index 89%
rename from recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
rename to recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index f985962..7ff1ff7 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 18e2f4368f22bf5ac8b2a36c30a7ad39ed97bf49 Mon Sep 17 00:00:00 2001
+From 77fab782e8a199f9ede83bc97cbce21a544961c2 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 27fe10a79e..29ffcda203 100644
+index b4ba0b5b2e..11d4c00f39 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -164,7 +164,10 @@ void QLibrarySettings::load()
+@@ -172,7 +172,10 @@ void QLibrarySettings::load()
  QSettings *QLibraryInfoPrivate::findConfiguration()
  {
  #ifdef QT_BUILD_QMAKE
diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
new file mode 100644
index 0000000..5ab6a7b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
@@ -0,0 +1,34 @@
+From 4848804312f0045b53c85db113ac9e42fe1b7360 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 25 Aug 2015 10:05:15 -0400
+Subject: [PATCH] configure: bump path length from 256 to 512 characters
+
+Increase the path length that gets hardcoded into generated config.cpp file
+from 256 to 512 characters, as nativesdk path can be quite long.
+
+Also update length of EXT_PREFIX and HOST_PREFIX now.
+
+Change-Id: If98dd57160efe9c98c36148cdf872f50b3d38118
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure.pri | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.pri b/configure.pri
+index be1b166080..52f03bf3f2 100644
+--- a/configure.pri
++++ b/configure.pri
+@@ -796,10 +796,10 @@ defineTest(qtConfOutput_preparePaths) {
+         "static const char qt_configure_installation     [12+11]  = \"qt_instdate=2012-12-20\";" \
+         "" \
+         "/* Installation Info */" \
+-        "static const char qt_configure_prefix_path_str  [12+256] = \"qt_prfxpath=$$config.input.prefix\";" \
++        "static const char qt_configure_prefix_path_str  [12+512] = \"qt_prfxpath=$$config.input.prefix\";" \
+         "$${LITERAL_HASH}ifdef QT_BUILD_QMAKE" \
+-        "static const char qt_configure_ext_prefix_path_str   [12+256] = \"qt_epfxpath=$$config.input.extprefix\";" \
+-        "static const char qt_configure_host_prefix_path_str  [12+256] = \"qt_hpfxpath=$$config.input.hostprefix\";" \
++        "static const char qt_configure_ext_prefix_path_str   [12+512] = \"qt_epfxpath=$$config.input.extprefix\";" \
++        "static const char qt_configure_host_prefix_path_str  [12+512] = \"qt_hpfxpath=$$config.input.hostprefix\";" \
+         "$${LITERAL_HASH}endif" \
+         "" \
+         "static const short qt_configure_str_offsets[] = {" \
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
deleted file mode 100644
index aa97b56..0000000
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From fe9cfbde28c651d00b8f5fda7dc85a97af0c50a1 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* in situation like this:
-  QT_SYSROOT:/OE/oe-core/tmp-eglibc/sysroots/qemuarm
-  QT_INSTALL_LIBS:/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib
-  QT_INSTALL_LIBS/raw:/usr/lib
-  QT_INSTALL_LIBS/get:/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib
-
-  I don't want the replacement like this:
-  sed
-    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/include,/usr/include/qt5,g"
-    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib,/usr/lib,g"
-    "../../lib/pkgconfig/Qt5Core.pc"
-    >"/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/image/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib/pkgconfig/Qt5Core.pc"
-  because that way I'll end with -L/usr/lib in .pc file which is
-  cross-compile unfriendly, keeping ${libdir}/${includedir} works better
-  in my case
-
-* qt_module: Fix paths in .prl files
-* qmake does not prefix them with QT_SYSROOT when using them
-  so e.g. when building qtdeclarative we get -L/usr/lib to LINKAGE
-  variable, which is unsafe for cross-compilation
-* writting QT_SYSROOT in .prl files is dangerous for sstate when
-  builds are in different directories, so we need
-  SSTATE_SCAN_FILES += "*.pri *.prl"
-  to make them relocateble
-
-* fix paths in packageconfig files
-  This reverts parts of:
-
-  enable path replacement in installed prl files on all platforms
-
-  Task-number: QTBUG-33794
-  Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
-  Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
-
-* to debug this, rebuild qtbase and read build/src/corelib/Makefile
-* this is example of broken install_target rule (added line feeds):
-  -$(SED) -e s,/OE/5.3.1-r0/build/lib,/usr/lib,g
-          -e 's,/OE/5.3.1-r0/build/include,$$\{includedir},g'
-          -e 's,/OE/5.3.1-r0/build/lib,$$\{libdir},g'
-     "../../lib/pkgconfig/Qt5Core.pc"
-     >"$(INSTALL_ROOT)/usr/lib/pkgconfig/Qt5Core.pc"
-  change .prf files, create copy of WORKDIR, re-excecute only
-  do_configure task and compare generated Makefile, repeat until
-  replace in generated Makefile works ok, then refresh patch and
-  try complete rebuild for qtbase
-* if everything is ok, then try:
-  image $ grep -R "\-L/usr" .
-  image $ grep -R "\-I/usr" .
-  and it should return only few cases of
-  qmake.conf:QMAKE_LFLAGS_THREAD     = -L/usr/lib/threads
-  for aix* platformas
-
-Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- mkspecs/features/qt.prf        | 13 +++++++++++++
- mkspecs/features/qt_common.prf |  2 +-
- 2 files changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
-index 98f794c485..bd8b7b52e4 100644
---- a/mkspecs/features/qt.prf
-+++ b/mkspecs/features/qt.prf
-@@ -315,6 +315,19 @@ contains(TEMPLATE, .*app) {
-     QTPLUGIN = $$manualplugs $$autoplugs
- }
- 
-+contains(TEMPLATE, .*lib) {
-+    pkgconfig_prefix_replace.match = "prefix=$$[QT_SYSROOT]"
-+    pkgconfig_prefix_replace.replace = "prefix="
-+    pkgconfig_prefix_replace.CONFIG = path
-+    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_prefix_replace
-+
-+    # drop -L/usr/lib in .prl files
-+    prl_replace.match = "-L\$${libdir}"
-+    prl_replace.replace = ""
-+    prl_replace.CONFIG = path
-+    QMAKE_PRL_INSTALL_REPLACE += prl_replace
-+}
-+
- QT_PLUGIN_VERIFY = DEPLOYMENT_PLUGIN
- qtConfig(static) {
-     QT_PLUGIN_VERIFY += QTPLUGIN
-diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index d30983f62b..6da07e032c 100644
---- a/mkspecs/features/qt_common.prf
-+++ b/mkspecs/features/qt_common.prf
-@@ -37,7 +37,7 @@ contains(TEMPLATE, .*lib) {
-         lib_replace.replace =
-     } else {
-         lib_replace.match = $$rplbase/lib
--        lib_replace.replace = $$qqt_libdir
-+        lib_replace.replace = "\$$\\{libdir}"
-     }
-     lib_replace.CONFIG = path
-     QMAKE_PRL_INSTALL_REPLACE += lib_replace
diff --git a/recipes-qt/qt5/qtbase/0006-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
similarity index 85%
rename from recipes-qt/qt5/qtbase/0006-Disable-all-unknown-features-instead-of-erroring-out.patch
rename to recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
index c2b4438..8538901 100644
--- a/recipes-qt/qt5/qtbase/0006-Disable-all-unknown-features-instead-of-erroring-out.patch
+++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -1,4 +1,4 @@
-From 8acdd69a4083080f4dd40001eee30209ec5de0b2 Mon Sep 17 00:00:00 2001
+From 6ecb404346525a92f4c8926aa285662f3f5010b3 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Mon, 24 Oct 2016 09:45:18 +0300
 Subject: [PATCH] Disable all unknown features instead of erroring out
@@ -10,10 +10,10 @@ Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_configure.prf
-index eaaa161270..fa3addae11 100644
+index 966c43108c..32f0dd0041 100644
 --- a/mkspecs/features/qt_configure.prf
 +++ b/mkspecs/features/qt_configure.prf
-@@ -1035,7 +1035,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
+@@ -1180,7 +1180,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
                      error("Expression '$$1' is accessing field '$$var' of non-local feature $${feature}.")
                  return($$result)
              }
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
deleted file mode 100644
index 0c0d2c7..0000000
--- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From be9179d2cbb9009794940092d30dac7800708964 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 25 Aug 2015 10:05:15 -0400
-Subject: [PATCH] configure: bump path length from 256 to 512 characters
-
-Increase the path length that gets hardcoded into generated config.cpp file
-from 256 to 512 characters, as nativesdk path can be quite long.
-
-Also update length of EXT_PREFIX and HOST_PREFIX now.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure b/configure
-index 579a96d787..5af98cd77e 100755
---- a/configure
-+++ b/configure
-@@ -1551,10 +1551,10 @@ cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
- static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
- 
- /* Installation Info */
--static const char qt_configure_prefix_path_str       [256 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
-+static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
- #ifdef QT_BUILD_QMAKE
--static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
--static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
-+static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
-+static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
- #endif
- 
- static const short qt_configure_str_offsets[] = {
diff --git a/recipes-qt/qt5/qtbase/0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
similarity index 95%
rename from recipes-qt/qt5/qtbase/0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
rename to recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index b70b0d3..253815b 100644
--- a/recipes-qt/qt5/qtbase/0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From 5316b420dc408d3a47daa3ba854a7883c911f6b9 Mon Sep 17 00:00:00 2001
+From 3730ac03a1473a0e1fdfe1537b73818ab99961e9 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
@@ -30,7 +30,7 @@ Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
-index d2358cae4b..feb73c02a5 100644
+index 4f342d67d7..202b723882 100644
 --- a/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
 +++ b/mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in
 @@ -9,6 +9,11 @@ if (CMAKE_VERSION VERSION_LESS 3.0.0)
diff --git a/recipes-qt/qt5/qtbase/0008-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
similarity index 92%
rename from recipes-qt/qt5/qtbase/0008-Delete-qlonglong-and-qulonglong.patch
rename to recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
index c992586..68e4b20 100644
--- a/recipes-qt/qt5/qtbase/0008-Delete-qlonglong-and-qulonglong.patch
+++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
@@ -1,4 +1,4 @@
-From 2755a80114433e75f08fbb0df0fee9f7526172aa Mon Sep 17 00:00:00 2001
+From 2fa6b447302abbaf1fd710e94b92692a300baaaf Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Wed, 7 Jun 2017 21:00:49 +0900
 Subject: [PATCH] Delete qlonglong and qulonglong
diff --git a/recipes-qt/qt5/qtbase/0010-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
similarity index 90%
rename from recipes-qt/qt5/qtbase/0010-Replace-pthread_yield-with-sched_yield.patch
rename to recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
index 5c625e0..678de52 100644
--- a/recipes-qt/qt5/qtbase/0010-Replace-pthread_yield-with-sched_yield.patch
+++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
@@ -1,4 +1,4 @@
-From bbe822066913c0908b6366009517c19e828e1458 Mon Sep 17 00:00:00 2001
+From 41d7028d2239a98a76cc91939edb2cb728019d08 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 27 Jul 2017 08:02:51 -0700
 Subject: [PATCH] Replace pthread_yield with sched_yield
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
-index 7d9f56ef38..bc115ef61d 100644
+index b6106e8c9e..6d6ea0b739 100644
 --- a/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 +++ b/tests/auto/corelib/kernel/qmetatype/tst_qmetatype.cpp
 @@ -34,7 +34,7 @@
@@ -36,10 +36,10 @@ index 7d9f56ef38..bc115ef61d 100644
              QMetaType info(tp);
              if (!info.isValid()) {
 diff --git a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
-index fe1057bdde..e23e97b259 100644
+index 7340817ade..f34162a105 100644
 --- a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 +++ b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
-@@ -75,6 +75,7 @@
+@@ -77,6 +77,7 @@
  #include <stdlib.h>
  #include <sys/stat.h>
  #include <unistd.h>
@@ -47,7 +47,7 @@ index fe1057bdde..e23e97b259 100644
  #endif
  
  #include "private/qhostinfo_p.h"
-@@ -2129,8 +2130,8 @@ public slots:
+@@ -2131,8 +2132,8 @@ public slots:
  
  #if defined(Q_OS_MAC)
          pthread_yield_np();
diff --git a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
similarity index 83%
rename from recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
index 244cc0b..118a4f2 100644
--- a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 7c42f9b42c34d75f6c8e21e55af9b0e58f5743cc Mon Sep 17 00:00:00 2001
+From 294e4c718407e66631ce36c37258217c9adb3f83 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 90d7e2b76c..4ca6b0bd01 100644
+index 43fc06f2e5..1e9d4dcc0d 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -188,7 +188,7 @@ qtConfig(gui) {
+@@ -203,7 +203,7 @@ qtConfig(gui) {
          }
      }
  }
diff --git a/recipes-qt/qt5/qtbase/0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch b/recipes-qt/qt5/qtbase/0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
deleted file mode 100644
index 609cd84..0000000
--- a/recipes-qt/qt5/qtbase/0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 7bab0171601bc769403be62d145164137f1b7b66 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 25 Jul 2017 19:40:52 -0700
-Subject: [PATCH] tst_qstring: Disable Wformat-security with clang as well
-
-Currently, its only disabled for gcc, but we need to disable
-it with clang as well in order to compile it successfully with
-clang
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/auto/corelib/tools/qstring/tst_qstring.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tests/auto/corelib/tools/qstring/tst_qstring.cpp b/tests/auto/corelib/tools/qstring/tst_qstring.cpp
-index a0a872710c..20a9a9f9db 100644
---- a/tests/auto/corelib/tools/qstring/tst_qstring.cpp
-+++ b/tests/auto/corelib/tools/qstring/tst_qstring.cpp
-@@ -1066,6 +1066,9 @@ void tst_QString::acc_01()
- 
- QT_WARNING_PUSH
- QT_WARNING_DISABLE_GCC("-Wformat-security")
-+#ifdef __clang__
-+QT_WARNING_DISABLE_CLANG("-Wformat-security")
-+#endif
- 
- void tst_QString::isNull()
- {
diff --git a/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
deleted file mode 100644
index c527c13..0000000
--- a/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From b8e94df3d49be69659e8dfb0809c614f73c21706 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 13 Nov 2015 12:36:11 +0100
-Subject: [PATCH] configure paths for target qmake properly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-to use this patch in all qtbase/qtbase-native(sdk) changes ore made
-conditionally based on QT_CROSS_COMPILE
-
-Upstream-Status: Inappropriate [OE specific]
-
-Change-Id: I2b2f00c496216e98fbe14801f9e840ef5333c4b6
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 23 +++++++++++++++++++----
- 1 file changed, 19 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index 5af98cd77e..34dedafe91 100755
---- a/configure
-+++ b/configure
-@@ -1500,8 +1500,13 @@ if [ -z "$QT_REL_HOST_DATA" ]; then
-     fi
- fi
- 
--shortxspec=`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
--shortspec=`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
-+if [ "$QT_CROSS_COMPILE" = "yes" ] ; then
-+    shortxspec=linux-g++
-+    shortspec=linux-g++
-+else
-+    shortxspec=`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
-+    shortspec=`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
-+fi
- 
- QT_CONFIGURE_STR_OFF=0
- 
-@@ -1534,7 +1539,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
- 
- QT_CONFIGURE_STR_OFFSETS=
- QT_CONFIGURE_STRS=
--addConfStr "$CFG_SYSROOT"
-+if [ "$QT_CROSS_COMPILE" = "yes" ] ; then
-+    addConfStr ""
-+else
-+    addConfStr "$CFG_SYSROOT"
-+fi
- addConfStr "$QT_REL_HOST_BINS"
- addConfStr "$QT_REL_HOST_LIBS"
- addConfStr "$QT_REL_HOST_DATA"
-@@ -1546,6 +1555,12 @@ addConfStr "$shortspec"
- #-------------------------------------------------------------------------------
- [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
- 
-+if [ "$QT_CROSS_COMPILE" = "yes" ] ; then
-+    QT_TARGET_PREFIX=$QT_EXT_PREFIX
-+else
-+    QT_TARGET_PREFIX=$QT_HOST_PREFIX
-+fi
-+
- cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
- /* Installation date */
- static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
-@@ -1554,7 +1569,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
- static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
- #ifdef QT_BUILD_QMAKE
- static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
--static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
-+static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_TARGET_PREFIX";
- #endif
- 
- static const short qt_configure_str_offsets[] = {
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 2115557..6482935 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -17,25 +17,18 @@ LIC_FILES_CHKSUM = " \
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0006-Disable-all-unknown-features-instead-of-erroring-out.patch \
-    file://0007-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
-    file://0008-Delete-qlonglong-and-qulonglong.patch \
-    file://0009-tst_qstring-Disable-Wformat-security-with-clang-as-w.patch \
-    file://0010-Replace-pthread_yield-with-sched_yield.patch \
+    file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
+    file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0004-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0005-Disable-all-unknown-features-instead-of-erroring-out.patch \
+    file://0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0007-Delete-qlonglong-and-qulonglong.patch \
+    file://0008-Replace-pthread_yield-with-sched_yield.patch \
     file://run-ptest \
 "
 
 inherit ptest
 
-# only for target qtbase
-SRC_URI += "\
-    file://0011-configure-paths-for-target-qmake-properly.patch \
-"
-
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
 
 # for syncqt
@@ -44,7 +37,7 @@ RDEPENDS_${PN}-tools += "perl"
 # separate some parts of PACKAGECONFIG which are often changed
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-PACKAGECONFIG_X11 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xrender xinput2 glib xkb xkbcommon-evdev', '', d)}"
+PACKAGECONFIG_X11 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xinput2 glib xkb xkbcommon-evdev', '', d)}"
 PACKAGECONFIG_FONTS ?= ""
 PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
 PACKAGECONFIG_DISTRO ?= ""
@@ -108,7 +101,6 @@ PACKAGECONFIG[sql-db2] = "-sql-db2,-no-sql-db2"
 PACKAGECONFIG[sql-sqlite2] = "-sql-sqlite2,-no-sql-sqlite2,sqlite"
 PACKAGECONFIG[sql-sqlite] = "-sql-sqlite -system-sqlite,-no-sql-sqlite,sqlite3"
 PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2,libxi"
-PACKAGECONFIG[xrender] = "-xrender,-no-xrender,libxrender"
 PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
 PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
 PACKAGECONFIG[xkbcommon-evdev] = "-xkbcommon-evdev,-no-xkbcommon-evdev,libxkbcommon,xkeyboard-config"
@@ -205,4 +197,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "49dc9aa409d727824f26b246054a22b5a7dd5980"
+SRCREV = "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 3ca6647..b2a0724 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "5962967a3712ee711fd9ab58da664a3eb0acb24e"
+SRCREV = "116737dc8fa244282dda95a8f13624b66fdb5521"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 1369dee..6b895aa 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "057b3e2d6a96b42b890a0d007a8801d260c3de48"
+SRCREV = "de7f741c428febfe3c81a28f955996d2314953fc"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index de7764d..0d13dc4 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -4,13 +4,9 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -23,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "1afb57ed92a25bbc000ea4c4d7662cb8b9e267ee"
+SRCREV = "8dcbf68e4579e03ea6d2808ac0c670169b59d0df"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 7d6a51f..0cbd04e 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "a78f8d6bef57dd4283094a52551705ee02909970"
+SRCREV = "84490ff75be5acdaeb3fd93900e4ebf7ba8f539b"
diff --git a/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch b/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
deleted file mode 100644
index 423681e..0000000
--- a/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 80e63c5a2981473dd7ee3a4f382e54948bb99f75 Mon Sep 17 00:00:00 2001
-From: Gunnar Sletta <gunnar@crimson.no>
-Date: Thu, 19 Jan 2017 09:05:46 +0100
-Subject: [PATCH 2/3] Fix memory leak in V4
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Transitions contain both an id and a set of flags, but the sorting
-failed to take the flags into account in the operator<. As a result
-we would some times end up with duplicate entries if the same id
-was added multiple times with different flags.
-
-If the same id was added again and again with varying flags, this
-could lead to an ever expanding list filled with duplicate entries.
-
-Fix this by also taking flags into account in operator< so that
-operator< and operator== are symetric and the list gets correctly
-sorted.
-
-Change-Id: I762ec3f0c5b4ed9a1aecb9a883187a0445491591
-Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
-Reviewed-by: Robin Burchell <robin.burchell@crimson.no>
-Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
----
- src/qml/jsruntime/qv4internalclass_p.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/qml/jsruntime/qv4internalclass_p.h b/src/qml/jsruntime/qv4internalclass_p.h
-index dcda949..1d8ef4b 100644
---- a/src/qml/jsruntime/qv4internalclass_p.h
-+++ b/src/qml/jsruntime/qv4internalclass_p.h
-@@ -234,7 +234,7 @@ struct InternalClassTransition
-     { return id == other.id && flags == other.flags; }
- 
-     bool operator<(const InternalClassTransition &other) const
--    { return id < other.id; }
-+    { return id < other.id || (id == other.id && flags < other.flags); }
- };
- 
- struct InternalClass : public QQmlJS::Managed {
--- 
-2.9.3
-
diff --git a/recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch b/recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch
deleted file mode 100644
index 79a48f5..0000000
--- a/recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 6aa9001064c19e75e58c830eedc583e2342a7f20 Mon Sep 17 00:00:00 2001
-From: Shawn Rutledge <shawn.rutledge@qt.io>
-Date: Wed, 1 Feb 2017 12:06:26 +0100
-Subject: [PATCH 3/3] fix memory leak in
- QQuickWindowPrivate::deliverTouchAsMouse
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-A QTouchEvent is allocated with a reduced subset of TouchPoints for
-each Item to which we attempt to deliver it, and thrown away afterwards.
-(Ιt's not efficient to heap-allocate it, but we can't avoid doing it
-at all without changing behavior.)  So now it's stored in a QScopedPointer.
-
-Change-Id: I48badb493610d0a715e582a2eedae95e2006eb2b
-Reviewed-by: Jan Arve Sæther <jan-arve.saether@qt.io>
-Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
----
- src/quick/items/qquickwindow.cpp | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/quick/items/qquickwindow.cpp b/src/quick/items/qquickwindow.cpp
-index 1297dde..c130aec 100644
---- a/src/quick/items/qquickwindow.cpp
-+++ b/src/quick/items/qquickwindow.cpp
-@@ -629,8 +629,8 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
- 
-     // FIXME: make this work for mouse events too and get rid of the asTouchEvent in here.
-     Q_ASSERT(pointerEvent->asPointerTouchEvent());
--    QTouchEvent *event = pointerEvent->asPointerTouchEvent()->touchEventForItem(item);
--    if (!event)
-+    QScopedPointer<QTouchEvent> event(pointerEvent->asPointerTouchEvent()->touchEventForItem(item));
-+    if (event.isNull())
-         return false;
- 
-     // For each point, check if it is accepted, if not, try the next point.
-@@ -647,7 +647,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-                 break;
- 
-             qCDebug(DBG_TOUCH_TARGET) << "TP (mouse)" << p.id() << "->" << item;
--            QScopedPointer<QMouseEvent> mousePress(touchToMouseEvent(QEvent::MouseButtonPress, p, event, item, false));
-+            QScopedPointer<QMouseEvent> mousePress(touchToMouseEvent(QEvent::MouseButtonPress, p, event.data(), item, false));
- 
-             // Send a single press and see if that's accepted
-             QCoreApplication::sendEvent(item, mousePress.data());
-@@ -661,7 +661,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-                 pointerEventPoint->setGrabber(item);
- 
-                 if (checkIfDoubleClicked(event->timestamp())) {
--                    QScopedPointer<QMouseEvent> mouseDoubleClick(touchToMouseEvent(QEvent::MouseButtonDblClick, p, event, item, false));
-+                    QScopedPointer<QMouseEvent> mouseDoubleClick(touchToMouseEvent(QEvent::MouseButtonDblClick, p, event.data(), item, false));
-                     QCoreApplication::sendEvent(item, mouseDoubleClick.data());
-                     event->setAccepted(mouseDoubleClick->isAccepted());
-                     if (!mouseDoubleClick->isAccepted()) {
-@@ -678,7 +678,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-         } else if (touchMouseDevice == device && p.id() == touchMouseId) {
-             if (p.state() & Qt::TouchPointMoved) {
-                 if (QQuickItem *mouseGrabberItem = q->mouseGrabberItem()) {
--                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event, mouseGrabberItem, false));
-+                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event.data(), mouseGrabberItem, false));
-                     QCoreApplication::sendEvent(item, me.data());
-                     event->setAccepted(me->isAccepted());
-                     if (me->isAccepted()) {
-@@ -689,7 +689,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-                     // no grabber, check if we care about mouse hover
-                     // FIXME: this should only happen once, not recursively... I'll ignore it just ignore hover now.
-                     // hover for touch???
--                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event, item, false));
-+                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event.data(), item, false));
-                     if (lastMousePosition.isNull())
-                         lastMousePosition = me->windowPos();
-                     QPointF last = lastMousePosition;
-@@ -707,7 +707,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-             } else if (p.state() & Qt::TouchPointReleased) {
-                 // currently handled point was released
-                 if (QQuickItem *mouseGrabberItem = q->mouseGrabberItem()) {
--                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseButtonRelease, p, event, mouseGrabberItem, false));
-+                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseButtonRelease, p, event.data(), mouseGrabberItem, false));
-                     QCoreApplication::sendEvent(item, me.data());
- 
-                     if (item->acceptHoverEvents() && p.screenPos() != QGuiApplicationPrivate::lastCursorPosition) {
--- 
-2.9.3
-
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 34a8897..2194d33 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -5,20 +5,14 @@ require qt5-ptest.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
 SRC_URI += " \
     file://0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch \
-    file://0002-Fix-memory-leak-in-V4.patch \
-    file://0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch \
 "
 
 DEPENDS += "qtbase"
@@ -39,6 +33,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "fffb997e192a72b4dcd66edc2fbad5473dd359f3"
+SRCREV = "96f6ba5f562073f508cd8569ac354592fdd48f4a"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 2f32a88..8b4fb71 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -15,8 +15,3 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 QT_MODULE_BRANCH = "dev"
 SRCREV = "0555cf73c8b5abd41d8a4ff02457315c9e7c667d"
 
-do_install_append() {
-    if ls ${D}${libdir}/pkgconfig/Enginio.pc >/dev/null 2>/dev/null; then
-        sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" ${D}${libdir}/pkgconfig/Enginio.pc
-    fi
-}
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index 6abf8b7..94f04a4 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "13bbe6ea378d127b9b1d70e2858e41e86e754dc7"
+SRCREV = "ef8850fee38e2552d535379a8477c9abebdf8bb4"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index f4b43e7..d98d77e 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "1583bb5569cfc50141d879107a46146d5ccccf28"
+SRCREV = "db93af5b2bb49af74fbad6c9cd80bd7010434e78"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 3725441..4dd64df 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "cd2de115c6216ad747cf4803e65a4ce4af220795"
+SRCREV = "71ccf0dff82835ce7b5aed74c37829afdef44cde"
diff --git a/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch b/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch
new file mode 100644
index 0000000..49fcff6
--- /dev/null
+++ b/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch
@@ -0,0 +1,27 @@
+From f7c76b91e726a0e63e5226eb6e89b13e0c3509b7 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Wed, 7 Jun 2017 13:29:29 +0300
+Subject: [PATCH] Make mapbox-gl build configurable
+
+mapbox-gl-native won't compile for ARMv5 or older, so disable the
+build by default.
+
+Task-number: QTBUG-61289
+Change-Id: I5f26200f2735b363c3c322f9035b331b9159c47b
+---
+ src/plugins/geoservices/geoservices.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/plugins/geoservices/geoservices.pro b/src/plugins/geoservices/geoservices.pro
+index 0810d39..03fc119 100644
+--- a/src/plugins/geoservices/geoservices.pro
++++ b/src/plugins/geoservices/geoservices.pro
+@@ -6,7 +6,7 @@ qtConfig(concurrent) {
+     SUBDIRS += osm
+ }
+ 
+-qtConfig(c++14):!win32|mingw:!qnx {
++mapboxgl:qtConfig(c++14):!win32|mingw:!qnx {
+     !exists(../../3rdparty/mapbox-gl-native/CMakeLists.txt) {
+         warning("Submodule mapbox-gl-native does not exist. Run 'git submodule update --init' on qtlocation.")
+     } else {
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index f25d57e..ea24fe4 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -13,11 +13,22 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
 
+SRC_URI += "file://0001-Make-mapbox-gl-build-configurable.patch"
+
 PACKAGECONFIG ??= ""
 # older geoclue 0.12.99 is needed
 PACKAGECONFIG[geoclue] = ",,geoclue"
 PACKAGECONFIG[gypsy] = "-feature-gypsy,-no-feature-gypsy,gconf gypsy"
+PACKAGECONFIG[mapboxgl] = ""
 
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'mapboxgl', 'CONFIG+=mapboxgl', '', d)}"
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "41cc347040226d2c5c16b9df001d03f2724b87e5"
+SRC_URI += " \
+    ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
+    "
+
+SRCREV_qtlocation = "888d351cb0c7fe6d05ab1efe8d4dbb4b6f06cd5f"
+SRCREV_qtlocation-mapboxgl = "d45c177e8a23eefcc94930af9fa085e61136bb94"
+
+SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 7d3c3cc..c1ae786 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -4,13 +4,9 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -33,4 +29,4 @@ SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
 
-SRCREV = "544a8a4251ff9694780e563ddb6e4af1325e0115"
+SRCREV = "559c305ded730e23505e8b29536a98dc59e2acfa"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index 5657c86..eb5e4f6 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -1,7 +1,6 @@
 LICENSE = "BSD & GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -10,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "ec7663382bc6382323f3261ab199ec2edbeb5e37"
+SRCREV = "86c5036848ad004208803d9d497cfcd08c9623d6"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index d41b838..1f680e6 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -24,4 +24,4 @@ do_configure_prepend() {
 }
 
 QT_MODULE_BRANCH = "dev"
-SRCREV = "64faeb0d8003e699a4d09e7dcee1ef6eb10302ad"
+SRCREV = "695460401d9a89d2f156016d51601b2e59b64105"
diff --git a/recipes-qt/qt5/qtquickcontrols2/0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch b/recipes-qt/qt5/qtquickcontrols2/0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch
deleted file mode 100644
index d08c57e..0000000
--- a/recipes-qt/qt5/qtquickcontrols2/0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3696a416bd594d3f280c281cb2a66bc837829238 Mon Sep 17 00:00:00 2001
-From: Steffen Sledz <sledz@dresearch-fe.de>
-Date: Thu, 6 Jul 2017 13:28:07 +0200
-Subject: [PATCH] qtquickcontrols2: fix compilation of examples/texteditor
-
-git/examples/quickcontrols2/texteditor/documenthandler.cpp:284:18: error: invalid use of incomplete type 'class QDebug'
-          qWarning() << "load() called before DocumentHandler has QQmlEngine";
-
-Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
----
- examples/quickcontrols2/texteditor/documenthandler.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/examples/quickcontrols2/texteditor/documenthandler.cpp b/examples/quickcontrols2/texteditor/documenthandler.cpp
-index e57946fd..94ca82ad 100644
---- a/examples/quickcontrols2/texteditor/documenthandler.cpp
-+++ b/examples/quickcontrols2/texteditor/documenthandler.cpp
-@@ -59,6 +59,7 @@
- #include <QTextCharFormat>
- #include <QTextCodec>
- #include <QTextDocument>
-+#include <QtCore/QDebug>
- 
- DocumentHandler::DocumentHandler(QObject *parent)
-     : QObject(parent)
--- 
-2.13.2
-
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 371f4ae..a84cfb3 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -4,14 +4,10 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.LGPLv3;md5=a37e6cd7102174853307e03e6edc5f30 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
+    file://LICENSE.LGPLv3;md5=382747d0119037529ec2b98b24038eb0 \
+    file://LICENSE.GPLv3;md5=dce746aa5261707df6d6999ab9958d8b \
 "
 
 DEPENDS += "qtdeclarative"
 
-SRC_URI += " \
-    file://0001-qtquickcontrols2-fix-compilation-of-examples-textedi.patch \
-"
-
-SRCREV = "6f7852a307c7ebbdb3b6efa00cbf7626b072bbc1"
+SRCREV = "ef6b8d3081f0bf93d6d59e67c8e3f82c63c511c3"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 69f3d3b..83ed908 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,8 +17,13 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
+FILES_${PN}-qmlplugins += " \
+  ${OE_QMAKE_PATH_QML}/QtQuick/Controls/Shaders \
+  ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
+"
+
 SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "201c86391c7ff78d570fdec6e0c0b71eb1e9aae4"
+SRCREV = "dacb91916b202208681471ba764504c7c7d086f0"
diff --git a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
new file mode 100644
index 0000000..dfebc18
--- /dev/null
+++ b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
@@ -0,0 +1,37 @@
+From dd9d1e5ecdcd8267215523ad08ea893656a7f42d Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Wed, 7 Jun 2017 15:17:12 +0300
+Subject: [PATCH] Allow a tools-only build
+
+Change-Id: I3b33fc1c8877fc82568bd386b063e7a0aa57b706
+---
+ mkspecs/features/repccommon.pri | 2 +-
+ qtremoteobjects.pro             | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/repccommon.pri b/mkspecs/features/repccommon.pri
+index 5e88bf8..6efd19e 100644
+--- a/mkspecs/features/repccommon.pri
++++ b/mkspecs/features/repccommon.pri
+@@ -3,7 +3,7 @@ cmd = $${QT.remoteobjects.bins}/repc
+ contains(QMAKE_HOST.os, Windows) {
+     cmd = $$system_path($${cmd}.exe)
+ }
+-exists($$cmd): QT_TOOL.repc.binary = $$cmd
++false:exists($$cmd): QT_TOOL.repc.binary = $$cmd
+ 
+ # qtPrepareTool honors QT_TOOL.repc.binary if set
+ qtPrepareTool(QMAKE_REPC, repc)
+diff --git a/qtremoteobjects.pro b/qtremoteobjects.pro
+index c2e2b6b..93c2bb5 100644
+--- a/qtremoteobjects.pro
++++ b/qtremoteobjects.pro
+@@ -2,3 +2,8 @@ CONFIG += examples_need_tools tests_need_tools
+ load(qt_parts)
+ 
+ SUBDIRS += mkspecs
++
++tools-only {
++    sub_tools.depends -= sub_src
++    SUBDIRS = sub_tools
++}
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
new file mode 100644
index 0000000..f563818
--- /dev/null
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -0,0 +1,27 @@
+LICENSE = "BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 ) & ( GPL-2.0+ | LGPL-3.0 ) | The-Qt-Company-Commercial"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
+    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+"
+
+require qt5.inc
+require qt5-git.inc
+
+DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
+
+SRC_URI += " \
+    file://0001-Allow-a-tools-only-build.patch \
+"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG_class-native ??= "tools-only"
+PACKAGECONFIG_class-nativesdk ??= "tools-only"
+PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
+
+EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
+
+SRCREV = "ae0b101884b05355e3a7bc06dbca722ad3d08d0f"
+
+BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 3f8b64a..ae5e0da 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -25,4 +25,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "c35df2ec0ee05351912e768d298a7c627dbdd1ef"
+SRCREV = "e00ca9b6bec2adf78fd14e02376ecf1b55a93b0c"
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index d69d00f..c2c00e1 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,7 +10,7 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "4704292500b98143eee9b0fb0b6a34a858ed1253"
+SRCREV = "eff82ac957e051f16f64c287f2dfaec9049bdfc1"
 
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 93a0971..17d0639 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "1220a31e6c2f91b34b4a05773621dddab8c4315a"
+SRCREV = "0c3c4d01ea34ed98a0d2928662f07b673f00535d"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 325d975..93a826b 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "c8fe92ef54b2d310e8c8c143962fd6f43bf46c27"
+SRCREV = "20811e3b004af817e3f02982c755e8b1560b8c3d"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index edecc04..957000c 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "74aad2578ecb6739007449a06a54dd7abd64c85b"
+SRCREV = "687f5a9bd44a45a29d24925f29470c43d6729dee"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 24a0d91..fb8d44e 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "1b3a7ae14d25f1caa3f6bedad3cfeb7d83b3904e"
+SRCREV = "4fd787e90c70afbaa168abb3efdb8757ba77f3a4"
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
deleted file mode 100644
index 17d5d51..0000000
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 95a418157ce5f49052ec1c349581d1811a79c9eb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 17 Jan 2014 14:33:19 +0100
-Subject: [PATCH] assistant/help: fix linking of dependent libraries
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-else we get:
-| ...ld: warning: libQt5CLucene.so.5, needed by ...libQt5Help.so, not found (try using -rpath or -rpath-link)
-| ...undefined reference to `QCLucenePhraseQuery::getTerms() const'
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/assistant/help/help.pro | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
-index 37d5ba4..8de8763 100644
---- a/src/assistant/help/help.pro
-+++ b/src/assistant/help/help.pro
-@@ -60,3 +60,5 @@ HEADERS += qhelpsearchindexwriter_clucene_p.h \
-     qhelpsearchindexreader_clucene_p.h
- 
- load(qt_module)
-+
-+LIBS += -lQt5CLucene
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 5c0f51c..9ca90a2 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -4,13 +4,9 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=fb91571854638f10b2e5f36562661a5a \
-    file://LICENSE.LGPLv3;md5=a909b94c1c9674b2aa15ff03a86f518a \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=bfdd8aa675169432d6d9b63d056de148 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -20,8 +16,6 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 SRC_URI += " \
     file://run-ptest \
-    file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
-    file://0003-add-noqtwebkit-configuration.patch \
     file://0004-linguist-tools-cmake-allow-overriding-the-location-f.patch \
 "
 
@@ -33,7 +27,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "30c10900adecca55faa1d59c2f0caac74b1f9df6"
+SRCREV = "88e02bb0a9b97d68a4b270e4ddfb6d0847c702a9"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 53ab199..822517f 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "c0ae29b2328922f16cb2305f8579c2a869c871b0"
+SRCREV = "3e727a890f7856978469ee38ef0619b1b59a8ca7"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 244e529..2b865bb 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -50,4 +50,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "cfa4ab4cbf13971d4b71ee920353822755a3bf31"
+SRCREV = "bdf61afe76e94ef03da1332c4540646f18f5852f"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index bcddb32..26ef853 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -7,13 +7,9 @@ DEPENDS_append_class-target = " libxkbcommon"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -41,7 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "0e2a950895805457a45abe860bc91a7cc4ba405e"
+SRCREV = "f1cf62fa8e9ffa2548c9968906848596f50dbc0b"
 
 # From https://bugreports.qt.io/browse/QTBUG-57767
 SRC_URI += " \
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index d5f8685..f1167a9 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -17,4 +17,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "e3ddde4b26a72d57beeeed4e2d3384896e3a399d"
+SRCREV = "6383f0fc5eec4935697a6d2d2f87b511bbeb678e"
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
rename to recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index 587b632..44c3f0b 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,4 +1,4 @@
-From 79a62dbe498946f487edcb0228c350d9fe7e4d09 Mon Sep 17 00:00:00 2001
+From 1634633d27cea7369111c9ea6d08be8515c15ccd Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
 Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
deleted file mode 100644
index 560a027..0000000
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From d70a7ccba09ba96e0068ad253b3aac7a47125f8e Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH] chromium base.gypi: include atomicops_internals_x86_gcc.cc
- when building for x64 arch
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- chromium/base/base.gypi | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/chromium/base/base.gypi b/chromium/base/base.gypi
-index a4da596070..13173d621e 100644
---- a/chromium/base/base.gypi
-+++ b/chromium/base/base.gypi
-@@ -845,7 +845,7 @@
-                 ['include', '^nix/'],
-               ],
-           }],
--          ['use_qt==1 and target_arch=="ia32"', {
-+          ['use_qt==1 and target_arch=="ia32" or target_arch=="x64"', {
-               'sources/': [
-                 ['include', 'atomicops_internals_x86_gcc.cc'],
-               ],
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
deleted file mode 100644
index 3d8b3b0..0000000
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2f3a16a0efaf02521425da2db7d88710da3074b4 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
- anywhere in path, but at the end
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 236ee8ac..0333bdd1 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -319,9 +319,9 @@ defineReplace(mocOutput) {
-   out = $$1
-   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
-   for(ext, $$list($${QMAKE_EXT_CPP})): \
--      out = $$replace(out, ^(.*)($$re_escape($${ext})), $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
-+      out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
-   for(ext, $$list($${QMAKE_EXT_H})): \
--      out = $$replace(out, ^(.*)($$re_escape($${ext})), $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-+      out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-   return($$out)
- }
- 
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
similarity index 64%
rename from recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
rename to recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
index a460178..a91a298 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 5ff09196304a38304893e0703a8a7d2df2ec889a Mon Sep 17 00:00:00 2001
+From 491576d7e67d00b93106592140e5d7f0f34ea641 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
@@ -8,14 +8,14 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Frieder Schrempf <frieder.schrempf@online.de>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- tools/qmake/mkspecs/features/functions.prf | 6 ++++++
+ mkspecs/features/functions.prf | 6 ++++++
  1 file changed, 6 insertions(+)
 
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 687d34f8..5c0c40fd 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -21,6 +21,12 @@ defineTest(isPlatformSupported) {
+diff --git a/mkspecs/features/functions.prf b/mkspecs/features/functions.prf
+index eb421f8b..4513742d 100644
+--- a/mkspecs/features/functions.prf
++++ b/mkspecs/features/functions.prf
+@@ -33,6 +33,12 @@ defineTest(isPlatformSupported) {
        return(false)
      }
      gcc:!clang:!isGCCVersionSupported(): return(false)
diff --git a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
similarity index 88%
rename from recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
rename to recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 4001563..d5567c3 100644
--- a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From 0e1143af443c80cd49663b55128ab4dd8e570ee1 Mon Sep 17 00:00:00 2001
+From 6b48d76b5af38a49f8e438e45c387f01b263e483 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index d692140e..58528114 100644
+index 2ecd70d7..703d1a92 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
 @@ -59,6 +59,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
new file mode 100644
index 0000000..5f9eb3a
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Force-host-toolchain-configuration.patch
@@ -0,0 +1,40 @@
+From b1a6f73d49a340e99145a4c4cf70dc796ed632ff Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Wed, 15 Mar 2017 13:53:28 +0200
+Subject: [PATCH] chromium: Force host toolchain configuration
+
+Force gcc/g++ to be used for parts using host toolchain, since
+the option(host_build) does not work in yocto builds.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ chromium/tools/gn/bootstrap/bootstrap.py | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/chromium/tools/gn/bootstrap/bootstrap.py b/chromium/tools/gn/bootstrap/bootstrap.py
+index 43d252b43e..e58347848e 100755
+--- a/chromium/tools/gn/bootstrap/bootstrap.py
++++ b/chromium/tools/gn/bootstrap/bootstrap.py
+@@ -298,14 +298,14 @@ def write_gn_ninja(path, root_gen_dir, options):
+     ld = os.environ.get('LD', 'link.exe')
+     ar = os.environ.get('AR', 'lib.exe')
+   else:
+-    cc = os.environ.get('CC', 'cc')
+-    cxx = os.environ.get('CXX', 'c++')
++    cc = os.environ.get('CC_host', 'gcc')
++    cxx = os.environ.get('CXX_host', 'g++')
+     ld = cxx
+-    ar = os.environ.get('AR', 'ar')
++    ar = os.environ.get('AR_host', 'ar')
+ 
+-  cflags = os.environ.get('CFLAGS', '').split()
+-  cflags_cc = os.environ.get('CXXFLAGS', '').split()
+-  ldflags = os.environ.get('LDFLAGS', '').split()
++  cflags = os.environ.get('CFLAGS_host', '').split()
++  cflags_cc = os.environ.get('CXXFLAGS_host', '').split()
++  ldflags = os.environ.get('LDFLAGS_host', '').split()
+   include_dirs = [root_gen_dir, SRC_ROOT]
+   libs = []
+ 
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
deleted file mode 100644
index 93e68b5..0000000
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From bf7f70ae0bf7345c2546f4f4bc371a9e8eeb0bd3 Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH] functions.prf: Make sure we only use the file name to
- generate it's moc'ed abbreviation
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 0333bdd1..687d34f8 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -316,7 +316,8 @@ defineReplace(findIncludedMocFiles) {
- }
- 
- defineReplace(mocOutput) {
--  out = $$1
-+  in = $$1
-+  out = $$basename(in)
-   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
-   for(ext, $$list($${QMAKE_EXT_CPP})): \
-       out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
diff --git a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
similarity index 80%
rename from recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
rename to recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
index 196ef4c..2fa1764 100644
--- a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From d8fd8c8388c54a0322e60e8be49236df3862ec56 Mon Sep 17 00:00:00 2001
+From 95a6e3fd9e8498cb1f59120d402ec8ecfcd3ec59 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
@@ -9,12 +9,12 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
-index b21d40b8..758d5335 100644
+index c378c327..1d33d956 100644
 --- a/src/core/media_capture_devices_dispatcher.h
 +++ b/src/core/media_capture_devices_dispatcher.h
-@@ -46,6 +46,8 @@
+@@ -45,6 +45,8 @@
+ #include <list>
  #include <map>
- #include <QtCore/qcompilerdetection.h>
  
 +#include <QCoreApplication>
 +
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
similarity index 93%
rename from recipes-qt/qt5/qtwebengine/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
rename to recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index b1a0857..8785842 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From fac50c58630264d67e447c2dcdcf54b4f806d35e Mon Sep 17 00:00:00 2001
+From 8910e65fd777120261f16c4a35ace2b0dc6181b3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch
deleted file mode 100644
index f2456dd..0000000
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-v8-fix-build-with-gcc7.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 944746d5d04ea8eaf268a97440c98136beae1e47 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 11 Jul 2017 10:15:41 +0200
-Subject: [PATCH] chromium: v8 fix build with gcc7
-
-Use the fix from nodejs:
-https://github.com/nodejs/node/commit/2a2a5565c298639b823250b571101f51210c50e8
-
-* fixes:
-| ../../git/src/v8/src/objects-body-descriptors.h: In static member function 'static void v8::internal::FixedBodyDescriptor<start_offset, end_offset, size>::IterateBody(v8::internal::HeapObject*, int)':
-| ../../git/src/v8/src/objects-body-descriptors.h:102:20: error: no matching function for call to 'v8::internal::FixedBodyDescriptor<start_offset, end_offset, size>::IterateBody(v8::internal::HeapObject*&)'
-|      IterateBody(obj);
-|                     ^
-
-and
-
-| ../../v8/src/objects.h: In member function 'uint32_t v8::internal::HashTable<Derived, Shape, Key>::Hash(Key)':
-| ../../v8/src/objects.h:3205:46: error: invalid use of incomplete type 'class v8::internal::Heap' [-Werror]
-|        return Shape::SeededHash(key, GetHeap()->HashSeed());
-|                                               ^~
-
-and
-
-../../v8/src/heap/mark-compact.cc:3660:43: error: 'v8::internal::PointerUpdateJobTraits<direction>::UpdateTypedPointers(v8::internal::Heap*, v8::internal::MemoryChunk*)::<lambda(v8::internal::SlotType, v8::internal::Address, v8::internal::Address)> [with v8::internal::PointerDirection direction = (v8::internal::PointerDirection)1; v8::internal::Address = unsigned char*; v8::internal::byte = unsigned char]::<lambda(v8::internal::Object**)>' declared with greater visibility than the type of its field 'v8::internal::PointerUpdateJobTraits<direction>::UpdateTypedPointers(v8::internal::Heap*, v8::internal::MemoryChunk*)::<lambda(v8::internal::SlotType, v8::internal::Address, v8::internal::Address)> [with v8::internal::PointerDirection direction = (v8::internal::PointerDirection)1; v8::internal::Address = unsigned char*; v8::internal::byte = unsigned char]::<lambda(v8::internal::Object**)>::<heap capture>' [-Werror=attributes]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- chromium/v8/src/heap/mark-compact.cc       |  5 +++++
- chromium/v8/src/objects-body-descriptors.h |  2 +-
- chromium/v8/src/objects-inl.h              | 20 ++++++++++++++++++++
- chromium/v8/src/objects.h                  | 20 ++++----------------
- 4 files changed, 30 insertions(+), 17 deletions(-)
-
-diff --git a/chromium/v8/src/heap/mark-compact.cc b/chromium/v8/src/heap/mark-compact.cc
-index f9a55dfc61..da46270aec 100644
---- a/chromium/v8/src/heap/mark-compact.cc
-+++ b/chromium/v8/src/heap/mark-compact.cc
-@@ -3614,6 +3614,9 @@ void MarkCompactCollector::EvacuateNewSpaceAndCandidates() {
- #endif
- }
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic warning "-Wattributes"
-+
- template <PointerDirection direction>
- class PointerUpdateJobTraits {
-  public:
-@@ -3701,6 +3704,8 @@ class PointerUpdateJobTraits {
-   }
- };
- 
-+#pragma GCC diagnostic pop
-+
- int NumberOfPointerUpdateTasks(int pages) {
-   if (!FLAG_parallel_pointer_update) return 1;
-   const int kMaxTasks = 4;
-diff --git a/chromium/v8/src/objects-body-descriptors.h b/chromium/v8/src/objects-body-descriptors.h
-index 91cb8883be..a1c3634bd7 100644
---- a/chromium/v8/src/objects-body-descriptors.h
-+++ b/chromium/v8/src/objects-body-descriptors.h
-@@ -99,7 +99,7 @@ class FixedBodyDescriptor final : public BodyDescriptorBase {
- 
-   template <typename StaticVisitor>
-   static inline void IterateBody(HeapObject* obj, int object_size) {
--    IterateBody(obj);
-+    IterateBody<StaticVisitor>(obj);
-   }
- };
- 
-diff --git a/chromium/v8/src/objects-inl.h b/chromium/v8/src/objects-inl.h
-index 58441d3853..e850fd787f 100644
---- a/chromium/v8/src/objects-inl.h
-+++ b/chromium/v8/src/objects-inl.h
-@@ -38,6 +38,26 @@
- namespace v8 {
- namespace internal {
- 
-+template <typename Derived, typename Shape, typename Key>
-+uint32_t HashTable<Derived, Shape, Key>::Hash(Key key) {
-+  if (Shape::UsesSeed) {
-+    return Shape::SeededHash(key, GetHeap()->HashSeed());
-+  } else {
-+    return Shape::Hash(key);
-+  }
-+}
-+
-+
-+template <typename Derived, typename Shape, typename Key>
-+uint32_t HashTable<Derived, Shape, Key>::HashForObject(Key key,
-+                                                       Object* object) {
-+  if (Shape::UsesSeed) {
-+    return Shape::SeededHashForObject(key, GetHeap()->HashSeed(), object);
-+  } else {
-+    return Shape::HashForObject(key, object);
-+  }
-+}
-+
- PropertyDetails::PropertyDetails(Smi* smi) {
-   value_ = smi->value();
- }
-diff --git a/chromium/v8/src/objects.h b/chromium/v8/src/objects.h
-index 7d774beb5b..eda1478766 100644
---- a/chromium/v8/src/objects.h
-+++ b/chromium/v8/src/objects.h
-@@ -3193,22 +3193,10 @@ class HashTable : public HashTableBase {
-  public:
-   typedef Shape ShapeT;
- 
--  // Wrapper methods
--  inline uint32_t Hash(Key key) {
--    if (Shape::UsesSeed) {
--      return Shape::SeededHash(key, GetHeap()->HashSeed());
--    } else {
--      return Shape::Hash(key);
--    }
--  }
--
--  inline uint32_t HashForObject(Key key, Object* object) {
--    if (Shape::UsesSeed) {
--      return Shape::SeededHashForObject(key, GetHeap()->HashSeed(), object);
--    } else {
--      return Shape::HashForObject(key, object);
--    }
--  }
-+  // Wrapper methods.  Defined in src/objects-inl.h
-+  // to break a cycle with src/heap/heap.h.
-+  inline uint32_t Hash(Key key);
-+  inline uint32_t HashForObject(Key key, Object* object);
- 
-   // Returns a new HashTable object.
-   MUST_USE_RESULT static Handle<Derived> New(
diff --git a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
new file mode 100644
index 0000000..142595a
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
@@ -0,0 +1,44 @@
+From e81f0a5139f8f1ea131438def3fe1aabe997aeff Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Wed, 15 Mar 2017 13:53:28 +0200
+Subject: [PATCH] Force host toolchain configuration
+
+Force gcc/g++ to be used for parts using host toolchain, since
+the option(host_build) does not work in yocto builds.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
+---
+ src/buildtools/configure_host.pro | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/buildtools/configure_host.pro b/src/buildtools/configure_host.pro
+index fd27643e..f9acb6ff 100644
+--- a/src/buildtools/configure_host.pro
++++ b/src/buildtools/configure_host.pro
+@@ -28,9 +28,9 @@ GN_CONTENTS = \
+ "import(\"//build/config/sysroot.gni\")" \
+ "import(\"//build/toolchain/gcc_toolchain.gni\")" \
+ "gcc_toolchain(\"host\") {" \
+-"  cc = \"$$which($$QMAKE_CC)\" " \
+-"  cxx = \"$$which($$QMAKE_CXX)\" " \
+-"  ld = \"$$which($$QMAKE_LINK)\" " \
++"  cc = \"$$which(gcc)\" " \
++"  cxx = \"$$which(g++)\" " \
++"  ld = \"$$which(g++)\" " \
+ "  ar = \"$$which(ar)\" " \
+ "  nm = \"$$which(nm)\" " \
+ "  toolchain_args = { " \
+@@ -41,9 +41,9 @@ GN_CONTENTS = \
+ "  } " \
+ "}" \
+ "gcc_toolchain(\"v8_snapshot\") {" \
+-"  cc = \"$$which($$QMAKE_CC)\" " \
+-"  cxx = \"$$which($$QMAKE_CXX)\" " \
+-"  ld = \"$$which($$QMAKE_LINK)\" " \
++"  cc = \"$$which(gcc)\" " \
++"  cxx = \"$$which(g++)\" " \
++"  ld = \"$$which(g++)\" " \
+ "  ar = \"$$which(ar)\" " \
+ "  nm = \"$$which(nm)\" " \
+ "  toolchain_args = { " \
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch
deleted file mode 100644
index 041d29b..0000000
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-WebKit-fix-build-with-gcc7.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f62b851edbcc3ac3da448d7570908ad78ebe77dc Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 11 Jul 2017 10:18:13 +0200
-Subject: [PATCH] chromium: WebKit fix build with gcc7
-
-Based on qtwebengine-opensource-src-5.8.0-wtf-gcc7.patch from
-http://git.net/ml/scm-fedora-commits/2017-03/msg15697.html
-
-* Fixes:
-In file included from ../../git/src/third_party/WebKit/Source/platform/heap/ThreadingTraits.h:14:0,
-                 from ../../git/src/third_party/WebKit/Source/platform/heap/ThreadState.h:37,
-                 from ../../git/src/third_party/WebKit/Source/platform/heap/GarbageCollected.h:8,
-                 from ../../git/src/third_party/WebKit/Source/platform/heap/Visitor.h:35,
-                 from ../../git/src/third_party/WebKit/Source/platform/heap/GCInfo.h:8,
-                 from ../../git/src/third_party/WebKit/Source/platform/heap/Heap.h:35,
-                 from ../../git/src/third_party/WebKit/Source/platform/heap/Handle.h:34,
-                 from ../../git/src/third_party/WebKit/public/platform/WebPrivatePtr.h:38,
-                 from ../../git/src/third_party/WebKit/public/platform/WebString.h:35,
-                 from ../../git/src/third_party/WebKit/Source/platform/exported/FilePathConversion.cpp:8:
-../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h: In member function 'void WTF::LinkedHashSet<Value, HashFunctions, HashTraits, Allocator>::swap(WTF::LinkedHashSet<Value, HashFunctions, HashTraits, Allocator>&)':
-../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h:549:5: error: there are no arguments to 'swapAnchor' that depend on a template parameter, so a declaration of 'swapAnchor' must be available [-fpermissive]
-     swapAnchor(m_anchor, other.m_anchor);
-     ^~~~~~~~~~
-../../git/src/third_party/WebKit/Source/wtf/LinkedHashSet.h:549:5: note: (if you use '-fpermissive', G++ will accept your code, but allowing the use of an undeclared name is deprecated)
----
- chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h b/chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h
-index e85c72fd65..6f94cd6734 100644
---- a/chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h
-+++ b/chromium/third_party/WebKit/Source/wtf/LinkedHashSet.h
-@@ -542,6 +542,8 @@ inline LinkedHashSet<T, U, V, W>& LinkedHashSet<T, U, V, W>::operator=(LinkedHas
-     return *this;
- }
- 
-+inline void swapAnchor(LinkedHashSetNodeBase& a, LinkedHashSetNodeBase& b);
-+
- template<typename T, typename U, typename V, typename W>
- inline void LinkedHashSet<T, U, V, W>::swap(LinkedHashSet& other)
- {
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
similarity index 88%
rename from recipes-qt/qt5/qtwebengine/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
rename to recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index 43982da..05b813b 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From e7e4def6d1422b84a9d6a6f7b285515d96210e87 Mon Sep 17 00:00:00 2001
+From 86f467724070e854c8c6b13269951c97c0832dae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/chromium/base/trace_event/malloc_dump_provider.cc b/chromium/base/trace_event/malloc_dump_provider.cc
-index 3b1a933bce..a554d03739 100644
+index 7d0cb57931..10be59ebad 100644
 --- a/chromium/base/trace_event/malloc_dump_provider.cc
 +++ b/chromium/base/trace_event/malloc_dump_provider.cc
-@@ -103,6 +103,7 @@ MallocDumpProvider::~MallocDumpProvider() {}
+@@ -210,6 +210,7 @@ MallocDumpProvider::~MallocDumpProvider() {}
  // the current process.
  bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
                                        ProcessMemoryDump* pmd) {
@@ -21,7 +21,7 @@ index 3b1a933bce..a554d03739 100644
    size_t total_virtual_size = 0;
    size_t resident_size = 0;
    size_t allocated_objects_size = 0;
-@@ -195,7 +196,7 @@ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
+@@ -321,7 +322,7 @@ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
      pmd->DumpHeapUsage(metrics_by_context, overhead, "malloc");
    }
    tid_dumping_heap_ = kInvalidThreadId;
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
similarity index 85%
rename from recipes-qt/qt5/qtwebengine/0007-chromium-musl-include-fcntl.h-for-loff_t.patch
rename to recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
index 95a12b0..2d7bd02 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,4 +1,4 @@
-From eac1905c90085d3b9de3764078022643dd1b5ce9 Mon Sep 17 00:00:00 2001
+From 0a409a773f2b2936a2f1868d983e7bd1c92110bd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:37:49 -0700
 Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
@@ -9,10 +9,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-index bdbc4b7e3b..b53dd46c57 100644
+index b29ec2d29a..91f77dd88d 100644
 --- a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
 +++ b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-@@ -151,6 +151,7 @@ extern "C" {
+@@ -150,6 +150,7 @@ extern "C" {
  #include <stddef.h>
  #include <stdint.h>
  #include <string.h>
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
rename to recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index d15a63f..f58de8f 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From 1690ac56cc013c3a18aa3c83e0efae47cc9da4f0 Mon Sep 17 00:00:00 2001
+From 375b70a99760c156b45e60def9bafd04902fb5a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
 Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0009-chromium-musl-linux-glibc-make-the-distinction.patch
rename to recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
index 434d62c..c3b1cbb 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From 71072da07e963ae1b05f9d956ef715de8d249c5d Mon Sep 17 00:00:00 2001
+From 314cfb7b41be8fc4f962956e0acd34f110114c6e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
similarity index 85%
rename from recipes-qt/qt5/qtwebengine/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
rename to recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index 4393103..550fd79 100644
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From 43384ce7ab1d3b14820cb9bc0698130be9291a8e Mon Sep 17 00:00:00 2001
+From bc3745992889e3dc3b42c890b6a458038c6994e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/base/allocator/allocator_shim.cc b/chromium/base/allocator/allocator_shim.cc
-index af08ec039f..15070b9a13 100644
+index 95480ea4b6..1de3d1a532 100644
 --- a/chromium/base/allocator/allocator_shim.cc
 +++ b/chromium/base/allocator/allocator_shim.cc
-@@ -244,7 +244,7 @@ void ShimFree(void* address) {
+@@ -266,7 +266,7 @@ void ShimFree(void* address) {
  // In the case of tcmalloc we also want to plumb into the glibc hooks
  // to avoid that allocations made in glibc itself (e.g., strdup()) get
  // accidentally performed on the glibc heap instead of the tcmalloc one.
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
rename to recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index 04e0012..82a2ccc 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From 701bb2640d5e5b03e8e019600a076c93508e1541 Mon Sep 17 00:00:00 2001
+From de4e672044de11c5927aeb42a554f5eced0abf6c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
 Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Match-syscalls-to-match-musl.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch
similarity index 84%
rename from recipes-qt/qt5/qtwebengine/0012-chromium-musl-Match-syscalls-to-match-musl.patch
rename to recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch
index b5a0f84..235e2cc 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Match-syscalls-to-match-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch
@@ -1,4 +1,4 @@
-From ad184ecc5e5e67d1f3862e9ed3f767dff9bbc414 Mon Sep 17 00:00:00 2001
+From e4d99e001315f1bb34e6ff6531c0a528640b76d8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:24:49 -0700
 Subject: [PATCH] chromium: musl: Match syscalls to match musl
@@ -9,10 +9,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 16 insertions(+)
 
 diff --git a/chromium/third_party/lss/linux_syscall_support.h b/chromium/third_party/lss/linux_syscall_support.h
-index 8a42c1c868..8e878c70f2 100644
+index 9dbd2391b2..a715de177c 100644
 --- a/chromium/third_party/lss/linux_syscall_support.h
 +++ b/chromium/third_party/lss/linux_syscall_support.h
-@@ -717,6 +717,14 @@ struct kernel_statfs {
+@@ -793,6 +793,14 @@ struct kernel_statfs {
  #endif
  
  
@@ -27,7 +27,7 @@ index 8a42c1c868..8e878c70f2 100644
  #if defined(__x86_64__)
  #ifndef ARCH_SET_GS
  #define ARCH_SET_GS             0x1001
-@@ -1134,6 +1142,14 @@ struct kernel_statfs {
+@@ -1210,6 +1218,14 @@ struct kernel_statfs {
  #ifndef __NR_fallocate
  #define __NR_fallocate          285
  #endif
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
rename to recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index 68b8f45..da0858a 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From c892406f07b4e214397c55de62eccac3d558b134 Mon Sep 17 00:00:00 2001
+From 80953719539b60ea6a908710d4bb7cb78acc6920 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
 Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch
rename to recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index c980189..16705e5 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From be624e7cc1bc18e9e198bba16fcb224a7f9746fc Mon Sep 17 00:00:00 2001
+From 0b4922e1ed4b7f4e7ada7a840dec067f05c8e9f7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
 Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
diff --git a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
similarity index 70%
rename from recipes-qt/qt5/qtwebengine/0015-chromium-musl-Adjust-default-pthread-stack-size.patch
rename to recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
index 997e312..82e49f6 100644
--- a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,4 +1,4 @@
-From 295fd835b22203807962a3eea08a12b74ae54c2c Mon Sep 17 00:00:00 2001
+From 54cf1a5476fac8b7d5a18742a63abdec788989a7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/chromium/base/threading/platform_thread_linux.cc b/chromium/base/threading/platform_thread_linux.cc
-index 95ed32418f..666e85ba33 100644
+index 92fbda5ee1..c41579d4ed 100644
 --- a/chromium/base/threading/platform_thread_linux.cc
 +++ b/chromium/base/threading/platform_thread_linux.cc
-@@ -96,7 +96,8 @@ void TerminateOnThread() {}
+@@ -175,7 +175,8 @@ void TerminateOnThread() {}
  
  size_t GetDefaultThreadStackSize(const pthread_attr_t& attributes) {
  #if !defined(THREAD_SANITIZER)
@@ -24,24 +24,24 @@ index 95ed32418f..666e85ba33 100644
    // ThreadSanitizer bloats the stack heavily. Evidence has been that the
    // default stack size isn't enough for some browser tests.
 diff --git a/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp b/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
-index 3c0a0395b1..2af6073e21 100644
+index 1d164f510a..3358deb256 100644
 --- a/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
 +++ b/chromium/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
-@@ -73,7 +73,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize()
-     // FIXME: On Mac OSX and Linux, this method cannot estimate stack size
-     // correctly for the main thread.
+@@ -68,7 +68,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize() {
+ // FIXME: On Mac OSX and Linux, this method cannot estimate stack size
+ // correctly for the main thread.
  
 -#if defined(__GLIBC__) || OS(ANDROID) || OS(FREEBSD)
 +#if OS(LINUX) || OS(ANDROID) || OS(FREEBSD)
-     // pthread_getattr_np() can fail if the thread is not invoked by
-     // pthread_create() (e.g., the main thread of webkit_unit_tests).
-     // If so, a conservative size estimate is returned.
-@@ -135,7 +135,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize()
+   // pthread_getattr_np() can fail if the thread is not invoked by
+   // pthread_create() (e.g., the main thread of webkit_unit_tests).
+   // If so, a conservative size estimate is returned.
+@@ -135,7 +135,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize() {
+ }
  
- void* StackFrameDepth::getStackStart()
- {
+ void* StackFrameDepth::getStackStart() {
 -#if defined(__GLIBC__) || OS(ANDROID) || OS(FREEBSD)
 +#if OS(LINUX) || OS(ANDROID) || OS(FREEBSD)
-     pthread_attr_t attr;
-     int error;
+   pthread_attr_t attr;
+   int error;
  #if OS(FREEBSD)
diff --git a/recipes-qt/qt5/qtwebengine/0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
similarity index 82%
rename from recipes-qt/qt5/qtwebengine/0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
rename to recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index 2e80de8..ac3afbf 100644
--- a/recipes-qt/qt5/qtwebengine/0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From 91d9e3476c6432ae9ea8f8c0a9f6c435be844da0 Mon Sep 17 00:00:00 2001
+From 77bac704279103e74d8d7d35c933517dcfb9b7fc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
@@ -9,7 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/chromium/device/serial/serial_io_handler_posix.cc b/chromium/device/serial/serial_io_handler_posix.cc
-index 158c374a03..c08fb4a8ec 100644
+index a2ca2e2309..e139cdf9e9 100644
 --- a/chromium/device/serial/serial_io_handler_posix.cc
 +++ b/chromium/device/serial/serial_io_handler_posix.cc
 @@ -6,6 +6,7 @@
@@ -18,5 +18,5 @@ index 158c374a03..c08fb4a8ec 100644
  #include <termios.h>
 +#include <asm-generic/ioctls.h>
  
+ #include "base/files/file_util.h"
  #include "base/posix/eintr_wrapper.h"
- #include "build/build_config.h"
diff --git a/recipes-qt/qt5/qtwebengine/0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
similarity index 88%
rename from recipes-qt/qt5/qtwebengine/0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
rename to recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index fe141aa..668697c 100644
--- a/recipes-qt/qt5/qtwebengine/0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,4 +1,4 @@
-From d05c22bdabe10c0db9b65252e442251efc81a379 Mon Sep 17 00:00:00 2001
+From 27690efdf920cafeab96f70eec0c66803c908cd4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
 Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
@@ -9,10 +9,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-index b53dd46c57..58da4d19d7 100644
+index 91f77dd88d..bb84a0b305 100644
 --- a/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
 +++ b/chromium/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
-@@ -1930,7 +1930,7 @@ typedef unsigned long int ulong;
+@@ -1929,7 +1929,7 @@ typedef unsigned long int ulong;
    #if defined(__x86_64__)
      /* Need to make sure __off64_t isn't truncated to 32-bits under x32.  */
      LSS_INLINE void* LSS_NAME(mmap)(void *s, size_t l, int p, int f, int d,
diff --git a/recipes-qt/qt5/qtwebengine/0017-chromium-musl-link-with-libexecinfo-on-musl.patch b/recipes-qt/qt5/qtwebengine/0017-chromium-musl-link-with-libexecinfo-on-musl.patch
deleted file mode 100644
index 5e28adb..0000000
--- a/recipes-qt/qt5/qtwebengine/0017-chromium-musl-link-with-libexecinfo-on-musl.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From a8163b060b699aa6678c45c970f4fbc806a6c198 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jul 2017 17:41:43 -0700
-Subject: [PATCH] chromium: musl: link with libexecinfo on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- chromium/base/base.gyp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/chromium/base/base.gyp b/chromium/base/base.gyp
-index 3c3aded640..347b7e7856 100644
---- a/chromium/base/base.gyp
-+++ b/chromium/base/base.gyp
-@@ -126,6 +126,7 @@
-               '-lrt',
-               # For 'native_library_linux.cc'
-               '-ldl',
-+              '-lexecinfo',
-             ],
-           },
-           'conditions': [
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 84c4668..659cbcf 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += " \
     ninja-native \
+    yasm-native \
     qtwebchannel \
     qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
     qtlocation \
@@ -31,10 +32,11 @@ EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm \
                         GYP_CONFIG+=use_allocator=none \
                         GYP_CONFIG+=use_experimental_allocator_shim=false \
 "
+EXTRA_QMAKEVARS_CONFIGURE += "-feature-system-ninja -no-feature-system-gn"
 
 # To use system ffmpeg you need to enable also libwebp, opus, vpx											    
 # Only depenedencies available in oe-core are enabled by default
-PACKAGECONFIG ??= "libwebp flac libevent libxslt speex"
+PACKAGECONFIG ??= "libwebp flac libevent libxslt speex nss"
 PACKAGECONFIG[opus] = "WEBENGINE_CONFIG+=use_system_opus,,libopus"
 PACKAGECONFIG[icu] = "WEBENGINE_CONFIG+=use_system_icu,,icu"
 PACKAGECONFIG[ffmpeg] = "WEBENGINE_CONFIG+=use_system_ffmpeg,,libav"
@@ -45,6 +47,7 @@ PACKAGECONFIG[libxslt] = "WEBENGINE_CONFIG+=use_system_libxslt,,libxslt"
 PACKAGECONFIG[speex] = "WEBENGINE_CONFIG+=use_system_speex,,speex"
 PACKAGECONFIG[vpx] = "WEBENGINE_CONFIG+=use_system_vpx,,libvpx"
 PACKAGECONFIG[webrtc] = "WEBENGINE_CONFIG+=use_webrtc,,libvpx"
+PACKAGECONFIG[nss] = "WEBENGINE_CONFIG+=use_nss,,nss"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
@@ -68,30 +71,29 @@ def gettext_oeconf(d):
 require qt5.inc
 require qt5-git.inc
 
-export NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja"
-
 do_configure() {
-    # replace LD with CXX, to workaround a possible gyp inheritssue?
-    export LD="${CXX}"
-    export CC="${CC}"
-    export CXX="${CXX}"
-    export CC_host="gcc"
-    export CXX_host="g++"
-    export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
-    export QMAKE_CACHE_EVAL="${PACKAGECONFIG_CONFARGS}"
-
     # Disable autodetection from sysroot:
-    sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_libvpx:/false:/g; s/config_srtp:/false:/g; s/config_snappy:/false:/g; s/packagesExist(nss):/false:/g; s/packagesExist(minizip, zlib):/false:/g; s/packagesExist(libwebp,libwebpdemux):/false:/g; s/packagesExist(libxml-2.0,libxslt):/false:/g; s/^ *packagesExist($$package):/false:/g' ${S}/tools/qmake/mkspecs/features/configure.prf
+    sed -e 's/packagesExist([^)]*vpx[^)]*):/false:/g'\
+        -e 's/config_libvpx:/false:/g' \
+        -e 's/config_srtp:/false:/g' \
+        -e 's/config_snappy:/false:/g' \
+        -e 's/packagesExist(nss):/false:/g' \
+        -e 's/packagesExist(minizip, zlib):/false:/g' \
+        -e 's/packagesExist(libwebp,libwebpdemux):/false:/g' \
+        -e 's/packagesExist(libxml-2.0,libxslt):/false:/g'\
+        -e 's/^ *packagesExist($$package):/false:/g' \
+        -i ${S}/mkspecs/features/configure.prf
 
     # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
     # arguments here
-    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} ${S} \
-        QMAKE_CXX="${OE_QMAKE_CXX}" QMAKE_CC="${OE_QMAKE_CC}" \
+    ${OE_QMAKE_QMAKE} ${EXTRA_QMAKEVARS_PRE} ${S} \
+        QMAKE_CXX="${OE_QMAKE_CXX}" \
+        QMAKE_CC="${OE_QMAKE_CC}" \
         QMAKE_LINK="${OE_QMAKE_LINK}" \
         QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
         QMAKE_CXXFLAGS="${OE_QMAKE_CXXFLAGS}" \
-        QMAKE_AR="${OE_QMAKE_AR} cqs" \
-        -after ${EXTRA_QMAKEVARS_POST}
+        -after ${EXTRA_QMAKEVARS_POST} -- \
+        ${EXTRA_QMAKEVARS_CONFIGURE}
 }
 
 do_configure_prepend_libc-musl() {
@@ -104,8 +106,7 @@ do_configure_prepend_libc-musl() {
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 
 do_install_append() {
-    rmdir ${D}${OE_QMAKE_PATH_PLUGINS}/${BPN} ${D}${OE_QMAKE_PATH_PLUGINS} || true
-    sed -i 's@ -Wl,--start-group.*-Wl,--end-group@@g; s@-L${B}[^ ]* @ @g' ${D}${libdir}/pkgconfig/Qt5WebEngineCore.pc
+    sed -i 's@ -Wl,--start-group.*-Wl,--end-group@@g; s@[^ ]*${B}[^ ]* @@g' ${D}${libdir}/pkgconfig/Qt5WebEngineCore.pc
 }
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
@@ -118,39 +119,36 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "53-based"
+QT_MODULE_BRANCH_CHROMIUM = "56-based"
 
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
-    file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
-    file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
-    file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-    file://0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
-    file://0005-Include-dependency-to-QCoreApplication-translate.patch \
-    file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch;patchdir=src/3rdparty \
-    file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
-    file://0003-chromium-v8-fix-build-with-gcc7.patch;patchdir=src/3rdparty \
-    file://0004-chromium-WebKit-fix-build-with-gcc7.patch;patchdir=src/3rdparty \
+    file://0001-functions.prf-allow-build-for-linux-oe-g-platform.patch \
+    file://0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
+    file://0003-Include-dependency-to-QCoreApplication-translate.patch \
+    file://0004-Force-host-toolchain-configuration.patch \
+    file://0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
+    file://0002-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
 "
+
 SRC_URI_append_libc-musl = "\
-    file://0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch;patchdir=src/3rdparty \
-    file://0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty \
-    file://0007-chromium-musl-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty \
-    file://0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch;patchdir=src/3rdparty \
-    file://0009-chromium-musl-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty \
-    file://0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch;patchdir=src/3rdparty \
-    file://0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch;patchdir=src/3rdparty \
-    file://0012-chromium-musl-Match-syscalls-to-match-musl.patch;patchdir=src/3rdparty \
-    file://0013-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch;patchdir=src/3rdparty \
-    file://0014-chromium-musl-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty \
-    file://0015-chromium-musl-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty \
-    file://0016-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch;patchdir=src/3rdparty \
-    file://0017-chromium-musl-link-with-libexecinfo-on-musl.patch;patchdir=src/3rdparty \
-    file://0018-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
+    file://0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch;patchdir=src/3rdparty \
+    file://0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty \
+    file://0005-chromium-musl-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty \
+    file://0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch;patchdir=src/3rdparty \
+    file://0007-chromium-musl-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty \
+    file://0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch;patchdir=src/3rdparty \
+    file://0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch;patchdir=src/3rdparty \
+    file://0010-chromium-musl-Match-syscalls-to-match-musl.patch;patchdir=src/3rdparty \
+    file://0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch;patchdir=src/3rdparty \
+    file://0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty \
+    file://0013-chromium-musl-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty \
+    file://0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch;patchdir=src/3rdparty \
+    file://0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "d740d6a7dbfec387752c7bc8a8b06db0e757c9dc"
-SRCREV_chromium = "15d257fd921f37b32ef643225f21df0ea24c8302"
+SRCREV_qtwebengine = "73f7be5b2a95eab3dce11caede538eeb7beb71f2"
+SRCREV_chromium = "aa2fdd6be3d465280d2a0c3aacdc738bb4ffec05"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 84b4d0b..286aeca 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "f0898f83abdcacc8bd3bca3479884376b0963398"
+SRCREV = "822426abc77a74752b0ee0da4d0a1c106c4dac22"
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
deleted file mode 100644
index d7627ec..0000000
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From f6989fec34f0bafdeda549d71751f236ef1f3b96 Mon Sep 17 00:00:00 2001
-From: Magnus Granberg <zorry@gentoo.org>
-Date: Fri, 27 Feb 2015 11:55:09 +0100
-Subject: [PATCH] Remove TEXTREL tag in x86
-
-Fix textrel QA warnings when building qtwebkit for x86:
-
-  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
-
-Patch from upstream webkit:
-
-  https://bugs.webkit.org/show_bug.cgi?id=70610
-
-Minor refresh required to apply cleanly to the older webkit sources used
-by qtwebkit. Specifically, the patch needed to be modified to account
-for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
-part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
-
-Upstream status [webkit] : backport
-Upstream status [qtwebkit] : unclear
-
-Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24 ++++++++++++++++++++++++
- Source/WTF/wtf/InlineASM.h                    |  2 ++
- 2 files changed, 26 insertions(+)
-
-diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-index 9684df2..8af82d8 100644
---- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-+++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-@@ -524,6 +524,30 @@ double jsRound(double d)
-     } \
-     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
- 
-+#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
-+#define defineUnaryDoubleOpWrapper(function) \
-+    asm( \
-+        ".text\n" \
-+        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
-+        HIDE_SYMBOL(function##Thunk) "\n" \
-+        SYMBOL_STRING(function##Thunk) ":" "\n" \
-+        "pushl %ebx\n" \
-+        "subl $20, %esp\n" \
-+        "movsd %xmm0, (%esp) \n" \
-+        "call __x86.get_pc_thunk.bx\n" \
-+        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
-+        "call " GLOBAL_REFERENCE(function) "\n" \
-+        "fstpl (%esp) \n" \
-+        "movsd (%esp), %xmm0 \n" \
-+        "addl $20, %esp\n" \
-+        "popl %ebx\n" \
-+        "ret\n" \
-+    );\
-+    extern "C" { \
-+        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
-+    } \
-+    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
-+
- #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
- #define defineUnaryDoubleOpWrapper(function) \
-     asm( \
-diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
-index 0a2fe78..2dc40ef 100644
---- a/Source/WTF/wtf/InlineASM.h
-+++ b/Source/WTF/wtf/InlineASM.h
-@@ -46,6 +46,8 @@
- #define GLOBAL_REFERENCE(name) #name "@plt"
- #elif CPU(X86) && COMPILER(MINGW)
- #define GLOBAL_REFERENCE(name) "@" #name "@4"
-+#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
-+#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
- #else
- #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
- #endif
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 3c52ef3..5c1ecfa 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -20,7 +20,6 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
-    file://0002-Remove-TEXTREL-tag-in-x86.patch \
     file://0003-Exclude-backtrace-API-for-non-glibc-libraries.patch \
     file://0004-Fix-compilation-with-ICU-59.patch \
 "
@@ -87,4 +86,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "74ac5b0f3489f9a08d083b6c9607c9d5c2d4afd2"
+SRCREV = "f27089657a207ef8c5c9d27d661d3d12c3af8df2"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 043b394..41ec27f 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "afb3c58d035db1119666c8556c215187be4f64b8"
+SRCREV = "1421c3e4ae4213ca18f2f51d5ddb38e223450222"
diff --git a/recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-qWarning.patch b/recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-qWarning.patch
new file mode 100644
index 0000000..82087b9
--- /dev/null
+++ b/recipes-qt/qt5/qtwebview/0001-Add-missing-include-for-qWarning.patch
@@ -0,0 +1,22 @@
+From b946b6ea4a2a30bd12ecd036e40c9ef671681ba8 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Fri, 2 Jun 2017 13:12:18 +0300
+Subject: [PATCH] Add missing include for qWarning
+
+Change-Id: I7c7699e7a2b7ce59e4f659d460ec835f59bba439
+---
+ src/webview/qquickwebview.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/webview/qquickwebview.cpp b/src/webview/qquickwebview.cpp
+index d760564..fbbbfd6 100644
+--- a/src/webview/qquickwebview.cpp
++++ b/src/webview/qquickwebview.cpp
+@@ -39,6 +39,7 @@
+ #include <QtWebView/private/qwebviewloadrequest_p.h>
+ #include <QtQml/qqmlengine.h>
+ #include <QtCore/qmutex.h>
++#include <QtCore/QDebug>
+ 
+ namespace {
+ 
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
new file mode 100644
index 0000000..d48b6c4
--- /dev/null
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -0,0 +1,24 @@
+LICENSE = "GFDL-1.3 & BSD & ( GPL-2.0+ | LGPL-3.0 ) | The-Qt-Company-Commercial"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+"
+
+require qt5.inc
+require qt5-git.inc
+
+SRC_URI += "file://0001-Add-missing-include-for-qWarning.patch"
+
+DEPENDS += "qtbase qtwebengine"
+
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_x86 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+COMPATIBLE_MACHINE_armv7ve = "(.*)"
+COMPATIBLE_MACHINE_aarch64 = "(.*)"
+
+SRCREV = "6e55abf3b6a5f373cd4b649c2318a45c49b40589"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 81c72ec..bf03e9b 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "54cc3158acfc75d12338df3b678e013909e66f60"
+SRCREV = "9e83ff8713c1a3f69ce514bf3e31335194668da7"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 9333be0..30e5262 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "9f7e01b582b1bd83cc6b8a854c510871335e2e74"
+SRCREV = "c1c3af0ae456247c9bcd30161d51a94c9b38dc52"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
-- 
2.14.0


