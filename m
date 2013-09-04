Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5915B6BEDB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 13:38:13 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so317439pde.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LbsZOwEfW85B99m8lmRzC0hJnRFWkUlTK23lGcUowwI=;
	b=J1Kh+O4+Hu3xdj6TyCQ8dlsTcMdn9GMNRQeZhNoQhWPPGCuEhAkzKuVCp11vR1HuWO
	PGM565IReiUO897gb2BI+Q/9MfukIL/8TBOyLN1WpVmkPagOzMBtJsLSAwUWJ3RX/RLe
	B0RVmW7+i9NVjTX2QTazbl6I9UsJ32SHmgNp38ZXwXt7ZiNlTSkqMVs2HkiYTLATtHPM
	RuvOw+xubW37XfAQwKoMooxYyEbQW6LTXhtxfezVL9hI/Qa6tph60sz/zj0j5BCDtrc0
	bjn8qHURHLyGby00kulPefp78VITuYBwNSQlTDLz3uvPHx3ykMKYQ5jpduobKz8oxZaW
	eQuw==
X-Received: by 10.68.170.67 with SMTP id ak3mr3217957pbc.185.1378301895112;
	Wed, 04 Sep 2013 06:38:15 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ct4sm28886246pbb.41.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 06:38:14 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Sep 2013 23:33:02 +1000
Message-Id: <1378301582-16035-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][PATCH v2] qt-creator: update to 2.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Sep 2013 13:38:14 -0000

This also adds patches to fix compilation for ARM.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../qt-creator/fix.missing.cpuid.h.patch           | 384 +++++++++++++++++++++
 .../qt-creator/qbs_transformer_product.patch       |  93 +++++
 .../{qt-creator_2.8.0.bb => qt-creator_2.8.1.bb}   |   8 +-
 3 files changed, 482 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.patch
 create mode 100644 meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_product.patch
 rename meta-oe/recipes-qt/qt-creator/{qt-creator_2.8.0.bb => qt-creator_2.8.1.bb} (78%)

diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.patch b/meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.patch
new file mode 100644
index 0000000..363bee3
--- /dev/null
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.patch
@@ -0,0 +1,384 @@
+From 8be071bbca6a9b8e06a7466d848a2b4b6dbcbc1f Mon Sep 17 00:00:00 2001
+From: Christian Kandeler <christian.kandeler@digia.com>
+Date: Fri, 19 Jul 2013 13:40:30 +0200
+Subject: [PATCH] WIP: Remove x86 assembler code from botan sources.
+
+Taken from
+https://bugreports.qt-project.org/browse/QTCREATORBUG-8107
+
+Upstream-Status: Submitted
+
+Change-Id: I3780aa4551f563c5f43833ec822e3c1add7012f2
+---
+ src/libs/3rdparty/botan/botan.cpp | 297 +++-----------------------------------
+ src/libs/3rdparty/botan/botan.h   |   4 +-
+ 2 files changed, 18 insertions(+), 283 deletions(-)
+
+diff --git a/src/libs/3rdparty/botan/botan.cpp b/src/libs/3rdparty/botan/botan.cpp
+index 917c385..c515750 100644
+--- a/src/libs/3rdparty/botan/botan.cpp
++++ b/src/libs/3rdparty/botan/botan.cpp
+@@ -1098,35 +1098,31 @@ class Montgomery_Exponentiator : public Modular_Exponentiator
+ 
+ }
+ 
+-
+-#if (BOTAN_MP_WORD_BITS != 32)
+-   #error The mp_x86_32 module requires that BOTAN_MP_WORD_BITS == 32
++#if (BOTAN_MP_WORD_BITS == 8)
++typedef Botan::u16bit dword;
++#elif (BOTAN_MP_WORD_BITS == 16)
++typedef Botan::u32bit dword;
++#elif (BOTAN_MP_WORD_BITS == 32)
++typedef Botan::u64bit dword;
++#elif (BOTAN_MP_WORD_BITS == 64)
++#error BOTAN_MP_WORD_BITS can be 64 only with assembly support
++#else
++#error BOTAN_MP_WORD_BITS must be 8, 16, 32, or 64
+ #endif
+ 
+-#ifdef Q_OS_UNIX
++
+ namespace Botan {
+ 
+ extern "C" {
+ 
+ /*
+-* Helper Macros for x86 Assembly
+-*/
+-#define ASM(x) x "\n\t"
+-
+-/*
+ * Word Multiply
+ */
+ inline word word_madd2(word a, word b, word* c)
+    {
+-   asm(
+-      ASM("mull %[b]")
+-      ASM("addl %[c],%[a]")
+-      ASM("adcl $0,%[carry]")
+-
+-      : [a]"=a"(a), [b]"=rm"(b), [carry]"=&d"(*c)
+-      : "0"(a), "1"(b), [c]"g"(*c) : "cc");
+-
+-   return a;
++    dword z = (dword)a * b + *c;
++    *c = (word)(z >> BOTAN_MP_WORD_BITS);
++    return (word)z;
+    }
+ 
+ /*
+@@ -1134,25 +1130,12 @@ inline word word_madd2(word a, word b, word* c)
+ */
+ inline word word_madd3(word a, word b, word c, word* d)
+    {
+-   asm(
+-      ASM("mull %[b]")
+-
+-      ASM("addl %[c],%[a]")
+-      ASM("adcl $0,%[carry]")
+-
+-      ASM("addl %[d],%[a]")
+-      ASM("adcl $0,%[carry]")
+-
+-      : [a]"=a"(a), [b]"=rm"(b), [carry]"=&d"(*d)
+-      : "0"(a), "1"(b), [c]"g"(c), [d]"g"(*d) : "cc");
+-
+-   return a;
++    dword z = (dword)a * b + c + *d;
++    *d = (word)(z >> BOTAN_MP_WORD_BITS);
++    return (word)z;
+    }
+-
+ }
+-
+ }
+-#endif
+ 
+ 
+ 
+@@ -1704,30 +1687,6 @@ void unlock_mem(void* addr, size_t length);
+ 
+ namespace Botan {
+ 
+-extern "C" {
+-
+-/*
+-* Word Multiply/Add
+-*/
+-inline word word_madd2(word a, word b, word* c)
+-   {
+-   dword z = (dword)a * b + *c;
+-   *c = (word)(z >> BOTAN_MP_WORD_BITS);
+-   return (word)z;
+-   }
+-
+-/*
+-* Word Multiply/Add
+-*/
+-inline word word_madd3(word a, word b, word c, word* d)
+-   {
+-   dword z = (dword)a * b + c + *d;
+-   *d = (word)(z >> BOTAN_MP_WORD_BITS);
+-   return (word)z;
+-   }
+-
+-}
+-
+ /**
+ * Win32 CAPI Entropy Source
+ */
+@@ -2315,225 +2274,6 @@ namespace Botan {
+ 
+ extern "C" {
+ 
+-#ifdef Q_OS_UNIX
+-/*
+-* Helper Macros for x86 Assembly
+-*/
+-#ifndef ASM
+-  #define ASM(x) x "\n\t"
+-#endif
+-
+-#define ADDSUB2_OP(OPERATION, INDEX)                     \
+-        ASM("movl 4*" #INDEX "(%[y]), %[carry]")         \
+-        ASM(OPERATION " %[carry], 4*" #INDEX "(%[x])")   \
+-
+-#define ADDSUB3_OP(OPERATION, INDEX)                     \
+-        ASM("movl 4*" #INDEX "(%[x]), %[carry]")         \
+-        ASM(OPERATION " 4*" #INDEX "(%[y]), %[carry]")   \
+-        ASM("movl %[carry], 4*" #INDEX "(%[z])")         \
+-
+-#define LINMUL_OP(WRITE_TO, INDEX)                       \
+-        ASM("movl 4*" #INDEX "(%[x]),%%eax")             \
+-        ASM("mull %[y]")                                 \
+-        ASM("addl %[carry],%%eax")                       \
+-        ASM("adcl $0,%%edx")                             \
+-        ASM("movl %%edx,%[carry]")                       \
+-        ASM("movl %%eax, 4*" #INDEX "(%[" WRITE_TO "])")
+-
+-#define MULADD_OP(IGNORED, INDEX)                        \
+-        ASM("movl 4*" #INDEX "(%[x]),%%eax")             \
+-        ASM("mull %[y]")                                 \
+-        ASM("addl %[carry],%%eax")                       \
+-        ASM("adcl $0,%%edx")                             \
+-        ASM("addl 4*" #INDEX "(%[z]),%%eax")             \
+-        ASM("adcl $0,%%edx")                             \
+-        ASM("movl %%edx,%[carry]")                       \
+-        ASM("movl %%eax, 4*" #INDEX " (%[z])")
+-
+-#define DO_8_TIMES(MACRO, ARG) \
+-        MACRO(ARG, 0) \
+-        MACRO(ARG, 1) \
+-        MACRO(ARG, 2) \
+-        MACRO(ARG, 3) \
+-        MACRO(ARG, 4) \
+-        MACRO(ARG, 5) \
+-        MACRO(ARG, 6) \
+-        MACRO(ARG, 7)
+-
+-#define ADD_OR_SUBTRACT(CORE_CODE)     \
+-        ASM("rorl %[carry]")           \
+-        CORE_CODE                      \
+-        ASM("sbbl %[carry],%[carry]")  \
+-        ASM("negl %[carry]")
+-
+-/*
+-* Word Addition
+-*/
+-inline word word_add(word x, word y, word* carry)
+-   {
+-   asm(
+-      ADD_OR_SUBTRACT(ASM("adcl %[y],%[x]"))
+-      : [x]"=r"(x), [carry]"=r"(*carry)
+-      : "0"(x), [y]"rm"(y), "1"(*carry)
+-      : "cc");
+-   return x;
+-   }
+-
+-/*
+-* Eight Word Block Addition, Two Argument
+-*/
+-inline word word8_add2(word x[8], const word y[8], word carry)
+-   {
+-   asm(
+-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB2_OP, "adcl"))
+-      : [carry]"=r"(carry)
+-      : [x]"r"(x), [y]"r"(y), "0"(carry)
+-      : "cc", "memory");
+-   return carry;
+-   }
+-
+-/*
+-* Eight Word Block Addition, Three Argument
+-*/
+-inline word word8_add3(word z[8], const word x[8], const word y[8], word carry)
+-   {
+-   asm(
+-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB3_OP, "adcl"))
+-      : [carry]"=r"(carry)
+-      : [x]"r"(x), [y]"r"(y), [z]"r"(z), "0"(carry)
+-      : "cc", "memory");
+-   return carry;
+-   }
+-
+-/*
+-* Word Subtraction
+-*/
+-inline word word_sub(word x, word y, word* carry)
+-   {
+-   asm(
+-      ADD_OR_SUBTRACT(ASM("sbbl %[y],%[x]"))
+-      : [x]"=r"(x), [carry]"=r"(*carry)
+-      : "0"(x), [y]"rm"(y), "1"(*carry)
+-      : "cc");
+-   return x;
+-   }
+-
+-/*
+-* Eight Word Block Subtraction, Two Argument
+-*/
+-inline word word8_sub2(word x[8], const word y[8], word carry)
+-   {
+-   asm(
+-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB2_OP, "sbbl"))
+-      : [carry]"=r"(carry)
+-      : [x]"r"(x), [y]"r"(y), "0"(carry)
+-      : "cc", "memory");
+-   return carry;
+-   }
+-
+-/*
+-* Eight Word Block Subtraction, Two Argument
+-*/
+-inline word word8_sub2_rev(word x[8], const word y[8], word carry)
+-   {
+-   asm(
+-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB3_OP, "sbbl"))
+-      : [carry]"=r"(carry)
+-      : [x]"r"(y), [y]"r"(x), [z]"r"(x), "0"(carry)
+-      : "cc", "memory");
+-   return carry;
+-   }
+-
+-/*
+-* Eight Word Block Subtraction, Three Argument
+-*/
+-inline word word8_sub3(word z[8], const word x[8], const word y[8], word carry)
+-   {
+-   asm(
+-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB3_OP, "sbbl"))
+-      : [carry]"=r"(carry)
+-      : [x]"r"(x), [y]"r"(y), [z]"r"(z), "0"(carry)
+-      : "cc", "memory");
+-   return carry;
+-   }
+-
+-/*
+-* Eight Word Block Linear Multiplication
+-*/
+-inline word word8_linmul2(word x[8], word y, word carry)
+-   {
+-   asm(
+-      DO_8_TIMES(LINMUL_OP, "x")
+-      : [carry]"=r"(carry)
+-      : [x]"r"(x), [y]"rm"(y), "0"(carry)
+-      : "cc", "%eax", "%edx");
+-   return carry;
+-   }
+-
+-/*
+-* Eight Word Block Linear Multiplication
+-*/
+-inline word word8_linmul3(word z[8], const word x[8], word y, word carry)
+-   {
+-   asm(
+-      DO_8_TIMES(LINMUL_OP, "z")
+-      : [carry]"=r"(carry)
+-      : [z]"r"(z), [x]"r"(x), [y]"rm"(y), "0"(carry)
+-      : "cc", "%eax", "%edx");
+-   return carry;
+-   }
+-
+-/*
+-* Eight Word Block Multiply/Add
+-*/
+-inline word word8_madd3(word z[8], const word x[8], word y, word carry)
+-   {
+-   asm(
+-      DO_8_TIMES(MULADD_OP, "")
+-      : [carry]"=r"(carry)
+-      : [z]"r"(z), [x]"r"(x), [y]"rm"(y), "0"(carry)
+-      : "cc", "%eax", "%edx");
+-   return carry;
+-   }
+-
+-/*
+-* Multiply-Add Accumulator
+-*/
+-inline void word3_muladd(word* w2, word* w1, word* w0, word x, word y)
+-   {
+-   asm(
+-      ASM("mull %[y]")
+-
+-      ASM("addl %[x],%[w0]")
+-      ASM("adcl %[y],%[w1]")
+-      ASM("adcl $0,%[w2]")
+-
+-      : [w0]"=r"(*w0), [w1]"=r"(*w1), [w2]"=r"(*w2)
+-      : [x]"a"(x), [y]"d"(y), "0"(*w0), "1"(*w1), "2"(*w2)
+-      : "cc");
+-   }
+-
+-/*
+-* Multiply-Add Accumulator
+-*/
+-inline void word3_muladd_2(word* w2, word* w1, word* w0, word x, word y)
+-   {
+-   asm(
+-      ASM("mull %[y]")
+-
+-      ASM("addl %[x],%[w0]")
+-      ASM("adcl %[y],%[w1]")
+-      ASM("adcl $0,%[w2]")
+-
+-      ASM("addl %[x],%[w0]")
+-      ASM("adcl %[y],%[w1]")
+-      ASM("adcl $0,%[w2]")
+-
+-      : [w0]"=r"(*w0), [w1]"=r"(*w1), [w2]"=r"(*w2)
+-      : [x]"a"(x), [y]"d"(y), "0"(*w0), "1"(*w1), "2"(*w2)
+-      : "cc");
+-   }
+-#else
+ /*
+ * Word Addition
+ */
+@@ -2718,9 +2458,6 @@ inline void word3_muladd_2(word* w2, word* w1, word* w0, word a, word b)
+    *w1 = word_add(*w1, b, &carry);
+    *w2 = word_add(*w2, top, &carry);
+    }
+-
+-#endif
+-
+ }
+ 
+ }
+diff --git a/src/libs/3rdparty/botan/botan.h b/src/libs/3rdparty/botan/botan.h
+index 6a9cbe0..3a66a14 100644
+--- a/src/libs/3rdparty/botan/botan.h
++++ b/src/libs/3rdparty/botan/botan.h
+@@ -80,9 +80,7 @@
+   #define BOTAN_GCC_VERSION 0
+ #endif
+ 
+-#define BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN
+-#define BOTAN_TARGET_CPU_IS_X86_FAMILY
+-#define BOTAN_TARGET_UNALIGNED_MEMORY_ACCESS_OK 1
++#define BOTAN_TARGET_UNALIGNED_MEMORY_ACCESS_OK 0
+ 
+ #if defined(BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN) || \
+     defined(BOTAN_TARGET_CPU_IS_BIG_ENDIAN)
+-- 
+1.8.3.2
+
diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_product.patch b/meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_product.patch
new file mode 100644
index 0000000..dea09ae
--- /dev/null
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_product.patch
@@ -0,0 +1,93 @@
+From c1c7cb2a5e6220a74f374a301e648479029f8a0e Mon Sep 17 00:00:00 2001
+From: Joerg Bornemann <joerg.bornemann@digia.com>
+Date: Mon, 12 Aug 2013 09:27:47 +0200
+Subject: [PATCH] introduce Transformer::product()
+
+Simplifies the calling code.
+Remove pointless nullpointer check from jscommandexecutor.
+
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Change-Id: I867181d2b750f32f04376ce860f5dee6555d3e33
+Reviewed-by: Christian Kandeler <christian.kandeler@digia.com>
+---
+ src/lib/buildgraph/jscommandexecutor.cpp      | 5 +----
+ src/lib/buildgraph/processcommandexecutor.cpp | 6 ++----
+ src/lib/buildgraph/transformer.cpp            | 7 +++++++
+ src/lib/buildgraph/transformer.h              | 1 +
+ 4 files changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp b/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp
+index b7f5b1d..24ffb7e 100644
+--- a/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp
++++ b/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp
+@@ -79,10 +79,7 @@ public slots:
+         m_result.errorMessage.clear();
+         ScriptEngine * const scriptEngine = provideScriptEngine();
+         QScriptValue scope = scriptEngine->newObject();
+-        Artifact *someOutputArtifact = *transformer->outputs.begin();
+-        if (!someOutputArtifact->product.isNull())
+-            setupScriptEngineForProduct(scriptEngine, someOutputArtifact->product,
+-                                        transformer->rule, scope);
++        setupScriptEngineForProduct(scriptEngine, transformer->product(), transformer->rule, scope);
+         transformer->setupInputs(scriptEngine, scope);
+         transformer->setupOutputs(scriptEngine, scope);
+ 
+diff --git a/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp b/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp
+index 78f77c3..d123fe8 100644
+--- a/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp
++++ b/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp
+@@ -276,8 +276,7 @@ void ProcessCommandExecutor::removeResponseFile()
+ 
+ QString ProcessCommandExecutor::findProcessCommandInPath()
+ {
+-    Artifact * const outputNode = *transformer()->outputs.begin();
+-    const ResolvedProductPtr product = outputNode->product;
++    const ResolvedProductPtr product = transformer()->product();
+     const ProcessCommand * const cmd = processCommand();
+     QString fullProgramPath = product->executablePathCache.value(cmd->program());
+     if (!fullProgramPath.isEmpty())
+@@ -309,8 +308,7 @@ QString ProcessCommandExecutor::findProcessCommandInPath()
+ 
+ QString ProcessCommandExecutor::findProcessCommandBySuffix()
+ {
+-    Artifact * const outputNode = *transformer()->outputs.begin();
+-    const ResolvedProductPtr product = outputNode->product;
++    const ResolvedProductPtr product = transformer()->product();
+     const ProcessCommand * const cmd = processCommand();
+     QString fullProgramPath = product->executablePathCache.value(cmd->program());
+     if (!fullProgramPath.isEmpty())
+diff --git a/src/shared/qbs/src/lib/buildgraph/transformer.cpp b/src/shared/qbs/src/lib/buildgraph/transformer.cpp
+index ce6baa7..363e08d 100644
+--- a/src/shared/qbs/src/lib/buildgraph/transformer.cpp
++++ b/src/shared/qbs/src/lib/buildgraph/transformer.cpp
+@@ -85,6 +85,13 @@ QScriptValue Transformer::translateInOutputs(QScriptEngine *scriptEngine, const
+     return jsTagFiles;
+ }
+ 
++ResolvedProductPtr Transformer::product() const
++{
++    if (outputs.isEmpty())
++        return ResolvedProductPtr();
++    return (*outputs.begin())->product;
++}
++
+ void Transformer::setupInputs(QScriptEngine *scriptEngine, QScriptValue targetScriptValue)
+ {
+     const QString &defaultModuleName = rule->module->name;
+diff --git a/src/shared/qbs/src/lib/buildgraph/transformer.h b/src/shared/qbs/src/lib/buildgraph/transformer.h
+index c9c88b6..d26c391 100644
+--- a/src/shared/qbs/src/lib/buildgraph/transformer.h
++++ b/src/shared/qbs/src/lib/buildgraph/transformer.h
+@@ -65,6 +65,7 @@ public:
+                                            const ArtifactList &artifacts,
+                                            const QString &defaultModuleName);
+ 
++    ResolvedProductPtr product() const;
+     void setupInputs(QScriptEngine *scriptEngine, QScriptValue targetScriptValue);
+     void setupOutputs(QScriptEngine *scriptEngine, QScriptValue targetScriptValue);
+     void createCommands(const PrepareScriptConstPtr &script,
+-- 
+1.8.4
+
diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
similarity index 78%
rename from meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
rename to meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
index a95ad5a..3a29c3b 100644
--- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
@@ -6,9 +6,11 @@ LIC_FILES_CHKSUM = "file://LGPL_EXCEPTION.TXT;md5=eb6c371255e1262c55ae9b652a90b5
                     file://LICENSE.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
 SECTION = "qt/app"
 
-SRC_URI = "http://download.qt-project.org/official_releases/qtcreator/2.8/${PV}/${BP}-src.tar.gz"
-SRC_URI[md5sum] = "5aacdad4491b7dda9758a81384d8da79"
-SRC_URI[sha256sum] = "7ac5d9a36c2f561f74d77378d4eae95a78c7752b323e1df924d6e895e99f45d2"
+SRC_URI = "http://download.qt-project.org/official_releases/qtcreator/2.8/${PV}/${BP}-src.tar.gz \
+           file://fix.missing.cpuid.h.patch \
+           file://qbs_transformer_product.patch"
+SRC_URI[md5sum] = "79ef6c6ece0c00035ef744c9d6e3bd3b"
+SRC_URI[sha256sum] = "d5ae007a297a4288d0e95fd605edbfb8aee80f6788c7a6cfb9cb297f50c364b9"
 
 S = "${WORKDIR}/${BP}-src"
 
-- 
1.8.4


