Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1S0z5Y-0006g8-Lm
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 18:37:48 +0100
Received: from trisquel.workgroup (82.48.81.29) by smtp204.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 4F4210CF0023D06F; Fri, 24 Feb 2012 18:23:45 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 18:23:23 +0100
Message-Id: <1330104203-12137-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-opie] recipe-opie: opie-image: also install the kernel and the machine extra rrecommends
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
X-List-Received-Date: Fri, 24 Feb 2012 17:37:48 -0000

Without that fix most of the machines won't boot(because the kernel is
  absent on the rootfs and the bootloader won't find it) and won't
  have any kernel modules or firmwares on the rootfs either
  (from MACHINE_EXTRA_RRECOMMENDS ).

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes-opie/images/opie-image.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-opie/images/opie-image.bb b/recipes-opie/images/opie-image.bb
index dd654c1..ef8080f 100644
--- a/recipes-opie/images/opie-image.bb
+++ b/recipes-opie/images/opie-image.bb
@@ -7,7 +7,8 @@ DEPENDS = "task-base task-opie"
 IMAGE_FEATURES = "ssh-server-dropbear"
 
 ANGSTROM_EXTRA_INSTALL ?= ""
-IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE} task-opie-base task-opie-base-applets \
+IMAGE_INSTALL = "task-core-boot kernel ${MACHINE_EXTRA_RRECOMMENDS} \
+		    ${ROOTFS_PKGMANAGE} task-opie-base task-opie-base-applets \
 		    task-opie-base-inputmethods task-opie-base-apps \
 		    task-opie-base-settings task-opie-base-decorations \
 		    task-opie-base-styles task-opie-base-pim \
-- 
1.7.4.1



