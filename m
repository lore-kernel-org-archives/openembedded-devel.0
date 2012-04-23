Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SMR05-0008QB-0a
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 23:40:49 +0200
Received: from mizar.localdomain (87.5.26.19) by smtp206.alice.it (8.6.023.02)
	id 4F1836AD0B30A562; Mon, 23 Apr 2012 23:31:17 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Apr 2012 23:31:12 +0200
Message-Id: <1335216674-11159-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 1/3] zaurus-installer: use linux-yocto-tiny-kexecboot kernel
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
X-List-Received-Date: Mon, 23 Apr 2012 21:40:49 -0000

* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/zaurus-utils/zaurus-installer.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/zaurus-utils/zaurus-installer.bb b/recipes-bsp/zaurus-utils/zaurus-installer.bb
index 785836f..62f01c8 100644
--- a/recipes-bsp/zaurus-utils/zaurus-installer.bb
+++ b/recipes-bsp/zaurus-utils/zaurus-installer.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Installkit for kexecboot-kernel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-DEPENDS = "${@base_conditional('MACHINE', 'collie', 'linux-kexecboot', 'zaurus-updater linux-kexecboot', d)}"
+DEPENDS = "${@base_conditional('MACHINE', 'collie', 'linux-yocto-tiny-kexecboot', 'zaurus-updater linux-yocto-tiny-kexecboot', d)}"
 DEPENDS += "${@base_conditional('MACHINE', 'spitz', 'zaurus-legacy-tar', '', d)}"
-PR = "r6"
+PR = "r7"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -14,7 +14,7 @@ do_compile() {
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES = ""
 
-COMPATIBLE_MACHINE = "(collie|poodle|c7x0|spitz|akita|tosa)"
+COMPATIBLE_MACHINE = "collie|poodle|c7x0|spitz|akita|tosa"
 
 inherit deploy
 
@@ -24,7 +24,7 @@ do_deploy() {
         cd ${DEPLOY_DIR_IMAGE}
         rm -rf ${DEPLOY_DIR_IMAGE}/installkit-${MACHINE}/
         mkdir installkit-${MACHINE}/
-        [ -f "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}.bin" ] && cp ${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}.bin installkit-${MACHINE}/${KERNEL_IMAGETYPE}
+        [ -f "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}.bin" ] && cp ${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}.bin installkit-${MACHINE}/${KERNEL_IMAGETYPE}
         if [ ! "${MACHINE}" = "collie" ]; then
                 cp updater.sh installkit-${MACHINE}/updater.sh
         fi
-- 
1.7.3.4



