Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D759793E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 15:10:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v17-v6so11544910wrr.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1qDWi4LfmNEl9DnXte9NYO9gVVYte/oarSX9F7ocYUA=;
	b=KnsO586XP4DWNCdWO6kSc5u3jyG5cLpr3Sl4yXsb/XHftejp9Iqsdme0YeBw8xqn5T
	c1uiTVwejT5yUSl8f++6oLpgdXPJrduxkrgA9o2CQwRnAG6K94YoM24BA/q95aUb0+Ej
	uRtN+inHEzQHslLPBPBwMImOiqRF/i76hwK23cXNRfWgG8myXYwTo7VLKOpDSxQO+nGZ
	70KtbLgUr98YnO09rxnjgMKdTYYBU7Yq9VlI6LXNRRCQqR0lj0CyPIdElXfPXiQApWWy
	caOANOZeM0rAaiRq7H6hlA6pzw7yOQr17EWX5sRlZKkJBeAOcNgNhnUcb6YlT6LdKhnm
	eBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1qDWi4LfmNEl9DnXte9NYO9gVVYte/oarSX9F7ocYUA=;
	b=LGFWBgsqrHlVcd5MMgh2+zdNeqJjlZZiRfd317dBNe2hdq3RLNa7oh9nwa6n7enyqk
	/TLLV3py/WiVzg91jogWRRU/cPIxG/jPgm8r1TNal4cdPNEDQSUHpiUnd0W0ZHlgKtr/
	Yb9JKnrg9ClQFoAuocw2tS8k9eC1Bk2b0a83I854JOGHm1KPq7MG/SkfQHlBRQwmcjnF
	zXCx5c/U92/eCowfOaGGtqIQg4zU+EKLFtfbBf48BZdlYzXT83jAg/heGN+a6v6WH0dj
	fzKPLvFpunv8Sn0iJFRIsB9KFa0zH6Y5NU7/knBy8lEX/exJ6SKg4FJJJodLp3A9FlVj
	v0SA==
X-Gm-Message-State: APzg51A++ESRJwG1PfuWUvEdfaugIq8ceOy2Fe1/5ksMtJ1onhwiDLWY
	+SkpeSDCHfp304bI6y+En+Vj7knZ
X-Google-Smtp-Source: ANB0Vday0D3rVdAlG6xtcfCmtR9KiX/EA9VJKG6Rc7xbZPhGb/Gzq19ZolD7VY+8Z7QLmBW3kH5AmQ==
X-Received: by 2002:a5d:4fc3:: with SMTP id
	h3-v6mr11247659wrw.261.1535728254887; 
	Fri, 31 Aug 2018 08:10:54 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host63-251-dynamic.54-79-r.retail.telecomitalia.it. [79.54.251.63])
	by smtp.gmail.com with ESMTPSA id
	v133-v6sm5971073wma.36.2018.08.31.08.10.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Aug 2018 08:10:54 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 17:10:50 +0200
Message-Id: <1535728250-24761-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: sync patches with oe-core
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
X-List-Received-Date: Fri, 31 Aug 2018 15:10:55 -0000

Following patches have been imported:

 0001-Disable-PIE-during-link.patch
 0001-purgatory-Pass-r-directly-to-linker.patch
The two above are in the now modified
 0011-purgatory-Makefile-adapt-to-klcc.patch

These two have been imported and renamed:
0002-powerpc-change-the-memory-size-limit.patch
0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../0011-purgatory-Makefile-adapt-to-klcc.patch    |  2 +-
 .../arm_crashdump-fix-buffer-align.patch           | 44 ++++++++++++++++++++++
 .../powerpc_change-the-memory-size-limit.patch     | 35 +++++++++++++++++
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb  |  4 +-
 4 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
index a459d45..636151b 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
@@ -28,7 +28,7 @@ index 49ce80a..72eefaa 100644
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
 -			-Wl,--no-undefined -nostartfiles -nostdlib \
 -			-nodefaultlibs -e purgatory_start -r \
-+			-Wl,--no-undefined -Wl,-nostartfiles -Wl,-nostdlib \
++			-Wl,--no-undefined -Wl,-no-pie -Wl,-nostartfiles -Wl,-nostdlib \
 +			-Wl,-nodefaultlibs -Wl,--entry=purgatory_start -Wl,-r \
  			-Wl,-Map=$(PURGATORY_MAP)
  
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
new file mode 100644
index 0000000..c6afdfa
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
@@ -0,0 +1,44 @@
+From 06b0d43c20f7c6200902d4c6db3d33416877f71c Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 26 Aug 2018 21:40:06 +0200
+Subject: [PATCH 1/1] arm- backport from oe-core
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ kexec/arch/arm/crashdump-arm.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
+index 2530b29..af2600d 100644
+--- a/kexec/arch/arm/crashdump-arm.c
++++ b/kexec/arch/arm/crashdump-arm.c
+@@ -240,6 +240,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+ 	void *buf;
+ 	int err;
+ 	int last_ranges;
++	unsigned short align_bit_shift = 20;
+ 
+ 	/*
+ 	 * First fetch all the memory (RAM) ranges that we are going to pass to
+@@ -281,6 +282,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+ 
+ 		/* for support LPAE enabled kernel*/
+ 		elf_info.class = ELFCLASS64;
++		align_bit_shift = 21;
+ 
+ 		err = crash_create_elf64_headers(info, &elf_info,
+ 					 usablemem_rgns.ranges,
+@@ -302,8 +304,9 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+ 	 * 1MB) so that available memory passed in kernel command line will be
+ 	 * aligned to 1MB. This is because kernel create_mapping() wants memory
+ 	 * regions to be aligned to SECTION_SIZE.
++	 * The SECTION_SIZE of LPAE kernel is '1UL << 21' defined in pgtable-3level.h
+ 	 */
+-	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << 20,
++	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << align_bit_shift,
+ 					  crash_kernel_mem.start,
+ 					  crash_kernel_mem.end, -1, 0);
+ 
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch
new file mode 100644
index 0000000..dc97d93
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc_change-the-memory-size-limit.patch
@@ -0,0 +1,35 @@
+From b19b68eab567aa534cf8dec79fe18e3dc0e14043 Mon Sep 17 00:00:00 2001
+From: Quanyang Wang <quanyang.wang@windriver.com>
+Date: Tue, 16 Jun 2015 12:59:57 +0800
+Subject: [PATCH] powerpc: change the memory size limit
+
+When run "kexec" in powerpc board, the kexec has a limit that
+the kernel text and bss size must be less than 24M. But now
+some kernel size exceed the limit. So we need to change the limit,
+else will get the error log as below:
+
+my_load:669: do
+Could not find a free area of memory of 0x12400 bytes...
+Could not find a free area of memory of 0x13000 bytes...
+locate_hole failed
+
+Upstream-Status: Pending
+
+Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
+---
+ kexec/arch/ppc/kexec-ppc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/arch/ppc/kexec-ppc.h
++++ kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
+@@ -42,7 +42,7 @@ void dol_ppc_usage(void);
+  * During inital setup the kernel does not map the whole memory but a part of
+  * it. On Book-E that is 64MiB, 601 24MiB or 256MiB (if possible).
+  */
+-#define KERNEL_ACCESS_TOP (24 * 1024 * 1024)
++#define KERNEL_ACCESS_TOP (36 * 1024 * 1024)
+ 
+ /* boot block version 17 as defined by the linux kernel */
+ struct bootblock {
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 4518e70..d5f6738 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -34,8 +34,10 @@ KLIBC_PATCHES += " \
             file://0015-vmcore-dmesg-fix-warning.patch"
 
 WARNING_FIXES = ""
+FROM_OE_CORE = "file://arm_crashdump-fix-buffer-align.patch \
+                file://powerpc_change-the-memory-size-limit.patch"
 
-SRC_URI += "${BUILD_PATCHES} ${KLIBC_PATCHES} ${WARNING_FIXES}"
+SRC_URI += "${BUILD_PATCHES} ${KLIBC_PATCHES} ${WARNING_FIXES} ${FROM_OE_CORE}"
 
 SRC_URI_append_arm = " file://arm_crashdump.patch"
 
-- 
2.7.4


