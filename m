Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NuviV-0003vf-HK
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 23:39:55 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 23:35:42 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 23:35:41 +0100
Received: from localhost.localdomain ([87.8.251.207]) by FBCMCL01B09.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 23:35:40 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 23:35:37 +0100
Message-Id: <1269556538-3020-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.4.4
X-OriginalArrivalTime: 25 Mar 2010 22:35:40.0748 (UTC)
	FILETIME=[7F9468C0:01CACC6B]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE][PATCH] zaurus-updater: sync with .dev (fix tasks order)
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
X-List-Received-Date: Thu, 25 Mar 2010 22:39:56 -0000


Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes/zaurus-updater/zaurus-updater.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/zaurus-updater/zaurus-updater.bb b/recipes/zaurus-updater/zaurus-updater.bb
index 6ed1c5f..7621d47 100644
--- a/recipes/zaurus-updater/zaurus-updater.bb
+++ b/recipes/zaurus-updater/zaurus-updater.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Encrypted shellscript for the Zaurus ROM update"
 DEPENDS = "encdec-updater-native"
 LICENSE = "zaurus-updater"
-PR = "r23"
+PR = "r24"
 
 PACKAGES = ""
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -34,4 +34,6 @@ do_deploy() {
 	esac
 }
 
-addtask deploy before do_build after do_compile
+# package_stagefile_shell need to run before populate_staging for packaged-staging
+addtask deploy before do_populate_staging after do_compile
+
-- 
1.6.4.4



