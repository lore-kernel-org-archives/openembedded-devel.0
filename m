Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9aNM-0002Q6-TK
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:36:01 +0200
Received: by weyr6 with SMTP id r6so1143176wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=rYxhjw3gjk2JHtMHYH82VFFftgSoP+ENC8BOTrYA8hY=;
	b=oQ0mxGl61cpVdFGUXnM4hcNdolMKFIswp7cj+Q4VI86BBZsNe2JXsgFu0ZAjG5cZcK
	C58XejoH3+dxLVlNeThCLuFh8qVkbM/+t9gwYhwzs2z+zXck385rD+INGzMPcnYqv6hl
	ej3dKIgx+dYeQ65qpK0ayiYiY6VUrbXakcKMaY2KeYbkS4KgRPxBCIuACBxd68FSLJFw
	0w/Uq1VQMM1teqlMo7eOH2kPRLQKR0rRu2KY4yEChylQELgGJfiMJnV7ii5r9UGPQpdP
	g00d/xG9kDwW6SsNRUTNW05K88L9+A0ITSBQvucoZEl3SSgAEKG8B8t/TpAgEe4H3hOS
	puZA==
Received: by 10.180.74.33 with SMTP id q1mr45141668wiv.4.1346930616809;
	Thu, 06 Sep 2012 04:23:36 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm3682950wib.0.2012.09.06.04.23.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 04:23:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 13:23:25 +0200
Message-Id: <1346930610-2977-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQny5PN6cgnfFK6o8Fv4E+VblsWuGzmHH1Vn8DDeEjuxXSOnBzUjY0+NrrAJmaR6jxYdSMFJ
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-denzil][PATCH 3/8] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Thu, 06 Sep 2012 11:36:01 -0000

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
index 6f1b6a4..d7e42f6 100644
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
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'kernel-misc' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
-- 
1.7.7.6



