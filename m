Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MpH8L-0007Yu-11
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 09:47:00 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQ900B32EWV4XB1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	20 Sep 2009 02:46:08 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AE68D14AF4F; Sun,
	20 Sep 2009 03:46:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Sep 2009 03:45:57 -0400
Message-id: <1253432757-27944-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] kernel.bbclass: fix ownership inside the modules tarball
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
X-List-Received-Date: Sun, 20 Sep 2009 07:47:00 -0000

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/kernel.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index c5192d5..9c1f637 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -530,7 +530,7 @@ do_deploy() {
 	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 
 	if [ -d "${D}/lib" ]; then
-	tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${D} lib
+		fakeroot tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${D} lib
 	fi
 
 	cd ${DEPLOY_DIR_IMAGE}
@@ -540,5 +540,6 @@ do_deploy() {
 }
 
 do_deploy[dirs] = "${S}"
+do_deploy[depends] += "fakeroot-native:do_populate_staging"
 
 addtask deploy before do_package after do_install
-- 
1.6.3.3



