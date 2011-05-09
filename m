Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJKxV-0004mq-Sy
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:32:50 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJKup-0007bT-OD by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 09:30:07 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QJKuo-00010q-JB
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:30:02 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 09:30:01 +0200
Message-Id: <59112d00be843c12fe0486b62f076fd4160d92a7.1304925139.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.5.1
In-Reply-To: <cover.1304925139.git.stefan@buglabs.net>
References: <cover.1304925139.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 2/7] llvm: merge native recipe into the normal recipe
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
X-List-Received-Date: Mon, 09 May 2011 07:32:50 -0000

From: Henning Heinold <h.heinold@tarent.de>

* use BBCLASSEXTENDED = "native"
* remove do_stage
* bump PR

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/llvm/llvm-native.inc       |   33 -----------------
 recipes/llvm/llvm.inc              |   70 +++++++++++++++++++++++++-----------
 recipes/llvm/llvm2.7-native_2.7.bb |   12 ------
 recipes/llvm/llvm2.7_2.7.bb        |    5 +--
 4 files changed, 51 insertions(+), 69 deletions(-)
 delete mode 100644 recipes/llvm/llvm-native.inc
 delete mode 100644 recipes/llvm/llvm2.7-native_2.7.bb

diff --git a/recipes/llvm/llvm-native.inc b/recipes/llvm/llvm-native.inc
deleted file mode 100644
index b3cb7a6..0000000
--- a/recipes/llvm/llvm-native.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-require llvm.inc
-
-DEPENDS = "llvm-common-native cmake-native binutils-cross perl-native"
-
-inherit native
-
-# the difference to the non-native build is that we do not need
-# to declare the location of the tblgen executable.
-EXTRA_OECMAKE = "\
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
-PACKAGES = ""
-
-PACKAGES_DYNAMIC = ""
-
-do_stage() {
-  cd ${OECMAKE_BUILDPATH}
-
-  llvm_stage
-
-  install -d ${STAGING_BINDIR}
-  install -m 0755 bin/llvm-config${LLVM_RELEASE} ${STAGING_BINDIR}
-}
-
-
diff --git a/recipes/llvm/llvm.inc b/recipes/llvm/llvm.inc
index b53af6e..8f85857 100644
--- a/recipes/llvm/llvm.inc
+++ b/recipes/llvm/llvm.inc
@@ -20,12 +20,16 @@
 DESCRIPTION = "The Low Level Virtual Machine"
 HOMEPAGE = "http://llvm.org"
 
+BBCLASSEXTEND = "native"
+
 DEPENDS = "llvm-common llvm${LLVM_RELEASE}-native"
+DEPENDS_virtclass-native = "llvm-common-native cmake-native perl-native"
+
 
 # 3-clause BSD-like
 LICENSE = "University of Illinois/NCSA Open Source License"
 
-SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.tar.gz"
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.tgz"
 
 S = "${WORKDIR}/llvm-${PV}"
 
@@ -63,12 +67,30 @@ EXTRA_OECMAKE = "\
 # We need to reset this to avoid breakage as we build out of tree
 TOOLCHAIN_OPTIONS = ""
 
-PACKAGES = "${PN} ${PN}-dev ${PN}-dbg ${PN}-doc"
+PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}"
 
 PACKAGES_DYNAMIC = "llvm-*"
 
+
+# the difference to the non-native build is that we do not need
+# to declare the location of the tblgen executable.
+EXTRA_OECMAKE_virtclass-native = "\
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
+PACKAGES_virtclass-native = ""
+
+PACKAGES_DYNAMIC_virtclass-native = ""
+
 python populate_packages_prepend () {
-        libllvm_libdir = bb.data.expand('${libdir}/', d)
+        libllvm_libdir = bb.data.expand('${libdir}/llvm${LLVM_RELEASE}', d)
 
         do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', 'libllvm-%s', 'Split package for %s', allow_dirs=True)
 }
@@ -76,32 +98,37 @@ python populate_packages_prepend () {
 FILES_${PN} = ""
 ALLOW_EMPTY_${PN} = "1"
 
-FILES_${PN}-dev = "${includedir} ${bindir}/* ${libdir}/LLVMHello.so"
+FILES_${PN}-dbg += "${libdir}/llvm${LLVM_RELEASE}/.debug ${bindir}/llvm${LLVM_RELEASE}/.debug"
+
+FILES_${PN}-dev = "${includedir} ${bindir}/* ${libdir}/llvm${LLVM_RELEASE}/LLVMHello.so"
 
-llvm_stage() {
+do_install() {
 	# Install into a private directory to be able to reorganize the files.
-	oe_runmake DESTDIR=${WORKDIR}/llvm-install install
+
+        cd ${OECMAKE_BUILDPATH}
+
+        oe_runmake DESTDIR=${WORKDIR}/llvm-install install
 
 	# Create our custom target directories
-	install -d ${STAGING_BINDIR}/llvm${LLVM_RELEASE}
-	install -d ${STAGING_INCDIR}/llvm${LLVM_RELEASE}
-	install -d ${STAGING_LIBDIR}/llvm${LLVM_RELEASE}
+	install -d ${D}${bindir}/llvm${LLVM_RELEASE}
+	install -d ${D}${includedir}/llvm${LLVM_RELEASE}
+	install -d ${D}${libdir}/llvm${LLVM_RELEASE}
 
 	#	Move headers into their own directory
 	cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \
-	${STAGING_INCDIR}/llvm${LLVM_RELEASE}/
+	${D}${includedir}/llvm${LLVM_RELEASE}/
 	cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
-	${STAGING_INCDIR}/llvm${LLVM_RELEASE}/
+	${D}${includedir}/llvm${LLVM_RELEASE}/
 
 	find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 -exec \
-	install {} ${STAGING_LIBDIR}/llvm${LLVM_RELEASE} \;
+	install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
 
 	#	I dont know another way out. Binaries are installed into a special subdir
 	find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 -exec \
-	install {} ${STAGING_BINDIR}/llvm${LLVM_RELEASE} \;
+	install {} ${D}${bindir}/llvm${LLVM_RELEASE} \;
 
 	# LLVM does not install this by default.
-	install bin/tblgen ${STAGING_BINDIR}/llvm${LLVM_RELEASE}
+	install bin/tblgen ${D}${bindir}/llvm${LLVM_RELEASE}
 
 	# Fix the paths in the config script to make it find the binaries and
 	# library files. Doing so allows 3rd party configure scripts working
@@ -112,14 +139,15 @@ llvm_stage() {
 		-e's!my.*BINDIR.*!my $BINDIR = "${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \
 		bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
 }
+ 
+do_install_append_virtclass-native() {
+        install -d ${D}${bindir}
+        install -m 0755 bin/llvm-config${LLVM_RELEASE} ${D}${bindir}
+}
 
-do_stage() {
-  cd ${OECMAKE_BUILDPATH}
-
-  llvm_stage
-
-  install -d ${STAGING_BINDIR_CROSS}
-  install -m 0755 bin/llvm-config${LLVM_RELEASE} ${STAGING_BINDIR_CROSS}
+do_install_append() {
+        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/
+        install -m 0755 bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
 }
 
 # Retrieve the target in a way that is compatible to the arch
diff --git a/recipes/llvm/llvm2.7-native_2.7.bb b/recipes/llvm/llvm2.7-native_2.7.bb
deleted file mode 100644
index e438702..0000000
--- a/recipes/llvm/llvm2.7-native_2.7.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require llvm-native.inc
-
-PR = "r0"
-
-SRC_URI = "\
-  http://llvm.org/releases/${PV}/llvm-${PV}.tgz \
-"
-
-LLVM_RELEASE = "2.7"
-
-SRC_URI[md5sum] = "ac322661f20e7d6c810b1869f886ad9b"
-SRC_URI[sha256sum] = "99664bdc8503a306038166af33f28eb426d99e297575a59d74a1a0dcbddbbca5"
diff --git a/recipes/llvm/llvm2.7_2.7.bb b/recipes/llvm/llvm2.7_2.7.bb
index ef2da43..4353622 100644
--- a/recipes/llvm/llvm2.7_2.7.bb
+++ b/recipes/llvm/llvm2.7_2.7.bb
@@ -1,14 +1,13 @@
 require llvm.inc
 
-PR = "r8"
+PR = "r9"
 
 DEPENDS = "llvm-common llvm2.7-native"
 
 # Force arm mode for armv4t until http://llvm.org/bugs/show_bug.cgi?id=6065 is resolved somehow
 ARM_INSTRUCTION_SET_armv4t = "ARM"
 
-SRC_URI = "\
-  http://llvm.org/releases/${PV}/llvm-${PV}.tgz \
+SRC_URI += "\
   file://arm_ppc.patch \
   file://r97745-llvmPR6480.patch \
   file://r104558-VFPmisc.patch \
-- 
1.7.5.1



