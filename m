Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UTAYr-0005oC-P7
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 14:37:11 +0200
Received: by mail-da0-f45.google.com with SMTP id v40so1934443dad.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 05:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=aRgxNDruktQ+GIcyMNlSoUwdO4iYqmsZ11SgcByO+Ls=;
	b=v24YGJP56v0pGe89w2Q8n483RunwaRUyls9yubbskh4NTlZmhKowU78IUJU64M5SG+
	suu8jhMntFrCPGReH0RhQjqjvSxRLw4Ee2+MW7S7SfT2lXdsxJ1or9s9/FyvjzXelZwL
	G7VNy1oLPDtH42nc8K0ywPwDFXdJQfILFt12m5f3CDCsWc9a7bs1q79CS9hXZW148SlE
	+QG+GdiQ0oD60rogsmsV/J0dcSaldWUXDp1G7rnz41xzqjRQHS/iMMbm9E2gOrlIDDJ6
	THCFIPhDH0FS7EC783/747yYOZcKWbK2AF045HFE/UO/wM8Vi47WemMJwj3uvY7QzbqM
	zaFQ==
X-Received: by 10.66.27.197 with SMTP id v5mr2296234pag.211.1366373970256;
	Fri, 19 Apr 2013 05:19:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id jw10sm13311423pbb.3.2013.04.19.05.19.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 05:19:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 14:19:27 +0200
Message-Id: <1366373967-681-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-java][PATCH] llvm: Drop from meta-java, it was moved to meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Apr 2013 12:37:15 -0000
X-List-Received-Date: Fri, 19 Apr 2013 12:37:15 -0000

---
 recipes-core/llvm/llvm-common.bb                   |  19 --
 recipes-core/llvm/llvm-common/llvm-config          |  10 -
 recipes-core/llvm/llvm.inc                         | 214 ---------------------
 recipes-core/llvm/llvm2.8/0019-issue6065.patch     |  20 --
 .../llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch | 113 -----------
 recipes-core/llvm/llvm2.8/add-unistd.patch         |  12 --
 recipes-core/llvm/llvm2.8/llvm-mc_disable.patch    |  12 --
 recipes-core/llvm/llvm2.8_2.8.bb                   |  21 --
 recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch    |  14 --
 recipes-core/llvm/llvm2.9_2.9.bb                   |  29 ---
 10 files changed, 464 deletions(-)
 delete mode 100644 recipes-core/llvm/llvm-common.bb
 delete mode 100644 recipes-core/llvm/llvm-common/llvm-config
 delete mode 100644 recipes-core/llvm/llvm.inc
 delete mode 100644 recipes-core/llvm/llvm2.8/0019-issue6065.patch
 delete mode 100644 recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch
 delete mode 100644 recipes-core/llvm/llvm2.8/add-unistd.patch
 delete mode 100644 recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
 delete mode 100644 recipes-core/llvm/llvm2.8_2.8.bb
 delete mode 100644 recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
 delete mode 100644 recipes-core/llvm/llvm2.9_2.9.bb

diff --git a/recipes-core/llvm/llvm-common.bb b/recipes-core/llvm/llvm-common.bb
deleted file mode 100644
index 38ca1ee..0000000
--- a/recipes-core/llvm/llvm-common.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Helper script for OE's llvm support"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
-                   "
-
-SRC_URI = "file://llvm-config"
-
-do_install() {
-  install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-  install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-}
-
-do_install_virtclass-native() {
-  install -d ${D}${bindir}
-  install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir}
-}
-
-BBCLASSEXTEND = "native"
diff --git a/recipes-core/llvm/llvm-common/llvm-config b/recipes-core/llvm/llvm-common/llvm-config
deleted file mode 100644
index a9a416d..0000000
--- a/recipes-core/llvm/llvm-common/llvm-config
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-# Wrapper script for real llvm-config. Simply calls
-
-if [ $WANT_LLVM_RELEASE ]; then
-	exec `dirname $0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE ${@}
-else
-  echo "The variable WANT_LLVM_RELEASE is not defined and exported"
-	echo "by your build recipe. Go figure."
-  exit 1
-fi
diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
deleted file mode 100644
index 1fbb0ef..0000000
--- a/recipes-core/llvm/llvm.inc
+++ /dev/null
@@ -1,214 +0,0 @@
-# LLVM does not provide ABI stability between different versions. For this
-# reason OE makes it possible to build and install different llvm versions
-# at the same time.
-#
-# This is true for the normal recipes as well as the native ones.
-#
-# All regular installation directories are prefixed with 'llvm${LLVM_RELEASE}'
-# e.g. "${STAGING_BINDIR}/llvm2.5" or "${STAGING_INCDIR}/llvm2.5"
-#
-# For your program or library that makes use of llvm you do should not need to
-# modify anything as long as it uses the results of various llvm-config
-# invocations. If you need customizations something is wrong and it needs to be
-# fixed (report bug).
-#
-# However the *recipe* for your program/library *must* declare
-# export WANT_LLVM_RELEASE = "<valid version number>"
-# The version number is picked up by a generic wrapper script which just calls
-# the variant of the specified version.
-
-DESCRIPTION = "The Low Level Virtual Machine"
-HOMEPAGE = "http://llvm.org"
-# 3-clause BSD-like
-LICENSE = "NCSA"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0ac5f799a2d89477c75b0a378b221855"
-
-DEPENDS = "llvm${LLVM_RELEASE}-native llvm-common"
-DEPENDS_virtclass-native = "llvm-common-native cmake-native"
-
-INC_PR = "r2"
-
-SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.tgz"
-
-S = "${WORKDIR}/llvm-${PV}"
-
-inherit cmake perlnative pythonnative
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
-# llvm *must* be built out of tree
-OECMAKE_SOURCEPATH = ".."
-OECMAKE_BUILDPATH = "build"
-EXTRA_OECMAKE = "\
-  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \
-  -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \
-  -DCMAKE_LINKER:FILEPATH=${LD} \
-  -DCMAKE_AR:FILEPATH=${AR} \
-  -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
-  -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
-  -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
-  -DCMAKE_STRIP:FILEPATH=${STRIP} \
-  -DNM_PATH:FILEPATH=${NM} \
-  -DLLVM_ENABLE_PIC:BOOL=ON \
-  -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \
-  -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \
-  -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
-  -DBUILD_SHARED_LIBS:BOOL=ON \
-"
-# We need to reset this to avoid breakage as we build out of tree
-TOOLCHAIN_OPTIONS = ""
-
-PACKAGES_DYNAMIC = "llvm-*"
-
-# the difference to the non-native build is that we do not need
-# to declare the location of the tblgen executable.
-EXTRA_OECMAKE_virtclass-native = "\
-  -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \
-  -DCMAKE_LINKER:FILEPATH=${LD} \
-  -DCMAKE_AR:FILEPATH=${AR} \
-  -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
-  -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
-  -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
-  -DCMAKE_STRIP:FILEPATH=${STRIP} \
-  -DNM_PATH:FILEPATH=${NM} \
-"
-
-PACKAGES_virtclass-native = ""
-
-PACKAGES_DYNAMIC_virtclass-native = ""
-
-python populate_packages_prepend () {
-    libllvm_libdir = bb.data.expand('${libdir}/llvm${LLVM_RELEASE}', d)
-    do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', 'libllvm-%s', 'Split package for %s', allow_dirs=True)
-}
-
-FILES_${PN} = ""
-ALLOW_EMPTY_${PN} = "1"
-
-FILES_${PN}-dbg += "${libdir}/llvm${LLVM_RELEASE}/.debug ${bindir}/llvm${LLVM_RELEASE}/.debug"
-
-FILES_${PN}-dev = " \
-                   ${includedir} \
-                   ${bindir}/* \
-                   ${libdir}/llvm${LLVM_RELEASE}/LLVMHello.so \
-                   ${libdir}/llvm${LLVM_RELEASE}/BugpointPasses.so \
-                   ${libdir}/llvm${LLVM_RELEASE}/*.a \
-                 "
-
-do_install() {
-    # Install into a private directory to be able to reorganize the files.
-
-    cd ${OECMAKE_BUILDPATH}
-
-    oe_runmake DESTDIR=${WORKDIR}/llvm-install install
-
-    # Create our custom target directories
-    install -d ${D}${bindir}/llvm${LLVM_RELEASE}
-    install -d ${D}${includedir}/llvm${LLVM_RELEASE}
-    install -d ${D}${libdir}/llvm${LLVM_RELEASE}
-
-    #	Move headers into their own directory
-    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \
-    ${D}${includedir}/llvm${LLVM_RELEASE}/
-    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
-    ${D}${includedir}/llvm${LLVM_RELEASE}/
-
-    find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \
-    install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
-
-	#	I dont know another way out. Binaries are installed into a special subdir
-	find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \
-	install {} ${D}${bindir}/llvm${LLVM_RELEASE} \;
-
-	# LLVM does not install this by default.
-	install bin/tblgen ${D}${bindir}/llvm${LLVM_RELEASE}
-
-        # we install it here unmodified for native and none native and overwrite it
-        # later for native case
-        install -d ${D}${bindir}
-        install -m 0755 bin/llvm-config ${D}${bindir}
-
-	# Fix the paths in the config script to make it find the binaries and
-	# library files. Doing so allows 3rd party configure scripts working
-	# unmodified.
-	sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \
-		-e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR = "${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \
-		-e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!' \
-		-e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \
-		bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
-
-        install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-        install -m 0755 bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${bindir_crossscripts}
-}
-
-do_install_virtclass-native() {
-	# Install into a private directory to be able to reorganize the files.
-
-        cd ${OECMAKE_BUILDPATH}
-
-        oe_runmake DESTDIR=${WORKDIR}/llvm-install install
-
-	# Create our custom target directories
-	install -d ${D}${bindir}/llvm${LLVM_RELEASE}
-	install -d ${D}${includedir}/llvm${LLVM_RELEASE}
-	install -d ${D}${libdir}/llvm${LLVM_RELEASE}
-
-	#	Move headers into their own directory
-	cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \
-	${D}${includedir}/llvm${LLVM_RELEASE}/
-	cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
-	${D}${includedir}/llvm${LLVM_RELEASE}/
-
-	find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \
-	install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
-
-	#	I dont know another way out. Binaries are installed into a special subdir
-	find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \
-	install {} ${D}${bindir}/llvm${LLVM_RELEASE} \;
-
-	# LLVM does not install this by default.
-	install bin/tblgen ${D}${bindir}/llvm${LLVM_RELEASE}
-
-	# Fix the paths in the config script to make it find the binaries and
-	# library files. Doing so allows 3rd party configure scripts working
-	# unmodified.
-	sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \
-		-e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR = "${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \
-		-e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!' \
-		-e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \
-		bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
-
-        install -d ${D}${bindir}
-        install -m 0755 bin/llvm-config${LLVM_RELEASE} ${D}${bindir}
-}
-
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
-
-BBCLASSEXTEND = "native"
-
diff --git a/recipes-core/llvm/llvm2.8/0019-issue6065.patch b/recipes-core/llvm/llvm2.8/0019-issue6065.patch
deleted file mode 100644
index a7f7bbe..0000000
--- a/recipes-core/llvm/llvm2.8/0019-issue6065.patch
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
diff --git a/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch b/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch
deleted file mode 100644
index ee5cbaf..0000000
--- a/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch
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
diff --git a/recipes-core/llvm/llvm2.8/add-unistd.patch b/recipes-core/llvm/llvm2.8/add-unistd.patch
deleted file mode 100644
index 1c51b30..0000000
--- a/recipes-core/llvm/llvm2.8/add-unistd.patch
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
diff --git a/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch b/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
deleted file mode 100644
index fddc674..0000000
--- a/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
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
diff --git a/recipes-core/llvm/llvm2.8_2.8.bb b/recipes-core/llvm/llvm2.8_2.8.bb
deleted file mode 100644
index 27ed41d..0000000
--- a/recipes-core/llvm/llvm2.8_2.8.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require llvm.inc
-
-#LICENSE = "University of Illinois/NCSA Open Source License"
-LICENSE = "NCSA"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0ac5f799a2d89477c75b0a378b221855"
-
-PR = "${INC_PR}.2"
-
-SRC_URI += " \
-            file://30may-llvm2.8-pr399-ppc-arm.patch \
-            file://0019-issue6065.patch \
-            file://add-unistd.patch \
-            file://llvm-mc_disable.patch \
-           "
-
-LLVM_RELEASE = "2.8"
-
-EXTRA_OECMAKE += " -DBUILD_SHARED_LIBS:BOOL=OFF "
-
-SRC_URI[md5sum] = "220d361b4d17051ff4bb21c64abe05ba"
-SRC_URI[sha256sum] = "25addb742f1c6cc12877ed0ee924dda962d848368ee095be8e48342ae613d43b"
diff --git a/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch b/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
deleted file mode 100644
index c3ae494..0000000
--- a/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
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
diff --git a/recipes-core/llvm/llvm2.9_2.9.bb b/recipes-core/llvm/llvm2.9_2.9.bb
deleted file mode 100644
index b956aad..0000000
--- a/recipes-core/llvm/llvm2.9_2.9.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require llvm.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
-
-PARALLEL_MAKE_virtclass-native = ""
-
-EXTRA_OECMAKE = "\
-  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \
-  -DLLVM_TARGETS_TO_BUILD="X86;${LLVM_ARCH}" \
-  -DCMAKE_LINKER:FILEPATH=${LD} \
-  -DCMAKE_AR:FILEPATH=${AR} \
-  -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
-  -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
-  -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
-  -DCMAKE_STRIP:FILEPATH=${STRIP} \
-  -DNM_PATH:FILEPATH=${NM} \
-  -DLLVM_ENABLE_PIC:BOOL=ON \
-  -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \
-  -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \
-  -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
-  -DBUILD_SHARED_LIBS:BOOL=ON \
-"
-
-LLVM_RELEASE = "2.9"
-
-SRC_URI[md5sum] = "793138412d2af2c7c7f54615f8943771"
-SRC_URI[sha256sum] = "661236cfa17428b48cfa9cbb9909f7569c64b8ecd219fd91dbc00e3b557b3779"
-- 
1.8.2.1



