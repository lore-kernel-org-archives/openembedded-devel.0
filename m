Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Or7QB-0004py-VK
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 12:53:35 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Or7Pb-0001nV-MV from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 03:52:55 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Sep 2010 12:52:54 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Sep 2010 15:53:00 +0500
Message-Id: <1283424780-32724-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 02 Sep 2010 10:52:54.0239 (UTC)
	FILETIME=[FEE37EF0:01CB4A8C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pad-native: converted to new style staging
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
X-List-Received-Date: Thu, 02 Sep 2010 10:53:37 -0000

* Converted do_stage to do_install.
* Added INC_PR = "r1"
* Added NATIVE_INSTALL_WORKS = "1"

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/pad/pad-native.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes/pad/pad-native.bb b/recipes/pad/pad-native.bb
index e8c2b6d..cc1f7aa 100644
--- a/recipes/pad/pad-native.bb
+++ b/recipes/pad/pad-native.bb
@@ -3,6 +3,7 @@ DESCRIPTION = "Console utility for padding a file (filling with 0 to reach a spe
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/pad"
 SRC_URI = "file://pad.c"
 LICENSE = "PD"
+PR = "r1"
 inherit native
 
 do_compile() {
@@ -10,6 +11,9 @@ do_compile() {
 	${CC} -I. -o pad pad.c
 }
 
-do_stage() {
-	install -m 0755 pad ${STAGING_BINDIR}/
+do_install() {
+	install -d ${D}${bindir}/
+	install -m 0755 pad ${D}${bindir}/
 }
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



