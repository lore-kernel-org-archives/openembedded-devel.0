Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A62417833E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:55:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA32tbNn025167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Nov 2017 19:55:37 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 2 Nov 2017 19:55:37 -0700
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Nov 2017 22:55:35 -0400
Message-ID: <1509677735-140167-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [oe-core][PATCH] kexec-tools: fix Unknown type (Reserved) and ELF core parse error when run kexec
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
X-List-Received-Date: Fri, 03 Nov 2017 02:55:36 -0000
Content-Type: text/plain

When run kexec on NUC7i7BNH/NUC7i5BNH, got the following error:

"Please report this as bug. Using RANGE_RESERVED now"
"ELF core (kcore) parse failed"

Apply three upstream patches to fix it.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 ...andle-additional-e820-memmap-type-strings.patch | 42 +++++++++++++++++
 ...ild_mem_phdrs-check-if-p_paddr-is-invalid.patch | 45 ++++++++++++++++++
 ...x86-Support-large-number-of-memory-ranges.patch | 55 ++++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |  3 ++
 4 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-Handle-additional-e820-memmap-type-strings.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-build_mem_phdrs-check-if-p_paddr-is-invalid.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-x86-Support-large-number-of-memory-ranges.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Handle-additional-e820-memmap-type-strings.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-Handle-additional-e820-memmap-type-strings.patch
new file mode 100644
index 000000000000..e5216c3aaea7
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-Handle-additional-e820-memmap-type-strings.patch
@@ -0,0 +1,42 @@
+From fab91841c717150aca4bc73e4c54769305e27ade Mon Sep 17 00:00:00 2001
+From: Eric DeVolder <eric.devolder@oracle.com>
+Date: Wed, 10 May 2017 11:03:37 -0500
+Subject: [PATCH] Handle additional e820 memmap type strings
+
+Keep pace with changes to linux arch/x86/kernel/e820.c to
+function e820_type_to_string(). With this change, the following
+messages from kexec are eliminated (and allows kexec to load):
+
+ Unknown type (Reserved) while parsing /sys/firmware/memmap/8/type.
+ Please report this as bug. Using RANGE_RESERVED now.
+
+ Unknown type (Unknown E820 type) while parsing /sys/firmware/memmap/4/type.
+ Please report this as bug. Using RANGE_RESERVED now.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=fab91841c717150aca4bc73e4c54769305e27ade]
+
+Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ kexec/firmware_memmap.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/kexec/firmware_memmap.c b/kexec/firmware_memmap.c
+index 4d84f0011c57..1ee214aa9316 100644
+--- a/kexec/firmware_memmap.c
++++ b/kexec/firmware_memmap.c
+@@ -164,6 +164,10 @@ static int parse_memmap_entry(const char *entry, struct memory_range *range)
+ 		range->type = RANGE_RESERVED;
+ 	else if (strcmp(type, "reserved") == 0)
+ 		range->type = RANGE_RESERVED;
++	else if (strcmp(type, "Reserved") == 0)
++		range->type = RANGE_RESERVED;
++	else if (strcmp(type, "Unknown E820 type") == 0)
++		range->type = RANGE_RESERVED;
+ 	else if (strcmp(type, "ACPI Non-volatile Storage") == 0)
+ 		range->type = RANGE_ACPI_NVS;
+ 	else if (strcmp(type, "Uncached RAM") == 0)
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-build_mem_phdrs-check-if-p_paddr-is-invalid.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-build_mem_phdrs-check-if-p_paddr-is-invalid.patch
new file mode 100644
index 000000000000..a16d60ddade4
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-build_mem_phdrs-check-if-p_paddr-is-invalid.patch
@@ -0,0 +1,45 @@
+From ed15ba1b9977e506637ff1697821d97127b2c919 Mon Sep 17 00:00:00 2001
+From: Pratyush Anand <panand@redhat.com>
+Date: Wed, 1 Mar 2017 11:19:42 +0530
+Subject: [PATCH] build_mem_phdrs(): check if p_paddr is invalid
+
+Currently, all the p_paddr of PT_LOAD headers are assigned to 0, which
+is not correct and could be misleading, since 0 is a valid physical
+address.
+
+Upstream kernel commit "464920104bf7 /proc/kcore: update physical
+address for kcore ram and text" fixed it and now invalid PT_LOAD is
+assigned as -1.
+
+kexec/arch/i386/crashdump-x86.c:get_kernel_vaddr_and_size() uses kcore
+interface and so calls build_mem_phdrs() for kcore PT_LOAD headers.
+
+This patch fixes build_mem_phdrs() to check if p_paddr is invalid.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=ed15ba1b9977e506637ff1697821d97127b2c919]
+
+Signed-off-by: Pratyush Anand <panand@redhat.com>
+Acked-by: Dave Young <dyoung@redhat.com>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ kexec/kexec-elf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/kexec/kexec-elf.c b/kexec/kexec-elf.c
+index 1d6320a2f0e6..be60bbd48486 100644
+--- a/kexec/kexec-elf.c
++++ b/kexec/kexec-elf.c
+@@ -432,7 +432,8 @@ static int build_mem_phdrs(const char *buf, off_t len, struct mem_ehdr *ehdr,
+ 			}
+ 			return -1;
+ 		}
+-		if ((phdr->p_paddr + phdr->p_memsz) < phdr->p_paddr) {
++		if (phdr->p_paddr != (unsigned long long)-1 &&
++			(phdr->p_paddr + phdr->p_memsz) < phdr->p_paddr) {
+ 			/* The memory address wraps */
+ 			if (probe_debug) {
+ 				fprintf(stderr, "ELF address wrap around\n");
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-Support-large-number-of-memory-ranges.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-Support-large-number-of-memory-ranges.patch
new file mode 100644
index 000000000000..d8adb3376eff
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-Support-large-number-of-memory-ranges.patch
@@ -0,0 +1,55 @@
+From 4a6d67d9e938a7accf128aff23f8ad4bda67f729 Mon Sep 17 00:00:00 2001
+From: Xunlei Pang <xlpang@redhat.com>
+Date: Thu, 23 Mar 2017 19:16:59 +0800
+Subject: [PATCH] x86: Support large number of memory ranges
+
+We got a problem on one SGI 64TB machine, the current kexec-tools
+failed to work due to the insufficient ranges(MAX_MEMORY_RANGES)
+allowed which is defined as 1024(less than the ranges on the machine).
+The kcore header is insufficient due to the same reason as well.
+
+To solve this, this patch simply doubles "MAX_MEMORY_RANGES" and
+"KCORE_ELF_HEADERS_SIZE".
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=4a6d67d9e938a7accf128aff23f8ad4bda67f729]
+
+Signed-off-by: Xunlei Pang <xlpang@redhat.com>
+Tested-by: Frank Ramsay <frank.ramsay@hpe.com>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ kexec/arch/i386/kexec-x86.h | 2 +-
+ kexec/crashdump.h           | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/kexec/arch/i386/kexec-x86.h b/kexec/arch/i386/kexec-x86.h
+index 33df3524f4e2..51855f8db762 100644
+--- a/kexec/arch/i386/kexec-x86.h
++++ b/kexec/arch/i386/kexec-x86.h
+@@ -1,7 +1,7 @@
+ #ifndef KEXEC_X86_H
+ #define KEXEC_X86_H
+ 
+-#define MAX_MEMORY_RANGES 1024
++#define MAX_MEMORY_RANGES 2048
+ 
+ enum coretype {
+ 	CORE_TYPE_UNDEF = 0,
+diff --git a/kexec/crashdump.h b/kexec/crashdump.h
+index 86e1ef2523ca..18bd691c33e2 100644
+--- a/kexec/crashdump.h
++++ b/kexec/crashdump.h
+@@ -7,8 +7,8 @@ extern int get_xen_vmcoreinfo(uint64_t *addr, uint64_t *len);
+ 
+ /* Need to find a better way to determine per cpu notes section size. */
+ #define MAX_NOTE_BYTES		1024
+-/* Expecting ELF headers to fit in 32K. Increase it if you need more. */
+-#define KCORE_ELF_HEADERS_SIZE  32768
++/* Expecting ELF headers to fit in 64K. Increase it if you need more. */
++#define KCORE_ELF_HEADERS_SIZE  65536
+ /* The address of the ELF header is passed to the secondary kernel
+  * using the kernel command line option memmap=nnn.
+  * The smallest unit the kernel accepts is in kilobytes,
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
index bd89720e5bb1..79307fecb42c 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
@@ -21,6 +21,9 @@ SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.g
             file://kexec-x32.patch \
             file://0001-Disable-PIE-during-link.patch \
             file://0001-arm64-Disable-PIC.patch \
+            file://0001-build_mem_phdrs-check-if-p_paddr-is-invalid.patch \
+            file://0001-x86-Support-large-number-of-memory-ranges.patch \
+            file://0001-Handle-additional-e820-memmap-type-strings.patch \
          "
 
 SRC_URI[md5sum] = "b2b2c5e6b29d467d6e99d587fb6b7cf5"
-- 
2.7.4


