Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD547954B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 15:32:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o37-v6so11597074wrf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cqJ/PiNtpu5OMsolXu4rhHczLZ8MTk/+lc+hSq+sfSk=;
	b=furkFlL/XN2Wp7uHhHcP+OrxbymRWJ2fY+givPHflceho3ftcy5NAp9XmePJusNjrc
	gyeyBD0ShAdSRIQWvbx0wk4KORadEQGwP7CkTRPvxeHEXdFvxJPbUavBUpeKZjVpDuo/
	fG1QDYohkt89xv3TD/irfrC+K5UKOeDiDwkt9iUT4nQTs1NEwriNfzVwxAjD/rZFsEoQ
	LUgmPHJddyzQ/s4OpPwCUPTHF9VH/qBi5ohLgJbOhXinSOIEP+WqPtbdVocbyB2bDjPd
	xkEbS4Nq5Or6XXbJ1NTekNFtmp5x7SUXGz5EpShx7QBdDg0OZcVAYvo7UoGFCOzHPXjF
	WnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cqJ/PiNtpu5OMsolXu4rhHczLZ8MTk/+lc+hSq+sfSk=;
	b=GVXa5oYBZAlrWLbVRspgQc75K1JXBfBpYG6iboKm/fkwf7vwX7CNSoD1FuQruxTcwF
	vxN1DFnCtzIuH1cmysjX5/5Crf9g49zFoZTHsr5oVgAOo/Hbk0hpbhhOkr5kiXVUYPAd
	N6eZSfBzDM6Hjq2GTfHvZKJbb6N8KrrSCct4ZIG/9ZYVr/llzVjP2RiXugdwXHdmQBwy
	Sh9jF6fINvvwOiYAzIGByb/1ssAyh6mTYBsDm/JAQUS0sj6WyvaBZwmNuz4JDCI8x40A
	NuKh8uFVbERyw048vNBTIMeA644JAgjjMV5VLUiL16LX7eIj1sdQEPgukrH2l7du060G
	npQg==
X-Gm-Message-State: APzg51DhyOhAUvLDr+v15sLVNzwuV7sj3WRD3A3s7hZJxbWvkteeccVM
	muoS1894n9XSrj2DabW1gJ0SGfsO
X-Google-Smtp-Source: ANB0VdYYf5zAO4xfy8BvNqaK3sfzBpv4pjPO+psGTDtmshxCC1f7zdNvIdJqkOLGku1/+mzR1Q6/bw==
X-Received: by 2002:a5d:51cf:: with SMTP id
	n15-v6mr11866290wrv.107.1535729528551; 
	Fri, 31 Aug 2018 08:32:08 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host63-251-dynamic.54-79-r.retail.telecomitalia.it. [79.54.251.63])
	by smtp.gmail.com with ESMTPSA id
	n5-v6sm3455323wmh.1.2018.08.31.08.32.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Aug 2018 08:32:07 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 17:31:50 +0200
Message-Id: <1535729510-13040-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: add kexec-x32.patch from oe-core
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
X-List-Received-Date: Fri, 31 Aug 2018 15:32:08 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

This is the last patch borrowed from the actual oe-core recipe.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../kexec/kexec-tools-klibc/kexec-x32.patch        | 88 ++++++++++++++++++++++
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb  |  3 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch
new file mode 100644
index 0000000..26d18eb
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/kexec-x32.patch
@@ -0,0 +1,88 @@
+x86_64: Add support to build kexec-tools with x32 ABI
+
+Summary of changes,
+
+configure.ac: Add test for detect x32 ABI.
+purgatory/arch/x86_64/Makefile: Not use mcmodel large when
+	x32 ABI is set.
+kexec/arch/x86_64/kexec-elf-rel-x86_64.c: When x32 ABI is set
+	use ELFCLASS32 instead of ELFCLASS64.
+kexec/kexec-syscall.h: Add correct syscall number for x32 ABI.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
+
+---
+ configure.ac                             | 9 +++++++++
+ kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 4 ++++
+ kexec/kexec-syscall.h                    | 4 ++++
+ purgatory/arch/x86_64/Makefile           | 4 +++-
+ 4 files changed, 20 insertions(+), 1 deletion(-)
+
+Index: kexec-tools-2.0.10/configure.ac
+===================================================================
+--- kexec-tools-2.0.10.orig/configure.ac
++++ kexec-tools-2.0.10/configure.ac
+@@ -56,6 +56,15 @@ case $target_cpu in
+ 		;;
+ 	ia64|x86_64|alpha|m68k )
+ 		ARCH="$target_cpu"
++
++		dnl ---Test for x32 ABI in x86_64
++		if test "x$ARCH" = "xx86_64" ; then
++			AC_EGREP_CPP(x32_test,
++			[#if defined(__x86_64__) && defined (__ILP32__)
++				x32_test
++			#endif
++			], SUBARCH='x32', SUBARCH='64')
++		fi
+ 		;;
+ 	* )
+ 		AC_MSG_ERROR([unsupported architecture $target_cpu])
+Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
++++ kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_eh
+ 	if (ehdr->ei_data != ELFDATA2LSB) {
+ 		return 0;
+ 	}
++#ifdef __ILP32__
++	if (ehdr->ei_class != ELFCLASS32) {
++#else
+ 	if (ehdr->ei_class != ELFCLASS64) {
++#endif
+ 		return 0;
+ 	}
+ 	if (ehdr->e_machine != EM_X86_64) {
+Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/kexec-syscall.h
++++ kexec-tools-2.0.10/kexec/kexec-syscall.h
+@@ -31,8 +31,12 @@
+ #define __NR_kexec_load		268
+ #endif
+ #ifdef __x86_64__
++#ifdef __ILP32__
++#define __NR_kexec_load		528
++#else
+ #define __NR_kexec_load		246
+ #endif
++#endif
+ #ifdef __s390x__
+ #define __NR_kexec_load		277
+ #endif
+Index: kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
+===================================================================
+--- kexec-tools-2.0.10.orig/purgatory/arch/x86_64/Makefile
++++ kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
+@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/
+ x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
+ x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
+ 
+-x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
++ifeq ($(SUBARCH),64)
++        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
++endif
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 7558b57..d6d3dc8 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -35,7 +35,8 @@ KLIBC_PATCHES += " \
 
 WARNING_FIXES = ""
 FROM_OE_CORE = "file://arm_crashdump-fix-buffer-align.patch \
-                file://powerpc_change-the-memory-size-limit.patch"
+                file://powerpc_change-the-memory-size-limit.patch \
+                file://kexec-x32.patch"
 
 SRC_URI += "${BUILD_PATCHES} ${KLIBC_PATCHES} ${WARNING_FIXES} ${FROM_OE_CORE}"
 
-- 
2.7.4


