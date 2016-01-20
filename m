Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C08F6FFCE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 06:06:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0K66M1a011842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 22:06:22 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jan 2016 22:06:21 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Jan 2016 14:05:41 +0800
Message-ID: <1453269941-4462-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] libx86-1: port a patch to make it work
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
X-List-Received-Date: Wed, 20 Jan 2016 06:06:22 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

port a patch from libx86-1.1-21.fc23.src.rpm, and make libx86-1 be able to work
and assume zero which return by LRMI_common_init is valid address

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-assume-zero-is-valid-address.patch        |  26 +++
 .../libx86-1/libx86-1.1/libx86-mmap-offset.patch   | 190 +++++++++++++++++++++
 meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb  |   6 +-
 3 files changed, 221 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-assume-zero-is-valid-address.patch
 create mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-assume-zero-is-valid-address.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-assume-zero-is-valid-address.patch
new file mode 100644
index 0000000..7a46301
--- /dev/null
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-assume-zero-is-valid-address.patch
@@ -0,0 +1,26 @@
+assume zero is valid address
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ thunk.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/thunk.c b/thunk.c
+index 796e88b..6121ea1 100644
+--- a/thunk.c
++++ b/thunk.c
+@@ -141,9 +141,6 @@ int LRMI_init() {
+ 
+ 	mmap_addr = LRMI_common_init(1);
+ 
+-	if (!mmap_addr)
+-		return 0;
+-
+ 	X86EMU_pioFuncs pioFuncs = {
+ 		(&x_inb),
+ 		(&x_inw),
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
new file mode 100644
index 0000000..843acc8
--- /dev/null
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
@@ -0,0 +1,190 @@
+Upstream-Statue: Pending 
+[from ftp://195.220.108.108/linux/fedora/linux/development/rawhide/source/SRPMS/l/libx86-1.1-21.fc23.src.rpm]
+
+diff -ur libx86-1.1/lrmi.c libx86-1.1.hack/lrmi.c
+--- libx86-1.1/lrmi.c	2006-10-30 15:10:16.000000000 -0500
++++ libx86-1.1.hack/lrmi.c	2009-10-26 15:55:42.000000000 -0400
+@@ -136,7 +136,7 @@
+ 	if (context.ready)
+ 		return 1;
+ 
+-	if (!LRMI_common_init())
++	if (!LRMI_common_init(0))
+ 		return 0;
+ 
+ 	/*
+diff -ur libx86-1.1/thunk.c libx86-1.1.hack/thunk.c
+--- libx86-1.1/thunk.c	2008-04-02 20:48:00.000000000 -0400
++++ libx86-1.1.hack/thunk.c	2009-10-26 16:05:39.000000000 -0400
+@@ -139,11 +139,11 @@
+ 	int i;
+ 	X86EMU_intrFuncs intFuncs[256];
+ 
+-	if (!LRMI_common_init())
++	mmap_addr = LRMI_common_init(1);
++
++	if (!mmap_addr)
+ 		return 0;
+ 
+-	mmap_addr = 0;
+-	
+ 	X86EMU_pioFuncs pioFuncs = {
+ 		(&x_inb),
+ 		(&x_inw),
+@@ -169,10 +169,10 @@
+ 	X86_ESP = 0xFFF9;
+ 	memset (stack, 0, 64*1024);
+ 
+-	*((char *)0) = 0x4f; /* Make sure that we end up jumping back to a
+-				halt instruction */
++	*mmap_addr = 0x4f; /* Make sure that we end up jumping back to a
++			      halt instruction */
+ 
+-	M.mem_base = 0;
++	M.mem_base = (unsigned long)mmap_addr;
+ 	M.mem_size = 1024*1024;
+ 
+ 	return 1;
+diff -ur libx86-1.1/x86-common.c libx86-1.1.hack/x86-common.c
+--- libx86-1.1/x86-common.c	2008-05-16 12:56:23.000000000 -0400
++++ libx86-1.1.hack/x86-common.c	2009-10-26 16:03:21.000000000 -0400
+@@ -45,14 +45,15 @@
+ static struct {
+ 	int ready;
+ 	int count;
++	void *offset;
+ 	struct mem_block blocks[REAL_MEM_BLOCKS];
+ } mem_info = { 0 };
+ 
+ static int
+-real_mem_init(void)
++real_mem_init(int high_page)
+ {
+ 	void *m;
+-	int fd_zero;
++	int fd_zero, flags = MAP_SHARED;
+ 
+ 	if (mem_info.ready)
+ 		return 1;
+@@ -63,9 +64,12 @@
+ 		return 0;
+ 	}
+ 
++	if (!high_page)
++		flags |= MAP_FIXED;
++
+ 	m = mmap((void *)REAL_MEM_BASE, REAL_MEM_SIZE,
+-	 PROT_READ | PROT_WRITE | PROT_EXEC,
+-	 MAP_FIXED | MAP_SHARED, fd_zero, 0);
++		 PROT_READ | PROT_WRITE | PROT_EXEC,
++		 flags, fd_zero, 0);
+ 
+ 	if (m == (void *)-1) {
+ 		perror("mmap /dev/zero");
+@@ -76,6 +80,7 @@
+ 	close(fd_zero);
+ 
+ 	mem_info.ready = 1;
++	mem_info.offset = m;
+ 	mem_info.count = 1;
+ 	mem_info.blocks[0].size = REAL_MEM_SIZE;
+ 	mem_info.blocks[0].free = 1;
+@@ -87,7 +92,7 @@
+ real_mem_deinit(void)
+ {
+ 	if (mem_info.ready) {
+-		munmap((void *)REAL_MEM_BASE, REAL_MEM_SIZE);
++		munmap(mem_info.offset, REAL_MEM_SIZE);
+ 		mem_info.ready = 0;
+ 	}
+ }
+@@ -119,7 +124,7 @@
+ LRMI_alloc_real(int size)
+ {
+ 	int i;
+-	char *r = (char *)REAL_MEM_BASE;
++	char *r = (char *)mem_info.offset;
+ 
+ 	if (!mem_info.ready)
+ 		return NULL;
+@@ -151,7 +156,7 @@
+ LRMI_free_real(void *m)
+ {
+ 	int i;
+-	char *r = (char *)REAL_MEM_BASE;
++	char *r = (char *)mem_info.offset;
+ 
+ 	if (!mem_info.ready)
+ 		return;
+@@ -200,13 +205,15 @@
+ 	return *(unsigned short *)(i * 4);
+ }
+ 
+-int LRMI_common_init(void)
++void *LRMI_common_init(int high_page)
+ {
+-	void *m;
++	void *m, *offset;
+ 	int fd_mem;
+ 
+-	if (!real_mem_init())
+-		return 0;
++	if (!real_mem_init(high_page))
++		return NULL;
++
++	offset = mem_info.offset - REAL_MEM_BASE;
+ 
+ 	/*
+ 	 Map the Interrupt Vectors (0x0 - 0x400) + BIOS data (0x400 - 0x502)
+@@ -217,33 +224,33 @@
+ 	if (fd_mem == -1) {
+ 		real_mem_deinit();
+ 		perror("open /dev/mem");
+-		return 0;
++		return NULL;
+ 	}
+ 
+-	m = mmap((void *)0, 0x502,
+-	 PROT_READ | PROT_WRITE | PROT_EXEC,
+-	 MAP_FIXED | MAP_SHARED, fd_mem, 0);
++	m = mmap(offset, 0x502,
++		 PROT_READ | PROT_WRITE | PROT_EXEC,
++		 MAP_FIXED | MAP_SHARED, fd_mem, 0);
+ 
+ 	if (m == (void *)-1) {
+ 		close(fd_mem);
+ 		real_mem_deinit();
+ 		perror("mmap /dev/mem");
+-		return 0;
++		return NULL;
+ 	}
+ 
+-	m = mmap((void *)0xa0000, 0x100000 - 0xa0000,
++	m = mmap(offset+0xa0000, 0x100000 - 0xa0000,
+ 	 PROT_READ | PROT_WRITE | PROT_EXEC,
+ 	 MAP_FIXED | MAP_SHARED, fd_mem, 0xa0000);
+ 
+ 	if (m == (void *)-1) {
+-		munmap((void *)0, 0x502);
++		munmap(offset, 0x502);
+ 		close(fd_mem);
+ 		real_mem_deinit();
+ 		perror("mmap /dev/mem");
+-		return 0;
++		return NULL;
+ 	}
+ 
+ 	close(fd_mem);
+ 
+-	return 1;
++	return offset;
+ }
+diff -ur libx86-1.1/x86-common.h libx86-1.1.hack/x86-common.h
+--- libx86-1.1/x86-common.h	2006-09-07 18:44:27.000000000 -0400
++++ libx86-1.1.hack/x86-common.h	2009-10-26 16:01:19.000000000 -0400
+@@ -40,4 +40,4 @@
+ 
+ void *LRMI_alloc_real(int size);
+ void LRMI_free_real(void *m);
+-int LRMI_common_init(void);
++void *LRMI_common_init(int high_page);
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
index 7551e7d..20c152c 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
@@ -7,7 +7,11 @@ LICENSE = "MIT & BSD-3-Clause"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=633af6c02e6f624d4c472d970a2aca53"
 
-SRC_URI = "http://www.codon.org.uk/~mjg59/libx86/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://www.codon.org.uk/~mjg59/libx86/downloads/${BPN}-${PV}.tar.gz \
+           file://libx86-mmap-offset.patch \
+           file://0001-assume-zero-is-valid-address.patch \
+"
+
 SRC_URI[md5sum] = "41bee1f8e22b82d82b5f7d7ba51abc2a"
 SRC_URI[sha256sum] = "5bf13104cb327472b5cb65643352a9138646becacc06763088d83001d832d048"
 
-- 
2.5.0


