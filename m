Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 91341785E1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 17:44:07 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id j21so30599603wmh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UczidPAbb0bLXIZeyR3agSJNn8LWU+g4SGHl7xnz2gA=;
	b=u1BSbxuJUt7KZASu0lbUgIB3c9WhLPIEuCz4/v6beCyi5HDxS8PXXe/HtjaEUZlK1Z
	DTAqaSqyBuue5gbR1zAWfH3hRO+bl0B4KqZbLHw7Hbfb0DhR8wi0NI9ZzydvFpBRCTIH
	tLojx5UKcuzhllk11TQT/389BvixC6GiQJZw5LWVvmVMNbsioY9qXoTvIKCeM1+kumi+
	9XCiFid1kdM9u6p5eNaSd6dLlIRMgPhpajrGEOV2298oZvi6AzWsAqbkCJ40IX7Nqitk
	GWUKxL2PDbt3mx8b+Xg+HIONdDQGGioQ73IEVLrN9eWlMi1vRdksbivrEWDOfIvJ0wWJ
	QhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UczidPAbb0bLXIZeyR3agSJNn8LWU+g4SGHl7xnz2gA=;
	b=fqzwxwwVfQuML4je4ZWaO5KO9LOkNADRo2/DT4lo9JRMVYVcWzzDNFsI/aZUDZf3f+
	YcSfyalvajzHzhz8XBSTWEEhlO6eQ7g8kQfsEV30kLPPx7y/sQ1FlzdwJcdY9UtN1KE3
	BkgvxT2YaGKXAxfsW1WQYGN29IS51s8DTfaRCgOUR6aeWPl+bQXdldWYrmY8R1qx46t5
	af0Et0LAuYqX4hryUEO9WWAnFWKjApBn+MJBnELFuwHzHtGn8n7lgSr+ViRsAPZf+rbc
	f5DeDCL84NgCHmsHWevYOOxPQ711ELvpKLLpvEcPfQ3fvSSNxX8TzTDOn1zrqSdbPw8z
	zCFQ==
X-Gm-Message-State: AKwxytfbV2iroIdBW2WirkGU/QVEsndnuO5mmJIIsCeod393WR2IqbTX
	+uEcM5Mp1VFbRrU3BYBSgs1wcpqR
X-Google-Smtp-Source: AH8x226e2Rmy0FuLcQitF9/CytN1K8dcl9e9++Vis7GGloM8NhUJCbmNviFxLL9BEWOmqLfvOrxZBw==
X-Received: by 10.80.182.53 with SMTP id b50mr33850112ede.244.1517075047661;
	Sat, 27 Jan 2018 09:44:07 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host57-10-dynamic.248-95-r.retail.telecomitalia.it. [95.248.10.57])
	by smtp.gmail.com with ESMTPSA id
	k12sm3961405edl.86.2018.01.27.09.44.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Jan 2018 09:44:06 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jan 2018 18:44:01 +0100
Message-Id: <1517075041-24615-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] ubi-utils-klibc_1.5.2: fix build for qemuarm64
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
X-List-Received-Date: Sat, 27 Jan 2018 17:44:07 -0000

Building the recipe with TUNE_FEATURES = "aarch64" and TARGET_FPU = ""
fails. See patch headers for more details.

Patch sent upstream for master, here rebased for 1.5.2.
Tested runtime on armv5.

While there backport one more patch fixing warnings in libmtd.c and
rebase patches.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...ch => 0001-Makefile-build-ubi-utils-only.patch} | 19 ++++---
 .../0002-common.mk-for-klibc-CC-is-klcc.patch      |  8 +--
 ...ubi.c-add-klibc-specific-fixes-for-ioctl.patch} |  8 +--
 ...atibility-to-dietlibc-klibc-musl-libc-af.patch} | 16 +++---
 ...more-workarounds-for-klibc-compatibility.patch} | 21 ++++----
 ...rser-remove-unused-function-needing-float.patch |  6 +--
 ...ls-common.c-convert-to-integer-arithmetic.patch | 59 ++++++++++++++++++++++
 ...td-utils-improve-compatibility-with-klibc.patch | 36 +++++++++++++
 ...arnings-about-implicit-non-const-casting-.patch | 47 +++++++++++++++++
 .../recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb  | 11 ++--
 10 files changed, 193 insertions(+), 38 deletions(-)
 rename meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/{0001-Makefile-only-build-ubi-utils.patch => 0001-Makefile-build-ubi-utils-only.patch} (86%)
 rename meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/{0003-libubi.c-add-klibc-specific-fixes.patch => 0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch} (93%)
 rename meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/{0004-common.h-klibc-fixes-1.patch => 0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch} (87%)
 rename meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/{0005-common.h-klibc-fixes-2.patch => 0005-common.h-more-workarounds-for-klibc-compatibility.patch} (72%)
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0008-mtd-utils-improve-compatibility-with-klibc.patch
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0009-Eliminate-warnings-about-implicit-non-const-casting-.patch

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-build-ubi-utils-only.patch
similarity index 86%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-build-ubi-utils-only.patch
index 6e1b9ff..e47aa86 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-build-ubi-utils-only.patch
@@ -1,7 +1,7 @@
-From c4e6bd9378645d577e9d9f85da85f1438afe7c50 Mon Sep 17 00:00:00 2001
+From 826cfc8cf07ca272fe21cad6718730ac0800ee5e Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Sun, 29 Jun 2014 00:32:29 +0200
-Subject: [PATCH 1/6] Makefile: build ubi-utils only
+Subject: [PATCH 1/8] Makefile: build ubi-utils only
 
 We build all the static ubi-utils but actually only ubiattach is needed in
 a minimalistic initramfs for the mount of ubi volumes.
@@ -22,13 +22,13 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
- Makefile | 24 ++----------------------
- 1 file changed, 2 insertions(+), 22 deletions(-)
+ Makefile | 26 ++------------------------
+ 1 file changed, 2 insertions(+), 24 deletions(-)
 
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
+diff --git a/Makefile b/Makefile
+index 3ce8587..8b79f71 100644
+--- a/Makefile
++++ b/Makefile
 @@ -16,28 +16,11 @@ endif
  
  TESTS = tests
@@ -82,3 +82,6 @@ Index: git/Makefile
  #
  # Common libmtd
  #
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0002-common.mk-for-klibc-CC-is-klcc.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0002-common.mk-for-klibc-CC-is-klcc.patch
index f46824b..6624b90 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0002-common.mk-for-klibc-CC-is-klcc.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0002-common.mk-for-klibc-CC-is-klcc.patch
@@ -1,7 +1,7 @@
-From f3609c7c0450b4c31e1d4603fcf2cfb1ba46f994 Mon Sep 17 00:00:00 2001
+From c0c18cb70fe0c066baf57c196e3d96ad58d704bf Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Sun, 29 Jun 2014 00:37:28 +0200
-Subject: [PATCH 2/6] common.mk: for klibc $(CC) is klcc
+Subject: [PATCH 2/8] common.mk: for klibc $(CC) is klcc
 
 Do not hardcode: assign the value to the variable if it is not already defined.
 
@@ -13,7 +13,7 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/common.mk b/common.mk
-index ba87377..59c56df 100644
+index ba87377..126d11a 100644
 --- a/common.mk
 +++ b/common.mk
 @@ -1,4 +1,4 @@
@@ -23,5 +23,5 @@ index ba87377..59c56df 100644
  RANLIB := $(CROSS)ranlib
  
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch
similarity index 93%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch
index 962b368..61d0543 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch
@@ -1,7 +1,7 @@
-From 72a39bb3290a79e76b0dbf59eef83ea2d9b577a1 Mon Sep 17 00:00:00 2001
+From 75bb748eb6a7a8a1848536d2f18e39c90ce9dbc5 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Sun, 29 Jun 2014 00:40:15 +0200
-Subject: [PATCH 3/6] libubi.c: add klibc specific fixes for ioctl
+Subject: [PATCH 3/8] libubi.c: add klibc specific fixes for ioctl
 
 First issue is that ioctl() in klibc doesn't expect a constant as arg3.
 Second issue is that arg3 in klibc ioctl() implementation is not optional.
@@ -44,7 +44,7 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
-index 1e08b7d..491e525 100644
+index 97c0434..2b49833 100644
 --- a/ubi-utils/libubi.c
 +++ b/ubi-utils/libubi.c
 @@ -687,7 +687,7 @@ void libubi_close(libubi_t desc)
@@ -72,5 +72,5 @@ index 1e08b7d..491e525 100644
  
  int ubi_update_start(libubi_t desc, int fd, long long bytes)
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-common.h-klibc-fixes-1.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch
similarity index 87%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-common.h-klibc-fixes-1.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch
index fee1cbc..6ff06d1 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-common.h-klibc-fixes-1.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch
@@ -1,7 +1,11 @@
-From e56767b9caa02e7c41803499c77dc939d5a7f64a Mon Sep 17 00:00:00 2001
+From 9c226028a7408cd79ae3e9e22f08c070c8518cc4 Mon Sep 17 00:00:00 2001
 From: Thorsten Glaser <tg@mirbsd.org>
 Date: Fri, 20 Jun 2014 10:56:27 +0000
-Subject: [PATCH 4/6] Restore compatibility to dietlibc, klibc, musl libc after commit 4f1b108
+Subject: [PATCH 4/8] Restore compatibility to dietlibc, klibc, musl libc after
+ commit 4f1b108
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Each C library has their own way to define off_t, and the <features.h>
 header is nonstandard and specific to the GNU libc and those that clone
@@ -30,7 +34,7 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  1 file changed, 24 insertions(+)
 
 diff --git a/include/common.h b/include/common.h
-index 6895e5c..77f3f7d 100644
+index fb0ca83..5a20964 100644
 --- a/include/common.h
 +++ b/include/common.h
 @@ -26,7 +26,9 @@
@@ -43,7 +47,7 @@ index 6895e5c..77f3f7d 100644
  #include <inttypes.h>
  #include "version.h"
  
-@@ -52,6 +54,21 @@ extern "C" {
+@@ -67,6 +69,21 @@ extern "C" {
  #endif
  
  /* define a print format specifier for off_t */
@@ -65,7 +69,7 @@ index 6895e5c..77f3f7d 100644
  #ifdef __USE_FILE_OFFSET64
  #define PRIxoff_t PRIx64
  #define PRIdoff_t PRId64
-@@ -59,6 +76,13 @@ extern "C" {
+@@ -74,6 +91,13 @@ extern "C" {
  #define PRIxoff_t "l"PRIx32
  #define PRIdoff_t "l"PRId32
  #endif
@@ -80,5 +84,5 @@ index 6895e5c..77f3f7d 100644
  /* Verbose messages */
  #define bareverbose(verbose, fmt, ...) do {                        \
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-more-workarounds-for-klibc-compatibility.patch
similarity index 72%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-more-workarounds-for-klibc-compatibility.patch
index 6b09c14..e5ce9da 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-more-workarounds-for-klibc-compatibility.patch
@@ -1,7 +1,7 @@
-From 8318852ef4f768bed31072aa7b57e11adc1f639c Mon Sep 17 00:00:00 2001
+From de399c76ab6cf5e4828bd744b3309ded2431b721 Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Sun, 29 Jun 2014 00:44:03 +0200
-Subject: [PATCH 5/6] common.h: more workarounds for klibc compatibility
+Subject: [PATCH 5/8] common.h: more workarounds for klibc compatibility
 
 Patch is addressing two issues:
 * First,  Klibc doesn't have rpmatch().
@@ -19,14 +19,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
- include/common.h | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
+ include/common.h | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
 
-Index: git/include/common.h
-===================================================================
---- git.orig/include/common.h
-+++ git/include/common.h
-@@ -161,15 +161,17 @@ static inline int __rpmatch(const char *
+diff --git a/include/common.h b/include/common.h
+index 5a20964..2f51e1c 100644
+--- a/include/common.h
++++ b/include/common.h
+@@ -161,15 +161,17 @@ static inline int __rpmatch(const char *resp)
   */
  static inline bool prompt(const char *msg, bool def)
  {
@@ -47,3 +47,6 @@ Index: git/include/common.h
  			printf("failed to read prompt; assuming '%s'\n",
  				def ? "yes" : "no");
  			break;
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0006-libiniparser-remove-unused-function-needing-float.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0006-libiniparser-remove-unused-function-needing-float.patch
index 043a89d..4877359 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0006-libiniparser-remove-unused-function-needing-float.patch
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0006-libiniparser-remove-unused-function-needing-float.patch
@@ -1,7 +1,7 @@
-From 72a04a9b9ed33c889d2e2b86f306c5be9f6cde35 Mon Sep 17 00:00:00 2001
+From 981260df9e690170fa11c5f1eb84befcd649dd2d Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
 Date: Sun, 29 Jun 2014 00:44:57 +0200
-Subject: [PATCH 6/6] libiniparser: remove unused function needing float
+Subject: [PATCH 6/8] libiniparser: remove unused function needing float
 
 Fixes:
 |   LD      ubi-utils/ubiformat
@@ -81,5 +81,5 @@ index 898f57f..ba70c08 100644
    @param    d Dictionary to search
    @param    key Key string to look for
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch
new file mode 100644
index 0000000..8eafca2
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch
@@ -0,0 +1,59 @@
+From bba960085955e77190a7300127e9847605aa034d Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 27 Jan 2018 09:38:03 +0100
+Subject: [PATCH 7/8] mtd-utils: common.c: convert to integer arithmetic
+
+We use floating point just to print out KiB, MiB, GiB.
+Avoid that to be klibc friendly.
+
+Fixes compilation for aarch64 against klibc:
+
+error: '-mgeneral-regs-only' is incompatible with floating-point argument
+|    printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
+etc.
+
+Note:
+* In the KiB case, we could apparently multiply by 100 before dividing
+  without risking overflow. This code simply avoids multiplications.
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ ubi-utils/ubiutils-common.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/ubi-utils/ubiutils-common.c b/ubi-utils/ubiutils-common.c
+index 6609a6b..a4c9fc8 100644
+--- a/ubi-utils/ubiutils-common.c
++++ b/ubi-utils/ubiutils-common.c
+@@ -107,6 +107,9 @@ long long ubiutils_get_bytes(const char *str)
+ void ubiutils_print_bytes(long long bytes, int bracket)
+ {
+ 	const char *p;
++	int GiB = 1024 * 1024 * 1024;
++	int MiB = 1024 * 1024;
++	int KiB = 1024;
+ 
+ 	if (bracket)
+ 		p = " (";
+@@ -115,12 +118,12 @@ void ubiutils_print_bytes(long long bytes, int bracket)
+ 
+ 	printf("%lld bytes", bytes);
+ 
+-	if (bytes > 1024 * 1024 * 1024)
+-		printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
+-	else if (bytes > 1024 * 1024)
+-		printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
+-	else if (bytes > 1024 && bytes != 0)
+-		printf("%s%.1f KiB", p, (double)bytes / 1024);
++	if (bytes > GiB)
++		printf("%s%d.%d GiB", p, bytes / GiB, bytes % GiB / (GiB / 10));
++	else if (bytes > MiB)
++		printf("%s%d.%d MiB", p, bytes / MiB, bytes % MiB / (MiB / 10));
++	else if (bytes > KiB && bytes != 0)
++		printf("%s%d.%d KiB", p, bytes / KiB, bytes % KiB / (KiB / 10));
+ 	else
+ 		return;
+ 
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0008-mtd-utils-improve-compatibility-with-klibc.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0008-mtd-utils-improve-compatibility-with-klibc.patch
new file mode 100644
index 0000000..6e81a31
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0008-mtd-utils-improve-compatibility-with-klibc.patch
@@ -0,0 +1,36 @@
+From 5ad8391bd1599f726858907d16fd38b546e1837b Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 27 Jan 2018 09:39:26 +0100
+Subject: [PATCH 8/8] mtd-utils: improve compatibility with klibc
+
+Klibc does not support floating point calculations.
+Here some fixes needed to build the ubi-utils against klibc for aarch64,
+without FPU.
+
+These lines end up compiled with soft float for other arm targets w/out
+FPU thus this was discovered only cross-building for qemuarm64 using the flag
+ '-mgeneral-regs-only'.
+
+Changes tested on armv5, same output is printed.
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ ubi-utils/ubiformat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
+index 21409ca..d93164a 100644
+--- a/ubi-utils/ubiformat.c
++++ b/ubi-utils/ubiformat.c
+@@ -843,7 +843,7 @@ int main(int argc, char * const argv[])
+ 	}
+ 
+ 	if (!args.override_ec && si->empty_cnt < si->good_cnt) {
+-		int percent = ((double)si->ok_cnt)/si->good_cnt * 100;
++		int percent = (si->ok_cnt * 100) / si->good_cnt;
+ 
+ 		/*
+ 		 * Make sure the majority of eraseblocks have valid
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0009-Eliminate-warnings-about-implicit-non-const-casting-.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0009-Eliminate-warnings-about-implicit-non-const-casting-.patch
new file mode 100644
index 0000000..79a9408
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0009-Eliminate-warnings-about-implicit-non-const-casting-.patch
@@ -0,0 +1,47 @@
+From a5daf1e20a81c608b0005afafdf3a5d3d99590b3 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 27 Jan 2018 09:52:46 +0100
+Subject: [PATCH 9/9] Eliminate warnings about implicit non-const casting in
+ libmtd
+
+The mtd_get_dev_info1 function reads (among other things) name and type
+string into coresponding struct mtd_dev_info fields.
+
+The struct mtd_dev_info has the string fields marked const, requiring
+them to be cast to non-const version during initialization.
+
+This cast was previously omitted from the dev_read_data calls,
+triggering warnings during compilation.
+
+Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+Signed-off-by: Richard Weinberger <richard@nod.at>
+
+Backported from upstream.
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ lib/libmtd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/libmtd.c b/lib/libmtd.c
+index 60b4782..5f0bcbc 100644
+--- a/lib/libmtd.c
++++ b/lib/libmtd.c
+@@ -746,13 +746,13 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
+ 	if (dev_get_major(lib, mtd_num, &mtd->major, &mtd->minor))
+ 		return -1;
+ 
+-	ret = dev_read_data(lib->mtd_name, mtd_num, &mtd->name,
++	ret = dev_read_data(lib->mtd_name, mtd_num, (char *)&mtd->name,
+ 			    MTD_NAME_MAX + 1);
+ 	if (ret < 0)
+ 		return -1;
+ 	((char *)mtd->name)[ret - 1] = '\0';
+ 
+-	ret = dev_read_data(lib->mtd_type, mtd_num, &mtd->type_str,
++	ret = dev_read_data(lib->mtd_type, mtd_num, (char *)&mtd->type_str,
+ 			    MTD_TYPE_MAX + 1);
+ 	if (ret < 0)
+ 		return -1;
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
index 518c02f..100203e 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
@@ -11,12 +11,15 @@ inherit klibc
 
 SRCREV = "aea36417067dade75192bafa03af70b6eb2677b1"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
-             file://0001-Makefile-only-build-ubi-utils.patch \
+             file://0001-Makefile-build-ubi-utils-only.patch \
              file://0002-common.mk-for-klibc-CC-is-klcc.patch \
-             file://0003-libubi.c-add-klibc-specific-fixes.patch \
-             file://0004-common.h-klibc-fixes-1.patch \
-             file://0005-common.h-klibc-fixes-2.patch \
+             file://0003-libubi.c-add-klibc-specific-fixes-for-ioctl.patch \
+             file://0004-Restore-compatibility-to-dietlibc-klibc-musl-libc-af.patch \
+             file://0005-common.h-more-workarounds-for-klibc-compatibility.patch \
              file://0006-libiniparser-remove-unused-function-needing-float.patch \
+             file://0007-mtd-utils-common.c-convert-to-integer-arithmetic.patch \
+             file://0008-mtd-utils-improve-compatibility-with-klibc.patch \
+             file://0009-Eliminate-warnings-about-implicit-non-const-casting-.patch \
              "
 
 S = "${WORKDIR}/git/"
-- 
2.7.4


