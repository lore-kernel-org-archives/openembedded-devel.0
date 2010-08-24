Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Onqhg-00066S-Rb
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 12:26:07 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OnqhG-0004xb-66 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 03:25:38 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 24 Aug 2010 12:25:36 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Aug 2010 16:22:50 +0600
Message-Id: <1282645370-18251-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 24 Aug 2010 10:25:36.0688 (UTC)
	FILETIME=[B11D4B00:01CB4376]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] uicmoc4-native: Convert to new style staging, Remove do_stage
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
X-List-Received-Date: Tue, 24 Aug 2010 10:26:08 -0000

* Convert do_stage to do_install in uicmoc4-native.inc
* Replace ${STAGING_BINDIR} with ${D}{bindir} in inc file
* Replace ${STAGING_DIR_NATIVE}/qt4/ with ${D}${datadir}/qt4/ in inc file to install q3porting.xml in "share" directory
* Bump INC_PR to "r2" in inc file
* Remove some tabs with spaces in inc file
* Remove do_stage from uicmoc4-native_4.4.3.bb
* Bump PR to ${INC_PR}.1
* Set NATIVE_INSTALL_WORKS = "1"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/uicmoc/uicmoc4-native.inc      |   26 +++++++++++++-------------
 recipes/uicmoc/uicmoc4-native_4.4.3.bb |   17 +++--------------
 2 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/recipes/uicmoc/uicmoc4-native.inc b/recipes/uicmoc/uicmoc4-native.inc
index ea6a469..2991c71 100644
--- a/recipes/uicmoc/uicmoc4-native.inc
+++ b/recipes/uicmoc/uicmoc4-native.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://www.trolltech.com"
 PRIORITY = "optional"
 LICENSE = "GPL"
-INC_PR = "r1"
+INC_PR = "r2"
 
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
diff --git a/recipes/uicmoc/uicmoc4-native_4.4.3.bb b/recipes/uicmoc/uicmoc4-native_4.4.3.bb
index 0ef53e1..fa98e25 100644
--- a/recipes/uicmoc/uicmoc4-native_4.4.3.bb
+++ b/recipes/uicmoc/uicmoc4-native_4.4.3.bb
@@ -1,20 +1,9 @@
-PR = ${INC_PR}.0
+PR = ${INC_PR}.1
 require uicmoc4-native.inc
 
 inherit native
 
-do_stage() {
-    install -d ${STAGING_BINDIR}/
-    install -m 0755 bin/moc ${STAGING_BINDIR}/moc4
-    install -m 0755 bin/uic ${STAGING_BINDIR}/uic4
-    install -m 0755 bin/uic3 ${STAGING_BINDIR}/uic34
-    install -m 0755 bin/rcc ${STAGING_BINDIR}/rcc4
-    install -m 0755 bin/lrelease ${STAGING_BINDIR}/lrelease4
-    install -m 0755 bin/lupdate ${STAGING_BINDIR}/lupdate4
-    install -d ${STAGING_DIR_NATIVE}/qt4/
-    install -m 0644 tools/porting/src/q3porting.xml ${STAGING_DIR_NATIVE}/qt4/
-}
-
-
 SRC_URI[md5sum] = "9a639aec44a1e4c70040117183d247a3"
 SRC_URI[sha256sum] = "05d06b93f95092f1318634fca24f0c2d0a1252c9f1dc2fbb427b07e8ecbb4f39"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



