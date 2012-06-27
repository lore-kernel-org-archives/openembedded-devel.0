Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sk1De-0003TK-GH
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 01:00:18 +0200
Received: from mizar.localdomain (79.16.253.88) by smtp205.alice.it
	(8.6.023.02) id 4F421F7B0F3AC8F5; Thu, 28 Jun 2012 00:49:24 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2012 00:49:21 +0200
Message-Id: <1340837361-27237-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][meta-initramfs][PATCH v2] ubi-utils-klibc: update to patched v. 1.5.0
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
X-List-Received-Date: Wed, 27 Jun 2012 23:00:18 -0000

* Fix build failing because of UBI_IOCSETPROP -> UBI_IOCSETVOLPROP renaming.
* This patch follows the one in oe-core for mtd-utils_1.5.0
* which was staging an older version of the ubi-user.h header.
* We need to match the renaming done in kernel 3.0
* http://lists.infradead.org/pipermail/linux-mtd/2011-March/
* 034419.html

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/libubi.c.patch             |   17 +++++++
 .../recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb  |   49 --------------------
 .../recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb  |   49 ++++++++++++++++++++
 3 files changed, 66 insertions(+), 49 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
index db95904..b52e207 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
@@ -9,3 +9,20 @@
  {
  	int fd, ret;
  
+@@ -1346,13 +1346,13 @@
+ 
+ int ubi_set_property(int fd, uint8_t property, uint64_t value)
+ {
+-	struct ubi_set_prop_req r;
++	struct ubi_set_vol_prop_req r;
+ 
+-	memset(&r, 0, sizeof(struct ubi_set_prop_req));
++	memset(&r, 0, sizeof(struct ubi_set_vol_prop_req));
+ 	r.property = property;
+ 	r.value = value;
+ 
+-	return ioctl(fd, UBI_IOCSETPROP, &r);
++	return ioctl(fd, UBI_IOCSETVOLPROP, &r);
+ }
+ 
+ int ubi_leb_unmap(int fd, int lnum)
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
deleted file mode 100644
index ebdd3f6..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-DESCRIPTION = "Tools for managing memory technology devices."
-SECTION = "base"
-DEPENDS = "zlib lzo e2fsprogs util-linux"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
-
-PR = "r4"
-
-inherit klibc
-
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf32f381c140bf72b21bf91cef1b \
-            file://Makefile.patch \
-            file://common.mk.patch \
-            file://libubi.c.patch \
-            file://libiniparser.c.patch \
-            file://ubiformat.c.patch \
-            "
-
-S = "${WORKDIR}/git/"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -I${S}ubi-utils/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
-
-do_install () {
-
-    install -d ${D}${sbindir}
-    oe_runmake DESTDIR="${D}" install
-
-}
-
-PACKAGES = "ubi-utils-klibc-dbg"
-
-PACKAGES =+ "ubinfo-klibc ubiattach-klibc ubidetach-klibc mtdinfo-klibc ubiupdatevol-klibc \
-             ubimkvol-klibc ubirename-klibc ubirmvol-klibc ubirsvol-klibc \
-             ubinize-klibc ubiformat-klibc ubicrc32-klibc"
-
-FILES_ubinfo-klibc = "${sbindir}/ubinfo"
-FILES_ubiattach-klibc = "${sbindir}/ubiattach"
-FILES_ubidetach-klibc = "${sbindir}/ubidetach"
-FILES_mtdinfo-klibc = "${sbindir}/mtdinfo"
-FILES_ubiupdatevol-klibc = "${sbindir}/ubiupdatevol"
-FILES_ubimkvol-klibc = "${sbindir}/ubimkvol"
-FILES_ubirename-klibc = "${sbindir}/ubirename"
-FILES_ubirmvol-klibc = "${sbindir}/ubirmvol"
-FILES_ubirsvol-klibc = "${sbindir}/ubirsvol"
-FILES_ubinize-klibc = "${sbindir}/ubinize"
-FILES_ubiformat-klibc = "${sbindir}/ubiformat"
-FILES_ubicrc32-klibc = "${sbindir}/ubicrc32"
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
new file mode 100644
index 0000000..5cdd984
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "Tools for managing memory technology devices."
+SECTION = "base"
+DEPENDS = "zlib lzo e2fsprogs util-linux"
+HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
+
+PR = "r0"
+
+inherit klibc
+
+SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f \
+            file://Makefile.patch \
+            file://common.mk.patch \
+            file://libubi.c.patch \
+            file://libiniparser.c.patch \
+            file://ubiformat.c.patch \
+            "
+
+S = "${WORKDIR}/git/"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+
+do_install () {
+
+    install -d ${D}${sbindir}
+    oe_runmake DESTDIR="${D}" install
+
+}
+
+PACKAGES = "ubi-utils-klibc-dbg"
+
+PACKAGES =+ "ubinfo-klibc ubiattach-klibc ubidetach-klibc mtdinfo-klibc ubiupdatevol-klibc \
+             ubimkvol-klibc ubirename-klibc ubirmvol-klibc ubirsvol-klibc \
+             ubinize-klibc ubiformat-klibc ubicrc32-klibc"
+
+FILES_ubinfo-klibc = "${sbindir}/ubinfo"
+FILES_ubiattach-klibc = "${sbindir}/ubiattach"
+FILES_ubidetach-klibc = "${sbindir}/ubidetach"
+FILES_mtdinfo-klibc = "${sbindir}/mtdinfo"
+FILES_ubiupdatevol-klibc = "${sbindir}/ubiupdatevol"
+FILES_ubimkvol-klibc = "${sbindir}/ubimkvol"
+FILES_ubirename-klibc = "${sbindir}/ubirename"
+FILES_ubirmvol-klibc = "${sbindir}/ubirmvol"
+FILES_ubirsvol-klibc = "${sbindir}/ubirsvol"
+FILES_ubinize-klibc = "${sbindir}/ubinize"
+FILES_ubiformat-klibc = "${sbindir}/ubiformat"
+FILES_ubicrc32-klibc = "${sbindir}/ubicrc32"
-- 
1.7.3.4



