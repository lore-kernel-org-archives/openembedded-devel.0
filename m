Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MYkFW-0005lc-Hs
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2009 19:26:02 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KNW00LB7YCMQZ6B@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	05 Aug 2009 12:10:04 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 964B114AF1F; Wed,
	05 Aug 2009 13:09:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 05 Aug 2009 13:09:07 -0400
Message-id: <1249492147-7452-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] kernel.bbclass: introduce MODULES_IMAGE_BASE_NAME
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
X-List-Received-Date: Wed, 05 Aug 2009 17:26:02 -0000

Similar to KERNEL_IMAGE_BASE_NAME, allow overwriting from a recipe

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/kernel.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index b498760..3ee7f53 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -510,6 +510,7 @@ addtask uboot_mkimage before do_install after do_compile
 
 KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
+MODULES_IMAGE_BASE_NAME ?= modules-${PV}-${PR}-${MACHINE}
 
 do_deploy() {
 	install -d ${DEPLOY_DIR_IMAGE}
@@ -517,7 +518,7 @@ do_deploy() {
 	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 
 	if [ -d "${D}/lib" ]; then
-	tar -cvzf ${DEPLOY_DIR_IMAGE}/modules-${PV}-${PR}-${MACHINE}.tgz -C ${D} lib
+	tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${D} lib
 	fi
 
 	cd ${DEPLOY_DIR_IMAGE}
-- 
1.6.3.3



