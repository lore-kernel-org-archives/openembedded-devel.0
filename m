Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1A677DBE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:09:57 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id q85so16030198pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WCxR/WGMxIvXRIt/7Sg+XI+Anba5lfqLlyv3UzPCScQ=;
	b=roUTVGVcWehtJczLlmswNtLsofKPV9jRT/K7FWNCix4iTkcGGU0ypcAwSbjdBQ/erx
	DJY9Vt9Kh5Vy59eLnUXJC1zG2adsgKrA5x6BR/TMRt7DWtBiscNzF2zWDhElTIK11roq
	JluELPD9cAYk/fMJHqy3gcVGoYnrtoG8fRNX2HycJAkMW6kKoL/5kR9UcAPEbS2d9IjH
	x9hZhrAUmtctHJxiLT/XF6id1OAMx89uADJIVSVRoMhTaipR6Hihm5UWguiCoNu6sPCG
	xchXityWsRhr5+CHU12iORW09kfT/6qfNNPJIK9/ua4bxUJkXaNRU2yl6ZqIfTGAa6j1
	h8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WCxR/WGMxIvXRIt/7Sg+XI+Anba5lfqLlyv3UzPCScQ=;
	b=J7DlkpashOCoCAqiQQJLIa/hheym3whX3uo05pLMXV7apBDqpG9aelScHTESfWNpqt
	WUkL+onMSW2rl41fF/a7qqopsiG1wV6TJPx/qogx6Akpx62fbDVnJVxNIX3gqhp7Do5Z
	kC+2gFezJxGn39oiszfawxGVtr874kqcYKwNx+T3szoihgLYYBtTnhaN7aVdWrUaXJBL
	4nUcYVckpieM8XvgBbGoqcoDfquMmKq4N9ufr/rStnfdJ5zXmwC9oNMjBrwDaZG/pKds
	8TQBZ4ta46Njb+tRyS86kBCE8C3uhuf9gBoR7z5F1ze7R/fcESWuF6v9hQXoZfRUMFG4
	LxUw==
X-Gm-Message-State: AIVw110lLhIkUwsKmJBWmgffF5pAjQ8Bpt8zJOgC19j2DM1GzVyAVvzB
	CtJWM8gzUEh1f7Ry
X-Received: by 10.101.70.198 with SMTP id n6mr7966025pgr.249.1499720998226;
	Mon, 10 Jul 2017 14:09:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z82sm29136904pfk.1.2017.07.10.14.09.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 14:09:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 14:09:46 -0700
Message-Id: <20170710210947.24353-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170710210947.24353-1-raj.khem@gmail.com>
References: <20170710210947.24353-1-raj.khem@gmail.com>
Subject: [meta-browser][PATCH 2/3] chromium: Fix build on musl/x86_64
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
X-List-Received-Date: Mon, 10 Jul 2017 21:09:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-browser/chromium/chromium-browser.inc      |  2 +
 ...017-Use-_fpstate-instead-of-_libc_fpstate.patch | 65 ++++++++++++++++++++++
 ...tcmalloc-Use-off64_t-insread-of-__off64_t.patch | 26 +++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/0017-Use-_fpstate-instead-of-_libc_fpstate.patch
 create mode 100644 recipes-browser/chromium/chromium/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index a1e22d6..094a3d3 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -49,6 +49,8 @@ SRC_URI_append_libc-musl = "\
            file://0014-link-with-libexecinfo-on-musl.patch \
            file://0015-metrics-Keep-GNU-extentions-effective-only-when-usin.patch \
            file://0016-getcontext-API-is-unimplemented-in-musl.patch \
+           file://0017-Use-_fpstate-instead-of-_libc_fpstate.patch \
+           file://0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch \
 "
 
 S = "${WORKDIR}/chromium-${PV}"
diff --git a/recipes-browser/chromium/chromium/0017-Use-_fpstate-instead-of-_libc_fpstate.patch b/recipes-browser/chromium/chromium/0017-Use-_fpstate-instead-of-_libc_fpstate.patch
new file mode 100644
index 0000000..d4f3f49
--- /dev/null
+++ b/recipes-browser/chromium/chromium/0017-Use-_fpstate-instead-of-_libc_fpstate.patch
@@ -0,0 +1,65 @@
+From ccfd39487d142eafd882a5f35664a1b6cf589f13 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Jul 2017 09:07:02 -0700
+Subject: [PATCH 1/2] Use _fpstate instead of _libc_fpstate
+
+_libc_fpstate is not available on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc | 4 ++--
+ breakpad/src/client/linux/dump_writer_common/ucontext_reader.h  | 2 +-
+ breakpad/src/client/linux/minidump_writer/minidump_writer.h     | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc b/breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc
+index 93b4d9f85..57d5b377d 100644
+--- a/breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc
++++ b/breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc
+@@ -49,7 +49,7 @@ uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
+ }
+ 
+ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
+-                                    const struct _libc_fpstate* fp) {
++                                    const struct _fpstate* fp) {
+   const greg_t* regs = uc->uc_mcontext.gregs;
+ 
+   out->context_flags = MD_CONTEXT_X86_FULL |
+@@ -97,7 +97,7 @@ uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
+ }
+ 
+ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
+-                                    const struct _libc_fpstate* fpregs) {
++                                    const struct _fpstate* fpregs) {
+   const greg_t* regs = uc->uc_mcontext.gregs;
+ 
+   out->context_flags = MD_CONTEXT_AMD64_FULL;
+diff --git a/breakpad/src/client/linux/dump_writer_common/ucontext_reader.h b/breakpad/src/client/linux/dump_writer_common/ucontext_reader.h
+index 2369a9ad3..658fddbde 100644
+--- a/breakpad/src/client/linux/dump_writer_common/ucontext_reader.h
++++ b/breakpad/src/client/linux/dump_writer_common/ucontext_reader.h
+@@ -50,7 +50,7 @@ struct UContextReader {
+   //   info: the collection of register structures.
+ #if defined(__i386__) || defined(__x86_64)
+   static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
+-                             const struct _libc_fpstate* fp);
++                             const struct _fpstate* fp);
+ #elif defined(__aarch64__)
+   static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
+                              const struct fpsimd_context* fpregs);
+diff --git a/breakpad/src/client/linux/minidump_writer/minidump_writer.h b/breakpad/src/client/linux/minidump_writer/minidump_writer.h
+index d13fb120b..7945ac5b2 100644
+--- a/breakpad/src/client/linux/minidump_writer/minidump_writer.h
++++ b/breakpad/src/client/linux/minidump_writer/minidump_writer.h
+@@ -48,7 +48,7 @@ class ExceptionHandler;
+ #if defined(__aarch64__)
+ typedef struct fpsimd_context fpstate_t;
+ #elif !defined(__ARM_EABI__) && !defined(__mips__)
+-typedef struct _libc_fpstate fpstate_t;
++typedef struct _fpstate fpstate_t;
+ #endif
+ 
+ // These entries store a list of memory regions that the client wants included
+-- 
+2.13.2
+
diff --git a/recipes-browser/chromium/chromium/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch b/recipes-browser/chromium/chromium/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch
new file mode 100644
index 0000000..2ef5433
--- /dev/null
+++ b/recipes-browser/chromium/chromium/0018-tcmalloc-Use-off64_t-insread-of-__off64_t.patch
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
-- 
2.13.2


