Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OldUl-0001Mr-UE
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 09:55:40 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OldUC-0000q0-Ac from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 00:55:00 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 18 Aug 2010 09:54:58 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Aug 2010 12:57:42 +0500
Message-Id: <1282118262-27445-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 18 Aug 2010 07:54:58.0635 (UTC)
	FILETIME=[A78959B0:01CB3EAA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] elftoaout-native_2.3.bb: Removed legacy style staging
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
X-List-Received-Date: Wed, 18 Aug 2010 07:55:40 -0000

* converted do_stage to do_install

* replaced ${STAGING_BINDIR} with ${D}${bindir}

* added NATIVE_INSTALL_WORKS = "1"

* added PR = "r1"

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/elftoaout/elftoaout-native_2.3.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes/elftoaout/elftoaout-native_2.3.bb b/recipes/elftoaout/elftoaout-native_2.3.bb
index 9b43805..04a26ba 100644
--- a/recipes/elftoaout/elftoaout-native_2.3.bb
+++ b/recipes/elftoaout/elftoaout-native_2.3.bb
@@ -1,13 +1,17 @@
 SECTION = "console/utils"
 LICENSE = "GPL"
 SRC_URI = "http://www.uk.debian.org/debian/pool/main/s/sparc-utils/sparc-utils_1.9.orig.tar.gz"
+PR = "r1"
 
 inherit native
 
 S = "${WORKDIR}/sparc-utils-1.9.orig/elftoaout-${PV}"
 
-do_stage() {
-	install elftoaout ${STAGING_BINDIR}
+NATIVE_INSTALL_WORKS = "1"
+
+do_install() {
+    install -d ${D}${bindir}
+    install elftoaout ${D}${bindir}
 }
 
 SRC_URI[md5sum] = "08bf3f6d8433a1f4981a2afaa6b49a6c"
-- 
1.6.3.3



