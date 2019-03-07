Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA847C611
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 01:10:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x271AZcR026355
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Mar 2019 17:10:36 -0800 (PST)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 6 Mar 2019 17:10:35 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Mar 2019 09:10:33 +0800
Message-ID: <1551921033-22958-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH] makedumpfile: Upgrade to 1.6.5 to support kernel 4.18 and 4.19
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
X-List-Received-Date: Thu, 07 Mar 2019 01:10:35 -0000
Content-Type: text/plain

From: Haiqing Bai <Haiqing.Bai@windriver.com>

This upgrade fixed the below issue:
When run '$makedumpfile -E -d 1 /proc/vmcore /root/vmcore_dumpfile'
shows 'The kernel version is not supported.'

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch | 25 +++++++++++++++-------
 ...makedumpfile_1.6.4.bb => makedumpfile_1.6.5.bb} |  4 ++--
 2 files changed, 19 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.4.bb => makedumpfile_1.6.5.bb} (92%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
index 766f4fc..156b4d5 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
@@ -1,4 +1,4 @@
-From ba123fa6b2aa0ac62d1b78f327339635ae87201a Mon Sep 17 00:00:00 2001
+From 0d1cdb59da3603e0a80913617ece0164b05380d2 Mon Sep 17 00:00:00 2001
 From: Alexandru Moise <alexandru.moise@windriver.com>
 Date: Fri, 29 Apr 2016 07:40:46 +0000
 Subject: [PATCH] mem_section: Support only 46 bit for MAX_PHYSMEM_BITS on
@@ -21,19 +21,20 @@ Upstream-Status: Pending
 Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 
+[hqBai: adjusted patch for context, no logical change]
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
 ---
- arch/ppc64.c | 28 ++--------------------------
- 1 file changed, 2 insertions(+), 26 deletions(-)
+ arch/ppc64.c | 33 ++-------------------------------
+ 1 file changed, 2 insertions(+), 31 deletions(-)
 
 diff --git a/arch/ppc64.c b/arch/ppc64.c
-index 8b6f7d5..458f06b 100644
+index 947a125..458f06b 100644
 --- a/arch/ppc64.c
 +++ b/arch/ppc64.c
-@@ -462,38 +462,14 @@ ppc64_vtop_level4(unsigned long vaddr)
- 	return paddr;
+@@ -463,42 +463,13 @@ ppc64_vtop_level4(unsigned long vaddr)
  }
  
--int
+ int
 -set_ppc64_max_physmem_bits(void)
 -{
 -	long array_len = ARRAY_LENGTH(mem_section);
@@ -52,10 +53,15 @@ index 8b6f7d5..458f06b 100644
 -		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
 -		return TRUE;
 -
+-	info->max_physmem_bits  = _MAX_PHYSMEM_BITS_4_19;
+-	if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
+-		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
+-		return TRUE;
+-
 -	return FALSE;
 -}
 -
- int
+-int
  get_machdep_info_ppc64(void)
  {
  	unsigned long vmlist, vmap_area_list, vmalloc_start;
@@ -70,3 +76,6 @@ index 8b6f7d5..458f06b 100644
  	info->page_offset = __PAGE_OFFSET;
  
  	if (SYMBOL(_stext) == NOT_FOUND_SYMBOL) {
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.5.bb
similarity index 92%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.5.bb
index 33194b8..413b413 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.5.bb
@@ -25,8 +25,8 @@ SRC_URI = "\
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
     file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
 "
-SRC_URI[md5sum] = "7dfbca19f487604c271e2892ba07f4bd"
-SRC_URI[sha256sum] = "7e06f72d5f291fcab9e92975f405a76e37d4f7fc8fa4172f199636398ae812b1"
+SRC_URI[md5sum] = "1737f8e8904d565629f0c9e702f92d02"
+SRC_URI[sha256sum] = "5d4f1d6ded8dca6951eeabcf4bb1ebf6575288fee947529397103c040eb5c760"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/makedumpfile/files/makedumpfile/"
 UPSTREAM_CHECK_REGEX = "makedumpfile/(?P<pver>\d+(\.\d+)+)/"
-- 
2.7.4


