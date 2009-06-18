Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MHLBp-00070N-8D
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 19:14:17 +0200
Received: (qmail 12602 invoked by uid 107); 18 Jun 2009 17:03:39 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 18 Jun 2009 19:03:39 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2009 19:03:34 +0200
Message-Id: <1245344614-22213-2-git-send-email-valentin.longchamp@epfl.ch>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1245344614-22213-1-git-send-email-valentin.longchamp@epfl.ch>
References: <1245344614-22213-1-git-send-email-valentin.longchamp@epfl.ch>
Subject: [PATCH] change qmake2 to qmake4 for consistency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jun 2009 17:14:17 -0000


Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
---
 classes/qmake2.bbclass           |   21 ---------------------
 classes/qmake4.bbclass           |   21 +++++++++++++++++++++
 recipes/qt4/qt4-tools-native.inc |    3 +--
 3 files changed, 22 insertions(+), 23 deletions(-)
 delete mode 100644 classes/qmake2.bbclass
 create mode 100644 classes/qmake4.bbclass

diff --git a/classes/qmake2.bbclass b/classes/qmake2.bbclass
deleted file mode 100644
index 26e813a..0000000
--- a/classes/qmake2.bbclass
+++ /dev/null
@@ -1,21 +0,0 @@
-#
-# QMake variables for Qt4
-#
-inherit qmake_base
-
-DEPENDS_prepend = "qt4-tools-native "
-
-export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
-export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
-export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
-export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"
-export OE_QMAKE_RCC = "${STAGING_BINDIR_NATIVE}/rcc4"
-export OE_QMAKE_QDBUSCPP2XML = "${STAGING_BINDIR_NATIVE}/qdbuscpp2xml4"
-export OE_QMAKE_QDBUSXML2CPP = "${STAGING_BINDIR_NATIVE}/qdbusxml2cpp4"
-export OE_QMAKE_QMAKE = "${STAGING_BINDIR_NATIVE}/qmake2"
-export OE_QMAKE_LINK = "${CXX}"
-export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
-export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/qt4"
-export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
-export OE_QMAKE_LIBS_QT = "qt"
-export OE_QMAKE_LIBS_X11 = "-lXext -lX11 -lm"
diff --git a/classes/qmake4.bbclass b/classes/qmake4.bbclass
new file mode 100644
index 0000000..c5ce100
--- /dev/null
+++ b/classes/qmake4.bbclass
@@ -0,0 +1,21 @@
+#
+# QMake variables for Qt4
+#
+inherit qmake_base
+
+DEPENDS_prepend = "qt4-tools-native "
+
+export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
+export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
+export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
+export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"
+export OE_QMAKE_RCC = "${STAGING_BINDIR_NATIVE}/rcc4"
+export OE_QMAKE_QDBUSCPP2XML = "${STAGING_BINDIR_NATIVE}/qdbuscpp2xml4"
+export OE_QMAKE_QDBUSXML2CPP = "${STAGING_BINDIR_NATIVE}/qdbusxml2cpp4"
+export OE_QMAKE_QMAKE = "${STAGING_BINDIR_NATIVE}/qmake4"
+export OE_QMAKE_LINK = "${CXX}"
+export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
+export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/qt4"
+export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
+export OE_QMAKE_LIBS_QT = "qt"
+export OE_QMAKE_LIBS_X11 = "-lXext -lX11 -lm"
diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
index 0fd4f92..5d1a781 100644
--- a/recipes/qt4/qt4-tools-native.inc
+++ b/recipes/qt4/qt4-tools-native.inc
@@ -60,8 +60,7 @@ do_compile() {
 
 do_stage() {
     install -d ${STAGING_BINDIR_NATIVE}/
-    install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
-    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
+    for i in qmake moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
         install -m 0755 bin/${i} ${STAGING_BINDIR_NATIVE}/${i}4
     done
     
-- 
1.6.0.4



