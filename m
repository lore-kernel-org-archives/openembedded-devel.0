Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Oo9Md-00022p-9j
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 08:21:48 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Oo9MA-0002ka-BX from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 23:21:06 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 25 Aug 2010 08:21:04 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Aug 2010 11:24:41 +0500
Message-Id: <1282717481-18836-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 25 Aug 2010 06:21:05.0005 (UTC)
	FILETIME=[B285E1D0:01CB441D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] kakasi-native_2.3.4.bb: Removed legacy style staging
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
X-List-Received-Date: Wed, 25 Aug 2010 06:21:48 -0000

From: Fahad <fahad@pkl-fusman-ubuntu.(none)>

* converted do_stage to do_install

* replaced ${STAGING_BINDIR} with ${D}${bindir}

* added PR = "r1"

* added NATIVE_INSTALL_WORKS = "1"

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/kakasi/kakasi-native_2.3.4.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes/kakasi/kakasi-native_2.3.4.bb b/recipes/kakasi/kakasi-native_2.3.4.bb
index 24d4e1d..447b452 100644
--- a/recipes/kakasi/kakasi-native_2.3.4.bb
+++ b/recipes/kakasi/kakasi-native_2.3.4.bb
@@ -2,11 +2,14 @@ require kakasi.inc
 
 inherit native
 
-do_stage() {
-        install src/mkkanwa ${STAGING_BINDIR}
-}
+PR = "r1"
 
+do_install() {
+        install -d ${D}${bindir}
+        install src/mkkanwa ${D}${bindir}
+}
 
+NATIVE_INSTALL_WORKS = "1"
 
 SRC_URI[md5sum] = "4eff51aafbd56c9635791a20c03efa8f"
 SRC_URI[sha256sum] = "c272560f5c11fe45b011c4e26ada66218fb0109d5582c5876aa49c5e24718534"
-- 
1.6.3.3



