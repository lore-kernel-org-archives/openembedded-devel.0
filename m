Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0947C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 03:52:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.22555.1647229955991210039
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Mar 2022 20:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KHVA07Da;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id h5so11086372plf.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Mar 2022 20:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HC81MiE8kQMDusInzL8zACXfqeqwMCtU1T5fP7+KzgE=;
        b=KHVA07DaxsxrIognOU7omVOiFCkRK30UePSZAiBn0fi8uX6Anrnqq1UwWluP+TfosB
         Y7/rRhlA46KPdmc8x8Fn5XhZHw2BpsYm67muAyAoi4Ze1yu4He3/bxs/djEZfQqSPJHT
         3WfTCuXJusA6OcmlE2fG6jrdlqfMWMJrPTM+bmKg+XWAqKxq8yGhpNbX9SbKWqy5NHB4
         fpKoBah+p/rwCI/gMcPwIuyXDBZaGhwx5bVICtR99eSTGHk5OU08Kh4HDimCjoXcUm8q
         1DBFWH1RKpKCVRDIFpH4e+ae9kFVZBWezVD4KuXI6R7tBhIXZiy0GwNbX8wySdgIxgU9
         T7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HC81MiE8kQMDusInzL8zACXfqeqwMCtU1T5fP7+KzgE=;
        b=XtoQwqXvjIWlJe7SsLgakVUK0cR/+Q/ySI/Q5Ad5VCyU8PpkZJF6BLOrzrB6OEIDBC
         KZG3cskCeERwZUpQ/HLavF/DR8pvIydEiVX9c3HopDgei6Um7+4GeIg0pT6RHC1PWhha
         ko2IAX39Zt/CcqFUzXJVNl9xqUgrIt3ldXB2SvZSwY1FvExGIqwaEHN/4rJYN9+k9pim
         frwd/UWwrKDf32WUwIyNKjGOrpNfY2OyM9bHsdaCgYTKVs+HjbzgLOjygVAJPRdHpRiw
         jVBO8DQuXdlKl4SwUEq/adSs2ya5JpcldhQ1ZcxLDVVwECfEOMLJmhlgacDrRRHNEMGX
         l7NQ==
X-Gm-Message-State: AOAM5320S2to1Upn7faytUWksNTkkdm4R/01plxo1cURCo28vqBjAXLz
	tNh+f8vs9aYZ3OOcHLRI998hcqwSaTt4Hw==
X-Google-Smtp-Source: 
 ABdhPJyEUwHsZg1pEv4BIyyOvLBo7E4Y9QcxrbXodgFdVYHLo/AX4ZuIN2qWxjbHkDmHJrjKeX2SiQ==
X-Received: by 2002:a17:90a:a887:b0:1bc:388a:329f with SMTP id
 h7-20020a17090aa88700b001bc388a329fmr23052218pjq.17.1647229955137;
        Sun, 13 Mar 2022 20:52:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 p16-20020a056a000b5000b004f756b6c315sm17957045pfo.66.2022.03.13.20.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 20:52:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fwts: Upgrade to 22.01.00
Date: Sun, 13 Mar 2022 20:52:32 -0700
Message-Id: <20220314035232.6057-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 03:52:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95970

Drop upstreamed poll.h patch
Refresh rest of patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...l.h-instead-of-deprecated-sys-poll.h.patch | 48 -------------------
 .../fwts/0003-Remove-Werror-from-build.patch  | 13 +----
 ...-__SWORD_TYPE-if-not-defined-by-libc.patch |  5 --
 .../fwts/fwts/0005-Undefine-PAGE_SIZE.patch   |  7 +--
 ..._t-to-fix-pointer-to-int-cast-issues.patch | 17 ++-----
 .../{fwts_21.06.00.bb => fwts_22.01.00.bb}    |  3 +-
 6 files changed, 8 insertions(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-test/fwts/fwts/0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
 rename meta-oe/recipes-test/fwts/{fwts_21.06.00.bb => fwts_22.01.00.bb} (89%)

diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch b/meta-oe/recipes-test/fwts/fwts/0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
deleted file mode 100644
index 82379331ec..0000000000
--- a/meta-oe/recipes-test/fwts/fwts/0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1575b5ce3ecb8709806908061f689315553b40c7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Jun 2017 07:25:09 -0700
-Subject: [PATCH 2/6] Include poll.h instead of deprecated sys/poll.h
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/src/fwts_ipmi.c   | 3 ++-
- src/lib/src/fwts_pipeio.c | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/src/fwts_ipmi.c b/src/lib/src/fwts_ipmi.c
-index ca7c55bb..0b16bec3 100644
---- a/src/lib/src/fwts_ipmi.c
-+++ b/src/lib/src/fwts_ipmi.c
-@@ -18,10 +18,11 @@
-  *
-  */
- 
-+#include <poll.h>
-+
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
--#include <sys/poll.h>
- #include <sys/ioctl.h>
- #include <linux/ipmi.h>
- 
-diff --git a/src/lib/src/fwts_pipeio.c b/src/lib/src/fwts_pipeio.c
-index 716297c4..37752297 100644
---- a/src/lib/src/fwts_pipeio.c
-+++ b/src/lib/src/fwts_pipeio.c
-@@ -30,9 +30,9 @@
- #include <stdlib.h>
- #include <string.h>
- #include <paths.h>
-+#include <poll.h>
- 
- #include <sys/param.h>
--#include <sys/poll.h>
- #include <sys/types.h>
- #include <sys/wait.h>
- #include <errno.h>
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
index 5ccd461d9f..6dc45ba84b 100644
--- a/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
@@ -10,21 +10,17 @@ Upstream-Status: Pending
  src/utilities/Makefile.am | 2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index f8066af..6b979f8 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -12,7 +12,7 @@ AM_CPPFLAGS = \
- 	-I$(top_srcdir)/src/acpica/source/compiler	\
+@@ -13,7 +13,7 @@ AM_CPPFLAGS = \
  	-I$(top_srcdir)/efi_runtime			\
+ 	-I$(top_srcdir)/smccc_test			\
  	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
 -	-Wall -Werror -Wextra				\
 +	-Wall -Wextra					\
  	-Wno-address-of-packed-member			\
  	-Wfloat-equal -Wmissing-declarations		\
  	-Wno-long-long -Wredundant-decls -Wshadow	\
-diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index 55c52b4..50efa97 100644
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
 @@ -25,7 +25,7 @@ AM_CPPFLAGS = \
@@ -36,8 +32,6 @@ index 55c52b4..50efa97 100644
  	-Wno-address-of-packed-member
  
  pkglib_LTLIBRARIES = libfwts.la
-diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
-index a7d9b9c..e1bf141 100644
 --- a/src/utilities/Makefile.am
 +++ b/src/utilities/Makefile.am
 @@ -16,7 +16,7 @@
@@ -49,6 +43,3 @@ index a7d9b9c..e1bf141 100644
  	-I$(srcdir)/../lib/include
  
  bin_PROGRAMS = kernelscan
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-test/fwts/fwts/0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch b/meta-oe/recipes-test/fwts/fwts/0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
index 83d1cbbfe0..0c78e730e4 100644
--- a/meta-oe/recipes-test/fwts/fwts/0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
@@ -13,8 +13,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/lib/src/fwts_uefi.c | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/src/lib/src/fwts_uefi.c b/src/lib/src/fwts_uefi.c
-index 138f1164..13d9e36c 100644
 --- a/src/lib/src/fwts_uefi.c
 +++ b/src/lib/src/fwts_uefi.c
 @@ -63,6 +63,10 @@ typedef struct {
@@ -28,6 +26,3 @@ index 138f1164..13d9e36c 100644
  /* File system magic numbers */
  #define PSTOREFS_MAGIC          ((__SWORD_TYPE)0x6165676C)
  #define EFIVARFS_MAGIC          ((__SWORD_TYPE)0xde5e81e4)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch b/meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch
index 319e0855c4..df768d1e9d 100644
--- a/meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch
@@ -13,11 +13,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/lib/src/fwts_acpi_tables.c | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
-index dc42a8bd..4fa1246a 100644
 --- a/src/lib/src/fwts_acpi_tables.c
 +++ b/src/lib/src/fwts_acpi_tables.c
-@@ -42,6 +42,7 @@
+@@ -40,6 +40,7 @@
  #define BIOS_START	(0x000e0000)		/* Start of BIOS memory */
  #define BIOS_END  	(0x000fffff)		/* End of BIOS memory */
  #define BIOS_LENGTH	(BIOS_END - BIOS_START)	/* Length of BIOS memory */
@@ -25,6 +23,3 @@ index dc42a8bd..4fa1246a 100644
  #define PAGE_SIZE	(4096)
  
  static fwts_acpi_table_info	tables[ACPI_MAX_TABLES];
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch b/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
index eb8b0b78e8..b5c265ec2b 100644
--- a/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
@@ -14,11 +14,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/lib/src/fwts_smbios.c      | 2 +-
  3 files changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
-index 4fa1246a..7ef197cd 100644
 --- a/src/lib/src/fwts_acpi_tables.c
 +++ b/src/lib/src/fwts_acpi_tables.c
-@@ -173,7 +173,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_get_rsdp(fwts_framework *fw, void *addr,
+@@ -171,7 +171,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_g
  		return NULL;
  	}
  
@@ -27,7 +25,7 @@ index 4fa1246a..7ef197cd 100644
  		return NULL;
  
  	if (fwts_safe_memcpy(rsdp, mem, sizeof(fwts_acpi_table_rsdp)) != FWTS_OK) {
-@@ -486,7 +486,7 @@ static int fwts_acpi_load_tables_from_firmware(fwts_framework *fw)
+@@ -484,7 +484,7 @@ static int fwts_acpi_load_tables_from_fi
  	if ((rsdp = fwts_acpi_get_rsdp(fw, rsdp_addr, &rsdp_len)) == NULL)
  		return FWTS_ERROR;
  
@@ -36,11 +34,9 @@ index 4fa1246a..7ef197cd 100644
  
  	/* Load any tables from XSDT if it's valid */
  	if (rsdp->xsdt_address) {
-diff --git a/src/lib/src/fwts_mmap.c b/src/lib/src/fwts_mmap.c
-index 2f2514f1..fbd946f4 100644
 --- a/src/lib/src/fwts_mmap.c
 +++ b/src/lib/src/fwts_mmap.c
-@@ -82,7 +82,7 @@ int fwts_munmap(void *mem, const size_t size)
+@@ -82,7 +82,7 @@ int fwts_munmap(void *mem, const size_t
  	off_t offset;
  
  	page_size = fwts_page_size();
@@ -49,11 +45,9 @@ index 2f2514f1..fbd946f4 100644
  
  	if (munmap((void *)((uint8_t *)mem - offset), size + offset) < 0)
  		return FWTS_ERROR;
-diff --git a/src/lib/src/fwts_smbios.c b/src/lib/src/fwts_smbios.c
-index 8da572e9..04315bd3 100644
 --- a/src/lib/src/fwts_smbios.c
 +++ b/src/lib/src/fwts_smbios.c
-@@ -78,7 +78,7 @@ static void *fwts_smbios_find_entry_uefi(
+@@ -78,7 +78,7 @@ static void *fwts_smbios_find_entry_uefi
  	if ((addr = fwts_scan_efi_systab(smbios)) != NULL) {
  		fwts_smbios_entry *mapped_entry;
  
@@ -62,6 +56,3 @@ index 8da572e9..04315bd3 100644
  			if (fwts_safe_memcpy(entry, mapped_entry, size) == FWTS_OK) {
  				(void)fwts_munmap(mapped_entry, size);
  				*type  = FWTS_SMBIOS;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-test/fwts/fwts_21.06.00.bb b/meta-oe/recipes-test/fwts/fwts_22.01.00.bb
similarity index 89%
rename from meta-oe/recipes-test/fwts/fwts_21.06.00.bb
rename to meta-oe/recipes-test/fwts/fwts_22.01.00.bb
index 0dcefcbb9d..f14d7fd8e6 100644
--- a/meta-oe/recipes-test/fwts/fwts_21.06.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_22.01.00.bb
@@ -7,13 +7,12 @@ LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd
 
 SRC_URI = "http://fwts.ubuntu.com/release/fwts-V${PV}.tar.gz;subdir=${BP} \
            file://0001-Add-correct-printf-qualifier-for-off_t.patch \
-           file://0002-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
            file://0003-Remove-Werror-from-build.patch \
            file://0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
            file://0005-Undefine-PAGE_SIZE.patch \
            file://0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
            "
-SRC_URI[sha256sum] = "ca43439707976f6664fe3f6eb7f356a51ac7d7f8a4e246ef4d1b16305e066909"
+SRC_URI[sha256sum] = "45045a095d9933d9ff39712372ab1f3078ca8e29c007b3f97b810cdb8c27b5c3"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
 
-- 
2.35.1


