Received: from ey-out-1920.google.com ([74.125.78.149])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NAYVe-0000GB-Pc
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 01:35:01 +0100
Received: by ey-out-1920.google.com with SMTP id 3so1671883eyh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 16:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Zlq3DmZcyEytPSJ0kcib6fWzOaN2UBtap4GtISY3X18=;
	b=o9DoIGb9pAuWfMFg0np7WDgtPKtbnXS8mXP3wlDCvw6f8DALFqQsyWGkYJ7au0N6mO
	LJ+SHTl6dL+xbwmcE0DlMdsvsijKVTqYjttWjYQ5n9Uq5JJtit5sM0d4a+4vGTMeKPjD
	Q+R7i1Jxj8tZhyrhIF9qZY7NhomI0jeA858D0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=S/Wyl1vfOfQ3SM0KIa5Qqrgu+I07QHIcOT94U1vDUYDRFewikUKPLuAeTNpcwtNu/B
	ykvq6P/U3930bn2um8NBik4HZV+DclZmiOMEQhiB0dwJi+1O9m12m8talhe4yLPQlOlN
	4KcSt8JdQrN4TtSbQPPMO6sNwlLV2NWrnhPCE=
Received: by 10.213.109.156 with SMTP id j28mr2940768ebp.79.1258504417343;
	Tue, 17 Nov 2009 16:33:37 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 10sm900694eyd.7.2009.11.17.16.33.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Nov 2009 16:33:36 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Nov 2009 01:33:33 +0100
Message-Id: <1258504413-25056-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 74.125.78.149
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] squashfs-4.0: update squashfs-tools to include upstream LZMA inclusion.
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
X-List-Received-Date: Wed, 18 Nov 2009 00:35:01 -0000

In OpenEmbedded we used squashfs 4.0 with external patch for LZMA
compression support. In the meantime, squashfs has mainlined LZMA
support in its CVS version.

This patches switches to the upstream squashfs-tools and modifies
bitbake.conf to match the slightly different arguments to mksquashfs.

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 conf/bitbake.conf                                  |    2 +-
 conf/distro/include/sane-srcdates.inc              |    1 +
 .../squashfs-tools/squashfs-tools-native_4.0.bb    |    7 +--
 recipes/squashfs-tools/squashfs-tools_4.0.bb       |   42 +++++++++++++++-----
 4 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 96e7799..bb99d3c 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -345,7 +345,7 @@ IMAGE_CMD_ext2.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOT
 IMAGE_CMD_ext3 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
 IMAGE_CMD_ext3.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
-IMAGE_CMD_squashfs-lzma = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -lzma"
+IMAGE_CMD_squashfs-lzma = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp lzma"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
 IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
 IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
diff --git a/conf/distro/include/sane-srcdates.inc b/conf/distro/include/sane-srcdates.inc
index 422145c..4ea318f 100644
--- a/conf/distro/include/sane-srcdates.inc
+++ b/conf/distro/include/sane-srcdates.inc
@@ -41,6 +41,7 @@ SRCDATE_rdesktop ?= "20080917"
 SRCDATE_roadster ?= "20060814"
 SRCDATE_rosetta ?= "20090514"
 SRCDATE_sctzap ?= "20060814"
+SRCDATE_squashfs ?= "20091110"
 SRCDATE_tslib ?= "20051101"
 SRCDATE_waimea ?= "20060814"
 SRCDATE_xcompmgr ?= "20060814"
diff --git a/recipes/squashfs-tools/squashfs-tools-native_4.0.bb b/recipes/squashfs-tools/squashfs-tools-native_4.0.bb
index 8fc80a6..cc01604 100644
--- a/recipes/squashfs-tools/squashfs-tools-native_4.0.bb
+++ b/recipes/squashfs-tools/squashfs-tools-native_4.0.bb
@@ -1,13 +1,12 @@
-require squashfs-tools_${PV}.bb
+require squashfs-tools_4.0.bb
 
 inherit native
 
-DEPENDS = "zlib-native lzma-native "
-
-PR = "${INC_PR}.1"
+DEPENDS = "zlib-native"
 
 PACKAGES = ""
 
 do_stage () {
 	install -m 0755 mksquashfs ${STAGING_BINDIR}/
 }
+
diff --git a/recipes/squashfs-tools/squashfs-tools_4.0.bb b/recipes/squashfs-tools/squashfs-tools_4.0.bb
index 17ab6dc..4e18489 100644
--- a/recipes/squashfs-tools/squashfs-tools_4.0.bb
+++ b/recipes/squashfs-tools/squashfs-tools_4.0.bb
@@ -1,14 +1,36 @@
-require squashfs-tools.inc
-DEPENDS += "lzma"
-PR = "${INC_PR}.1"
+DESCRIPTION = "Squashfs is a highly compressed read-only filesystem for Linux."
+SECTION = "base"
+LICENSE = "GPLv2"
+DEPENDS = "zlib"
+PR = "r2"
 
-EXTRA_OEMAKE = "USE_LZMA=1 \
-                LZMA_CFLAGS='-I${STAGING_INCDIR}/lzma -DUSE_LZMA' \
-                LZMA_LIB='${STAGING_LIBDIR}/liblzma.a'"
+# 2009-10-22 snapshot
+#SRC_URI = "http://www.kernel.org/pub/linux/kernel/people/pkl/squashfs4.0-lzma-snapshot.tgz"
+#S = "${WORKDIR}/squashfs4.0-lzma-snapshot/squashfs-tools"
 
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_angstrom = "1"
+SRC_URI  = "cvs://anonymous@squashfs.cvs.sourceforge.net/cvsroot/squashfs;module=squashfs;date=${SRCDATE}"
+S = "${WORKDIR}/squashfs/squashfs-tools"
 
-SRC_URI += " file://portability.patch;patch=1;pnum=2 \
-             file://lzma-support.patch;patch=1;pnum=2"
+SRC_URI += "http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2"
+
+COMP_DEFAULT = gzip
+
+EXTRA_OEMAKE += "LZMA_SUPPORT=1 LZMA_DIR=../.."
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+# the COMP_DEFAULT macro should result in a string including quotes: "gzip"
+CFLAGS_append = ' -I. -I../../C -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
+ -D_GNU_SOURCE -DLZMA_SUPPORT -DCOMP_DEFAULT=\\"${COMP_DEFAULT}\\" '
+
+prefix = ""
+
+do_compile() {
+	oe_runmake mksquashfs
+}
+
+do_install () {
+	install -d ${D}${sbindir}
+	install -m 0755 mksquashfs ${D}${sbindir}/
+}
 
-- 
1.6.0.4



