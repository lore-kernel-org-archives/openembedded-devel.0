Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB27AEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 07:33:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.2191.1689147202156679111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 00:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=jh1Dd2vD;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7FAA6000B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689147200;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=szdxIfwmiMN62SLhSDfVKQuYz1XHvcCbtkGfGkw06b0=;
	b=jh1Dd2vDm7l0Ingu0vYtVRRPTUemJBMOBOmEvBH46rEYVZxoWNwT4eAMI6Ch+4vM3uju3u
	3kyI+6EMeBHxjX6bdf+HI8Xbw7XGlh3ZM9IqvcsMF3aq/SWCH1HAuJY1kJdwnT1E9Iz/M3
	UERCI9JuY4JQMTnjXYROK0iD7EHtUm8waRId61/uEIk+MjfcyiXqVCOVDZCKqja81rJ1Rc
	1KkVoR1hPDPiBIBCtxXcQFoFbL1mbGbcpxPd9IqtC64Dujw2dHQrFE+5+A9u7Tx2fhQjTT
	1I/zPazFeM8vrMyOjZlRgAchjyndDr1Q7MRUhLnwm1kEkhcjzRCH7iQImMV9IQ==
Content-Type: multipart/mixed; boundary="===============1687209776213661295=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] libio-socket-ssl-perl: upgrading to 2.083 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 07:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103830
Message-Id: <20230712073330.EB27AEB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 07:33:30 +0000 (UTC)

--===============1687209776213661295==
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
From c164fd54d5d7a77250cfb0ee13e933d04b9c33de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Wed, 12 Jul 2023 02:18:02 -0500
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


--===============1687209776213661295==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libio-socket-ssl-perl-upgrade-2.078-2.083.patch"

From c164fd54d5d7a77250cfb0ee13e933d04b9c33de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Wed, 12 Jul 2023 02:18:02 -0500
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


--===============1687209776213661295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12585 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12567 targets, 310 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:3ec20e2423c72f3df68b1748e7d0aedb551a0d20"
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:3ec20e2423c72f3df68b1748e7d0aedb551a0d20"
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:3ec20e2423c72f3df68b1748e7d0aedb551a0d20"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 201 Local 2 Mirrors 191 Missed 8 Current 141 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 148 of 342 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_populate_lic_setscene)
NOTE: Running setscene task 150 of 342 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_populate_lic_setscene: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 799 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_fetch)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_fetch: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_fetch: Succeeded
NOTE: Running task 1172 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_unpack)
NOTE: Running task 1173 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_prepare_recipe_sysroot)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_unpack: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_unpack: Succeeded
NOTE: Running task 1174 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_patch)
NOTE: Running task 1175 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_collect_spdx_deps)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_collect_spdx_deps: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_patch: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_patch: Succeeded
NOTE: Running task 1177 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_configure)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_configure: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_configure: Succeeded
NOTE: Running task 1179 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_configure_ptest_base)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_configure_ptest_base: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1180 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_compile)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_compile: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_compile: Succeeded
NOTE: Running task 1181 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_compile_ptest_base)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_compile_ptest_base: Started
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1182 of 1192 (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_install)
NOTE: recipe libio-socket-ssl-perl-2.083-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/auh/Projects/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'perl', 'quilt-native', 'patch-native', 'perl-native', 'pseudo-native', 'linux-libc-headers', 'zlib', 'gdbm', 'opkg-utils', 'libxcrypt', 'zstd-native', 'texinfo-dummy-native', 'libtool-native', 'zlib-native', 'gnu-config-native', 'libmpc-native', 'flex-native', 'mpfr-native', 'xz-native', 'binutils-cross-x86_64', 'gmp-native', 'attr-native', 'libgcc', 'make-native', 'gdbm-native', 'm4-native', 'gettext-minimal-native']
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
NOTE: Tasks Summary: Attempted 1182 tasks of which 1172 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libio-socket-ssl-perl-2.083-r0 do_install: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/temp/run.do_install.1987207', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/libio-socket-ssl-perl/2.083-r0/temp/log.do_install.1987207
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb:do_install) failed with exit code '1'

--===============1687209776213661295==--

