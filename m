Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SOd7E-0000xc-VQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 01:01:17 +0200
Received: from mizar.localdomain (82.60.186.61) by smtp205.alice.it
	(8.6.023.02) id 4F421F7B07E9DB8D; Mon, 30 Apr 2012 00:51:35 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 00:51:33 +0200
Message-Id: <1335739893-1064-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-initramfs][PATCH] ubi-utils-klibc: initial commit of version 1.4.9
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
X-List-Received-Date: Sun, 29 Apr 2012 23:01:17 -0000

* Initially only ubiattach was targeted (for kexecboot project).
* Based on klibc_1.5.25, will be revised once new klibc is out.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../mtd/ubi-utils-klibc/Makefile.patch             |   50 +++++++++++++
 .../mtd/ubi-utils-klibc/common.mk.patch            |    8 ++
 .../mtd/ubi-utils-klibc/libmtd.c.patch             |   24 +++++++
 .../mtd/ubi-utils-klibc/libubi.c.patch             |   73 ++++++++++++++++++++
 .../recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb  |   53 ++++++++++++++
 5 files changed, 208 insertions(+), 0 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/common.mk.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libmtd.c.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch
new file mode 100644
index 0000000..2802afe
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/Makefile.patch
@@ -0,0 +1,50 @@
+--- a/Makefile	2012-04-29 18:15:30.000000000 +0200
++++ b/Makefile	2012-04-29 00:43:03.000000000 +0200
+@@ -16,27 +16,11 @@
+ 
+ TESTS = tests
+ 
+-MTD_BINS = \
+-	ftl_format flash_erase nanddump doc_loadbios \
+-	ftl_check mkfs.jffs2 flash_lock flash_unlock \
+-	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite nandtest \
+-	jffs2dump \
+-	nftldump nftl_format docfdisk \
+-	rfddump rfdformat \
+-	serve_image recv_image \
+-	sumtool jffs2reader
+-UBI_BINS = \
+-	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
+-	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
+-
+-BINS = $(MTD_BINS)
+-BINS += mkfs.ubifs/mkfs.ubifs
+-BINS += $(addprefix ubi-utils/,$(UBI_BINS))
+-SCRIPTS = flash_eraseall
++UBI_BINS = ubiupdatevol ubimkvol ubirmvol ubinfo ubiattach ubidetach ubirename mtdinfo ubirsvol
++
++BINS = $(addprefix ubi-utils/,$(UBI_BINS))
+ 
+ TARGETS = $(BINS)
+-TARGETS += lib/libmtd.a
+-TARGETS += ubi-utils/libubi.a
+ 
+ OBJDEPS = $(BUILDDIR)/include/version.h
+ 
+@@ -58,7 +42,7 @@
+ 	rm -f $(BUILDDIR)/include/version.h
+ 	$(MAKE) -C $(TESTS) clean
+ 
+-install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
++install:: $(addprefix $(BUILDDIR)/,${BINS})
+ 	mkdir -p ${DESTDIR}/${SBINDIR}
+ 	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
+ 	mkdir -p ${DESTDIR}/${MANDIR}/man1
+@@ -88,7 +72,6 @@
+ LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
+ LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
+ 
+-$(foreach v,$(MTD_BINS),$(eval $(call mkdep,,$(v))))
+ 
+ #
+ # Common libmtd
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/common.mk.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/common.mk.patch
new file mode 100644
index 0000000..0a48416
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/common.mk.patch
@@ -0,0 +1,8 @@
+--- a/common.mk	2012-04-29 18:15:30.000000000 +0200
++++ b/common.mk	2012-04-29 00:51:53.000000000 +0200
+@@ -1,4 +1,4 @@
+-CC := $(CROSS)gcc
++CC := $(CROSS)klcc
+ AR := $(CROSS)ar
+ RANLIB := $(CROSS)ranlib
+ 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libmtd.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libmtd.c.patch
new file mode 100644
index 0000000..f32fb70
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libmtd.c.patch
@@ -0,0 +1,24 @@
+--- a/lib/libmtd.c	2012-04-29 21:44:52.000000000 +0200
++++ b/lib/libmtd.c	2012-04-29 21:43:04.000000000 +0200
+@@ -441,8 +441,8 @@
+ 		return -1;
+ 	}
+ 
+-	major = major(st.st_rdev);
+-	minor = minor(st.st_rdev);
++	major = __major(st.st_rdev);
++	minor = __minor(st.st_rdev);
+ 
+ 	if (mtd_get_info((libmtd_t *)lib, &info))
+ 		return -1;
+@@ -1381,8 +1381,8 @@
+ 		return -1;
+ 	}
+ 
+-	major = major(st.st_rdev);
+-	minor = minor(st.st_rdev);
++	major = __major(st.st_rdev);
++	minor = __minor(st.st_rdev);
+ 
+ 	if (mtd_get_info((libmtd_t *)lib, &info))
+ 		return -1;
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
new file mode 100644
index 0000000..e603859
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
@@ -0,0 +1,73 @@
+--- a/ubi-utils/libubi.c	2012-04-29 21:44:52.000000000 +0200
++++ b/ubi-utils/libubi.c	2012-04-29 21:43:52.000000000 +0200
+@@ -36,6 +36,26 @@
+ #include "libubi_int.h"
+ #include "common.h"
+ 
++/* parts of mtd/ubi-user.h */
++
++/* Set an UBI volume property */
++#define UBI_IOCSETPROP _IOW(UBI_VOL_IOC_MAGIC, 6, struct ubi_set_prop_req)
++
++/**
++ * struct ubi_set_prop_req - a data structure used to set an ubi volume
++ *                           property.
++ * @property: property to set (%UBI_PROP_DIRECT_WRITE)
++ * @padding: reserved for future, not used, has to be zeroed
++ * @value: value to set
++ */
++struct ubi_set_prop_req {
++	uint8_t  property;
++	uint8_t  padding[7];
++	uint64_t value;
++}  __attribute__ ((packed));
++
++/* end parts of mtd/ubi-user.h */
++
+ /**
+  * mkpath - compose full path from 2 given components.
+  * @path: the first component
+@@ -382,8 +402,8 @@
+ 		return errmsg("\"%s\" is not a character device", node);
+ 	}
+ 
+-	major = major(st.st_rdev);
+-	minor = minor(st.st_rdev);
++	major = __major(st.st_rdev);
++	minor = __minor(st.st_rdev);
+ 
+ 	if (minor == 0) {
+ 		errno = EINVAL;
+@@ -448,8 +468,8 @@
+ 		return errmsg("\"%s\" is not a character device", node);
+ 	}
+ 
+-	major = major(st.st_rdev);
+-	minor = minor(st.st_rdev);
++	major = __major(st.st_rdev);
++	minor = __minor(st.st_rdev);
+ 
+ 	if (minor != 0) {
+ 		errno = EINVAL;
+@@ -757,8 +777,8 @@
+ 				  mtd_dev_node);
+ 	}
+ 
+-	major = major(sb.st_rdev);
+-	minor = minor(sb.st_rdev);
++	major = __major(sb.st_rdev);
++	minor = __minor(sb.st_rdev);
+ 
+ 	if (major != MTD_CHAR_MAJOR) {
+ 		errno = EINVAL;
+@@ -866,8 +886,8 @@
+ 		return -1;
+ 	}
+ 
+-	major = major(st.st_rdev);
+-	minor = minor(st.st_rdev);
++	major = __major(st.st_rdev);
++	minor = __minor(st.st_rdev);
+ 
+ 	if (ubi_get_info((libubi_t *)lib, &info))
+ 		return -1;
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
new file mode 100644
index 0000000..da0efc0
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.4.9.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "Tools for managing memory technology devices."
+SECTION = "base"
+DEPENDS = "zlib lzo e2fsprogs util-linux"
+HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
+
+
+PR = "r0"
+
+inherit klibc
+
+# ubicrc32 needs 'feof' (in klibc_2.0)
+# ubinize needs 'atof'
+# ubiformat needs 'scanf'equivalent for klibc
+
+SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf32f381c140bf72b21bf91cef1b \
+            file://Makefile.patch \
+            file://common.mk.patch \
+            file://libmtd.c.patch \
+            file://libubi.c.patch \
+            "
+
+S = "${WORKDIR}/git/"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -I${S}ubi-utils/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+
+do_install () {
+    install -d ${D}${sbindir}
+    install -m 755 ubi-utils/ubinfo ${D}${sbindir}/ubinfo
+    install -m 755 ubi-utils/ubiattach ${D}${sbindir}/ubiattach
+    install -m 755 ubi-utils/ubidetach ${D}${sbindir}/ubidetach
+    install -m 755 ubi-utils/mtdinfo ${D}${sbindir}/mtdinfo
+    install -m 755 ubi-utils/ubiupdatevol ${D}${sbindir}/ubiupdatevol
+    install -m 755 ubi-utils/ubimkvol ${D}${sbindir}/ubimkvol
+    install -m 755 ubi-utils/ubirename ${D}${sbindir}/ubirename
+    install -m 755 ubi-utils/ubirmvol ${D}${sbindir}/ubirmvol
+    install -m 755 ubi-utils/ubirsvol ${D}${sbindir}/ubirsvol
+}
+
+PACKAGES =+ "ubinfo-klibc ubiattach-klibc ubidetach-klibc mtdinfo-klibc ubiupdatevol-klibc \
+             ubimkvol-klibc ubirename-klibc ubirmvol-klibc ubirsvol-klibc"
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
-- 
1.7.3.4



