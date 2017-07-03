Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D881271ADD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jul 2017 01:14:27 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j186so21345679pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jul 2017 18:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3IeBEO6C/GyZf9c0NFZ6B5sWDUx39vbBlSeU1SfO2b4=;
	b=bz16cRZnZDpnJZnMLKN8Jg0ZIuaPAmvlzLtJB5gilni/oKM8tgOorzU0/tMJdWwVZI
	ivrS7mucUUfK1FDICkVJ/OQ/l44YtgJCxCyoFEppW8nXHUoFIn1ebzyRSfYa6QTnSie3
	j1OnQ0rEj2ozg47R049/FulHEjs0JOqUoS5rwU0KIhKt7oWBmW8/8+hVU5QjwUBnuizi
	okgYDLkpCwNWoI2S3fBd9tj71r9q0brmCfxqO9aXowM6acq+pR5qhyy740ZHg8WxkQJy
	3YGMP7p5oOuaGHwUPVWSagYz9u3u+Je27AAyredkCWQi3f9ktPIoAYO9uo4JcUJc2tCh
	8EdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3IeBEO6C/GyZf9c0NFZ6B5sWDUx39vbBlSeU1SfO2b4=;
	b=hWNZSKTNoXXW5DOUGvRJia0rzUb8D9gBC4CrtnV7sIRb5/eWptJZC4qOttP9LFjcwF
	AZOQR3VvDtCJ5j4m2E5JPpJaZCN+LW/ycsslwHoZ3sPDJjmsLTKYjtb66uC85Bec8J3V
	nGL7ksL0iX2BgwH72yqKcMmFSZJXr6Q16XmCKoKdrg2CLllpXVJFCiWM1orBAi7mU9kv
	yfMO2nKhHL1e7G8kXQssjedakkGLWYSeaksYP5h7Ks69LEdm1d4r73jIAJI1pbIUKgBP
	yyqa7NVmtgwsv0uf4/vjwbbu1y768S7XLSEmYfiWJh3UUlKV5lAuk6CDphlFCIfTtAE8
	8FOA==
X-Gm-Message-State: AIVw113/QuFhN/DiCNSPkaDt/GO1hzyJhugtDqSFdK22JUY9RPMMJMZK
	+IXdbtI2WDPcG3de
X-Received: by 10.84.247.16 with SMTP id n16mr7682539pll.74.1499044468167;
	Sun, 02 Jul 2017 18:14:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	y72sm31378570pfk.72.2017.07.02.18.14.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Jul 2017 18:14:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jul 2017 18:14:16 -0700
Message-Id: <20170703011416.10360-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-browser][PATCH] chromium: Fix build with security flags
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
X-List-Received-Date: Mon, 03 Jul 2017 01:14:28 -0000

Also fix build with glibc 2.26 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-browser/chromium/chromium-browser.inc      |   2 +
 ...264-disable-format-security-warning.patch.patch |  37 ++++
 ...2-replace-struct-ucontext-with-ucontext_t.patch | 225 +++++++++++++++++++++
 3 files changed, 264 insertions(+)
 create mode 100644 recipes-browser/chromium/files/0001-openh264-disable-format-security-warning.patch.patch
 create mode 100644 recipes-browser/chromium/files/0002-replace-struct-ucontext-with-ucontext_t.patch

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index 08853b1..8e1df34 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -28,6 +28,8 @@ SRC_URI = "\
         file://unset-madv-free.patch \
         file://0001-v8-fix-build-with-gcc7.patch \
         file://0002-WebKit-fix-build-with-gcc7.patch \
+	file://0001-openh264-disable-format-security-warning.patch.patch \
+	file://0002-replace-struct-ucontext-with-ucontext_t.patch \
 "
 
 S = "${WORKDIR}/chromium-${PV}"
diff --git a/recipes-browser/chromium/files/0001-openh264-disable-format-security-warning.patch.patch b/recipes-browser/chromium/files/0001-openh264-disable-format-security-warning.patch.patch
new file mode 100644
index 0000000..6d92e9c
--- /dev/null
+++ b/recipes-browser/chromium/files/0001-openh264-disable-format-security-warning.patch.patch
@@ -0,0 +1,37 @@
+From 677aef7548a5cf545a99eb8f2f6761435a745e3d Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Sun, 2 Jul 2017 14:30:38 -0700
+Subject: [PATCH] openh264: disable-format-security-warning.patch
+
+---
+ third_party/openh264/BUILD.gn     | 1 +
+ third_party/openh264/openh264.gyp | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/third_party/openh264/BUILD.gn b/third_party/openh264/BUILD.gn
+index 1b1ea416f..ad6db3381 100644
+--- a/third_party/openh264/BUILD.gn
++++ b/third_party/openh264/BUILD.gn
+@@ -18,6 +18,7 @@ config("config") {
+   if (!is_win || is_clang) {
+     cflags += [
+       "-Wno-format",
++      "-Wno-format-security",
+       "-Wno-header-hygiene",
+       "-Wno-unused-function",
+       "-Wno-unused-value",
+diff --git a/third_party/openh264/openh264.gyp b/third_party/openh264/openh264.gyp
+index 388e65500..42b14ada5 100644
+--- a/third_party/openh264/openh264.gyp
++++ b/third_party/openh264/openh264.gyp
+@@ -15,6 +15,7 @@
+         'variables': {
+           'openh264_cflags_add': [
+             '-Wno-format',
++            '-Wno-format-security',
+             '-Wno-unused-value',
+           ],
+           'openh264_cflags_remove': [
+-- 
+2.13.2
+
diff --git a/recipes-browser/chromium/files/0002-replace-struct-ucontext-with-ucontext_t.patch b/recipes-browser/chromium/files/0002-replace-struct-ucontext-with-ucontext_t.patch
new file mode 100644
index 0000000..f323972
--- /dev/null
+++ b/recipes-browser/chromium/files/0002-replace-struct-ucontext-with-ucontext_t.patch
@@ -0,0 +1,225 @@
+From b6a312ed8e144a37da840ae50dbd39df5ffb7e9f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 2 Jul 2017 16:34:54 -0700
+Subject: [PATCH 2/2] replace struct ucontext with ucontext_t
+
+glibc 2.26 does not expose struct ucontext any longer
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../linux/dump_writer_common/ucontext_reader.cc    | 30 +++++++++++-----------
+ .../linux/dump_writer_common/ucontext_reader.h     | 10 ++++----
+ .../src/client/linux/handler/exception_handler.cc  |  8 +++---
+ .../src/client/linux/handler/exception_handler.h   |  2 +-
+ .../linux/microdump_writer/microdump_writer.cc     |  2 +-
+ .../linux/minidump_writer/minidump_writer.cc       |  2 +-
+ 6 files changed, 27 insertions(+), 27 deletions(-)
+
+diff --git a/breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc b/breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc
+index c80724dd8..93b4d9f85 100644
+--- a/breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc
++++ b/breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc
+@@ -40,15 +40,15 @@ namespace google_breakpad {
+ 
+ #if defined(__i386__)
+ 
+-uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.gregs[REG_ESP];
+ }
+ 
+-uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.gregs[REG_EIP];
+ }
+ 
+-void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
++void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
+                                     const struct _libc_fpstate* fp) {
+   const greg_t* regs = uc->uc_mcontext.gregs;
+ 
+@@ -88,15 +88,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
+ 
+ #elif defined(__x86_64)
+ 
+-uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.gregs[REG_RSP];
+ }
+ 
+-uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.gregs[REG_RIP];
+ }
+ 
+-void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
++void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
+                                     const struct _libc_fpstate* fpregs) {
+   const greg_t* regs = uc->uc_mcontext.gregs;
+ 
+@@ -145,15 +145,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
+ 
+ #elif defined(__ARM_EABI__)
+ 
+-uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.arm_sp;
+ }
+ 
+-uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.arm_pc;
+ }
+ 
+-void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc) {
++void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc) {
+   out->context_flags = MD_CONTEXT_ARM_FULL;
+ 
+   out->iregs[0] = uc->uc_mcontext.arm_r0;
+@@ -184,15 +184,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc) {
+ 
+ #elif defined(__aarch64__)
+ 
+-uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.sp;
+ }
+ 
+-uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.pc;
+ }
+ 
+-void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
++void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
+                                     const struct fpsimd_context* fpregs) {
+   out->context_flags = MD_CONTEXT_ARM64_FULL;
+ 
+@@ -210,15 +210,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
+ 
+ #elif defined(__mips__)
+ 
+-uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.gregs[MD_CONTEXT_MIPS_REG_SP];
+ }
+ 
+-uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
++uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
+   return uc->uc_mcontext.pc;
+ }
+ 
+-void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc) {
++void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc) {
+ #if _MIPS_SIM == _ABI64
+   out->context_flags = MD_CONTEXT_MIPS64_FULL;
+ #elif _MIPS_SIM == _ABIO32
+diff --git a/breakpad/src/client/linux/dump_writer_common/ucontext_reader.h b/breakpad/src/client/linux/dump_writer_common/ucontext_reader.h
+index b6e77b4b5..2369a9ad3 100644
+--- a/breakpad/src/client/linux/dump_writer_common/ucontext_reader.h
++++ b/breakpad/src/client/linux/dump_writer_common/ucontext_reader.h
+@@ -41,21 +41,21 @@ namespace google_breakpad {
+ 
+ // Wraps platform-dependent implementations of accessors to ucontext structs.
+ struct UContextReader {
+-  static uintptr_t GetStackPointer(const struct ucontext* uc);
++  static uintptr_t GetStackPointer(const ucontext_t* uc);
+ 
+-  static uintptr_t GetInstructionPointer(const struct ucontext* uc);
++  static uintptr_t GetInstructionPointer(const ucontext_t* uc);
+ 
+   // Juggle a arch-specific ucontext into a minidump format
+   //   out: the minidump structure
+   //   info: the collection of register structures.
+ #if defined(__i386__) || defined(__x86_64)
+-  static void FillCPUContext(RawContextCPU *out, const ucontext *uc,
++  static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
+                              const struct _libc_fpstate* fp);
+ #elif defined(__aarch64__)
+-  static void FillCPUContext(RawContextCPU *out, const ucontext *uc,
++  static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
+                              const struct fpsimd_context* fpregs);
+ #else
+-  static void FillCPUContext(RawContextCPU *out, const ucontext *uc);
++  static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc);
+ #endif
+ };
+ 
+diff --git a/breakpad/src/client/linux/handler/exception_handler.cc b/breakpad/src/client/linux/handler/exception_handler.cc
+index b63f973b8..f2688acaf 100644
+--- a/breakpad/src/client/linux/handler/exception_handler.cc
++++ b/breakpad/src/client/linux/handler/exception_handler.cc
+@@ -439,9 +439,9 @@ bool ExceptionHandler::HandleSignal(int sig, siginfo_t* info, void* uc) {
+   // Fill in all the holes in the struct to make Valgrind happy.
+   memset(&g_crash_context_, 0, sizeof(g_crash_context_));
+   memcpy(&g_crash_context_.siginfo, info, sizeof(siginfo_t));
+-  memcpy(&g_crash_context_.context, uc, sizeof(struct ucontext));
++  memcpy(&g_crash_context_.context, uc, sizeof(ucontext_t));
+ #if defined(__aarch64__)
+-  struct ucontext* uc_ptr = (struct ucontext*)uc;
++  ucontext_t* uc_ptr = (ucontext_t*)uc;
+   struct fpsimd_context* fp_ptr =
+       (struct fpsimd_context*)&uc_ptr->uc_mcontext.__reserved;
+   if (fp_ptr->head.magic == FPSIMD_MAGIC) {
+@@ -452,7 +452,7 @@ bool ExceptionHandler::HandleSignal(int sig, siginfo_t* info, void* uc) {
+   // FP state is not part of user ABI on ARM Linux.
+   // In case of MIPS Linux FP state is already part of struct ucontext
+   // and 'float_state' is not a member of CrashContext.
+-  struct ucontext* uc_ptr = (struct ucontext*)uc;
++  ucontext_t* uc_ptr = (ucontext_t*)uc;
+   if (uc_ptr->uc_mcontext.fpregs) {
+     memcpy(&g_crash_context_.float_state, uc_ptr->uc_mcontext.fpregs,
+            sizeof(g_crash_context_.float_state));
+@@ -476,7 +476,7 @@ bool ExceptionHandler::SimulateSignalDelivery(int sig) {
+   // ExceptionHandler::HandleSignal().
+   siginfo.si_code = SI_USER;
+   siginfo.si_pid = getpid();
+-  struct ucontext context;
++  ucontext_t context;
+   getcontext(&context);
+   return HandleSignal(sig, &siginfo, &context);
+ }
+diff --git a/breakpad/src/client/linux/handler/exception_handler.h b/breakpad/src/client/linux/handler/exception_handler.h
+index 591c31085..846df772f 100644
+--- a/breakpad/src/client/linux/handler/exception_handler.h
++++ b/breakpad/src/client/linux/handler/exception_handler.h
+@@ -191,7 +191,7 @@ class ExceptionHandler {
+   struct CrashContext {
+     siginfo_t siginfo;
+     pid_t tid;  // the crashing thread.
+-    struct ucontext context;
++    ucontext_t context;
+ #if !defined(__ARM_EABI__) && !defined(__mips__)
+     // #ifdef this out because FP state is not part of user ABI for Linux ARM.
+     // In case of MIPS Linux FP state is already part of struct
+diff --git a/breakpad/src/client/linux/microdump_writer/microdump_writer.cc b/breakpad/src/client/linux/microdump_writer/microdump_writer.cc
+index 6f5b43559..a508667a0 100644
+--- a/breakpad/src/client/linux/microdump_writer/microdump_writer.cc
++++ b/breakpad/src/client/linux/microdump_writer/microdump_writer.cc
+@@ -571,7 +571,7 @@ class MicrodumpWriter {
+ 
+   void* Alloc(unsigned bytes) { return dumper_->allocator()->Alloc(bytes); }
+ 
+-  const struct ucontext* const ucontext_;
++  const ucontext_t* const ucontext_;
+ #if !defined(__ARM_EABI__) && !defined(__mips__)
+   const google_breakpad::fpstate_t* const float_state_;
+ #endif
+diff --git a/breakpad/src/client/linux/minidump_writer/minidump_writer.cc b/breakpad/src/client/linux/minidump_writer/minidump_writer.cc
+index 86009b9f6..f2aec73d7 100644
+--- a/breakpad/src/client/linux/minidump_writer/minidump_writer.cc
++++ b/breakpad/src/client/linux/minidump_writer/minidump_writer.cc
+@@ -1248,7 +1248,7 @@ class MinidumpWriter {
+   const int fd_;  // File descriptor where the minidum should be written.
+   const char* path_;  // Path to the file where the minidum should be written.
+ 
+-  const struct ucontext* const ucontext_;  // also from the signal handler
++  const ucontext_t* const ucontext_;  // also from the signal handler
+ #if !defined(__ARM_EABI__) && !defined(__mips__)
+   const google_breakpad::fpstate_t* const float_state_;  // ditto
+ #endif
+-- 
+2.13.2
+
-- 
2.13.2


