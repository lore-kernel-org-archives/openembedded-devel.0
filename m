Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Oldeh-00075U-Au
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 10:06:11 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Olde9-0002Hp-Vc from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 01:05:18 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 18 Aug 2010 10:05:16 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Aug 2010 13:08:00 +0500
Message-Id: <1282118880-27729-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 18 Aug 2010 08:05:16.0378 (UTC)
	FILETIME=[17BD73A0:01CB3EAC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gawk-native_3.1.4.bb: Removed legacy style staging
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
X-List-Received-Date: Wed, 18 Aug 2010 08:06:11 -0000

* converted do_stage to do_install

* replaced ${STAGING_BINDIR} with ${D}${bindir}

* added NATIVE_INSTALL_WORKS = "1"

* added PR = "r1"

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/gawk/gawk-native_3.1.4.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes/gawk/gawk-native_3.1.4.bb b/recipes/gawk/gawk-native_3.1.4.bb
index 0a33f71..67d254c 100644
--- a/recipes/gawk/gawk-native_3.1.4.bb
+++ b/recipes/gawk/gawk-native_3.1.4.bb
@@ -1,5 +1,8 @@
 INHIBIT_AUTOTOOLS_DEPS = "1"
 require gawk_${PV}.bb
+PR = "r1"
+
+NATIVE_INSTALL_WORKS = "1"
 
 inherit native
 
@@ -8,7 +11,7 @@ PATCHTOOL = "patch"
 
 S = "${WORKDIR}/gawk-${PV}"
 
-do_stage() {
-	install -d ${STAGING_BINDIR}
-	install -m 755 gawk ${STAGING_BINDIR}
+do_install() {
+	install -d ${D}${bindir}
+	install -m 755 gawk ${D}${bindir}
 }
-- 
1.6.3.3



