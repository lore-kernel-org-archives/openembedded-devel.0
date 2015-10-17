Return-Path: <mail@webthatworks.it>
Received: from smtp207.alice.it (smtp207.alice.it [82.57.200.103])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC957717E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Oct 2015 00:11:18 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.9.24.216) by smtp207.alice.it
	(8.6.060.28) id 55BB66530DE8A7A4; Sat, 17 Oct 2015 02:11:18 +0200
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id 185FA6FE016B;
	Sat, 17 Oct 2015 02:11:18 +0200 (CEST)
Received: by gloom.home.webthatworks.it (Postfix, from userid 1000)
	id ED6AB5E01B6; Sat, 17 Oct 2015 02:10:16 +0200 (CEST)
From: Ivan Sergio Borgonovo <ivan@gloom.home.webthatworks.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Oct 2015 02:10:14 +0200
Message-Id: <1445040614-14820-1-git-send-email-ivan@gloom.home.webthatworks.it>
X-Mailer: git-send-email 2.6.1
Subject: [meta-qt5][PATCH] Make possible to bake meta-toolchain-qt5 without opengl
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
X-List-Received-Date: Sat, 17 Oct 2015 00:11:20 -0000

From: Ivan Sergio Borgonovo <mail@webthatworks.it>

---
 .../packagegroup-qt5-toolchain-target.bb           | 56 +++++++++++-----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 41c467c..22da7a3 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -12,11 +12,11 @@ USE_RUBY = " \
     qtquick1-dev \
     qtquick1-mkspecs \
     qtquick1-plugins \
-    qtquick1-qmlplugins \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtquick1-qmlplugins', '', d)} \
     qttranslations-qtquick1 \
     qtwebkit-dev \
     qtwebkit-mkspecs \
-    qtwebkit-qmlplugins \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebkit-qmlplugins', '', d)} \
 "
 
 # Requires Wayland to work
@@ -36,9 +36,9 @@ USE_X11 = " \
 RDEPENDS_${PN} += " \
     packagegroup-core-standalone-sdk-target \
     libsqlite3-dev \
-    qt3d-dev \
-    qt3d-mkspecs \
-    qt3d-qmlplugins \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-dev', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-mkspecs', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-qmlplugins', '', d)} \
     qtbase-dev \
     qtbase-fonts \
     qtbase-mkspecs \
@@ -48,40 +48,40 @@ RDEPENDS_${PN} += " \
     qttranslations-qtbase \
     qttranslations-qtconfig \
     qttranslations-qthelp \
-    qtconnectivity-dev \
-    qtconnectivity-mkspecs \
-    qtconnectivity-qmlplugins \
-    qttranslations-qtconnectivity \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtconnectivity-dev', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtconnectivity-mkspecs', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtconnectivity-qmlplugins', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qttranslations-qtconnectivity', '', d)} \
     qtdeclarative-dev \
     qtdeclarative-mkspecs \
     qtdeclarative-plugins \
-    qtdeclarative-qmlplugins \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtdeclarative-qmlplugins', '', d)} \
     qtdeclarative-staticdev \
     qttranslations-qmlviewer \
     qttranslations-qtdeclarative \
     qtenginio-dev \
     qtenginio-mkspecs \
-    qtenginio-qmlplugins \
-    qtgraphicaleffects-qmlplugins \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtenginio-qmlplugins', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtgraphicaleffects-qmlplugins', '', d)} \
     qtimageformats-dev \
     qtimageformats-plugins \
-    qtlocation-dev \
-    qtlocation-mkspecs \
-    qtlocation-plugins \
-    qtlocation-qmlplugins \
-    qttranslations-qtlocation \
-    qtmultimedia-dev \
-    qtmultimedia-mkspecs \
-    qtmultimedia-plugins \
-    qtmultimedia-qmlplugins \
-    qttranslations-qtmultimedia \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtlocation-dev', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtlocation-mkspecs', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtlocation-plugins', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtlocation-qmlplugins', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qttranslations-qtlocation', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-dev', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-mkspecs', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-plugins', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-qmlplugins', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qttranslations-qtmultimedia', '', d)} \
     qtscript-dev \
     qtscript-mkspecs \
     qttranslations-qtscript \
     qtsensors-dev \
     qtsensors-mkspecs \
     qtsensors-plugins \
-    qtsensors-qmlplugins \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtsensors-qmlplugins', '', d)} \
     qtserialport-dev \
     qtserialport-mkspecs \
     qtsvg-dev \
@@ -89,10 +89,10 @@ RDEPENDS_${PN} += " \
     qtsvg-plugins \
     qtsystems-dev \
     qtsystems-mkspecs \
-    qtsystems-qmlplugins \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtsystems-qmlplugins', '', d)} \
     qttools-dev \
     qttools-mkspecs \
-    qttools-plugins \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qttools-plugins', '', d)} \
     qttools-staticdev \
     qttools-tools \
     ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
@@ -100,11 +100,11 @@ RDEPENDS_${PN} += " \
     ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
     qtwebsockets-dev \
     qtwebsockets-mkspecs \
-    qtwebsockets-qmlplugins \
-    qttranslations-qtwebsockets \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebsockets-qmlplugins', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qttranslations-qtwebsockets', '', d)} \
     qtwebchannel-dev \
     qtwebchannel-mkspecs \
-    qtwebchannel-qmlplugins \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebchannel-qmlplugins', '', d)} \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
     qttranslations-qtxmlpatterns \
-- 
2.6.1


