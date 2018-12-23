Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8414871AB3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:24 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id u6so5031013pfh.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rIQX8ZH+Pbeg1Vkf5ZT07KYgEoVPiS5YSEjkn21U5SQ=;
	b=hDiYTQAkgjNGy0QP5jzCuPNhpVvVbiCQlSv5iheM3k6OOVThdJYxVqBbUxAHO7p8w0
	+xkS+y/PaQNJWvgaOsmF4DzGDaOjqLkXfvHcWqEkmcHApj/asa9soXMs7BmD9ZJQY8QK
	AWsZ50rwH/RLsVltC5i6nOum4nKqvCu6Fkjz7jvgmDflFwTBcxGAYduQYJRmAOAbsdZz
	Wfl2/sxSoBUp5OQ/gNGT304mV0v5AALf9zzRYOy6+vnyHzbnFuriQGK+PIu9o2EUUtqV
	tob5/U7WUtK3P4vkMqRwPoMe5bCFwLHf6OFYlmCwt803w2TN5dObsuFysJIPnilMIxaM
	iecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rIQX8ZH+Pbeg1Vkf5ZT07KYgEoVPiS5YSEjkn21U5SQ=;
	b=mZ8qlOnah4jf4koCSfiqFP6gjEULLs/iZCm/ZT8V1LxsUu9ihkC/h5Y8b3kgdrTOC8
	XqTMQZWUmHCuYBeIlnBYf5Ec1UHE9JzYgZ29V8S6WLwUEaDpPvVsWm0Q0CKOL8/NU9u2
	YjsuwdoEKn9/j69/wcsqrj4iH7V/klwiQjDbZpIgoD7VfiuGdbzCE45RploOEJtRUtNZ
	kn39nOgBs7WQ7Q5CGow/aWyeH1QGKL7KGxcPjqD30zVeGeXCU/AsIsv95HiKXG/l5OmO
	luqDEpc+KMdDAHBy7mxrb7Prt45Eh7mGOC1Y6Yx50EXdXHHmV8DbT5057DVA36+JJGjf
	DTpA==
X-Gm-Message-State: AJcUukcyccSvccq/sWuGcCz0SEKYiGI4ChJnmSiZnqHBfAGS53G7T05L
	8ckX5PfqyF2Q4U5dvheIOLghY4SgLSc=
X-Google-Smtp-Source: ALg8bN6KCVDHhzNOTfwnM7AiiwC54SdPqEjLcmUnhaxJhfSmzpqW4P2GHqU5TXCujsEXh4rYY0A05Q==
X-Received: by 2002:a63:8ac4:: with SMTP id
	y187mr10366773pgd.446.1545600984945; 
	Sun, 23 Dec 2018 13:36:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:55 -0800
Message-Id: <20181223213557.7834-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 16/18] python-pyflame: Upgrade to 1.6.7
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:24 -0000
Content-Transfer-Encoding: 8bit

Disable build on ppc as well
Drop already upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Tim "moto-timo" Orling <TicoTimo@gmail.com>
Cc: Derek Straka <derek@asterius.io>
---
 ...over-user_regs_struct-name-which-dif.patch |  69 ---------
 ...Account-for-prelinked-shared-objects.patch | 134 ------------------
 .../python/python-pyflame.inc                 |   3 +-
 .../python/python-pyflame_1.6.6.bb            |   6 -
 .../python/python-pyflame_1.6.7.bb            |   4 +
 5 files changed, 6 insertions(+), 210 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-symbol-Account-for-prelinked-shared-objects.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.7.bb

diff --git a/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch b/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch
deleted file mode 100644
index 09c4394c2a..0000000000
--- a/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 2ef124e235a47dd4742813cf80e11a89cf4f02f8 Mon Sep 17 00:00:00 2001
-From: Andrew Jeffery <andrew@aj.id.au>
-Date: Thu, 3 May 2018 12:35:31 +0930
-Subject: [PATCH] ptrace: Abstract over user_regs_struct name, which differs on
- ARM32
-
-Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
----
- src/ptrace.cc |  6 +++---
- src/ptrace.h  | 10 ++++++++--
- 2 files changed, 11 insertions(+), 5 deletions(-)
-
-diff --git a/src/ptrace.cc b/src/ptrace.cc
-index 485f58e4d82e..610fabb3b8e8 100644
---- a/src/ptrace.cc
-+++ b/src/ptrace.cc
-@@ -122,8 +122,8 @@ void PtraceInterrupt(pid_t pid) {
-   DoWait(pid);
- }
- 
--struct user_regs_struct PtraceGetRegs(pid_t pid) {
--  struct user_regs_struct regs;
-+user_regs_struct PtraceGetRegs(pid_t pid) {
-+  user_regs_struct regs;
-   if (ptrace(PTRACE_GETREGS, pid, 0, &regs)) {
-     std::ostringstream ss;
-     ss << "Failed to PTRACE_GETREGS: " << strerror(errno);
-@@ -132,7 +132,7 @@ struct user_regs_struct PtraceGetRegs(pid_t pid) {
-   return regs;
- }
- 
--void PtraceSetRegs(pid_t pid, struct user_regs_struct regs) {
-+void PtraceSetRegs(pid_t pid, user_regs_struct regs) {
-   if (ptrace(PTRACE_SETREGS, pid, 0, &regs)) {
-     std::ostringstream ss;
-     ss << "Failed to PTRACE_SETREGS: " << strerror(errno);
-diff --git a/src/ptrace.h b/src/ptrace.h
-index 7083be1c4dfd..d6af8bf9f83a 100644
---- a/src/ptrace.h
-+++ b/src/ptrace.h
-@@ -23,6 +23,12 @@
- 
- #include "./config.h"
- 
-+#if defined(__arm__)
-+typedef struct user_regs user_regs_struct;
-+#else
-+typedef struct user_regs_struct user_regs_struct;
-+#endif
-+
- namespace pyflame {
- 
- int DoWait(pid_t pid, int options = 0);
-@@ -39,10 +45,10 @@ void PtraceSeize(pid_t pid);
- void PtraceInterrupt(pid_t pid);
- 
- // get regs from a process
--struct user_regs_struct PtraceGetRegs(pid_t pid);
-+user_regs_struct PtraceGetRegs(pid_t pid);
- 
- // set regs in a process
--void PtraceSetRegs(pid_t pid, struct user_regs_struct regs);
-+void PtraceSetRegs(pid_t pid, user_regs_struct regs);
- 
- // poke a long word into an address
- void PtracePoke(pid_t pid, unsigned long addr, long data);
--- 
-2.14.1
-
diff --git a/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-symbol-Account-for-prelinked-shared-objects.patch b/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-symbol-Account-for-prelinked-shared-objects.patch
deleted file mode 100644
index 3eefc9cb98..0000000000
--- a/meta-python/recipes-devtools/python/python-pyflame-1.6.6/0001-symbol-Account-for-prelinked-shared-objects.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 007965d341349679607699d005c4af811b2c419a Mon Sep 17 00:00:00 2001
-From: Andrew Jeffery <andrew@aj.id.au>
-Date: Fri, 4 May 2018 11:23:53 +0930
-Subject: [PATCH] symbol: Account for prelinked shared objects
-
-Some projects, such as those derived from Yocto, tend to prelink their
-binaries and libraries to reduce runtime overhead. Currently this trips
-up pyflame in its symbol address calculations, and leads to ptrace
-failures due to spurious addresses:
-
-   $ pyflame -t python -c "print 'foo'"
-   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
-   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
-   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
-   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
-   Unexpected ptrace(2) exception: Failed to PTRACE_PEEKDATA (pid 1482, addr 0x9f9b1d70): Input/output error
-   ...
-
-Add support for reading a prelinked base p_vaddr out of the ELF and
-adjust the PyAddresses values accordingly.
-
-Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
----
- src/symbol.cc | 15 +++++++++++++++
- src/symbol.h  | 29 ++++++++++++++++++++++++++++-
- 2 files changed, 43 insertions(+), 1 deletion(-)
-
-diff --git a/src/symbol.cc b/src/symbol.cc
-index 125174efeeb5..39c3e8132dd1 100644
---- a/src/symbol.cc
-+++ b/src/symbol.cc
-@@ -166,6 +166,17 @@ PyABI ELF::WalkTable(int sym, int str, PyAddresses *addrs) {
-   return abi;
- }
- 
-+addr_t ELF::GetBaseAddress() {
-+  int32_t phnum = hdr()->e_phnum;
-+  int32_t i;
-+  for (i = 0; i < phnum && phdr(i)->p_type != PT_LOAD; i++) {
-+  }
-+  if (i == phnum) {
-+    throw FatalException("Failed to find PT_LOAD entry in program headers");
-+  }
-+  return phdr(i)->p_vaddr;
-+}
-+
- PyAddresses ELF::GetAddresses(PyABI *abi) {
-   PyAddresses addrs;
-   PyABI detected_abi = WalkTable(dynsym_, dynstr_, &addrs);
-@@ -176,6 +187,10 @@ PyAddresses ELF::GetAddresses(PyABI *abi) {
-   if (abi != nullptr) {
-     *abi = detected_abi;
-   }
-+  // Handle prelinked shared objects
-+  if (hdr()->e_type == ET_DYN) {
-+    return addrs - GetBaseAddress();
-+  }
-   return addrs;
- }
- }  // namespace pyflame
-diff --git a/src/symbol.h b/src/symbol.h
-index 124853bcc1c1..bb92b9a2604b 100644
---- a/src/symbol.h
-+++ b/src/symbol.h
-@@ -28,15 +28,19 @@
- 
- #if USE_ELF64
- #define ehdr_t Elf64_Ehdr
-+#define phdr_t Elf64_Phdr
- #define shdr_t Elf64_Shdr
- #define dyn_t Elf64_Dyn
- #define sym_t Elf64_Sym
-+#define addr_t Elf64_Addr
- #define ARCH_ELFCLASS ELFCLASS64
- #else
- #define ehdr_t Elf32_Ehdr
-+#define phdr_t Elf32_Phdr
- #define shdr_t Elf32_Shdr
- #define dyn_t Elf32_Dyn
- #define sym_t Elf32_Sym
-+#define addr_t Elf32_Addr
- #define ARCH_ELFCLASS ELFCLASS32
- #endif
- 
-@@ -67,8 +71,18 @@ struct PyAddresses {
-         interp_head_hint(0),
-         pie(false) {}
- 
-+  PyAddresses operator-(const unsigned long base) const {
-+    PyAddresses res(*this);
-+    res.tstate_addr = this->tstate_addr == 0 ? 0 : this->tstate_addr - base;
-+    res.interp_head_addr =
-+        this->interp_head_addr == 0 ? 0 : this->interp_head_addr - base;
-+    res.interp_head_fn_addr =
-+        this->interp_head_fn_addr == 0 ? 0 : this->interp_head_fn_addr - base;
-+    return res;
-+  }
-+
-   PyAddresses operator+(const unsigned long base) const {
--    PyAddresses res;
-+    PyAddresses res(*this);
-     res.tstate_addr = this->tstate_addr == 0 ? 0 : this->tstate_addr + base;
-     res.interp_head_addr =
-         this->interp_head_addr == 0 ? 0 : this->interp_head_addr + base;
-@@ -113,6 +127,9 @@ class ELF {
-   // ABI.
-   PyAddresses GetAddresses(PyABI *abi);
- 
-+  // Extract the base load address from the Program Header table
-+  addr_t GetBaseAddress();
-+
-  private:
-   void *addr_;
-   size_t length_;
-@@ -122,6 +139,16 @@ class ELF {
-     return reinterpret_cast<const ehdr_t *>(addr_);
-   }
- 
-+  inline const phdr_t *phdr(int idx) const {
-+    if (idx < 0) {
-+      std::ostringstream ss;
-+      ss << "Illegal phdr index: " << idx;
-+      throw FatalException(ss.str());
-+    }
-+    return reinterpret_cast<const phdr_t *>(p() + hdr()->e_phoff +
-+                                            idx * hdr()->e_phentsize);
-+  }
-+
-   inline const shdr_t *shdr(int idx) const {
-     if (idx < 0) {
-       std::ostringstream ss;
--- 
-2.14.1
-
diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
index 340aab74ef..b3b153c57b 100644
--- a/meta-python/recipes-devtools/python/python-pyflame.inc
+++ b/meta-python/recipes-devtools/python/python-pyflame.inc
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 DEPENDS = "python"
 
-SRC_URI = "git://github.com/uber/pyflame.git;protocol=https"
+SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;nobranch=1"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools
@@ -13,3 +13,4 @@ inherit pkgconfig autotools
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 COMPATIBLE_HOST_mipsarch_class-target = "null"
 COMPATIBLE_HOST_aarch64_class-target = "null"
+COMPATIBLE_HOST_powerpc_class-target = "null"
diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
deleted file mode 100644
index 8dedb89286..0000000000
--- a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require python-pyflame.inc
-
-# v1.6.6
-SRCREV = "8a9d8c2acc3b3bb027475b738134f1e6fff14e6c"
-SRC_URI += "file://0001-ptrace-Abstract-over-user_regs_struct-name-which-dif.patch"
-SRC_URI += "file://0001-symbol-Account-for-prelinked-shared-objects.patch"
diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.7.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.7.bb
new file mode 100644
index 0000000000..cb08f30a67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.7.bb
@@ -0,0 +1,4 @@
+require python-pyflame.inc
+
+# v1.6.7
+SRCREV = "c151d2f34737f28a1f5266a003b2b0720bbd9f96"
-- 
2.20.1


