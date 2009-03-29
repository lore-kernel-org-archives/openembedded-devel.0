Received: from [85.33.2.26] (helo=smtp-out26.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Lo3d7-0005cC-MK
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 00:37:25 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 30 Mar 2009 00:35:21 +0200
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 30 Mar 2009 00:35:21 +0200
Received: from localhost.localdomain ([79.1.229.158]) by FBCMCL01B05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 30 Mar 2009 00:35:21 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 00:35:20 +0200
Message-Id: <1238366120-28099-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <d1b08f940903291528i4fcd7139rc7d3cee88dd315d5@mail.gmail.com>
References: <d1b08f940903291528i4fcd7139rc7d3cee88dd315d5@mail.gmail.com>
X-OriginalArrivalTime: 29 Mar 2009 22:35:21.0181 (UTC)
	FILETIME=[A4CAF8D0:01C9B0BE]
Subject: [PATCH] kernel.bbclass: Automate uboot entry/load addresses detection.
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
X-List-Received-Date: Sun, 29 Mar 2009 22:37:26 -0000

---
 classes/kernel.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 17e8941..85a2e07 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -69,10 +69,6 @@ KERNEL_LOCALVERSION ?= ""
 # kernels are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# U-Boot support
-UBOOT_ENTRYPOINT ?= "20008000"
-UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
-
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
@@ -491,12 +487,16 @@ do_deploy() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
 		if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
 			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+			 UBOOT_LOADADDRESS=`${OBJDUMP} -p arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
+			 UBOOT_ENTRYPOINT=`${OBJDUMP} -f arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/.*start address \([^ ]*\).*/\1/p'`; \
 			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 			rm -f linux.bin
 		else
 			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
 			rm -f linux.bin.gz
 			gzip -9 linux.bin
+			 UBOOT_LOADADDRESS=`${OBJDUMP} -p vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
+			 UBOOT_ENTRYPOINT=`${OBJDUMP} -f vmlinux | sed -n 's/.*start address \([^ ]*\).*/\1/p'`; \
 			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 			rm -f linux.bin.gz
 		fi
-- 
1.6.0.6



