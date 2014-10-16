Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id B40EF60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:08:40 +0000 (UTC)
Received: from localhost (217.6.91.17) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Thu, 16 Oct 2014
	11:08:40 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Oct 2014 11:07:59 +0200
Message-ID: <a3d23e946f0b810a0157935930d68f2d3112c3eb.1413449871.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <cover.1413449871.git.anders@chargestorm.se>
References: <cover.1413449871.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-qt5][PATCH 1/1] nativesdk-qtbase: make it possible to keep additional libraries
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
X-List-Received-Date: Thu, 16 Oct 2014 09:08:41 -0000
Content-Type: text/plain

In some usecases for the nativesdk, you might need some build tools that are built upon Qt5. This means
that we're having a need to keep more of the libraries build by nativsdk-qtbase. This patch adds the
infrastructure to support that

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 recipes-qt/qt5/nativesdk-qtbase.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index faecc64..ed98c80 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -193,6 +193,16 @@ do_configure() {
     bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
 
+# Set the EXTRA_QTLIB variable to e.g. Xml, in order to net remove libQt5Xml.so.*
+EXTRA_QTLIB ?= ""
+
+python __anonymous () {
+    templibs = ""
+    for e in d.getVar("EXTRA_QTLIB", True).split():
+        templibs = "%s -not -name 'libQt5%s.so*' -and" % (templibs, e)
+    d.setVar("QTLIBSPRESERVE", templibs)
+}
+
 do_install() {
     # Fix install paths for all
     find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
@@ -215,6 +225,7 @@ do_install() {
            ${D}${libdir}/pkgconfig
     find ${D}${libdir} -maxdepth 1 -name 'lib*' -and \
                                    -not -name 'libQt5Core.so*' -and \
+                                   ${QTLIBSPRESERVE} \
                                    -not -name 'libQt5Bootstrap.a' \
                                    -exec rm '{}' ';'
 }
-- 
1.8.4.5


