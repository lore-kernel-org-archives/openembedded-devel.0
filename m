Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 52F4761A4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 09:45:01 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 88AE44B0093;
	Fri, 24 May 2013 11:44:58 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 May 2013 11:45:34 +0200
Message-Id: <1369388734-15750-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] qt: package examples
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
X-List-Received-Date: Fri, 24 May 2013 09:45:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qt5.inc          |    9 ++++++++-
 recipes-qt/qt5/qtbase.inc       |    1 +
 recipes-qt/qt5/qtmultimedia.inc |    4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index d370844..018c9ad 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -20,7 +20,7 @@ OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
 OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
 OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
 
-PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs "
+PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
 # extra -dbg packages
 FILES_${PN}-qmlplugins-dbg = " \
@@ -98,3 +98,10 @@ FILES_${PN}-dbg += " \
 FILES_${PN}-staticdev += " \
     ${OE_QMAKE_PATH_LIBS}/*.a \
 "
+
+FILES_${PN}-examples             = "${datadir}/${QT_DIR_NAME}/examples/*"
+
+FILES_${PN}-examples-dbg         = "${datadir}/${QT_DIR_NAME}/examples/.debug ${datadir}/${QT_DIR_NAME}/examples/*/.debug ${datadir}/${QT_DIR_NAME}/examples/*/*/.debug ${datadir}/${QT_DIR_NAME}/examples/*/*/*/.debug ${datadir}/${QT_DIR_NAME}/examples/*/*/*/*/.debug ${datadir}/${QT_DIR_NAME}/examples/*/*/*/*/*/.debug"
+ALLOW_EMPTY_${PN}-examples = "1"
+ALLOW_EMPTY_${PN}-examples-staticdev = "1"
+ALLOW_EMPTY_${PN}-examples-dbg = "1"
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 5d4334a..be6f10a 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -167,3 +167,4 @@ do_install_append() {
 
 PACKAGES =. "${PN}-fonts "
 FILES_${PN}-fonts = "${libdir}/${QT_DIR_NAME}/fonts ${libdir}/fonts"
+FILES_${PN}-examples-staticdev   = "${datadir}/${QT_DIR_NAME}/examples/tools/plugandpaint/plugins/libpnp_basictools.a"
diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index d9fdf79..e773ad1 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -3,3 +3,7 @@ require qt5.inc
 DEPENDS += "qtdeclarative gstreamer alsa-lib "
 
 INC_PR = "r0"
+
+do_install_append() {
+    rm -f ${D}/${datadir}/${QT_DIR_NAME}/examples/multimedia/spectrum/*.so
+}
\ No newline at end of file
-- 
1.7.10.4


