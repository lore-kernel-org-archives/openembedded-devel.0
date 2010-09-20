Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Oxbfw-0000Rm-9c
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 10:24:39 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Oxbf2-0002Go-2L from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 01:23:40 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 20 Sep 2010 10:22:31 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Sep 2010 13:22:23 +0500
Message-Id: <1284970943-9765-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 20 Sep 2010 08:22:31.0415 (UTC)
	FILETIME=[F84D5070:01CB589C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] nkf_2.07.bb: merged native and non-native recipes
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
X-List-Received-Date: Mon, 20 Sep 2010 08:24:39 -0000

* removed the nkf-native_2.07.bb file
* added NATIVE_INSTALL_WORKS = "1"
* added BBCLASSEXTEND = "native"
* bumped PR

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/nkf/nkf-native_2.07.bb |   14 --------------
 recipes/nkf/nkf_2.07.bb        |    7 ++++++-
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/recipes/nkf/nkf-native_2.07.bb b/recipes/nkf/nkf-native_2.07.bb
deleted file mode 100644
index b9782ae..0000000
--- a/recipes/nkf/nkf-native_2.07.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require nkf_${PV}.bb
-inherit native
-
-do_stage() {
-    install -m 0755 nkf ${STAGING_BINDIR}
-}
-
-do_install() {
-	:
-}
-
-
-SRC_URI[md5sum] = "af11dcd3fe71d67831c020e3bfd5073b"
-SRC_URI[sha256sum] = "71d2ba992df209a00bb1dca45e3336729dc16e51b71526bd20f897cc6127a275"
diff --git a/recipes/nkf/nkf_2.07.bb b/recipes/nkf/nkf_2.07.bb
index ef6e23d..20ee2b2 100644
--- a/recipes/nkf/nkf_2.07.bb
+++ b/recipes/nkf/nkf_2.07.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Network Kanji Code Conversion Filter"
 LICENSE = "GPL"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://ftp.debian.org/debian/pool/main/n/nkf/nkf_${PV}.orig.tar.gz"
 S = "${WORKDIR}/nkf207"
@@ -16,3 +16,8 @@ do_install() {
 SRC_URI[md5sum] = "af11dcd3fe71d67831c020e3bfd5073b"
 SRC_URI[sha256sum] = "71d2ba992df209a00bb1dca45e3336729dc16e51b71526bd20f897cc6127a275"
 TARGET_CC_ARCH += "${LDFLAGS}"
+
+BBCLASSEXTEND = "native"
+ 
+NATIVE_INSTALL_WORKS = "1"
+
-- 
1.6.3.3



