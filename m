Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFD674765
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 20:16:00 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w18-v6so24966733wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 13:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zcSVrSaTAm3X2mFR1XdvzMy2VsBHwwdnZlr3kr+US94=;
	b=Pph87rCugxyHm8VU3fPgt103EvkKgCWdBAUS5Q6UC5Vjl1zxURP0u1aNvtXITRp5gR
	L1onve2sJvS5BAk23C+ISGtetR0h1hi2QDD6AOLySJ4Ew4zxFsFA94743JHGbVjFQ25l
	8oJZIQJ3aR/ZxuMf9l5wIAB6fnBaEh+JzrPPjhxdrJaiXK1UAYOUSL7OdJK9lxbALGvy
	6rMO8ALmpxuOFovtmeoSK1YO35hShsNVKwtp7xrljgc2mGd76rGZ/ur5ABPx6KGqC4ap
	bwsKHGnJij/q9U6qi7/PwdUFHBxuRQovR9buRqxoMlKF79imDHjQq+F6q+ugJdotMwwv
	uvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zcSVrSaTAm3X2mFR1XdvzMy2VsBHwwdnZlr3kr+US94=;
	b=E5cC7DWQxLvnts1PQ0EYBV2jvSGHdkE+/EZ2dOiAYpQAJi203ba6BKYqTUw70H1kf6
	WddpxN5aI5+tTQZVmbZNQXcorUgc9T5eaNfBet8FXhZQ+PBeBTlWt8URhfT3gWiTmyVs
	1qD7w2jlj4ckAY+4ewmNvWhtEuI7wsiMZsS+7iL4whglYrCZEdQVHP2YUTPn4Ml4mHdU
	wcK3CzdLnVsyeXE9ho0teZyRgYEsygRN/EVWXbfhcvr8EeZTY6eZ/sguUaU4XiVrtNBW
	GGXKVo6oeNlY81Md6uaWAqp5TPSYUXL1Jz4IkPSwGj5VqCZcbFkiF6YzS7AlJOQtq6DT
	PpXQ==
X-Gm-Message-State: ALKqPweKHeZMMlbBlRTSIjMlRXLJLXguUVYhOeT8uxTfceWW1ruvN1o0
	B2Oe23lTpol6Vg1dOGa0VlHniQ==
X-Google-Smtp-Source: AB8JxZrwBMaE63kTv2FjPg7eD15dAbNRt9swIj0yqHrPqkErKFyWGCzjTRKx6PEMS1zN3tALYc+8Bw==
X-Received: by 2002:adf:ea84:: with SMTP id
	s4-v6mr3426605wrm.223.1527106559734; 
	Wed, 23 May 2018 13:15:59 -0700 (PDT)
Received: from localhost.localdomain
	(host10-248-dynamic.0-87-r.retail.telecomitalia.it. [87.0.248.10])
	by smtp.gmail.com with ESMTPSA id
	z192-v6sm2780278wmc.10.2018.05.23.13.15.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 May 2018 13:15:58 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2018 22:15:46 +0200
Message-Id: <1527106546-12382-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH v2] ubi-utils-klibc: update from v. 1.5.2 to 2.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2018 20:16:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update to new version and drop accepted patches.
Use autotools and packageconfig (for xattrs).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../0001-Makefile-build-ubi-utils-only.patch       |  87 ------
 .../0002-common.mk-for-klibc-CC-is-klcc.patch      |  27 --
 ...bubi.c-add-klibc-specific-fixes-for-ioctl.patch |  76 -----
 ...patibility-to-dietlibc-klibc-musl-libc-af.patch |  88 ------
 ...-more-workarounds-for-klibc-compatibility.patch |  52 ----
 ...rser-remove-unused-function-needing-float.patch |  85 ------
 ...ls-common.c-convert-to-integer-arithmetic.patch |  64 ----
 ...ubiformat.c-convert-to-integer-arithmetic.patch |  44 ---
 ...arnings-about-implicit-non-const-casting-.patch |  48 ---
 ...h-fix-klibc-build-when-using-glibc-toolch.patch |  40 +++
 ...doing-preprocessor-magic-just-output-off_.patch | 326 +++++++++++++++++++++
 .../0003-Makefile.am-only-build-ubi-utils.patch    |  34 +++
 ...s-common.h-no-features.h-for-klibc-builds.patch |  38 +++
 .../0005-common.h-replace-getline-with-fgets.patch |  56 ++++
 ...ils-klibc_1.5.2.bb => ubi-utils-klibc_2.0.2.bb} |  27 +-
 15 files changed, 508 insertions(+), 584 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0001-Makefile-build-ubi-utils-only.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0002-common.mk-for-klibc-CC-is-klcc.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-common.h-more-workarounds-for-klibc-compatibility.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-libiniparser-remove-unused-function-needing-float.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi-utils-ubiformat.c-convert-to-integer-arithmetic.patch
 delete mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eliminate-warnings-about-implicit-non-const-casting-.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005-common.h-replace-getline-with-fgets.patch
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc_1.5.2.bb => ubi-utils-klibc_2.0.2.bb} (64%)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0001-Makefile-build-ubi-utils-only.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0001-Makefile-build-ubi-utils-only.patch
deleted file mode 100644
index 6ac2cca..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0001-Makefile-build-ubi-utils-only.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 1c989e4c36d0bf76ab444f984bc73b98eeacd03f Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 29 Jun 2014 00:32:29 +0200
-Subject: [PATCH 1/9] Makefile: build ubi-utils only
-
-We build all the static ubi-utils but actually only ubiattach is needed in
-a minimalistic initramfs for the mount of ubi volumes.
-
-More fixes are needed in order to build the full mtd-utils.
-The first issue is:
-
-| mkfs.jffs2.c:64:20: fatal error: libgen.h: No such file or directory
-|  #include <libgen.h>
-
-Removing the include then the second error is:
-
-| mkfs.jffs2.c:1570:22: error: '_SC_PAGESIZE' undeclared
-| (first use in this function)
-|   page_size = sysconf(_SC_PAGESIZE);
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- Makefile | 26 ++------------------------
- 1 file changed, 2 insertions(+), 24 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 3ce8587..8b79f71 100644
---- a/Makefile
-+++ b/Makefile
-@@ -16,28 +16,11 @@ endif
- 
- TESTS = tests
- 
--MTD_BINS = \
--	ftl_format flash_erase nanddump doc_loadbios \
--	ftl_check mkfs.jffs2 flash_lock flash_unlock \
--	flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
--	mtd_debug flashcp nandwrite nandtest mtdpart \
--	jffs2dump \
--	nftldump nftl_format docfdisk \
--	rfddump rfdformat \
--	serve_image recv_image \
--	sumtool jffs2reader
- UBI_BINS = \
- 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
- 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
- 
--BINS = $(MTD_BINS)
--BINS += mkfs.ubifs/mkfs.ubifs
--BINS += $(addprefix ubi-utils/,$(UBI_BINS))
--SCRIPTS = flash_eraseall
--
--TARGETS = $(BINS)
--TARGETS += lib/libmtd.a
--TARGETS += ubi-utils/libubi.a
-+BINS = $(addprefix ubi-utils/,$(UBI_BINS))
- 
- OBJDEPS = $(BUILDDIR)/include/version.h
- 
-@@ -61,12 +44,9 @@ endif
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
-@@ -91,8 +71,6 @@ LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
- LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
- LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
- 
--$(foreach v,$(MTD_BINS),$(eval $(call mkdep,,$(v))))
--
- #
- # Common libmtd
- #
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0002-common.mk-for-klibc-CC-is-klcc.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0002-common.mk-for-klibc-CC-is-klcc.patch
deleted file mode 100644
index c23d11f..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0002-common.mk-for-klibc-CC-is-klcc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 89c76bbe82a2029a25b0654eb0a1d0b22d6e6877 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 29 Jun 2014 00:37:28 +0200
-Subject: [PATCH 2/9] common.mk: for klibc $(CC) is klcc
-
-Do not hardcode: assign the value to the variable if it is not already defined.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- common.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/common.mk b/common.mk
-index ba87377..126d11a 100644
---- a/common.mk
-+++ b/common.mk
-@@ -1,4 +1,4 @@
--CC := $(CROSS)gcc
-+CC ?= $(CROSS)gcc
- AR := $(CROSS)ar
- RANLIB := $(CROSS)ranlib
- 
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch
deleted file mode 100644
index 9ad4a5b..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From fecbb7056d621a30f7106e67f5fe209763571b70 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 29 Jun 2014 00:40:15 +0200
-Subject: [PATCH 3/9] libubi.c: add klibc specific fixes for ioctl
-
-First issue is that ioctl() in klibc doesn't expect a constant as arg3.
-Second issue is that arg3 in klibc ioctl() implementation is not optional.
-
-Fixes:
-
-| ubi-utils/libubi.c: In function 'do_attach':
-| ubi-utils/libubi.c:698:8: warning: passing argument 3 of 'ioctl' discards
-| 'const' qualifier from pointer target type
-|   ret = ioctl(fd, UBI_IOCATT, r);
-|         ^
-| In file included from ubi-utils/libubi.c:32:0:
-| .../lib/klibc/include/sys/ioctl.h:15:14: note: expected 'void *' but argument
-| is of type 'const struct ubi_attach_req *'
-|  __extern int ioctl(int, int, void *);
-|               ^
-
-| ubi-utils/libubi.c: In function 'ubi_vol_block_create':
-| ubi-utils/libubi.c:1118:9: error: too few arguments to function 'ioctl'
-|   return ioctl(fd, UBI_IOCVOLCRBLK);
-|          ^
-| In file included from ubi-utils/libubi.c:32:0:
-| .../lib/klibc/include/sys/ioctl.h:15:14: note: declared here
-|  __extern int ioctl(int, int, void *);
-|               ^
-| ubi-utils/libubi.c: In function 'ubi_vol_block_remove':
-| ubi-utils/libubi.c:1123:9: error: too few arguments to function 'ioctl'
-|   return ioctl(fd, UBI_IOCVOLRMBLK);
-|          ^
-| In file included from ubi-utils/libubi.c:32:0:
-| .../usr/lib/klibc/include/sys/ioctl.h:15:14: note: declared here
-|  __extern int ioctl(int, int, void *);
-|               ^
-
-Upstream-Status: Accepted
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- ubi-utils/libubi.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
-index 97c0434..2b49833 100644
---- a/ubi-utils/libubi.c
-+++ b/ubi-utils/libubi.c
-@@ -687,7 +687,7 @@ void libubi_close(libubi_t desc)
-  * success and %-1 in case of failure. @r->ubi_num contains newly created UBI
-  * device number.
-  */
--static int do_attach(const char *node, const struct ubi_attach_req *r)
-+static int do_attach(const char *node, struct ubi_attach_req *r)
- {
- 	int fd, ret;
- 
-@@ -1115,12 +1115,12 @@ int ubi_rsvol(libubi_t desc, const char *node, int vol_id, long long bytes)
- 
- int ubi_vol_block_create(int fd)
- {
--	return ioctl(fd, UBI_IOCVOLCRBLK);
-+	return ioctl(fd, UBI_IOCVOLCRBLK, NULL);
- }
- 
- int ubi_vol_block_remove(int fd)
- {
--	return ioctl(fd, UBI_IOCVOLRMBLK);
-+	return ioctl(fd, UBI_IOCVOLRMBLK, NULL);
- }
- 
- int ubi_update_start(libubi_t desc, int fd, long long bytes)
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch
deleted file mode 100644
index 2f31fb4..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From b668cb75cb7e72ff92055209130d4cd4b3cacbdb Mon Sep 17 00:00:00 2001
-From: Thorsten Glaser <tg@mirbsd.org>
-Date: Fri, 20 Jun 2014 10:56:27 +0000
-Subject: [PATCH 4/9] Restore compatibility to dietlibc, klibc, musl libc after
- commit 4f1b108
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Each C library has their own way to define off_t, and the <features.h>
-header is nonstandard and specific to the GNU libc and those that clone
-it (uClibc). Fefe’s dietlibc uses different flags, and klibc always uses
-a 64-bit off_t (like the BSDs); musl libc cannot be recognised using cpp
-instructions, so we assume 64 bit there (and on unknown C libraries) and
-leave it to the user to submit a follow-up fix if we guess wrong. I also
-added a static assertion to verify the 64 bit guess is correct.
-
-It would be really better using a configure script for this instead.
-
-Fixes:
-|   CC      lib/libmtd.o
-| In file included from ubi-utils/ubiutils-common.c:35:0:
-| ./include/common.h:29:22: fatal error: features.h: No such file or directory
-|  #include <features.h>
-|                       ^
-| compilation terminated.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Thorsten Glaser <tg@mirbsd.org>
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- include/common.h | 24 ++++++++++++++++++++++++
- 1 file changed, 24 insertions(+)
-
-diff --git a/include/common.h b/include/common.h
-index fb0ca83..5a20964 100644
---- a/include/common.h
-+++ b/include/common.h
-@@ -26,7 +26,9 @@
- #include <string.h>
- #include <fcntl.h>
- #include <errno.h>
-+#if defined(__GLIBC__) || defined(__UCLIBC__)
- #include <features.h>
-+#endif
- #include <inttypes.h>
- #include "version.h"
- 
-@@ -67,6 +69,21 @@ extern "C" {
- #endif
- 
- /* define a print format specifier for off_t */
-+#if defined(__KLIBC__)
-+/* always 64 bit on klibc */
-+#define PRIxoff_t PRIx64
-+#define PRIdoff_t PRId64
-+#elif defined(__dietlibc__)
-+/* depends on compiler flags on dietlibc */
-+#if defined(_FILE_OFFSET_BITS) && (_FILE_OFFSET_BITS == 64)
-+#define PRIxoff_t PRIx64
-+#define PRIdoff_t PRId64
-+#else
-+#define PRIxoff_t "l"PRIx32
-+#define PRIdoff_t "l"PRId32
-+#endif
-+#elif defined(__GLIBC__) || defined(__UCLIBC__)
-+/* depends on compiler flags on glibc and uClibc */
- #ifdef __USE_FILE_OFFSET64
- #define PRIxoff_t PRIx64
- #define PRIdoff_t PRId64
-@@ -74,6 +91,13 @@ extern "C" {
- #define PRIxoff_t "l"PRIx32
- #define PRIdoff_t "l"PRId32
- #endif
-+#else
-+/* unknown libc or musl */
-+#define PRIxoff_t PRIx64
-+#define PRIdoff_t PRId64
-+/* verify our guess of 64 bit is correct */
-+static char __PRIxoff_t_static_assert[sizeof(off_t) == 8 ? 1 : -1];
-+#endif
- 
- /* Verbose messages */
- #define bareverbose(verbose, fmt, ...) do {                        \
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-common.h-more-workarounds-for-klibc-compatibility.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-common.h-more-workarounds-for-klibc-compatibility.patch
deleted file mode 100644
index 8309a72..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0005-common.h-more-workarounds-for-klibc-compatibility.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 5d4a66b502003ef385dab31a17012246407e7364 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 29 Jun 2014 00:44:03 +0200
-Subject: [PATCH 5/9] common.h: more workarounds for klibc compatibility
-
-Patch is addressing two issues:
-* First,  Klibc doesn't have rpmatch().
-* Second, Klibc lacks getline()
-
-Fixes:
-|   LD      ubi-utils/ubiformat
-| .../git/ubi-utils/ubiformat.o: In function `prompt':
-| .../git/./include/common.h:157: undefined reference to `getline'
-| .../git/./include/common.h:164: undefined reference to `rpmatch'
-| .../git/./include/common.h:157: undefined reference to `getline'
-| .../git/./include/common.h:164: undefined reference to `rpmatch'
-
-Upstream-Status: Submitted
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- include/common.h | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/include/common.h b/include/common.h
-index 5a20964..2f51e1c 100644
---- a/include/common.h
-+++ b/include/common.h
-@@ -161,15 +161,17 @@ static inline int __rpmatch(const char *resp)
-  */
- static inline bool prompt(const char *msg, bool def)
- {
--	char *line = NULL;
--	size_t len;
-+	char *line;
- 	bool ret = def;
- 
-+	const int sizeof_line = 2;
-+	line = malloc(sizeof_line);
-+
- 	do {
- 		normsg_cont("%s (%c/%c) ", msg, def ? 'Y' : 'y', def ? 'n' : 'N');
- 		fflush(stdout);
- 
--		while (getline(&line, &len, stdin) == -1) {
-+		while (fgets(line, sizeof_line, stdin) == NULL) {
- 			printf("failed to read prompt; assuming '%s'\n",
- 				def ? "yes" : "no");
- 			break;
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-libiniparser-remove-unused-function-needing-float.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-libiniparser-remove-unused-function-needing-float.patch
deleted file mode 100644
index d046f95..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0006-libiniparser-remove-unused-function-needing-float.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 2af30e9b2988111e45ed6ea6af55e49ec7cb1cb1 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 29 Jun 2014 00:44:57 +0200
-Subject: [PATCH 6/9] libiniparser: remove unused function needing float
-
-Fixes:
-|   LD      ubi-utils/ubiformat
-| .../git/ubi-utils/libiniparser.a(libiniparser.o): In function
-| `  LD      ubi-utils/ubirename
-| iniparser_getdouble':
-| .../git/ubi-utils/libiniparser.c:336: undefined reference to `atof'
-
-Grep doesn't reveal any occurrence of iniparser_getdouble(), using atof() so
-remove it: floating-point is not supported in klibc
-
-Upstream-Status: Accepted
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- ubi-utils/include/libiniparser.h | 15 ---------------
- ubi-utils/libiniparser.c         | 22 ----------------------
- 2 files changed, 37 deletions(-)
-
-diff --git a/ubi-utils/include/libiniparser.h b/ubi-utils/include/libiniparser.h
-index be3c667..abd77aa 100644
---- a/ubi-utils/include/libiniparser.h
-+++ b/ubi-utils/include/libiniparser.h
-@@ -158,21 +158,6 @@ int iniparser_getint(dictionary * d, const char * key, int notfound);
- 
- /*-------------------------------------------------------------------------*/
- /**
--  @brief    Get the string associated to a key, convert to a double
--  @param    d Dictionary to search
--  @param    key Key string to look for
--  @param    notfound Value to return in case of error
--  @return   double
--
--  This function queries a dictionary for a key. A key as read from an
--  ini file is given as "section:key". If the key cannot be found,
--  the notfound value is returned.
-- */
--/*--------------------------------------------------------------------------*/
--double iniparser_getdouble(dictionary * d, char * key, double notfound);
--
--/*-------------------------------------------------------------------------*/
--/**
-   @brief    Get the string associated to a key, convert to a boolean
-   @param    d Dictionary to search
-   @param    key Key string to look for
-diff --git a/ubi-utils/libiniparser.c b/ubi-utils/libiniparser.c
-index 898f57f..ba70c08 100644
---- a/ubi-utils/libiniparser.c
-+++ b/ubi-utils/libiniparser.c
-@@ -316,28 +316,6 @@ int iniparser_getint(dictionary * d, const char * key, int notfound)
- 
- /*-------------------------------------------------------------------------*/
- /**
--  @brief    Get the string associated to a key, convert to a double
--  @param    d Dictionary to search
--  @param    key Key string to look for
--  @param    notfound Value to return in case of error
--  @return   double
--
--  This function queries a dictionary for a key. A key as read from an
--  ini file is given as "section:key". If the key cannot be found,
--  the notfound value is returned.
-- */
--/*--------------------------------------------------------------------------*/
--double iniparser_getdouble(dictionary * d, char * key, double notfound)
--{
--    char    *   str ;
--
--    str = iniparser_getstring(d, key, INI_INVALID_KEY);
--    if (str==INI_INVALID_KEY) return notfound ;
--    return atof(str);
--}
--
--/*-------------------------------------------------------------------------*/
--/**
-   @brief    Get the string associated to a key, convert to a boolean
-   @param    d Dictionary to search
-   @param    key Key string to look for
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch
deleted file mode 100644
index 36b012f..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 41e7c76b0853bf5241b38b8167dfd57c27fef1eb Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 28 Jan 2018 21:47:59 +0100
-Subject: [PATCH 7/9] mtd-utils: common.c: convert to integer arithmetic
-
-We use floating point just to print out KiB, MiB, GiB.
-Avoid that to be klibc friendly.
-
-Fixes compilation for aarch64 against klibc:
-
-error: '-mgeneral-regs-only' is incompatible with floating-point argument
-|    printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
-etc.
-
-Note:
-* In the KiB case, we could apparently multiply by 100 before dividing
-  without risking overflow. This code simply avoids multiplications.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- ubi-utils/ubiutils-common.c | 18 ++++++++++++------
- 1 file changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/ubi-utils/ubiutils-common.c b/ubi-utils/ubiutils-common.c
-index 6609a6b..0ded2a4 100644
---- a/ubi-utils/ubiutils-common.c
-+++ b/ubi-utils/ubiutils-common.c
-@@ -107,6 +107,9 @@ long long ubiutils_get_bytes(const char *str)
- void ubiutils_print_bytes(long long bytes, int bracket)
- {
- 	const char *p;
-+	int GiB = 1024 * 1024 * 1024;
-+	int MiB = 1024 * 1024;
-+	int KiB = 1024;
- 
- 	if (bracket)
- 		p = " (";
-@@ -115,12 +118,15 @@ void ubiutils_print_bytes(long long bytes, int bracket)
- 
- 	printf("%lld bytes", bytes);
- 
--	if (bytes > 1024 * 1024 * 1024)
--		printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
--	else if (bytes > 1024 * 1024)
--		printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
--	else if (bytes > 1024 && bytes != 0)
--		printf("%s%.1f KiB", p, (double)bytes / 1024);
-+	if (bytes > GiB)
-+		printf("%s%lld.%lld GiB", p,
-+		       bytes / GiB, bytes % GiB / (GiB / 10));
-+	else if (bytes > MiB)
-+		printf("%s%lld.%lld MiB", p,
-+		       bytes / MiB, bytes % MiB / (MiB / 10));
-+	else if (bytes > KiB && bytes != 0)
-+		printf("%s%lld.%lld KiB", p,
-+		       bytes / KiB, bytes % KiB / (KiB / 10));
- 	else
- 		return;
- 
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi-utils-ubiformat.c-convert-to-integer-arithmetic.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi-utils-ubiformat.c-convert-to-integer-arithmetic.patch
deleted file mode 100644
index 5bd0574..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0008-ubi-utils-ubiformat.c-convert-to-integer-arithmetic.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e6f1a85c0a3df24fe3ca9a520dc697105e75a80c Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 27 Jan 2018 09:39:26 +0100
-Subject: [PATCH 8/9] ubi-utils: ubiformat.c: convert to integer arithmetic
-
-Do not cast percent to double, it is just used as upper limit.
-Avoid floating point to fix compilation for aarch64 against klibc:
-
-error: '-mgeneral-regs-only' is incompatible with floating-point code
-|    int percent = ((double)si->ok_cnt)/si->good_cnt * 100;
-|        ^~~~~~~
-
-Notes:
-* The checks in the code above this line ensure that si->good_cnt is not 0.
-
-* The code assumes  si->good_cnt * 100  will not overflow, then we can use
-  (si->ok_cnt * 100) safely because the former is bigger.
-
-* The truncated result does not affect the logic:
-  i.e. a value of 49.9 is truncated to 49 and is still <50.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- ubi-utils/ubiformat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
-index 21409ca..d93164a 100644
---- a/ubi-utils/ubiformat.c
-+++ b/ubi-utils/ubiformat.c
-@@ -843,7 +843,7 @@ int main(int argc, char * const argv[])
- 	}
- 
- 	if (!args.override_ec && si->empty_cnt < si->good_cnt) {
--		int percent = ((double)si->ok_cnt)/si->good_cnt * 100;
-+		int percent = (si->ok_cnt * 100) / si->good_cnt;
- 
- 		/*
- 		 * Make sure the majority of eraseblocks have valid
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eliminate-warnings-about-implicit-non-const-casting-.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eliminate-warnings-about-implicit-non-const-casting-.patch
deleted file mode 100644
index 658246a..0000000
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-1.5.2/0009-Eliminate-warnings-about-implicit-non-const-casting-.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 2229f3b9fd4bad47794c28e558ad273173cea73d Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 27 Jan 2018 09:52:46 +0100
-Subject: [PATCH 9/9] Eliminate warnings about implicit non-const casting in
- libmtd
-
-The mtd_get_dev_info1 function reads (among other things) name and type
-string into coresponding struct mtd_dev_info fields.
-
-The struct mtd_dev_info has the string fields marked const, requiring
-them to be cast to non-const version during initialization.
-
-This cast was previously omitted from the dev_read_data calls,
-triggering warnings during compilation.
-
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Signed-off-by: Richard Weinberger <richard@nod.at>
-
-Upstream-Status: Backport
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- lib/libmtd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/libmtd.c b/lib/libmtd.c
-index 60b4782..5f0bcbc 100644
---- a/lib/libmtd.c
-+++ b/lib/libmtd.c
-@@ -746,13 +746,13 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
- 	if (dev_get_major(lib, mtd_num, &mtd->major, &mtd->minor))
- 		return -1;
- 
--	ret = dev_read_data(lib->mtd_name, mtd_num, &mtd->name,
-+	ret = dev_read_data(lib->mtd_name, mtd_num, (char *)&mtd->name,
- 			    MTD_NAME_MAX + 1);
- 	if (ret < 0)
- 		return -1;
- 	((char *)mtd->name)[ret - 1] = '\0';
- 
--	ret = dev_read_data(lib->mtd_type, mtd_num, &mtd->type_str,
-+	ret = dev_read_data(lib->mtd_type, mtd_num, (char *)&mtd->type_str,
- 			    MTD_TYPE_MAX + 1);
- 	if (ret < 0)
- 		return -1;
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
new file mode 100644
index 0000000..6ed167f
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
@@ -0,0 +1,40 @@
+From e596ae99059c28fa9bb3461e03e7ecaacbf41727 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Wed, 23 May 2018 15:34:59 +0200
+Subject: [PATCH] libmissing.h: fix klibc build when using glibc toolchain
+
+klibc lacks execinfo.h so adda guard around it.
+Note: build with musl toolchain is ok even without this patch.
+
+Fix build error:
+
+| In file included from ../git/lib/execinfo.c:1:0:
+| ../git/include/libmissing.h:7:10: fatal error: execinfo.h: 
+ No such file or directory
+
+Status: Inappropriate [klibc specific]
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ include/libmissing.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/libmissing.h b/include/libmissing.h
+index 0196033..832c372 100644
+--- a/include/libmissing.h
++++ b/include/libmissing.h
+@@ -3,9 +3,11 @@
+ 
+ #include "config.h"
+ 
++#ifndef __KLIBC__
+ #ifdef HAVE_EXECINFO_H
+ #include <execinfo.h>
+ #endif
++#endif
+ 
+ #ifndef HAVE_EXECINFO_H
+ int backtrace(void **buffer, int size);
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch
new file mode 100644
index 0000000..bb675a7
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch
@@ -0,0 +1,326 @@
+From 01c98d5d5d044d9a125abcdbb2f3d771966365b0 Mon Sep 17 00:00:00 2001
+From: mirabilos <m@mirbsd.org>
+Date: Thu, 1 Feb 2018 15:34:07 +0100
+Subject: [PATCH 2/4] Instead of doing preprocessor magic, just output off_t as
+ long long
+
+Fix warnings abot PRIdoff_t in libmtd.c, in mtd_read (and mtd_write):
+
+In file included from ../git/lib/libmtd.c:40:0:
+../git/lib/libmtd.c: In function 'mtd_read':
+../git/include/common.h:110:18: warning: format '%ld' expects argument of
+ type 'long int', but argument 5 has type 'off_t {aka long long int}'
+ [-Wformat=]
+
+../git/include/common.h:120:2: note: in expansion of macro 'errmsg'
+  errmsg(fmt, ##__VA_ARGS__);                                         \
+  ^~~~~~
+../git/lib/libmtd.c:1082:10: note: in expansion of macro 'sys_errmsg'
+   return sys_errmsg("cannot seek mtd%d to offset %"PRIdoff_t,
+          ^~~~~~~~~~
+
+/usr/lib/klibc/include/inttypes.h:28:17: note: format string is defined here
+ #define PRId32 "d"
+
+Upstream-Status: Submitted
+
+Signed-off-by: Thorsten Glaser <tg@mirbsd.org>
+---
+ include/common.h                    | 18 ------------------
+ jffsX-utils/mkfs.jffs2.c            | 20 ++++++++++----------
+ lib/libmtd.c                        |  8 ++++----
+ misc-utils/flash_erase.c            |  6 +++---
+ misc-utils/flash_otp_write.c        |  2 +-
+ misc-utils/ftl_check.c              |  2 +-
+ misc-utils/mtd_debug.c              |  4 ++--
+ misc-utils/serve_image.c            |  4 ++--
+ tests/fs-tests/integrity/integck.c  |  4 ++--
+ tests/mtd-tests/nandpagetest.c      |  4 ++--
+ tests/ubi-tests/integ.c             |  6 +++---
+ ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |  6 +++---
+ 12 files changed, 33 insertions(+), 51 deletions(-)
+
+diff --git a/include/common.h b/include/common.h
+index f8f72ea..642c212 100644
+--- a/include/common.h
++++ b/include/common.h
+@@ -70,24 +70,6 @@ extern "C" {
+ #define O_CLOEXEC 0
+ #endif
+ 
+-/* define a print format specifier for off_t */
+-#if (SIZEOF_OFF_T >= 8)
+-#define PRIxoff_t PRIx64
+-#define PRIdoff_t PRId64
+-#else
+-#define PRIxoff_t "l"PRIx32
+-#define PRIdoff_t "l"PRId32
+-#endif
+-
+-/* define a print format specifier for loff_t */
+-#if (SIZEOF_LOFF_T >= 8)
+-#define PRIxloff_t PRIx64
+-#define PRIdloff_t PRId64
+-#else
+-#define PRIxloff_t "l"PRIx32
+-#define PRIdloff_t "l"PRId32
+-#endif
+-
+ /* Verbose messages */
+ #define bareverbose(verbose, fmt, ...) do {                        \
+ 	if (verbose)                                               \
+diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
+index 9aa6c39..0661786 100644
+--- a/jffsX-utils/mkfs.jffs2.c
++++ b/jffsX-utils/mkfs.jffs2.c
+@@ -1237,8 +1237,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
+ 		} else switch (e->sb.st_mode & S_IFMT) {
+ 			case S_IFDIR:
+ 				if (verbose) {
+-					printf("\td %04o %9" PRIdoff_t "             %5d:%-3d %s\n",
+-							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
++					printf("\td %04o %9lld             %5d:%-3d %s\n",
++							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size,
+ 							(int) (e->sb.st_uid), (int) (e->sb.st_gid),
+ 							e->name);
+ 				}
+@@ -1247,8 +1247,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
+ 				break;
+ 			case S_IFSOCK:
+ 				if (verbose) {
+-					printf("\ts %04o %9" PRIdoff_t "             %5d:%-3d %s\n",
+-							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
++					printf("\ts %04o %9lld             %5d:%-3d %s\n",
++							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size,
+ 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
+ 				}
+ 				write_pipe(e);
+@@ -1256,8 +1256,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
+ 				break;
+ 			case S_IFIFO:
+ 				if (verbose) {
+-					printf("\tp %04o %9" PRIdoff_t "             %5d:%-3d %s\n",
+-							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
++					printf("\tp %04o %9lld             %5d:%-3d %s\n",
++							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size,
+ 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
+ 				}
+ 				write_pipe(e);
+@@ -1285,8 +1285,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
+ 				break;
+ 			case S_IFLNK:
+ 				if (verbose) {
+-					printf("\tl %04o %9" PRIdoff_t "             %5d:%-3d %s -> %s\n",
+-							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
++					printf("\tl %04o %9lld             %5d:%-3d %s -> %s\n",
++							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size,
+ 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name,
+ 							e->link);
+ 				}
+@@ -1297,8 +1297,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
+ 				wrote = write_regular_file(e);
+ 				write_xattr_entry(e);
+ 				if (verbose) {
+-					printf("\tf %04o %9" PRIdoff_t " (%9u) %5d:%-3d %s\n",
+-							e->sb.st_mode & ~S_IFMT, e->sb.st_size, wrote,
++					printf("\tf %04o %9lld (%9u) %5d:%-3d %s\n",
++							e->sb.st_mode & ~S_IFMT, (long long)e->sb.st_size, wrote,
+ 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
+ 				}
+ 				break;
+diff --git a/lib/libmtd.c b/lib/libmtd.c
+index 86c89ae..f375381 100644
+--- a/lib/libmtd.c
++++ b/lib/libmtd.c
+@@ -1079,8 +1079,8 @@ int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
+ 	/* Seek to the beginning of the eraseblock */
+ 	seek = (off_t)eb * mtd->eb_size + offs;
+ 	if (lseek(fd, seek, SEEK_SET) != seek)
+-		return sys_errmsg("cannot seek mtd%d to offset %"PRIdoff_t,
+-				  mtd->mtd_num, seek);
++		return sys_errmsg("cannot seek mtd%d to offset %lld",
++				  mtd->mtd_num, (long long)seek);
+ 
+ 	while (rd < len) {
+ 		ret = read(fd, buf + rd, len - rd);
+@@ -1188,8 +1188,8 @@ int mtd_write(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb,
+ 	if (data) {
+ 		/* Seek to the beginning of the eraseblock */
+ 		if (lseek(fd, seek, SEEK_SET) != seek)
+-			return sys_errmsg("cannot seek mtd%d to offset %"PRIdoff_t,
+-					mtd->mtd_num, seek);
++			return sys_errmsg("cannot seek mtd%d to offset %lld",
++					mtd->mtd_num, (long long)seek);
+ 		ret = write(fd, data, len);
+ 		if (ret != len)
+ 			return sys_errmsg("cannot write %d bytes to mtd%d "
+diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
+index 0c9449f..ec4b2e1 100644
+--- a/misc-utils/flash_erase.c
++++ b/misc-utils/flash_erase.c
+@@ -53,8 +53,8 @@ int target_endian = __BYTE_ORDER;
+ static void show_progress(struct mtd_dev_info *mtd, off_t start, int eb,
+ 			  int eb_start, int eb_cnt)
+ {
+-	bareverbose(!quiet, "\rErasing %d Kibyte @ %"PRIxoff_t" -- %2i %% complete ",
+-		mtd->eb_size / 1024, start, ((eb - eb_start) * 100) / eb_cnt);
++	bareverbose(!quiet, "\rErasing %d Kibyte @ %llx -- %2i %% complete ",
++		mtd->eb_size / 1024, (unsigned long long)start, ((eb - eb_start) * 100) / eb_cnt);
+ 	fflush(stdout);
+ }
+ 
+@@ -210,7 +210,7 @@ int main(int argc, char *argv[])
+ 		if (!noskipbad) {
+ 			int ret = mtd_is_bad(&mtd, fd, eb);
+ 			if (ret > 0) {
+-				verbose(!quiet, "Skipping bad block at %08"PRIxoff_t, offset);
++				verbose(!quiet, "Skipping bad block at %08llx", (unsigned long long)offset);
+ 				continue;
+ 			} else if (ret < 0) {
+ 				if (errno == EOPNOTSUPP) {
+diff --git a/misc-utils/flash_otp_write.c b/misc-utils/flash_otp_write.c
+index b02d0b0..04c96c6 100644
+--- a/misc-utils/flash_otp_write.c
++++ b/misc-utils/flash_otp_write.c
+@@ -76,7 +76,7 @@ int main(int argc,char *argv[])
+ 		return errno;
+ 	}
+ 
+-	printf("Writing OTP user data on %s at offset 0x%"PRIxoff_t"\n", argv[2], offset);
++	printf("Writing OTP user data on %s at offset 0x%llx\n", argv[2], (unsigned long long)offset);
+ 
+ 	if (mtd_type_is_nand_user(&mtdInfo))
+ 		len = mtdInfo.writesize;
+diff --git a/misc-utils/ftl_check.c b/misc-utils/ftl_check.c
+index a853cf4..e854922 100644
+--- a/misc-utils/ftl_check.c
++++ b/misc-utils/ftl_check.c
+@@ -131,7 +131,7 @@ static void check_partition(int fd)
+ 			perror("read failed");
+ 			break;
+ 		}
+-		printf("\nErase unit %"PRIdoff_t":\n", i);
++		printf("\nErase unit %lld:\n", (long long)i);
+ 		if ((hdr2.FormattedSize != hdr.FormattedSize) ||
+ 				(hdr2.NumEraseUnits != hdr.NumEraseUnits) ||
+ 				(hdr2.SerialNumber != hdr.SerialNumber))
+diff --git a/misc-utils/mtd_debug.c b/misc-utils/mtd_debug.c
+index ac37e23..d65ad36 100644
+--- a/misc-utils/mtd_debug.c
++++ b/misc-utils/mtd_debug.c
+@@ -160,7 +160,7 @@ retry:
+ 	if (buf != NULL)
+ 		free(buf);
+ 	close(outfd);
+-	printf("Copied %zu bytes from address 0x%.8"PRIxoff_t" in flash to %s\n", len, offset, filename);
++	printf("Copied %zu bytes from address 0x%.8llx in flash to %s\n", len, (unsigned long long)offset, filename);
+ 	return 0;
+ 
+ err2:
+@@ -225,7 +225,7 @@ retry:
+ 	if (buf != NULL)
+ 		free(buf);
+ 	fclose(fp);
+-	printf("Copied %d bytes from %s to address 0x%.8"PRIxoff_t" in flash\n", len, filename, offset);
++	printf("Copied %d bytes from %s to address 0x%.8llx in flash\n", len, filename, (unsigned long long)offset);
+ 	return 0;
+ }
+ 
+diff --git a/misc-utils/serve_image.c b/misc-utils/serve_image.c
+index f2475d6..6c8c8fb 100644
+--- a/misc-utils/serve_image.c
++++ b/misc-utils/serve_image.c
+@@ -129,8 +129,8 @@ int main(int argc, char **argv)
+ 	}
+ 
+ 	if (st.st_size % erasesize) {
+-		fprintf(stderr, "Image size %" PRIdoff_t " bytes is not a multiple of erasesize %d bytes\n",
+-				st.st_size, erasesize);
++		fprintf(stderr, "Image size %lld bytes is not a multiple of erasesize %d bytes\n",
++				(long long)st.st_size, erasesize);
+ 		exit(1);
+ 	}
+ 	image = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, rfd, 0);
+diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
+index 84753d6..0a7f142 100644
+--- a/tests/fs-tests/integrity/integck.c
++++ b/tests/fs-tests/integrity/integck.c
+@@ -897,8 +897,8 @@ static ssize_t file_write_data(struct file_info *file, int fd, off_t offset,
+ 	remains = size;
+ 	actual = 0;
+ 	written = IO_BUFFER_SIZE;
+-	v("write %zd bytes, offset %"PRIdoff_t", file %s",
+-	  size, offset, get_file_name(file));
++	v("write %zd bytes, offset %lld, file %s",
++	  size, (long long)offset, get_file_name(file));
+ 	while (remains) {
+ 		/* Fill up buffer with random data */
+ 		if (written < IO_BUFFER_SIZE) {
+diff --git a/tests/mtd-tests/nandpagetest.c b/tests/mtd-tests/nandpagetest.c
+index c6812df..465e548 100644
+--- a/tests/mtd-tests/nandpagetest.c
++++ b/tests/mtd-tests/nandpagetest.c
+@@ -232,8 +232,8 @@ static int verify_eraseblock(int ebnum)
+ 			return err;
+ 
+ 		if (lseek(fd, addr, SEEK_SET) != addr) {
+-			fprintf(stderr, "cannot seek mtd%d to offset %"PRIdloff_t,
+-	 				mtd.mtd_num, addr);
++			fprintf(stderr, "cannot seek mtd%d to offset %lld",
++	 				mtd.mtd_num, (long long)addr);
+ 			return -1;
+ 		}
+ 
+diff --git a/tests/ubi-tests/integ.c b/tests/ubi-tests/integ.c
+index 26c2ce5..1cd0649 100644
+--- a/tests/ubi-tests/integ.c
++++ b/tests/ubi-tests/integ.c
+@@ -243,7 +243,7 @@ static void check_erase_block(struct erase_block_info *erase_block, int fd)
+ 			while (size)
+ 				if (read_buffer[--size] != 0xff) {
+ 					fprintf(stderr, "block no. = %d\n" , erase_block->block_number);
+-					fprintf(stderr, "offset = %"PRIdoff_t"\n" , gap_start);
++					fprintf(stderr, "offset = %lld\n" , (long long)gap_start);
+ 					fprintf(stderr, "size = %ld\n" , (long) bytes_read);
+ 					error_exit("verify 0xff failed");
+ 				}
+@@ -254,7 +254,7 @@ static void check_erase_block(struct erase_block_info *erase_block, int fd)
+ 		errno = 0;
+ 		bytes_read = read(fd, read_buffer, w->size);
+ 		if (bytes_read != w->size) {
+-			fprintf(stderr, "offset = %"PRIdoff_t"\n" , w->offset);
++			fprintf(stderr, "offset = %lld\n" , (long long)w->offset);
+ 			fprintf(stderr, "size = %ld\n" , (long) w->size);
+ 			fprintf(stderr, "bytes_read = %ld\n" , (long) bytes_read);
+ 			error_exit("read failed");
+@@ -279,7 +279,7 @@ static void check_erase_block(struct erase_block_info *erase_block, int fd)
+ 		while (size)
+ 			if (read_buffer[--size] != 0xff) {
+ 				fprintf(stderr, "block no. = %d\n" , erase_block->block_number);
+-				fprintf(stderr, "offset = %"PRIdoff_t"\n" , gap_start);
++				fprintf(stderr, "offset = %lld\n" , (long long)gap_start);
+ 				fprintf(stderr, "size = %ld\n" , (long) bytes_read);
+ 				error_exit("verify 0xff failed!");
+ 			}
+diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+index c916f48..f0237ab 100644
+--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
++++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+@@ -772,11 +772,11 @@ int write_leb(int lnum, int len, void *buf)
+ 			return sys_err_msg("ubi_leb_change_start failed");
+ 
+ 	if (lseek(out_fd, pos, SEEK_SET) != pos)
+-		return sys_err_msg("lseek failed seeking %"PRIdoff_t, pos);
++		return sys_err_msg("lseek failed seeking %lld", (long long)pos);
+ 
+ 	if (write(out_fd, buf, c->leb_size) != c->leb_size)
+-		return sys_err_msg("write failed writing %d bytes at pos %"PRIdoff_t,
+-				   c->leb_size, pos);
++		return sys_err_msg("write failed writing %d bytes at pos %lld",
++				   c->leb_size, (long long)pos);
+ 
+ 	return 0;
+ }
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch
new file mode 100644
index 0000000..08c53d1
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0003-Makefile.am-only-build-ubi-utils.patch
@@ -0,0 +1,34 @@
+From 139d93bc405272a3261d57be26da842e737fe4d0 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 28 Jan 2018 23:10:34 +0100
+Subject: [PATCH 3/4] Makefile.am: only build ubi-utils
+
+We only target the ubi-utils, static, small.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5a6e77c..98715dd 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -34,9 +34,9 @@ EXTRA_DIST += $(GLOBAL_HEADER) $(GLOBAL_EXTRA)
+ 
+ include lib/Makemodule.am
+ include ubi-utils/Makemodule.am
+-include misc-utils/Makemodule.am
+-include nand-utils/Makemodule.am
+-include nor-utils/Makemodule.am
++#include misc-utils/Makemodule.am
++#include nand-utils/Makemodule.am
++#include nor-utils/Makemodule.am
+ 
+ if BUILD_UBIFS
+ include ubifs-utils/Makemodule.am
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
new file mode 100644
index 0000000..5da05fa
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
@@ -0,0 +1,38 @@
+From ae1cf6d0eb1833e46549328a4473222c259723d7 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 1 Feb 2018 00:25:00 +0100
+Subject: [PATCH 4/4] mtd-utils: common.h: no features.h for klibc builds
+
+Add guard around features.h to fix missing include (here first error):
+
+ ../git/include/common.h:29:10:
+ fatal error: features.h: No such file or directory
+  #include <features.h>
+           ^~~~~~~~~~~~
+ compilation terminated
+
+Upstream-Status: Submitted
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ include/common.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/include/common.h b/include/common.h
+index 642c212..f7c71fe 100644
+--- a/include/common.h
++++ b/include/common.h
+@@ -26,7 +26,10 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <errno.h>
++#if defined(__KLIBC__)
++#else
+ #include <features.h>
++#endif
+ #include <inttypes.h>
+ #include <unistd.h>
+ #include <sys/sysmacros.h>
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005-common.h-replace-getline-with-fgets.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005-common.h-replace-getline-with-fgets.patch
new file mode 100644
index 0000000..adef377
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0005-common.h-replace-getline-with-fgets.patch
@@ -0,0 +1,56 @@
+From 2137eb1a6cd0326510bd3b9faf8037d9bf34ca3d Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Wed, 23 May 2018 15:52:34 +0200
+Subject: [PATCH 5/5] common.h: replace getline() with fgets
+
+There is an unofficial upstream patch adding a simple getline()
+to libmissing.h. Unfortunately the patch creates issues if the
+toolchain is using glibc (autotools cache?) so for the moment
+keep the old hack and wait for commits upstream.
+
+Fix:
+
+| ubi-utils/ubiformat.o: In function `prompt.constprop.4':
+| ubiformat.c:(.text+0x70): undefined reference to `getline'
+
+Upstrea-Status: Inappropriate [klibc specific]
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ include/common.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/include/common.h b/include/common.h
+index a1d59d0..96b0bdb 100644
+--- a/include/common.h
++++ b/include/common.h
+@@ -126,15 +126,26 @@ extern "C" {
+  */
+ static inline bool prompt(const char *msg, bool def)
+ {
++
++#ifndef __KLIBC__
+ 	char *line = NULL;
+ 	size_t len;
++#else
++	char *line;
++	const int sizeof_line = 2;
++	line = malloc(sizeof_line);
++#endif
+ 	bool ret = def;
+ 
+ 	do {
+ 		normsg_cont("%s (%c/%c) ", msg, def ? 'Y' : 'y', def ? 'n' : 'N');
+ 		fflush(stdout);
+ 
++#ifndef __KLIBC__
+ 		while (getline(&line, &len, stdin) == -1) {
++#else
++		while (fgets(line, sizeof_line, stdin) == NULL) {
++#endif
+ 			printf("failed to read prompt; assuming '%s'\n",
+ 				def ? "yes" : "no");
+ 			break;
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
similarity index 64%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
index abb0d4b..8b00981 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
@@ -7,30 +7,31 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-inherit klibc
+inherit autotools pkgconfig klibc
 
-SRCREV = "aea36417067dade75192bafa03af70b6eb2677b1"
+SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
-             file://0001-Makefile-build-ubi-utils-only.patch \
-             file://0002-common.mk-for-klibc-CC-is-klcc.patch \
-             file://0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch \
-             file://0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch \
-             file://0005-common.h-more-workarounds-for-klibc-compatibility.patch \
-             file://0006-libiniparser-remove-unused-function-needing-float.patch \
-             file://0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch \
-             file://0008-ubi-utils-ubiformat.c-convert-to-integer-arithmetic.patch \
-             file://0009-Eliminate-warnings-about-implicit-non-const-casting-.patch \
+             file://0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch \
+             file://0002-Instead-of-doing-preprocessor-magic-just-output-off_.patch \
+             file://0003-Makefile.am-only-build-ubi-utils.patch \
+             file://0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch \
+             file://0005-common.h-replace-getline-with-fgets.patch \
              "
 
 S = "${WORKDIR}/git/"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+EXTRA_OECONF += "--disable-tests --without-jffs --without-ubifs"
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
+PACKAGECONFIG[xattr] = ",,acl,"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
 
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
 }
 
-PACKAGES = "ubi-utils-klibc-dbg"
+PACKAGES = "ubi-utils-klibc-dbg ubi-utils-klibc-doc"
 
 PACKAGES =+ "mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
              ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
-- 
2.7.4


