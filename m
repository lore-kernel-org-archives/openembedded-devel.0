Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr7DS-0004nv-AA
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 14:49:26 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so224907bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=m5MttxoEvw8SlUnFwd65z1DF6/myW6+ILtQkf6R1r1E=;
	b=k+wa529ATWHpW6/jWDgqoEdtOVfh59wJZx46OvrFmo+glhHgDOzwXOcyalWtda84rw
	4CUyBMlxUoa0u78mYp2As9d0W2tdcep3S+sdjA+AJUTFnmqUgkPeO0xjn4CF8mOE3hNd
	8aXjrBvx+9iUnWmq04kYcYX2fFdB3PsuigPPqkRGs23Fbb2bcC1kFGvbJUisV2J4j8ma
	2y5wtNvlyKnjVKyt7L1TAxkpMP0+sifQvfv5Nuw0WBs/xVDXuZFw2sIcwIVyAPcGm9fm
	dR73HQlC08jL5nInr8vGAc8QHtn52YexLXGZ9kX4o5q6SxM1sDGPyS2JK4kd3UF0ks8Y
	pxbg==
Received: by 10.204.152.27 with SMTP id e27mr1083158bkw.56.1342528689196;
	Tue, 17 Jul 2012 05:38:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c18sm9888781bkv.8.2012.07.17.05.38.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 05:38:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 14:37:56 +0200
Message-Id: <1342528680-6336-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120716175038.GL3729@jama.jama.net>
	<1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>, Darren Hart <dvhart@linux.intel.com>
Subject: [meta-oe][PATCH 3/7] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Tue, 17 Jul 2012 12:49:26 -0000

From: Darren Hart <dvhart@linux.intel.com>

[YOCTO #1614]

Add the kernel headers to the kernel-dev package. This packages what was
already built and kept in sysroots for building modules with bitbake.
Making this available on the target requires removing some additional
host binaries.

Move the location to /usr/src/kernel

Before use on the target, the user will need to:

    # cd /usr/src/kernel
    # make scripts

This renders the kernel-misc recipe empty, so remove it.

As we use /usr/src/kernel in several places (and I missed one in the
previous version), add a KERNEL_SRC_DIR variable and use that throughout
the class to avoid update errors in the future.

Now that we package the kernel headers, drop the
kernel_package_preprocess function which removed them from PKGD.

All *-sdk image recipes include dev-pkgs, so the kernel-dev package will
be installed by default on all such images.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Bruce Ashfield <bruce.ashfield@windriver.com>
CC: Tom Zanussi <tom.zanussi@intel.com>
CC: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |   27 ++++++++++++---------------
 1 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 722c928..4a6f660 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -82,6 +82,10 @@ EXTRA_OEMAKE = ""
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
+# Define where the kernel headers are installed on the target as well as where
+# they are staged.
+KERNEL_SRC_PATH = "/usr/src/kernel"
+
 KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
 
 kernel_do_compile() {
@@ -135,7 +139,7 @@ kernel_do_install() {
 	# Support for external module building - create a minimal copy of the
 	# kernel source tree.
 	#
-	kerneldir=${D}/kernel
+	kerneldir=${D}${KERNEL_SRC_PATH}
 	install -d $kerneldir
 
 	#
@@ -188,23 +192,18 @@ kernel_do_install() {
 		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
 	fi
 
-	# Remove the following binaries which cause strip errors
+	# Remove the following binaries which cause strip or arch QA errors
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
-	           arch/powerpc/boot/mktree"
+	           arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
+		   scripts/kconfig/conf.o"
 	for entry in $bin_files; do
 		rm -f $kerneldir/$entry
 	done
 }
 
-PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
-
-kernel_package_preprocess () {
-	rm -rf ${PKGD}/kernel
-}
-
 sysroot_stage_all_append() {
-	sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}/kernel
+	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
 }
 
 kernel_do_configure() {
@@ -252,13 +251,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-misc"
+PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
 FILES = ""
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
-FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
+FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
-# misc is a package to contain files we need in staging
-FILES_kernel-misc = "/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel/drivers/media"
 RDEPENDS_kernel = "kernel-base"
 # Allow machines to override this dependency if kernel image files are 
 # not wanted in images as standard
@@ -474,7 +471,7 @@ python populate_packages_prepend () {
 	metapkg = "kernel-modules"
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
 	d.setVar('FILES_' + metapkg, "")
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'kernel-misc' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
-- 
1.7.8.6



