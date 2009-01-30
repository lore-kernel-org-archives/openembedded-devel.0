Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LSsk3-0004dx-Gu
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jan 2009 13:45:04 +0100
Received: by yx-out-1718.google.com with SMTP id 4so155408yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 04:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=/AVgOWiw1zll1zTD00HzzeIYKbTYiSgkhe/jLNHqYpc=;
	b=e0S8HkeaDw/GhzsaeUm+myP7f3IL8Ry/iBcmqaaqfiqRdNJARkL5gu4MHNL7tG9qTT
	QDhsw/IALYzTlsmmeya9mqa2BA+Ef/u/LtsCGL9tYaKPcKdTR/c7DK2DwXKKEiLZ8kt/
	2L77uYJLSx9z4SqTrgbaBZrh/TqwPh11cyHcE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=GumXVo5iyNkskR/0kMD/alA/HNNso2C9kmIgu18SmNXaD8+8jFPIKHQDZ+VzM5SeOz
	Y+SdKOwuKXUgdc6Wz1TEhrTCU0zdGfWC6IEdHkNEIU4/uk04WvguZTSyoNWDSzBpbu2X
	I3nYVzbQhZAKysLInGDPdWQnAiW9C32nn24nQ=
Received: by 10.100.168.1 with SMTP id q1mr968471ane.40.1233319037953;
	Fri, 30 Jan 2009 04:37:17 -0800 (PST)
Received: from ?10.6.9.10? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id c37sm1364391ana.42.2009.01.30.04.37.15
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jan 2009 04:37:17 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jan 2009 14:37:14 +0200
Message-Id: <1233319034.13141.2.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] Automate uboot entry/load addresses detection.
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
X-List-Received-Date: Fri, 30 Jan 2009 12:45:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Automated UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT variables detection (no
need to specify them for every machine and/or kernel now).

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 classes/kernel.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index d1f59e5..f7a7014 100644
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
 	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
 		cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" initramfs.cpio.gz
@@ -489,12 +485,16 @@ do_deploy() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
 		if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
 			${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
+			UBOOT_LOADADDRESS=`${OBJDUMP} -p arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
+			UBOOT_ENTRYPOINT=`${OBJDUMP} -f arch/${ARCH}/boot/compressed/vmlinux | sed -n 's/.*start address \([^ ]*\).*/\1/p'`; \
 			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 			rm -f linux.bin
 		else
 			${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
 			rm -f linux.bin.gz
 			gzip -9 linux.bin
+			UBOOT_LOADADDRESS=`${OBJDUMP} -p vmlinux | sed -n 's/LOAD.*vaddr \([^ ]*\).*/\1/p'`; \
+			UBOOT_ENTRYPOINT=`${OBJDUMP} -f vmlinux | sed -n 's/.*start address \([^ ]*\).*/\1/p'`; \
 			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 			rm -f linux.bin.gz
 		fi
-- 
1.5.6.3




