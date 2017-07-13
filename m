Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4C86FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 07:42:08 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id z6so6238979pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 00:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z3VGMDXKi+tjzwx5gwmDKDyVJsgar3Zs7P69s6U58ag=;
	b=nvRvU/LbbTiAaGSToDwRV8R8DCLap0N1z7BJtATLm0bBCVwTeX02fuPtgThb47jzZI
	zGyVaNyyHZw3Nw0qafcR0xss0upgSz5THUJZ1vU9iLtJqWxQ5S8yVQIcKv0C3g0XTd9J
	aVJkUVizwoZu6IKEgLaliZpehxGT1Wul0utdkVRAsYS6aNTgw6QdYhYT1U97QkOUpN9U
	jTsz6xrDSr2JgcF7AkwrjQDmE7ZkUi1W/7qH56DUiA4l/YRxG1vRkMb7LPaOdx+iy+lD
	rzsZEp6zpO2fI5hmT4UIAV/o44hUvcVbQejCyeEzLD/dH3XAoRTpvht+TmmdTGgmwpMH
	xMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z3VGMDXKi+tjzwx5gwmDKDyVJsgar3Zs7P69s6U58ag=;
	b=AjrJlCz9SLjUGP3dmyXc+XyaT3EFz2hYykiCDs+I5t6fC9cvC4zNbIMMd8quyEB/3e
	sOJPtXsqTyxLZ/uC5tZG4YgEgXWOUKzoZmmh+kcYoMW47q6QvPTZxmOBlq7dlO0dPvsS
	BwzkDxrzjRMYaVVi/96QubleHYBvAt1Iu6QHP21m1xKVfqvzm0Ols5/x90OoKreFCUrg
	V3zTFzNexRt2bEY0Dke19mZnA9qQtwFK/3rukRx8s/gAPLG5P6z15u6bX49LFzFWuchV
	yjfu8ZFschQ00/Yhv+3YIYH3uCn4YuI20JgMev7wlbjV04+qshj4sSNw/oWoBU5/yAEw
	bZxA==
X-Gm-Message-State: AIVw112XIR4xpTbrplF4p5jfbz4m24SwZi/hcroNii+Khrlp8FeCS/Ui
	klAYtne3WcpxywKD
X-Received: by 10.84.133.226 with SMTP id f89mr8502941plf.11.1499931728591;
	Thu, 13 Jul 2017 00:42:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z6sm11473952pff.46.2017.07.13.00.42.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 00:42:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 00:41:52 -0700
Message-Id: <20170713074154.10606-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-qt5][PATCH 1/3] qtwebengine: Fix build on musl
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
X-List-Received-Date: Thu, 13 Jul 2017 07:42:08 -0000

import needed chromium patches from meta-browser

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Define-TEMP_FAILURE_RETRY-if-not-defined.patch | 35 ++++++++++
 ...03-Avoid-mallinfo-APIs-on-non-glibc-linux.patch | 48 +++++++++++++
 .../0004-include-fcntl.h-for-loff_t.patch          | 25 +++++++
 ...off64_t-instead-of-the-internal-__off64_t.patch | 65 +++++++++++++++++
 .../0006-linux-glibc-make-the-distinction.patch    | 26 +++++++
 ...o-not-include-glibc_weak_symbols-for-musl.patch | 26 +++++++
 ...-member-name-__si_fields-from-LinuxSigInf.patch | 26 +++++++
 .../0009-Match-syscalls-to-match-musl.patch        | 47 +++++++++++++
 ...ninit-and-res_nclose-for-non-glibc-platfo.patch | 81 ++++++++++++++++++++++
 .../0011-Do-not-define-__sbrk-on-musl.patch        | 29 ++++++++
 .../0012-Adjust-default-pthread-stack-size.patch   | 51 ++++++++++++++
 ...3-include-asm-generic-ioctl.h-for-TCGETS2.patch | 25 +++++++
 .../0014-link-with-libexecinfo-on-musl.patch       | 25 +++++++
 ...tcmalloc-Use-off64_t-insread-of-__off64_t.patch | 26 +++++++
 recipes-qt/qt5/qtwebengine_git.bb                  | 31 ++++++++-
 15 files changed, 565 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0004-include-fcntl.h-for-loff_t.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-use-off64_t-instead-of-the-internal-__off64_t.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0006-linux-glibc-make-the-distinction.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0009-Match-syscalls-to-match-musl.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0011-Do-not-define-__sbrk-on-musl.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0012-Adjust-default-pthread-stack-size.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0013-include-asm-generic-ioctl.h-for-TCGETS2.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0014-link-with-libexecinfo-on-musl.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch b/recipes-qt/qt5/qtwebengine/0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch
new file mode 100644
index 0000000..c56cfc7
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch
@@ -0,0 +1,35 @@
+From 89d6283c91f2229cc51f473eed344de97d09e946 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 14:01:12 -0700
+Subject: [PATCH 01/12] sandbox: Define TEMP_FAILURE_RETRY if not defined
+
+Musl does not define this Macro
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sandbox/linux/suid/sandbox.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/sandbox/linux/suid/sandbox.c b/sandbox/linux/suid/sandbox.c
+index b655d1c79..3de34e36f 100644
+--- a/sandbox/linux/suid/sandbox.c
++++ b/sandbox/linux/suid/sandbox.c
+@@ -44,6 +44,15 @@ static bool DropRoot();
+ 
+ #define HANDLE_EINTR(x) TEMP_FAILURE_RETRY(x)
+ 
++#ifndef TEMP_FAILURE_RETRY
++# define TEMP_FAILURE_RETRY(expression) \
++	(__extension__			\
++	 ({ long int __result;		\
++	  do __result = (long int) (expression); \
++	  while (__result == -1L && errno == EINTR); \
++	  __result; }))
++#endif
++
+ static void FatalError(const char* msg, ...)
+     __attribute__((noreturn, format(printf, 1, 2)));
+ 
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
new file mode 100644
index 0000000..2e0b1f0
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -0,0 +1,48 @@
+From 8defe37306b0d1548592afc12baa45f4aec5375c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 14:09:06 -0700
+Subject: [PATCH 03/12] Avoid mallinfo() APIs on non-glibc/linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ base/trace_event/malloc_dump_provider.cc | 3 ++-
+ content/child/content_child_helpers.cc   | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/base/trace_event/malloc_dump_provider.cc b/base/trace_event/malloc_dump_provider.cc
+index 3b1a933bc..a554d0373 100644
+--- a/base/trace_event/malloc_dump_provider.cc
++++ b/base/trace_event/malloc_dump_provider.cc
+@@ -103,6 +103,7 @@ MallocDumpProvider::~MallocDumpProvider() {}
+ // the current process.
+ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
+                                       ProcessMemoryDump* pmd) {
++#if defined(__GLIBC__)
+   size_t total_virtual_size = 0;
+   size_t resident_size = 0;
+   size_t allocated_objects_size = 0;
+@@ -195,7 +196,7 @@ bool MallocDumpProvider::OnMemoryDump(const MemoryDumpArgs& args,
+     pmd->DumpHeapUsage(metrics_by_context, overhead, "malloc");
+   }
+   tid_dumping_heap_ = kInvalidThreadId;
+-
++#endif // __GLIBC__
+   return true;
+ }
+ 
+diff --git a/content/child/content_child_helpers.cc b/content/child/content_child_helpers.cc
+index 7ddeb4d16..b8c73b09c 100644
+--- a/content/child/content_child_helpers.cc
++++ b/content/child/content_child_helpers.cc
+@@ -25,7 +25,7 @@ namespace content {
+ // though, this provides only a partial and misleading value.
+ // Unfortunately some telemetry benchmark rely on it and these need to
+ // be refactored before getting rid of this. See crbug.com/581365 .
+-#if defined(OS_LINUX) || defined(OS_ANDROID)
++#if defined(__GLIBC__) || defined(OS_ANDROID)
+ size_t GetMemoryUsageKB() {
+   struct mallinfo minfo = mallinfo();
+   uint64_t mem_usage =
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0004-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0004-include-fcntl.h-for-loff_t.patch
new file mode 100644
index 0000000..da8503b
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0004-include-fcntl.h-for-loff_t.patch
@@ -0,0 +1,25 @@
+From a0b40dcdfb3331d2b8351bdfb27f1ba3e8a2c33c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 14:37:49 -0700
+Subject: [PATCH 04/12] include fcntl.h for loff_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/tcmalloc/chromium/src/base/linux_syscall_support.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
+index bdbc4b7e3..b53dd46c5 100644
+--- a/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
++++ b/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
+@@ -151,6 +151,7 @@ extern "C" {
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <string.h>
++#include <fcntl.h>
+ #include <sys/ptrace.h>
+ #include <sys/resource.h>
+ #include <sys/time.h>
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0005-use-off64_t-instead-of-the-internal-__off64_t.patch b/recipes-qt/qt5/qtwebengine/0005-use-off64_t-instead-of-the-internal-__off64_t.patch
new file mode 100644
index 0000000..d552a34
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0005-use-off64_t-instead-of-the-internal-__off64_t.patch
@@ -0,0 +1,65 @@
+From badea43b85346525b7c43c38c32d150b7eb85b13 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 14:38:37 -0700
+Subject: [PATCH 05/12] use off64_t instead of the internal __off64_t
+
+- only do the glibc 32-bit ABI check for mmap/mmap64 on gnu libc. musl
+  does not support the 32-bit ABI.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h b/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
+index 715c045f6..edc8cf2db 100644
+--- a/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
++++ b/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
+@@ -77,7 +77,7 @@ typedef off64_t __off64_t;
+ 
+ static inline void* do_mmap64(void *start, size_t length,
+                               int prot, int flags,
+-                              int fd, __off64_t offset) __THROW {
++                              int fd, off64_t offset) __THROW {
+   // The original gperftools uses sys_mmap() here.  But, it is not allowed by
+   // Chromium's sandbox.
+   return (void *)syscall(SYS_mmap, start, length, prot, flags, fd, offset);
+@@ -90,7 +90,7 @@ static inline void* do_mmap64(void *start, size_t length,
+ 
+ static inline void* do_mmap64(void *start, size_t length,
+                               int prot, int flags,
+-                              int fd, __off64_t offset) __THROW {
++                              int fd, off64_t offset) __THROW {
+   void *result;
+ 
+   // Try mmap2() unless it's not supported
+@@ -161,7 +161,7 @@ static inline void* do_mmap64(void *start, size_t length,
+ 
+ extern "C" {
+   void* mmap64(void *start, size_t length, int prot, int flags,
+-               int fd, __off64_t offset  ) __THROW
++               int fd, off64_t offset  ) __THROW
+     ATTRIBUTE_SECTION(malloc_hook);
+   void* mmap(void *start, size_t length,int prot, int flags,
+              int fd, off_t offset) __THROW
+@@ -178,7 +178,7 @@ extern "C" {
+ }
+ 
+ extern "C" void* mmap64(void *start, size_t length, int prot, int flags,
+-                        int fd, __off64_t offset) __THROW {
++                        int fd, off64_t offset) __THROW {
+   MallocHook::InvokePreMmapHook(start, length, prot, flags, fd, offset);
+   void *result;
+   if (!MallocHook::InvokeMmapReplacement(
+@@ -189,7 +189,7 @@ extern "C" void* mmap64(void *start, size_t length, int prot, int flags,
+   return result;
+ }
+ 
+-# if !defined(__USE_FILE_OFFSET64) || !defined(__REDIRECT_NTH)
++# if defined(__GLIBC__) && (!defined(__USE_FILE_OFFSET64) || !defined(__REDIRECT_NTH))
+ 
+ extern "C" void* mmap(void *start, size_t length, int prot, int flags,
+                       int fd, off_t offset) __THROW {
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0006-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0006-linux-glibc-make-the-distinction.patch
new file mode 100644
index 0000000..257d873
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0006-linux-glibc-make-the-distinction.patch
@@ -0,0 +1,26 @@
+From 4913850cd644e1fd44ecade5e9faa460de35a7d6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 14:54:38 -0700
+Subject: [PATCH 06/12] linux != glibc, make the distinction
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ base/allocator/allocator_check.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/allocator/allocator_check.cc b/base/allocator/allocator_check.cc
+index 5a0564d2f..8c2dc6491 100644
+--- a/base/allocator/allocator_check.cc
++++ b/base/allocator/allocator_check.cc
+@@ -21,7 +21,7 @@ bool IsAllocatorInitialized() {
+ #if defined(OS_WIN) && defined(ALLOCATOR_SHIM)
+   // Set by allocator_shim_win.cc when the shimmed _set_new_mode() is called.
+   return g_is_win_shim_layer_initialized;
+-#elif defined(OS_LINUX) && defined(USE_TCMALLOC) && \
++#elif defined(__GLIBC__) && defined(USE_TCMALLOC) && \
+     !defined(MEMORY_TOOL_REPLACES_ALLOCATOR)
+ // From third_party/tcmalloc/chromium/src/gperftools/tcmalloc.h.
+ // TODO(primiano): replace with an include once base can depend on allocator.
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch b/recipes-qt/qt5/qtwebengine/0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch
new file mode 100644
index 0000000..b999c59
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch
@@ -0,0 +1,26 @@
+From 482e77e9562b8a158b5b212e9f1c83c697fed2e2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 15:09:02 -0700
+Subject: [PATCH 07/12] allocator: Do not include glibc_weak_symbols for musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ base/allocator/allocator_shim.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/allocator/allocator_shim.cc b/base/allocator/allocator_shim.cc
+index 57a398aaa..54c79063a 100644
+--- a/base/allocator/allocator_shim.cc
++++ b/base/allocator/allocator_shim.cc
+@@ -263,7 +263,7 @@ void ShimFree(void* address) {
+ // In the case of tcmalloc we also want to plumb into the glibc hooks
+ // to avoid that allocations made in glibc itself (e.g., strdup()) get
+ // accidentally performed on the glibc heap instead of the tcmalloc one.
+-#if defined(USE_TCMALLOC)
++#if defined(USE_TCMALLOC) && defined(__GLIBC__)
+ #include "base/allocator/allocator_shim_override_glibc_weak_symbols.h"
+ #endif
+ 
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch b/recipes-qt/qt5/qtwebengine/0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch
new file mode 100644
index 0000000..3bd0a9d
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch
@@ -0,0 +1,26 @@
+From 3d12eb821e105111cbd88f5598746bd77c3a9ef0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 15:12:39 -0700
+Subject: [PATCH 08/12] Use correct member name __si_fields from LinuxSigInfo
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sandbox/linux/seccomp-bpf/trap.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sandbox/linux/seccomp-bpf/trap.cc b/sandbox/linux/seccomp-bpf/trap.cc
+index 003708d2c..0fef3148f 100644
+--- a/sandbox/linux/seccomp-bpf/trap.cc
++++ b/sandbox/linux/seccomp-bpf/trap.cc
+@@ -168,7 +168,7 @@ void Trap::SigSys(int nr, LinuxSigInfo* info, ucontext_t* ctx) {
+   // most versions of glibc don't include this information in siginfo_t. So,
+   // we need to explicitly copy it into a arch_sigsys structure.
+   struct arch_sigsys sigsys;
+-  memcpy(&sigsys, &info->_sifields, sizeof(sigsys));
++  memcpy(&sigsys, &info->__si_fields, sizeof(sigsys));
+ 
+ #if defined(__mips__)
+   // When indirect syscall (syscall(__NR_foo, ...)) is made on Mips, the
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0009-Match-syscalls-to-match-musl.patch b/recipes-qt/qt5/qtwebengine/0009-Match-syscalls-to-match-musl.patch
new file mode 100644
index 0000000..bfb6ebb
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0009-Match-syscalls-to-match-musl.patch
@@ -0,0 +1,47 @@
+From 5843df01580b0fb956ee4b7e1a60c0130c8c90f9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 15:24:49 -0700
+Subject: [PATCH 09/12] Match syscalls to match musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/lss/linux_syscall_support.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/third_party/lss/linux_syscall_support.h b/third_party/lss/linux_syscall_support.h
+index 9dbd2391b..a715de177 100644
+--- a/third_party/lss/linux_syscall_support.h
++++ b/third_party/lss/linux_syscall_support.h
+@@ -793,6 +793,14 @@ struct kernel_statfs {
+ #endif
+ 
+ 
++#undef stat64
++#undef fstat64
++
++#ifndef __NR_fstatat
++#define __NR_fstatat __NR_fstatat64
++#endif
++
++
+ #if defined(__x86_64__)
+ #ifndef ARCH_SET_GS
+ #define ARCH_SET_GS             0x1001
+@@ -1210,6 +1218,14 @@ struct kernel_statfs {
+ #ifndef __NR_fallocate
+ #define __NR_fallocate          285
+ #endif
++
++#ifndef __NR_pread
++#define __NR_pread __NR_pread64
++#endif
++#ifndef __NR_pwrite
++#define __NR_pwrite __NR_pwrite64
++#endif
++
+ /* End of x86-64 definitions                                                 */
+ #elif defined(__mips__)
+ #if _MIPS_SIM == _MIPS_SIM_ABI32
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch b/recipes-qt/qt5/qtwebengine/0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch
new file mode 100644
index 0000000..1825ed7
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch
@@ -0,0 +1,81 @@
+From df3fd62f7f0c51c11e7f715c2523418c31eb6b0f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 15:27:50 -0700
+Subject: [PATCH 10/12] Define res_ninit and res_nclose for non-glibc platforms
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ net/dns/dns_config_service_posix.cc |  4 ++++
+ net/dns/dns_reloader.cc             |  4 ++++
+ net/dns/resolv_compat.h             | 29 +++++++++++++++++++++++++++++
+ 3 files changed, 37 insertions(+)
+ create mode 100644 net/dns/resolv_compat.h
+
+diff --git a/net/dns/dns_config_service_posix.cc b/net/dns/dns_config_service_posix.cc
+index ba8a36913..e9b40d07f 100644
+--- a/net/dns/dns_config_service_posix.cc
++++ b/net/dns/dns_config_service_posix.cc
+@@ -25,6 +25,10 @@
+ #include "net/dns/notify_watcher_mac.h"
+ #include "net/dns/serial_worker.h"
+ 
++#if defined(OS_LINUX) && !defined(__GLIBC__)
++#include "net/dns/resolv_compat.h"
++#endif
++
+ #if defined(OS_MACOSX) && !defined(OS_IOS)
+ #include "net/dns/dns_config_watcher_mac.h"
+ #endif
+diff --git a/net/dns/dns_reloader.cc b/net/dns/dns_reloader.cc
+index 74534e6b1..2780a776e 100644
+--- a/net/dns/dns_reloader.cc
++++ b/net/dns/dns_reloader.cc
+@@ -9,6 +9,10 @@
+ 
+ #include <resolv.h>
+ 
++#if defined(OS_LINUX) && !defined(__GLIBC__)
++#include "net/dns/resolv_compat.h"
++#endif
++
+ #include "base/lazy_instance.h"
+ #include "base/logging.h"
+ #include "base/macros.h"
+diff --git a/net/dns/resolv_compat.h b/net/dns/resolv_compat.h
+new file mode 100644
+index 000000000..4f0e852a1
+--- /dev/null
++++ b/net/dns/resolv_compat.h
+@@ -0,0 +1,29 @@
++#if !defined(__GLIBC__)
++/***************************************************************************
++ * resolv_compat.h
++ *
++ * Mimick GLIBC's res_ninit() and res_nclose() for musl libc
++ * Note: res_init() is actually deprecated according to
++ * http://docs.oracle.com/cd/E36784_01/html/E36875/res-nclose-3resolv.html
++ **************************************************************************/
++#include <string.h>
++
++static inline int res_ninit(res_state statp)
++{
++	int rc = res_init();
++	if (statp != &_res) {
++		memcpy(statp, &_res, sizeof(*statp));
++	}
++	return rc;
++}
++
++static inline int res_nclose(res_state statp)
++{
++	if (!statp)
++		return -1;
++	if (statp != &_res) {
++		memset(statp, 0, sizeof(*statp));
++	}
++	return 0;
++}
++#endif
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0011-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0011-Do-not-define-__sbrk-on-musl.patch
new file mode 100644
index 0000000..a2c2b90
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0011-Do-not-define-__sbrk-on-musl.patch
@@ -0,0 +1,29 @@
+From 8a6553232988a5bfc8f0c48d4214a3982025fb2c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 15:39:57 -0700
+Subject: [PATCH 11/12] Do not define __sbrk on musl
+
+musl libc does not have sbrk. on musl libc will only work when called with 0 as
+argument, so we just let it out for now
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h b/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
+index edc8cf2db..a868b50d3 100644
+--- a/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
++++ b/third_party/tcmalloc/chromium/src/malloc_hook_mmap_linux.h
+@@ -233,7 +233,7 @@ extern "C" void* mremap(void* old_addr, size_t old_size, size_t new_size,
+ }
+ 
+ // Don't hook sbrk() in Android, since it doesn't expose __sbrk.
+-#if !defined(__ANDROID__)
++#if !defined(__ANDROID__) && defined(__GLIBC__)
+ // libc's version:
+ extern "C" void* __sbrk(ptrdiff_t increment);
+ 
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0012-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0012-Adjust-default-pthread-stack-size.patch
new file mode 100644
index 0000000..de2ec97
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0012-Adjust-default-pthread-stack-size.patch
@@ -0,0 +1,51 @@
+From 65d516f64c1cca91868cb26aeb93802382704fd5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 16:41:23 -0700
+Subject: [PATCH 1/2] Adjust default pthread stack size
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ base/threading/platform_thread_linux.cc                     | 3 ++-
+ chrome/browser/chrome_browser_main_posix.cc                 | 9 +++++++++
+ third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp | 4 ++--
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/base/threading/platform_thread_linux.cc b/base/threading/platform_thread_linux.cc
+index 95ed32418..666e85ba3 100644
+--- a/base/threading/platform_thread_linux.cc
++++ b/base/threading/platform_thread_linux.cc
+@@ -96,7 +96,8 @@ void TerminateOnThread() {}
+ 
+ size_t GetDefaultThreadStackSize(const pthread_attr_t& attributes) {
+ #if !defined(THREAD_SANITIZER)
+-  return 0;
++  // use 8mb like glibc to avoid running out of space
++  return (1 << 23);
+ #else
+   // ThreadSanitizer bloats the stack heavily. Evidence has been that the
+   // default stack size isn't enough for some browser tests.
+diff --git a/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp b/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
+index 3c0a0395b..2af6073e2 100644
+--- a/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
++++ b/third_party/WebKit/Source/platform/heap/StackFrameDepth.cpp
+@@ -73,7 +73,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize()
+     // FIXME: On Mac OSX and Linux, this method cannot estimate stack size
+     // correctly for the main thread.
+ 
+-#if defined(__GLIBC__) || OS(ANDROID) || OS(FREEBSD)
++#if OS(LINUX) || OS(ANDROID) || OS(FREEBSD)
+     // pthread_getattr_np() can fail if the thread is not invoked by
+     // pthread_create() (e.g., the main thread of webkit_unit_tests).
+     // If so, a conservative size estimate is returned.
+@@ -135,7 +135,7 @@ size_t StackFrameDepth::getUnderestimatedStackSize()
+ 
+ void* StackFrameDepth::getStackStart()
+ {
+-#if defined(__GLIBC__) || OS(ANDROID) || OS(FREEBSD)
++#if OS(LINUX) || OS(ANDROID) || OS(FREEBSD)
+     pthread_attr_t attr;
+     int error;
+ #if OS(FREEBSD)
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0013-include-asm-generic-ioctl.h-for-TCGETS2.patch b/recipes-qt/qt5/qtwebengine/0013-include-asm-generic-ioctl.h-for-TCGETS2.patch
new file mode 100644
index 0000000..abe2eaf
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0013-include-asm-generic-ioctl.h-for-TCGETS2.patch
@@ -0,0 +1,25 @@
+From d5014cf9a97cf97a6e9bb7f751c7cee3c24e17fd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 17:15:34 -0700
+Subject: [PATCH 1/2] include asm-generic/ioctl.h for TCGETS2
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ device/serial/serial_io_handler_posix.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/device/serial/serial_io_handler_posix.cc b/device/serial/serial_io_handler_posix.cc
+index 158c374a0..c08fb4a8e 100644
+--- a/device/serial/serial_io_handler_posix.cc
++++ b/device/serial/serial_io_handler_posix.cc
+@@ -6,6 +6,7 @@
+ 
+ #include <sys/ioctl.h>
+ #include <termios.h>
++#include <asm-generic/ioctls.h>
+ 
+ #include "base/posix/eintr_wrapper.h"
+ #include "build/build_config.h"
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0014-link-with-libexecinfo-on-musl.patch b/recipes-qt/qt5/qtwebengine/0014-link-with-libexecinfo-on-musl.patch
new file mode 100644
index 0000000..1b65420
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0014-link-with-libexecinfo-on-musl.patch
@@ -0,0 +1,25 @@
+From 4b5aab95e34e1cbebc7566c1267cddc2560601c8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 17:41:43 -0700
+Subject: [PATCH 2/2] link with libexecinfo on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ base/base.gyp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/base/base.gyp b/base/base.gyp
+index 67e051ae4..7f5dfe214 100644
+--- a/base/base.gyp
++++ b/base/base.gyp
+@@ -126,6 +126,7 @@
+               '-lrt',
+               # For 'native_library_linux.cc'
+               '-ldl',
++              '-lexecinfo',
+             ],
+           },
+           'conditions': [
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch b/recipes-qt/qt5/qtwebengine/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch
new file mode 100644
index 0000000..2ef5433
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch
@@ -0,0 +1,26 @@
+From 1a468dd5239ebdf013d9ffb3a2d181d0434b4c6c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Jul 2017 09:08:23 -0700
+Subject: [PATCH 2/2] tcmalloc: Use off64_t insread of __off64_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/tcmalloc/chromium/src/base/linux_syscall_support.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h b/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
+index b53dd46c5..58da4d19d 100644
+--- a/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
++++ b/third_party/tcmalloc/chromium/src/base/linux_syscall_support.h
+@@ -1930,7 +1930,7 @@ typedef unsigned long int ulong;
+   #if defined(__x86_64__)
+     /* Need to make sure __off64_t isn't truncated to 32-bits under x32.  */
+     LSS_INLINE void* LSS_NAME(mmap)(void *s, size_t l, int p, int f, int d,
+-                                    __off64_t o) {
++                                    off64_t o) {
+       LSS_BODY(6, void*, mmap, LSS_SYSCALL_ARG(s), LSS_SYSCALL_ARG(l),
+                                LSS_SYSCALL_ARG(p), LSS_SYSCALL_ARG(f),
+                                LSS_SYSCALL_ARG(d), (uint64_t)(o));
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index e319a01..033bdaa 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -24,7 +24,13 @@ DEPENDS += " \
 "
 
 DEPENDS += "yasm-native"
-EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm GYP_CONFIG+=generate_character_data=0"
+DEPENDS_append_libc-musl = " libexecinfo"
+
+EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm \
+                        GYP_CONFIG+=generate_character_data=0 \
+                        GYP_CONFIG+=use_allocator=none \
+                        GYP_CONFIG+=use_experimental_allocator_shim=false \
+"
 
 # To use system ffmpeg you need to enable also libwebp, opus, vpx											    
 # Only depenedencies available in oe-core are enabled by default
@@ -88,6 +94,13 @@ do_configure() {
         -after ${EXTRA_QMAKEVARS_POST}
 }
 
+do_configure_prepend_libc-musl() {
+        for f in `find ${S}/src/3rdparty/chromium/third_party/ffmpeg/chromium/config/Chromium/linux/ -name config.h -o -name config.asm`; do
+                sed -i -e "s:define HAVE_SYSCTL 1:define HAVE_SYSCTL 0:g" $f
+        done
+        sed -i -e "s:define HAVE_STRUCT_MALLINFO 1:/*undef HAVE_STRUCT_MALLINFO */:g" ${S}/src/3rdparty/chromium/third_party/tcmalloc/chromium/src/config_linux.h
+}
+
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 
 do_install_append() {
@@ -119,6 +132,22 @@ SRC_URI += " \
     file://0003-chromium-v8-fix-build-with-gcc7.patch;patchdir=src/3rdparty \
     file://0004-chromium-WebKit-fix-build-with-gcc7.patch;patchdir=src/3rdparty \
 "
+SRC_URI_append_libc-musl = "\
+    file://0001-sandbox-Define-TEMP_FAILURE_RETRY-if-not-defined.patch;patchdir=src/3rdparty/chromium \
+    file://0003-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty/chromium \
+    file://0004-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty/chromium \
+    file://0005-use-off64_t-instead-of-the-internal-__off64_t.patch;patchdir=src/3rdparty/chromium \
+    file://0006-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty/chromium \
+    file://0007-allocator-Do-not-include-glibc_weak_symbols-for-musl.patch;patchdir=src/3rdparty/chromium \
+    file://0008-Use-correct-member-name-__si_fields-from-LinuxSigInf.patch;patchdir=src/3rdparty/chromium \
+    file://0009-Match-syscalls-to-match-musl.patch;patchdir=src/3rdparty/chromium \
+    file://0010-Define-res_ninit-and-res_nclose-for-non-glibc-platfo.patch;patchdir=src/3rdparty/chromium \
+    file://0011-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty/chromium \
+    file://0012-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty/chromium \
+    file://0013-include-asm-generic-ioctl.h-for-TCGETS2.patch;patchdir=src/3rdparty/chromium \
+    file://0014-link-with-libexecinfo-on-musl.patch;patchdir=src/3rdparty/chromium \
+    file://0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch;patchdir=src/3rdparty/chromium \
+"
 
 SRCREV_qtwebengine = "d740d6a7dbfec387752c7bc8a8b06db0e757c9dc"
 SRCREV_chromium = "15d257fd921f37b32ef643225f21df0ea24c8302"
-- 
2.13.2


