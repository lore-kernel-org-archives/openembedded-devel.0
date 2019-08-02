Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4284A6BF37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 13:42:59 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a15so68019718wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 06:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Asmw8EaXbXcz08Wukzy0LZYYtw/BNHU0+q7uOl+xns4=;
	b=huNb3+2Bs+1FCAtUgboo6sAJfbV4pXbpYU08AJz2pTmpo0HsEBcrhY9aumI4EXvX54
	XyX+rlDPjd7AVmTxFjAArT3LMaQvNCvKa2nUXHY6TytZ89a3VXds64xgiywegRgi1a2i
	McplJ6QVtcJ6hxJeH9JlYCGaAWKIr6ujp61mcoRWWycdDwle0rfkVmV3mHyyCVrECSaY
	7vq4ch/YHT6nmlGUYdyiu1NMyhAjmn5Snhhu6phHx56aH/k6Mw0Tt6WFSLf+rvM182vv
	BpmmAeGHHTvw4as9ctqota1yGVoXIAPu8+ihm5xfsUv/1XLgdfI2j3qfUrVSnOREnq9j
	nZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Asmw8EaXbXcz08Wukzy0LZYYtw/BNHU0+q7uOl+xns4=;
	b=V9Rf7BAyfmB/xpRQc7kSf0NnoeQZyPqAe/3xqI2rI7QQvew7GFe+RyK5MBjr9k8M+g
	OXoIlnR4cztkzsS/6YFq3sMTofbOta9+TZUCEkyCpPSMxTfMyK4K4dGNEXgBzZ7w/7k4
	WcipDeCx+aeoR8Qn/HstFVEmfEqqy5QSjL2WZsdVj5SqRkB56TwKHg+l9/ZUcRKvv8Nw
	WfIw7hd+v1uq0i+cBDoAXJZ304Qba+9BFZFWi7StiyUpQy58YOSTeNz3MmmAYfvOrUXt
	Kvzl89jjfbh0uNjCq1yaU3An9kYcXPi4DoijGxPuCEFQ5Z5NDPC4PTh7GGQixv11Opuz
	AYXw==
X-Gm-Message-State: APjAAAWNwLldFNxOlBuJlBptu+lxq/miMKKd09YjLckouAKiDtDLiPI8
	0nR4WWWZrROyDEHsA7c+hMtxmIxq
X-Google-Smtp-Source: APXvYqzbOf1WemHuN3yGnbqCGcDrr7etFnCv6KU2oLii6v9ewyq3JIS07TRHB6WUZdN1XVkPAFIt9w==
X-Received: by 2002:a1c:c5c2:: with SMTP id v185mr4916791wmf.161.1564753379465;
	Fri, 02 Aug 2019 06:42:59 -0700 (PDT)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s63sm60189283wme.17.2019.08.02.06.42.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 06:42:58 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 14:42:48 +0100
Message-Id: <20190802134247.38383-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [meta-qt4][PATCH] JIT: fix build with gcc 8.3
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
X-List-Received-Date: Fri, 02 Aug 2019 13:42:59 -0000
Content-Transfer-Encoding: 8bit

with gcc 8.3 the qualifier volatile for asm statement is not allowed
in the global scope.

See this commit:
https://github.com/qt/qtscript/commit/97ec1d1882a83c23c91f0f7daea48e05858d8c32

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 recipes-qt4/qt4/qt4-4.8.7.inc                 |   1 +
 .../0039-JIT-fix-build-with-gcc-8.3.patch     | 277 ++++++++++++++++++
 2 files changed, 278 insertions(+)
 create mode 100644 recipes-qt4/qt4/qt4-4.8.7/0039-JIT-fix-build-with-gcc-8.3.patch

diff --git a/recipes-qt4/qt4/qt4-4.8.7.inc b/recipes-qt4/qt4/qt4-4.8.7.inc
index 1299493..9329b25 100644
--- a/recipes-qt4/qt4/qt4-4.8.7.inc
+++ b/recipes-qt4/qt4/qt4-4.8.7.inc
@@ -37,6 +37,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://fix-for-mips-n32.patch \
 	   file://qt-everywhere-opensource-src-4.8.6-QTBUG-22829.patch \
            file://0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch \
+           file://0039-JIT-fix-build-with-gcc-8.3.patch \
            "
 
 SRC_URI[md5sum] = "d990ee66bf7ab0c785589776f35ba6ad"
diff --git a/recipes-qt4/qt4/qt4-4.8.7/0039-JIT-fix-build-with-gcc-8.3.patch b/recipes-qt4/qt4/qt4-4.8.7/0039-JIT-fix-build-with-gcc-8.3.patch
new file mode 100644
index 0000000..e1eea56
--- /dev/null
+++ b/recipes-qt4/qt4/qt4-4.8.7/0039-JIT-fix-build-with-gcc-8.3.patch
@@ -0,0 +1,277 @@
+From fbc48587b7cdb98638c09dceefe3eaa721726236 Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nicola.lunghi@jci.com>
+Date: Thu, 1 Aug 2019 18:19:54 +0100
+Subject: [PATCH 2/2] JIT: fix build with gcc 8.3
+
+This is an extension of the patch present in the qtscript repository
+
+https://github.com/qt/qtscript/commit/97ec1d1882a83c23c91f0f7daea48e05858d8c32
+
+Original commit message:
+    [PATCH] Fix build with GCC 8.3
+
+    Qualifiers in the asm statement are not allowed in the global scope. I
+    thought they were necessary for LTO, but I the commit to this file that
+    added them predates my work on setting up LTO for GCC.
+
+    Change-Id: Id98140e1c2f0426cabbefffd157e23e5ece67a49
+    Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+---
+ .../JavaScriptCore/jit/JITStubs.cpp           | 48 +++++++++----------
+ .../Source/JavaScriptCore/jit/JITStubs.cpp    |  6 +--
+ 2 files changed, 27 insertions(+), 27 deletions(-)
+
+diff --git a/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITStubs.cpp b/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITStubs.cpp
+index d8027ff2..dcead6d0 100644
+--- a/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITStubs.cpp
++++ b/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITStubs.cpp
+@@ -116,7 +116,7 @@ COMPILE_ASSERT(offsetof(struct JITStackFrame, savedEBX) == 0x3c, JITStackFrame_s
+ COMPILE_ASSERT(offsetof(struct JITStackFrame, callFrame) == 0x58, JITStackFrame_callFrame_offset_matches_ctiTrampoline);
+ COMPILE_ASSERT(offsetof(struct JITStackFrame, code) == 0x50, JITStackFrame_code_offset_matches_ctiTrampoline);
+ 
+-asm volatile (
++asm (
+ ".text\n"
+ ".globl " SYMBOL_STRING(ctiTrampoline) "\n"
+ HIDE_SYMBOL(ctiTrampoline) "\n"
+@@ -138,7 +138,7 @@ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+     "ret" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiVMThrowTrampoline) "\n"
+ HIDE_SYMBOL(ctiVMThrowTrampoline) "\n"
+ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+@@ -154,7 +154,7 @@ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+     "ret" "\n"
+ );
+     
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiOpThrowNotCaught) "\n"
+ HIDE_SYMBOL(ctiOpThrowNotCaught) "\n"
+ SYMBOL_STRING(ctiOpThrowNotCaught) ":" "\n"
+@@ -179,7 +179,7 @@ COMPILE_ASSERT(offsetof(struct JITStackFrame, savedRBX) == 0x48, JITStackFrame_s
+ COMPILE_ASSERT(offsetof(struct JITStackFrame, callFrame) == 0x90, JITStackFrame_callFrame_offset_matches_ctiTrampoline);
+ COMPILE_ASSERT(offsetof(struct JITStackFrame, code) == 0x80, JITStackFrame_code_offset_matches_ctiTrampoline);
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiTrampoline) "\n"
+ HIDE_SYMBOL(ctiTrampoline) "\n"
+ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+@@ -206,7 +206,7 @@ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+     "ret" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiVMThrowTrampoline) "\n"
+ HIDE_SYMBOL(ctiVMThrowTrampoline) "\n"
+ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+@@ -222,7 +222,7 @@ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+     "ret" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiOpThrowNotCaught) "\n"
+ HIDE_SYMBOL(ctiOpThrowNotCaught) "\n"
+ SYMBOL_STRING(ctiOpThrowNotCaught) ":" "\n"
+@@ -242,7 +242,7 @@ SYMBOL_STRING(ctiOpThrowNotCaught) ":" "\n"
+ #error "JIT_STUB_ARGUMENT_VA_LIST not supported on ARMv7."
+ #endif
+ 
+-asm volatile (
++asm (
+ ".text" "\n"
+ ".align 2" "\n"
+ ".globl " SYMBOL_STRING(ctiTrampoline) "\n"
+@@ -269,7 +269,7 @@ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+     "bx lr" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".text" "\n"
+ ".align 2" "\n"
+ ".globl " SYMBOL_STRING(ctiVMThrowTrampoline) "\n"
+@@ -287,7 +287,7 @@ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+     "bx lr" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".text" "\n"
+ ".align 2" "\n"
+ ".globl " SYMBOL_STRING(ctiOpThrowNotCaught) "\n"
+@@ -305,7 +305,7 @@ SYMBOL_STRING(ctiOpThrowNotCaught) ":" "\n"
+ 
+ #elif COMPILER(GCC) && CPU(ARM_TRADITIONAL)
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiTrampoline) "\n"
+ HIDE_SYMBOL(ctiTrampoline) "\n"
+ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+@@ -323,7 +323,7 @@ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+     "mov pc, lr" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiVMThrowTrampoline) "\n"
+ HIDE_SYMBOL(ctiVMThrowTrampoline) "\n"
+ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+@@ -418,7 +418,7 @@ COMPILE_ASSERT(offsetof(struct JITStackFrame, callFrame) == 0x38, JITStackFrame_
+ COMPILE_ASSERT(offsetof(struct JITStackFrame, code) == 0x30, JITStackFrame_code_offset_matches_ctiTrampoline);
+ COMPILE_ASSERT(offsetof(struct JITStackFrame, savedEBX) == 0x1c, JITStackFrame_stub_argument_space_matches_ctiTrampoline);
+ 
+-asm volatile (
++asm (
+ ".text\n"
+ ".globl " SYMBOL_STRING(ctiTrampoline) "\n"
+ HIDE_SYMBOL(ctiTrampoline) "\n"
+@@ -440,7 +440,7 @@ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+     "ret" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiVMThrowTrampoline) "\n"
+ HIDE_SYMBOL(ctiVMThrowTrampoline) "\n"
+ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+@@ -456,7 +456,7 @@ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+     "ret" "\n"
+ );
+     
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiOpThrowNotCaught) "\n"
+ HIDE_SYMBOL(ctiOpThrowNotCaught) "\n"
+ SYMBOL_STRING(ctiOpThrowNotCaught) ":" "\n"
+@@ -480,7 +480,7 @@ COMPILE_ASSERT(offsetof(struct JITStackFrame, callFrame) == 0x58, JITStackFrame_
+ COMPILE_ASSERT(offsetof(struct JITStackFrame, code) == 0x48, JITStackFrame_code_offset_matches_ctiTrampoline);
+ COMPILE_ASSERT(offsetof(struct JITStackFrame, savedRBX) == 0x78, JITStackFrame_stub_argument_space_matches_ctiTrampoline);
+ 
+-asm volatile (
++asm (
+ ".text\n"
+ ".globl " SYMBOL_STRING(ctiTrampoline) "\n"
+ HIDE_SYMBOL(ctiTrampoline) "\n"
+@@ -515,7 +515,7 @@ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+     "ret" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiVMThrowTrampoline) "\n"
+ HIDE_SYMBOL(ctiVMThrowTrampoline) "\n"
+ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+@@ -531,7 +531,7 @@ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+     "ret" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiOpThrowNotCaught) "\n"
+ HIDE_SYMBOL(ctiOpThrowNotCaught) "\n"
+ SYMBOL_STRING(ctiOpThrowNotCaught) ":" "\n"
+@@ -551,7 +551,7 @@ SYMBOL_STRING(ctiOpThrowNotCaught) ":" "\n"
+ #error "JIT_STUB_ARGUMENT_VA_LIST not supported on ARMv7."
+ #endif
+ 
+-asm volatile (
++asm (
+ ".text" "\n"
+ ".align 2" "\n"
+ ".globl " SYMBOL_STRING(ctiTrampoline) "\n"
+@@ -578,7 +578,7 @@ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+     "bx lr" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".text" "\n"
+ ".align 2" "\n"
+ ".globl " SYMBOL_STRING(ctiVMThrowTrampoline) "\n"
+@@ -596,7 +596,7 @@ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+     "bx lr" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".text" "\n"
+ ".align 2" "\n"
+ ".globl " SYMBOL_STRING(ctiOpThrowNotCaught) "\n"
+@@ -614,7 +614,7 @@ SYMBOL_STRING(ctiOpThrowNotCaught) ":" "\n"
+ 
+ #elif COMPILER(GCC) && CPU(ARM_TRADITIONAL)
+ 
+-asm volatile (
++asm (
+ ".text\n"
+ ".globl " SYMBOL_STRING(ctiTrampoline) "\n"
+ HIDE_SYMBOL(ctiTrampoline) "\n"
+@@ -632,7 +632,7 @@ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+     "mov pc, lr" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiVMThrowTrampoline) "\n"
+ HIDE_SYMBOL(ctiVMThrowTrampoline) "\n"
+ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+@@ -1024,7 +1024,7 @@ static NEVER_INLINE void throwStackOverflowError(CallFrame* callFrame, JSGlobalD
+     extern "C" { \
+         rtype JITStubThunked_##op(STUB_ARGS_DECLARATION); \
+     }; \
+-    asm volatile ( \
++    asm ( \
+         ".text" "\n" \
+         ".align 2" "\n" \
+         ".globl " SYMBOL_STRING(cti_##op) "\n" \
+@@ -1053,7 +1053,7 @@ COMPILE_ASSERT(offsetof(struct JITStackFrame, thunkReturnAddress) == THUNK_RETUR
+     extern "C" { \
+         rtype JITStubThunked_##op(STUB_ARGS_DECLARATION); \
+     }; \
+-    asm volatile ( \
++    asm ( \
+         ".globl " SYMBOL_STRING(cti_##op) "\n" \
+         HIDE_SYMBOL(cti_##op) "\n"             \
+         SYMBOL_STRING(cti_##op) ":" "\n" \
+diff --git a/src/3rdparty/webkit/Source/JavaScriptCore/jit/JITStubs.cpp b/src/3rdparty/webkit/Source/JavaScriptCore/jit/JITStubs.cpp
+index e2f13e74..936f0fee 100644
+--- a/src/3rdparty/webkit/Source/JavaScriptCore/jit/JITStubs.cpp
++++ b/src/3rdparty/webkit/Source/JavaScriptCore/jit/JITStubs.cpp
+@@ -318,7 +318,7 @@ extern "C" {
+ #define SYMBOL_STRING(name) #name
+ /* code (r4), RegisterFile* (r5), CallFrame* (r6), JSValue* exception (r7), Profiler**(sp), JSGlobalData (sp)*/
+ 
+-asm volatile (
++asm (
+ ".text\n"
+ ".globl " SYMBOL_STRING(ctiTrampoline) "\n"
+ HIDE_SYMBOL(ctiTrampoline) "\n"
+@@ -349,7 +349,7 @@ SYMBOL_STRING(ctiTrampoline) ":" "\n"
+     "nop" "\n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiVMThrowTrampoline) "\n"
+ HIDE_SYMBOL(ctiVMThrowTrampoline) "\n"
+ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+@@ -372,7 +372,7 @@ SYMBOL_STRING(ctiVMThrowTrampoline) ":" "\n"
+     ".L2" SYMBOL_STRING(cti_vm_throw)":.long " SYMBOL_STRING(cti_vm_throw) "@GOT \n"
+ );
+ 
+-asm volatile (
++asm (
+ ".globl " SYMBOL_STRING(ctiOpThrowNotCaught) "\n"
+ HIDE_SYMBOL(ctiOpThrowNotCaught) "\n"
+ SYMBOL_STRING(ctiOpThrowNotCaught) ":" "\n"
+-- 
+2.20.1
+
-- 
2.20.1


