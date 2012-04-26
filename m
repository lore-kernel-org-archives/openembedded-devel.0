Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOIr-0005hJ-8U
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:00:09 +0200
Received: by wgbdr1 with SMTP id dr1so972116wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YH/hzasNw8AI/JD7J40NjaSKkL52Tt38Z89DvTam8zE=;
	b=PEH1DGqjNtjIHoBXIsF9dh9gAE6tbcgHtWHvmW5M1R1uInEdi1Fbv/xiaO82EINC/+
	fcc0DfrCgac1czzL2dSWqen8Znf4CQaA++UIffmtHGOEyXIso6kh0TRhs+j5vBicGM2z
	MS1YPQk+oZzR4DeQil0cWybRN8xQ60/fSPflQMzxkgVVoawy59gMI7qCjK8yIPrcjnQw
	rWX2S4qVZLSNL+CSUwkRpYwQqxWT+Zj9Nsh0ACjDJesS0SXAIhBBWzK2I04q73IQGOLB
	Dm8g94t6iA1tDEb08qpuqUGcGkhpp+2+fqp2vNrvDkkNvbrg89cOMpkI7mX4IisN6SiW
	qnJg==
Received: by 10.180.82.136 with SMTP id i8mr2574676wiy.19.1335444632459;
	Thu, 26 Apr 2012 05:50:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm10786292wiw.5.2012.04.26.05.50.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:50:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:06 +0200
Message-Id: <56a34a9e60b825908e84e340b3fb06f6842aa82f.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 01/15] kernel.bbclass: resync with oe-core version
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
X-List-Received-Date: Thu, 26 Apr 2012 13:00:09 -0000

* 4 spaces for anonymous python
* don't recreate uImage if it already exists

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |   64 ++++++++++++++++++++-------------------
 1 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index cfcd5e9..4d394c7 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -11,20 +11,20 @@ INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
 
 python __anonymous () {
-	kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
-	if kerneltype == 'uImage':
-		depends = d.getVar("DEPENDS", True)
-		depends = "%s u-boot-mkimage-native" % depends
-		d.setVar("DEPENDS", depends)
+    kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
+    if kerneltype == 'uImage':
+        depends = d.getVar("DEPENDS", True)
+        depends = "%s u-boot-mkimage-native" % depends
+        d.setVar("DEPENDS", depends)
 
-	image = d.getVar('INITRAMFS_IMAGE', True)
-	if image:
-		d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
+    image = d.getVar('INITRAMFS_IMAGE', True)
+    if image:
+        d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
 
-	machine_kernel_pr = d.getVar('MACHINE_KERNEL_PR', True)
+    machine_kernel_pr = d.getVar('MACHINE_KERNEL_PR', True)
 
-	if machine_kernel_pr:
-		d.setVar('PR', machine_kernel_pr)
+    if machine_kernel_pr:
+        d.setVar('PR', machine_kernel_pr)
 }
 
 inherit kernel-arch deploy
@@ -507,34 +507,36 @@ do_sizecheck() {
 
 addtask sizecheck before do_install after do_compile
 
+KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+# Don't include the DATETIME variable in the sstate package signatures
+KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
+
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-		ENTRYPOINT=${UBOOT_ENTRYPOINT}
-		if test -n "${UBOOT_ENTRYSYMBOL}"; then
-			ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
-				awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
-		fi
-		if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
-			rm -f linux.bin
-		else
-			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-			rm -f linux.bin.gz
-			gzip -9 linux.bin
-			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
-			rm -f linux.bin.gz
+		if test ! -e arch/${ARCH}/boot/uImage ; then
+			ENTRYPOINT=${UBOOT_ENTRYPOINT}
+			if test -n "${UBOOT_ENTRYSYMBOL}"; then
+				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+			fi
+			if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+				${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+				rm -f linux.bin
+			else
+				${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
+				rm -f linux.bin.gz
+				gzip -9 linux.bin
+				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
+				rm -f linux.bin.gz
+			fi
 		fi
 	fi
 }
 
 addtask uboot_mkimage before do_install after do_compile
 
-KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
-# Don't include the DATETIME variable in the sstate package signatures
-KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
-
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-- 
1.7.8.5



