Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6696B0BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 19:33:29 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so2018917eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rRNKhlmE7Y4nPDtDFO21FUKkFkKEeBpWV25e/4pLHx8=;
	b=zdnwTPnCwjsAw7jb0mFJ8641g3pGNuOFgHEsKeP7SghrPX7146+dKNRf9VJu8tunYX
	WKYtWkX78e5d5Z3aRKtqEhU+ax0lb4uP4evY5BqNV2PPVdApQTBNhlWOna/3rdux8/yr
	twVPJlsZ06Rad++UBddHgohEgw7f4fxzq7OrLkS2O59uzfUZ0SLqmWoO4mNZz0GyYoaC
	Qx5ir9PB6lw7I9zJCHnVhI9KT0wavWNZJUgofEY37TPfGuE9GD/RESdBdD21J6YWaGni
	d8j42ONiaytQz1NPCrauSdsb+h9z65hcbbYKRBRTE4AsGoWmE4/JWPcniDEfpTd8lyHB
	fJUg==
X-Received: by 10.14.100.2 with SMTP id y2mr17927499eef.75.1373139209928;
	Sat, 06 Jul 2013 12:33:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c44sm26297931eeb.8.2013.07.06.12.33.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 12:33:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 21:33:23 +0200
Message-Id: <12e6a8a7f368c9228b2625d42a5973dc48186721.1373139082.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <5d905be3007b8c80144f011101a2c999b7b6011a.1373139082.git.Martin.Jansa@gmail.com>
References: <5d905be3007b8c80144f011101a2c999b7b6011a.1373139082.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1373139082.git.Martin.Jansa@gmail.com>
References: <cover.1373139082.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] llvm: split packages a bit more
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
X-List-Received-Date: Sat, 06 Jul 2013 19:33:29 -0000

* use split for llvm3.* like we did for llvm2.*
* use PACKAGESPLITFUNCS instead of populate_packages_prepend
* improve regexp in PACKAGES_DYNAMIC
* append ${LLVM_RELEASE} to split package name, otherwise sstate
  will complain about multiple recipes trying to install pkgdata
* split also -staticdev and -dbg libs, PN-dbg and PN-staticdev
  were huge, let old PN-dbg/PN-staticdev to RDEPEND on splitted
  packages
* mesa packages libegl-gallium, libgbm-gallium, mesa-driver-pipe-swrast,
  mesa-driver-pipe-vmwgfx, mesa-driver-swrast, mesa-driver-vmwgfx are
  now depending only on libllvm3.2-llvm-3.2 (>= 3.2) instead of main
  llvm3.2 package, but for llvm-3* it's not big improvement
  (installed size wise), because libLLVM-3.2.so was creating 99% of that
  size.
* there are still some huge packages:
  llvm2.8-dbg is huge because BUILD_SHARED_LIBS is disabled for 2.8
              causing all binaries in ${bindir}/.debug to contain big
              static libs
  llvm2.9 is missing, because it has BUILD_SHARED_LIBS enabled and
          unlike 3.* it doesn't build static versions at all unless
          explicitly requested

  51M     llvm-test/llvm3.2/3.2-r0/packages-split/libllvm3.2-llvmselectiondag-staticdev
  53M     llvm-test/llvm2.8/2.8-r3/packages-split/llvm2.8-dev
  54M     llvm-test/llvm2.8/2.8-r3/packages-split/libllvm2.8-llvmanalysis-staticdev
  55M     llvm-test/llvm3.3/3.3-r0/packages-split/libllvm3.3-llvmselectiondag-staticdev
  62M     llvm-test/llvm3.2/3.2-r0/packages-split/libllvm3.2-llvmanalysis-staticdev
  63M     llvm-test/llvm3.3/3.3-r0/packages-split/libllvm3.3-llvmanalysis-staticdev
  67M     llvm-test/llvm2.9/2.9-r3/packages-split/llvm2.9-dbg
  90M     llvm-test/llvm3.2/3.2-r0/packages-split/llvm3.2-dbg
  92M     llvm-test/llvm3.3/3.3-r0/packages-split/llvm3.3-dbg
  102M    llvm-test/llvm2.8/2.8-r3/packages-split/libllvm2.8-llvmcodegen-staticdev
  127M    llvm-test/llvm3.2/3.2-r0/packages-split/libllvm3.2-llvmcodegen-staticdev
  133M    llvm-test/llvm3.3/3.3-r0/packages-split/libllvm3.3-llvmcodegen-staticdev
  190M    llvm-test/llvm3.2/3.2-r0/packages-split/libllvm3.2-llvm-3.2-dbg
  207M    llvm-test/llvm3.3/3.3-r0/packages-split/libllvm3.3-llvm-3.3-dbg
  628M    llvm-test/llvm2.8/2.8-r3/packages-split/llvm2.8-dbg

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc  | 30 ++++++++++++++++++++++++++----
 meta-oe/recipes-core/llvm/llvm2.inc | 14 --------------
 meta-oe/recipes-core/llvm/llvm3.inc |  4 ----
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 20588f3..c0d6b6e 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -32,11 +32,33 @@ inherit perlnative pythonnative
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-FILES_${PN}-dbg += "${bindir}/${LLVM_DIR}/.debug \
-                    ${libdir}/${LLVM_DIR}/.debug \
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-staticdev = "1"
+FILES_${PN} = ""
+FILES_${PN}-staticdev = ""
+DOTDEBUG-dbg = " ${bindir}/${LLVM_DIR}/.debug \
+                 ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
+                 ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
+                 /usr/src/debug \
 "
-FILES_${PN}-dev += "${bindir} \
+
+FILES_${PN}-dev += "${bindir}/${LLVM_DIR} \
                     ${libdir}/${LLVM_DIR}/BugpointPasses.so \
                     ${libdir}/${LLVM_DIR}/LLVMHello.so \
 "
-FILES_${PN}-staticdev = "${libdir}/${LLVM_DIR}/*.a"
+
+PACKAGES_DYNAMIC = "^libllvm-.*$"
+
+python llvm_populate_packages() {
+    libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
+    split_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True)
+    split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug', '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s', allow_dirs=True)
+    split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
+    if split_packages:
+        pn = d.getVar('PN', True)
+        d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
+        d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
+        d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
+}
+
+PACKAGESPLITFUNCS_prepend = "llvm_populate_packages "
diff --git a/meta-oe/recipes-core/llvm/llvm2.inc b/meta-oe/recipes-core/llvm/llvm2.inc
index b239d30..8765a76 100644
--- a/meta-oe/recipes-core/llvm/llvm2.inc
+++ b/meta-oe/recipes-core/llvm/llvm2.inc
@@ -53,8 +53,6 @@ EXTRA_OECMAKE = "\
 # We need to reset this to avoid breakage as we build out of tree
 TOOLCHAIN_OPTIONS = ""
 
-PACKAGES_DYNAMIC = "llvm-*"
-
 # the difference to the non-native build is that we do not need
 # to declare the location of the tblgen executable.
 EXTRA_OECMAKE_class-native = "\
@@ -68,18 +66,6 @@ EXTRA_OECMAKE_class-native = "\
     -DNM_PATH:FILEPATH=${NM} \
 "
 
-PACKAGES_class-native = ""
-
-PACKAGES_DYNAMIC_class-native = ""
-
-python populate_packages_prepend () {
-    libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
-    do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', 'libllvm-%s', 'Split package for %s', allow_dirs=True)
-}
-
-FILES_${PN} = ""
-ALLOW_EMPTY_${PN} = "1"
-
 base_do_compile_prepend() {
     # Avoid *** No rule to make target `native/bin/tblgen', needed by `include/llvm/Intrinsics.gen.tmp'
     oe_runmake tblgen
diff --git a/meta-oe/recipes-core/llvm/llvm3.inc b/meta-oe/recipes-core/llvm/llvm3.inc
index b04fe24..798d4a2 100644
--- a/meta-oe/recipes-core/llvm/llvm3.inc
+++ b/meta-oe/recipes-core/llvm/llvm3.inc
@@ -18,10 +18,6 @@ EXTRA_OECONF += "--disable-assertions \
                  --enable-shared \
                  --enable-targets=host-only"
 EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
-FILES_${PN} = "${libdir}/lib*.so \
-               ${libdir}/${LLVM_DIR}/*"
-FILES_SOLIBSDEV = ""
-INSANE_SKIP_${PN} = "dev-so"
 
 do_configure_prepend() {
     # Remove RPATHs
-- 
1.8.2.1


