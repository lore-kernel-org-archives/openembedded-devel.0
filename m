Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OnUJo-0001vA-1x
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 12:32:11 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OnUJO-0003od-AU from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 03:31:30 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 23 Aug 2010 12:31:28 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Aug 2010 16:28:51 +0600
Message-Id: <1282559331-7498-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 23 Aug 2010 10:31:28.0877 (UTC)
	FILETIME=[589F51D0:01CB42AE]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] uicmoc4-native.inc: Convert to new style staging, Remove do_stage()
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
X-List-Received-Date: Mon, 23 Aug 2010 10:32:11 -0000

* Converted do_stage to do_install
* Replaced ${STAGING_BINDIR} with ${D}${bindir}
* ${STAGING_DIR_NATIVE} with ${D}${datadir} as q3porting.xml is placed in share directory when we install this package on host.
* Replaced some tabs with spaces.
* Bump PR to "r2"

Signed-off-by: Noor Ahsan <nahsan@pkl-nahsan-ubuntu.(none)>
---
 recipes/uicmoc/uicmoc4-native.inc |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/recipes/uicmoc/uicmoc4-native.inc b/recipes/uicmoc/uicmoc4-native.inc
index 1124226..a0ba2cd 100644
--- a/recipes/uicmoc/uicmoc4-native.inc
+++ b/recipes/uicmoc/uicmoc4-native.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://www.trolltech.com"
 PRIORITY = "optional"
 LICENSE = "GPL"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-fix.patch"
@@ -59,19 +59,19 @@ do_compile() {
     for i in ${TOBUILD2};
     do
         cd ${S}/$i && \
-	${S}/bin/qmake -spec ${S}/mkspecs/linux-g++  && \
-	oe_runmake CC="${CC}" CXX="${CXX}"
+        ${S}/bin/qmake -spec ${S}/mkspecs/linux-g++  && \
+        oe_runmake CC="${CC}" CXX="${CXX}"
     done
 }
 
-do_stage() {
-	install -d ${STAGING_BINDIR}/
-    install -m 0755 bin/moc ${STAGING_BINDIR}/moc4
-    install -m 0755 bin/uic ${STAGING_BINDIR}/uic4
-    install -m 0755 bin/uic3 ${STAGING_BINDIR}/uic34
-    install -m 0755 bin/rcc ${STAGING_BINDIR}/rcc4
-    install -m 0755 bin/lrelease ${STAGING_BINDIR}/lrelease4
-    install -m 0755 bin/lupdate ${STAGING_BINDIR}/lupdate4
-    install -d ${STAGING_DIR_NATIVE}/qt4/
-    install -m 0644 tools/porting/src/q3porting.xml ${STAGING_DIR_NATIVE}/qt4/
+do_install() {
+    install -d ${D}${bindir}/
+    install -m 0755 bin/moc ${D}${bindir}/moc4
+    install -m 0755 bin/uic ${D}${bindir}/uic4
+    install -m 0755 bin/uic3 ${D}${bindir}/uic34
+    install -m 0755 bin/rcc ${D}${bindir}/rcc4
+    install -m 0755 bin/lrelease ${D}${bindir}/lrelease4
+    install -m 0755 bin/lupdate ${D}${bindir}/lupdate4
+    install -d ${D}${datadir}/qt4/
+    install -m 0644 tools/porting/src/q3porting.xml ${D}${datadir}/qt4/
 }
-- 
1.6.3.3



