Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhlWt-0004eG-He
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 18:46:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jul 2011 09:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,209,1309762800"; d="scan'208";a="27701916"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.182])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2011 09:42:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 17:42:04 +0100
Message-Id: <f7be9edaa820632d0fd2c39601802bb3e361f122.1310748001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 2/5] Remove meta-oe/patches/
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
X-List-Received-Date: Fri, 15 Jul 2011 16:46:20 -0000

I suspect this should not have been committed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...ass-merge-in-OE-improvements-for-mkimage-.patch |  109 --------------------
 meta-oe/patches/kernel-temp                        |   33 ------
 2 files changed, 0 insertions(+), 142 deletions(-)
 delete mode 100644 meta-oe/patches/0001-kernel-bbclass-merge-in-OE-improvements-for-mkimage-.patch
 delete mode 100644 meta-oe/patches/kernel-temp

diff --git a/meta-oe/patches/0001-kernel-bbclass-merge-in-OE-improvements-for-mkimage-.patch b/meta-oe/patches/0001-kernel-bbclass-merge-in-OE-improvements-for-mkimage-.patch
deleted file mode 100644
index 7283df8..0000000
--- a/meta-oe/patches/0001-kernel-bbclass-merge-in-OE-improvements-for-mkimage-.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 65780d06117be92941b3c5404dc31597b6807263 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 23 Jan 2011 10:58:46 +0100
-Subject: [PATCH] kernel bbclass: merge in OE improvements for mkimage, PR and initramfs
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- classes/kernel.bbclass |   60 +++++++++++++++++++++++++++++++++++------------
- 1 files changed, 44 insertions(+), 16 deletions(-)
-
-diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
-index 827046e..d94930b 100644
---- a/classes/kernel.bbclass
-+++ b/classes/kernel.bbclass
-@@ -14,8 +14,20 @@ python __anonymous () {
-     	depends = bb.data.getVar("DEPENDS", d, 1)
-     	depends = "%s u-boot-mkimage-native" % depends
-     	bb.data.setVar("DEPENDS", depends, d)
-+
-+    image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
-+    if image != '' and image is not None:
-+        bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
-+
-+    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
-+
-+    if machine_kernel_pr:
-+       bb.data.setVar('PR', machine_kernel_pr, d)
- }
- 
-+INITRAMFS_IMAGE ?= ""
-+INITRAMFS_TASK ?= ""
-+
- inherit kernel-arch deploy
- 
- PACKAGES_DYNAMIC += "kernel-module-*"
-@@ -196,8 +208,17 @@ sysroot_stage_all_append() {
- 
- kernel_do_configure() {
-         yes '' | oe_runmake oldconfig
-+	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
-+		for img in cpio.gz cpio.lzo cpio.lzma; do
-+		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
-+			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
-+		fi
-+		done
-+	fi
- }
- 
-+kernel_do_configure[depends] += "${INITRAMFS_TASK}"
-+
- do_menuconfig() {
- 	export TERMWINDOWTITLE="${PN} Kernel Configuration"
- 	export SHELLCMDS="make menuconfig"
-@@ -476,6 +497,29 @@ do_sizecheck() {
- 
- addtask sizecheck before do_install after do_compile
- 
-+do_uboot_mkimage() {
-+    if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-+        ENTRYPOINT=${UBOOT_ENTRYPOINT}
-+        if test -n "${UBOOT_ENTRYSYMBOL}"; then
-+            ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
-+                   awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
-+        fi
-+        if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-+            ${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-+            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
-+            rm -f linux.bin
-+        else
-+            ${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-+            rm -f linux.bin.gz
-+            gzip -9 linux.bin
-+            uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
-+            rm -f linux.bin.gz
-+        fi
-+    fi
-+}
-+
-+addtask uboot_mkimage before do_install after do_compile
-+
- KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
- # Don't include the DATETIME variable in the sstate package signatures
- KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-@@ -487,22 +531,6 @@ kernel_do_deploy() {
- 		tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${MACHINE}.tgz -C ${D} lib
- 	fi
- 
--	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
--		if test -e arch/${ARCH}/boot/uImage ; then
--			cp arch/${ARCH}/boot/uImage ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
--		elif test -e arch/${ARCH}/boot/compressed/vmlinux ; then
--			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
--			uboot-mkimage -A ${ARCH} -O linux -T kernel -C none -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
--			rm -f linux.bin
--		else
--			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
--			rm -f linux.bin.gz
--			gzip -9 linux.bin
--			uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
--			rm -f linux.bin.gz
--		fi
--	fi
--
- 	cd ${DEPLOYDIR}
- 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
- 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
--- 
-1.6.6.1
-
diff --git a/meta-oe/patches/kernel-temp b/meta-oe/patches/kernel-temp
deleted file mode 100644
index 3bbcfe9..0000000
--- a/meta-oe/patches/kernel-temp
+++ /dev/null
@@ -1,33 +0,0 @@
-diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
-index d94930b..2a0f3da 100644
---- a/classes/kernel.bbclass
-+++ b/classes/kernel.bbclass
-@@ -220,6 +196,9 @@ kernel_do_configure() {
- kernel_do_configure[depends] += "${INITRAMFS_TASK}"
- 
- do_menuconfig() {
-+        export DISPLAY='${DISPLAY}'
-+        export DBUS_SESSION_BUS_ADDRESS='${DBUS_SESSION_BUS_ADDRESS}'
-+        export XAUTHORITY='${XAUTHORITY}'
- 	export TERMWINDOWTITLE="${PN} Kernel Configuration"
- 	export SHELLCMDS="make menuconfig"
- 	${TERMCMDRUN}
-@@ -318,13 +297,16 @@ module_conf_rfcomm = "alias bt-proto-3 rfcomm"
- 
- python populate_packages_prepend () {
- 	def extract_modinfo(file):
--		import re
--		tmpfile = os.tmpnam()
-+		import tempfile, re
-+		tempfile.tempdir = bb.data.getVar("WORKDIR", d, 1)
-+		tf = tempfile.mkstemp()
-+		tmpfile = tf[1]
- 		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "", file, tmpfile)
- 		os.system(cmd)
- 		f = open(tmpfile)
- 		l = f.read().split("\000")
- 		f.close()
-+		os.close(tf[0])
- 		os.unlink(tmpfile)
- 		exp = re.compile("([^=]+)=(.*)")
- 		vals = {}
-- 
1.7.4.1



