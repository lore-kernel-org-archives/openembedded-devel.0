Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UEQQx-0004ys-1w
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 21:32:00 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id A0F67EA048;
	Sat,  9 Mar 2013 21:31:34 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id 09165A42DD2; Sat,  9 Mar 2013 21:15:36 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Mar 2013 21:15:21 +0100
Message-Id: <2031e9b19fc0963e869a9d5595db0eea128c26f9.1362859975.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362859975.git.apelete@seketeli.net>
References: <cover.1362859975.git.apelete@seketeli.net>
In-Reply-To: <cover.1362859975.git.apelete@seketeli.net>
References: <cover.1362859975.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH v3 2/2] jlime-2010.1: add capability to build ubi image for ben-nanonote machine
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
X-List-Received-Date: Sat, 09 Mar 2013 20:32:10 -0000

Add capability to build a ubi image for the ben-nanonote machine when
using the jlime-2010.1 distro. The resulting image is ready to use and
fully functionnal.
---
 conf/bitbake.conf              |    2 +-
 conf/distro/jlime-2010.1.conf  |    3 ++-
 conf/machine/ben-nanonote.conf |   12 ++++++++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 01b9321..527127e 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -399,7 +399,7 @@ IMAGE_CMD_cpio.gz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio
 IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
 IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | lzma -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
+IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg ${EXTRA_IMAGECMD} ; mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
 
 EXTRA_IMAGECMD = ""
diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.conf
index a3ec20e..d6a92cf 100644
--- a/conf/distro/jlime-2010.1.conf
+++ b/conf/distro/jlime-2010.1.conf
@@ -30,13 +30,14 @@ DISTRO_EXTRA_RDEPENDS = "nano keymaps console-tools"
 #
 IMAGE_NAME = "${DISTRO_NAME}-${IMAGE_BASENAME}-${DISTRO_VERSION}-${MACHINE}"
 SPLASH = "psplash"
+UBI_VOLNAME = "rootfs"
 
 #
 # Naming schemes + packages
 #
 INHERIT += "debian package_tar package_ipk src_distribute_local"
 SRC_DIST_LOCAL ?= "symlink"
-IMAGE_FSTYPES = "tar.gz tar.bz2 jffs2"
+IMAGE_FSTYPES = "tar.gz tar.bz2 jffs2 ubi"
 PREFERRED_PROVIDER_virtual/update-alternatives = "opkg"
 
 #
diff --git a/conf/machine/ben-nanonote.conf b/conf/machine/ben-nanonote.conf
index fd4aba4..e92992d 100644
--- a/conf/machine/ben-nanonote.conf
+++ b/conf/machine/ben-nanonote.conf
@@ -13,6 +13,18 @@ KERNEL_IMAGETYPE = "vmlinux.bin"
 
 IMAGE_FSTYPES ?= "jffs2"
 
+# do ubiattach /dev/ubi_ctrl -m 2
+# From dmesg:
+# UBI: physical eraseblock size:   524288 bytes (512 KiB)
+# UBI: logical eraseblock size:    516096 bytes
+# UBI: smallest flash I/O unit:    4096
+# UBI: VID header offset:          4096 (aligned 4096)
+# UBI: data offset:                8192
+MKUBIFS_ARGS = "-m 4096 -e 516096 -c 4095"
+UBINIZE_ARGS = "-m 4096 -p 512KiB"
+
+EXTRA_IMAGECMD_ubi = "; echo vol_alignment=1 >> ubinize.cfg"
+
 PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
 PREFERRED_VERSION_xserver-kdrive = "1.3.0.0"
 
-- 
1.7.10.4



