Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3F40E78385
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 03:23:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h4so3258664pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 20:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g/bsv0d/QMNryftxO8neLciZ9Vb+X0ZGK+5id3J4XlA=;
	b=pVTeN+Udwy25So8Bl9UL2gRZJHylnrlixHEJMLTcVRXD8OxpPS9c3CM0TcZJ9O9w+C
	uSY2HxIdeEQhDkd6I4J07Lb+dtq4B4bEmgLI/MIQ/VfQFAkLp2RZ40uraHuq0zfaS5SB
	YMMJ+aZhy8mxRGhw0ePGH+s2pwQKYsCSdewIeU+ktlCZ9sEmTii/nyT3VTeh/TirSbe/
	pS/ruWMoT6LL2oxTia51flcV8m9o5Z40gdvDl8h7iFLM9hVyNCsRegWMRNqK/azCGAX8
	dISbeNyTE+aWjXscrjeZPKqvg1cPI3DZbC0MkqamL2DNklny2D1TqJj3y/T73OlFlk/W
	VqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g/bsv0d/QMNryftxO8neLciZ9Vb+X0ZGK+5id3J4XlA=;
	b=JlZEf9TG1qviqu3NWz6/A681q7qEaQdU9QsGa8DzIVzRfjkG1mgniVcNazYC5ksi40
	wx/ApVwdoEHPy6y/1auUf2OJIq7LLRpGGkczxXqMUVIy0myYMjMfbIcSp1XftpiOelPR
	ehXvz4NBn5oT2LR6tBkgyF4pM1o1LDby9AnD9VbI2ySYdJXaI6NVNPYZ5wSJta/pmb1n
	rAS20WOaHzNUVYxtV8X9V4DysR+uY7App5b4hsfNAMpGs+jTN+3O9Gs8u+/kXZeDOVVc
	3v8gXgwpd2yM9/DB9rArwdwVSGhJvcWXuqPIHn4/rKfMpozpPHSViSO0JNVBoWsuExcF
	KMUw==
X-Gm-Message-State: AHPjjUgnvyXz3yADgoffOoAQSMlhrj9ltmVXst19RwkNPPY2IvTIYIwf
	j7u/m+iaGiuNM/zg9F8fSGnvUQ==
X-Google-Smtp-Source: AOwi7QDDcihpBTHl1o15/iRsn2bI+gIxRAnu3E7GRIK2W6Kkqu8kRJg7tC3Ln+cULwu1wrCD4qMjaA==
X-Received: by 10.98.14.27 with SMTP id w27mr7783896pfi.201.1506050613075;
	Thu, 21 Sep 2017 20:23:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	o79sm4517921pfi.108.2017.09.21.20.23.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 20:23:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 20:23:16 -0700
Message-Id: <20170922032316.18616-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922032316.18616-1-raj.khem@gmail.com>
References: <20170922032316.18616-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] breakpad: Fix build with musl/mips
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
X-List-Received-Date: Fri, 22 Sep 2017 03:23:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../breakpad/breakpad/mcontext.patch               | 77 ++++++++++++++++++++++
 .../breakpad/breakpad/mips_asm_sgidefs.patch       |  9 ++-
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb  |  3 +
 3 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch b/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
new file mode 100644
index 000000000..42e073b94
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
@@ -0,0 +1,77 @@
+map the mcontext_t structure for musl
+
+Upstream-Status: Inappropriate[need to consider Android]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: git/src/client/linux/dump_writer_common/thread_info.cc
+===================================================================
+--- git.orig/src/client/linux/dump_writer_common/thread_info.cc
++++ git/src/client/linux/dump_writer_common/thread_info.cc
+@@ -229,7 +229,6 @@ void ThreadInfo::FillCPUContext(RawConte
+ }
+ 
+ #elif defined(__mips__)
+-
+ uintptr_t ThreadInfo::GetInstructionPointer() const {
+   return mcontext.pc;
+ }
+@@ -263,8 +262,11 @@ void ThreadInfo::FillCPUContext(RawConte
+   out->cause = 0; // Not stored in mcontext
+ 
+   for (int i = 0; i < MD_FLOATINGSAVEAREA_MIPS_FPR_COUNT; ++i)
++#ifdef __GLIBC__
+     out->float_save.regs[i] = mcontext.fpregs.fp_r.fp_fregs[i]._fp_fregs;
+-
++#else
++    out->float_save.regs[i] = mcontext.fpregs[i];
++#endif
+   out->float_save.fpcsr = mcontext.fpc_csr;
+ #if _MIPS_SIM == _ABIO32
+   out->float_save.fir = mcontext.fpc_eir;
+Index: git/src/client/linux/dump_writer_common/ucontext_reader.cc
+===================================================================
+--- git.orig/src/client/linux/dump_writer_common/ucontext_reader.cc
++++ git/src/client/linux/dump_writer_common/ucontext_reader.cc
+@@ -247,8 +247,11 @@ void UContextReader::FillCPUContext(RawC
+   out->cause = 0;  // Not reported in signal context.
+ 
+   for (int i = 0; i < MD_FLOATINGSAVEAREA_MIPS_FPR_COUNT; ++i)
++#ifdef __GLIBC__
+     out->float_save.regs[i] = uc->uc_mcontext.fpregs.fp_r.fp_dregs[i];
+-
++#else
++    out->float_save.regs[i] = uc->uc_mcontext.fpregs[i];
++#endif
+   out->float_save.fpcsr = uc->uc_mcontext.fpc_csr;
+ #if _MIPS_SIM == _ABIO32
+   out->float_save.fir = uc->uc_mcontext.fpc_eir;  // Unused.
+Index: git/src/client/linux/minidump_writer/linux_core_dumper.cc
+===================================================================
+--- git.orig/src/client/linux/minidump_writer/linux_core_dumper.cc
++++ git/src/client/linux/minidump_writer/linux_core_dumper.cc
+@@ -196,7 +196,7 @@ bool LinuxCoreDumper::EnumerateThreads()
+         info.tgid = status->pr_pgrp;
+         info.ppid = status->pr_ppid;
+ #if defined(__mips__)
+-#if defined(__ANDROID__)
++#if defined(__ANDROID__) || !defined(__GLIBC__)
+         for (int i = EF_R0; i <= EF_R31; i++)
+           info.mcontext.gregs[i - EF_R0] = status->pr_reg[i];
+ #else  // __ANDROID__
+Index: git/src/tools/linux/md2core/minidump-2-core.cc
+===================================================================
+--- git.orig/src/tools/linux/md2core/minidump-2-core.cc
++++ git/src/tools/linux/md2core/minidump-2-core.cc
+@@ -516,8 +516,12 @@ ParseThreadRegisters(CrashedProcess::Thr
+   thread->mcontext.lo3 = rawregs->lo[2];
+ 
+   for (int i = 0; i < MD_FLOATINGSAVEAREA_MIPS_FPR_COUNT; ++i) {
++#ifdef __GLIBC__
+     thread->mcontext.fpregs.fp_r.fp_fregs[i]._fp_fregs =
+         rawregs->float_save.regs[i];
++#else
++    thread->mcontext.fpregs[i] = rawregs->float_save.regs[i];
++#endif
+   }
+ 
+   thread->mcontext.fpc_csr = rawregs->float_save.fpcsr;
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch b/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
index 678f63d74..19bb56044 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
@@ -2,7 +2,7 @@ Index: lss/linux_syscall_support.h
 ===================================================================
 --- lss.orig/linux_syscall_support.h
 +++ lss/linux_syscall_support.h
-@@ -118,15 +118,7 @@ extern "C" {
+@@ -118,21 +118,13 @@ extern "C" {
  #include <endian.h>
  
  #ifdef __mips__
@@ -18,3 +18,10 @@ Index: lss/linux_syscall_support.h
  #endif
  #endif
  
+ /* The Android NDK's <sys/stat.h> #defines these macros as aliases
+  * to their non-64 counterparts. To avoid naming conflict, remove them. */
+-#ifdef __ANDROID__
++#if defined(__ANDROID__) || (defined(__linux__) && !defined(__glibc__))
+   /* These are restored by the corresponding #pragma pop_macro near
+    * the end of this file. */
+ # pragma push_macro("stat64")
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 1ddd6b565..a17759eb4 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -40,11 +40,14 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
            file://0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch \
            file://0005-md2core-Replace-basename.patch \
            file://0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch \
+           file://mcontext.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
 "
 S = "${WORKDIR}/git"
 
+CXXFLAGS += "-D_GNU_SOURCE"
+
 COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
 
 do_install_append() {
-- 
2.14.1


