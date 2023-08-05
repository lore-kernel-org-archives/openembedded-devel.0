Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE141C001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 08:07:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.2394.1691222821538558102
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 01:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=D9glmQCZ;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85DF71BF203
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691222819;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=/iPD3rxxuYo3aCMk64tjg7lCDLiuUnCZabb4e1KEol0=;
	b=D9glmQCZAwusUiMXfkw3xf3raAaSz3okzyGMgdFk+cpu3/bLoP4zZlnknxC9c/hGPy0M0l
	Ez8dTIuo6tXG9ras0GUjMh16hodqm4J7K57IcHlpH+Pd0+xUnR4D9KRHYbGCmvxCyuTzZ7
	cG2tZKd3Chvoj1HSS1Hfzey2yVDFIq8vIoh/FtasPlnEM4TKAvcv/cGH2Pzo8emmFsjhtt
	0tid2ewdoiB+ptAsdWSq3VJbCOpyc5752a7py/Me/iYXB5NbIi/mRoBdXhOWkcXTp5Paug
	cuHPRATyChxnIEWy8x2Q1QAayihuqlB05f6cat63oLhqTln4ViTteNtzqangRw==
Content-Type: multipart/mixed; boundary="===============4384065667137642203=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] libio-socket-ssl-perl: upgrading to 2.083 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 08:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104286
Message-Id: <20230805080709.CE141C001DB@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 08:07:09 +0000 (UTC)

--===============4384065667137642203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libio-socket-ssl-perl* to *2.083* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libio-socket-ssl-perl-upgrade-2.078-2.083.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From dcc6e42a2d2aad509161d6368c06d84e80364284 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:51:48 -0500
Subject: [PATCH] libio-socket-ssl-perl: upgrade 2.078 -> 2.083

---
 ...-socket-ssl-perl_2.078.bb => libio-socket-ssl-perl_2.083.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.078.bb => libio-socket-ssl-perl_2.083.bb} (95%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
similarity index 95%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
index ff2559b8a..dc9b88b10 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4cf83737a72b0970948b494bc9ddab7f725420a0ca0152d25c7e48ef8fa2b6a1"
+SRC_URI[sha256sum] = "904ef28765440a97d8a9a0df597f8c3d7f3cb0a053d1b082c10bed03bc802069"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.25.1


--===============4384065667137642203==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libio-socket-ssl-perl-upgrade-2.078-2.083.patch"

From dcc6e42a2d2aad509161d6368c06d84e80364284 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:51:48 -0500
Subject: [PATCH] libio-socket-ssl-perl: upgrade 2.078 -> 2.083

---
 ...-socket-ssl-perl_2.078.bb => libio-socket-ssl-perl_2.083.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.078.bb => libio-socket-ssl-perl_2.083.bb} (95%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
similarity index 95%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
index ff2559b8a..dc9b88b10 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.078.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4cf83737a72b0970948b494bc9ddab7f725420a0ca0152d25c7e48ef8fa2b6a1"
+SRC_URI[sha256sum] = "904ef28765440a97d8a9a0df597f8c3d7f3cb0a053d1b082c10bed03bc802069"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.25.1


--===============4384065667137642203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12798 entries from dependency cache.
Parsing recipes...done.
Parsing of 7341 .bb files complete (7338 cached, 3 parsed). 12618 targets, 325 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:c830013b185a819ce978606311c11d24043ace07"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:c830013b185a819ce978606311c11d24043ace07"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:c830013b185a819ce978606311c11d24043ace07"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 208 Local 73 Mirrors 125 Missed 10 Current 239 (95% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running task 882 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_recipe_qa)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_recipe_qa: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1276 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_fetch)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_fetch: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_fetch: Succeeded
NOTE: Running task 1277 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_unpack)
NOTE: Running task 1278 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_prepare_recipe_sysroot)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_unpack: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_unpack: Succeeded
NOTE: Running task 1279 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_patch)
NOTE: Running task 1280 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_collect_spdx_deps)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_patch: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_collect_spdx_deps: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_patch: Succeeded
NOTE: Running task 1281 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_deploy_source_date_epoch)
NOTE: Running task 1282 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_populate_lic)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_populate_lic: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_populate_lic: Succeeded
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1283 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_configure)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_configure: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_configure: Succeeded
NOTE: Running task 1284 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_configure_ptest_base)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_configure_ptest_base: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1285 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_compile)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_compile: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_compile: Succeeded
NOTE: Running task 1286 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_compile_ptest_base)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_compile_ptest_base: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1287 of 1297 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_install)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/auh/Projects/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'perl', 'quilt-native', 'patch-native', 'perl-native', 'pseudo-native', 'linux-libc-headers', 'attr-native', 'libtool-native', 'libgcc', 'zlib', 'opkg-utils', 'gdbm', 'libxcrypt', 'xz-native', 'gmp-native', 'binutils-cross-x86_64', 'gnu-config-native', 'zstd-native', 'libmpc-native', 'texinfo-dummy-native', 'mpfr-native', 'zlib-native', 'flex-native', 'gdbm-native', 'make-native', 'gettext-minimal-native', 'm4-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 48 DESTDIR=/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image install_vendor
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Encode.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Encode.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Encode.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Fcntl.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Fcntl.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Fcntl.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Storable.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Storable.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Storable.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Time/HiRes.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Time/HiRes.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Time/HiRes.pm
| Manifying 4 pod documents
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Cwd.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Cwd.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Cwd.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/Time/HiRes.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: Time/HiRes.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/Time/HiRes.pm
| *** Module name IN: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.36.1/x86_64-linux/List/Util.pm
| *** p1: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.36.1/  p5: x86_64-linux/ p7: List/Util.pm
| *** Module name OUT: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/recipe-sysroot-native/usr/lib/perl5/5.36.1/x86_64-linux/List/Util.pm
| Installing /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image/usr/lib/perl5/vendor_perl/5.36.1/IO/Socket/SSL.pm
| Installing /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image/usr/lib/perl5/vendor_perl/5.36.1/IO/Socket/SSL.pod
| Installing /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image/usr/lib/perl5/vendor_perl/5.36.1/IO/Socket/SSL/PublicSuffix.pm
| Installing /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image/usr/lib/perl5/vendor_perl/5.36.1/IO/Socket/SSL/Intercept.pm
| Installing /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image/usr/lib/perl5/vendor_perl/5.36.1/IO/Socket/SSL/Utils.pm
| Installing /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image/usr/share/man/man3/IO::Socket::SSL.3
| Installing /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image/usr/share/man/man3/IO::Socket::SSL::PublicSuffix.3
| Installing /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image/usr/share/man/man3/IO::Socket::SSL::Intercept.3
| Installing /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/image/usr/share/man/man3/IO::Socket::SSL::Utils.3
| cp: cannot stat '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/IO-Socket-SSL-2.083/certs': No such file or directory
| WARNING: exit code 1 from a shell command.
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1287 tasks of which 1274 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libio-socket-ssl-perl-2.083-r0 do_install: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/temp/run.do_install.4115382', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/temp/log.do_install.4115382
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_install) failed with exit code '1'

--===============4384065667137642203==--

