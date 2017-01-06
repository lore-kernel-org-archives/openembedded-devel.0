Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8424F600BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jan 2017 02:05:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0625ZqN013072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Jan 2017 18:05:35 -0800 (PST)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 5 Jan 2017 18:05:33 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Jan 2017 10:04:53 +0800
Message-ID: <1483668293-22057-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-oe][PATCH] makedumpfile: update to 1.6.1
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
X-List-Received-Date: Fri, 06 Jan 2017 02:05:35 -0000
Content-Type: text/plain

* Support 4.8 kernel
* Add a patch to fix vmcore compressing for ppc64

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch | 73 ++++++++++++++++++++++
 ...makedumpfile_1.6.0.bb => makedumpfile_1.6.1.bb} |  5 +-
 2 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.0.bb => makedumpfile_1.6.1.bb} (87%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
new file mode 100644
index 0000000..e0c3d9a
--- /dev/null
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
@@ -0,0 +1,73 @@
+From 653fe8e724081d2f289c2245d1220d5f7170538d Mon Sep 17 00:00:00 2001
+From: Alexandru Moise <alexandru.moise@windriver.com>
+Date: Fri, 29 Apr 2016 07:40:46 +0000
+Subject: [PATCH] mem_section: Support only 46 bit for MAX_PHYSMEM_BITS on
+ PPC64
+
+Related to change:
+http://lists.infradead.org/pipermail/kexec/2013-January/007849.html
+
+Linux on PPC64 has supported only 46 bit MAX_PHYSMEM_BITS since commit:
+048ee0993ec8360abb0b51bdf8f8721e9ed62ec4
+
+Also remove set_ppc64_max_physmem_bits and set info->max_physmem_bits in
+get_machdep_info_ppc64 instead. set_ppc64_max_physmem_bits is broken
+for all kernels compiled with CONFIG_SPARSEMEM=n. makedumpfile is
+unable to get mem_section field from powerpc kernel since commit:
+fd59d231f81cb02870b9cf15f456a897f3669b4e
+
+Upstream-Status: Pending
+
+Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ arch/ppc64.c | 28 ++--------------------------
+ 1 file changed, 2 insertions(+), 26 deletions(-)
+
+diff --git a/arch/ppc64.c b/arch/ppc64.c
+index 89a7f05..6c928ab 100644
+--- a/arch/ppc64.c
++++ b/arch/ppc64.c
+@@ -302,37 +302,13 @@ ppc64_vtop_level4(unsigned long vaddr)
+ }
+ 
+ int
+-set_ppc64_max_physmem_bits(void)
+-{
+-	long array_len = ARRAY_LENGTH(mem_section);
+-	/*
+-	 * The older ppc64 kernels uses _MAX_PHYSMEM_BITS as 42 and the
+-	 * newer kernels 3.7 onwards uses 46 bits.
+-	 */
+-
+-	info->max_physmem_bits  = _MAX_PHYSMEM_BITS_ORIG ;
+-	if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
+-		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
+-		return TRUE;
+-
+-	info->max_physmem_bits  = _MAX_PHYSMEM_BITS_3_7;
+-	if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
+-		|| (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
+-		return TRUE;
+-
+-	return FALSE;
+-}
+-
+-int
+ get_machdep_info_ppc64(void)
+ {
+ 	unsigned long vmlist, vmap_area_list, vmalloc_start;
+ 
+ 	info->section_size_bits = _SECTION_SIZE_BITS;
+-	if (!set_ppc64_max_physmem_bits()) {
+-		ERRMSG("Can't detect max_physmem_bits.\n");
+-		return FALSE;
+-	}
++	info->max_physmem_bits = _MAX_PHYSMEM_BITS_3_7;
++
+ 	info->page_offset = __PAGE_OFFSET;
+ 
+ 	if (SYMBOL(_stext) == NOT_FOUND_SYMBOL) {
+-- 
+2.5.0
+
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb
similarity index 87%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb
index 93a6f62..dacc76b 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.1.bb
@@ -20,12 +20,13 @@ FILES_${PN}-tools = "${bindir}/*.pl"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/makedumpfile/${BPN}-${PV}.tar.gz \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
+    file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
 "
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPLv2.0"
 
-SRC_URI[md5sum] = "041c5c6de2c3066600e4ca646c2397d6"
-SRC_URI[sha256sum] = "e3147abc52df2ceac1e9affef45bf37e2f2e1d9979bc94a761ee11e4044072ac"
+SRC_URI[md5sum] = "16c0ae9902ae57be4a603a6ab1e86c53"
+SRC_URI[sha256sum] = "0b6e73106998670407887de9e1a505b3a2dbb2fb517a4b968a665eda8fb097ce"
 
 SECTION = "base"
 
-- 
2.7.4


