Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TM4ax-00022D-NZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 00:17:40 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9ALmEMQ013246;
	Wed, 10 Oct 2012 16:48:15 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9ALmD4r005773;
	Thu, 11 Oct 2012 03:18:13 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Oct 2012 03:18:13 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9ALm9TG018582;
	Thu, 11 Oct 2012 03:18:11 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Oct 2012 17:18:39 -0500
Message-ID: <1349907519-17119-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1349907519-17119-1-git-send-email-Chase.Maupin@ti.com>
References: <1349907519-17119-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@intel.com>, Darren Hart <dvhart@linux.intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/1][for-denzil] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Wed, 10 Oct 2012 22:17:40 -0000
Content-Type: text/plain

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
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |   27 ++++++++++++---------------
 1 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index ce82351..1af977e 100644
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
@@ -475,7 +472,7 @@ python populate_packages_prepend () {
 	metapkg = "kernel-modules"
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
 	d.setVar('FILES_' + metapkg, "")
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
-- 
1.7.0.4



