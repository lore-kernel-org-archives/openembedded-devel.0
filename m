Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1836C60167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 00:14:02 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id z12so15582928wgg.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 16:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ttE4aYNm+1mGXnyJsmp1h+M3QYBorGlPAUkrfYEq+3c=;
	b=WQikawEPxatebj3AIZGQNNdr5ipMX8Wg7Wkl9y7yct0FaBhneKFXF/+Da5DHHA3oT9
	1bEJRALPGx5Y7PPu1UxEFUqcqEWvk/ML36qlSZCt8xB66Vt6+5AcW0i1XpgiHj+itksS
	MMMT0YyN9IypkrkGgBOdMT2ODGpfV6jSNOLMc06esgdwJMXRS0Fc74xO79k1zZjuD+Vj
	CbLCUcFXGgaTXjFzanf5btZ7tFsT95FGEsjXN+7tC/2VquI8uVnb16MOI1n1DEtS8kcq
	F547r5AAFPSIFuG3XwUG7HXCZ3DpK+ENbptiywGsXEVIlmydx+hxbqpztUAqSO9eTOmi
	Jx2w==
X-Received: by 10.180.96.106 with SMTP id dr10mr53680368wib.70.1415837641493; 
	Wed, 12 Nov 2014 16:14:01 -0800 (PST)
Received: from mizar.208.67.220.220
	(host66-196-dynamic.45-79-r.retail.telecomitalia.it. [79.45.196.66])
	by mx.google.com with ESMTPSA id l4sm33353926wjx.14.2014.11.12.16.14.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Nov 2014 16:14:00 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Nov 2014 01:13:50 +0100
Message-Id: <1415837630-32645-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415837630-32645-1-git-send-email-andrea.adami@gmail.com>
References: <1415837630-32645-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH 2/2] ubi-utils-klibc_1.5.1: initial commit of v. 1.5.1
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
X-List-Received-Date: Thu, 13 Nov 2014 00:14:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NOTE: we track master upstream so we are some commits ahead v 1.5.1.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../0001-Makefile-only-build-ubi-utils.patch       | 87 ++++++++++++++++++++++
 .../0002-common.mk-for-klibc-CC-is-klcc.patch      | 27 +++++++
 .../0003-libubi.c-add-klibc-specific-fixes.patch   | 76 +++++++++++++++++++
 .../0004-common.h-klibc-fixes-1.patch              | 84 +++++++++++++++++++++
 .../0005-common.h-klibc-fixes-2.patch              | 61 +++++++++++++++
 ...rser-remove-unused-function-needing-float.patch | 85 +++++++++++++++++++++
 .../recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb  | 50 +++++++++++++
 7 files changed, 470 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0002-common.mk-for-klibc-CC-is-klcc.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-common.h-klibc-fixes-1.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0006-libiniparser-remove-unused-function-needing-float.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
new file mode 100644
index 0000000..9d5e4eb
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
@@ -0,0 +1,87 @@
+From c4e6bd9378645d577e9d9f85da85f1438afe7c50 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 29 Jun 2014 00:32:29 +0200
+Subject: [PATCH 1/6] Makefile: build ubi-utils only
+
+We build all the static ubi-utils but actually only ubiattach is needed in
+a minimalistic initramfs for the mount of ubi volumes.
+
+More fixes are needed in order to build the full mtd-utils.
+The first issue is:
+
+| mkfs.jffs2.c:64:20: fatal error: libgen.h: No such file or directory
+|  #include <libgen.h>
+
+Removing the include then the second error is:
+
+| mkfs.jffs2.c:1570:22: error: '_SC_PAGESIZE' undeclared
+| (first use in this function)
+|   page_size = sysconf(_SC_PAGESIZE);
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ Makefile | 24 ++----------------------
+ 1 file changed, 2 insertions(+), 22 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index eade234..2275865 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,28 +16,13 @@ endif
+ 
+ TESTS = tests
+ 
+-MTD_BINS = \
+-	ftl_format flash_erase nanddump doc_loadbios \
+-	ftl_check mkfs.jffs2 flash_lock flash_unlock \
+-	flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
+-	mtd_debug flashcp nandwrite nandtest \
+-	jffs2dump \
+-	nftldump nftl_format docfdisk \
+-	rfddump rfdformat \
+-	serve_image recv_image \
+-	sumtool jffs2reader
+ UBI_BINS = \
+ 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
+ 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
+ 
+-BINS = $(MTD_BINS)
+-BINS += mkfs.ubifs/mkfs.ubifs
+-BINS += $(addprefix ubi-utils/,$(UBI_BINS))
+-SCRIPTS = flash_eraseall
++BINS = $(addprefix ubi-utils/,$(UBI_BINS))
+ 
+ TARGETS = $(BINS)
+-TARGETS += lib/libmtd.a
+-TARGETS += ubi-utils/libubi.a
+ 
+ OBJDEPS = $(BUILDDIR)/include/version.h
+ 
+@@ -61,12 +46,9 @@ endif
+ 	rm -f $(BUILDDIR)/include/version.h
+ 	$(MAKE) -C $(TESTS) clean
+ 
+-install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
++install:: $(addprefix $(BUILDDIR)/,${BINS})
+ 	mkdir -p ${DESTDIR}/${SBINDIR}
+ 	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
+-	mkdir -p ${DESTDIR}/${MANDIR}/man1
+-	install -m 0644 mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
+-	-gzip -9f ${DESTDIR}/${MANDIR}/man1/*.1
+ 
+ tests::
+ 	$(MAKE) -C $(TESTS)
+@@ -91,8 +73,6 @@ LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
+ LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
+ LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
+ 
+-$(foreach v,$(MTD_BINS),$(eval $(call mkdep,,$(v))))
+-
+ #
+ # Common libmtd
+ #
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0002-common.mk-for-klibc-CC-is-klcc.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0002-common.mk-for-klibc-CC-is-klcc.patch
new file mode 100644
index 0000000..89c494e
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0002-common.mk-for-klibc-CC-is-klcc.patch
@@ -0,0 +1,27 @@
+From f3609c7c0450b4c31e1d4603fcf2cfb1ba46f994 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 29 Jun 2014 00:37:28 +0200
+Subject: [PATCH 2/6] common.mk: for klibc $(CC) is klcc
+
+Do not hardcode: assign the value to the variable if it is not already defined.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ common.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common.mk b/common.mk
+index ba87377..59c56df 100644
+--- a/common.mk
++++ b/common.mk
+@@ -1,4 +1,4 @@
+-CC := $(CROSS)gcc
++CC ?= $(CROSS)gcc
+ AR := $(CROSS)ar
+ RANLIB := $(CROSS)ranlib
+ 
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes.patch
new file mode 100644
index 0000000..440e864
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes.patch
@@ -0,0 +1,76 @@
+From 72a39bb3290a79e76b0dbf59eef83ea2d9b577a1 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 29 Jun 2014 00:40:15 +0200
+Subject: [PATCH 3/6] libubi.c: add klibc specific fixes for ioctl
+
+First issue is that ioctl() in klibc doesn't expect a constant as arg3.
+Second issue is that arg3 in klibc ioctl() implementation is not optional.
+
+Fixes:
+
+| ubi-utils/libubi.c: In function 'do_attach':
+| ubi-utils/libubi.c:698:8: warning: passing argument 3 of 'ioctl' discards
+| 'const' qualifier from pointer target type
+|   ret = ioctl(fd, UBI_IOCATT, r);
+|         ^
+| In file included from ubi-utils/libubi.c:32:0:
+| .../lib/klibc/include/sys/ioctl.h:15:14: note: expected 'void *' but argument
+| is of type 'const struct ubi_attach_req *'
+|  __extern int ioctl(int, int, void *);
+|               ^
+
+| ubi-utils/libubi.c: In function 'ubi_vol_block_create':
+| ubi-utils/libubi.c:1118:9: error: too few arguments to function 'ioctl'
+|   return ioctl(fd, UBI_IOCVOLCRBLK);
+|          ^
+| In file included from ubi-utils/libubi.c:32:0:
+| .../lib/klibc/include/sys/ioctl.h:15:14: note: declared here
+|  __extern int ioctl(int, int, void *);
+|               ^
+| ubi-utils/libubi.c: In function 'ubi_vol_block_remove':
+| ubi-utils/libubi.c:1123:9: error: too few arguments to function 'ioctl'
+|   return ioctl(fd, UBI_IOCVOLRMBLK);
+|          ^
+| In file included from ubi-utils/libubi.c:32:0:
+| .../usr/lib/klibc/include/sys/ioctl.h:15:14: note: declared here
+|  __extern int ioctl(int, int, void *);
+|               ^
+
+Upstream-Status: Inappropriate [klibc specific]
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ ubi-utils/libubi.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
+index 1e08b7d..491e525 100644
+--- a/ubi-utils/libubi.c
++++ b/ubi-utils/libubi.c
+@@ -687,7 +687,7 @@ void libubi_close(libubi_t desc)
+  * success and %-1 in case of failure. @r->ubi_num contains newly created UBI
+  * device number.
+  */
+-static int do_attach(const char *node, const struct ubi_attach_req *r)
++static int do_attach(const char *node, struct ubi_attach_req *r)
+ {
+ 	int fd, ret;
+ 
+@@ -1115,12 +1115,12 @@ int ubi_rsvol(libubi_t desc, const char *node, int vol_id, long long bytes)
+ 
+ int ubi_vol_block_create(int fd)
+ {
+-	return ioctl(fd, UBI_IOCVOLCRBLK);
++	return ioctl(fd, UBI_IOCVOLCRBLK, NULL);
+ }
+ 
+ int ubi_vol_block_remove(int fd)
+ {
+-	return ioctl(fd, UBI_IOCVOLRMBLK);
++	return ioctl(fd, UBI_IOCVOLRMBLK, NULL);
+ }
+ 
+ int ubi_update_start(libubi_t desc, int fd, long long bytes)
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-common.h-klibc-fixes-1.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-common.h-klibc-fixes-1.patch
new file mode 100644
index 0000000..fee1cbc
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-common.h-klibc-fixes-1.patch
@@ -0,0 +1,84 @@
+From e56767b9caa02e7c41803499c77dc939d5a7f64a Mon Sep 17 00:00:00 2001
+From: Thorsten Glaser <tg@mirbsd.org>
+Date: Fri, 20 Jun 2014 10:56:27 +0000
+Subject: [PATCH 4/6] Restore compatibility to dietlibc, klibc, musl libc after commit 4f1b108
+
+Each C library has their own way to define off_t, and the <features.h>
+header is nonstandard and specific to the GNU libc and those that clone
+it (uClibc). Fefe’s dietlibc uses different flags, and klibc always uses
+a 64-bit off_t (like the BSDs); musl libc cannot be recognised using cpp
+instructions, so we assume 64 bit there (and on unknown C libraries) and
+leave it to the user to submit a follow-up fix if we guess wrong. I also
+added a static assertion to verify the 64 bit guess is correct.
+
+It would be really better using a configure script for this instead.
+
+Fixes:
+|   CC      lib/libmtd.o
+| In file included from ubi-utils/ubiutils-common.c:35:0:
+| ./include/common.h:29:22: fatal error: features.h: No such file or directory
+|  #include <features.h>
+|                       ^
+| compilation terminated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Thorsten Glaser <tg@mirbsd.org>
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ include/common.h | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/include/common.h b/include/common.h
+index 6895e5c..77f3f7d 100644
+--- a/include/common.h
++++ b/include/common.h
+@@ -26,7 +26,9 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <errno.h>
++#if defined(__GLIBC__) || defined(__UCLIBC__)
+ #include <features.h>
++#endif
+ #include <inttypes.h>
+ #include "version.h"
+ 
+@@ -52,6 +54,21 @@ extern "C" {
+ #endif
+ 
+ /* define a print format specifier for off_t */
++#if defined(__KLIBC__)
++/* always 64 bit on klibc */
++#define PRIxoff_t PRIx64
++#define PRIdoff_t PRId64
++#elif defined(__dietlibc__)
++/* depends on compiler flags on dietlibc */
++#if defined(_FILE_OFFSET_BITS) && (_FILE_OFFSET_BITS == 64)
++#define PRIxoff_t PRIx64
++#define PRIdoff_t PRId64
++#else
++#define PRIxoff_t "l"PRIx32
++#define PRIdoff_t "l"PRId32
++#endif
++#elif defined(__GLIBC__) || defined(__UCLIBC__)
++/* depends on compiler flags on glibc and uClibc */
+ #ifdef __USE_FILE_OFFSET64
+ #define PRIxoff_t PRIx64
+ #define PRIdoff_t PRId64
+@@ -59,6 +76,13 @@ extern "C" {
+ #define PRIxoff_t "l"PRIx32
+ #define PRIdoff_t "l"PRId32
+ #endif
++#else
++/* unknown libc or musl */
++#define PRIxoff_t PRIx64
++#define PRIdoff_t PRId64
++/* verify our guess of 64 bit is correct */
++static char __PRIxoff_t_static_assert[sizeof(off_t) == 8 ? 1 : -1];
++#endif
+ 
+ /* Verbose messages */
+ #define bareverbose(verbose, fmt, ...) do {                        \
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
new file mode 100644
index 0000000..2e43d5d
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
@@ -0,0 +1,61 @@
+From 8318852ef4f768bed31072aa7b57e11adc1f639c Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 29 Jun 2014 00:44:03 +0200
+Subject: [PATCH 5/6] common.h: more workarounds for klibc compatibility
+
+Patch is addressing two issues:
+* First,  Klibc doesn't have rpmatch().
+* Second, Klibc lacks getline()
+
+Fixes:
+|   LD      ubi-utils/ubiformat
+| .../git/ubi-utils/ubiformat.o: In function `prompt':
+| .../git/./include/common.h:157: undefined reference to `getline'
+| .../git/./include/common.h:164: undefined reference to `rpmatch'
+| .../git/./include/common.h:157: undefined reference to `getline'
+| .../git/./include/common.h:164: undefined reference to `rpmatch'
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ include/common.h | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/include/common.h b/include/common.h
+index 77f3f7d..2cbee0f 100644
+--- a/include/common.h
++++ b/include/common.h
+@@ -126,7 +126,7 @@ static char __PRIxoff_t_static_assert[sizeof(off_t) == 8 ? 1 : -1];
+ 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
+ } while(0)
+ 
+-#if defined(__UCLIBC__)
++#if defined(__UCLIBC__) || defined(__KLIBC__)
+ /* uClibc versions before 0.9.34 don't have rpmatch() */
+ #if __UCLIBC_MAJOR__ == 0 && \
+ 		(__UCLIBC_MINOR__ < 9 || \
+@@ -146,15 +146,17 @@ static inline int __rpmatch(const char *resp)
+  */
+ static inline bool prompt(const char *msg, bool def)
+ {
+-	char *line = NULL;
+-	size_t len;
++	char *line;
+ 	bool ret = def;
+ 
++	const int sizeof_line = 2;
++	line = malloc(sizeof_line);
++
+ 	do {
+ 		normsg_cont("%s (%c/%c) ", msg, def ? 'Y' : 'y', def ? 'n' : 'N');
+ 		fflush(stdout);
+ 
+-		while (getline(&line, &len, stdin) == -1) {
++		while (fgets(line, sizeof_line, stdin) == NULL) {
+ 			printf("failed to read prompt; assuming '%s'\n",
+ 				def ? "yes" : "no");
+ 			break;
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0006-libiniparser-remove-unused-function-needing-float.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0006-libiniparser-remove-unused-function-needing-float.patch
new file mode 100644
index 0000000..043a89d
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0006-libiniparser-remove-unused-function-needing-float.patch
@@ -0,0 +1,85 @@
+From 72a04a9b9ed33c889d2e2b86f306c5be9f6cde35 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 29 Jun 2014 00:44:57 +0200
+Subject: [PATCH 6/6] libiniparser: remove unused function needing float
+
+Fixes:
+|   LD      ubi-utils/ubiformat
+| .../git/ubi-utils/libiniparser.a(libiniparser.o): In function
+| `  LD      ubi-utils/ubirename
+| iniparser_getdouble':
+| .../git/ubi-utils/libiniparser.c:336: undefined reference to `atof'
+
+Grep doesn't reveal any occurrence of iniparser_getdouble(), using atof() so
+remove it: floating-point is not supported in klibc
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ ubi-utils/include/libiniparser.h | 15 ---------------
+ ubi-utils/libiniparser.c         | 22 ----------------------
+ 2 files changed, 37 deletions(-)
+
+diff --git a/ubi-utils/include/libiniparser.h b/ubi-utils/include/libiniparser.h
+index be3c667..abd77aa 100644
+--- a/ubi-utils/include/libiniparser.h
++++ b/ubi-utils/include/libiniparser.h
+@@ -158,21 +158,6 @@ int iniparser_getint(dictionary * d, const char * key, int notfound);
+ 
+ /*-------------------------------------------------------------------------*/
+ /**
+-  @brief    Get the string associated to a key, convert to a double
+-  @param    d Dictionary to search
+-  @param    key Key string to look for
+-  @param    notfound Value to return in case of error
+-  @return   double
+-
+-  This function queries a dictionary for a key. A key as read from an
+-  ini file is given as "section:key". If the key cannot be found,
+-  the notfound value is returned.
+- */
+-/*--------------------------------------------------------------------------*/
+-double iniparser_getdouble(dictionary * d, char * key, double notfound);
+-
+-/*-------------------------------------------------------------------------*/
+-/**
+   @brief    Get the string associated to a key, convert to a boolean
+   @param    d Dictionary to search
+   @param    key Key string to look for
+diff --git a/ubi-utils/libiniparser.c b/ubi-utils/libiniparser.c
+index 898f57f..ba70c08 100644
+--- a/ubi-utils/libiniparser.c
++++ b/ubi-utils/libiniparser.c
+@@ -316,28 +316,6 @@ int iniparser_getint(dictionary * d, const char * key, int notfound)
+ 
+ /*-------------------------------------------------------------------------*/
+ /**
+-  @brief    Get the string associated to a key, convert to a double
+-  @param    d Dictionary to search
+-  @param    key Key string to look for
+-  @param    notfound Value to return in case of error
+-  @return   double
+-
+-  This function queries a dictionary for a key. A key as read from an
+-  ini file is given as "section:key". If the key cannot be found,
+-  the notfound value is returned.
+- */
+-/*--------------------------------------------------------------------------*/
+-double iniparser_getdouble(dictionary * d, char * key, double notfound)
+-{
+-    char    *   str ;
+-
+-    str = iniparser_getstring(d, key, INI_INVALID_KEY);
+-    if (str==INI_INVALID_KEY) return notfound ;
+-    return atof(str);
+-}
+-
+-/*-------------------------------------------------------------------------*/
+-/**
+   @brief    Get the string associated to a key, convert to a boolean
+   @param    d Dictionary to search
+   @param    key Key string to look for
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
new file mode 100644
index 0000000..8ca1ca7
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
@@ -0,0 +1,50 @@
+SUMMARY = "UBI utils statically compiled against klibc"
+DESCRIPTION = "Small sized tools from mtd-utils for use with initramfs."
+SECTION = "base"
+DEPENDS = "zlib lzo e2fsprogs util-linux"
+HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
+
+inherit klibc
+
+SRC_URI = "git://git.infradead.org/mtd-utils.git;tag=b7455d847ab4f9eeeb6a729efc306bfda7bddc99 \
+             file://0001-Makefile-only-build-ubi-utils.patch \
+             file://0002-common.mk-for-klibc-CC-is-klcc.patch \
+             file://0003-libubi.c-add-klibc-specific-fixes.patch \
+             file://0004-common.h-klibc-fixes-1.patch \
+             file://0005-common.h-klibc-fixes-2.patch \
+             file://0006-libiniparser-remove-unused-function-needing-float.patch \
+             "
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
+PACKAGES =+ "mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
+             ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
+             ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc"
+
+FILES_mtdinfo-klibc = "${sbindir}/mtdinfo"
+FILES_ubiattach-klibc = "${sbindir}/ubiattach"
+FILES_ubiblock-klibc = "${sbindir}/ubiblock"
+FILES_ubicrc32-klibc = "${sbindir}/ubicrc32"
+FILES_ubidetach-klibc = "${sbindir}/ubidetach"
+FILES_ubiformat-klibc = "${sbindir}/ubiformat"
+FILES_ubimkvol-klibc = "${sbindir}/ubimkvol"
+FILES_ubinfo-klibc = "${sbindir}/ubinfo"
+FILES_ubinize-klibc = "${sbindir}/ubinize"
+FILES_ubirename-klibc = "${sbindir}/ubirename"
+FILES_ubirmvol-klibc = "${sbindir}/ubirmvol"
+FILES_ubirsvol-klibc = "${sbindir}/ubirsvol"
+FILES_ubiupdatevol-klibc = "${sbindir}/ubiupdatevol"
-- 
1.9.1


