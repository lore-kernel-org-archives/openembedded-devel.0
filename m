Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0106B6C50D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:09 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id c73so5025478pfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zHa9Peg7o6wdwKOmnM4srnw2VtfQ9r2n2gKFIlfk57s=;
	b=XUi0nsHPMVXP3yB60ILMvjxCccFM6vg9IqWFjtD4FM9bODVDFRSMB+oghjpgQIF+8W
	+vWq6AdmOs3H+WHDPSyDNVtO25cAtn1pAKWq2MJqIGACQg9TpDqvJ9XxIk+P+tSxuu+N
	ekZXc8aHsp1+D9iECFaVfAlusI86cseNh8xvZgC7fV6xDVBGfoXs1+9FxFB/5Tet08Qq
	b5vJaWIxx68iCf0HKoCc9I6exXbIXcWFJdBv1MrdqQ0MxfFbbXIIQU2YrGBdcA618KH8
	gRHyItTvEaD2yDYY5GNGB0zzoC/m71bp8Dn6NHhWg5NdztfFMAkffaiSe3TosQphtf8+
	RhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zHa9Peg7o6wdwKOmnM4srnw2VtfQ9r2n2gKFIlfk57s=;
	b=hh8Ww9AG2zf1bYu2nP/k5mPo5D1dGirsKelpyj370q+0QrMWrPyq23SDaKQDsZapm7
	w8qSnbioGI0DN97iLAyxy2aFhWsQZawEvfy9QEB6Ws9mazA7++JipooE+7GSD13Yn01Z
	j7qK2cb9dbK6AsziQM53AxrFn8/JX1YDNYbBm5v09KhYk4aZmK06htANIjLQUIfreBe+
	zGcZ1jxEww+KwNFuo+P6TRfou8iatH9EU0H6/KMPwVyK9R/h8gDj0XGdW4vg2pku+KtC
	Eu/WKmGbkJtwstoprrT69lZxX0oUXrzL5RTnYX4oFTeMlqrpZT39thgrOUc8/LlJ7wZ0
	CJNQ==
X-Gm-Message-State: AJcUukewskeWHMdQc5n2yAGxcgw/LqsDv6jx+BMw0Okuno/cM5jTOpFy
	Jy20EelpfvPLzrpnsDQcOqMwWNFyAt8=
X-Google-Smtp-Source: ALg8bN47rp5REc51lPIee5zJ13ecleADUzJkna6R/PY6TfXuCPy2fQcUGSHFzt4EFwnBB+Utb7n3AQ==
X-Received: by 2002:a63:4c4e:: with SMTP id m14mr10370631pgl.173.1545600970342;
	Sun, 23 Dec 2018 13:36:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:41 -0800
Message-Id: <20181223213557.7834-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 02/18] breakpad: Update to latest
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:10 -0000
Content-Transfer-Encoding: 8bit

- Drop upstreamed ucontext_t patch
- basename is now available in musl
- Pin ARM-only ISA on armv5 and older arches
- Use COMPATIBLE_HOST instead of COMPATIBLE_MACHINE
- memory.h has been renamed to memory_allocator.h in latest breakpad

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-of-struct-ucontext-with-ucontext_t.patch | 242 ------------------
 .../breakpad/0002-Avoid-using-basename.patch  |  29 ---
 .../0005-md2core-Replace-basename.patch       |  38 ---
 .../recipes-devtools/breakpad/breakpad_git.bb |  15 +-
 4 files changed, 7 insertions(+), 317 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-Replace-use-of-struct-ucontext-with-ucontext_t.patch
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0002-Avoid-using-basename.patch
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0005-md2core-Replace-basename.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Replace-use-of-struct-ucontext-with-ucontext_t.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Replace-use-of-struct-ucontext-with-ucontext_t.patch
deleted file mode 100644
index 07cb8a366e..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Replace-use-of-struct-ucontext-with-ucontext_t.patch
+++ /dev/null
@@ -1,242 +0,0 @@
-From b90c8f3b60bfe5dbed2823620242e9d30b9eb28f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 28 Jun 2017 19:01:18 -0700
-Subject: [PATCH] Replace use of struct ucontext with ucontext_t
-
-glibc 2.26 would not expose struct ucontext anymore
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- .../linux/dump_writer_common/ucontext_reader.cc    | 32 +++++++++++-----------
- .../linux/dump_writer_common/ucontext_reader.h     | 14 +++++-----
- src/client/linux/handler/exception_handler.cc      | 10 +++----
- src/client/linux/handler/exception_handler.h       |  4 +--
- .../linux/microdump_writer/microdump_writer.cc     |  2 +-
- .../linux/minidump_writer/minidump_writer.cc       |  2 +-
- 6 files changed, 32 insertions(+), 32 deletions(-)
-
-diff --git a/src/client/linux/dump_writer_common/ucontext_reader.cc b/src/client/linux/dump_writer_common/ucontext_reader.cc
-index c80724dd..052ce37c 100644
---- a/src/client/linux/dump_writer_common/ucontext_reader.cc
-+++ b/src/client/linux/dump_writer_common/ucontext_reader.cc
-@@ -36,19 +36,19 @@ namespace google_breakpad {
- 
- // Minidump defines register structures which are different from the raw
- // structures which we get from the kernel. These are platform specific
--// functions to juggle the ucontext and user structures into minidump format.
-+// functions to juggle the ucontext_t and user structures into minidump format.
- 
- #if defined(__i386__)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_ESP];
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_EIP];
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                                     const struct _libc_fpstate* fp) {
-   const greg_t* regs = uc->uc_mcontext.gregs;
- 
-@@ -88,15 +88,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
- 
- #elif defined(__x86_64)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_RSP];
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_RIP];
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                                     const struct _libc_fpstate* fpregs) {
-   const greg_t* regs = uc->uc_mcontext.gregs;
- 
-@@ -145,15 +145,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
- 
- #elif defined(__ARM_EABI__)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.arm_sp;
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.arm_pc;
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc) {
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc) {
-   out->context_flags = MD_CONTEXT_ARM_FULL;
- 
-   out->iregs[0] = uc->uc_mcontext.arm_r0;
-@@ -184,15 +184,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc) {
- 
- #elif defined(__aarch64__)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.sp;
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.pc;
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                                     const struct fpsimd_context* fpregs) {
-   out->context_flags = MD_CONTEXT_ARM64_FULL;
- 
-@@ -210,15 +210,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
- 
- #elif defined(__mips__)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[MD_CONTEXT_MIPS_REG_SP];
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.pc;
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc) {
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc) {
- #if _MIPS_SIM == _ABI64
-   out->context_flags = MD_CONTEXT_MIPS64_FULL;
- #elif _MIPS_SIM == _ABIO32
-diff --git a/src/client/linux/dump_writer_common/ucontext_reader.h b/src/client/linux/dump_writer_common/ucontext_reader.h
-index b6e77b4b..2de80b70 100644
---- a/src/client/linux/dump_writer_common/ucontext_reader.h
-+++ b/src/client/linux/dump_writer_common/ucontext_reader.h
-@@ -39,23 +39,23 @@
- 
- namespace google_breakpad {
- 
--// Wraps platform-dependent implementations of accessors to ucontext structs.
-+// Wraps platform-dependent implementations of accessors to ucontext_t structs.
- struct UContextReader {
--  static uintptr_t GetStackPointer(const struct ucontext* uc);
-+  static uintptr_t GetStackPointer(const ucontext_t* uc);
- 
--  static uintptr_t GetInstructionPointer(const struct ucontext* uc);
-+  static uintptr_t GetInstructionPointer(const ucontext_t* uc);
- 
--  // Juggle a arch-specific ucontext into a minidump format
-+  // Juggle a arch-specific ucontext_t into a minidump format
-   //   out: the minidump structure
-   //   info: the collection of register structures.
- #if defined(__i386__) || defined(__x86_64)
--  static void FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+  static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                              const struct _libc_fpstate* fp);
- #elif defined(__aarch64__)
--  static void FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+  static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                              const struct fpsimd_context* fpregs);
- #else
--  static void FillCPUContext(RawContextCPU *out, const ucontext *uc);
-+  static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc);
- #endif
- };
- 
-diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
-index 586d84e9..05936d28 100644
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -457,9 +457,9 @@ bool ExceptionHandler::HandleSignal(int /*sig*/, siginfo_t* info, void* uc) {
-   // Fill in all the holes in the struct to make Valgrind happy.
-   memset(&g_crash_context_, 0, sizeof(g_crash_context_));
-   memcpy(&g_crash_context_.siginfo, info, sizeof(siginfo_t));
--  memcpy(&g_crash_context_.context, uc, sizeof(struct ucontext));
-+  memcpy(&g_crash_context_.context, uc, sizeof(ucontext_t));
- #if defined(__aarch64__)
--  struct ucontext* uc_ptr = (struct ucontext*)uc;
-+  ucontext_t* uc_ptr = (ucontext_t*)uc;
-   struct fpsimd_context* fp_ptr =
-       (struct fpsimd_context*)&uc_ptr->uc_mcontext.__reserved;
-   if (fp_ptr->head.magic == FPSIMD_MAGIC) {
-@@ -468,9 +468,9 @@ bool ExceptionHandler::HandleSignal(int /*sig*/, siginfo_t* info, void* uc) {
-   }
- #elif !defined(__ARM_EABI__) && !defined(__mips__)
-   // FP state is not part of user ABI on ARM Linux.
--  // In case of MIPS Linux FP state is already part of struct ucontext
-+  // In case of MIPS Linux FP state is already part of ucontext_t
-   // and 'float_state' is not a member of CrashContext.
--  struct ucontext* uc_ptr = (struct ucontext*)uc;
-+  ucontext_t* uc_ptr = (ucontext_t*)uc;
-   if (uc_ptr->uc_mcontext.fpregs) {
-     memcpy(&g_crash_context_.float_state, uc_ptr->uc_mcontext.fpregs,
-            sizeof(g_crash_context_.float_state));
-@@ -494,7 +494,7 @@ bool ExceptionHandler::SimulateSignalDelivery(int sig) {
-   // ExceptionHandler::HandleSignal().
-   siginfo.si_code = SI_USER;
-   siginfo.si_pid = getpid();
--  struct ucontext context;
-+  ucontext_t context;
-   getcontext(&context);
-   return HandleSignal(sig, &siginfo, &context);
- }
-diff --git a/src/client/linux/handler/exception_handler.h b/src/client/linux/handler/exception_handler.h
-index daba57e0..25598a29 100644
---- a/src/client/linux/handler/exception_handler.h
-+++ b/src/client/linux/handler/exception_handler.h
-@@ -191,11 +191,11 @@ class ExceptionHandler {
-   struct CrashContext {
-     siginfo_t siginfo;
-     pid_t tid;  // the crashing thread.
--    struct ucontext context;
-+    ucontext_t context;
- #if !defined(__ARM_EABI__) && !defined(__mips__)
-     // #ifdef this out because FP state is not part of user ABI for Linux ARM.
-     // In case of MIPS Linux FP state is already part of struct
--    // ucontext so 'float_state' is not required.
-+    // ucontext_t so 'float_state' is not required.
-     fpstate_t float_state;
- #endif
-   };
-diff --git a/src/client/linux/microdump_writer/microdump_writer.cc b/src/client/linux/microdump_writer/microdump_writer.cc
-index 3764eec2..80ad5c46 100644
---- a/src/client/linux/microdump_writer/microdump_writer.cc
-+++ b/src/client/linux/microdump_writer/microdump_writer.cc
-@@ -593,7 +593,7 @@ class MicrodumpWriter {
- 
-   void* Alloc(unsigned bytes) { return dumper_->allocator()->Alloc(bytes); }
- 
--  const struct ucontext* const ucontext_;
-+  const ucontext_t* const ucontext_;
- #if !defined(__ARM_EABI__) && !defined(__mips__)
-   const google_breakpad::fpstate_t* const float_state_;
- #endif
-diff --git a/src/client/linux/minidump_writer/minidump_writer.cc b/src/client/linux/minidump_writer/minidump_writer.cc
-index d11ba6e5..c7161434 100644
---- a/src/client/linux/minidump_writer/minidump_writer.cc
-+++ b/src/client/linux/minidump_writer/minidump_writer.cc
-@@ -1323,7 +1323,7 @@ class MinidumpWriter {
-   const int fd_;  // File descriptor where the minidum should be written.
-   const char* path_;  // Path to the file where the minidum should be written.
- 
--  const struct ucontext* const ucontext_;  // also from the signal handler
-+  const ucontext_t* const ucontext_;  // also from the signal handler
- #if !defined(__ARM_EABI__) && !defined(__mips__)
-   const google_breakpad::fpstate_t* const float_state_;  // ditto
- #endif
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0002-Avoid-using-basename.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0002-Avoid-using-basename.patch
deleted file mode 100644
index bc62829811..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0002-Avoid-using-basename.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 806964f852773e427fea82a7716d44ce3be4498c Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sun, 1 Feb 2015 14:27:32 +0100
-Subject: [PATCH 2/3] Avoid using basename
-
----
- src/common/linux/dump_symbols.cc | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/common/linux/dump_symbols.cc b/src/common/linux/dump_symbols.cc
-index d029ca14..6ac4a17b 100644
---- a/src/common/linux/dump_symbols.cc
-+++ b/src/common/linux/dump_symbols.cc
-@@ -881,9 +881,9 @@ const char* ElfArchitecture(const typename ElfClass::Ehdr* elf_header) {
- // last slash, or the whole filename if there are no slashes.
- string BaseFileName(const string &filename) {
-   // Lots of copies!  basename's behavior is less than ideal.
--  char* c_filename = strdup(filename.c_str());
--  string base = basename(c_filename);
--  free(c_filename);
-+  const char *c_filename = filename.c_str();
-+  const char *p = strrchr(c_filename, '/');
-+  string base = p ? p+1 : c_filename;
-   return base;
- }
- 
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0005-md2core-Replace-basename.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0005-md2core-Replace-basename.patch
deleted file mode 100644
index 852c1ed2ca..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0005-md2core-Replace-basename.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bbf2b5ed5d93b227df8aea5726727b48e29f6790 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 14 Sep 2017 23:35:40 -0700
-Subject: [PATCH 5/5] md2core: Replace basename()
-
-musl does not provide it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tools/linux/md2core/minidump-2-core.cc | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/tools/linux/md2core/minidump-2-core.cc b/src/tools/linux/md2core/minidump-2-core.cc
-index 6a9e28eb..52b81c22 100644
---- a/src/tools/linux/md2core/minidump-2-core.cc
-+++ b/src/tools/linux/md2core/minidump-2-core.cc
-@@ -107,6 +107,9 @@ struct Options {
- 
- static void
- Usage(int argc, const char* argv[]) {
-+  const char *c_filename = argv[0];;
-+  const char *p = strrchr(c_filename, '/');
-+  const char *base = p ? p+1 : c_filename;
-   fprintf(stderr,
-           "Usage: %s [options] <minidump file>\n"
-           "\n"
-@@ -133,7 +136,7 @@ Usage(int argc, const char* argv[]) {
-           "             lookups to be done in this directory rather than the filesystem\n"
-           "             layout as it exists in the crashing image.  This path should end\n"
-           "             with a slash if it's a directory.  e.g. /var/lib/breakpad/\n"
--          "", basename(argv[0]));
-+          "", base);
- }
- 
- static void
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index d9773c9a6e..2bc0aacb0f 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -19,10 +19,11 @@ PV = "1.0+git${SRCPV}"
 
 SRCREV_FORMAT = "breakpad_gtest_protobuf_lss_gyp"
 
-SRCREV_breakpad = "dea867e76f24e4a68395684b9d1cf24bcef82f20"
+SRCREV_breakpad = "5467393a3d1e7ab929fd01d79971701bf4e2c2c6"
+#v1.8.0
 SRCREV_gtest = "ec44c6c1675c25b9827aacd08c02433cccde7780"
 SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
-SRCREV_lss = "a91633d172407f6c83dd69af11510b37afebb7f9"
+SRCREV_lss = "a89bf7903f3169e6bc7b8efc10a73a7571de21cf"
 SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad \
@@ -30,15 +31,12 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
            git://github.com/google/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;destsuffix=git/src/third_party/lss;name=lss \
            git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp \
-           file://0001-Replace-use-of-struct-ucontext-with-ucontext_t.patch \
            file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \
-           file://0002-Avoid-using-basename.patch \
            file://0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch \
            file://0001-Turn-off-sign-compare-for-musl-libc.patch \
            file://0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch \
            file://0003-Dont-include-stab.h.patch \
            file://0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch \
-           file://0005-md2core-Replace-basename.patch \
            file://0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch \
            file://mcontext.patch \
            file://0001-disable-calls-to-getcontext-with-musl.patch \
@@ -49,7 +47,7 @@ S = "${WORKDIR}/git"
 
 CXXFLAGS += "-D_GNU_SOURCE"
 
-COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
+COMPATIBLE_HOST_powerpc = "null"
 
 do_install_append() {
         install -d ${D}${includedir}
@@ -72,7 +70,7 @@ do_install_append() {
         install -m 0644 ${S}/src/client/linux/minidump_writer/minidump_writer.h ${D}${includedir}/breakpad/client/linux/minidump_writer/minidump_writer.h
 
         install -d ${D}${includedir}/breakpad/common
-        install -m 0644 ${S}/src/common/memory.h ${D}${includedir}/breakpad/common/memory.h
+        install -m 0644 ${S}/src/common/memory_allocator.h ${D}${includedir}/breakpad/common/memory_allocator.h
         install -m 0644 ${S}/src/common/scoped_ptr.h ${D}${includedir}/breakpad/common/scoped_ptr.h
         install -m 0644 ${S}/src/common/using_std_string.h ${D}${includedir}/breakpad/common/using_std_string.h
 
@@ -120,4 +118,5 @@ breakpad_populate_sysroot() {
 #| {standard input}:2184: Error: Thumb does not support this addressing mode -- `str r6,[r1,#-4]!'
 #| {standard input}:2191: Error: lo register required -- `ldr pc,[sp]'
 #| make: *** [src/client/linux/handler/exception_handler.o] Error 1
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.20.1


