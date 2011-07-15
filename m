Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhlWs-0004eG-M3
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 18:46:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jul 2011 09:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,209,1309762800"; d="scan'208";a="27701906"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.182])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2011 09:42:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 17:42:03 +0100
Message-Id: <f4c4279937e7c3463a7177f2182a1500ecf9ed77.1310748001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 1/5] classes/kernel.bbclass: sync up with oe-core
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
X-List-Received-Date: Fri, 15 Jul 2011 16:46:18 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/classes/kernel.bbclass |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 89aeb92..c17ffde 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -7,6 +7,8 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod virtual/$
 INHIBIT_DEFAULT_DEPS = "1"
 
 KERNEL_IMAGETYPE ?= "zImage"
+INITRAMFS_IMAGE ?= ""
+INITRAMFS_TASK ?= ""
 
 python __anonymous () {
     kerneltype = bb.data.getVar('KERNEL_IMAGETYPE', d, 1) or ''
@@ -16,7 +18,7 @@ python __anonymous () {
     	bb.data.setVar("DEPENDS", depends, d)
 
     image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
-    if image != '' and image is not None:
+    if image:
         bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
 
     machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
@@ -25,9 +27,6 @@ python __anonymous () {
        bb.data.setVar('PR', machine_kernel_pr, d)
 }
 
-INITRAMFS_IMAGE ?= ""
-INITRAMFS_TASK ?= ""
-
 inherit kernel-arch deploy
 
 PACKAGES_DYNAMIC += "kernel-module-*"
@@ -194,7 +193,7 @@ kernel_do_configure() {
 	yes '' | oe_runmake oldconfig
 
 	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
-		for img in cpio.gz cpio.lzo cpio.lzma; do
+		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
 		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
 			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
 		fi
@@ -202,7 +201,7 @@ kernel_do_configure() {
 	fi
 }
 
-kernel_do_configure[depends] += "${INITRAMFS_TASK}"
+do_configure[depends] += "${INITRAMFS_TASK}"
 
 do_menuconfig() {
         export DISPLAY='${DISPLAY}'
@@ -217,7 +216,7 @@ do_menuconfig() {
 	fi
 }
 do_menuconfig[nostamp] = "1"
-addtask menuconfig after do_patch
+addtask menuconfig after do_configure
 
 pkg_postinst_kernel () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
@@ -524,7 +523,7 @@ kernel_do_deploy() {
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 
-addtask deploy before do_package after do_install
+addtask deploy before do_build after do_install
 
 EXPORT_FUNCTIONS do_deploy
 
-- 
1.7.4.1



