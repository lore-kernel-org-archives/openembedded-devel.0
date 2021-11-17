Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8635AC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 09:45:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.5140.1637142312204600359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xmH7GFhZ;
 spf=pass (domain: linaro.org, ip: 209.85.128.44,
 mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f44.google.com with SMTP id p18so1571231wmq.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rxp1KELnM2Mi5Ftbfov1/4QcR+S14i7TuxPBkG3fxJk=;
        b=xmH7GFhZndzcPBejpc4D31t5Wa7r1E5N6VdyyrJLdhLvkcGeMAgc9LWP2Ewmcb/EVJ
         JQWjOJkNp61TrNNrW35dQOYjfcMI6mqntK5JBvNgwn8hLJ4dS9leh2n06PFS5FYgyfdP
         rPz9zL7O3H8pjOalG1Gtdiqs8VOmRMQdKXdwpr/Bv3Lt3DzwDNXVvT8Oi9aLqWQxipM4
         zddOOOA9x/oofunbi56uniwYf6yC+4U6l54FZqxCc5mCBCYh3/EPluVJ9G5G399IgRfy
         G9MiTIFjTzoopIC9gPymHOMlw9vzaECpcbjIiaCL8FiyqtaMDkg0YxuZZk79VsraTpjT
         TdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rxp1KELnM2Mi5Ftbfov1/4QcR+S14i7TuxPBkG3fxJk=;
        b=RTrnoxjz/so/028Fq7IwiYByL4/cv3jH4ADDHM7aKj69qDKfA/5nqRtwbFpr4tIJ3U
         2Tt31hOoyn2YSIKphOyEIe+MrwGyZ7YhG02dHagYvl6pBTDXzDUej/+HZbJIJiqL79+o
         i/+/T8cGezem9TAT8pDIU4CL1uplMSP9kDLcw+9sEoqX9FEmojJsK5KUisXKf09aC+dN
         /T3nKTzH/X3ltuWyOxuBS2wN/1KQ3CIbqQS8owZvJaPhvfpjwLBIKsG4OXkKq0HyAWH0
         xBb2cFBjOVH0WRQmL76VZaGNUXk9rhWa0ecfzYZR/ad4UsVcSeGSg8LRiD9oaLk/dqxj
         U65w==
X-Gm-Message-State: AOAM530AB7u1Rb7YBYaQ5RrEh8jpNcDkTvmw/nLMOTuvdO/IjpLw3Zep
	HxUrfGRti8yXKlEdXqdIsnHpkr23cQX758ISfZQ=
X-Google-Smtp-Source: 
 ABdhPJwWVKo3ANYp9p3LHYDCUf8fWqgtmhQP4utH7wmASa/9PQEMvEJCVGhS5zO6QuIaBuI8C5qsYg==
X-Received: by 2002:a05:600c:4793:: with SMTP id
 k19mr80150209wmo.72.1637142310254;
        Wed, 17 Nov 2021 01:45:10 -0800 (PST)
Received: from localhost.localdomain ([88.169.167.85])
        by smtp.gmail.com with ESMTPSA id z6sm6632287wmp.1.2021.11.17.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 01:45:09 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-oe][PATCH] makedumpfile: upgrade from 1.6.9 to 1.7.0
Date: Wed, 17 Nov 2021 10:45:03 +0100
Message-Id: <20211117094503.1583748-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 09:45:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93992

* Drop 0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
  This patch has been introduced in January 2017 for makedumpfile 1.6.1.
  It has never reached upstream, hence the pending status is
  inappropriate. Sincei that time, the upstream code to retrieve
  MAX_PHYSMEM_BITS has been updated to use vmcoreinfo, with a backward
  compatibility for older kernels.
* Remove the deprecated comment about arm/aarch64 would compile but has never
  been tested upstream, introduced in July 2016. Nowadays, it works just fine
  on those architectures.
* Add PACKAGECONFIG option for zstd compression
  Since 1.7.0 release, Zstandard (zstd) compression support has been added.
  With zstd, the vmcore size and time consumption can have a better balance
  than zlib/lzo/snappy.
  http://lists.infradead.org/pipermail/kexec/2021-September/023011.html

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...ort-only-46-bit-for-MAX_PHYSMEM_BITS.patch | 90 -------------------
 ...umpfile_1.6.9.bb => makedumpfile_1.7.0.bb} |  5 +-
 2 files changed, 2 insertions(+), 93 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.9.bb => makedumpfile_1.7.0.bb} (91%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
deleted file mode 100644
index f46fb3117..000000000
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 9045b72bdb703bf58a6586d77461eea8f59f50f7 Mon Sep 17 00:00:00 2001
-From: Alexandru Moise <alexandru.moise@windriver.com>
-Date: Fri, 29 Apr 2016 07:40:46 +0000
-Subject: [PATCH] mem_section: Support only 46 bit for MAX_PHYSMEM_BITS on
- PPC64
-
-Related to change:
-http://lists.infradead.org/pipermail/kexec/2013-January/007849.html
-
-Linux on PPC64 has supported only 46 bit MAX_PHYSMEM_BITS since commit:
-048ee0993ec8360abb0b51bdf8f8721e9ed62ec4
-
-Also remove set_ppc64_max_physmem_bits and set info->max_physmem_bits in
-get_machdep_info_ppc64 instead. set_ppc64_max_physmem_bits is broken
-for all kernels compiled with CONFIG_SPARSEMEM=n. makedumpfile is
-unable to get mem_section field from powerpc kernel since commit:
-fd59d231f81cb02870b9cf15f456a897f3669b4e
-
-Upstream-Status: Pending
-
-Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
-[hqBai: adjusted patch for context, no logical change]
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- arch/ppc64.c | 38 ++------------------------------------
- 1 file changed, 2 insertions(+), 36 deletions(-)
-
---- a/arch/ppc64.c
-+++ b/arch/ppc64.c
-@@ -462,44 +462,6 @@ ppc64_vtop_level4(unsigned long vaddr)
- 	return paddr;
- }
- 
--int
--set_ppc64_max_physmem_bits(void)
--{
--	long array_len = ARRAY_LENGTH(mem_section);
--
--	/* Check if we can get MAX_PHYSMEM_BITS from vmcoreinfo */
--	if (NUMBER(MAX_PHYSMEM_BITS) != NOT_FOUND_NUMBER) {
--		info->max_physmem_bits = NUMBER(MAX_PHYSMEM_BITS);
--		return TRUE;
--	}
--
--	/*
--	 * The older ppc64 kernels uses _MAX_PHYSMEM_BITS as 42 and the
--	 * newer kernels 3.7 onwards uses 46 bits.
--	 */
--
--	info->max_physmem_bits  = _MAX_PHYSMEM_BITS_ORIG ;
--	if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
--		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
--		return TRUE;
--
--	info->max_physmem_bits  = _MAX_PHYSMEM_BITS_3_7;
--	if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
--		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
--		return TRUE;
--
--	info->max_physmem_bits  = _MAX_PHYSMEM_BITS_4_19;
--	if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
--		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
--		return TRUE;
--
--	info->max_physmem_bits  = _MAX_PHYSMEM_BITS_4_20;
--	if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
--		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
--		return TRUE;
--
--	return FALSE;
--}
- 
- int
- get_machdep_info_ppc64(void)
-@@ -507,10 +469,8 @@ get_machdep_info_ppc64(void)
- 	unsigned long vmlist, vmap_area_list, vmalloc_start;
- 
- 	info->section_size_bits = _SECTION_SIZE_BITS;
--	if (!set_ppc64_max_physmem_bits()) {
--		ERRMSG("Can't detect max_physmem_bits.\n");
--		return FALSE;
--	}
-+	info->max_physmem_bits = _MAX_PHYSMEM_BITS_3_7;
-+
- 	info->page_offset = __PAGE_OFFSET;
- 
- 	if (SYMBOL(_stext) == NOT_FOUND_SYMBOL) {
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
similarity index 91%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
index 8de4a7ad6..1ac02120f 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
@@ -16,8 +16,7 @@ SRCREV = "a9ad811c15e769c8e6d8d915a05cebc32f2ea2f5"
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
 
-# arm and aarch64 would compile but has never been tested upstream.  mips would not compile.
-#
+# mips would not compile.
 COMPATIBLE_HOST = "(x86_64|i.86|powerpc|arm|aarch64).*-linux"
 
 PACKAGES =+ "${PN}-tools"
@@ -26,7 +25,6 @@ FILES:${PN}-tools = "${bindir}/*.pl"
 SRC_URI = "\
     git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
-    file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -47,6 +45,7 @@ EXTRA_OEMAKE = "\
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lzo] = "USELZO=on,USELZO=off,lzo"
 PACKAGECONFIG[snappy] = "USESNAPPY=on,USESNAPPY=off,snappy"
+PACKAGECONFIG[zstd] = "USEZSTD=on,USEZSTD=off,zstd"
 
 do_install () {
     mkdir -p ${D}/usr/bin
-- 
2.33.1


