Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1Odfqz-0000Uv-Ow
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 10:49:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id DEC0B40009A82;
	Tue, 27 Jul 2010 10:49:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id D61274000C4A9;
	Tue, 27 Jul 2010 10:49:19 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbexXVoHkOVM; Tue, 27 Jul 2010 10:49:19 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 5B64A40009A82;
	Tue, 27 Jul 2010 10:49:18 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1Odfqa-00007k-7v; Tue, 27 Jul 2010 10:49:12 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jul 2010 10:49:08 +0200
Message-Id: <1280220549-447-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1280220549-447-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1280220549-447-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL, BAYES_00,
	TVD_FUZZY_SYMBOL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 1/2] llvm: backport llvm2.7 from openembedded-dev
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
X-List-Received-Date: Tue, 27 Jul 2010 08:49:45 -0000

From: Henning Heinold <h.heinold@tarent.de>

---
 conf/checksums.ini                                 |    4 +
 recipes/llvm/llvm-common-native.bb                 |   12 ++
 recipes/llvm/llvm-common.bb                        |   14 ++
 recipes/llvm/llvm-common/llvm-config               |   10 +
 recipes/llvm/llvm-native.inc                       |   29 +++
 recipes/llvm/llvm.inc                              |  134 +++++++++++++-
 recipes/llvm/llvm2.7-native_2.7.bb                 |   12 ++
 recipes/llvm/llvm2.7/BX_to_BLX.patch               |   13 ++
 recipes/llvm/llvm2.7/arm_ppc.patch                 |  172 ++++++++++++++++++
 recipes/llvm/llvm2.7/r104558-VFPmisc.patch         |   58 ++++++
 recipes/llvm/llvm2.7/r104587-MOVimm32.patch        |  190 ++++++++++++++++++++
 .../llvm2.7/r104652-VFPLoadStoreMultiple.patch     |   47 +++++
 recipes/llvm/llvm2.7/r104653-BFC-BFI.patch         |   31 ++++
 recipes/llvm/llvm2.7/r97745-llvmPR6480.patch       |   75 ++++++++
 recipes/llvm/llvm2.7/rawMOVLRPC.patch              |   61 +++++++
 recipes/llvm/llvm2.7_2.7.bb                        |   47 +++++
 16 files changed, 902 insertions(+), 7 deletions(-)
 create mode 100644 recipes/llvm/llvm-common-native.bb
 create mode 100644 recipes/llvm/llvm-common.bb
 create mode 100644 recipes/llvm/llvm-common/llvm-config
 create mode 100644 recipes/llvm/llvm-native.inc
 create mode 100644 recipes/llvm/llvm2.7-native_2.7.bb
 create mode 100644 recipes/llvm/llvm2.7/BX_to_BLX.patch
 create mode 100644 recipes/llvm/llvm2.7/arm_ppc.patch
 create mode 100644 recipes/llvm/llvm2.7/r104558-VFPmisc.patch
 create mode 100644 recipes/llvm/llvm2.7/r104587-MOVimm32.patch
 create mode 100644 recipes/llvm/llvm2.7/r104652-VFPLoadStoreMultiple.patch
 create mode 100644 recipes/llvm/llvm2.7/r104653-BFC-BFI.patch
 create mode 100644 recipes/llvm/llvm2.7/r97745-llvmPR6480.patch
 create mode 100644 recipes/llvm/llvm2.7/rawMOVLRPC.patch
 create mode 100644 recipes/llvm/llvm2.7_2.7.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index d751252..8abe5b8 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -16402,6 +16402,10 @@ sha256=5fc295b3cf3de019962aee3be1c5efb49d6bf5041dae59451f6c0f544eb36bdc
 md5=55df2ea8665c8094ad2ef85187b9fc74
 sha256=8f3d69e63bc5d1ee2c2ee49ff07ccb7e070070a0e937813d2a6179b9e2e173ed
 
+[http://llvm.org/releases/2.7/llvm-2.7.tgz]
+md5=ac322661f20e7d6c810b1869f886ad9b
+sha256=99664bdc8503a306038166af33f28eb426d99e297575a59d74a1a0dcbddbbca5
+
 [http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-2.10.1.tar.gz]
 md5=cdc857b78e813b88cbf8be92441aa299
 sha256=a332cacfa9d0eed6e9158c394db714e536f38c27451d7df08b9634952118fa1b
diff --git a/recipes/llvm/llvm-common-native.bb b/recipes/llvm/llvm-common-native.bb
new file mode 100644
index 0000000..c2b79bd
--- /dev/null
+++ b/recipes/llvm/llvm-common-native.bb
@@ -0,0 +1,12 @@
+require llvm-common.bb
+
+inherit native
+
+do_install() {
+	:
+}
+
+do_stage() {
+	install -d ${STAGING_BINDIR}
+  install -m 0755 ${WORKDIR}/llvm-config ${STAGING_BINDIR}
+}
diff --git a/recipes/llvm/llvm-common.bb b/recipes/llvm/llvm-common.bb
new file mode 100644
index 0000000..b7f2bfc
--- /dev/null
+++ b/recipes/llvm/llvm-common.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Helper script for OE's llvm support"
+
+SRC_URI = "file://llvm-config"
+
+PACKAGES = ""
+
+do_install() {
+	:
+}
+
+do_stage() {
+	install -d ${STAGING_BINDIR_CROSS}
+  install -m 0755 ${WORKDIR}/llvm-config ${STAGING_BINDIR_CROSS}
+}
diff --git a/recipes/llvm/llvm-common/llvm-config b/recipes/llvm/llvm-common/llvm-config
new file mode 100644
index 0000000..5256b8c
--- /dev/null
+++ b/recipes/llvm/llvm-common/llvm-config
@@ -0,0 +1,10 @@
+#!/bin/sh
+# Wrapper script for real llvm-config. Simply calls
+
+if [ $WANT_LLVM_RELEASE ]; then
+	exec `dirname $0`/llvm-config$WANT_LLVM_RELEASE ${@}
+else
+  echo "The variable WANT_LLVM_RELEASE is not defined and exported"
+	echo "by your build recipe. Go figure."
+  exit 1
+fi
diff --git a/recipes/llvm/llvm-native.inc b/recipes/llvm/llvm-native.inc
new file mode 100644
index 0000000..15ce0b7
--- /dev/null
+++ b/recipes/llvm/llvm-native.inc
@@ -0,0 +1,29 @@
+require llvm.inc
+
+DEPENDS = "llvm-common-native cmake-native binutils-cross perl-native"
+
+inherit native
+
+# the difference to the non-native build is that we do not need
+# to declare the location of the tblgen executable.
+EXTRA_OECMAKE = "\
+  -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \
+  -DCMAKE_LINKER:FILEPATH=${LD} \
+  -DCMAKE_AR:FILEPATH=${AR} \
+  -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
+  -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
+  -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
+  -DCMAKE_STRIP:FILEPATH=${STRIP} \
+  -DNM_PATH:FILEPATH=${NM} \
+"
+
+do_stage() {
+  cd ${OECMAKE_BUILDPATH}
+
+  llvm_stage
+
+  install -d ${STAGING_BINDIR}
+  install -m 0755 bin/llvm-config${LLVM_RELEASE} ${STAGING_BINDIR}
+}
+
+
diff --git a/recipes/llvm/llvm.inc b/recipes/llvm/llvm.inc
index d9664ae..31fc72b 100644
--- a/recipes/llvm/llvm.inc
+++ b/recipes/llvm/llvm.inc
@@ -1,16 +1,136 @@
+# LLVM does not provide ABI stability between different versions. For this
+# reason OE makes it possible to build and install different llvm versions
+# at the same time.
+#
+# This is true for the normal recipes as well as the native ones.
+#
+# All regular installation directories are prefixed with 'llvm${LLVM_RELEASE}'
+# e.g. "${STAGING_BINDIR}/llvm2.5" or "${STAGING_INCDIR}/llvm2.5"
+#
+# For your program or library that makes use of llvm you do should not need to
+# modify anything as long as it uses the results of various llvm-config
+# invocations. If you need customizations something is wrong and it needs to be
+# fixed (report bug).
+#
+# However the *recipe* for your program/library *must* declare
+# export WANT_LLVM_RELEASE = "<valid version number>"
+# The version number is picked up by a generic wrapper script which just calls
+# the variant of the specified version.
+
 DESCRIPTION = "The Low Level Virtual Machine"
 HOMEPAGE = "http://llvm.org"
-LICENSE = "various"
 
-SRC_URI = "http://llvm.org/releases/1.9/llvm-${PV}.tar.gz"
+DEPENDS = "llvm-common llvm${LLVM_RELEASE}-native"
+
+# 3-clause BSD-like
+LICENSE = "University of Illinois/NCSA Open Source License"
+
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.tar.gz"
+
+S = "${WORKDIR}/llvm-${PV}"
+
+inherit cmake
+
+# Defines the LLVM supported arches. By now we always build either for ${BUILD}
+# (native) or ${TARGET}. In the future it may make sense to enable all backends
+# for the non-native build. The decision which backends are used is made by
+# the 3rd party program or library that uses llvm anyway.
+LLVM_ARCH = "${@get_llvm_arch(d)}"
+
+# This is used for generating the install directory for the llvm libraries,
+# binaries and headers. It makes side by side installation of those possible.
+LLVM_RELEASE = "${PV}"
+
+# llvm *must* be built out of tree
+OECMAKE_SOURCEPATH = ".."
+OECMAKE_BUILDPATH = "build"
+EXTRA_OECMAKE = "\
+  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \
+  -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \
+  -DCMAKE_LINKER:FILEPATH=${LD} \
+  -DCMAKE_AR:FILEPATH=${AR} \
+  -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
+  -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
+  -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
+  -DCMAKE_STRIP:FILEPATH=${STRIP} \
+  -DNM_PATH:FILEPATH=${NM} \
+  -DLLVM_ENABLE_PIC:BOOL=ON \
+"
+
+llvm_stage() {
+	# Install into a private directory to be able to reorganize the files.
+  oe_runmake DESTDIR=${WORKDIR}/llvm-install install
+
+	# Create our custom target directories
+	install -d ${STAGING_BINDIR}/llvm${LLVM_RELEASE}
+    install -d ${STAGING_INCDIR}/llvm${LLVM_RELEASE}
+	install -d ${STAGING_LIBDIR}/llvm${LLVM_RELEASE}
+
+	#	Move headers into their own directory
+	cp -r ${WORKDIR}/llvm-install/${prefix}/include/llvm \
+    ${STAGING_INCDIR}/llvm${LLVM_RELEASE}/
+	cp -r ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
+    ${STAGING_INCDIR}/llvm${LLVM_RELEASE}/
+
+	# llvm somehow forgets these
+#	find include/llvm -name "*.h" -maxdepth 1 -exec \
+#    install {} ${STAGING_INCDIR}/llvm${LLVM_RELEASE}/llvm \;
 
-inherit autotools
+	find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \
+    install {} ${STAGING_LIBDIR}/llvm${LLVM_RELEASE} \;
 
-do_configure() {
-	oe_runconf
+	#	I dont know another way out. Binaries are installed into a special subdir
+	find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \
+    install {} ${STAGING_BINDIR}/llvm${LLVM_RELEASE} \;
+
+	# LLVM does not install this by default.
+  install bin/tblgen ${STAGING_BINDIR}/llvm${LLVM_RELEASE}
+
+  # Fix the paths in the config script to make it find the binaries and
+  # library files. Doing so allows 3rd party configure scripts working
+  # unmodified.
+  sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \
+      -e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR = "${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \
+      -e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!' \
+      -e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \
+      bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
 }
 
 do_stage() {
-	autotools_stage_all
-}	
+  cd ${OECMAKE_BUILDPATH}
+
+  llvm_stage
+
+  install -d ${STAGING_BINDIR_CROSS}
+  install -m 0755 bin/llvm-config${LLVM_RELEASE} ${STAGING_BINDIR_CROSS}
+}
+
+# Retrieve the target in a way that is compatible to the arch
+# value in llvm (>= 2.5)
+def get_llvm_arch(d):
+  import bb;
 
+  arch = bb.data.getVar('TARGET_ARCH', d, 1)
+  if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
+    arch = "X86"
+  elif arch == "arm":
+    arch = "ARM"
+  elif arch == "mipsel":
+    arch = "Mips"
+  elif arch == "powerpc":
+    arch = "PowerPC"
+  else:
+    oefatal("Your target architecture is not supported by this recipe");
+
+  return arch
+
+NM = "${TARGET_PREFIX}nm"
+
+do_install_prepend() {
+          cd build
+}
+
+do_compile() {
+  cd build
+  base_do_compile
+}
diff --git a/recipes/llvm/llvm2.7-native_2.7.bb b/recipes/llvm/llvm2.7-native_2.7.bb
new file mode 100644
index 0000000..e438702
--- /dev/null
+++ b/recipes/llvm/llvm2.7-native_2.7.bb
@@ -0,0 +1,12 @@
+require llvm-native.inc
+
+PR = "r0"
+
+SRC_URI = "\
+  http://llvm.org/releases/${PV}/llvm-${PV}.tgz \
+"
+
+LLVM_RELEASE = "2.7"
+
+SRC_URI[md5sum] = "ac322661f20e7d6c810b1869f886ad9b"
+SRC_URI[sha256sum] = "99664bdc8503a306038166af33f28eb426d99e297575a59d74a1a0dcbddbbca5"
diff --git a/recipes/llvm/llvm2.7/BX_to_BLX.patch b/recipes/llvm/llvm2.7/BX_to_BLX.patch
new file mode 100644
index 0000000..2e34c62
--- /dev/null
+++ b/recipes/llvm/llvm2.7/BX_to_BLX.patch
@@ -0,0 +1,13 @@
+Index: llvm/lib/Target/ARM/ARMInstrInfo.td
+===================================================================
+--- llvm.orig/lib/Target/ARM/ARMInstrInfo.td	2010-03-08 16:07:25.000000000 +0100
++++ llvm/lib/Target/ARM/ARMInstrInfo.td	2010-03-08 16:10:21.000000000 +0100
+@@ -942,7 +942,7 @@
+                   IIC_Br, "mov\tlr, pc\n\tbx\t$func",
+                   [(ARMcall_nolink tGPR:$func)]>,
+            Requires<[IsARM, HasV4T, IsNotDarwin]> {
+-    let Inst{7-4}   = 0b0001;
++    let Inst{7-4}   = 0b0011;
+     let Inst{19-8}  = 0b111111111111;
+     let Inst{27-20} = 0b00010010;
+   }
diff --git a/recipes/llvm/llvm2.7/arm_ppc.patch b/recipes/llvm/llvm2.7/arm_ppc.patch
new file mode 100644
index 0000000..d55230d
--- /dev/null
+++ b/recipes/llvm/llvm2.7/arm_ppc.patch
@@ -0,0 +1,172 @@
+Index: llvm-2.7/lib/ExecutionEngine/JIT/JIT.cpp
+===================================================================
+--- llvm-2.7.orig/lib/ExecutionEngine/JIT/JIT.cpp	2010-02-16 12:11:14.000000000 +0100
++++ llvm-2.7/lib/ExecutionEngine/JIT/JIT.cpp	2010-07-12 11:03:03.047811849 +0200
+@@ -254,7 +254,12 @@
+     MutexGuard guard(Lock);
+     JITs.erase(jit);
+   }
+-  void *getPointerToNamedFunction(const char *Name) const {
++  bool empty() {
++    MutexGuard guard(Lock);
++    return JITs.empty();
++  }
++  void *getPointerToNamedFunction(const char *Name,
++                                  bool AbortOnFailure = true) const {
+     MutexGuard guard(Lock);
+     assert(JITs.size() != 0 && "No Jit registered");
+     //search function in every instance of JIT
+@@ -266,7 +271,19 @@
+     }
+     // The function is not available : fallback on the first created (will
+     // search in symbol of the current program/library)
+-    return (*JITs.begin())->getPointerToNamedFunction(Name);
++    return (*JITs.begin())->getPointerToNamedFunction(Name, AbortOnFailure);
++  }
++  void *getPointerToGlobalIfAvailable(GlobalValue *V) const {
++    MutexGuard guard(Lock);
++    assert(JITs.size() != 0 && "No Jit registered");
++    //search function in every instance of JIT
++    for (SmallPtrSet<JIT*, 1>::const_iterator Jit = JITs.begin(),
++           end = JITs.end();
++         Jit != end; ++Jit) {
++      if (void *Ptr = (*Jit)->getPointerToGlobalIfAvailable(V))
++	return Ptr;
++    }
++    return 0;
+   }
+ };
+ ManagedStatic<JitPool> AllJits;
+@@ -282,6 +299,22 @@
+   }
+ }
+ 
++extern "C" {
++  // getPointerToNamedFunctionOrNull - same as the above, but returns
++  // NULL instead of aborting if the function cannot be found.
++  void *getPointerToNamedFunctionOrNull(const char *Name) {
++    return !AllJits->empty() ? AllJits->getPointerToNamedFunction(Name, false) : 0;
++  }
++}
++
++extern "C" {
++  // getPointerToGlobalIfAvailable - same as the above, but for global
++  // variables, and only for those that have been codegened already.
++  void *getPointerToGlobalIfAvailable(GlobalValue *V) {
++    return !AllJits->empty() ? AllJits->getPointerToGlobalIfAvailable(V) : 0;
++  }
++}
++
+ JIT::JIT(Module *M, TargetMachine &tm, TargetJITInfo &tji,
+          JITMemoryManager *JMM, CodeGenOpt::Level OptLevel, bool GVsWithCode)
+   : ExecutionEngine(M), TM(tm), TJI(tji), AllocateGVsWithCode(GVsWithCode),
+Index: llvm-2.7/lib/Target/PowerPC/PPCISelLowering.cpp
+===================================================================
+--- llvm-2.7.orig/lib/Target/PowerPC/PPCISelLowering.cpp	2010-03-02 02:55:18.000000000 +0100
++++ llvm-2.7/lib/Target/PowerPC/PPCISelLowering.cpp	2010-07-12 11:03:03.047811849 +0200
+@@ -2450,6 +2450,9 @@
+   InFlag = Chain.getValue(1);
+ }
+ 
++extern "C" void *getPointerToNamedFunctionOrNull(const char *Name);
++extern "C" void *getPointerToGlobalIfAvailable(GlobalValue *Value);
++
+ static
+ unsigned PrepareCall(SelectionDAG &DAG, SDValue &Callee, SDValue &InFlag,
+                      SDValue &Chain, DebugLoc dl, int SPDiff, bool isTailCall,
+@@ -2462,6 +2465,29 @@
+ 
+   unsigned CallOpc = isSVR4ABI ? PPCISD::CALL_SVR4 : PPCISD::CALL_Darwin;
+ 
++  // XXX Work around for http://llvm.org/bugs/show_bug.cgi?id=5201
++  // and http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=399
++  // for Shark.
++  //
++  // If the callee is an ExternalSymbol node, and the symbol can be
++  // resolved to a function pointer, then insert that pointer as a
++  // constant.  This causes the next block of code to fall into the
++  // block that emits an indirect call.  This works around
++  //
++  // This works for Shark because the only kinds of call that Shark
++  // makes that do not already fall into the indirect call block are
++  // calls to pre-existing external functions.
++  if (ExternalSymbolSDNode *S = dyn_cast<ExternalSymbolSDNode>(Callee)) {
++    void *FuncPtr = getPointerToNamedFunctionOrNull(S->getSymbol());
++    if (FuncPtr)
++      Callee = DAG.getConstant((uint64_t) FuncPtr, PtrVT);
++  }
++  if (GlobalAddressSDNode *G = dyn_cast<GlobalAddressSDNode>(Callee)) {
++    void *FuncPtr = getPointerToGlobalIfAvailable(G->getGlobal());
++    if (FuncPtr)
++      Callee = DAG.getConstant((uint64_t) FuncPtr, PtrVT);
++  }
++
+   // If the callee is a GlobalAddress/ExternalSymbol node (quite common, every
+   // direct call is) turn it into a TargetGlobalAddress/TargetExternalSymbol
+   // node so that legalize doesn't hack it.
+Index: llvm-2.7/lib/Target/ARM/ARMISelLowering.cpp
+===================================================================
+--- llvm-2.7.orig/lib/Target/ARM/ARMISelLowering.cpp	2010-03-02 02:55:18.000000000 +0100
++++ llvm-2.7/lib/Target/ARM/ARMISelLowering.cpp	2010-07-12 11:03:03.057827385 +0200
+@@ -895,6 +895,9 @@
+   }
+ }
+ 
++extern "C" void *getPointerToNamedFunctionOrNull(const char *Name);
++extern "C" void *getPointerToGlobalIfAvailable(GlobalValue *Value);
++
+ /// LowerCall - Lowering a call into a callseq_start <-
+ /// ARMISD:CALL <- callseq_end chain. Also add input and output parameter
+ /// nodes.
+@@ -1004,6 +1007,31 @@
+     InFlag = Chain.getValue(1);
+   }
+ 
++  EVT PtrVT = DAG.getTargetLoweringInfo().getPointerTy();
++
++  // XXX Work around for http://llvm.org/bugs/show_bug.cgi?id=5201
++  // and http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=399
++  // for Shark.
++  //
++  // If the callee is an ExternalSymbol node, and the symbol can be
++  // resolved to a function pointer, then insert that pointer as a
++  // constant.  This causes the next block of code to fall into the
++  // block that emits an indirect call.  This works around
++  //
++  // This works for Shark because the only kinds of call that Shark
++  // makes that do not already fall into the indirect call block are
++  // calls to pre-existing external functions.
++  if (ExternalSymbolSDNode *S = dyn_cast<ExternalSymbolSDNode>(Callee)) {
++    void *FuncPtr = getPointerToNamedFunctionOrNull(S->getSymbol());
++    if (FuncPtr)
++      Callee = DAG.getConstant((uint64_t) FuncPtr, PtrVT);
++  }
++  if (GlobalAddressSDNode *G = dyn_cast<GlobalAddressSDNode>(Callee)) {
++    void *FuncPtr = getPointerToGlobalIfAvailable(G->getGlobal());
++    if (FuncPtr)
++      Callee = DAG.getConstant((uint64_t) FuncPtr, PtrVT);
++  }
++
+   // If the callee is a GlobalAddress/ExternalSymbol node (quite common, every
+   // direct call is) turn it into a TargetGlobalAddress/TargetExternalSymbol
+   // node so that legalize doesn't hack it.
+Index: llvm-2.7/tools/llc/CMakeLists.txt
+===================================================================
+--- llvm-2.7.orig/tools/llc/CMakeLists.txt	2009-09-03 00:45:31.000000000 +0200
++++ llvm-2.7/tools/llc/CMakeLists.txt	2010-07-12 11:03:03.057827385 +0200
+@@ -1,4 +1,4 @@
+-set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD} bitreader asmparser)
++set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD} jit bitreader asmparser)
+ 
+ add_llvm_tool(llc
+   llc.cpp
+Index: llvm-2.7/tools/llvm-mc/CMakeLists.txt
+===================================================================
+--- llvm-2.7.orig/tools/llvm-mc/CMakeLists.txt	2010-07-12 11:07:09.417811782 +0200
++++ llvm-2.7/tools/llvm-mc/CMakeLists.txt	2010-07-12 11:07:19.866561599 +0200
+@@ -1,4 +1,4 @@
+-set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD} support MC MCParser)
++set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD} jit support MC MCParser)
+ 
+ add_llvm_tool(llvm-mc
+   llvm-mc.cpp
diff --git a/recipes/llvm/llvm2.7/r104558-VFPmisc.patch b/recipes/llvm/llvm2.7/r104558-VFPmisc.patch
new file mode 100644
index 0000000..471ff71
--- /dev/null
+++ b/recipes/llvm/llvm2.7/r104558-VFPmisc.patch
@@ -0,0 +1,58 @@
+--- llvm/lib/Target/ARM/ARMCodeEmitter.cpp	2010/05/25 08:42:45	104587
++++ llvm/lib/Target/ARM/ARMCodeEmitter.cpp	2010/05/25 10:23:52	104588
+@@ -1465,12 +1465,55 @@
+ }
+ 
+ void ARMCodeEmitter::emitMiscInstruction(const MachineInstr &MI) {
++  unsigned Opcode = MI.getDesc().Opcode;
+   // Part of binary is determined by TableGn.
+   unsigned Binary = getBinaryCodeForInstr(MI);
+ 
+   // Set the conditional execution predicate
+   Binary |= II->getPredicate(&MI) << ARMII::CondShift;
+ 
++  switch(Opcode) {
++  default:
++    llvm_unreachable("ARMCodeEmitter::emitMiscInstruction");
++
++  case ARM::FMSTAT:
++    // No further encoding needed.
++    break;
++
++  case ARM::VMRS:
++  case ARM::VMSR: {
++    const MachineOperand &MO0 = MI.getOperand(0);
++    // Encode Rt.
++    Binary |= ARMRegisterInfo::getRegisterNumbering(MO0.getReg())
++                << ARMII::RegRdShift;
++    break;
++  }
++
++  case ARM::FCONSTD:
++  case ARM::FCONSTS: {
++    // Encode Dd / Sd.
++    Binary |= encodeVFPRd(MI, 0);
++
++    // Encode imm., Table A7-18 VFP modified immediate constants
++    const MachineOperand &MO1 = MI.getOperand(1);
++    unsigned Imm = static_cast<unsigned>(MO1.getFPImm()->getValueAPF()
++                      .bitcastToAPInt().getHiBits(32).getLimitedValue());
++    unsigned ModifiedImm;
++
++    if(Opcode == ARM::FCONSTS)
++      ModifiedImm = (Imm & 0x80000000) >> 24 | // a
++                    (Imm & 0x03F80000) >> 19;  // bcdefgh
++    else // Opcode == ARM::FCONSTD
++      ModifiedImm = (Imm & 0x80000000) >> 24 | // a
++                    (Imm & 0x007F0000) >> 16;  // bcdefgh
++
++    // Insts{19-16} = abcd, Insts{3-0} = efgh
++    Binary |= ((ModifiedImm & 0xF0) >> 4) << 16;
++    Binary |= (ModifiedImm & 0xF);
++    break;
++  }
++  }
++
+   emitWordLE(Binary);
+ }
+ 
diff --git a/recipes/llvm/llvm2.7/r104587-MOVimm32.patch b/recipes/llvm/llvm2.7/r104587-MOVimm32.patch
new file mode 100644
index 0000000..76cbfe8
--- /dev/null
+++ b/recipes/llvm/llvm2.7/r104587-MOVimm32.patch
@@ -0,0 +1,190 @@
+Index: llvm2.7/lib/Target/ARM/ARMJITInfo.cpp
+===================================================================
+--- llvm2.7.org/lib/Target/ARM/ARMJITInfo.cpp	(revision 104586)
++++ llvm2.7/lib/Target/ARM/ARMJITInfo.cpp	(revision 104587)
+@@ -318,6 +318,18 @@
+       *((intptr_t*)RelocPos) |= ResultPtr;
+       break;
+     }
++    case ARM::reloc_arm_movw: {
++      ResultPtr = ResultPtr & 0xFFFF; 
++      *((intptr_t*)RelocPos) |= ResultPtr & 0xFFF;
++      *((intptr_t*)RelocPos) |= ((ResultPtr >> 12) & 0xF) << 16;
++      break;
+     }
++    case ARM::reloc_arm_movt: {
++      ResultPtr = (ResultPtr >> 16) & 0xFFFF; 
++      *((intptr_t*)RelocPos) |= ResultPtr & 0xFFF;
++      *((intptr_t*)RelocPos) |= ((ResultPtr >> 12) & 0xF) << 16;
++      break;
++    }
++    }
+   }
+ }
+Index: llvm2.7/lib/Target/ARM/ARMCodeEmitter.cpp
+===================================================================
+--- llvm2.7.org/lib/Target/ARM/ARMCodeEmitter.cpp	(revision 104586)
++++ llvm2.7/lib/Target/ARM/ARMCodeEmitter.cpp	(revision 104587)
+@@ -88,6 +88,7 @@
+     void emitWordLE(unsigned Binary);
+     void emitDWordLE(uint64_t Binary);
+     void emitConstPoolInstruction(const MachineInstr &MI);
++    void emitMOVi32immInstruction(const MachineInstr &MI);
+     void emitMOVi2piecesInstruction(const MachineInstr &MI);
+     void emitLEApcrelJTInstruction(const MachineInstr &MI);
+     void emitPseudoMoveInstruction(const MachineInstr &MI);
+@@ -145,6 +146,15 @@
+       return getMachineOpValue(MI, MI.getOperand(OpIdx));
+     }
+ 
++    /// getMovi32Value - Return binary encoding of operand for movw/movt. If the 
++    /// machine operand requires relocation, record the relocation and return zero.
++    unsigned getMovi32Value(const MachineInstr &MI,const MachineOperand &MO, 
++                            unsigned Reloc);
++    unsigned getMovi32Value(const MachineInstr &MI, unsigned OpIdx, 
++                            unsigned Reloc) {
++      return getMovi32Value(MI, MI.getOperand(OpIdx), Reloc);
++    }
++
+     /// getShiftOp - Return the shift opcode (bit[6:5]) of the immediate value.
+     ///
+     unsigned getShiftOp(unsigned Imm) const ;
+@@ -217,6 +227,31 @@
+   return 0;
+ }
+ 
++/// getMovi32Value - Return binary encoding of operand for movw/movt. If the 
++/// machine operand requires relocation, record the relocation and return zero.
++unsigned ARMCodeEmitter::getMovi32Value(const MachineInstr &MI,
++                                        const MachineOperand &MO, 
++                                        unsigned Reloc) {
++  assert(((Reloc == ARM::reloc_arm_movt) || (Reloc == ARM::reloc_arm_movw)) 
++      && "Relocation to this function should be for movt or movw");
++
++  if (MO.isImm())
++    return static_cast<unsigned>(MO.getImm());
++  else if (MO.isGlobal())
++    emitGlobalAddress(MO.getGlobal(), Reloc, true, false);
++  else if (MO.isSymbol())
++    emitExternalSymbolAddress(MO.getSymbolName(), Reloc);
++  else if (MO.isMBB())
++    emitMachineBasicBlock(MO.getMBB(), Reloc);
++  else {
++#ifndef NDEBUG
++    errs() << MO;
++#endif
++    llvm_unreachable("Unsupported operand type for movw/movt");
++  }
++  return 0;
++}
++
+ /// getMachineOpValue - Return binary encoding of operand. If the machine
+ /// operand requires relocation, record the relocation and return zero.
+ unsigned ARMCodeEmitter::getMachineOpValue(const MachineInstr &MI,
+@@ -438,6 +473,42 @@
+   }
+ }
+ 
++void ARMCodeEmitter::emitMOVi32immInstruction(const MachineInstr &MI) {
++  const MachineOperand &MO0 = MI.getOperand(0);
++  const MachineOperand &MO1 = MI.getOperand(1);
++
++  // Emit the 'movw' instruction.
++  unsigned Binary = 0x30 << 20;  // mov: Insts{27-20} = 0b00110000
++
++  unsigned Lo16 = getMovi32Value(MI, MO1, ARM::reloc_arm_movw) & 0xFFFF;
++
++  // Set the conditional execution predicate.
++  Binary |= II->getPredicate(&MI) << ARMII::CondShift;
++
++  // Encode Rd.
++  Binary |= getMachineOpValue(MI, MO0) << ARMII::RegRdShift;
++
++  // Encode imm16 as imm4:imm12
++  Binary |= Lo16 & 0xFFF; // Insts{11-0} = imm12
++  Binary |= ((Lo16 >> 12) & 0xF) << 16; // Insts{19-16} = imm4
++  emitWordLE(Binary);
++
++  unsigned Hi16 = getMovi32Value(MI, MO1, ARM::reloc_arm_movt) >> 16;
++  // Emit the 'movt' instruction.
++  Binary = 0x34 << 20; // movt: Insts{27-20} = 0b00110100
++
++  // Set the conditional execution predicate.
++  Binary |= II->getPredicate(&MI) << ARMII::CondShift;
++
++  // Encode Rd.
++  Binary |= getMachineOpValue(MI, MO0) << ARMII::RegRdShift;
++
++  // Encode imm16 as imm4:imm1, same as movw above.
++  Binary |= Hi16 & 0xFFF;
++  Binary |= ((Hi16 >> 12) & 0xF) << 16;
++  emitWordLE(Binary);
++}
++
+ void ARMCodeEmitter::emitMOVi2piecesInstruction(const MachineInstr &MI) {
+   const MachineOperand &MO0 = MI.getOperand(0);
+   const MachineOperand &MO1 = MI.getOperand(1);
+@@ -557,7 +628,6 @@
+   switch (Opcode) {
+   default:
+     llvm_unreachable("ARMCodeEmitter::emitPseudoInstruction");
+-  // FIXME: Add support for MOVimm32.
+   case TargetOpcode::INLINEASM: {
+     // We allow inline assembler nodes with empty bodies - they can
+     // implicitly define registers, which is ok for JIT.
+@@ -604,6 +674,11 @@
+     emitMiscLoadStoreInstruction(MI, ARM::PC);
+     break;
+   }
++
++  case ARM::MOVi32imm:
++    emitMOVi32immInstruction(MI);
++    break;
++
+   case ARM::MOVi2pieces:
+     // Two instructions to materialize a constant.
+     emitMOVi2piecesInstruction(MI);
+@@ -729,6 +804,24 @@
+     Binary |= (ARMRegisterInfo::getRegisterNumbering(ImplicitRd)
+                << ARMII::RegRdShift);
+ 
++  if (TID.Opcode == ARM::MOVi16) {
++      // Get immediate from MI.
++      unsigned Lo16 = getMovi32Value(MI, MI.getOperand(OpIdx),
++                      ARM::reloc_arm_movw);
++      // Encode imm which is the same as in emitMOVi32immInstruction().
++      Binary |= Lo16 & 0xFFF;
++      Binary |= ((Lo16 >> 12) & 0xF) << 16;
++      emitWordLE(Binary);
++      return;
++  } else if(TID.Opcode == ARM::MOVTi16) {
++      unsigned Hi16 = (getMovi32Value(MI, MI.getOperand(OpIdx),
++                       ARM::reloc_arm_movt) >> 16);
++      Binary |= Hi16 & 0xFFF;
++      Binary |= ((Hi16 >> 12) & 0xF) << 16;
++      emitWordLE(Binary);
++      return;
++  }
++
+   // If this is a two-address operand, skip it. e.g. MOVCCr operand 1.
+   if (TID.getOperandConstraint(OpIdx, TOI::TIED_TO) != -1)
+     ++OpIdx;
+Index: llvm2.7/lib/Target/ARM/ARMRelocations.h
+===================================================================
+--- llvm2.7.org/lib/Target/ARM/ARMRelocations.h	(revision 104586)
++++ llvm2.7/lib/Target/ARM/ARMRelocations.h	(revision 104587)
+@@ -47,7 +47,13 @@
+       reloc_arm_pic_jt,
+ 
+       // reloc_arm_branch - Branch address relocation.
+-      reloc_arm_branch
++      reloc_arm_branch,
++
++      // reloc_arm_movt  - MOVT immediate relocation.
++      reloc_arm_movt,
++
++      // reloc_arm_movw  - MOVW immediate relocation.
++      reloc_arm_movw
+     };
+   }
+ }
diff --git a/recipes/llvm/llvm2.7/r104652-VFPLoadStoreMultiple.patch b/recipes/llvm/llvm2.7/r104652-VFPLoadStoreMultiple.patch
new file mode 100644
index 0000000..6797925
--- /dev/null
+++ b/recipes/llvm/llvm2.7/r104652-VFPLoadStoreMultiple.patch
@@ -0,0 +1,47 @@
+--- llvm/lib/Target/ARM/ARMCodeEmitter.cpp	2010/05/25 10:23:52	104588
++++ llvm/lib/Target/ARM/ARMCodeEmitter.cpp	2010/05/26 00:02:28	104652
+@@ -146,11 +146,11 @@
+       return getMachineOpValue(MI, MI.getOperand(OpIdx));
+     }
+ 
+-    /// getMovi32Value - Return binary encoding of operand for movw/movt. If the 
++    /// getMovi32Value - Return binary encoding of operand for movw/movt. If the
+     /// machine operand requires relocation, record the relocation and return zero.
+-    unsigned getMovi32Value(const MachineInstr &MI,const MachineOperand &MO, 
++    unsigned getMovi32Value(const MachineInstr &MI,const MachineOperand &MO,
+                             unsigned Reloc);
+-    unsigned getMovi32Value(const MachineInstr &MI, unsigned OpIdx, 
++    unsigned getMovi32Value(const MachineInstr &MI, unsigned OpIdx,
+                             unsigned Reloc) {
+       return getMovi32Value(MI, MI.getOperand(OpIdx), Reloc);
+     }
+@@ -227,12 +227,12 @@
+   return 0;
+ }
+ 
+-/// getMovi32Value - Return binary encoding of operand for movw/movt. If the 
++/// getMovi32Value - Return binary encoding of operand for movw/movt. If the
+ /// machine operand requires relocation, record the relocation and return zero.
+ unsigned ARMCodeEmitter::getMovi32Value(const MachineInstr &MI,
+-                                        const MachineOperand &MO, 
++                                        const MachineOperand &MO,
+                                         unsigned Reloc) {
+-  assert(((Reloc == ARM::reloc_arm_movt) || (Reloc == ARM::reloc_arm_movw)) 
++  assert(((Reloc == ARM::reloc_arm_movt) || (Reloc == ARM::reloc_arm_movw))
+       && "Relocation to this function should be for movt or movw");
+ 
+   if (MO.isImm())
+@@ -1459,7 +1459,12 @@
+       break;
+     ++NumRegs;
+   }
+-  Binary |= NumRegs * 2;
++  // Bit 8 will be set if <list> is consecutive 64-bit registers (e.g., D0)
++  // Otherwise, it will be 0, in the case of 32-bit registers.
++  if(Binary & 0x100)
++    Binary |= NumRegs * 2;
++  else
++    Binary |= NumRegs;
+ 
+   emitWordLE(Binary);
+ }
diff --git a/recipes/llvm/llvm2.7/r104653-BFC-BFI.patch b/recipes/llvm/llvm2.7/r104653-BFC-BFI.patch
new file mode 100644
index 0000000..763d4b4
--- /dev/null
+++ b/recipes/llvm/llvm2.7/r104653-BFC-BFI.patch
@@ -0,0 +1,31 @@
+Index: llvm-2.7/lib/Target/ARM/ARMCodeEmitter.cpp
+===================================================================
+--- llvm-2.7.orig/lib/Target/ARM/ARMCodeEmitter.cpp	2010-07-21 12:28:57.000000000 +0200
++++ llvm-2.7/lib/Target/ARM/ARMCodeEmitter.cpp	2010-07-21 12:36:04.000000000 +0200
+@@ -778,10 +778,6 @@
+                                                    unsigned ImplicitRn) {
+   const TargetInstrDesc &TID = MI.getDesc();
+ 
+-  if (TID.Opcode == ARM::BFC) {
+-    llvm_report_error("ARMv6t2 JIT is not yet supported.");
+-  }
+-
+   // Part of binary is determined by TableGn.
+   unsigned Binary = getBinaryCodeForInstr(MI);
+ 
+@@ -817,6 +813,15 @@
+       Binary |= ((Hi16 >> 12) & 0xF) << 16;
+       emitWordLE(Binary);
+       return;
++  } else if((TID.Opcode == ARM::BFC) || (TID.Opcode == ARM::BFI)) {
++      uint32_t v = ~MI.getOperand(2).getImm();
++      int32_t lsb = CountTrailingZeros_32(v);
++      int32_t msb = (32 - CountLeadingZeros_32(v)) - 1;
++      // Insts[20-16] = msb, Insts[11-7] = lsb
++      Binary |= (msb & 0x1F) << 16;
++      Binary |= (lsb & 0x1F) << 7;
++      emitWordLE(Binary);
++      return;
+   }
+ 
+   // If this is a two-address operand, skip it. e.g. MOVCCr operand 1.
diff --git a/recipes/llvm/llvm2.7/r97745-llvmPR6480.patch b/recipes/llvm/llvm2.7/r97745-llvmPR6480.patch
new file mode 100644
index 0000000..7ca5eef
--- /dev/null
+++ b/recipes/llvm/llvm2.7/r97745-llvmPR6480.patch
@@ -0,0 +1,75 @@
+Index: llvm2.7/test/CodeGen/ARM/2010-03-04-stm-undef-addr.ll
+===================================================================
+--- llvm2.7.org/test/CodeGen/ARM/2010-03-04-stm-undef-addr.ll	(revision 0)
++++ llvm2.7/test/CodeGen/ARM/2010-03-04-stm-undef-addr.ll	(revision 97745)
+@@ -0,0 +1,54 @@
++; RUN: llc < %s -march=arm
++
++define void @"java.lang.String::getChars"([84 x i8]* %method, i32 %base_pc, [788 x i8]* %thread) {
++  %1 = sub i32 undef, 48                          ; <i32> [#uses=1]
++  br i1 undef, label %stack_overflow, label %no_overflow
++
++stack_overflow:                                   ; preds = %0
++  unreachable
++
++no_overflow:                                      ; preds = %0
++  %frame = inttoptr i32 %1 to [17 x i32]*         ; <[17 x i32]*> [#uses=4]
++  %2 = load i32* null                             ; <i32> [#uses=2]
++  %3 = getelementptr inbounds [17 x i32]* %frame, i32 0, i32 14 ; <i32*> [#uses=1]
++  %4 = load i32* %3                               ; <i32> [#uses=2]
++  %5 = load [8 x i8]** undef                      ; <[8 x i8]*> [#uses=2]
++  br i1 undef, label %bci_13, label %bci_4
++
++bci_13:                                           ; preds = %no_overflow
++  br i1 undef, label %bci_30, label %bci_21
++
++bci_30:                                           ; preds = %bci_13
++  %6 = icmp sle i32 %2, %4                        ; <i1> [#uses=1]
++  br i1 %6, label %bci_46, label %bci_35
++
++bci_46:                                           ; preds = %bci_30
++  store [84 x i8]* %method, [84 x i8]** undef
++  br i1 false, label %no_exception, label %exception
++
++exception:                                        ; preds = %bci_46
++  ret void
++
++no_exception:                                     ; preds = %bci_46
++  ret void
++
++bci_35:                                           ; preds = %bci_30
++  %7 = getelementptr inbounds [17 x i32]* %frame, i32 0, i32 15 ; <i32*> [#uses=1]
++  store i32 %2, i32* %7
++  %8 = getelementptr inbounds [17 x i32]* %frame, i32 0, i32 14 ; <i32*> [#uses=1]
++  store i32 %4, i32* %8
++  %9 = getelementptr inbounds [17 x i32]* %frame, i32 0, i32 13 ; <i32*> [#uses=1]
++  %10 = bitcast i32* %9 to [8 x i8]**             ; <[8 x i8]**> [#uses=1]
++  store [8 x i8]* %5, [8 x i8]** %10
++  call void inttoptr (i32 13839116 to void ([788 x i8]*, i32)*)([788 x i8]* %thread, i32 7)
++  ret void
++
++bci_21:                                           ; preds = %bci_13
++  ret void
++
++bci_4:                                            ; preds = %no_overflow
++  store [8 x i8]* %5, [8 x i8]** undef
++  store i32 undef, i32* undef
++  call void inttoptr (i32 13839116 to void ([788 x i8]*, i32)*)([788 x i8]* %thread, i32 7)
++  ret void
++}
+Index: llvm2.7/lib/Target/ARM/ARMLoadStoreOptimizer.cpp
+===================================================================
+--- llvm2.7.org/lib/Target/ARM/ARMLoadStoreOptimizer.cpp	(revision 97744)
++++ llvm2.7/lib/Target/ARM/ARMLoadStoreOptimizer.cpp	(revision 97745)
+@@ -761,6 +761,11 @@
+       MI->getOperand(0).isUndef())
+     return false;
+ 
++  // Likewise don't mess with references to undefined addresses.
++  if (MI->getNumOperands() > 1 && MI->getOperand(1).isReg() &&
++      MI->getOperand(1).isUndef())
++    return false;
++
+   int Opcode = MI->getOpcode();
+   switch (Opcode) {
+   default: break;
diff --git a/recipes/llvm/llvm2.7/rawMOVLRPC.patch b/recipes/llvm/llvm2.7/rawMOVLRPC.patch
new file mode 100644
index 0000000..ec64215
--- /dev/null
+++ b/recipes/llvm/llvm2.7/rawMOVLRPC.patch
@@ -0,0 +1,61 @@
+Index: llvm/lib/Target/ARM/ARMInstrInfo.td
+===================================================================
+--- llvm.orig/lib/Target/ARM/ARMInstrInfo.td	2010-07-13 17:41:01.000000000 +0200
++++ llvm/lib/Target/ARM/ARMInstrInfo.td	2010-07-19 17:11:19.000000000 +0200
+@@ -961,7 +961,7 @@
+ 
+   // ARMv4T
+   // Note: Restrict $func to the tGPR regclass to prevent it being in LR.
+-  def BX : ABXIx2<(outs), (ins tGPR:$func, variable_ops),
++  def BX : PseudoInst<(outs), (ins tGPR:$func, variable_ops),
+                   IIC_Br, "mov\tlr, pc\n\tbx\t$func",
+                   [(ARMcall_nolink tGPR:$func)]>,
+            Requires<[IsARM, HasV4T, IsNotDarwin]> {
+@@ -971,7 +971,7 @@
+   }
+ 
+   // ARMv4
+-  def BMOVPCRX : ABXIx2<(outs), (ins tGPR:$func, variable_ops),
++  def BMOVPCRX : PseudoInst<(outs), (ins tGPR:$func, variable_ops),
+                  IIC_Br, "mov\tlr, pc\n\tmov\tpc, $func",
+                  [(ARMcall_nolink tGPR:$func)]>,
+            Requires<[IsARM, NoV4T, IsNotDarwin]> {
+@@ -1010,7 +1010,7 @@
+ 
+   // ARMv4T
+   // Note: Restrict $func to the tGPR regclass to prevent it being in LR.
+-  def BXr9 : ABXIx2<(outs), (ins tGPR:$func, variable_ops),
++  def BXr9 : PseudoInst<(outs), (ins tGPR:$func, variable_ops),
+                   IIC_Br, "mov\tlr, pc\n\tbx\t$func",
+                   [(ARMcall_nolink tGPR:$func)]>,
+              Requires<[IsARM, HasV4T, IsDarwin]> {
+@@ -1020,7 +1020,7 @@
+   }
+ 
+   // ARMv4
+-  def BMOVPCRXr9 : ABXIx2<(outs), (ins tGPR:$func, variable_ops),
++  def BMOVPCRXr9 : PseudoInst<(outs), (ins tGPR:$func, variable_ops),
+                  IIC_Br, "mov\tlr, pc\n\tmov\tpc, $func",
+                  [(ARMcall_nolink tGPR:$func)]>,
+            Requires<[IsARM, NoV4T, IsDarwin]> {
+Index: llvm/lib/Target/ARM/ARMCodeEmitter.cpp
+===================================================================
+--- llvm.orig/lib/Target/ARM/ARMCodeEmitter.cpp	2010-07-13 17:41:01.000000000 +0200
++++ llvm/lib/Target/ARM/ARMCodeEmitter.cpp	2010-07-19 17:20:26.000000000 +0200
+@@ -654,6 +654,16 @@
+   switch (Opcode) {
+   default:
+     llvm_unreachable("ARMCodeEmitter::emitPseudoInstruction");
++  case ARM::BX:
++  case ARM::BMOVPCRX:
++  case ARM::BXr9:
++  case ARM::BMOVPCRXr9: {
++    // First emit mov lr, pc
++    emitWordLE(0xe1a0e00f);
++    // and then emit the branch.
++    emitMiscBranchInstruction(MI);
++    break;
++  }
+   case TargetOpcode::INLINEASM: {
+     // We allow inline assembler nodes with empty bodies - they can
+     // implicitly define registers, which is ok for JIT.
diff --git a/recipes/llvm/llvm2.7_2.7.bb b/recipes/llvm/llvm2.7_2.7.bb
new file mode 100644
index 0000000..318a47e
--- /dev/null
+++ b/recipes/llvm/llvm2.7_2.7.bb
@@ -0,0 +1,47 @@
+require llvm.inc
+
+PR = "r8"
+
+DEPENDS = "llvm-common llvm2.7-native"
+
+SRC_URI = "\
+  http://llvm.org/releases/${PV}/llvm-${PV}.tgz \
+  file://arm_ppc.patch;patch=1 \
+  file://r97745-llvmPR6480.patch;patch=1 \
+  file://r104558-VFPmisc.patch;patch=1 \
+  file://r104587-MOVimm32.patch;patch=1 \
+  file://r104652-VFPLoadStoreMultiple.patch;patch=1 \
+  file://r104653-BFC-BFI.patch;patch=1 \
+  file://rawMOVLRPC.patch;patch=1 \
+  "
+
+EXTRA_OECMAKE += "\
+        -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \
+        -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \
+        -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
+	-DBUILD_SHARED_LIBS:BOOL=ON \
+	"
+
+# -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
+
+PACKAGES = "${PN} ${PN}-dev ${PN}-dbg ${PN}-doc "
+
+PACKAGES_DYNAMIC = "llvm-*"
+
+
+python populate_packages_prepend () {
+        libllvm_libdir = bb.data.expand('${libdir}/', d)
+
+        do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', 'libllvm-%s', 'Splited package for %s', allow_dirs=True)
+}
+
+ALLOW_EMPTY_${PN} = "1"
+
+FILES_${PN} = ""
+
+FILES_${PN}-dev = "${includedir} ${bindir}/* ${libdir}/LLVMHello.so"
+
+LLVM_RELEASE = "2.7"
+
+SRC_URI[md5sum] = "ac322661f20e7d6c810b1869f886ad9b"
+SRC_URI[sha256sum] = "99664bdc8503a306038166af33f28eb426d99e297575a59d74a1a0dcbddbbca5"
-- 
1.7.0.4



