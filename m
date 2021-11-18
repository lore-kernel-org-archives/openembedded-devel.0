Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C586C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 13:07:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.1152.1637240850998312996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 05:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jyTn80Sq;
 spf=pass (domain: linaro.org, ip: 209.85.128.53,
 mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f53.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so4756441wme.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 05:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/WFnl+OF45dViOc6DHQIY+olTkGyFnM3Z9QtEfqRwX4=;
        b=jyTn80SqLsxeMh6jDiQLhhD3iZPQmV+GlOMdNrWIGYu+SYf4/XOMmoFWJwb86y9wUP
         vUg4c7XAHdcSRGNw/MCaN50/eg6dFusL81CbQuWacm2gxhz4856DhS3Qu0GUsTFOkbLu
         ZGscxt+nxcNgqFzwOObtjrcKZAHFNvZZDiWllikvLTtSLC1YpNFd0wq29vKdLIpaF+GN
         6vFf54eqGwE2Wu5wV+1K1TDDeP7ZkA+ohpsKuv/mh8RkZydOpSqbFnNaYi/mlubRvNQ9
         e23GGFJ2Xzun0OcLQkXCT5qw1MioHoDt3H5cjfbIYzOSXulRKN1APWnCGWDHsOekln6l
         yU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/WFnl+OF45dViOc6DHQIY+olTkGyFnM3Z9QtEfqRwX4=;
        b=a716JgPxsnda+yVZ5W9qKh1RYi344AR2S82d/ucZm0zeFTErkV2EcmuqeJDOu9lrhf
         776EY2wZ5yNxNaob7cgwoC1aTAck4dHU+s3bJ4cQcuqcDB/POFJTKGxRBK4sVMXzJZhg
         tIamj+ehUiUWyZqHs3lRs7XYc1fJ1fqyA/Rspcenm/qgzrUbbAZVL4+3WW3qS0mHWdTZ
         SUPs0ds9VJVd8s8qwTEHtA2S6+Ybvd1WG4PSNVVmipPK6DXFPH0Gf47KpUokVFFcRpm0
         fv4I+tbSWLBe7BoxgL9fE+F1FwxdvOgGtOPvy5tTbu0ZfXoMkOXj2Ewl4a2vvihqgalL
         WCQQ==
X-Gm-Message-State: AOAM532mJ53oi5nUlyfA+rJfUHthdhuZ+53eJfQzMryJgUcjARPlOjCW
	d5+51+29AzObR6jJB7ktTZo3wjYjZ1hBuBFl/bM=
X-Google-Smtp-Source: 
 ABdhPJwwLp1EVWEMvyZ86FZYsL+QBOBTeY9tRSO/Sll9S8p2dblStACi2AW4pljbD3VHoj1CPIBmGQ==
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr9973093wmq.21.1637240848342;
        Thu, 18 Nov 2021 05:07:28 -0800 (PST)
Received: from localhost.localdomain ([138.199.16.64])
        by smtp.gmail.com with ESMTPSA id
 g198sm3284012wme.23.2021.11.18.05.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:07:27 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH] makedumpfile: upgrade from 1.6.9 to 1.7.0
Date: Thu, 18 Nov 2021 14:07:19 +0100
Message-Id: <20211118130719.57391-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 13:07:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94026

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
  Changes since v2:
   * fix patch fuzz errors
   * update patch to use CFLAGS_COMMON for zstd 

  Changes since v1:
   * fix ypo in the commit message
   * update SRCREV

 ...makedumpfile-replace-hardcode-CFLAGS.patch | 21 +++--
 ...ort-only-46-bit-for-MAX_PHYSMEM_BITS.patch | 90 -------------------
 ...umpfile_1.6.9.bb => makedumpfile_1.7.0.bb} |  7 +-
 3 files changed, 18 insertions(+), 100 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.9.bb => makedumpfile_1.7.0.bb} (88%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 2b108ab6c..1dd87c8b1 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -13,9 +13,12 @@ Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
 Upstream-Status: Inappropriate[oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+[2021-11-18] Patch updated to use CFLAGS_COMMON for zstd
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
 ---
- Makefile | 45 +++++++++++++++++++++++----------------------
- 1 file changed, 23 insertions(+), 22 deletions(-)
+ Makefile |   47 ++++++++++++++++++++++++-----------------------
+ 1 file changed, 24 insertions(+), 23 deletions(-)
 
 --- a/Makefile
 +++ b/Makefile
@@ -94,7 +97,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  endif
  
  ifeq ($(USESNAPPY), on)
-@@ -65,7 +66,7 @@ LIBS := -lsnappy $(LIBS)
+@@ -65,12 +66,12 @@ LIBS := -lsnappy $(LIBS)
  ifneq ($(LINKTYPE), dynamic)
  LIBS := $(LIBS) -lstdc++
  endif
@@ -102,8 +105,14 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 +CFLAGS_COMMON += -DUSESNAPPY
  endif
  
- LIBS := $(LIBS) -lpthread
-@@ -90,14 +91,14 @@ LIBS := $(LIBS) $(call try-run,\
+ ifeq ($(USEZSTD), on)
+ LIBS := -lzstd $(LIBS)
+-CFLAGS += -DUSEZSTD
++CFLAGS_COMMON += -DUSEZSTD
+ endif
+ 
+ ifeq ($(DEBUG), on)
+@@ -104,14 +105,14 @@ LIBS := $(LIBS) $(call try-run,\
  all: makedumpfile
  
  $(OBJ_PART): $(SRC_PART)
@@ -120,7 +129,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  	echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"makedumpfile v$(VERSION)\" \"Linux System Administrator\'s Manual\" > temp.8
  	grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)makedumpfile.8 >> temp.8
  	mv temp.8 makedumpfile.8
-@@ -108,7 +109,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(
+@@ -122,7 +123,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(
  	gzip -c ./makedumpfile.conf.5 > ./makedumpfile.conf.5.gz
  
  eppic_makedumpfile.so: extension_eppic.c
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


