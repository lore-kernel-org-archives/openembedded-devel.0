Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30C2D5B169
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 20:33:32 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12882.1765658004919223290
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Dec 2025 12:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GsbMgCCY;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297e264528aso24676975ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 12:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765658004; x=1766262804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXsZUrENGDHquFVAmTqlOSAZSZHYiDP+n3ZXYOsJW5c=;
        b=GsbMgCCYpR9wAOY+SETpkrRCPYxAR0USlXqST1XUBd06ZJop1nf0rO1d3n+t5Dqb+H
         En8cpZWZjjrOgHMx7Jtfbx08CmhaDoDsaONaA0yAO1ykMT62yoDZ+52cnUUv3kYYRXgy
         nFTyQrHjEnc5ZorJWGd0NLK7s2Lh4xq14/sx6ZEbDlvFFEYqmXYasXAlCT8wdTeYqU8i
         451F9kx/QGv+ZKKL+Qrls3WNeNyd5X41Qr6QPbpnvhIZvDHJqw6346dCVkuQkbhYWKg3
         i4wslEZcgNb1qT0NEx0EjLMoqVZn7XJqwt2sEkFCe8uzfwnySIeEty469B3dKvFKRfdn
         4vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765658004; x=1766262804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXsZUrENGDHquFVAmTqlOSAZSZHYiDP+n3ZXYOsJW5c=;
        b=ddK15n6RPyRKIwp3mQ0QaIm+jPF0mZR/W2le4L/PzBOHQYRf4/0bBfvEyNVep7xlyP
         bCGSHIoqQdf7JDcCFmHYbwvZBkijRbySE6e/v1fA3lY/XX3tKXulGJG1BZQX58bNizV9
         OSyFi6M02+8x617NHCTKmV8x5Y8WTDoymz/fhUzhi6/s9+mttru8B2B0FzV4h2RuC44z
         7G+udCOcp15sBi3z+TeTVoAfBWZJS4T8Rxd/74YG75FqY3sb5Wzxp444FyscR4HnSdFi
         GMnaE0Y+nsA9nXZwv476Pivh0GstRJjtBjuL/N7k7OWbYyLg+pX1rTGsh0aVyqR0SEYB
         0h7Q==
X-Gm-Message-State: AOJu0YzJizRNi3mcJR7AuOagVjXJewbv7bsiDgL+jsTWcB3l+bRks9jE
	NL3JSDY++5N572m769fGFP/4xoIVA515SGl/vlTRD6V9QJRLvXFkORO1BttODpil
X-Gm-Gg: AY/fxX4hGhckLfkrp8VEsQUa43fVJB+97YJgu4Aiwp1DzbUvAawWxRUfH9gGHT4zZZU
	raREMI2a9jclcR3uAUrl8WC8LQwM0Zp0PgO/NtgeC46el7f5bdr88GX9c30en4/cb/1xp5MgpmL
	5sDlj+G5i3cO9Sr0sRBzxulYmYzVq3AI472AsZmej9t+Q0NlgUYAt0M2oIMrfLoYvMO53Bpb8DW
	UeYzM378yby+Lu5uOvvRHVLbZLc1N89N5e5b3Wyef1PPCiiWGyZoxYh2HSuzhDZCoua+V7BBqoY
	ShWy4FTOaw/0zzTg4OQN208bM/xHI8mB8WJb2v9OSlTz+CbbuGdcog7Yrh5MClXtz0PXvCGroWe
	8Ch2tw9y330lR5ny0zb/rK8C5cFMWBS45zWKVNNiU5xOEFQbZ6wO2hBSSqn4l8cCEIhNefDvA9s
	DNSDT8HvPUhG5qfsQDuqRBFxepoyaj9xSz0ErTQ/SQ0AUBj/5AL896I32uDxJI8/oegUsZmcBHB
	rI8B7LRrHuIe2guLN4fYKAieIoEoWcR
X-Google-Smtp-Source: AGHT+IEahzp4RHXds1QroPEsW6bBo0LDVjmciOPY1ocvbX6tCTaZSMQEA3Qu8jjSeABzsuiiIiaqpw==
X-Received: by 2002:a05:7022:f514:b0:119:e56b:989d with SMTP id a92af1059eb24-11f349a2572mr3175071c88.4.1765658002806;
        Sat, 13 Dec 2025 12:33:22 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm27475821c88.8.2025.12.13.12.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:33:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: Update to latest 2.0.32 release
Date: Sat, 13 Dec 2025 12:33:19 -0800
Message-ID: <20251213203319.1251742-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 20:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122646

Add riscv64 support
Rework klibc support patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 .../0001-force-static-build.patch             |   2 -
 ...cal-implementation-of-mkstemp-for-kl.patch | 118 ++++++++++++++++++
 ...der-of-headers-to-fix-build-for-musl.patch |   4 +-
 ...xdiv-implementation-for-klibc-builds.patch |  48 +++++++
 .../0003-kexec-elf-rel-use-our-elf.h.patch    |  12 --
 ...endian-conversion-macros-for-klibc-b.patch |  70 +++++++++++
 ...xec-Define-EM_RISCV-for-klibc-builds.patch |  36 ++++++
 ...ec-elf-exec.c-replace-with-our-err.h.patch |   2 -
 ...work-around-for-sysconf-_SC_NPROCESS.patch |   2 -
 ...isable-memfd_create-for-klibc-builds.patch |  44 +++++++
 ...-work-around-missing-syscall-wrapper.patch |   8 +-
 ...007-kexec.c-add-guard-around-ENOTSUP.patch |  29 ++---
 ...-kexec.c-replace-mising-BLKGETSIZE64.patch |   6 +-
 ...-dmesg.c-work-around-missing-imaxdiv.patch |  57 ---------
 ...-fs2dt.c-work-around-missing-getline.patch |   6 +-
 ...011-purgatory-Makefile-adapt-to-klcc.patch |   8 +-
 ...string.c-avoid-inclusion-of-string.h.patch |   2 -
 ...256.h-avoid-inclusion-of-sys-types.h.patch |   2 -
 .../0014-add-if_nameindex-from-musl.patch     |  12 +-
 .../0015-vmcore-dmesg-fix-warning.patch       |  29 -----
 ...uilding-on-x86_64-with-binutils-2.41.patch |  95 --------------
 .../arm_crashdump-fix-buffer-align.patch      |  44 -------
 .../kexec-tools-klibc/include_next.patch      |   2 +-
 .../kexec/kexec-tools-klibc/kexec-x32.patch   |  94 --------------
 .../kexec-tools-klibc/klibc-reboot.patch      |  71 +++++++++--
 ...powerpc_change-the-memory-size-limit.patch |   2 -
 .../kexec/kexec-tools-klibc_git.bb            |  21 ++--
 27 files changed, 418 insertions(+), 408 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-kexec-Provide-local-implementation-of-mkstemp-for-kl.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-kexec-Add-imaxdiv-implementation-for-klibc-builds.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-riscv-Add-endian-conversion-macros-for-klibc-b.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-exec-Define-EM_RISCV-for-klibc-builds.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-kexec-Disable-memfd_create-for-klibc-builds.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/Fix-building-on-x86_64-with-binutils-2.41.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch
index 34826baed9..843ce3c881 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch
@@ -10,8 +10,6 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-diff --git a/Makefile.in b/Makefile.in
-index fb01134..dbf1fb6 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -47,7 +47,7 @@ TARGET_CFLAGS	= @TARGET_CFLAGS@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-kexec-Provide-local-implementation-of-mkstemp-for-kl.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-kexec-Provide-local-implementation-of-mkstemp-for-kl.patch
new file mode 100644
index 0000000000..93c7124e52
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-kexec-Provide-local-implementation-of-mkstemp-for-kl.patch
@@ -0,0 +1,118 @@
+From 24c140dee30304668ecc829ed8a672f3439f4f1c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Dec 2025 11:24:10 -0800
+Subject: [PATCH 1/5] kexec: Provide local implementation of mkstemp for klibc
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec/kexec-pe-zboot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
+ kexec/kexec-uki.c      | 42 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 84 insertions(+)
+
+diff --git a/kexec/kexec-pe-zboot.c b/kexec/kexec-pe-zboot.c
+index c09f2ae..fd86820 100644
+--- a/kexec/kexec-pe-zboot.c
++++ b/kexec/kexec-pe-zboot.c
+@@ -29,6 +29,48 @@
+ #include <fcntl.h>
+ #include "kexec.h"
+ #include <pe.h>
++#ifdef __KLIBC__
++/* klibc doesn't provide mkstemp(), implement a simple version */
++#include <string.h>
++#include <errno.h>
++#include <time.h>
++
++static int mkstemp(char *template)
++{
++	char *p;
++	int len, fd;
++	unsigned long val;
++	unsigned int n;
++
++	if (!template) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	len = strlen(template);
++	if (len < 6) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	p = template + len - 6;
++	if (strcmp(p, "XXXXXX") != 0) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	val = ((unsigned long)getpid() << 16) ^ (unsigned long)time(NULL);
++
++	for (n = 0; n < 100; n++) {
++		snprintf(p, 7, "%06lu", (val + n) % 1000000);
++		fd = open(template, O_RDWR | O_CREAT | O_EXCL, 0600);
++		if (fd >= 0 || errno != EEXIST)
++			return fd;
++	}
++	return -1;
++}
++#endif /* __KLIBC__ */
++
+ #include <kexec-pe-zboot.h>
+
+ #define FILENAME_IMAGE		"/tmp/ImageXXXXXX"
+diff --git a/kexec/kexec-uki.c b/kexec/kexec-uki.c
+index 9888d7e..ecd3f17 100644
+--- a/kexec/kexec-uki.c
++++ b/kexec/kexec-uki.c
+@@ -20,6 +20,48 @@
+ static int embeded_linux_format_index = -1;
+ static int kernel_fd = -1;
+
++#ifdef __KLIBC__
++/* klibc doesn't provide mkstemp(), implement a simple version */
++#include <string.h>
++#include <errno.h>
++#include <time.h>
++
++static int mkstemp(char *template)
++{
++	char *p;
++	int len, fd;
++	unsigned long val;
++	unsigned int n;
++
++	if (!template) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	len = strlen(template);
++	if (len < 6) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	p = template + len - 6;
++	if (strcmp(p, "XXXXXX") != 0) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	val = ((unsigned long)getpid() << 16) ^ (unsigned long)time(NULL);
++
++	for (n = 0; n < 100; n++) {
++		snprintf(p, 7, "%06lu", (val + n) % 1000000);
++		fd = open(template, O_RDWR | O_CREAT | O_EXCL, 0600);
++		if (fd >= 0 || errno != EEXIST)
++			return fd;
++	}
++	return -1;
++}
++#endif /* __KLIBC__ */
++
+ static int create_tmpfd(const char *template, char *buf, int buf_sz, int *tmpfd)
+ {
+ 	char *fname;
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
index ec456f382b..a02e9306bb 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
@@ -13,11 +13,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  kexec/ifdown.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-diff --git a/kexec/ifdown.c b/kexec/ifdown.c
-index 9679ad7..82c6141 100644
 --- a/kexec/ifdown.c
 +++ b/kexec/ifdown.c
-@@ -16,8 +16,8 @@ char *v_ifdown = "@(#)ifdown.c  1.11  02-Jun-1998  miquels@cistron.nl";
+@@ -16,8 +16,8 @@ char *v_ifdown = "@(#)ifdown.c  1.11  02
  #include <sys/socket.h>
  #include <sys/time.h>

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-kexec-Add-imaxdiv-implementation-for-klibc-builds.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-kexec-Add-imaxdiv-implementation-for-klibc-builds.patch
new file mode 100644
index 0000000000..b19281eed9
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-kexec-Add-imaxdiv-implementation-for-klibc-builds.patch
@@ -0,0 +1,48 @@
+From 47bad82779f7fcd46b8a269cfe9a99f8ef34d317 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Dec 2025 12:13:08 -0800
+Subject: [PATCH 2/5] kexec: Add imaxdiv implementation for klibc builds
+
+klibc doesn't provide the imaxdiv_t structure or imaxdiv() function
+from inttypes.h. Add a simple inline implementation when building
+with klibc.
+
+The imaxdiv() function computes the quotient and remainder of the
+division of numer by denom, which is required for standard C99
+compliance but missing in minimal libc implementations.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util_lib/include/elf_info.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/util_lib/include/elf_info.h b/util_lib/include/elf_info.h
+index fdf4c3d..9338205 100644
+--- a/util_lib/include/elf_info.h
++++ b/util_lib/include/elf_info.h
+@@ -22,7 +22,23 @@
+ #include <stdbool.h>
+ #include <inttypes.h>
+ #include <ctype.h>
++#ifdef __KLIBC__
++/* klibc doesn't provide imaxdiv_t or imaxdiv() */
++#include <inttypes.h>
++
++typedef struct {
++    intmax_t quot;  /* Quotient */
++    intmax_t rem;   /* Remainder */
++} imaxdiv_t;
+
++static inline imaxdiv_t imaxdiv(intmax_t numer, intmax_t denom)
++{
++    imaxdiv_t result;
++    result.quot = numer / denom;
++    result.rem = numer % denom;
++    return result;
++}
++#endif /* __KLIBC__ */
+ int get_pt_load(int idx,
+ 	unsigned long long *phys_start,
+ 	unsigned long long *phys_end,
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch
index 32035ca128..b7a71aaac3 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch
@@ -22,8 +22,6 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  kexec/kexec-elf-rel.c                    | 2 +-
  6 files changed, 6 insertions(+), 6 deletions(-)

-diff --git a/kexec/arch/arm/kexec-elf-rel-arm.c b/kexec/arch/arm/kexec-elf-rel-arm.c
-index a939cf4..2551dc0 100644
 --- a/kexec/arch/arm/kexec-elf-rel-arm.c
 +++ b/kexec/arch/arm/kexec-elf-rel-arm.c
 @@ -1,5 +1,5 @@
@@ -33,8 +31,6 @@ index a939cf4..2551dc0 100644
  #include "../../kexec.h"
  #include "../../kexec-elf.h"

-diff --git a/kexec/arch/i386/kexec-elf-rel-x86.c b/kexec/arch/i386/kexec-elf-rel-x86.c
-index 55a214e..e7583d1 100644
 --- a/kexec/arch/i386/kexec-elf-rel-x86.c
 +++ b/kexec/arch/i386/kexec-elf-rel-x86.c
 @@ -1,5 +1,5 @@
@@ -44,8 +40,6 @@ index 55a214e..e7583d1 100644
  #include "../../kexec.h"
  #include "../../kexec-elf.h"

-diff --git a/kexec/arch/ppc/kexec-elf-rel-ppc.c b/kexec/arch/ppc/kexec-elf-rel-ppc.c
-index 1acbd86..a60c66c 100644
 --- a/kexec/arch/ppc/kexec-elf-rel-ppc.c
 +++ b/kexec/arch/ppc/kexec-elf-rel-ppc.c
 @@ -1,5 +1,5 @@
@@ -55,8 +49,6 @@ index 1acbd86..a60c66c 100644
  #include "../../kexec.h"
  #include "../../kexec-elf.h"

-diff --git a/kexec/arch/ppc64/kexec-elf-rel-ppc64.c b/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
-index 51b1354..c85f421 100644
 --- a/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
 +++ b/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
 @@ -1,5 +1,5 @@
@@ -66,8 +58,6 @@ index 51b1354..c85f421 100644
  #include <string.h>
  #include "../../kexec.h"
  #include "../../kexec-elf.h"
-diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-index db85b44..761a4ed 100644
 --- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
 +++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
 @@ -1,5 +1,5 @@
@@ -77,8 +67,6 @@ index db85b44..761a4ed 100644
  #include "../../kexec.h"
  #include "../../kexec-elf.h"

-diff --git a/kexec/kexec-elf-rel.c b/kexec/kexec-elf-rel.c
-index 9a6e63d..a856636 100644
 --- a/kexec/kexec-elf-rel.c
 +++ b/kexec/kexec-elf-rel.c
 @@ -4,7 +4,7 @@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-riscv-Add-endian-conversion-macros-for-klibc-b.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-riscv-Add-endian-conversion-macros-for-klibc-b.patch
new file mode 100644
index 0000000000..9719dc1ce1
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-riscv-Add-endian-conversion-macros-for-klibc-b.patch
@@ -0,0 +1,70 @@
+From 5054d110fbc05141e0c2287ba19676e7c1e0286e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Dec 2025 12:14:54 -0800
+Subject: [PATCH 3/5] kexec/riscv: Add endian conversion macros for klibc
+ builds
+
+klibc doesn't provide the standard endian conversion functions
+(le16toh, le32toh, le64toh, htole*, be*toh, htobe*) that are
+normally available in glibc's endian.h.
+
+Add macro implementations for these functions when building with
+klibc, using the existing bswap_* functions from byteswap.h for
+byte swapping when needed based on the host byte order.
+
+This fixes build errors when using RISC-V image headers with klibc.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec/arch/riscv/image-header.h | 36 +++++++++++++++++++++++++++++++++
+ 1 file changed, 36 insertions(+)
+
+diff --git a/kexec/arch/riscv/image-header.h b/kexec/arch/riscv/image-header.h
+index a677546..892f77f 100644
+--- a/kexec/arch/riscv/image-header.h
++++ b/kexec/arch/riscv/image-header.h
+@@ -9,6 +9,42 @@
+ #include <endian.h>
+ #include <stdint.h>
+
++#ifdef __KLIBC__
++#include <byteswap.h>
++
++/* klibc doesn't provide endian conversion functions, define them */
++#ifndef le64toh
++# if __BYTE_ORDER == __LITTLE_ENDIAN
++#  define le16toh(x) ((uint16_t)(x))
++#  define le32toh(x) ((uint32_t)(x))
++#  define le64toh(x) ((uint64_t)(x))
++#  define htole16(x) ((uint16_t)(x))
++#  define htole32(x) ((uint32_t)(x))
++#  define htole64(x) ((uint64_t)(x))
++#  define be16toh(x) bswap_16(x)
++#  define be32toh(x) bswap_32(x)
++#  define be64toh(x) bswap_64(x)
++#  define htobe16(x) bswap_16(x)
++#  define htobe32(x) bswap_32(x)
++#  define htobe64(x) bswap_64(x)
++# elif __BYTE_ORDER == __BIG_ENDIAN
++#  define le16toh(x) bswap_16(x)
++#  define le32toh(x) bswap_32(x)
++#  define le64toh(x) bswap_64(x)
++#  define htole16(x) bswap_16(x)
++#  define htole32(x) bswap_32(x)
++#  define htole64(x) bswap_64(x)
++#  define be16toh(x) ((uint16_t)(x))
++#  define be32toh(x) ((uint32_t)(x))
++#  define be64toh(x) ((uint64_t)(x))
++#  define htobe16(x) ((uint16_t)(x))
++#  define htobe32(x) ((uint32_t)(x))
++#  define htobe64(x) ((uint64_t)(x))
++# else
++#  error "Unknown byte order"
++# endif
++#endif /* le64toh */
++#endif /* __KLIBC__ */
+ /**
+  * struct riscv_image_header - riscv kernel image header.
+  *
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-exec-Define-EM_RISCV-for-klibc-builds.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-exec-Define-EM_RISCV-for-klibc-builds.patch
new file mode 100644
index 0000000000..9bba417ac9
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-exec-Define-EM_RISCV-for-klibc-builds.patch
@@ -0,0 +1,36 @@
+From c71b58dd324a29f2d157eb9d07f5a05bee0518f6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Dec 2025 12:16:00 -0800
+Subject: [PATCH 4/5] exec: Define EM_RISCV for klibc builds
+
+klibc's elf.h header doesn't define the EM_RISCV machine type
+constant. Add a fallback definition when building with klibc to
+support RISC-V architecture.
+
+EM_RISCV (243) is the official ELF machine type for RISC-V as
+defined in the ELF specification.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec/kexec-elf.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/kexec/kexec-elf.h b/kexec/kexec-elf.h
+index 1e512c8..af3fc55 100644
+--- a/kexec/kexec-elf.h
++++ b/kexec/kexec-elf.h
+@@ -4,6 +4,13 @@
+ #include <stdint.h>
+ #include <sys/types.h>
+
++/* klibc provided elf.h does not yet have this definition and its preferred in includes
++ * when building for klibc
++ */
++#ifndef EM_RISCV
++#define EM_RISCV	243		/* RISC-V */
++#endif
++
+ struct kexec_info;
+
+ struct mem_ehdr {
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch
index 27a1cc7a56..c4ffe1403e 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch
@@ -15,8 +15,6 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  kexec/kexec-elf-exec.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-diff --git a/kexec/kexec-elf-exec.c b/kexec/kexec-elf-exec.c
-index a9329ac..0dd0700 100644
 --- a/kexec/kexec-elf-exec.c
 +++ b/kexec/kexec-elf-exec.c
 @@ -4,7 +4,7 @@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch
index 4604c2a5b7..b01b07b417 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch
@@ -21,8 +21,6 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  kexec/crashdump-elf.c | 92 +++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 92 insertions(+)

-diff --git a/kexec/crashdump-elf.c b/kexec/crashdump-elf.c
-index b8bb686..7e6767c 100644
 --- a/kexec/crashdump-elf.c
 +++ b/kexec/crashdump-elf.c
 @@ -25,6 +25,94 @@ do {									\
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-kexec-Disable-memfd_create-for-klibc-builds.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-kexec-Disable-memfd_create-for-klibc-builds.patch
new file mode 100644
index 0000000000..523a12aaca
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-kexec-Disable-memfd_create-for-klibc-builds.patch
@@ -0,0 +1,44 @@
+From b0792ce24c28abb88835c3e0d77cfd8d24da1131 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Dec 2025 12:19:14 -0800
+Subject: [PATCH 5/5] kexec: Disable memfd_create for klibc builds
+
+klibc doesn't provide the syscall() wrapper function needed to
+invoke the memfd_create system call. Since klibc is typically used
+for minimal early-boot environments where memfd_create is not
+essential for kexec functionality, return ENOSYS to allow kexec
+to fall back to alternative methods.
+
+This fixes the build error:
+  error: call to undeclared function 'syscall'
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec/kexec.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/kexec/kexec.c b/kexec/kexec.c
+index c9e4bcb..1fd2062 100644
+--- a/kexec/kexec.c
++++ b/kexec/kexec.c
+@@ -649,11 +649,16 @@ char *slurp_decompress_file(const char *filename, off_t *r_size)
+ 	}
+ 	return kernel_buf;
+ }
+-
+ #ifndef HAVE_MEMFD_CREATE
+ static int memfd_create(const char *name, unsigned int flags)
+ {
+-	return syscall(SYS_memfd_create, name, flags);
++#ifdef __KLIBC__
++/* klibc doesn't provide syscall() or memfd_create */
++		errno = ENOSYS;
++		return -1;
++#else
++     return syscall(SYS_memfd_create, name, flags);
++#endif
+ }
+ #endif
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
index a607ce777e..28b0de1377 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
@@ -15,11 +15,9 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  kexec/kexec-syscall.h | 21 +++++++++++++++++++++
  1 file changed, 21 insertions(+)

-diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
-index b96e02a..2a3794d 100644
 --- a/kexec/kexec-syscall.h
 +++ b/kexec/kexec-syscall.h
-@@ -77,11 +77,16 @@
+@@ -96,11 +96,16 @@

  struct kexec_segment;

@@ -36,7 +34,7 @@ index b96e02a..2a3794d 100644

  static inline int is_kexec_file_load_implemented(void) {
  	if (__NR_kexec_file_load != 0xffffffff)
-@@ -89,6 +94,21 @@ static inline int is_kexec_file_load_implemented(void) {
+@@ -108,6 +113,21 @@ static inline int is_kexec_file_load_imp
  	return 0;
  }

@@ -58,7 +56,7 @@ index b96e02a..2a3794d 100644
  static inline long kexec_file_load(int kernel_fd, int initrd_fd,
  			unsigned long cmdline_len, const char *cmdline_ptr,
  			unsigned long flags)
-@@ -96,6 +116,7 @@ static inline long kexec_file_load(int kernel_fd, int initrd_fd,
+@@ -115,6 +135,7 @@ static inline long kexec_file_load(int k
  	return (long) syscall(__NR_kexec_file_load, kernel_fd, initrd_fd,
  				cmdline_len, cmdline_ptr, flags);
  }
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch
index 0ae90016d0..76bb1c5e69 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch
@@ -15,23 +15,20 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  kexec/kexec.c | 2 ++
  1 file changed, 2 insertions(+)

-diff --git a/kexec/kexec.c b/kexec/kexec.c
-index 32ae56c..0764e85 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
-@@ -1517,6 +1517,7 @@ int main(int argc, char *argv[])
- 					 */
- 				case -EINVAL:
- 				case -ENOEXEC:
+@@ -1421,12 +1421,14 @@ static int do_kexec_file_load(int filein
+ 			 */
+ 		case EINVAL:
+ 		case ENOEXEC:
 +#ifndef __KLIBC__
- 					 /*
- 					  * ENOTSUP can be unsupported image
- 					  * type or unsupported PE signature
-@@ -1529,6 +1530,7 @@ int main(int argc, char *argv[])
- 					  * kernel bug
- 					  */
- 				case -ENOTSUP:
+ 			/*
+ 			 * ENOTSUP can be unsupported image
+ 			 * type or unsupported PE signature
+ 			 * wrapper type, duh.
+ 			 */
+ 		case ENOTSUP:
 +#endif
- 					do_kexec_file_syscall = 0;
- 					break;
- 			}
+ 			ret = EFALLBACK;
+ 			break;
+ 		}
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch
index 0ab7a1d71e..bb34157559 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch
@@ -15,11 +15,9 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  kexec/kexec.c | 4 ++++
  1 file changed, 4 insertions(+)

-diff --git a/kexec/kexec.c b/kexec/kexec.c
-index 0764e85..157c577 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
-@@ -55,6 +55,10 @@
+@@ -61,6 +61,10 @@
  #define KEXEC_LOADED_PATH "/sys/kernel/kexec_loaded"
  #define KEXEC_CRASH_LOADED_PATH "/sys/kernel/kexec_crash_loaded"

@@ -29,4 +27,4 @@ index 0764e85..157c577 100644
 +
  unsigned long long mem_min = 0;
  unsigned long long mem_max = ULONG_MAX;
- static unsigned long kexec_flags = 0;
+ unsigned long elfcorehdrsz = 0;
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch
deleted file mode 100644
index 8bc473cb00..0000000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 20e2c61fc04a291250acee649c2523d2546cedea Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Tue, 17 Apr 2018 13:14:12 +0200
-Subject: [PATCH] vmcore-dmesg.c: work around missing imaxdiv()
-
-Convert to integer arithmetic for klibc.
-
-Fix
-
- vmcore-dmesg.c: In function 'dump_dmesg_structured':
- vmcore-dmesg.c:578:2: error: unknown type name 'imaxdiv_t'
-
-Upstream-Status: Inappropriate [klibc specific]
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
----
- vmcore-dmesg/vmcore-dmesg.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
-index 7972788..c63ac4f 100644
---- a/vmcore-dmesg/vmcore-dmesg.c
-+++ b/vmcore-dmesg/vmcore-dmesg.c
-@@ -575,8 +575,11 @@ static void dump_dmesg_structured(int fd)
- 	ssize_t ret;
- 	char *msg;
- 	uint16_t text_len;
-+#ifndef __KLIBC__
- 	imaxdiv_t imaxdiv_sec, imaxdiv_usec;
--
-+#else
-+	int64_t imaxdiv_sec, imaxdiv_usec;
-+#endif
- 	if (!log_buf_vaddr) {
- 		fprintf(stderr, "Missing the log_buf symbol\n");
- 		exit(60);
-@@ -645,12 +648,20 @@ static void dump_dmesg_structured(int fd)
- 			exit(65);
- 		}
- 		ts_nsec = struct_val_u64(buf, log_offset_ts_nsec);
-+#ifndef __KLIBC__
- 		imaxdiv_sec = imaxdiv(ts_nsec, 1000000000);
- 		imaxdiv_usec = imaxdiv(imaxdiv_sec.rem, 1000);
-
- 		len += sprintf(out_buf + len, "[%5llu.%06llu] ",
- 			(long long unsigned int)imaxdiv_sec.quot,
- 			(long long unsigned int)imaxdiv_usec.quot);
-+#else
-+		imaxdiv_sec = ts_nsec / 1000000000;
-+		imaxdiv_usec = (ts_nsec % 1000000000) / 1000;
-+		len += sprintf(out_buf + len, "[%5llu.%06llu] ",
-+			(long long unsigned int)imaxdiv_sec,
-+			(long long unsigned int)imaxdiv_usec);
-+#endif
-
- 		/* escape non-printable characters */
- 		text_len = struct_val_u16(buf, log_offset_text_len);
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch
index 4652f10a6e..6c960e671a 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch
@@ -17,11 +17,9 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  kexec/fs2dt.c | 8 ++++++++
  1 file changed, 8 insertions(+)

-diff --git a/kexec/fs2dt.c b/kexec/fs2dt.c
-index 07a5e2f..d635636 100644
 --- a/kexec/fs2dt.c
 +++ b/kexec/fs2dt.c
-@@ -531,6 +531,9 @@ static void dt_copy_old_root_param(void)
+@@ -532,6 +532,9 @@ static void dt_copy_old_root_param(void)
  	char *last_cmdline = NULL;
  	char *p, *old_param;
  	size_t len = 0;
@@ -31,7 +29,7 @@ index 07a5e2f..d635636 100644

  	strcpy(filename, pathname);
  	strcat(filename, "bootargs");
-@@ -538,8 +541,13 @@ static void dt_copy_old_root_param(void)
+@@ -539,8 +542,13 @@ static void dt_copy_old_root_param(void)
  	if (!fp)
  		return;

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
index 07fa841ccc..c591923c2d 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
@@ -12,16 +12,16 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
-@@ -47,7 +47,7 @@ purgatory/sha256.o: $(srcdir)/util_lib/s
+@@ -49,7 +49,7 @@ purgatory/sha256.o: $(srcdir)/util_lib/s
  $(PURGATORY): CC=$(TARGET_CC)
- $(PURGATORY): CFLAGS+=$(PURGATORY_EXTRA_CFLAGS) \
+ $(PURGATORY): CFLAGS=$(PURGATORY_EXTRA_CFLAGS) \
  		      $($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
 -		      -Os -fno-builtin -ffreestanding \
 +		      -Os -fno-builtin -ffreestanding -nostdinc \
  		      -fno-zero-initialized-in-bss \
- 		      -fno-PIC -fno-PIE -fno-stack-protector
+ 		      -fno-PIC -fno-PIE -fno-stack-protector -fno-tree-vectorize

-@@ -59,8 +59,8 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATO
+@@ -61,8 +61,8 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATO
  			-Iinclude \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch
index db0d763178..93ac0908c3 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch
@@ -14,8 +14,6 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  purgatory/string.c | 2 ++
  1 file changed, 2 insertions(+)

-diff --git a/purgatory/string.c b/purgatory/string.c
-index f06c460..c5e978a 100644
 --- a/purgatory/string.c
 +++ b/purgatory/string.c
 @@ -1,5 +1,7 @@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch
index 777cbcf94f..b7c4d7d8e2 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch
@@ -15,8 +15,6 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  util_lib/include/sha256.h | 4 ++++
  1 file changed, 4 insertions(+)

-diff --git a/util_lib/include/sha256.h b/util_lib/include/sha256.h
-index 467fb22..40fd3ed 100644
 --- a/util_lib/include/sha256.h
 +++ b/util_lib/include/sha256.h
 @@ -1,7 +1,11 @@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
index eca01b956c..738623f0dd 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
@@ -32,8 +32,6 @@ Upstream-Status: Pending
  create mode 100644 kexec/if_nameindex.c
  create mode 100644 kexec/if_nameindex.h

-diff --git a/kexec/Makefile b/kexec/Makefile
-index 4db84d8..fb7520b 100644
 --- a/kexec/Makefile
 +++ b/kexec/Makefile
 @@ -11,7 +11,7 @@ KEXEC_SRCS = $(KEXEC_SRCS_base)
@@ -45,9 +43,6 @@ index 4db84d8..fb7520b 100644
  KEXEC_SRCS_base += kexec/kexec-elf.c
  KEXEC_SRCS_base += kexec/kexec-elf-exec.c
  KEXEC_SRCS_base += kexec/kexec-elf-core.c
-diff --git a/kexec/if_nameindex.c b/kexec/if_nameindex.c
-new file mode 100644
-index 0000000..e586e41
 --- /dev/null
 +++ b/kexec/if_nameindex.c
 @@ -0,0 +1,64 @@
@@ -115,9 +110,6 @@ index 0000000..e586e41
 +	errno = ENOBUFS;
 +	return p;
 +}
-diff --git a/kexec/if_nameindex.h b/kexec/if_nameindex.h
-new file mode 100644
-index 0000000..cf1c061
 --- /dev/null
 +++ b/kexec/if_nameindex.h
 @@ -0,0 +1,15 @@
@@ -136,11 +128,9 @@ index 0000000..cf1c061
 +void if_freenameindex (struct if_nameindex *);
 +
 +#endif
-diff --git a/kexec/ifdown.c b/kexec/ifdown.c
-index 82c6141..cc3ca9f 100644
 --- a/kexec/ifdown.c
 +++ b/kexec/ifdown.c
-@@ -18,6 +18,9 @@ char *v_ifdown = "@(#)ifdown.c  1.11  02-Jun-1998  miquels@cistron.nl";
+@@ -18,6 +18,9 @@ char *v_ifdown = "@(#)ifdown.c  1.11  02

  #include <netinet/in.h>
  #include <net/if.h>
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
deleted file mode 100644
index 044a70d93b..0000000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a2679731a56748de58a4cf0a46b7a15d75543a88 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 29 Apr 2018 00:52:31 +0200
-Subject: [PATCH] vmcore-dmesg: fix warning
-
- # define __bitwise
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
----
-Upstream-Status: Pending
-
- vmcore-dmesg/vmcore-dmesg.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
-index c63ac4f..a4e3014 100644
---- a/vmcore-dmesg/vmcore-dmesg.c
-+++ b/vmcore-dmesg/vmcore-dmesg.c
-@@ -2,6 +2,9 @@
- #define _GNU_SOURCE
- #define _LARGEFILE_SOURCE 1
- #define _FILE_OFFSET_BITS 64
-+#ifdef __KLIBC__
-+#include <sys/types.h>
-+#endif
- #include <endian.h>
- #include <byteswap.h>
- #include <stdio.h>
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/Fix-building-on-x86_64-with-binutils-2.41.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/Fix-building-on-x86_64-with-binutils-2.41.patch
deleted file mode 100644
index 4894f044fc..0000000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/Fix-building-on-x86_64-with-binutils-2.41.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michel Lind <salimma@fedoraproject.org>
-Date: Tue, 30 Jan 2024 04:14:31 -0600
-Subject: [PATCH] Fix building on x86_64 with binutils 2.41
-
-Newer versions of the GNU assembler (observed with binutils 2.41) will
-complain about the ".arch i386" in files assembled with "as --64",
-with the message "Error: 64bit mode not supported on 'i386'".
-
-Fix by moving ".arch i386" below the relevant ".code32" directive, so
-that the assembler is no longer expecting 64-bit instructions to be used
-by the time that the ".arch i386" directive is encountered.
-
-Based on similar iPXE fix:
-https://github.com/ipxe/ipxe/commit/6ca597eee
-
-Signed-off-by: Michel Lind <michel@michel-slm.name>
-Signed-off-by: Simon Horman <horms@kernel.org>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?h=main&id=328de8e00e298f00d7ba6b25dc3950147e9642e6]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- purgatory/arch/i386/entry32-16-debug.S | 2 +-
- purgatory/arch/i386/entry32-16.S       | 2 +-
- purgatory/arch/i386/entry32.S          | 2 +-
- purgatory/arch/i386/setup-x86.S        | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
-index 5167944..12e1164 100644
---- a/purgatory/arch/i386/entry32-16-debug.S
-+++ b/purgatory/arch/i386/entry32-16-debug.S
-@@ -25,10 +25,10 @@
- 	.globl entry16_debug_pre32
- 	.globl entry16_debug_first32
- 	.globl entry16_debug_old_first32
--	.arch i386
- 	.balign 16
- entry16_debug:
- 	.code32
-+	.arch i386
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
-diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
-index c051aab..eace095 100644
---- a/purgatory/arch/i386/entry32-16.S
-+++ b/purgatory/arch/i386/entry32-16.S
-@@ -20,10 +20,10 @@
- #undef i386
- 	.text
- 	.globl entry16, entry16_regs
--	.arch i386
- 	.balign 16
- entry16:
- 	.code32
-+	.arch i386
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
-diff --git a/purgatory/arch/i386/entry32.S b/purgatory/arch/i386/entry32.S
-index f7a494f..8ce9e31 100644
---- a/purgatory/arch/i386/entry32.S
-+++ b/purgatory/arch/i386/entry32.S
-@@ -20,10 +20,10 @@
- #undef i386
-
- 	.text
--	.arch	i386
- 	.globl entry32, entry32_regs
- entry32:
- 	.code32
-+	.arch	i386
-
- 	/* Setup a gdt that should that is generally usefully */
- 	lgdt	%cs:gdt
-diff --git a/purgatory/arch/i386/setup-x86.S b/purgatory/arch/i386/setup-x86.S
-index 201bb2c..a212eed 100644
---- a/purgatory/arch/i386/setup-x86.S
-+++ b/purgatory/arch/i386/setup-x86.S
-@@ -21,10 +21,10 @@
- #undef i386
-
- 	.text
--	.arch	i386
- 	.globl purgatory_start
- purgatory_start:
- 	.code32
-+	.arch	i386
-
- 	/* Load a gdt so I know what the segment registers are */
- 	lgdt	%cs:gdt
---
-2.39.2
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
deleted file mode 100644
index 89a5d34c83..0000000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From edf186f45d543e318400195cc25175387ff3f5c4 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 26 Aug 2018 21:40:06 +0200
-Subject: [PATCH] arm- backport from oe-core
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
----
-Upstream-Status: Pending
-
- kexec/arch/arm/crashdump-arm.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
-index daa4788..3f72b38 100644
---- a/kexec/arch/arm/crashdump-arm.c
-+++ b/kexec/arch/arm/crashdump-arm.c
-@@ -240,6 +240,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
- 	void *buf;
- 	int err;
- 	int last_ranges;
-+	unsigned short align_bit_shift = 20;
-
- 	/*
- 	 * First fetch all the memory (RAM) ranges that we are going to pass to
-@@ -281,6 +282,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
-
- 		/* for support LPAE enabled kernel*/
- 		elf_info.class = ELFCLASS64;
-+		align_bit_shift = 21;
-
- 		err = crash_create_elf64_headers(info, &elf_info,
- 					 usablemem_rgns.ranges,
-@@ -302,8 +304,9 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
- 	 * 1MB) so that available memory passed in kernel command line will be
- 	 * aligned to 1MB. This is because kernel create_mapping() wants memory
- 	 * regions to be aligned to SECTION_SIZE.
-+	 * The SECTION_SIZE of LPAE kernel is '1UL << 21' defined in pgtable-3level.h
- 	 */
--	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << 20,
-+	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << align_bit_shift,
- 					  crash_kernel_mem.start,
- 					  crash_kernel_mem.end, -1, 0);
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch
index 29ea1d9f18..62279f9cb6 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch
@@ -2,7 +2,7 @@ Upstream-Status: Pending

 --- a/kexec/Makefile
 +++ b/kexec/Makefile
-@@ -110,7 +110,7 @@ $(KEXEC): $(KEXEC_OBJS) $(UTIL_LIB)
+@@ -116,7 +116,7 @@ $(KEXEC): $(KEXEC_OBJS) $(UTIL_LIB)
  	@$(MKDIR) -p $(@D)
  	$(LINK.o) -o $@ $^ $(CFLAGS) $(LIBS)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch
deleted file mode 100644
index 3c2594a5d0..0000000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From fd40eee42273220fb0050fe10744b10067adc0a7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Fri, 31 Aug 2018 17:31:50 +0200
-Subject: [PATCH] x86_64: Add support to build kexec-tools with x32 ABI
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Summary of changes,
-
-configure.ac: Add test for detect x32 ABI.
-purgatory/arch/x86_64/Makefile: Not use mcmodel large when
-	x32 ABI is set.
-kexec/arch/x86_64/kexec-elf-rel-x86_64.c: When x32 ABI is set
-	use ELFCLASS32 instead of ELFCLASS64.
-kexec/kexec-syscall.h: Add correct syscall number for x32 ABI.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
-
----
- configure.ac                             | 9 +++++++++
- kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 4 ++++
- kexec/kexec-syscall.h                    | 4 ++++
- purgatory/arch/x86_64/Makefile           | 4 +++-
- 4 files changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e05d601..c428146 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,6 +54,15 @@ case $target_cpu in
- 		;;
- 	ia64|x86_64|alpha|m68k )
- 		ARCH="$target_cpu"
-+
-+		dnl ---Test for x32 ABI in x86_64
-+		if test "x$ARCH" = "xx86_64" ; then
-+			AC_EGREP_CPP(x32_test,
-+			[#if defined(__x86_64__) && defined (__ILP32__)
-+				x32_test
-+			#endif
-+			], SUBARCH='x32', SUBARCH='64')
-+		fi
- 		;;
- 	* )
- 		AC_MSG_ERROR([unsupported architecture $target_cpu])
-diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-index 761a4ed..1c0e3f8 100644
---- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-+++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_ehdr *ehdr)
- 	if (ehdr->ei_data != ELFDATA2LSB) {
- 		return 0;
- 	}
-+#ifdef __ILP32__
-+	if (ehdr->ei_class != ELFCLASS32) {
-+#else
- 	if (ehdr->ei_class != ELFCLASS64) {
-+#endif
- 		return 0;
- 	}
- 	if (ehdr->e_machine != EM_X86_64) {
-diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
-index 2a3794d..3e67078 100644
---- a/kexec/kexec-syscall.h
-+++ b/kexec/kexec-syscall.h
-@@ -31,8 +31,12 @@
- #define __NR_kexec_load		268
- #endif
- #ifdef __x86_64__
-+#ifdef __ILP32__
-+#define __NR_kexec_load		528
-+#else
- #define __NR_kexec_load		246
- #endif
-+#endif
- #ifdef __s390x__
- #define __NR_kexec_load		277
- #endif
-diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Makefile
-index 7300937..4af11e4 100644
---- a/purgatory/arch/x86_64/Makefile
-+++ b/purgatory/arch/x86_64/Makefile
-@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
- x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
- x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
-
--x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
-+ifeq ($(SUBARCH),64)
-+        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
-+endif
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
index 1c58e92b35..70e9f556b6 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
@@ -8,16 +8,73 @@ Upstream-Status: Pending
  kexec/kexec.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-diff --git a/kexec/kexec.c b/kexec/kexec.c
-index 157c577..5da0d67 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
-@@ -901,7 +901,7 @@ static int my_exec(void)
- 	if (xen_present())
- 		xen_kexec_exec();
- 	else
+@@ -222,8 +222,8 @@ int sort_segments(struct kexec_info *inf
+ }
+
+ unsigned long locate_hole(struct kexec_info *info,
+-	unsigned long hole_size, unsigned long hole_align,
+-	unsigned long hole_min, unsigned long hole_max,
++	unsigned long hole_size, unsigned long hole_align,
++	unsigned long hole_min, unsigned long hole_max,
+ 	int hole_end)
+ {
+ 	int i, j;
+@@ -247,7 +247,7 @@ unsigned long locate_hole(struct kexec_i
+ 	max_mem_ranges = info->memory_ranges + info->nr_segments;
+ 	mem_range = xmalloc(max_mem_ranges *sizeof(struct memory_range));
+ 	mem_ranges = 0;
+-
++
+ 	/* Perform a merge on the 2 sorted lists of memory ranges  */
+ 	for (j = 0, i = 0; i < info->memory_ranges; i++) {
+ 		unsigned long long sstart, send;
+@@ -401,7 +401,7 @@ unsigned long add_buffer_phys_virt(struc
+ 	if (base == ULONG_MAX) {
+ 		die("locate_hole failed\n");
+ 	}
+-
++
+ 	add_segment_phys_virt(info, buf, bufsz, base, memsz, phys);
+ 	return base;
+ }
+@@ -847,7 +847,7 @@ static int my_load(const char *type, int
+ 		if (!valid_memory_segment(&info, info.segment +i)) {
+ 			fprintf(stderr, "Invalid memory segment %p - %p\n",
+ 				info.segment[i].mem,
+-				((char *)info.segment[i].mem) +
++				((char *)info.segment[i].mem) +
+ 				info.segment[i].memsz);
+ 			return -1;
+ 		}
+@@ -874,9 +874,9 @@ static int my_load(const char *type, int
+ 				    info.kexec_flags);
+ 	if (result != 0) {
+ 		/* The load failed, print some debugging information */
+-		fprintf(stderr, "kexec_load failed: %s\n",
++		fprintf(stderr, "kexec_load failed: %s\n",
+ 			strerror(errno));
+-		fprintf(stderr, "entry       = %p flags = 0x%lx\n",
++		fprintf(stderr, "entry       = %p flags = 0x%lx\n",
+ 			info.entry, info.kexec_flags);
+ 		print_segments(stderr, &info);
+ 	}
+@@ -973,9 +973,9 @@ static int my_exec(void)
+ 		if ((kexec_flags & KEXEC_LIVE_UPDATE) && !ret)
+ 			return 0;
+ 	} else
 -		reboot(LINUX_REBOOT_CMD_KEXEC);
 +		reboot(LINUX_REBOOT_CMD_KEXEC, NULL);
  	/* I have failed if I make it here */
- 	fprintf(stderr, "kexec failed: %s\n",
+-	fprintf(stderr, "kexec failed: %s\n",
++	fprintf(stderr, "kexec failed: %s\n",
  		strerror(errno));
+ 	return -1;
+ }
+@@ -1805,4 +1805,4 @@ int main(int argc, char *argv[])
+ 	fflush(stdout);
+ 	fflush(stderr);
+ 	return result;
+-}
++}
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch
index 67a3cac1fa..35d2d6ad16 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch
@@ -21,8 +21,6 @@ Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
  kexec/arch/ppc/kexec-ppc.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-diff --git a/kexec/arch/ppc/kexec-ppc.h b/kexec/arch/ppc/kexec-ppc.h
-index 04e728e..6bae9ec 100644
 --- a/kexec/arch/ppc/kexec-ppc.h
 +++ b/kexec/arch/ppc/kexec-ppc.h
 @@ -44,7 +44,7 @@ void dol_ppc_usage(void);
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 2df53ff38e..a6ef7a4d66 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -3,20 +3,19 @@ SUMMARY = "Kexec tools, statically compiled against klibc"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
-PV = "2.0.18+git"
+PV = "2.0.32"

 DEPENDS = "zlib xz"

 inherit klibc autotools siteinfo

 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git;branch=master"
-SRCREV = "5750980cdbbc33ef75bfba6660295b932376ce15"
+SRCREV = "15d78e5799eea7ec5ea9c5897ae95aaa0ce8970c"

 BUILD_PATCHES = "file://0001-force-static-build.patch \
                  file://0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch \
-                 file://Fix-building-on-x86_64-with-binutils-2.41.patch \
                  "

 KLIBC_PATCHES += " \
@@ -26,21 +25,23 @@ KLIBC_PATCHES += " \
             file://0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch \
             file://0007-kexec.c-add-guard-around-ENOTSUP.patch \
             file://0008-kexec.c-replace-mising-BLKGETSIZE64.patch \
-            file://0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch \
             file://0010-fs2dt.c-work-around-missing-getline.patch \
             file://0011-purgatory-Makefile-adapt-to-klcc.patch \
             file://0012-purgatory-string.c-avoid-inclusion-of-string.h.patch \
             file://0013-sha256.h-avoid-inclusion-of-sys-types.h.patch \
             file://0014-add-if_nameindex-from-musl.patch \
-            file://0015-vmcore-dmesg-fix-warning.patch \
             file://klibc-reboot.patch \
             file://include_next.patch \
+            file://0001-kexec-Provide-local-implementation-of-mkstemp-for-kl.patch \
+            file://0002-kexec-Add-imaxdiv-implementation-for-klibc-builds.patch \
+            file://0003-kexec-riscv-Add-endian-conversion-macros-for-klibc-b.patch \
+            file://0004-exec-Define-EM_RISCV-for-klibc-builds.patch \
+            file://0005-kexec-Disable-memfd_create-for-klibc-builds.patch \
             "

 WARNING_FIXES = ""
-FROM_OE_CORE = "file://arm_crashdump-fix-buffer-align.patch \
-                file://powerpc_change-the-memory-size-limit.patch \
-                file://kexec-x32.patch"
+FROM_OE_CORE = "file://powerpc_change-the-memory-size-limit.patch \
+                "

 SRC_URI += "${BUILD_PATCHES} ${KLIBC_PATCHES} ${WARNING_FIXES} ${FROM_OE_CORE}"

@@ -91,4 +92,4 @@ FILES:vmcore-dmesg-klibc = "${sbindir}/vmcore-dmesg"

 INSANE_SKIP:${PN} = "arch"

-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*|riscv64.*)-(linux|freebsd.*)'

