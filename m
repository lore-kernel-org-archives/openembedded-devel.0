Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OzBlL-0007yV-LI
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 19:08:44 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OzBlD-0003ej-Jk from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 10:08:35 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 24 Sep 2010 19:05:08 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 22:05:50 +0500
Message-Id: <1285347950-27040-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 24 Sep 2010 17:05:08.0806 (UTC)
	FILETIME=[A46A7660:01CB5C0A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qmake-native_1.07a.bb: Converted to new style staging
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
X-List-Received-Date: Fri, 24 Sep 2010 17:08:45 -0000

* Converted do_stage to do_install.
* Added NATIVE_INSTALL_WORKS = "1"
* replaced QMAKE_MKSPEC_PATH (which is defined in bitbake.conf) with ${D}${datadir}/qmake as discussed on irc
* Bumped PR

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/qmake/qmake-native_1.07a.bb |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/recipes/qmake/qmake-native_1.07a.bb b/recipes/qmake/qmake-native_1.07a.bb
index 36efe89..ac87b45 100644
--- a/recipes/qmake/qmake-native_1.07a.bb
+++ b/recipes/qmake/qmake-native_1.07a.bb
@@ -3,7 +3,7 @@ PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 SECTION = "devel"
 LICENSE = "GPL QPL"
-PR = "r5"
+PR = "r6"
 
 QTEVER = "qt-embedded-free-3.3.5"
 
@@ -35,15 +35,14 @@ do_compile() {
 	:
 }
 
-do_stage() {
-	install -m 0755 bin/qmake ${STAGING_BINDIR}
-	install -d ${QMAKE_MKSPEC_PATH}
-	cp -fPR mkspecs/* ${QMAKE_MKSPEC_PATH}
-}
-
 do_install() {
-        :
+        install -d ${D}${bindir}
+        install -m 0755 bin/qmake ${D}${bindir}
+        install -d ${D}${datadir}/qmake
+        cp -fPR mkspecs/* ${D}${datadir}/qmake
 }
 
 SRC_URI[md5sum] = "022d7a3c572b554f3c47b12cae71a8a4"
 SRC_URI[sha256sum] = "a97656796c0ef8e87dd83e6138bc406e31830d08f9b213e039d8be39ea65c8e4"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



