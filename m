Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id B961860167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 00:13:55 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id l18so15887524wgh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 16:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dI9CJgrOZieUrAPXcU2JCOKR7D1jSf2bbqOmPf9EMJc=;
	b=Meyelp2tR5koIp42tPG187i++0wTYn6RgiwF5aR3onFJTQFy+dqoNpbAGG+cmYTuWO
	Y1zsVsyDpQ4KrcGDysV/fFuWmkAyk7D+vvGb3CGk7WQzBn3MGCYUN9Ys+D8ivX1qwpQV
	bZysrcNNv8iQAMzbbLnIzYQFsYMFvXJgVETv0n0ng+jh2vOx99lc/y1Lnn+XxHW0pE1b
	OiyQyPObTi4sDrRyMPU0lH8xPlZ8nvwlMLUd54YH+Ksn/e/I0b4oo3PUqRuIcc3gYwlV
	b66RwzFjl4lVmXyN81uXf1C2/HdA7XvwZ0kNFM2mT18x1ye2Xl0jlfcfTOCRPAUFVe3r
	01nA==
X-Received: by 10.194.82.104 with SMTP id h8mr68642795wjy.44.1415837635551;
	Wed, 12 Nov 2014 16:13:55 -0800 (PST)
Received: from mizar.208.67.220.220
	(host66-196-dynamic.45-79-r.retail.telecomitalia.it. [79.45.196.66])
	by mx.google.com with ESMTPSA id l4sm33353926wjx.14.2014.11.12.16.13.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Nov 2014 16:13:54 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Nov 2014 01:13:49 +0100
Message-Id: <1415837630-32645-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH 1/2] ubi-utils-klibc_1.5.0: remove recipe and patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2014 00:14:02 -0000

Next patch replaces with v. 1.5.1 and new/rebased patchset

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/Makefile.patch             | 53 ----------------------
 .../mtd/ubi-utils-klibc/common.mk.patch            |  8 ----
 .../mtd/ubi-utils-klibc/libiniparser.c.patch       | 19 --------
 .../mtd/ubi-utils-klibc/libubi.c.patch             | 28 ------------
 .../mtd/ubi-utils-klibc/ubiformat.c.patch          | 20 --------
 .../recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb  | 49 --------------------
 6 files changed, 177 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/common.mk.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch
deleted file mode 100644
index b7dad87..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch
+++ /dev/null
@@ -1,53 +0,0 @@
---- a/Makefile	2012-05-01 19:46:47.000000000 +0200
-+++ b/Makefile	2012-05-01 19:48:01.000000000 +0200
-@@ -16,27 +16,13 @@
- 
- TESTS = tests
- 
--MTD_BINS = \
--	ftl_format flash_erase nanddump doc_loadbios \
--	ftl_check mkfs.jffs2 flash_lock flash_unlock \
--	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite nandtest \
--	jffs2dump \
--	nftldump nftl_format docfdisk \
--	rfddump rfdformat \
--	serve_image recv_image \
--	sumtool jffs2reader
- UBI_BINS = \
- 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
- 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
- 
--BINS = $(MTD_BINS)
--BINS += mkfs.ubifs/mkfs.ubifs
--BINS += $(addprefix ubi-utils/,$(UBI_BINS))
--SCRIPTS = flash_eraseall
-+BINS = $(addprefix ubi-utils/,$(UBI_BINS))
- 
- TARGETS = $(BINS)
--TARGETS += lib/libmtd.a
--TARGETS += ubi-utils/libubi.a
- 
- OBJDEPS = $(BUILDDIR)/include/version.h
- 
-@@ -58,12 +44,9 @@
- 	rm -f $(BUILDDIR)/include/version.h
- 	$(MAKE) -C $(TESTS) clean
- 
--install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
-+install:: $(addprefix $(BUILDDIR)/,${BINS})
- 	mkdir -p ${DESTDIR}/${SBINDIR}
- 	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
--	mkdir -p ${DESTDIR}/${MANDIR}/man1
--	install -m 0644 mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
--	-gzip -9f ${DESTDIR}/${MANDIR}/man1/*.1
- 
- tests::
- 	$(MAKE) -C $(TESTS)
-@@ -88,7 +71,6 @@
- LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
- LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
- 
--$(foreach v,$(MTD_BINS),$(eval $(call mkdep,,$(v))))
- 
- #
- # Common libmtd
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/common.mk.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/common.mk.patch
deleted file mode 100644
index 0a48416..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/common.mk.patch
+++ /dev/null
@@ -1,8 +0,0 @@
---- a/common.mk	2012-04-29 18:15:30.000000000 +0200
-+++ b/common.mk	2012-04-29 00:51:53.000000000 +0200
-@@ -1,4 +1,4 @@
--CC := $(CROSS)gcc
-+CC := $(CROSS)klcc
- AR := $(CROSS)ar
- RANLIB := $(CROSS)ranlib
- 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch
deleted file mode 100644
index 45f2439..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- a/ubi-utils/libiniparser.c	2012-05-29 23:46:08.000000000 +0200
-+++ b/ubi-utils/libiniparser.c	2012-05-29 23:45:01.000000000 +0200
-@@ -327,6 +327,8 @@
-   the notfound value is returned.
-  */
- /*--------------------------------------------------------------------------*/
-+/* Floating-point is not supported in klibc */
-+/*
- double iniparser_getdouble(dictionary * d, char * key, double notfound)
- {
-     char    *   str ;
-@@ -335,6 +337,7 @@
-     if (str==INI_INVALID_KEY) return notfound ;
-     return atof(str);
- }
-+*/
- 
- /*-------------------------------------------------------------------------*/
- /**
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
deleted file mode 100644
index b52e207..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
+++ /dev/null
@@ -1,28 +0,0 @@
---- a/ubi-utils/libubi.c	2012-05-01 01:57:51.000000000 +0200
-+++ b/ubi-utils/libubi.c	2012-05-01 01:55:14.000000000 +0200
-@@ -686,7 +706,7 @@
-  * success and %-1 in case of failure. @r->ubi_num contains newly created UBI
-  * device number.
-  */
--static int do_attach(const char *node, const struct ubi_attach_req *r)
-+static int do_attach(const char *node, struct ubi_attach_req *r)
- {
- 	int fd, ret;
- 
-@@ -1346,13 +1346,13 @@
- 
- int ubi_set_property(int fd, uint8_t property, uint64_t value)
- {
--	struct ubi_set_prop_req r;
-+	struct ubi_set_vol_prop_req r;
- 
--	memset(&r, 0, sizeof(struct ubi_set_prop_req));
-+	memset(&r, 0, sizeof(struct ubi_set_vol_prop_req));
- 	r.property = property;
- 	r.value = value;
- 
--	return ioctl(fd, UBI_IOCSETPROP, &r);
-+	return ioctl(fd, UBI_IOCSETVOLPROP, &r);
- }
- 
- int ubi_leb_unmap(int fd, int lnum)
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch
deleted file mode 100644
index d21ed57..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/ubi-utils/ubiformat.c	2012-05-03 01:14:39.000000000 +0200
-+++ b/ubi-utils/ubiformat.c	2012-05-20 23:11:57.000000000 +0200
-@@ -246,7 +246,7 @@
- 
- 	while (1) {
- 		normsg_cont("continue? (yes/no)  ");
--		if (scanf("%3s", buf) == EOF) {
-+		if (fgets(buf,4,stdin) == NULL) {
- 			sys_errmsg("scanf returned unexpected EOF, assume \"yes\"");
- 			return 1;
- 		}
-@@ -262,7 +262,7 @@
- 	char buf[4];
- 
- 	while (1) {
--		if (scanf("%3s", buf) == EOF) {
-+		if (fgets(buf,4,stdin) == NULL) {
- 			sys_errmsg("scanf returned unexpected EOF, assume \"no\"");
- 			return 0;
- 		}
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
deleted file mode 100644
index 134dd80..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "UBI utils statically compiled against klibc"
-DESCRIPTION = "Small sized tools from mtd-utils for use with initramfs."
-SECTION = "base"
-DEPENDS = "zlib lzo e2fsprogs util-linux"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
-
-
-inherit klibc
-
-SRC_URI = "git://git.infradead.org/mtd-utils.git;tag=ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f \
-            file://Makefile.patch \
-            file://common.mk.patch \
-            file://libubi.c.patch \
-            file://libiniparser.c.patch \
-            file://ubiformat.c.patch \
-"
-
-S = "${WORKDIR}/git/"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
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
-- 
1.9.1


