Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2489F774DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 16:07:07 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 124so1895662pgi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4BUi9g9fx4dzvEabC988L/NvesJeMvwixtf3QPxhKWs=;
	b=hz4uf3uy0bwg5nynyUhTxyjqIG2xkQRZ2PKSn0F/KiALb0qOM4UpOW4V9CibgJprMG
	1tDfWBwSCXuIh/yIPyTxxka89Jkow40ZBib62PfGEAU/Q53TrApvuYY4E7pm9xo/jMkN
	nIoFXR4ePeGd+cChmxc6Kqck8iEmiaOFjBfPhs0HUKkC2h+qRuaXxRoJb7p2YU9DLGp7
	prEatRlBEPMmoDrraUg4Yku5frYU66ksY+KBOYYPRQ6FA/OnzUJ8Av9+M3V+xvBICznE
	N7+e/JGkcwrv0W+yXV9xj8mCh8x97vnDkTp7sd0/WpKeleADLhNH/knAudad0sIR0COS
	K/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4BUi9g9fx4dzvEabC988L/NvesJeMvwixtf3QPxhKWs=;
	b=VoomG7FSi/HtejbkSaOc6uRrU9C/Z4k2KWShWeQBybKhTdJnaZVPB/OZtxfP8XekOh
	+9qxhNQxzSY5PO9YrPWKktzrwQjerqHzVdj7+D6rXaJO5666AtcHRz4zcy7S8gfLmjcA
	dDG43QcD9oedDjVQHQC1b+mTzMm0CGpgy5BUTkNaeH6+7+xsXihkfjk8dIlNK9Jvg3RI
	Ox2AfPUMwnLCBb51lN83VLnMeIBY85zMHnVgtb6/5E/MqH2Jwe9f+mhYk44NjSKymRPf
	iQPrQxwaWyfVxq7XomfBvuDx0jj0cipjhsaQ8gl6yfBCQETmTm7WQWKYXQ/7RTnnHEM2
	BjDQ==
X-Gm-Message-State: AHPjjUgUvEyasEXOUv3OWgLFizVu8DurhFb0hOQywtuQz6IPvvpnemPJ
	gCqYgn4bMv+zCtm6rBc00MUMwg==
X-Google-Smtp-Source: AOwi7QAXphqbPl27FsOVIyPQx1q37dG4wpr9KqNq3KsSfIhc7Eb7c+ifGpUWH46MOlE96GJlfeazkg==
X-Received: by 10.98.74.156 with SMTP id c28mr14737877pfj.266.1506960429054;
	Mon, 02 Oct 2017 09:07:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id
	f2sm17329405pfg.135.2017.10.02.09.07.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 09:07:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Oct 2017 09:06:55 -0700
Message-Id: <20171002160657.39576-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171002160657.39576-1-raj.khem@gmail.com>
References: <20171002160657.39576-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 3/5] ubi-utils-klibc: Update to 1.5.2 release of mtd-utils
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
X-List-Received-Date: Mon, 02 Oct 2017 16:07:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Makefile-only-build-ubi-utils.patch       | 25 ++++++++++------------
 .../0005-common.h-klibc-fixes-2.patch              | 22 +++++--------------
 ...ils-klibc_1.5.1.bb => ubi-utils-klibc_1.5.2.bb} |  8 +++----
 3 files changed, 19 insertions(+), 36 deletions(-)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc_1.5.1.bb => ubi-utils-klibc_1.5.2.bb} (90%)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
index 9d5e4ebf0..6e1b9ff10 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
@@ -25,11 +25,11 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  Makefile | 24 ++----------------------
  1 file changed, 2 insertions(+), 22 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index eade234..2275865 100644
---- a/Makefile
-+++ b/Makefile
-@@ -16,28 +16,13 @@ endif
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -16,28 +16,11 @@ endif
  
  TESTS = tests
  
@@ -37,7 +37,7 @@ index eade234..2275865 100644
 -	ftl_format flash_erase nanddump doc_loadbios \
 -	ftl_check mkfs.jffs2 flash_lock flash_unlock \
 -	flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
--	mtd_debug flashcp nandwrite nandtest \
+-	mtd_debug flashcp nandwrite nandtest mtdpart \
 -	jffs2dump \
 -	nftldump nftl_format docfdisk \
 -	rfddump rfdformat \
@@ -51,15 +51,15 @@ index eade234..2275865 100644
 -BINS += mkfs.ubifs/mkfs.ubifs
 -BINS += $(addprefix ubi-utils/,$(UBI_BINS))
 -SCRIPTS = flash_eraseall
-+BINS = $(addprefix ubi-utils/,$(UBI_BINS))
- 
- TARGETS = $(BINS)
+-
+-TARGETS = $(BINS)
 -TARGETS += lib/libmtd.a
 -TARGETS += ubi-utils/libubi.a
++BINS = $(addprefix ubi-utils/,$(UBI_BINS))
  
  OBJDEPS = $(BUILDDIR)/include/version.h
  
-@@ -61,12 +46,9 @@ endif
+@@ -61,12 +44,9 @@ endif
  	rm -f $(BUILDDIR)/include/version.h
  	$(MAKE) -C $(TESTS) clean
  
@@ -73,7 +73,7 @@ index eade234..2275865 100644
  
  tests::
  	$(MAKE) -C $(TESTS)
-@@ -91,8 +73,6 @@ LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
+@@ -91,8 +71,6 @@ LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
  LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
  LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
  
@@ -82,6 +82,3 @@ index eade234..2275865 100644
  #
  # Common libmtd
  #
--- 
-1.9.1
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
index 2e43d5d97..6b09c14d6 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
@@ -22,20 +22,11 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  include/common.h | 10 ++++++----
  1 file changed, 6 insertions(+), 4 deletions(-)
 
-diff --git a/include/common.h b/include/common.h
-index 77f3f7d..2cbee0f 100644
---- a/include/common.h
-+++ b/include/common.h
-@@ -126,7 +126,7 @@ static char __PRIxoff_t_static_assert[sizeof(off_t) == 8 ? 1 : -1];
- 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
- } while(0)
- 
--#if defined(__UCLIBC__)
-+#if defined(__UCLIBC__) || defined(__KLIBC__)
- /* uClibc versions before 0.9.34 don't have rpmatch() */
- #if __UCLIBC_MAJOR__ == 0 && \
- 		(__UCLIBC_MINOR__ < 9 || \
-@@ -146,15 +146,17 @@ static inline int __rpmatch(const char *resp)
+Index: git/include/common.h
+===================================================================
+--- git.orig/include/common.h
++++ git/include/common.h
+@@ -161,15 +161,17 @@ static inline int __rpmatch(const char *
   */
  static inline bool prompt(const char *msg, bool def)
  {
@@ -56,6 +47,3 @@ index 77f3f7d..2cbee0f 100644
  			printf("failed to read prompt; assuming '%s'\n",
  				def ? "yes" : "no");
  			break;
--- 
-1.9.1
-
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
similarity index 90%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
index 8ca1ca727..518c02fc0 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 inherit klibc
 
-SRC_URI = "git://git.infradead.org/mtd-utils.git;tag=b7455d847ab4f9eeeb6a729efc306bfda7bddc99 \
+SRCREV = "aea36417067dade75192bafa03af70b6eb2677b1"
+SRC_URI = "git://git.infradead.org/mtd-utils.git \
              file://0001-Makefile-only-build-ubi-utils.patch \
              file://0002-common.mk-for-klibc-CC-is-klcc.patch \
              file://0003-libubi.c-add-klibc-specific-fixes.patch \
@@ -23,10 +24,7 @@ S = "${WORKDIR}/git/"
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
 do_install () {
-
-    install -d ${D}${sbindir}
-    oe_runmake DESTDIR="${D}" install
-
+	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
 }
 
 PACKAGES = "ubi-utils-klibc-dbg"
-- 
2.14.2


