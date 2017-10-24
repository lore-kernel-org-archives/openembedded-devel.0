Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 891336E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 15:51:27 +0000 (UTC)
Received: from localhost.localdomain (p54AC5F3C.dip0.t-ipconnect.de
	[84.172.95.60])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 9D88D2802E7;
	Tue, 24 Oct 2017 15:48:23 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Oct 2017 17:51:08 +0200
Message-Id: <20171024155108.20649-1-daniel@zonque.org>
X-Mailer: git-send-email 2.13.6
Subject: [meta-qt5][PATCH] qtwebengine: make test suite succeed
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
X-List-Received-Date: Tue, 24 Oct 2017 15:51:27 -0000

Make the qtwebengine test suite succeed when Qt was built without
accessibility features.

Upstream bug report: https://bugreports.qt.io/browse/QTBUG-64015
---
 ...ests-make-accessibility-tests-conditional.patch | 37 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch

diff --git a/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch b/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch
new file mode 100644
index 0000000..8b82010
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch
@@ -0,0 +1,37 @@
+From 006f08373cbaa8485311f491ab8e67433c0e9ad6 Mon Sep 17 00:00:00 2001
+From: Daniel Mack <daniel@zonque.org>
+Date: Tue, 24 Oct 2017 15:46:19 +0200
+Subject: [PATCH] tests: make accessibility tests conditional
+
+Only test the accessibility functions if accessibility was enabled in the Qt
+config.
+---
+ tests/auto/widgets/widgets.pro | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/auto/widgets/widgets.pro b/tests/auto/widgets/widgets.pro
+index 441eea0f..7bab18f0 100644
+--- a/tests/auto/widgets/widgets.pro
++++ b/tests/auto/widgets/widgets.pro
+@@ -1,7 +1,6 @@
+ TEMPLATE = subdirs
+ 
+ SUBDIRS += \
+-    qwebengineaccessibility \
+     qwebenginedefaultsurfaceformat \
+     qwebenginedownloads \
+     qwebenginefaviconmanager \
+@@ -14,6 +13,10 @@ SUBDIRS += \
+     qwebenginesettings \
+     qwebengineview
+ 
++qtConfig(accessibility) {
++    SUBDIRS += qwebengineaccessibility
++}
++
+ contains(WEBENGINE_CONFIG, use_spellchecker):!cross_compile {
+     !contains(WEBENGINE_CONFIG, use_native_spellchecker) {
+         SUBDIRS += qwebenginespellcheck
+-- 
+2.13.6
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 4bc4cdb..519ccb4 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -138,6 +138,7 @@ SRC_URI += " \
     file://0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
     file://0003-Include-dependency-to-QCoreApplication-translate.patch \
     file://0004-Force-host-toolchain-configuration.patch \
+    file://0005-tests-make-accessibility-tests-conditional.patch \
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based 
-- 
2.13.6


