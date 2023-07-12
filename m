Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69281EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1039.1689139907830323701
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@moto-timo.dev header.s=gm1 header.b=MaeBq7cY;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19105C0004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139906;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=2U8T8TvRcaE9QtoyaGvvMpYCS2RDqTevtXbsl6kDHsw=;
	b=MaeBq7cYEuVP09uf/L/AZ26hBAdsHA++ir0oQxzkqskmf/usO8iQ2I0KXcC320a3sI2xhb
	QZFhhM1OItI+vtqRgI94dRvHKqb37vN4G2cWMTHueMfGmNz3zVbMLL5H9vCGPcKIzvm2As
	SB/QPYoswgK+UeL/84Zn+VovjIgOqgIlpUlk6aU4YBEmX7W+IVnDK9AeMbLqRekDjYXjuk
	bm6BM34CKV8rgZwHQYDCyN4TIAkmmvvlWIcNb7oYvQk4+z/7+ElBCmc4OpJKlnZIvbRSsY
	5hPaueQYyc3HuWbO0E/3X/QMDuLEvOTvV8VnwEbz5j4YSWWAFqzujWPOkYyt6Q==
Content-Type: multipart/mixed; boundary="===============4615629953674754656=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-snagboot: upgrading to 1.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103808
Message-Id: <20230712053150.69281EB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:50 +0000 (UTC)

--===============4615629953674754656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-snagboot* to *1.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-snagboot-upgrade-1.0-1.1.patch
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
From 1b0b7986bdac344ef33eb9301b8f3c02befff8d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:52:06 -0500
Subject: [PATCH] python3-snagboot: upgrade 1.0 -> 1.1

---
 .../python/{python3-snagboot_1.0.bb => python3-snagboot_1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_1.0.bb => python3-snagboot_1.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_1.0.bb b/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_1.0.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
index 1853596b4..873fe8069 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "c2d21cadddecfd97dd62a8b66b6f88bd56272627b9b71272e9dda6f868ee8715"
+SRC_URI[sha256sum] = "40b045e6225f3544080558e4bd604d116d4cffceea80cb84307579d914e4e498"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


--===============4615629953674754656==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-snagboot-upgrade-1.0-1.1.patch"

From 1b0b7986bdac344ef33eb9301b8f3c02befff8d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:52:06 -0500
Subject: [PATCH] python3-snagboot: upgrade 1.0 -> 1.1

---
 .../python/{python3-snagboot_1.0.bb => python3-snagboot_1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_1.0.bb => python3-snagboot_1.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_1.0.bb b/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_1.0.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
index 1853596b4..873fe8069 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "c2d21cadddecfd97dd62a8b66b6f88bd56272627b9b71272e9dda6f868ee8715"
+SRC_URI[sha256sum] = "40b045e6225f3544080558e4bd604d116d4cffceea80cb84307579d914e4e498"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


--===============4615629953674754656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12831 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:b113a00761f4f665341b263f3ec3329c44403a25"
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
meta-perl            = "tmp-auh-upgrades:b113a00761f4f665341b263f3ec3329c44403a25"
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
meta-perl            = "tmp-auh-upgrades:b113a00761f4f665341b263f3ec3329c44403a25"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 279 Local 10 Mirrors 261 Missed 8 Current 201 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 208 of 480 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 210 of 480 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-snagboot-1.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-snagboot-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-snagboot-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-snagboot-1.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1194 of 1611 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_fetch)
NOTE: recipe python3-snagboot-1.1-r0: task do_fetch: Started
NOTE: recipe python3-snagboot-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1595 of 1611 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_unpack)
NOTE: Running task 1596 of 1611 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snagboot-1.1-r0: task do_unpack: Started
NOTE: recipe python3-snagboot-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snagboot-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1597 of 1611 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_patch)
NOTE: Running task 1598 of 1611 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-snagboot-1.1-r0: task do_patch: Started
NOTE: recipe python3-snagboot-1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-snagboot-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snagboot-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-snagboot-1.1-r0: task do_patch: Succeeded
NOTE: Running task 1600 of 1611 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_configure)
NOTE: recipe python3-snagboot-1.1-r0: task do_configure: Started
NOTE: recipe python3-snagboot-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1602 of 1611 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_compile)
NOTE: recipe python3-snagboot-1.1-r0: task do_compile: Started
NOTE: recipe python3-snagboot-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1603 of 1611 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_install)
NOTE: recipe python3-snagboot-1.1-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/auh/Projects/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot', '/home/auh/Projects/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/python/python3-build_0.10.0.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/p
 ython/python3-setuptools_67.6.1.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_populate_sysroot', 'virtual:native:/home/auh/Projects/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'python3', 'quilt-native', 'patch-native', 'pseudo-native', 'python3-build-native', 'python3-installer-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-flit-core-native', 'libxcrypt', 'util-linux-libuuid', 'opkg-utils', 'ncurses', 'bzip2', 'sqlite3', 'zlib', 'libnsl2', 'libedit', 'expat', 'libffi', 'gdbm', 'openssl', 'libtirpc', 'xz', 'libtool-native', 'attr-native', 'linux-libc-headers', 'libgcc', 'zlib-native', 'xz-native', 'libtirpc-native', 'libnsl2-native', 'sqlite3-native', 'expat-native', 'libedit-native', 'ncurses-native', 'libffi-native', 'openssl-native', 'util-linux-libuuid-native', 'gdbm-native', 'bzip2-native', 'libmpc-native', 'flex-native', 'zstd-native', 'gmp-native', 'texinfo-dummy-native', 'mpfr-native', 'binutils-cross-x86_64', 'gnu-config-native', 'unzip-native', 'gettext-m
 inimal-native', 'cmake-native', 'perl-native', 'm4-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| install: cannot stat '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-snagboot/1.1-r0/snagboot-1.1/src/snagrecover/80-snagboot.rules': No such file or directory
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-snagboot-1.1-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1603 tasks of which 1595 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-snagboot-1.1-r0 do_install: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-snagboot/1.1-r0/temp/run.do_install.1583549', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-snagboot/1.1-r0/temp/log.do_install.1583549
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb:do_install) failed with exit code '1'

--===============4615629953674754656==--

