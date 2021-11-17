Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2515C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 09:51:42 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.4959.1637142701290916682
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OQYANI8w;
 spf=pass (domain: linaro.org, ip: 209.85.221.42,
 mailfrom: fathi.boudra@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id c4so3438923wrd.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9sBtqZ/VCUTZgFkhaLLFd12dyDjZDpN6wTUq3WSyeVY=;
        b=OQYANI8wt6NqMsX51hfYNQsLdjDsPnCidT4V8wXdJcxGpPN+bQpwGniiXZ9phDYKkS
         mr42LYzFyVu9opdQ2z3DrxfM8DynFAZDMHh5pdsrwzMPItjFNvvjbccSNKHlxLv16WTa
         PciZQKHrqCyKFdNglgtijnNJJiWMLxKcraZlrU9mxjhD+p0W5NHjhSeu6bQGtT8qcpCS
         Fb5vZh+Tw3ygFknFHR6OdaMU3+CzthMMzaR8Qe7wlVOay1pmTQr1xu1oz82GXSwXmvGd
         G8IRFq3vWJUji0JLoQ5E1ON/dj9sTWU+Ktiy99Z8O/jOC9q28gxf67q0AxIsnqHzyJ9C
         GVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9sBtqZ/VCUTZgFkhaLLFd12dyDjZDpN6wTUq3WSyeVY=;
        b=7mCFwBH3wWr5rJXdPLJywUwjiLB5o6k+F+f2P36NnfdzUsXdIHYmDz/tsHwIuj9T8t
         gNIgxgqc0zf8zQFDUhgERwVNqiFRfnkN/Uwlo4sgr84n6rP88nI71ymRNnmTY/baDQ6H
         AtP7ZkVL1Zhq7RWJbPMNqcjN9KrZUgjybBgQGARVf/xBnYRtcRRjsDCfdBWAqVRSTaNu
         P0Bf+w6lp5hF3DCTE2vAyfbP2ZRrJWQhOi+VpiWsvXmxYb3n2lT41WAMk7QOtdDek2ru
         YdMpWLythMl3OqQnDoldbtfFMq50UPH/AisXYvusK9kkq5y1GCtE48pWBlXR81WrJppV
         jb4w==
X-Gm-Message-State: AOAM530SWaqbcnaDhEhxLQ2eHMxsE6U04iNT7EYn7f4761HUZeqBfh3a
	yzJwF5374uw2t6WWVNLQc4zO7uDh6oGG1dz+xTA=
X-Google-Smtp-Source: 
 ABdhPJwvfgNdcfAw4JJHCuWoGTxH71ID+xkSlraPUNCX9wllyd+ZItvCDOPazgpElqlupSP8NwckJg==
X-Received: by 2002:adf:fb86:: with SMTP id a6mr17863495wrr.35.1637142699225;
        Wed, 17 Nov 2021 01:51:39 -0800 (PST)
Received: from localhost.localdomain ([88.169.167.85])
        by smtp.gmail.com with ESMTPSA id
 d6sm19701956wrx.60.2021.11.17.01.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 01:51:38 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-oe][PATCH v2] makedumpfile: upgrade from 1.6.9 to 1.7.0
Date: Wed, 17 Nov 2021 10:51:29 +0100
Message-Id: <20211117095129.1584617-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 09:51:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93994

* Drop 0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
  This patch has been introduced in January 2017 for makedumpfile 1.6.1.
  It has never reached upstream, hence the pending status is
  inappropriate. Since that time, the upstream code to retrieve
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
 ...umpfile_1.6.9.bb => makedumpfile_1.7.0.bb} |  7 +-
 2 files changed, 3 insertions(+), 94 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.9.bb => makedumpfile_1.7.0.bb} (88%)

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
similarity index 88%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
index 8de4a7ad6..e703ee71b 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
@@ -11,13 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPLv2.0"
 
 SRCBRANCH ?= "master"
-SRCREV = "a9ad811c15e769c8e6d8d915a05cebc32f2ea2f5"
+SRCREV = "06ef8e2b814feb08a668b7a3783c86674e49a7b1"
 
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


