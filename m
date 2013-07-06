Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBA16204F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 19:33:25 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c1so2013245eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 12:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wGs25To38zy0GPZM5r7EFWztLxMbIO4xZuHw+mu2Jdg=;
	b=zGiLfig6h2brgEV1Fbxg6MB4fCm02azZRHaXsPEK/JgJUUJmbrIidgvCfhkGaXS41b
	2o/R/QffgTNYhAC4hSfFdpBGPAEiVrm5h7xMm/MalVFB7w6gDF4dNU9LbFL9M+VFBfID
	OKV/PJfQ4kYUiFpeA52fORVQMZYIywhCG01IC3AKYnHFGzJ4psT1ooFYTKy6VYoo26+p
	JamnWA6ch+Fg21Yg/495N0q3Lkz9jWx8YNVee8q7RYmQUrV3hAr54WHl5AYfesQkUcS2
	vsDlLgsdR0ucgSH5U2M06wQVGin1kMSV3aZafhYKhceCoj99DM1AoltN9tt2Pv7CfA8Y
	CXvQ==
X-Received: by 10.14.218.136 with SMTP id k8mr17610859eep.111.1373139205593;
	Sat, 06 Jul 2013 12:33:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cg12sm26310475eeb.7.2013.07.06.12.33.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 12:33:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 21:33:20 +0200
Message-Id: <5d905be3007b8c80144f011101a2c999b7b6011a.1373139082.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1373139082.git.Martin.Jansa@gmail.com>
References: <cover.1373139082.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] llvm: Consolidate .inc files
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
X-List-Received-Date: Sat, 06 Jul 2013 19:33:25 -0000

* unlike other recipes where we have a rule to keep only one
  version, llvm is different so we'll keep .inc files
* llvm.inc is shared by all, llvm[23].inc are separated because
  2.* is built with cmake and 3.* with automake
* fix staticdev packaging and move it to shared llvm.inc
  FILES_${PN}-static-dev = "${libdir}/${LLVM_DIR}/*.a"
  (it's staticdev not static-dev)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc       | 210 ++-----------------------------
 meta-oe/recipes-core/llvm/llvm2.8_2.8.bb |   9 +-
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb |  30 +----
 meta-oe/recipes-core/llvm/llvm2.inc      | 194 ++++++++++++++++++++++++++++
 meta-oe/recipes-core/llvm/llvm3.2_3.2.bb | 104 +--------------
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb | 100 +--------------
 meta-oe/recipes-core/llvm/llvm3.inc      |  84 +++++++++++++
 7 files changed, 303 insertions(+), 428 deletions(-)
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.inc
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.inc

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index fcd2666..20588f3 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -19,208 +19,24 @@
 
 DESCRIPTION = "The Low Level Virtual Machine"
 HOMEPAGE = "http://llvm.org"
+
 # 3-clause BSD-like
+# University of Illinois/NCSA Open Source License
 LICENSE = "NCSA"
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
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
 
-# Defines the LLVM supported arches. By now we always build either for ${BUILD}
-# (native) or ${TARGET}. In the future it may make sense to enable all backends
-# for the non-native build. The decision which backends are used is made by
-# the 3rd party program or library that uses llvm anyway.
-LLVM_ARCH = "${@get_llvm_arch(d)}"
+# 2.* inherits also cmake
+# 3.* inherits also automake
+inherit perlnative pythonnative
 
-# This is used for generating the install directory for the llvm libraries,
-# binaries and headers. It makes side by side installation of those possible.
 LLVM_RELEASE = "${PV}"
+LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-# llvm *must* be built out of tree
-OECMAKE_SOURCEPATH = ".."
-OECMAKE_BUILDPATH = "build"
-EXTRA_OECMAKE = "\
-    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \
-    -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \
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
+FILES_${PN}-dbg += "${bindir}/${LLVM_DIR}/.debug \
+                    ${libdir}/${LLVM_DIR}/.debug \
 "
-# We need to reset this to avoid breakage as we build out of tree
-TOOLCHAIN_OPTIONS = ""
-
-PACKAGES_DYNAMIC = "llvm-*"
-
-# the difference to the non-native build is that we do not need
-# to declare the location of the tblgen executable.
-EXTRA_OECMAKE_virtclass-native = "\
-    -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \
-    -DCMAKE_LINKER:FILEPATH=${LD} \
-    -DCMAKE_AR:FILEPATH=${AR} \
-    -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
-    -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
-    -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
-    -DCMAKE_STRIP:FILEPATH=${STRIP} \
-    -DNM_PATH:FILEPATH=${NM} \
+FILES_${PN}-dev += "${bindir} \
+                    ${libdir}/${LLVM_DIR}/BugpointPasses.so \
+                    ${libdir}/${LLVM_DIR}/LLVMHello.so \
 "
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
-"
-
-base_do_compile_prepend() {
-    # Avoid *** No rule to make target `native/bin/tblgen', needed by `include/llvm/Intrinsics.gen.tmp'
-    oe_runmake tblgen
-}
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
-    #    Move headers into their own directory
-    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \
-    ${D}${includedir}/llvm${LLVM_RELEASE}/
-    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
-    ${D}${includedir}/llvm${LLVM_RELEASE}/
-
-    find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \
-    install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
-
-    #    I dont know another way out. Binaries are installed into a special subdir
-    find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \
-    install {} ${D}${bindir}/llvm${LLVM_RELEASE} \;
-
-    # LLVM does not install this by default.
-    install bin/tblgen ${D}${bindir}/llvm${LLVM_RELEASE}
-
-        # we install it here unmodified for native and none native and overwrite it
-        # later for native case
-        install -d ${D}${bindir}
-        install -m 0755 bin/llvm-config ${D}${bindir}
-}
-
-SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-    cd ${OECMAKE_BUILDPATH}
-
-    # Fix the paths in the config script to make it find the binaries and
-    # library files. Doing so allows 3rd party configure scripts working
-    # unmodified.
-    sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \
-        -e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR = "${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \
-        -e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!' \
-        -e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \
-        bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
-
-        install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-        install -m 0755 bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${bindir_crossscripts}
-}
-
-do_install_virtclass-native() {
-    # Install into a private directory to be able to reorganize the files.
-
-        cd ${OECMAKE_BUILDPATH}
-
-        oe_runmake DESTDIR=${WORKDIR}/llvm-install install
-
-    # Create our custom target directories
-    install -d ${D}${bindir}/llvm${LLVM_RELEASE}
-    install -d ${D}${includedir}/llvm${LLVM_RELEASE}
-    install -d ${D}${libdir}/llvm${LLVM_RELEASE}
-
-    #    Move headers into their own directory
-    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \
-    ${D}${includedir}/llvm${LLVM_RELEASE}/
-    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
-    ${D}${includedir}/llvm${LLVM_RELEASE}/
-
-    find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \
-    install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
-
-    #    I dont know another way out. Binaries are installed into a special subdir
-    find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \
-    install {} ${D}${bindir}/llvm${LLVM_RELEASE} \;
-
-    # LLVM does not install this by default.
-    install bin/tblgen ${D}${bindir}/llvm${LLVM_RELEASE}
-
-    # Fix the paths in the config script to make it find the binaries and
-    # library files. Doing so allows 3rd party configure scripts working
-    # unmodified.
-    sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \
-        -e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR = "${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \
-        -e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!' \
-        -e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \
-        bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
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
+FILES_${PN}-staticdev = "${libdir}/${LLVM_DIR}/*.a"
diff --git a/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb b/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb
index 8dc22e5..4d0b3c8 100644
--- a/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb
+++ b/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb
@@ -1,10 +1,7 @@
 require llvm.inc
+require llvm2.inc
 
-#LICENSE = "University of Illinois/NCSA Open Source License"
-LICENSE = "NCSA"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0ac5f799a2d89477c75b0a378b221855"
-
-PR = "${INC_PR}.2"
+PR = "r3"
 
 SRC_URI += " \
             file://30may-llvm2.8-pr399-ppc-arm.patch \
@@ -13,8 +10,6 @@ SRC_URI += " \
             file://llvm-mc_disable.patch \
 "
 
-LLVM_RELEASE = "2.8"
-
 EXTRA_OECMAKE += " -DBUILD_SHARED_LIBS:BOOL=OFF "
 
 SRC_URI[md5sum] = "220d361b4d17051ff4bb21c64abe05ba"
diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
index 1cd68be..44504b8 100644
--- a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
+++ b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
@@ -1,9 +1,12 @@
 require llvm.inc
+require llvm2.inc
 
-PR = "${INC_PR}.0"
+PR = "r3"
 
 SRC_URI += "file://0035-gcc-4.7.patch"
 
+ARM_INSTRUCTION_SET = "arm"
+
 # 0019-issue6065.patch is still needed but a bit modified, because it was resolved by
 # http://llvm.org/viewvc/llvm-project/llvm/trunk/lib/Target/ARM/ARMJITInfo.cpp?r1=120304&r2=124694&pathrev=124694
 # http://llvm.org/viewvc/llvm-project/llvm/trunk/lib/Target/ARM/ARMJITInfo.cpp?diff_format=h&r1=57911&r2=57910&pathrev=57911
@@ -11,33 +14,8 @@ SRC_URI += "file://0035-gcc-4.7.patch"
 # {standard input}:31: Error: invalid register list to push/pop instruction -- `pop {r0,r1,r2,r3,lr}'
 # make[2]: *** [lib/Target/ARM/CMakeFiles/LLVMARMCodeGen.dir/ARMJITInfo.cpp.o] Error 1
 # SRC_URI += "file://0019-issue6065.patch"
-ARM_INSTRUCTION_SET = "arm"
 
 SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
 
-LLVM_EXTRA_ARCH = "X86;"
-LLVM_EXTRA_ARCH_x86 = ""
-LLVM_EXTRA_ARCH_x86-64 = ""
-
-EXTRA_OECMAKE = "\
-    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen \
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
-LLVM_RELEASE = "2.9"
-
 SRC_URI[md5sum] = "793138412d2af2c7c7f54615f8943771"
 SRC_URI[sha256sum] = "661236cfa17428b48cfa9cbb9909f7569c64b8ecd219fd91dbc00e3b557b3779"
diff --git a/meta-oe/recipes-core/llvm/llvm2.inc b/meta-oe/recipes-core/llvm/llvm2.inc
new file mode 100644
index 0000000..b5bad45
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm2.inc
@@ -0,0 +1,194 @@
+DEPENDS = "llvm${LLVM_RELEASE}-native llvm-common"
+DEPENDS_virtclass-native = "llvm-common-native cmake-native"
+
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.tgz"
+S = "${WORKDIR}/llvm-${PV}"
+
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0ac5f799a2d89477c75b0a378b221855"
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
+BBCLASSEXTEND = "native"
+
+LLVM_BUILD_DIR = "${B}/build"
+LLVM_INSTALL_DIR = "${B}/llvm-install"
+
+# llvm *must* be built out of tree
+OECMAKE_SOURCEPATH = ".."
+OECMAKE_BUILDPATH = "build"
+
+# other architectures require X86 available,
+LLVM_EXTRA_ARCH = "X86;"
+LLVM_EXTRA_ARCH_x86 = ""
+LLVM_EXTRA_ARCH_x86-64 = ""
+
+EXTRA_OECMAKE = "\
+    -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/${LLVM_DIR}/tblgen \
+    -DLLVM_TARGETS_TO_BUILD="${LLVM_EXTRA_ARCH}${LLVM_ARCH}" \
+    -DCMAKE_LINKER:FILEPATH=${LD} \
+    -DCMAKE_AR:FILEPATH=${AR} \
+    -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
+    -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
+    -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
+    -DCMAKE_STRIP:FILEPATH=${STRIP} \
+    -DNM_PATH:FILEPATH=${NM} \
+    -DLLVM_ENABLE_PIC:BOOL=ON \
+    -DLLVM_TARGET_ARCH:STRING=${LLVM_ARCH} \
+    -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \
+    -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
+    -DBUILD_SHARED_LIBS:BOOL=ON \
+    -DCMAKE_SKIP_BUILD_RPATH:BOOL=ON \
+"
+
+# We need to reset this to avoid breakage as we build out of tree
+TOOLCHAIN_OPTIONS = ""
+
+PACKAGES_DYNAMIC = "llvm-*"
+
+# the difference to the non-native build is that we do not need
+# to declare the location of the tblgen executable.
+EXTRA_OECMAKE_virtclass-native = "\
+    -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \
+    -DCMAKE_LINKER:FILEPATH=${LD} \
+    -DCMAKE_AR:FILEPATH=${AR} \
+    -DCMAKE_OBJCOPY:FILEPATH=${OBJCOPY} \
+    -DCMAKE_OBJDUMP:FILEPATH=${OBJDUMP} \
+    -DCMAKE_RANLIB:FILEPATH=${RANLIB} \
+    -DCMAKE_STRIP:FILEPATH=${STRIP} \
+    -DNM_PATH:FILEPATH=${NM} \
+"
+
+PACKAGES_virtclass-native = ""
+
+PACKAGES_DYNAMIC_virtclass-native = ""
+
+python populate_packages_prepend () {
+    libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
+    do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', 'libllvm-%s', 'Split package for %s', allow_dirs=True)
+}
+
+FILES_${PN} = ""
+ALLOW_EMPTY_${PN} = "1"
+
+base_do_compile_prepend() {
+    # Avoid *** No rule to make target `native/bin/tblgen', needed by `include/llvm/Intrinsics.gen.tmp'
+    oe_runmake tblgen
+}
+
+do_install() {
+    # Install into a private directory to be able to reorganize the files.
+    cd ${LLVM_BUILD_DIR}
+    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
+
+    # Create our custom target directories
+    install -d ${D}${bindir}/${LLVM_DIR}
+    install -d ${D}${includedir}/${LLVM_DIR}
+    install -d ${D}${libdir}/${LLVM_DIR}
+
+    # Move headers into their own directory
+    cp -R ${LLVM_INSTALL_DIR}/${prefix}/include/llvm \
+    ${D}${includedir}/${LLVM_DIR}/
+    cp -R ${LLVM_INSTALL_DIR}/${prefix}/include/llvm-c \
+    ${D}${includedir}/${LLVM_DIR}/
+
+    find ${LLVM_INSTALL_DIR}/${prefix}/lib -name "*" -maxdepth 1 -exec \
+    install {} ${D}${libdir}/${LLVM_DIR} \;
+
+    # I dont know another way out. Binaries are installed into a special subdir
+    find ${LLVM_INSTALL_DIR}/${prefix}/bin -name "*" -maxdepth 1 -exec \
+    install {} ${D}${bindir}/${LLVM_DIR} \;
+
+    # LLVM does not install this by default.
+    install bin/tblgen ${D}${bindir}/${LLVM_DIR}
+
+    # we install it here unmodified for native and none native and overwrite it
+    # later for native case
+    install -d ${D}${bindir}
+    install -m 0755 bin/llvm-config ${D}${bindir}
+}
+
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_sysroot_preprocess"
+
+llvm_sysroot_preprocess() {
+    cd ${LLVM_BUILD_DIR}
+
+    # Fix the paths in the config script to make it find the binaries and
+    # library files. Doing so allows 3rd party configure scripts working
+    # unmodified.
+    sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \
+        -e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR = "${STAGING_INCDIR}/${LLVM_DIR}";!' \
+        -e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/${LLVM_DIR}";!' \
+        -e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/${LLVM_DIR}";!' \
+        bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
+
+        install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+        install -m 0755 bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${bindir_crossscripts}
+}
+
+do_install_virtclass-native() {
+    # Install into a private directory to be able to reorganize the files.
+    cd ${LLVM_BUILD_DIR}
+    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
+
+    # Create our custom target directories
+    install -d ${D}${bindir}/${LLVM_DIR}
+    install -d ${D}${includedir}/${LLVM_DIR}
+    install -d ${D}${libdir}/${LLVM_DIR}
+
+    # Move headers into their own directory
+    cp -R ${LLVM_INSTALL_DIR}/${prefix}/include/llvm \
+          ${D}${includedir}/${LLVM_DIR}/
+    cp -R ${LLVM_INSTALL_DIR}/${prefix}/include/llvm-c \
+          ${D}${includedir}/${LLVM_DIR}/
+
+    find ${LLVM_INSTALL_DIR}/${prefix}/lib -name "*" -maxdepth 1 -exec \
+        install {} ${D}${libdir}/${LLVM_DIR} \;
+
+    # I dont know another way out. Binaries are installed into a special subdir
+    find ${LLVM_INSTALL_DIR}/${prefix}/bin -name "*" -maxdepth 1 -exec \
+        install {} ${D}${bindir}/${LLVM_DIR} \;
+
+    # LLVM does not install this by default.
+    install bin/tblgen ${D}${bindir}/${LLVM_DIR}
+
+    # Fix the paths in the config script to make it find the binaries and
+    # library files. Doing so allows 3rd party configure scripts working
+    # unmodified.
+    sed -e's!my.*ABS_RUN_DIR =.*!my $ABS_RUN_DIR = "${STAGING_DIR_TARGET}";!' \
+        -e's!my.*INCLUDEDIR =.*!my $INCLUDEDIR = "${STAGING_INCDIR}/${LLVM_DIR}";!' \
+        -e's!my.*LIBDIR.*!my $LIBDIR = "${STAGING_LIBDIR}/${LLVM_DIR}";!' \
+        -e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/${LLVM_DIR}";!' \
+        bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
+
+    install -d ${D}${bindir}
+    install -m 0755 bin/llvm-config${LLVM_RELEASE} ${D}${bindir}
+}
+
+# Retrieve the target in a way that is compatible to the arch
+# value in llvm (>= 2.5)
+def get_llvm_arch(d):
+    import bb;
+
+    arch = bb.data.getVar('TARGET_ARCH', d, 1)
+    if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
+        arch = "X86"
+    elif arch == "arm":
+        arch = "ARM"
+    elif arch == "mipsel" or arch == "mips":
+        arch = "mips"
+    elif arch == "powerpc" or arch == "powerpc64":
+        arch = "PowerPC"
+    else:
+        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
+
+    return arch
diff --git a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
index 71a53c1..48e27b9 100644
--- a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
@@ -1,105 +1,9 @@
-DESCRIPTION = "The Low Level Virtual Machine"
-HOMEPAGE = "http://llvm.org"
-# 3-clause BSD-like
-LICENSE = "NCSA"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=60fdd7739841f04a2ce2171a726be8f3"
+require llvm.inc
+require llvm3.inc
 
-DEPENDS = "libffi libxml2-native llvm-common"
+# 3.2 is different then 2.8, 2.9 and 3.3
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=60fdd7739841f04a2ce2171a726be8f3"
 
-SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
 SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
-
 SRC_URI[md5sum] = "71610289bbc819e3e15fdd562809a2d7"
 SRC_URI[sha256sum] = "125090c4d26740f1d5e9838477c931ed7d9ad70d599ba265f46f3a42cb066343"
-
-S = "${WORKDIR}/llvm-${PV}.src"
-
-inherit autotools perlnative pythonnative
-
-LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
-LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-LLVM_DIR = "llvm${PV}"
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
-FILES_${PN} = "${libdir}/lib*.so \
-               ${libdir}/${LLVM_DIR}/*"
-FILES_${PN}-dbg = "${bindir}/${LLVM_DIR}/.debug \
-                   ${libdir}/${LLVM_DIR}/.debug \
-                   ${libdir}/.debug \
-                   /usr/src/debug"
-FILES_${PN}-dev = "${bindir}/${LLVM_DIR} \
-                   ${includedir}/${LLVM_DIR} \
-                   ${libdir}/${LLVM_DIR}/BugpointPasses.so \
-                   ${libdir}/${LLVM_DIR}/LLVMHello.so"
-FILES_${PN}-static-dev = "${libdir}/${LLVM_DIR}/*.a"
-FILES_SOLIBSDEV = ""
-INSANE_SKIP_${PN} = "dev-so"
-
-do_configure_prepend() {
-	# Remove RPATHs
-	sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules
-
-	# Drop "svn" suffix from version string
-	sed -i 's/3\.2svn/3.2/g' configure
-
-	# Fix paths in llvm-config
-	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" tools/llvm-config/llvm-config.cpp
-	sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" tools/llvm-config/llvm-config.cpp
-
-	# Fails to build unless using separate directory from source
-	mkdir -p ${LLVM_BUILD_DIR}
-	cd ${LLVM_BUILD_DIR}
-}
-
-do_compile() {
-	cd ${LLVM_BUILD_DIR}
-	oe_runmake \
-		AR="${BUILD_AR}" \
-		CC="${BUILD_CC}" \
-		CFLAGS="${BUILD_CFLAGS}" \
-		CXX="${BUILD_CXX}" \
-		CXXFLAGS="${BUILD_CXXFLAGS}" \
-		CPP="${BUILD_CPP}" \
-		CPPFLAGS="${BUILD_CPPFLAGS}" \
-		NM="${BUILD_NM}" \
-		RANLIB="${BUILD_RANLIB}" \
-		PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
-		cross-compile-build-tools
-	oe_runmake
-}
-
-do_install() {
-	cd ${LLVM_BUILD_DIR}
-	oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
-
-	mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config-host ${LLVM_INSTALL_DIR}/llvm-config-host
-
-	install -d ${D}${bindir}/${LLVM_DIR}
-	mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
-
-	install -d ${D}${includedir}/${LLVM_DIR}
-	mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
-
-	install -d ${D}${libdir}/${LLVM_DIR}
-	mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
-	ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
-
-	install -d ${D}${docdir}/${LLVM_DIR}
-	mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
-}
-
-SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-	mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
-}
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
index d3aa963..3fca575 100644
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
@@ -1,105 +1,9 @@
-DESCRIPTION = "The Low Level Virtual Machine"
-HOMEPAGE = "http://llvm.org"
-# 3-clause BSD-like
-LICENSE = "NCSA"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
+require llvm.inc
+require llvm3.inc
 
-DEPENDS = "libffi libxml2-native llvm-common"
-
-SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
 SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
-
 SRC_URI[md5sum] = "40564e1dc390f9844f1711c08b08e391"
 SRC_URI[sha256sum] = "68766b1e70d05a25e2f502e997a3cb3937187a3296595cf6e0977d5cd6727578"
 
-S = "${WORKDIR}/llvm-${PV}.src"
-
-inherit autotools perlnative pythonnative
-
-LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
-LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-LLVM_DIR = "llvm${PV}"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[r600] = "--enable-experimental-targets=R600,,,"
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
-FILES_${PN} = "${libdir}/lib*.so \
-               ${libdir}/${LLVM_DIR}/*"
-FILES_${PN}-dbg = "${bindir}/${LLVM_DIR}/.debug \
-                   ${libdir}/${LLVM_DIR}/.debug \
-                   ${libdir}/.debug \
-                   /usr/src/debug"
-FILES_${PN}-dev = "${bindir}/${LLVM_DIR} \
-                   ${includedir}/${LLVM_DIR} \
-                   ${libdir}/${LLVM_DIR}/BugpointPasses.so \
-                   ${libdir}/${LLVM_DIR}/LLVMHello.so"
-FILES_${PN}-static-dev = "${libdir}/${LLVM_DIR}/*.a"
-FILES_SOLIBSDEV = ""
-INSANE_SKIP_${PN} = "dev-so"
-
-do_configure_prepend() {
-	# Remove RPATHs
-	sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules
-
-	# Fix paths in llvm-config
-	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" tools/llvm-config/llvm-config.cpp
-	sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" tools/llvm-config/llvm-config.cpp
-
-	# Fails to build unless using separate directory from source
-	mkdir -p ${LLVM_BUILD_DIR}
-	cd ${LLVM_BUILD_DIR}
-}
-
-do_compile() {
-	cd ${LLVM_BUILD_DIR}
-	oe_runmake \
-		AR="${BUILD_AR}" \
-		CC="${BUILD_CC}" \
-		CFLAGS="${BUILD_CFLAGS}" \
-		CXX="${BUILD_CXX}" \
-		CXXFLAGS="${BUILD_CXXFLAGS}" \
-		CPP="${BUILD_CPP}" \
-		CPPFLAGS="${BUILD_CPPFLAGS}" \
-		NM="${BUILD_NM}" \
-		RANLIB="${BUILD_RANLIB}" \
-		PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
-		cross-compile-build-tools
-	oe_runmake
-}
-
-do_install() {
-	cd ${LLVM_BUILD_DIR}
-	oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
-
-	mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config-host ${LLVM_INSTALL_DIR}/llvm-config-host
-
-	install -d ${D}${bindir}/${LLVM_DIR}
-	mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
-
-	install -d ${D}${includedir}/${LLVM_DIR}
-	mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
-
-	install -d ${D}${libdir}/${LLVM_DIR}
-	mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
-	ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
-
-	install -d ${D}${docdir}/${LLVM_DIR}
-	mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
-}
-
-SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-	mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
-}
diff --git a/meta-oe/recipes-core/llvm/llvm3.inc b/meta-oe/recipes-core/llvm/llvm3.inc
new file mode 100644
index 0000000..b04fe24
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm3.inc
@@ -0,0 +1,84 @@
+DEPENDS = "libffi libxml2-native llvm-common"
+
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
+S = "${WORKDIR}/llvm-${PV}.src"
+
+inherit autotools
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
+FILES_${PN} = "${libdir}/lib*.so \
+               ${libdir}/${LLVM_DIR}/*"
+FILES_SOLIBSDEV = ""
+INSANE_SKIP_${PN} = "dev-so"
+
+do_configure_prepend() {
+    # Remove RPATHs
+    sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules
+
+    # Drop "svn" suffix from version string
+    sed -i 's/${PV}svn/${PV}/g' configure
+
+    # Fix paths in llvm-config
+    sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" tools/llvm-config/llvm-config.cpp
+    sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" tools/llvm-config/llvm-config.cpp
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
-- 
1.8.2.1


