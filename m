Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Or6Yx-0005Yy-4j
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 11:58:32 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Or6YM-0004QG-E6 from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 02:57:54 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Sep 2010 11:57:52 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Sep 2010 14:57:57 +0500
Message-Id: <1283421477-29534-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 02 Sep 2010 09:57:53.0118 (UTC)
	FILETIME=[4F4467E0:01CB4A85]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pngcrush_1.7.9: merged native and non-native recipes
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
X-List-Received-Date: Thu, 02 Sep 2010 09:58:32 -0000

* removed the pngcrush-native_1.7.9.bb file
* added NATIVE_INSTALL_WORKS = "1"
* added BBCLASSEXTEND = "native"
* added PR = "r1"

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/pngcrush/pngcrush-native_1.7.9.bb |    9 ---------
 recipes/pngcrush/pngcrush_1.7.9.bb        |    5 +++++
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/recipes/pngcrush/pngcrush-native_1.7.9.bb b/recipes/pngcrush/pngcrush-native_1.7.9.bb
deleted file mode 100644
index 4e119a1..0000000
--- a/recipes/pngcrush/pngcrush-native_1.7.9.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require pngcrush_${PV}.bb
-
-inherit native
-
-S = "${WORKDIR}/pngcrush-${PV}"
-
-do_stage() {
-        install -m 755 ${S}/pngcrush ${STAGING_BINDIR}/
-}
diff --git a/recipes/pngcrush/pngcrush_1.7.9.bb b/recipes/pngcrush/pngcrush_1.7.9.bb
index fc284f2..a4a2273 100644
--- a/recipes/pngcrush/pngcrush_1.7.9.bb
+++ b/recipes/pngcrush/pngcrush_1.7.9.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Tool to optimize PNG images"
 SECTION = "console/graphics"
 HOMEPAGE = "http://pmt.sourceforge.net/pngcrush"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pmt/pngcrush-${PV}.tar.gz;name=src"
 
@@ -16,3 +17,7 @@ do_install () {
         install -d ${D}${bindir}
         install -m 755 ${BPN} ${D}${bindir}
 }
+
+BBCLASSEXTEND = "native"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



