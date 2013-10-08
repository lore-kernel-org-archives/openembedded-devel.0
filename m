Return-Path: <eric@eukrea.com>
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by mail.openembedded.org (Postfix) with ESMTP id A28276CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 15:18:10 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 9D785823B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 17:18:06 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 17:18:16 +0200
Message-Id: <1381245496-23623-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qt5.inc: extend FILES_${PN}-examples-*
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
X-List-Received-Date: Tue, 08 Oct 2013 15:18:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this fix :
ERROR: QA Issue: non debug package contains .debug directory: qtquick1-examples path
/work/armv7a-vfp-neon-oe-linux-gnueabi/qtquick1/5.1.1-r0/packages-split/qtquick1-examples/
usr/share/qt5/examples/declarative/cppextensions/plugins/org/qtproject/TimeExample/.debug/libqmlqtimeexampleplugin.so

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qt5.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index f1fd951..268ddd7 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -115,6 +115,8 @@ FILES_${PN}-examples-dev = " \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*/*${SOLIBSDEV} \
 "
 FILES_${PN}-examples-dbg = " \
     ${OE_QMAKE_PATH_EXAMPLES}/.debug \
@@ -123,6 +125,8 @@ FILES_${PN}-examples-dbg = " \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/.debug \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/.debug \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/.debug \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/.debug \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*/.debug \
 "
 FILES_${PN}-examples-staticdev = " \
     ${OE_QMAKE_PATH_EXAMPLES}/*.a \
@@ -131,6 +135,8 @@ FILES_${PN}-examples-staticdev = " \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*.a \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*.a \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*.a \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*.a \
+    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*/*.a \
 "
 
 PATH_prepend = "${STAGING_DIR_NATIVE}${OE_QMAKE_PATH_QT_BINS}:"
-- 
1.8.4.rc3


