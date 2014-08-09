Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id AA64370A71
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:36:31 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so6795985wes.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hstcJ51Tbsi39f5b1/YlAoOnMnq8wyQ8nljMs9z9nUU=;
	b=ZfiKm7jY6t7F5dfZGmugI6HVPAyC2WIN6BW7y/eVN8S2wC8SWU3fuAKR99uf10lpOI
	hgL5G0kwG0VMsWgb01dHkB2rTsX2BttxXbiU8/RwvlUkyPpMuWNUfTh9a0vnpJ604cf7
	CmXpfRirnlVQ8EkSFsmG5Z9Dy2GSInbdC4hKBwvidKku28YTXY9Dn44QeiPctv1SZnLX
	hwxBS1EV5g+72KES35+1LBczWwnW7yqtHccpcotpX2VrQrQe9IOSYZy/nRo1Sf330GKD
	Emdr+RqojHueQm594rgMdxFc8LHozmkWdBYtd27I7zQqNcOU0vt25EADSmS8s7O6R6qM
	WXDw==
X-Received: by 10.194.187.4 with SMTP id fo4mr39896995wjc.35.1407602192022;
	Sat, 09 Aug 2014 09:36:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f16sm20688804wic.7.2014.08.09.09.36.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:36:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:37:02 +0200
Message-Id: <1407602222-23308-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][PATCH] llvm: drop 2.8 and 2.9 versions
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
X-List-Received-Date: Sat, 09 Aug 2014 16:36:41 -0000

* mesa is now using 3.3 by default and I don't know about any llvm2* users

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc                 |  83 +++++++++-
 .../recipes-core/llvm/llvm2.8/0019-issue6065.patch |  20 ---
 .../llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch | 113 --------------
 meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch |  12 --
 .../llvm/llvm2.8/llvm-mc_disable.patch             |  12 --
 meta-oe/recipes-core/llvm/llvm2.8_2.8.bb           |  16 --
 .../recipes-core/llvm/llvm2.9/0019-issue6065.patch |  35 -----
 .../recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch   |  16 --
 .../llvm/llvm2.9/arm_fenv_uclibc.patch             |  14 --
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb           |  21 ---
 meta-oe/recipes-core/llvm/llvm2.inc                | 170 ---------------------
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb           |   1 -
 meta-oe/recipes-core/llvm/llvm3.inc                |  80 ----------
 13 files changed, 80 insertions(+), 513 deletions(-)
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.8/0019-issue6065.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.8_2.8.bb
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.9/0019-issue6065.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
 delete mode 100644 meta-oe/recipes-core/llvm/llvm2.inc
 delete mode 100644 meta-oe/recipes-core/llvm/llvm3.inc

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index acbf3c3..26bac33 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -25,13 +25,90 @@ HOMEPAGE = "http://llvm.org"
 LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
 
-# 2.* inherits also cmake
-# 3.* inherits also automake
-inherit perlnative pythonnative
+DEPENDS = "libffi libxml2-native llvm-common"
+
+inherit perlnative pythonnative autotools
 
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
+S = "${WORKDIR}/llvm-${PV}.src"
+
+LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
+LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
+
+EXTRA_OECONF += "--disable-assertions \
+                 --enable-debug-runtime \
+                 --disable-expensive-checks \
+                 --enable-bindings=none \
+                 --enable-keep-symbols \
+                 --enable-libffi \
+                 --enable-optimized \
+                 --enable-shared \
+                 --enable-targets=host-only"
+EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
+
+do_configure_prepend() {
+    # Remove RPATHs
+    sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' ${S}/Makefile.rules
+
+    # Drop "svn" suffix from version string
+    sed -i 's/${PV}svn/${PV}/g' ${S}/configure
+
+    # Fix paths in llvm-config
+    sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
+    sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
+
+    # Fails to build unless using separate directory from source
+    mkdir -p ${LLVM_BUILD_DIR}
+    cd ${LLVM_BUILD_DIR}
+}
+
+do_compile() {
+    cd ${LLVM_BUILD_DIR}
+    oe_runmake \
+        AR="${BUILD_AR}" \
+        CC="${BUILD_CC}" \
+        CFLAGS="${BUILD_CFLAGS}" \
+        CXX="${BUILD_CXX}" \
+        CXXFLAGS="${BUILD_CXXFLAGS}" \
+        CPP="${BUILD_CPP}" \
+        CPPFLAGS="${BUILD_CPPFLAGS}" \
+        NM="${BUILD_NM}" \
+        RANLIB="${BUILD_RANLIB}" \
+        PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
+        cross-compile-build-tools
+    oe_runmake
+}
+
+do_install() {
+    cd ${LLVM_BUILD_DIR}
+    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
+
+    mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config-host ${LLVM_INSTALL_DIR}/llvm-config-host
+
+    install -d ${D}${bindir}/${LLVM_DIR}
+    mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
+
+    install -d ${D}${includedir}/${LLVM_DIR}
+    mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
+
+    install -d ${D}${libdir}/${LLVM_DIR}
+    mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
+    ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
+
+    install -d ${D}${docdir}/${LLVM_DIR}
+    mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
+}
+
+SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
+
+llvm_sysroot_preprocess() {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+    mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
+}
+
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-staticdev = "1"
 FILES_${PN} = ""
diff --git a/meta-oe/recipes-core/llvm/llvm2.8/0019-issue6065.patch b/meta-oe/recipes-core/llvm/llvm2.8/0019-issue6065.patch
deleted file mode 100644
index a7f7bbe..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.8/0019-issue6065.patch
+++ /dev/null
@@ -1,20 +0,0 @@
----
- ARMJITInfo.cpp |    6 ++++++
- 1 file changed, 6 insertions(+)
-
---- a/lib/Target/ARM/ARMJITInfo.cpp
-+++ b/lib/Target/ARM/ARMJITInfo.cpp
-@@ -99,7 +99,13 @@
-     // The above twiddling of the saved return addresses allows us to
-     // deallocate everything, including the LR the stub saved, all in one
-     // pop instruction.
-+#ifndef __thumb__
-     "ldmia  sp!, {r0, r1, r2, r3, lr, pc}\n"
-+#else
-+    // thumb dont allow lr and pc to be poped in the same instruction.
-+    "pop {r0, r1, r2, r3, lr}\n"
-+    "pop {pc}\n"
-+#endif
-       );
- #else  // Not an ARM host
-   void ARMCompilationCallback() {
diff --git a/meta-oe/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch b/meta-oe/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch
deleted file mode 100644
index ee5cbaf..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-Index: llvm-2.8/lib/ExecutionEngine/JIT/JIT.cpp
-===================================================================
---- llvm-2.8.orig/lib/ExecutionEngine/JIT/JIT.cpp	2010-08-17 18:19:18.000000000 +0200
-+++ llvm-2.8/lib/ExecutionEngine/JIT/JIT.cpp	2011-12-19 21:16:21.884288536 +0100
-@@ -252,7 +252,12 @@
-     MutexGuard guard(Lock);
-     JITs.erase(jit);
-   }
--  void *getPointerToNamedFunction(const char *Name) const {
-+  bool empty() {
-+    MutexGuard guard(Lock);
-+    return JITs.empty();
-+  }
-+  void *getPointerToNamedFunction(const char *Name,
-+                                  bool AbortOnFailure = true) const {
-     MutexGuard guard(Lock);
-     assert(JITs.size() != 0 && "No Jit registered");
-     //search function in every instance of JIT
-@@ -264,7 +269,19 @@
-     }
-     // The function is not available : fallback on the first created (will
-     // search in symbol of the current program/library)
--    return (*JITs.begin())->getPointerToNamedFunction(Name);
-+    return (*JITs.begin())->getPointerToNamedFunction(Name, AbortOnFailure);
-+  }
-+  void *getPointerToGlobalIfAvailable(GlobalValue *V) const {
-+    MutexGuard guard(Lock);
-+    assert(JITs.size() != 0 && "No Jit registered");
-+    //search function in every instance of JIT
-+    for (SmallPtrSet<JIT*, 1>::const_iterator Jit = JITs.begin(),
-+           end = JITs.end();
-+         Jit != end; ++Jit) {
-+      if (void *Ptr = (*Jit)->getPointerToGlobalIfAvailable(V))
-+	return Ptr;
-+    }
-+    return 0;
-   }
- };
- ManagedStatic<JitPool> AllJits;
-@@ -280,6 +297,22 @@
-   }
- }
- 
-+extern "C" {
-+  // getPointerToNamedFunctionOrNull - same as the above, but returns
-+  // NULL instead of aborting if the function cannot be found.
-+  void *getPointerToNamedFunctionOrNull(const char *Name) {
-+    return !AllJits->empty() ? AllJits->getPointerToNamedFunction(Name, false) : 0;
-+  }
-+}
-+
-+extern "C" {
-+  // getPointerToGlobalIfAvailable - same as the above, but for global
-+  // variables, and only for those that have been codegened already.
-+  void *getPointerToGlobalIfAvailable(GlobalValue *V) {
-+    return !AllJits->empty() ? AllJits->getPointerToGlobalIfAvailable(V) : 0;
-+  }
-+}
-+
- JIT::JIT(Module *M, TargetMachine &tm, TargetJITInfo &tji,
-          JITMemoryManager *JMM, CodeGenOpt::Level OptLevel, bool GVsWithCode)
-   : ExecutionEngine(M), TM(tm), TJI(tji), AllocateGVsWithCode(GVsWithCode),
-Index: llvm-2.8/lib/Target/ARM/ARMISelLowering.cpp
-===================================================================
---- llvm-2.8.orig/lib/Target/ARM/ARMISelLowering.cpp	2010-09-03 03:35:08.000000000 +0200
-+++ llvm-2.8/lib/Target/ARM/ARMISelLowering.cpp	2011-12-19 21:16:21.884288536 +0100
-@@ -1119,6 +1119,9 @@
-   }
- }
- 
-+extern "C" void *getPointerToNamedFunctionOrNull(const char *Name);
-+extern "C" void *getPointerToGlobalIfAvailable(GlobalValue *Value);
-+
- /// LowerCall - Lowering a call into a callseq_start <-
- /// ARMISD:CALL <- callseq_end chain. Also add input and output parameter
- /// nodes.
-@@ -1272,6 +1275,26 @@
-     InFlag =SDValue();
-   }
- 
-+  EVT PtrVT = DAG.getTargetLoweringInfo().getPointerTy();
-+
-+  // XXX Work around for http://llvm.org/bugs/show_bug.cgi?id=5201
-+  // and http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=399
-+  // for Shark.
-+  //
-+  // If the callee is an ExternalSymbol node, and the symbol can be
-+  // resolved to a function pointer, then insert that pointer as a
-+  // constant.  This causes the next block of code to fall into the
-+  // block that emits an indirect call.  This works around
-+  //
-+  // This works for Shark because the only kinds of call that Shark
-+  // makes that do not already fall into the indirect call block are
-+  // calls to pre-existing external functions.
-+  if (ExternalSymbolSDNode *S = dyn_cast<ExternalSymbolSDNode>(Callee)) {
-+    void *FuncPtr = getPointerToNamedFunctionOrNull(S->getSymbol());
-+    if (FuncPtr)
-+      Callee = DAG.getConstant((uint64_t) FuncPtr, PtrVT);
-+  }
-+
-   // If the callee is a GlobalAddress/ExternalSymbol node (quite common, every
-   // direct call is) turn it into a TargetGlobalAddress/TargetExternalSymbol
-   // node so that legalize doesn't hack it.
-Index: llvm-2.8/tools/llc/CMakeLists.txt
-===================================================================
---- llvm-2.8.orig/tools/llc/CMakeLists.txt	2009-09-03 00:45:31.000000000 +0200
-+++ llvm-2.8/tools/llc/CMakeLists.txt	2011-12-19 21:16:21.884288536 +0100
-@@ -1,4 +1,4 @@
--set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD} bitreader asmparser)
-+set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD} jit bitreader asmparser)
- 
- add_llvm_tool(llc
-   llc.cpp
diff --git a/meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch b/meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch
deleted file mode 100644
index 1c51b30..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp
-===================================================================
---- llvm-2.8.orig/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-14 18:31:21.008318473 +0200
-+++ llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-14 18:32:53.523734850 +0200
-@@ -19,6 +19,7 @@
- #include "llvm/Support/ErrorHandling.h"
- #include "llvm/System/DynamicLibrary.h"
- #include "llvm/Config/config.h"
-+#include <unistd.h>
- using namespace llvm;
- 
- // AtExitHandlers - List of functions to call when the program exits,
diff --git a/meta-oe/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch b/meta-oe/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
deleted file mode 100644
index fddc674..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: llvm-2.8/tools/CMakeLists.txt
-===================================================================
---- llvm-2.8.orig/tools/CMakeLists.txt	2010-08-24 11:16:51.000000000 +0200
-+++ llvm-2.8/tools/CMakeLists.txt	2011-12-21 16:47:47.718508763 +0100
-@@ -14,7 +14,6 @@
- add_subdirectory(opt)
- add_subdirectory(llvm-as)
- add_subdirectory(llvm-dis)
--add_subdirectory(llvm-mc)
- 
- add_subdirectory(llc)
- add_subdirectory(llvm-ranlib)
diff --git a/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb b/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb
deleted file mode 100644
index 4d0b3c8..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require llvm.inc
-require llvm2.inc
-
-PR = "r3"
-
-SRC_URI += " \
-            file://30may-llvm2.8-pr399-ppc-arm.patch \
-            file://0019-issue6065.patch \
-            file://add-unistd.patch \
-            file://llvm-mc_disable.patch \
-"
-
-EXTRA_OECMAKE += " -DBUILD_SHARED_LIBS:BOOL=OFF "
-
-SRC_URI[md5sum] = "220d361b4d17051ff4bb21c64abe05ba"
-SRC_URI[sha256sum] = "25addb742f1c6cc12877ed0ee924dda962d848368ee095be8e48342ae613d43b"
diff --git a/meta-oe/recipes-core/llvm/llvm2.9/0019-issue6065.patch b/meta-oe/recipes-core/llvm/llvm2.9/0019-issue6065.patch
deleted file mode 100644
index aff3d1d..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.9/0019-issue6065.patch
+++ /dev/null
@@ -1,35 +0,0 @@
---- llvm-2.9.orig/lib/Target/ARM/ARMJITInfo.cpp	2013-04-19 14:49:28.063566919 +0200
-+++ llvm-2.9/lib/Target/ARM/ARMJITInfo.cpp	2013-04-19 15:24:31.065435029 +0200
-@@ -59,7 +59,17 @@
-     // for the real target function right now. We have to act as if this
-     // whole compilation callback doesn't exist as far as the caller is
-     // concerned, so we can't just preserve the callee saved regs.
-+    // stmdb introduced in http://llvm.org/viewvc/llvm-project/llvm/trunk/lib/Target/ARM/ARMJITInfo.cpp?diff_format=h&r1=57911&r2=57910&pathrev=57911
-+    // but fails on armv4t
-+    // | {standard input}: Assembler messages:
-+    // | {standard input}:22: Error: selected processor does not support Thumb mode `stmdb sp!,{r0,r1,r2,r3,lr}'
-+    // | {standard input}:31: Error: lo register required -- `ldmia sp!,{r0,r1,r2,r3,lr}'
-+    // | {standard input}:32: Error: lo register required -- `ldr pc,[sp],#4'
-+#ifndef __thumb__
-     "stmdb sp!, {r0, r1, r2, r3, lr}\n"
-+#else
-+    "push {r0, r1, r2, r3, lr}\n"
-+#endif
- #if (defined(__VFP_FP__) && !defined(__SOFTFP__))
-     "fstmfdd sp!, {d0, d1, d2, d3, d4, d5, d6, d7}\n"
- #endif
-@@ -99,8 +109,14 @@
-     // The above twiddling of the saved return addresses allows us to
-     // deallocate everything, including the LR the stub saved, with two
-     // updating load instructions.
-+#ifndef __thumb__
-     "ldmia  sp!, {r0, r1, r2, r3, lr}\n"
-     "ldr    pc, [sp], #4\n"
-+#else
-+    // thumb dont allow lr and pc to be poped in the same instruction.
-+    "pop {r0, r1, r2, r3, lr}\n"
-+    "pop {pc}\n"
-+#endif
-       );
- #else  // Not an ARM host
-   void ARMCompilationCallback() {
diff --git a/meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch b/meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch
deleted file mode 100644
index 4cf8d44..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Imported from http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=673266
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- a/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-17 16:11:46.956180361 +0200
-+++ b/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-17 16:14:35.256184996 +0200
-@@ -52,6 +52,7 @@
- #include <sys/stat.h>
- #endif
- #include <fcntl.h>
-+#include <unistd.h>
- /* stat functions are redirecting to __xstat with a version number.  On x86-64 
-  * linking with libc_nonshared.a and -Wl,--export-dynamic doesn't make 'stat' 
-  * available as an exported symbol, so we have to add it explicitly.
diff --git a/meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch b/meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
deleted file mode 100644
index c3ae494..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: llvm-2.9/include/llvm/Support/FEnv.h
-===================================================================
---- llvm-2.9.orig/include/llvm/Support/FEnv.h	2010-11-29 20:44:50.000000000 +0100
-+++ llvm-2.9/include/llvm/Support/FEnv.h	2011-11-18 18:42:22.580161297 +0100
-@@ -17,6 +17,9 @@
- 
- #include "llvm/Config/config.h"
- #include <cerrno>
-+
-+#undef HAVE_FENV_H
-+
- #ifdef HAVE_FENV_H
- #include <fenv.h>
- #endif
diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
deleted file mode 100644
index 44504b8..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require llvm.inc
-require llvm2.inc
-
-PR = "r3"
-
-SRC_URI += "file://0035-gcc-4.7.patch"
-
-ARM_INSTRUCTION_SET = "arm"
-
-# 0019-issue6065.patch is still needed but a bit modified, because it was resolved by
-# http://llvm.org/viewvc/llvm-project/llvm/trunk/lib/Target/ARM/ARMJITInfo.cpp?r1=120304&r2=124694&pathrev=124694
-# http://llvm.org/viewvc/llvm-project/llvm/trunk/lib/Target/ARM/ARMJITInfo.cpp?diff_format=h&r1=57911&r2=57910&pathrev=57911
-# and still it fails with 
-# {standard input}:31: Error: invalid register list to push/pop instruction -- `pop {r0,r1,r2,r3,lr}'
-# make[2]: *** [lib/Target/ARM/CMakeFiles/LLVMARMCodeGen.dir/ARMJITInfo.cpp.o] Error 1
-# SRC_URI += "file://0019-issue6065.patch"
-
-SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
-
-SRC_URI[md5sum] = "793138412d2af2c7c7f54615f8943771"
-SRC_URI[sha256sum] = "661236cfa17428b48cfa9cbb9909f7569c64b8ecd219fd91dbc00e3b557b3779"
diff --git a/meta-oe/recipes-core/llvm/llvm2.inc b/meta-oe/recipes-core/llvm/llvm2.inc
deleted file mode 100644
index a1f6ce8..0000000
--- a/meta-oe/recipes-core/llvm/llvm2.inc
+++ /dev/null
@@ -1,170 +0,0 @@
-DEPENDS = "llvm${LLVM_RELEASE}-native llvm-common perl-native"
-DEPENDS_class-native = "llvm-common-native cmake-native"
-
-SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.tgz"
-S = "${WORKDIR}/llvm-${PV}"
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0ac5f799a2d89477c75b0a378b221855"
-
-inherit cmake
-
-# Defines the LLVM supported arches. By now we always build either for ${BUILD}
-# (native) or ${TARGET}. In the future it may make sense to enable all backends
-# for the non-native build. The decision which backends are used is made by
-# the 3rd party program or library that uses llvm anyway.
-LLVM_ARCH = "${@get_llvm_arch(d)}"
-
-# This is used for generating the install directory for the llvm libraries,
-# binaries and headers. It makes side by side installation of those possible.
-LLVM_RELEASE = "${PV}"
-
-BBCLASSEXTEND = "native"
-
-LLVM_INSTALL_DIR = "${B}/llvm-install"
-
-# other architectures require X86 available,
-LLVM_EXTRA_ARCH = "X86;"
-LLVM_EXTRA_ARCH_x86 = ""
-LLVM_EXTRA_ARCH_x86-64 = ""
-
-EXTRA_OECMAKE = "\
-    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/${LLVM_DIR}/tblgen \
-    -DLLVM_TARGETS_TO_BUILD="${LLVM_EXTRA_ARCH}${LLVM_ARCH}" \
-    -DCMAKE_LINKER:FILEPATH=${LD} \
-    -DCMAKE_AR:FILEPATH=${AR} \
-    -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
-    -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
-    -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
-    -DCMAKE_STRIP:FILEPATH=${STRIP} \
-    -DNM_PATH:FILEPATH=${NM} \
-    -DLLVM_ENABLE_PIC:BOOL=ON \
-    -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \
-    -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \
-    -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
-    -DBUILD_SHARED_LIBS:BOOL=ON \
-    -DCMAKE_SKIP_BUILD_RPATH:BOOL=ON \
-"
-
-# We need to reset this to avoid breakage as we build out of tree
-TOOLCHAIN_OPTIONS = ""
-
-# the difference to the non-native build is that we do not need
-# to declare the location of the tblgen executable.
-EXTRA_OECMAKE_class-native = "\
-    -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \
-    -DCMAKE_LINKER:FILEPATH=${LD} \
-    -DCMAKE_AR:FILEPATH=${AR} \
-    -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
-    -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
-    -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
-    -DCMAKE_STRIP:FILEPATH=${STRIP} \
-    -DNM_PATH:FILEPATH=${NM} \
-"
-
-base_do_compile_prepend() {
-    # Avoid *** No rule to make target `native/bin/tblgen', needed by `include/llvm/Intrinsics.gen.tmp'
-    oe_runmake tblgen
-}
-
-do_install() {
-    # Install into a private directory to be able to reorganize the files.
-    cd ${B}
-    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
-
-    # Create our custom target directories
-    install -d ${D}${bindir}/${LLVM_DIR}
-    install -d ${D}${includedir}/${LLVM_DIR}
-    install -d ${D}${libdir}/${LLVM_DIR}
-
-    # Move headers into their own directory
-    cp -R ${LLVM_INSTALL_DIR}/${prefix}/include/llvm \
-    ${D}${includedir}/${LLVM_DIR}/
-    cp -R ${LLVM_INSTALL_DIR}/${prefix}/include/llvm-c \
-    ${D}${includedir}/${LLVM_DIR}/
-
-    find ${LLVM_INSTALL_DIR}/${prefix}/lib -name "*" -maxdepth 1 -exec \
-    install {} ${D}${libdir}/${LLVM_DIR} \;
-
-    # I dont know another way out. Binaries are installed into a special subdir
-    find ${LLVM_INSTALL_DIR}/${prefix}/bin -name "*" -maxdepth 1 -exec \
-    install {} ${D}${bindir}/${LLVM_DIR} \;
-
-    # LLVM does not install this by default.
-    install bin/tblgen ${D}${bindir}/${LLVM_DIR}
-}
-
-SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-    cd ${B}
-
-    # Fix the paths in the config script to make it find the binaries and
-    # library files. Doing so allows 3rd party configure scripts working
-    # unmodified.
-    sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \
-        -e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR = "${STAGING_INCDIR}/${LLVM_DIR}";!' \
-        -e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/${LLVM_DIR}";!' \
-        -e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/${LLVM_DIR}";!' \
-        bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
-
-        install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-        install -m 0755 bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${bindir_crossscripts}
-}
-
-do_install_class-native() {
-    # Install into a private directory to be able to reorganize the files.
-    cd ${B}
-    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
-
-    # Create our custom target directories
-    install -d ${D}${bindir}/${LLVM_DIR}
-    install -d ${D}${includedir}/${LLVM_DIR}
-    install -d ${D}${libdir}/${LLVM_DIR}
-
-    # Move headers into their own directory
-    cp -R ${LLVM_INSTALL_DIR}/${prefix}/include/llvm \
-          ${D}${includedir}/${LLVM_DIR}/
-    cp -R ${LLVM_INSTALL_DIR}/${prefix}/include/llvm-c \
-          ${D}${includedir}/${LLVM_DIR}/
-
-    find ${LLVM_INSTALL_DIR}/${prefix}/lib -name "*" -maxdepth 1 -exec \
-        install {} ${D}${libdir}/${LLVM_DIR} \;
-
-    # I dont know another way out. Binaries are installed into a special subdir
-    find ${LLVM_INSTALL_DIR}/${prefix}/bin -name "*" -maxdepth 1 -exec \
-        install {} ${D}${bindir}/${LLVM_DIR} \;
-
-    # LLVM does not install this by default.
-    install bin/tblgen ${D}${bindir}/${LLVM_DIR}
-
-    # Fix the paths in the config script to make it find the binaries and
-    # library files. Doing so allows 3rd party configure scripts working
-    # unmodified.
-    sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \
-        -e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR = "${STAGING_INCDIR}/${LLVM_DIR}";!' \
-        -e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/${LLVM_DIR}";!' \
-        -e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/${LLVM_DIR}";!' \
-        bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
-
-    install -d ${D}${bindir}
-    install -m 0755 bin/llvm-config${LLVM_RELEASE} ${D}${bindir}
-}
-
-# Retrieve the target in a way that is compatible to the arch
-# value in llvm (>= 2.5)
-def get_llvm_arch(d):
-    import bb;
-
-    arch = bb.data.getVar('TARGET_ARCH', d, 1)
-    if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
-        arch = "X86"
-    elif arch == "arm":
-        arch = "ARM"
-    elif arch == "mipsel" or arch == "mips":
-        arch = "mips"
-    elif arch == "powerpc" or arch == "powerpc64":
-        arch = "PowerPC"
-    else:
-        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
-
-    return arch
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
index 65db1a8..4617efa 100644
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
@@ -1,5 +1,4 @@
 require llvm.inc
-require llvm3.inc
 
 DEPENDS += "zlib"
 EXTRA_OECONF += "--enable-zlib"
diff --git a/meta-oe/recipes-core/llvm/llvm3.inc b/meta-oe/recipes-core/llvm/llvm3.inc
deleted file mode 100644
index a5bd896..0000000
--- a/meta-oe/recipes-core/llvm/llvm3.inc
+++ /dev/null
@@ -1,80 +0,0 @@
-DEPENDS = "libffi libxml2-native llvm-common"
-
-SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
-S = "${WORKDIR}/llvm-${PV}.src"
-
-inherit autotools
-
-LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
-LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-
-EXTRA_OECONF += "--disable-assertions \
-                 --enable-debug-runtime \
-                 --disable-expensive-checks \
-                 --enable-bindings=none \
-                 --enable-keep-symbols \
-                 --enable-libffi \
-                 --enable-optimized \
-                 --enable-shared \
-                 --enable-targets=host-only"
-EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
-
-do_configure_prepend() {
-    # Remove RPATHs
-    sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' ${S}/Makefile.rules
-
-    # Drop "svn" suffix from version string
-    sed -i 's/${PV}svn/${PV}/g' ${S}/configure
-
-    # Fix paths in llvm-config
-    sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
-    sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
-
-    # Fails to build unless using separate directory from source
-    mkdir -p ${LLVM_BUILD_DIR}
-    cd ${LLVM_BUILD_DIR}
-}
-
-do_compile() {
-    cd ${LLVM_BUILD_DIR}
-    oe_runmake \
-        AR="${BUILD_AR}" \
-        CC="${BUILD_CC}" \
-        CFLAGS="${BUILD_CFLAGS}" \
-        CXX="${BUILD_CXX}" \
-        CXXFLAGS="${BUILD_CXXFLAGS}" \
-        CPP="${BUILD_CPP}" \
-        CPPFLAGS="${BUILD_CPPFLAGS}" \
-        NM="${BUILD_NM}" \
-        RANLIB="${BUILD_RANLIB}" \
-        PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
-        cross-compile-build-tools
-    oe_runmake
-}
-
-do_install() {
-    cd ${LLVM_BUILD_DIR}
-    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
-
-    mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config-host ${LLVM_INSTALL_DIR}/llvm-config-host
-
-    install -d ${D}${bindir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
-
-    install -d ${D}${includedir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
-
-    install -d ${D}${libdir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
-    ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
-
-    install -d ${D}${docdir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
-}
-
-SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-    mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
-}
-- 
2.0.4


