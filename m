Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E83E7BD8B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 10:35:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 96so11720194wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 02:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5Lfx9j5sWLNDIjc58bL4glslX7wquxVtRIIJ270md4k=;
	b=CXqIm6eND/DKksle2OgOkFa+vokKEn5kaoorzd3jf1YUfnKws5wqRB00KiGKAJ0Ax9
	5+RzXBnQ5AODXfs0ueREaoyhNOUo7RqLNls+agHO7CCqOadGwUpuof4vU1Rqtiuyml7W
	WOFcYMKmLZ4rTkEGtIJvF2s6LA1IurM2d/BDTCtZr6m85nCzOhL9qeyneEwDj5kuV/Mp
	MbN+GldM/R/LK+od91WUCoMDiwSm/Djxb5t/3pYkUiQJQFf0WAxlz4XZxcs3BPcrU71K
	51/TABTswwx2PzANtMqJQkGhyE0ahvly5qpYqM2ZFQCgtSyDXDNgsUEzli7/A1IhudZo
	rvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5Lfx9j5sWLNDIjc58bL4glslX7wquxVtRIIJ270md4k=;
	b=fjzxUvD+X6UspWsqxO4JmdmwBKIfzedty96mmrH6b6BR7XB1YoZmiN1vGQJlbRbxAU
	c8fS5hKncoOewqazTC2pNBy5pN7C1VBZvF3APgrWO8QopKfiUsEFF+LEqjhlWnaUQaWc
	YoI7X5Gm7NvGs0v7pMG2UBklEAVlOwuTDuf7Uzm+wxWlmN8bHyPnkUnJlZ5zI1H/2dUE
	G5RQU/C/3uZ197DgV7ZvXIhIIeHc585qeUo06fNpKeQjQfZ3YvwVgU8YMBAJ+RZRWq5O
	CuDi1jzYzbmgq5NnqEorWiNZhJA7krPa7oDHYlsQ4MDF1Dpsz5eNr+1UYoiqbDC+A1NJ
	8gXA==
X-Gm-Message-State: AA+aEWa7v+Tb6UWIpO4apVI6mAnVUPz2vhvsY3w9DV3JehmHzO8TvRZG
	xSKjGHxXPDd+MLIXsXsV6VvZMyYo
X-Google-Smtp-Source: AFSGD/WHxZlOdg9GlCpxNRrHbz19LTP9h/N2lnKsT+F6fh4XSiQd6rgKu3PCXaeMLfNfI4OZkd91fA==
X-Received: by 2002:adf:9168:: with SMTP id j95mr9744094wrj.217.1545042940673; 
	Mon, 17 Dec 2018 02:35:40 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host184-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.184])
	by smtp.gmail.com with ESMTPSA id
	202sm20165364wmt.8.2018.12.17.02.35.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 02:35:39 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Dec 2018 11:35:26 +0100
Message-Id: <20181217103526.29343-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: implement the --no-dtb option for older mips kernels
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
X-List-Received-Date: Mon, 17 Dec 2018 10:35:40 -0000

Fix borrowed from LEDE-DEV.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../140-mips_disable_devicetree_support.patch | 163 ++++++++++++++++++
 .../kexec/kexec-tools-klibc_git.bb            |   8 +-
 2 files changed, 169 insertions(+), 2 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
new file mode 100644
index 000000000..b3ef3c82d
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
@@ -0,0 +1,163 @@
+From 5ea7cd78cd252ffd3a9f3fbc8dc795d6e1596084 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Mon, 17 Dec 2018 11:25:20 +0100
+Subject: [PATCH] kexec-tools: fix non-device tree devices on mips
+
+Add additional argument '--no-dtb' which disables device tree
+search in currently loaded kernel.
+
+Taken from LEDE-DEV:
+https://patchwork.ozlabs.org/patch/852961/
+
+Rebased for kexec-tools 2.0.18
+Removed ppc change (unwanted ?)
+
+Signed-off-by: Konstantin Kuzov <master.nosferatu@gmail.com>
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ kexec/arch/mips/include/arch/options.h |  4 +-
+ kexec/arch/mips/kexec-elf-mips.c       | 58 ++++++++++++++------------
+ kexec/arch/mips/kexec-mips.c           |  4 ++
+ kexec/arch/mips/kexec-mips.h           |  1 +
+ 4 files changed, 39 insertions(+), 28 deletions(-)
+
+diff --git a/kexec/arch/mips/include/arch/options.h b/kexec/arch/mips/include/arch/options.h
+index 416e224..18d2811 100644
+--- a/kexec/arch/mips/include/arch/options.h
++++ b/kexec/arch/mips/include/arch/options.h
+@@ -5,6 +5,7 @@
+ #define OPT_APPEND	(OPT_ARCH_MAX+0)
+ #define OPT_DTB		(OPT_ARCH_MAX+1)
+ #define OPT_RAMDISK	(OPT_ARCH_MAX+2)
++#define OPT_NO_DTB	(OPT_ARCH_MAX+3)
+ 
+ /* Options relevant to the architecture (excluding loader-specific ones),
+  * in this case none:
+@@ -14,7 +15,8 @@
+ 	{"command-line", 1, 0, OPT_APPEND}, \
+ 	{"append",	 1, 0, OPT_APPEND}, \
+ 	{"dtb",		1, 0, OPT_DTB }, \
+-	{"initrd",	1, 0, OPT_RAMDISK },
++	{"initrd",	1, 0, OPT_RAMDISK }, \
++	{"no-dtb",	0, 0, OPT_NO_DTB },
+ 
+ 
+ #define KEXEC_ARCH_OPT_STR KEXEC_OPT_STR ""
+diff --git a/kexec/arch/mips/kexec-elf-mips.c b/kexec/arch/mips/kexec-elf-mips.c
+index 849a7ba..5c0e535 100644
+--- a/kexec/arch/mips/kexec-elf-mips.c
++++ b/kexec/arch/mips/kexec-elf-mips.c
+@@ -141,35 +141,37 @@ int elf_mips_load(int argc, char **argv, const char *buf, off_t len,
+ 	else
+ 		cmdline_addr = 0;
+ 
+-	/* MIPS systems that have been converted to use device tree
+-	 * passed through UHI will use commandline in the DTB and
+-	 * the DTB passed as a separate buffer. Note that
+-	 * CMDLINE_PREFIX is skipped here intentionally, as it is
+-	 * used only in the legacy method */
+-
+-	if (arch_options.dtb_file) {
+-		dtb_buf = slurp_file(arch_options.dtb_file, &dtb_length);
+-	} else {
+-		create_flatten_tree(&dtb_buf, &dtb_length, cmdline_buf + strlen(CMDLINE_PREFIX));
+-	}
+ 
+-	if (arch_options.initrd_file) {
+-		initrd_buf = slurp_file(arch_options.initrd_file, &initrd_size);
++	if (!arch_options.no_dtb) {
++		/* MIPS systems that have been converted to use device tree
++		 * passed through UHI will use commandline in the DTB and
++		 * the DTB passed as a separate buffer. Note that
++		 * CMDLINE_PREFIX is skipped here intentionally, as it is
++		 * used only in the legacy method */
++
++		if (arch_options.dtb_file) {
++			dtb_buf = slurp_file(arch_options.dtb_file, &dtb_length);
++		} else {
++			create_flatten_tree(&dtb_buf, &dtb_length, cmdline_buf + strlen(CMDLINE_PREFIX));
++		}
+ 
+-		/* Create initrd entries in dtb - although at this time
+-		 * they would not point to the correct location */
+-		dtb_set_initrd(&dtb_buf, &dtb_length, initrd_buf, initrd_buf + initrd_size);
++		if (arch_options.initrd_file) {
++			initrd_buf = slurp_file(arch_options.initrd_file, &initrd_size);
+ 
+-		initrd_base = add_buffer(info, initrd_buf, initrd_size,
+-					initrd_size, sizeof(void *),
+-					_ALIGN_UP(kernel_addr + kernel_size + dtb_length,
+-						pagesize), 0x0fffffff, 1);
++			/* Create initrd entries in dtb - although at this time
++			 * they would not point to the correct location */
++			dtb_set_initrd(&dtb_buf, &dtb_length, initrd_buf, initrd_buf + initrd_size);
+ 
+-		/* Now that the buffer for initrd is prepared, update the dtb
+-		 * with an appropriate location */
+-		dtb_set_initrd(&dtb_buf, &dtb_length, initrd_base, initrd_base + initrd_size);
+-	}
++			initrd_base = add_buffer(info, initrd_buf, initrd_size,
++						initrd_size, sizeof(void *),
++						_ALIGN_UP(kernel_addr + kernel_size + dtb_length,
++							pagesize), 0x0fffffff, 1);
+ 
++			/* Now that the buffer for initrd is prepared, update the dtb
++			 * with an appropriate location */
++			dtb_set_initrd(&dtb_buf, &dtb_length, initrd_base, initrd_base + initrd_size);
++		}
++	}
+ 
+ 	/* This is a legacy method for commandline passing used
+ 	 * currently by Octeon CPUs only */
+@@ -177,9 +179,11 @@ int elf_mips_load(int argc, char **argv, const char *buf, off_t len,
+ 			sizeof(cmdline_buf), sizeof(void *),
+ 			cmdline_addr, 0x0fffffff, 1);
+ 
+-	add_buffer(info, dtb_buf, dtb_length, dtb_length, 0,
+-		_ALIGN_UP(kernel_addr + kernel_size, pagesize),
+-		0x0fffffff, 1);
++	if (!arch_options.no_dtb) {
++		add_buffer(info, dtb_buf, dtb_length, dtb_length, 0,
++			_ALIGN_UP(kernel_addr + kernel_size, pagesize),
++			0x0fffffff, 1);
++	}
+ 
+ 	return 0;
+ }
+diff --git a/kexec/arch/mips/kexec-mips.c b/kexec/arch/mips/kexec-mips.c
+index 415c2ed..e557f8b 100644
+--- a/kexec/arch/mips/kexec-mips.c
++++ b/kexec/arch/mips/kexec-mips.c
+@@ -89,6 +89,7 @@ void arch_usage(void)
+ 	"    --append=STRING       Set the kernel command line to STRING.\n"
+ 	"    --dtb=FILE            Use FILE as the device tree blob.\n"
+ 	"    --initrd=FILE         Use FILE as initial ramdisk.\n"
++	"    --no-dtb              Don't try to find device tree\n"
+ 	);
+ }
+ 
+@@ -121,6 +122,9 @@ int arch_process_options(int argc, char **argv)
+ 		case OPT_RAMDISK:
+ 			arch_options.initrd_file = optarg;
+ 			break;
++		case OPT_NO_DTB:
++			arch_options.no_dtb = 1;
++			break;
+ 		default:
+ 			break;
+ 		}
+diff --git a/kexec/arch/mips/kexec-mips.h b/kexec/arch/mips/kexec-mips.h
+index 222c815..90b21c3 100644
+--- a/kexec/arch/mips/kexec-mips.h
++++ b/kexec/arch/mips/kexec-mips.h
+@@ -22,6 +22,7 @@ struct arch_options_t {
+ 	char *dtb_file;
+ 	char *initrd_file;
+ 	int core_header_type;
++	int no_dtb;
+ };
+ 
+ extern struct memory_ranges usablemem_rgns;
+-- 
+2.17.1
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 25f5da48d..e6e1d4bd3 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -6,14 +6,14 @@ SECTION = "kernel/userland"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
-PV = "2.0.17+git${SRCPV}"
+PV = "2.0.18+git${SRCPV}"
 
 DEPENDS = "zlib xz"
 
 inherit klibc autotools
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git"
-SRCREV = "b9de21ef51a7ceab7122a707c188602eae22c4ee"
+SRCREV = "5750980cdbbc33ef75bfba6660295b932376ce15"
 
 BUILD_PATCHES = "file://0001-force-static-build.patch \
                  file://0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch"
@@ -42,6 +42,9 @@ SRC_URI += "${BUILD_PATCHES} ${KLIBC_PATCHES} ${WARNING_FIXES} ${FROM_OE_CORE}"
 
 SRC_URI_append_arm = " file://arm_crashdump.patch"
 
+SRC_URI_append_mips = " file://140-mips_disable_devicetree_support.patch"
+SRC_URI_append_mipsel = " file://140-mips_disable_devicetree_support.patch"
+
 SRC_URI_append_x86 = " file://x86_sys_io.patch file://x86_basename.patch \
                        file://x86_vfscanf.patch file://x86_kexec_test.patch"
 
@@ -66,6 +69,7 @@ CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/i
 CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 CFLAGS_aarch64_append = "${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
 CFLAGS_mips_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
+CFLAGS_mipsel_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 CFLAGS_mips64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
 CFLAGS_powerpc_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 
-- 
2.17.1


