Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SPjVW-0004TJ-Ji
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 02:02:54 +0200
Received: from mizar.localdomain (82.60.186.61) by smtp209.alice.it
	(8.6.023.02) id 4EF08A630EC1DBBC; Thu, 3 May 2012 01:53:12 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 May 2012 01:53:00 +0200
Message-Id: <1336002780-28002-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1336002780-28002-1-git-send-email-andrea.adami@gmail.com>
References: <1336002780-28002-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] ubi-utils-klibc: add the remaining ubicrc32, ubinize, ubiformat
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
X-List-Received-Date: Thu, 03 May 2012 00:02:54 -0000

* add more hacks to compile
* binaries tested on Zaurus poodle/corgi (with patched kernel)
* bump PR

* NOTES
* strange behavior wrt getopt for at least ubiformat:
* you should pass the options first, i.e.
* ubiformat -O 512 /dev/mtd3    *works*
* ubiformat /dev/mtd3 -O 512    *fails*

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/Makefile.patch             |   27 ++++++++++--------
 .../mtd/ubi-utils-klibc/libiniparser.c.patch       |   13 ++++++++
 .../mtd/ubi-utils-klibc/libubi.c.patch             |   13 +++++++-
 .../mtd/ubi-utils-klibc/ubiformat.c.patch          |   30 ++++++++++++++++++++
 .../recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb  |   30 +++++++++----------
 5 files changed, 83 insertions(+), 30 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch
index 2802afe..b7dad87 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch
@@ -1,6 +1,6 @@
---- a/Makefile	2012-04-29 18:15:30.000000000 +0200
-+++ b/Makefile	2012-04-29 00:43:03.000000000 +0200
-@@ -16,27 +16,11 @@
+--- a/Makefile	2012-05-01 19:46:47.000000000 +0200
++++ b/Makefile	2012-05-01 19:48:01.000000000 +0200
+@@ -16,27 +16,13 @@
  
  TESTS = tests
  
@@ -13,16 +13,14 @@
 -	rfddump rfdformat \
 -	serve_image recv_image \
 -	sumtool jffs2reader
--UBI_BINS = \
--	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
--	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
--
+ UBI_BINS = \
+ 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
+ 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
+ 
 -BINS = $(MTD_BINS)
 -BINS += mkfs.ubifs/mkfs.ubifs
 -BINS += $(addprefix ubi-utils/,$(UBI_BINS))
 -SCRIPTS = flash_eraseall
-+UBI_BINS = ubiupdatevol ubimkvol ubirmvol ubinfo ubiattach ubidetach ubirename mtdinfo ubirsvol
-+
 +BINS = $(addprefix ubi-utils/,$(UBI_BINS))
  
  TARGETS = $(BINS)
@@ -31,7 +29,7 @@
  
  OBJDEPS = $(BUILDDIR)/include/version.h
  
-@@ -58,7 +42,7 @@
+@@ -58,12 +44,9 @@
  	rm -f $(BUILDDIR)/include/version.h
  	$(MAKE) -C $(TESTS) clean
  
@@ -39,8 +37,13 @@
 +install:: $(addprefix $(BUILDDIR)/,${BINS})
  	mkdir -p ${DESTDIR}/${SBINDIR}
  	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
- 	mkdir -p ${DESTDIR}/${MANDIR}/man1
-@@ -88,7 +72,6 @@
+-	mkdir -p ${DESTDIR}/${MANDIR}/man1
+-	install -m 0644 mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
+-	-gzip -9f ${DESTDIR}/${MANDIR}/man1/*.1
+ 
+ tests::
+ 	$(MAKE) -C $(TESTS)
+@@ -88,7 +71,6 @@
  LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
  LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
  
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch
new file mode 100644
index 0000000..8be8ac3
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libiniparser.c.patch
@@ -0,0 +1,13 @@
+--- a/ubi-utils/libiniparser.c	2012-04-30 23:59:40.000000000 +0200
++++ b/ubi-utils/libiniparser.c	2012-04-30 23:55:15.000000000 +0200
+@@ -333,7 +333,9 @@
+ 
+     str = iniparser_getstring(d, key, INI_INVALID_KEY);
+     if (str==INI_INVALID_KEY) return notfound ;
+-    return atof(str);
++    double value;
++    sscanf(str,"%lf",&value);
++    return value;
+ }
+ 
+ /*-------------------------------------------------------------------------*/
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
index e603859..97c4fa3 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
@@ -1,5 +1,5 @@
---- a/ubi-utils/libubi.c	2012-04-29 21:44:52.000000000 +0200
-+++ b/ubi-utils/libubi.c	2012-04-29 21:43:52.000000000 +0200
+--- a/ubi-utils/libubi.c	2012-05-01 01:57:51.000000000 +0200
++++ b/ubi-utils/libubi.c	2012-05-01 01:55:14.000000000 +0200
 @@ -36,6 +36,26 @@
  #include "libubi_int.h"
  #include "common.h"
@@ -49,6 +49,15 @@
  
  	if (minor != 0) {
  		errno = EINVAL;
+@@ -686,7 +706,7 @@
+  * success and %-1 in case of failure. @r->ubi_num contains newly created UBI
+  * device number.
+  */
+-static int do_attach(const char *node, const struct ubi_attach_req *r)
++static int do_attach(const char *node, struct ubi_attach_req *r)
+ {
+ 	int fd, ret;
+ 
 @@ -757,8 +777,8 @@
  				  mtd_dev_node);
  	}
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch
new file mode 100644
index 0000000..7539d76
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/ubiformat.c.patch
@@ -0,0 +1,30 @@
+--- a/ubi-utils/ubiformat.c	2012-05-03 01:14:39.000000000 +0200
++++ b/ubi-utils/ubiformat.c	2012-05-03 01:00:57.000000000 +0200
+@@ -246,7 +246,11 @@
+ 
+ 	while (1) {
+ 		normsg_cont("continue? (yes/no)  ");
+-		if (scanf("%3s", buf) == EOF) {
++
++		fflush(stderr);
++		fflush(stdout);
++
++		if (fgets(buf,4,stdin) == NULL) {
+ 			sys_errmsg("scanf returned unexpected EOF, assume \"yes\"");
+ 			return 1;
+ 		}
+@@ -259,10 +263,13 @@
+ 
+ static int answer_is_yes(void)
+ {
++	fflush(stderr);
++	fflush(stdout);
++
+ 	char buf[4];
+ 
+ 	while (1) {
+-		if (scanf("%3s", buf) == EOF) {
++		if (fgets(buf,4,stdin) == NULL) {
+ 			sys_errmsg("scanf returned unexpected EOF, assume \"no\"");
+ 			return 0;
+ 		}
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
index da0efc0..c46ded5 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
@@ -6,20 +6,17 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-
-PR = "r0"
+PR = "r1"
 
 inherit klibc
 
-# ubicrc32 needs 'feof' (in klibc_2.0)
-# ubinize needs 'atof'
-# ubiformat needs 'scanf'equivalent for klibc
-
 SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf32f381c140bf72b21bf91cef1b \
             file://Makefile.patch \
             file://common.mk.patch \
             file://libmtd.c.patch \
             file://libubi.c.patch \
+            file://libiniparser.c.patch \
+            file://ubiformat.c.patch \
             "
 
 S = "${WORKDIR}/git/"
@@ -27,21 +24,19 @@ S = "${WORKDIR}/git/"
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -I${S}ubi-utils/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
 do_install () {
+
     install -d ${D}${sbindir}
-    install -m 755 ubi-utils/ubinfo ${D}${sbindir}/ubinfo
-    install -m 755 ubi-utils/ubiattach ${D}${sbindir}/ubiattach
-    install -m 755 ubi-utils/ubidetach ${D}${sbindir}/ubidetach
-    install -m 755 ubi-utils/mtdinfo ${D}${sbindir}/mtdinfo
-    install -m 755 ubi-utils/ubiupdatevol ${D}${sbindir}/ubiupdatevol
-    install -m 755 ubi-utils/ubimkvol ${D}${sbindir}/ubimkvol
-    install -m 755 ubi-utils/ubirename ${D}${sbindir}/ubirename
-    install -m 755 ubi-utils/ubirmvol ${D}${sbindir}/ubirmvol
-    install -m 755 ubi-utils/ubirsvol ${D}${sbindir}/ubirsvol
+    oe_runmake DESTDIR="${D}" install
+
 }
 
+PACKAGES = "ubi-utils-klibc-dbg"
+
 PACKAGES =+ "ubinfo-klibc ubiattach-klibc ubidetach-klibc mtdinfo-klibc ubiupdatevol-klibc \
-             ubimkvol-klibc ubirename-klibc ubirmvol-klibc ubirsvol-klibc"
+             ubimkvol-klibc ubirename-klibc ubirmvol-klibc ubirsvol-klibc \
+             ubinize-klibc ubiformat-klibc ubicrc32-klibc"
 
+FILES_ubicrc32-klibc = "${sbindir}/ubicrc32"
 FILES_ubinfo-klibc = "${sbindir}/ubinfo"
 FILES_ubiattach-klibc = "${sbindir}/ubiattach"
 FILES_ubidetach-klibc = "${sbindir}/ubidetach"
@@ -51,3 +46,6 @@ FILES_ubimkvol-klibc = "${sbindir}/ubimkvol"
 FILES_ubirename-klibc = "${sbindir}/ubirename"
 FILES_ubirmvol-klibc = "${sbindir}/ubirmvol"
 FILES_ubirsvol-klibc = "${sbindir}/ubirsvol"
+FILES_ubinize-klibc = "${sbindir}/ubinize"
+FILES_ubiformat-klibc = "${sbindir}/ubiformat"
+
-- 
1.7.3.4



