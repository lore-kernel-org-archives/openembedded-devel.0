Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Osvuj-0006WH-5x
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 13:00:59 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Osvu3-00030w-SU from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 03:59:52 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 7 Sep 2010 12:59:50 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Sep 2010 15:59:44 +0500
Message-Id: <1283857184-18261-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 07 Sep 2010 10:59:50.0402 (UTC)
	FILETIME=[CB01AE20:01CB4E7B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gconf-native_2.6.1.bb: Converted to new style staging
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
X-List-Received-Date: Tue, 07 Sep 2010 11:01:13 -0000

* Converted do_stage to do_install.
* Added NATIVE_INSTALL_WORKS = "1"
* Added PR = "r1"
Note: Not merging it into the non-native recipe as this is a dummy recipe and it does not need all the regular stuff.

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/gnome/gconf-native_2.6.1.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes/gnome/gconf-native_2.6.1.bb b/recipes/gnome/gconf-native_2.6.1.bb
index 79163a4..f3f5fd8 100644
--- a/recipes/gnome/gconf-native_2.6.1.bb
+++ b/recipes/gnome/gconf-native_2.6.1.bb
@@ -1,10 +1,14 @@
 NOTE = "This is just a dummy package to get packages stop complaining about gconftool-2 \
         which they are not using anyway... :D"
 
+PR = "r1"
+
 inherit native
 
-do_stage() {
-	echo "#!/bin/sh" >${STAGING_BINDIR}/gconftool-2
-	chmod a+rx ${STAGING_BINDIR}/gconftool-2
+do_install() {
+        install -d ${D}${bindir}
+        echo "#!/bin/sh" >${D}${bindir}/gconftool-2
+        chmod a+rx ${D}${bindir}/gconftool-2
 }
 
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



