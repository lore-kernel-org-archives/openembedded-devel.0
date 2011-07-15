Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1Qhlrj-0005sC-4E
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 19:07:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 7D40120C9F55;
	Fri, 15 Jul 2011 10:55:18 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Z7y8mwRca3CV; Fri, 15 Jul 2011 10:55:17 -0600 (MDT)
Received: from [172.20.202.150] (beast.camp.se-eng.com [172.20.202.150])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id E032E20C9F54;
	Fri, 15 Jul 2011 10:55:17 -0600 (MDT)
Message-ID: <4E207114.2000602@se-eng.com>
Date: Fri, 15 Jul 2011 10:55:48 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Cc: coreboot@coreboot.org
Subject: [PATCH 2/2] Add mkelfimage and support for generating kernel+initrd ELF payloads to OpenEmbedded
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
X-List-Received-Date: Fri, 15 Jul 2011 17:07:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On x86, and ELF image file may be stored as a coreboot payload.  This 
image file may be a kernel or a kernel+initrd.

Documentation on this has been started on the coreboot wiki:
http://www.coreboot.org/Mkelfimage

We have seen success using the mkelfimage utility to construct a 
kernel+initrd image using the micro-image OpenEmbedded image as an initrd.
http://www.se-eng.com/wiki/index.php/Open_Embedded_Setup

The second patch contains the necessary commands for adding the image 
type to bitbake.
---
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

@@ -406,6 +407,7 @@ IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd 
${IMAGE_ROOTFS} && (find .
  IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && 
(find . | cpio -o -H newc | xz --format=lzma -c ${XZ_COMPRESSION_LEVEL} 
--check=${XZ_INTEGRITY_CHECK} 
 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
  IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> 
ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> 
ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> 
ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo 
vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o 
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize 
-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o 
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
+IMAGE_CMD_elf = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | 
cpio -o -H newc | gzip -c -9 
 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ; rm -f 
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf ;  mkelfImage 
--append='${IMAGE_KERNELPARAMS}' 
--kernel=${STAGING_DIR}/${MACHINE}${HOST_VENDOR}-${HOST_OS}/kernel/bzImage 
--initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz 
--output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf ${EXTRA_IMAGECMD}"

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



