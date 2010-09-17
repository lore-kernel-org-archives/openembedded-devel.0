Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OwaUC-0008Le-RX
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 14:56:18 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OwaTM-0005Wc-B4 from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 05:55:24 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 17 Sep 2010 14:55:13 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Sep 2010 17:54:37 +0500
Message-Id: <1284728077-32131-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 Sep 2010 12:55:13.0944 (UTC)
	FILETIME=[91E3D980:01CB5667]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] classpath-tools-native.bb: Converted to new style staging
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
X-List-Received-Date: Fri, 17 Sep 2010 12:56:18 -0000

* Converted do_stage to do_install.
* Added NATIVE_INSTALL_WORKS = "1"
* Added PR = "r1"

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/classpath/classpath-tools-native.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/classpath/classpath-tools-native.bb b/recipes/classpath/classpath-tools-native.bb
index 7adf702..52566be 100644
--- a/recipes/classpath/classpath-tools-native.bb
+++ b/recipes/classpath/classpath-tools-native.bb
@@ -5,9 +5,12 @@
 DESCRIPTION = "Provides working jar, javah etc. from the GNU Classpath project"
 
 DEPENDS = "virtual/java-native classpath-native"
+PR = "r1"
 
 inherit native
 
-do_stage() {
-	:
+do_install() {
+        :
 }
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



