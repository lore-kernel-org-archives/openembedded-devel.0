Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7CE60588
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 11:34:07 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u188so222333320wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 03:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ylMZxcbUkRzOe7Y7cylHEeTr6E7xusCJrpDfQrcZeCU=;
	b=HMbuFKuPMX8CTry+HLguaqpFDX1kfmZYlL1Awo0/dpYES3CQr/eesweXd+JzkijFY7
	MITNcnVsi0/HXaJhD9k77g3j0c2/SjdxwyEHKc0s7ztpGbYddDvVNTvHCsNFT6KTywjF
	3/xS6eynB/gTQCxb7ab84zA/un/lv9vuxoL1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ylMZxcbUkRzOe7Y7cylHEeTr6E7xusCJrpDfQrcZeCU=;
	b=fzn0vSaPZ1jyj68ydifCPAFJSn06aGTm/GzU9XLVKHBc4YJxGwxZxJfH7dV25lhczG
	fx7U5ZOQ4ypR9g3S6kHxgr08OrMUiKDqUxrQeFnaD6Igy/Gjysb2+qB7FqtgI48V3eLv
	mWoqADh3m9HFgTrPo9CroOCOKHaWdMYUXlXbrWjDzHyvRMbiTYx+nRLfD2FgnJ/G9Qq0
	FZqsrg93r+/24s4b/4RDv9kexagavKpE1HQQJeoXq+HaZ4WQtzSbNGFJ+ISnBZPxTiul
	meLyNTehaU98pBJTSHNj7ztLA22AjqBUw+NhHu+TsYG4clM1pzcOHwNPV0l5nX5II5vM
	aHVQ==
X-Gm-Message-State: AG10YOQVl4BdN/+B2305DFfTnK1+RxpkDCHsAJUMjCOwPYH9arEEG6nG6/Bxd4ogbpw6bnD6
X-Received: by 10.28.4.139 with SMTP id 133mr9277450wme.21.1453376047628;
	Thu, 21 Jan 2016 03:34:07 -0800 (PST)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by smtp.gmail.com with ESMTPSA id
	kb5sm1054275wjc.22.2016.01.21.03.34.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jan 2016 03:34:06 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jan 2016 12:34:00 +0100
Message-Id: <1453376040-25632-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] various: delete leftovers from qt4 recipes that break parsing due to missing classes
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
X-List-Received-Date: Thu, 21 Jan 2016 11:34:10 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 ...erinterface.cpp-add-sys-socket.h-as-inclu.patch |  41 ---
 .../0002-qconsole-writethread-gcc-4.5-fixes.patch  |  40 ---
 .../qcanobserver/qcanobserver/candemo.xml          |  40 ---
 .../qt-creator/fix.missing.cpuid.h.patch           | 384 ---------------------
 .../qt-creator/qbs_transformer_product.patch       |  93 -----
 meta-oe/recipes-qt/qtserialport/qtserialport.inc   |  48 ---
 6 files changed, 646 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
 delete mode 100644 meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
 delete mode 100755 meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
 delete mode 100644 meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.patch
 delete mode 100644 meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_product.patch
 delete mode 100644 meta-oe/recipes-qt/qtserialport/qtserialport.inc

diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch b/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
deleted file mode 100644
index 1b3da3b..0000000
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From ebb464e3dfa2d59d65c3aa8ee652cb7607481f61 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 10 Nov 2011 19:38:27 +0100
-Subject: [PATCH] messagebufferinterface.cpp: move sys/socket.h include
-
-This prevents the following error during cross-compiling:
-
-| In file included from messagebufferinterface.cpp:30:
-| /OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/linux/can.h:81: error: 'sa_family_t' does not name a type
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- messagebufferinterface.cpp |    7 ++++---
- 1 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/messagebufferinterface.cpp b/messagebufferinterface.cpp
-index 116564c..3e9a535 100644
---- a/messagebufferinterface.cpp
-+++ b/messagebufferinterface.cpp
-@@ -25,14 +25,15 @@
- #include <sys/time.h>
- #include <QFile>
- 
-+#include <sys/types.h>
-+#include <sys/socket.h>
-+#include <sys/stat.h>
-+
- //#include <linux/can.h>
- //#include <linux/can/raw.h>
- #include <syscall.h>
- 
- #include "configdialog.h"
--#include <sys/types.h>
--#include <sys/socket.h>
--#include <sys/stat.h>
- #include <linux/can.h>
- #include <linux/can/raw.h>
- 
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch b/meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
deleted file mode 100644
index 4561923..0000000
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3b3cb5212b5dbf182beed171045e5d179b2e9000 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 11 Nov 2011 09:32:14 +0100
-Subject: [PATCH 2/2] qconsole, writethread: gcc 4.5 fixes
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- qconsole.cpp    |    2 +-
- writethread.cpp |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/qconsole.cpp b/qconsole.cpp
-index ea86957..b5a4687 100644
---- a/qconsole.cpp
-+++ b/qconsole.cpp
-@@ -22,7 +22,7 @@ QConsole::QConsole()
- 
- {
-     this->setReadOnly(true);
--    QTextEdit::QTextEdit(NULL);
-+    QTextEdit(NULL);
- }
- 
- 
-diff --git a/writethread.cpp b/writethread.cpp
-index ef7bc13..ff19560 100755
---- a/writethread.cpp
-+++ b/writethread.cpp
-@@ -69,7 +69,7 @@ void WriteThread::setDev(void *ConfData, QString InterfaceLib, bool shareDevLib)
-     if(!handle)
-     {
-         QString *ErrStr = new QString(" ");
--        ErrStr->sprintf("%s %s","Could not load Device Mapper: ", InterfaceLib);
-+        ErrStr->sprintf("%s %s","Could not load Device Mapper: ", (char*)InterfaceLib.constData());
-         ErrorDialog *ed = new ErrorDialog;
-         ed->SetErrorMessage(*ErrStr);
-         delete ErrStr;
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml b/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
deleted file mode 100755
index 304713f..0000000
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver/candemo.xml
+++ /dev/null
@@ -1,40 +0,0 @@
-<?xml version="1.0" encoding="ISO-8859-1"?>
-
-<Database Name="EW-demo">
-    <ID Id="180">
-	<Item0>
-	    <interpret Multiplier="0.010986328125" Name="MotorPos" Offset="-180" Datamask="00120000">
-	    </interpret>
-	</Item0>
-	</ID>
-	    <ID Id="280">
-	<Item0>
-	    <interpret Multiplier="1.0" Name="Fanstatus" Offset="0" Datamask="10000000">
-	    </interpret>
-	</Item0>
-	</ID>
-	    <ID Id="380">
-	<Item0>
-	    <interpret Multiplier="0.00390625" Name="temp1" Offset="0" Datamask="00120000">
-	    </interpret>
-	</Item0>
-	</ID>
-	    <ID Id="480">
-	<Item0>
-	    <interpret Multiplier="1.0" Name="fanstatus" Offset="0" Datamask="10000000">
-	    </interpret>
-	</Item0>
-	</ID>
-	<ID Id="580">
-	<Item0>
-	    <interpret Multiplier="1.0" Name="lampstatus" Offset="0" Datamask="10000000">
-	    </interpret>
-	</Item0>
-	</ID>
-	<ID Id="680">
-	<Item0>
-	<interpret Multiplier="0.00390625" Name="Lightsensor" Offset="0" Datamask="00120000">
-	</interpret>
-	</Item0>
-	</ID>
-</Database>
diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.patch b/meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.patch
deleted file mode 100644
index 363bee3..0000000
--- a/meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.patch
+++ /dev/null
@@ -1,384 +0,0 @@
-From 8be071bbca6a9b8e06a7466d848a2b4b6dbcbc1f Mon Sep 17 00:00:00 2001
-From: Christian Kandeler <christian.kandeler@digia.com>
-Date: Fri, 19 Jul 2013 13:40:30 +0200
-Subject: [PATCH] WIP: Remove x86 assembler code from botan sources.
-
-Taken from
-https://bugreports.qt-project.org/browse/QTCREATORBUG-8107
-
-Upstream-Status: Submitted
-
-Change-Id: I3780aa4551f563c5f43833ec822e3c1add7012f2
----
- src/libs/3rdparty/botan/botan.cpp | 297 +++-----------------------------------
- src/libs/3rdparty/botan/botan.h   |   4 +-
- 2 files changed, 18 insertions(+), 283 deletions(-)
-
-diff --git a/src/libs/3rdparty/botan/botan.cpp b/src/libs/3rdparty/botan/botan.cpp
-index 917c385..c515750 100644
---- a/src/libs/3rdparty/botan/botan.cpp
-+++ b/src/libs/3rdparty/botan/botan.cpp
-@@ -1098,35 +1098,31 @@ class Montgomery_Exponentiator : public Modular_Exponentiator
- 
- }
- 
--
--#if (BOTAN_MP_WORD_BITS != 32)
--   #error The mp_x86_32 module requires that BOTAN_MP_WORD_BITS == 32
-+#if (BOTAN_MP_WORD_BITS == 8)
-+typedef Botan::u16bit dword;
-+#elif (BOTAN_MP_WORD_BITS == 16)
-+typedef Botan::u32bit dword;
-+#elif (BOTAN_MP_WORD_BITS == 32)
-+typedef Botan::u64bit dword;
-+#elif (BOTAN_MP_WORD_BITS == 64)
-+#error BOTAN_MP_WORD_BITS can be 64 only with assembly support
-+#else
-+#error BOTAN_MP_WORD_BITS must be 8, 16, 32, or 64
- #endif
- 
--#ifdef Q_OS_UNIX
-+
- namespace Botan {
- 
- extern "C" {
- 
- /*
--* Helper Macros for x86 Assembly
--*/
--#define ASM(x) x "\n\t"
--
--/*
- * Word Multiply
- */
- inline word word_madd2(word a, word b, word* c)
-    {
--   asm(
--      ASM("mull %[b]")
--      ASM("addl %[c],%[a]")
--      ASM("adcl $0,%[carry]")
--
--      : [a]"=a"(a), [b]"=rm"(b), [carry]"=&d"(*c)
--      : "0"(a), "1"(b), [c]"g"(*c) : "cc");
--
--   return a;
-+    dword z = (dword)a * b + *c;
-+    *c = (word)(z >> BOTAN_MP_WORD_BITS);
-+    return (word)z;
-    }
- 
- /*
-@@ -1134,25 +1130,12 @@ inline word word_madd2(word a, word b, word* c)
- */
- inline word word_madd3(word a, word b, word c, word* d)
-    {
--   asm(
--      ASM("mull %[b]")
--
--      ASM("addl %[c],%[a]")
--      ASM("adcl $0,%[carry]")
--
--      ASM("addl %[d],%[a]")
--      ASM("adcl $0,%[carry]")
--
--      : [a]"=a"(a), [b]"=rm"(b), [carry]"=&d"(*d)
--      : "0"(a), "1"(b), [c]"g"(c), [d]"g"(*d) : "cc");
--
--   return a;
-+    dword z = (dword)a * b + c + *d;
-+    *d = (word)(z >> BOTAN_MP_WORD_BITS);
-+    return (word)z;
-    }
--
- }
--
- }
--#endif
- 
- 
- 
-@@ -1704,30 +1687,6 @@ void unlock_mem(void* addr, size_t length);
- 
- namespace Botan {
- 
--extern "C" {
--
--/*
--* Word Multiply/Add
--*/
--inline word word_madd2(word a, word b, word* c)
--   {
--   dword z = (dword)a * b + *c;
--   *c = (word)(z >> BOTAN_MP_WORD_BITS);
--   return (word)z;
--   }
--
--/*
--* Word Multiply/Add
--*/
--inline word word_madd3(word a, word b, word c, word* d)
--   {
--   dword z = (dword)a * b + c + *d;
--   *d = (word)(z >> BOTAN_MP_WORD_BITS);
--   return (word)z;
--   }
--
--}
--
- /**
- * Win32 CAPI Entropy Source
- */
-@@ -2315,225 +2274,6 @@ namespace Botan {
- 
- extern "C" {
- 
--#ifdef Q_OS_UNIX
--/*
--* Helper Macros for x86 Assembly
--*/
--#ifndef ASM
--  #define ASM(x) x "\n\t"
--#endif
--
--#define ADDSUB2_OP(OPERATION, INDEX)                     \
--        ASM("movl 4*" #INDEX "(%[y]), %[carry]")         \
--        ASM(OPERATION " %[carry], 4*" #INDEX "(%[x])")   \
--
--#define ADDSUB3_OP(OPERATION, INDEX)                     \
--        ASM("movl 4*" #INDEX "(%[x]), %[carry]")         \
--        ASM(OPERATION " 4*" #INDEX "(%[y]), %[carry]")   \
--        ASM("movl %[carry], 4*" #INDEX "(%[z])")         \
--
--#define LINMUL_OP(WRITE_TO, INDEX)                       \
--        ASM("movl 4*" #INDEX "(%[x]),%%eax")             \
--        ASM("mull %[y]")                                 \
--        ASM("addl %[carry],%%eax")                       \
--        ASM("adcl $0,%%edx")                             \
--        ASM("movl %%edx,%[carry]")                       \
--        ASM("movl %%eax, 4*" #INDEX "(%[" WRITE_TO "])")
--
--#define MULADD_OP(IGNORED, INDEX)                        \
--        ASM("movl 4*" #INDEX "(%[x]),%%eax")             \
--        ASM("mull %[y]")                                 \
--        ASM("addl %[carry],%%eax")                       \
--        ASM("adcl $0,%%edx")                             \
--        ASM("addl 4*" #INDEX "(%[z]),%%eax")             \
--        ASM("adcl $0,%%edx")                             \
--        ASM("movl %%edx,%[carry]")                       \
--        ASM("movl %%eax, 4*" #INDEX " (%[z])")
--
--#define DO_8_TIMES(MACRO, ARG) \
--        MACRO(ARG, 0) \
--        MACRO(ARG, 1) \
--        MACRO(ARG, 2) \
--        MACRO(ARG, 3) \
--        MACRO(ARG, 4) \
--        MACRO(ARG, 5) \
--        MACRO(ARG, 6) \
--        MACRO(ARG, 7)
--
--#define ADD_OR_SUBTRACT(CORE_CODE)     \
--        ASM("rorl %[carry]")           \
--        CORE_CODE                      \
--        ASM("sbbl %[carry],%[carry]")  \
--        ASM("negl %[carry]")
--
--/*
--* Word Addition
--*/
--inline word word_add(word x, word y, word* carry)
--   {
--   asm(
--      ADD_OR_SUBTRACT(ASM("adcl %[y],%[x]"))
--      : [x]"=r"(x), [carry]"=r"(*carry)
--      : "0"(x), [y]"rm"(y), "1"(*carry)
--      : "cc");
--   return x;
--   }
--
--/*
--* Eight Word Block Addition, Two Argument
--*/
--inline word word8_add2(word x[8], const word y[8], word carry)
--   {
--   asm(
--      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB2_OP, "adcl"))
--      : [carry]"=r"(carry)
--      : [x]"r"(x), [y]"r"(y), "0"(carry)
--      : "cc", "memory");
--   return carry;
--   }
--
--/*
--* Eight Word Block Addition, Three Argument
--*/
--inline word word8_add3(word z[8], const word x[8], const word y[8], word carry)
--   {
--   asm(
--      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB3_OP, "adcl"))
--      : [carry]"=r"(carry)
--      : [x]"r"(x), [y]"r"(y), [z]"r"(z), "0"(carry)
--      : "cc", "memory");
--   return carry;
--   }
--
--/*
--* Word Subtraction
--*/
--inline word word_sub(word x, word y, word* carry)
--   {
--   asm(
--      ADD_OR_SUBTRACT(ASM("sbbl %[y],%[x]"))
--      : [x]"=r"(x), [carry]"=r"(*carry)
--      : "0"(x), [y]"rm"(y), "1"(*carry)
--      : "cc");
--   return x;
--   }
--
--/*
--* Eight Word Block Subtraction, Two Argument
--*/
--inline word word8_sub2(word x[8], const word y[8], word carry)
--   {
--   asm(
--      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB2_OP, "sbbl"))
--      : [carry]"=r"(carry)
--      : [x]"r"(x), [y]"r"(y), "0"(carry)
--      : "cc", "memory");
--   return carry;
--   }
--
--/*
--* Eight Word Block Subtraction, Two Argument
--*/
--inline word word8_sub2_rev(word x[8], const word y[8], word carry)
--   {
--   asm(
--      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB3_OP, "sbbl"))
--      : [carry]"=r"(carry)
--      : [x]"r"(y), [y]"r"(x), [z]"r"(x), "0"(carry)
--      : "cc", "memory");
--   return carry;
--   }
--
--/*
--* Eight Word Block Subtraction, Three Argument
--*/
--inline word word8_sub3(word z[8], const word x[8], const word y[8], word carry)
--   {
--   asm(
--      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB3_OP, "sbbl"))
--      : [carry]"=r"(carry)
--      : [x]"r"(x), [y]"r"(y), [z]"r"(z), "0"(carry)
--      : "cc", "memory");
--   return carry;
--   }
--
--/*
--* Eight Word Block Linear Multiplication
--*/
--inline word word8_linmul2(word x[8], word y, word carry)
--   {
--   asm(
--      DO_8_TIMES(LINMUL_OP, "x")
--      : [carry]"=r"(carry)
--      : [x]"r"(x), [y]"rm"(y), "0"(carry)
--      : "cc", "%eax", "%edx");
--   return carry;
--   }
--
--/*
--* Eight Word Block Linear Multiplication
--*/
--inline word word8_linmul3(word z[8], const word x[8], word y, word carry)
--   {
--   asm(
--      DO_8_TIMES(LINMUL_OP, "z")
--      : [carry]"=r"(carry)
--      : [z]"r"(z), [x]"r"(x), [y]"rm"(y), "0"(carry)
--      : "cc", "%eax", "%edx");
--   return carry;
--   }
--
--/*
--* Eight Word Block Multiply/Add
--*/
--inline word word8_madd3(word z[8], const word x[8], word y, word carry)
--   {
--   asm(
--      DO_8_TIMES(MULADD_OP, "")
--      : [carry]"=r"(carry)
--      : [z]"r"(z), [x]"r"(x), [y]"rm"(y), "0"(carry)
--      : "cc", "%eax", "%edx");
--   return carry;
--   }
--
--/*
--* Multiply-Add Accumulator
--*/
--inline void word3_muladd(word* w2, word* w1, word* w0, word x, word y)
--   {
--   asm(
--      ASM("mull %[y]")
--
--      ASM("addl %[x],%[w0]")
--      ASM("adcl %[y],%[w1]")
--      ASM("adcl $0,%[w2]")
--
--      : [w0]"=r"(*w0), [w1]"=r"(*w1), [w2]"=r"(*w2)
--      : [x]"a"(x), [y]"d"(y), "0"(*w0), "1"(*w1), "2"(*w2)
--      : "cc");
--   }
--
--/*
--* Multiply-Add Accumulator
--*/
--inline void word3_muladd_2(word* w2, word* w1, word* w0, word x, word y)
--   {
--   asm(
--      ASM("mull %[y]")
--
--      ASM("addl %[x],%[w0]")
--      ASM("adcl %[y],%[w1]")
--      ASM("adcl $0,%[w2]")
--
--      ASM("addl %[x],%[w0]")
--      ASM("adcl %[y],%[w1]")
--      ASM("adcl $0,%[w2]")
--
--      : [w0]"=r"(*w0), [w1]"=r"(*w1), [w2]"=r"(*w2)
--      : [x]"a"(x), [y]"d"(y), "0"(*w0), "1"(*w1), "2"(*w2)
--      : "cc");
--   }
--#else
- /*
- * Word Addition
- */
-@@ -2718,9 +2458,6 @@ inline void word3_muladd_2(word* w2, word* w1, word* w0, word a, word b)
-    *w1 = word_add(*w1, b, &carry);
-    *w2 = word_add(*w2, top, &carry);
-    }
--
--#endif
--
- }
- 
- }
-diff --git a/src/libs/3rdparty/botan/botan.h b/src/libs/3rdparty/botan/botan.h
-index 6a9cbe0..3a66a14 100644
---- a/src/libs/3rdparty/botan/botan.h
-+++ b/src/libs/3rdparty/botan/botan.h
-@@ -80,9 +80,7 @@
-   #define BOTAN_GCC_VERSION 0
- #endif
- 
--#define BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN
--#define BOTAN_TARGET_CPU_IS_X86_FAMILY
--#define BOTAN_TARGET_UNALIGNED_MEMORY_ACCESS_OK 1
-+#define BOTAN_TARGET_UNALIGNED_MEMORY_ACCESS_OK 0
- 
- #if defined(BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN) || \
-     defined(BOTAN_TARGET_CPU_IS_BIG_ENDIAN)
--- 
-1.8.3.2
-
diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_product.patch b/meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_product.patch
deleted file mode 100644
index dea09ae..0000000
--- a/meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_product.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From c1c7cb2a5e6220a74f374a301e648479029f8a0e Mon Sep 17 00:00:00 2001
-From: Joerg Bornemann <joerg.bornemann@digia.com>
-Date: Mon, 12 Aug 2013 09:27:47 +0200
-Subject: [PATCH] introduce Transformer::product()
-
-Simplifies the calling code.
-Remove pointless nullpointer check from jscommandexecutor.
-
-Upstream-Status: Backport
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-Change-Id: I867181d2b750f32f04376ce860f5dee6555d3e33
-Reviewed-by: Christian Kandeler <christian.kandeler@digia.com>
----
- src/lib/buildgraph/jscommandexecutor.cpp      | 5 +----
- src/lib/buildgraph/processcommandexecutor.cpp | 6 ++----
- src/lib/buildgraph/transformer.cpp            | 7 +++++++
- src/lib/buildgraph/transformer.h              | 1 +
- 4 files changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp b/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp
-index b7f5b1d..24ffb7e 100644
---- a/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp
-+++ b/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp
-@@ -79,10 +79,7 @@ public slots:
-         m_result.errorMessage.clear();
-         ScriptEngine * const scriptEngine = provideScriptEngine();
-         QScriptValue scope = scriptEngine->newObject();
--        Artifact *someOutputArtifact = *transformer->outputs.begin();
--        if (!someOutputArtifact->product.isNull())
--            setupScriptEngineForProduct(scriptEngine, someOutputArtifact->product,
--                                        transformer->rule, scope);
-+        setupScriptEngineForProduct(scriptEngine, transformer->product(), transformer->rule, scope);
-         transformer->setupInputs(scriptEngine, scope);
-         transformer->setupOutputs(scriptEngine, scope);
- 
-diff --git a/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp b/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp
-index 78f77c3..d123fe8 100644
---- a/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp
-+++ b/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp
-@@ -276,8 +276,7 @@ void ProcessCommandExecutor::removeResponseFile()
- 
- QString ProcessCommandExecutor::findProcessCommandInPath()
- {
--    Artifact * const outputNode = *transformer()->outputs.begin();
--    const ResolvedProductPtr product = outputNode->product;
-+    const ResolvedProductPtr product = transformer()->product();
-     const ProcessCommand * const cmd = processCommand();
-     QString fullProgramPath = product->executablePathCache.value(cmd->program());
-     if (!fullProgramPath.isEmpty())
-@@ -309,8 +308,7 @@ QString ProcessCommandExecutor::findProcessCommandInPath()
- 
- QString ProcessCommandExecutor::findProcessCommandBySuffix()
- {
--    Artifact * const outputNode = *transformer()->outputs.begin();
--    const ResolvedProductPtr product = outputNode->product;
-+    const ResolvedProductPtr product = transformer()->product();
-     const ProcessCommand * const cmd = processCommand();
-     QString fullProgramPath = product->executablePathCache.value(cmd->program());
-     if (!fullProgramPath.isEmpty())
-diff --git a/src/shared/qbs/src/lib/buildgraph/transformer.cpp b/src/shared/qbs/src/lib/buildgraph/transformer.cpp
-index ce6baa7..363e08d 100644
---- a/src/shared/qbs/src/lib/buildgraph/transformer.cpp
-+++ b/src/shared/qbs/src/lib/buildgraph/transformer.cpp
-@@ -85,6 +85,13 @@ QScriptValue Transformer::translateInOutputs(QScriptEngine *scriptEngine, const
-     return jsTagFiles;
- }
- 
-+ResolvedProductPtr Transformer::product() const
-+{
-+    if (outputs.isEmpty())
-+        return ResolvedProductPtr();
-+    return (*outputs.begin())->product;
-+}
-+
- void Transformer::setupInputs(QScriptEngine *scriptEngine, QScriptValue targetScriptValue)
- {
-     const QString &defaultModuleName = rule->module->name;
-diff --git a/src/shared/qbs/src/lib/buildgraph/transformer.h b/src/shared/qbs/src/lib/buildgraph/transformer.h
-index c9c88b6..d26c391 100644
---- a/src/shared/qbs/src/lib/buildgraph/transformer.h
-+++ b/src/shared/qbs/src/lib/buildgraph/transformer.h
-@@ -65,6 +65,7 @@ public:
-                                            const ArtifactList &artifacts,
-                                            const QString &defaultModuleName);
- 
-+    ResolvedProductPtr product() const;
-     void setupInputs(QScriptEngine *scriptEngine, QScriptValue targetScriptValue);
-     void setupOutputs(QScriptEngine *scriptEngine, QScriptValue targetScriptValue);
-     void createCommands(const PrepareScriptConstPtr &script,
--- 
-1.8.4
-
diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport.inc b/meta-oe/recipes-qt/qtserialport/qtserialport.inc
deleted file mode 100644
index dde49a5..0000000
--- a/meta-oe/recipes-qt/qtserialport/qtserialport.inc
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "Qt Serial Port Library"
-SECTION = "qt/libs"
-HOMEPAGE = "http://qt-project.org/wiki/QtSerialPort"
-
-LICENSE = "(LGPL-2.1 | GPL-3.0) & GFDL-1.3"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
-    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c \
-    "
-
-inherit pkgconfig
-
-SRC_URI = " \
-    git://gitorious.org/qt/qtserialport.git;branch=stable \
-"
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/${BPN}-${PV}"
-
-QMAKE_PROFILES = "${S}/qtserialport.pro"
-EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
-OE_QMAKE_QMAKE = "${WORKDIR}/qmake2"
-
-do_prepare_qmake_symlink() {
-    ln -sf "${STAGING_BINDIR_NATIVE}/qmake2" ${WORKDIR}
-}
-
-addtask prepare_qmake_symlink after do_generate_qt_config_file before do_configure
-
-do_configure_prepend() {
-    sed -i -e "s|\(Prefix\ =\).*|\1${prefix}|" ${WORKDIR}/qt.conf 
-    sed -i -r -e "/^(Binaries|Headers|Plugins|Mkspecs)/ d" ${WORKDIR}/qt.conf 
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D} INCLUDEDIR=${includedir}
-}
-
-FILES_${PN}-dev += " \
-    ${includedir}/QtSerialPort/* \
-    ${prefix}/mkspecs/* \
-    ${libdir}/*.prl \
-"
-
-FILES_${PN}-dbg += " \
-    ${libdir}/.debug/* \
-"
-- 
2.4.3


