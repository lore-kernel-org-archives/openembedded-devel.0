Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@se-eng.com>) id 1Qhrdn-0007cy-Kq
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jul 2011 01:17:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 3D10620C9486
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2011 17:04:25 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rAaav26lYyjf; Fri, 15 Jul 2011 17:04:24 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.150])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 9658420C947D;
	Fri, 15 Jul 2011 17:04:24 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id 1B6572C959; Fri, 15 Jul 2011 17:04:56 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 17:04:38 -0600
Message-Id: <1310771078-18629-2-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <4E20710B.6060906@se-eng.com>
References: <4E20710B.6060906@se-eng.com>
Subject: [PATCH 2/2 v2] conf/bitbake.conf: Add support for generating kernel+initrd ELF coreboot payloads
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
X-List-Received-Date: Fri, 15 Jul 2011 23:17:52 -0000

On x86, and ELF image file may be stored as a coreboot payload.  This image file may be a kernel or a kernel+initrd.

Documentation on this has been started on the coreboot wiki:
http://www.coreboot.org/Mkelfimage

We have seen success using the mkelfimage utility to construct a kernel+initrd image using the micro-image OpenEmbedded image as an initrd.
http://www.se-eng.com/wiki/index.php/Open_Embedded_Setup

To use, set a new type "elf" to IMAGE_FSTYPES in conf/local.conf on x86 targets:
IMAGE_FSTYPES = "cpio.gz elf"

You may also override the kernel parameters that are embedded in the elf file:
IMAGE_KERNELPARAMS = "ramdisk_size=32768 root=/dev/ram0 rw console="

The image binary ${TMPDIR}/deploy/images/${MACHINE}/*.elf may be added to the coreboot configuration in Kconfig (CONFIG_PAYLOAD_FILE)

Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
---
v2:
 * Update commit summary and log.
   - Include test and usage steps.
 * Add Signed-off-by

 conf/bitbake.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 66dfaba..1ab72e1 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -375,6 +375,7 @@ IMAGE_BASENAME = "${PN}"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 IMAGE_EXTRA_SPACE = 10240
+IMAGE_KERNELPARAMS = "ramdisk_size=32768 root=/dev/ram0 rw console="
 
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
@@ -406,6 +407,7 @@ IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find .
 IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
+IMAGE_CMD_elf = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ; rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf ;  mkelfImage --append='${IMAGE_KERNELPARAMS}' --kernel=${STAGING_DIR}/${MACHINE}${HOST_VENDOR}-${HOST_OS}/kernel/bzImage --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf ${EXTRA_IMAGECMD}"
 
 EXTRA_IMAGECMD = ""
 EXTRA_IMAGECMD_jffs2 = ""
@@ -440,6 +442,7 @@ IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-tools-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
+IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 
 EXTRA_IMAGEDEPENDS = ""
 
-- 
1.7.0.4



