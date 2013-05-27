Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 948C16A34D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2013 23:43:14 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 8C41E4B0045
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 01:43:11 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2013 01:43:46 +0200
Message-Id: <1369698233-4500-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/8] qt: package examples
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
X-List-Received-Date: Mon, 27 May 2013 23:43:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qt5.inc |   29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index d370844..87bf5e8 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -20,7 +20,7 @@ OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
 OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
 OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
 
-PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs "
+PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
 # extra -dbg packages
 FILES_${PN}-qmlplugins-dbg = " \
@@ -98,3 +98,30 @@ FILES_${PN}-dbg += " \
 FILES_${PN}-staticdev += " \
     ${OE_QMAKE_PATH_LIBS}/*.a \
 "
+FILES_${PN}-examples = " \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/* \
+"
+FILES_${PN}-examples-dev = " \
+    ${OE_QMAKE_PATH_EXAMPLES}/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*${SOLIBSDEV} \
+"
+FILES_${PN}-examples-dbg = " \
+    ${OE_QMAKE_PATH_EXAMPLES}/.debug \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/.debug \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/.debug \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/.debug \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/.debug \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/.debug \
+"
+FILES_${PN}-examples-staticdev = " \
+    ${OE_QMAKE_PATH_EXAMPLES}/*.a \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*.a \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*.a \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*.a \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*.a \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*.a \
+"
-- 
1.7.10.4


