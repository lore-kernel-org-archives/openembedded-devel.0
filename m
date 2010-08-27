Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Ooyx6-0007OQ-NV
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 15:26:42 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Ooywc-0001WT-LP from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 06:26:10 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 27 Aug 2010 15:26:09 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Aug 2010 18:29:51 +0500
Message-Id: <1282915791-14096-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 27 Aug 2010 13:26:09.0316 (UTC)
	FILETIME=[691A6640:01CB45EB]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] lemon_3.5.4: merged native and non-native recipes
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
X-List-Received-Date: Fri, 27 Aug 2010 13:26:42 -0000

* removed the lemon-native_3.5.4.bb file
* added NATIVE_INSTALL_WORKS = "1"
* added BBCLASSEXTEND = "native"
* bumped PR

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/lemon/lemon-native_3.5.4.bb |   14 --------------
 recipes/lemon/lemon_3.5.4.bb        |    6 +++++-
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/recipes/lemon/lemon-native_3.5.4.bb b/recipes/lemon/lemon-native_3.5.4.bb
deleted file mode 100644
index f293ab1..0000000
--- a/recipes/lemon/lemon-native_3.5.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require lemon.inc
-
-PR = "r0"
-
-inherit native
-
-do_stage() {
-	install -d ${STAGING_BINDIR}
-	install -m 0755 lemon ${STAGING_BINDIR}
-	install -m 0644 lempar.c ${STAGING_BINDIR}
-}
-
-SRC_URI[md5sum] = "f17da840eed792e896c3408d0ce97718"
-SRC_URI[sha256sum] = "47daba209bd3bcffa1c5fcd5fdfc4f524eae619b4fa855aeeb1bbbc8bd2bb04f"
diff --git a/recipes/lemon/lemon_3.5.4.bb b/recipes/lemon/lemon_3.5.4.bb
index 0be511a..719a84f 100644
--- a/recipes/lemon/lemon_3.5.4.bb
+++ b/recipes/lemon/lemon_3.5.4.bb
@@ -1,6 +1,6 @@
 require lemon.inc
 
-PR = "r0"
+PR = "r1"
 
 do_install() {
 	install -d ${D}${bindir}
@@ -12,3 +12,7 @@ do_install() {
 
 SRC_URI[md5sum] = "f17da840eed792e896c3408d0ce97718"
 SRC_URI[sha256sum] = "47daba209bd3bcffa1c5fcd5fdfc4f524eae619b4fa855aeeb1bbbc8bd2bb04f"
+
+BBCLASSEXTEND = "native"
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



