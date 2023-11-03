Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5FCC05021
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.63866.1699041165904062429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vi+KVBIW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SDkagwxs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b96bec674-97da410b-4ae5-4b5e-952c-cb1ef96c19ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vrDhM3iNNxxEQxcgc8gNhdPKawUUvmdNQqbM5wJemTQ=;
	b=Vi+KVBIWFIUNqhKx6r2miU5POk4JKYuYb1Syw67fCHiOQM/qPCvTSZk7orBi69v0
	ZEkgJpWQOATq9y69C+xhEGQcKtU3Pe/d55kfAB3Rc2rFT0h6Ofy5+kSjZN66jhajDul
	4EBi8TbTUwBrymwj1A2hhklc8tbrS2HXDJUehjtE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vrDhM3iNNxxEQxcgc8gNhdPKawUUvmdNQqbM5wJemTQ=;
	b=SDkagwxsxwkKI3L4fkltYboHZl1bgYjDickMsN0kCtghE4D7mwrgZMbESmTJ5X5o
	wNefPdufDqanCcy7zOJkylHM/ZdyLd+GLaP2sJHG31awF6HS7j+TFqQWQoASBacIrgW
	cgrXu9ryMTWr7Junp/cbaHFy2MrJ/40IhYsWPwjc=
Content-Type: multipart/mixed; boundary="===============3440338844020613393=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] glibmm: upgrading to 2.78.0 FAILED
Message-ID: <0101018b96bec674-97da410b-4ae5-4b5e-952c-cb1ef96c19ec-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105922

--===============3440338844020613393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibmm* to *2.78.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glibmm-upgrade-2.66.2-2.78.0.patch
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
From 72fa15d1d6cd55b115d63092dae2d663c050988f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 12:41:10 +0000
Subject: [PATCH] glibmm: upgrade 2.66.2 -> 2.78.0

---
 .../glib-2.0/{glibmm_2.66.2.bb => glibmm_2.78.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.66.2.bb => glibmm_2.78.0.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb
index a6dc8ff20..b42a6ffd1 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb
@@ -13,7 +13,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "b2a4cd7b9ae987794cbb5a1becc10cecb65182b9bb841868625d6bbb123edb1d"
+SRC_URI[archive.sha256sum] = "5d2e872564996f02a06d8bbac3677e7c394af8b00dd1526aebd47af842a3ef50"
 
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
-- 
2.39.2


--===============3440338844020613393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4940 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:c962718a798f2219ffe95a8ad9f42ca3d88befef"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 347 Local 338 Mirrors 0 Missed 9 Current 329 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 340 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 351 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: Running task 404 of 1911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_write_config)
NOTE: recipe libsigc++-2.0-2.10.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibmm-2.78.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe glibmm-2.78.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibmm-2.78.0-r0: task do_write_config: Started
NOTE: recipe glibmm-2.78.0-r0: task do_write_config: Succeeded
NOTE: recipe libsigc++-2.0-2.10.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibmm-2.78.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 540 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb:do_create_spdx_setscene)
NOTE: recipe glibmm-2.78.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 541 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 574 of 676 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe mm-common-1.0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibmm-2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 596 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe glibmm-2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mm-common-1.0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 501 of 1911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibmm-2.78.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibmm-2.78.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 631 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 633 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1200 of 1911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_unpack)
NOTE: recipe glibmm-2.78.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe glibmm-2.78.0-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 1911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibmm-2.78.0-r0: task do_patch: Started
NOTE: recipe glibmm-2.78.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 676 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1744 of 1911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1891 of 1911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_collect_spdx_deps)
NOTE: recipe glibmm-2.78.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibmm-2.78.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibmm-2.78.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibmm-2.78.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1899 of 1911 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_configure)
NOTE: recipe glibmm-2.78.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate
 _sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-
 extended/xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libsigc++-2.0', 'mm-common', 'glib-2.0', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'libgcc', 'linux-libc-headers', 'libtool-native', 'gettext-minimal-native', 'zlib-native', 'python3-wheel-native', 'python3-build-native', 'python3-setuptools-native', 'python3-installer-native', 'libedit-native', 'openssl-native', 'ncurses-native', 'libtirpc-native', 'util-linux-libuuid-native', 'gdbm-native', 'bzip2-native', 'sqlite3-native', 'expat-native', 'libnsl2-native', 'libffi-native', 're2c-native', 'attr-native', 'mpfr-native', 'texinfo-dummy-native', 'flex-native', 'gnu-config-native', 'zstd-native', 'gmp-native', 'binutils-cross-x86_64', 'libmpc-native', 'libpcre2-native', 'gettext-native', 'util-linux-native', 'bash-completion', 'zlib', 'libpcre2', 'libffi', 'util-linux', 'py
 thon3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'perl-native', 'cmake-native', 'm4-native', 'libcap-ng-native', 'bzip2', 'opkg-utils', 'util-linux-libuuid', 'libcap-ng', 'libpam', 'libxcrypt', 'ncurses', 'unzip-native', 'make-native', 'cracklib']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson --cross-file=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/meson-glibmm.cross -Dmaintainer-mode=false ...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/glibmm-2.78.0
| Build dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/build
| Build type: cross build
| Project name: glibmm
| Project version: 2.78.0
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-g++ (GCC) 13.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/recipe-sysroot ld.bfd 2.41.0.20230926
| C++ compiler for the build machine: g++ (gcc 12.2.0 "g++ (GCC) 12.2.0")
| C++ linker for the build machine: g++ ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Program python3 found: YES 3.11.5 (/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/recipe-sysroot-native/usr/bin/python3-native/python3)
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Found CMake: NO
| Run-time dependency sigc++-3.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency sigc++-3.0
| 
| ../glibmm-2.78.0/meson.build:112:13: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/temp/run.do_configure.204870:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/temp/run.do_configure.204870, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/temp/run.do_configure.204870, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/temp/run.do_configure.204870, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/temp/run.do_configure.204870, line 186
NOTE: recipe glibmm-2.78.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1899 tasks of which 1892 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103124049.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103124049.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: glibmm-2.78.0-r0 do_configure: meson failed
ERROR: glibmm-2.78.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/temp/run.do_configure.204870', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/glibmm/2.78.0/temp/log.do_configure.204870
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.78.0.bb:do_configure) failed with exit code '1'

--===============3440338844020613393==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glibmm-upgrade-2.66.2-2.78.0.patch"

RnJvbSA3MmZhMTVkMWQ2Y2Q1NWIxMTVkNjMwOTJkYWUyZDY2M2MwNTA5ODhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMjo0MToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWJtbTogdXBncmFkZSAyLjY2LjIgLT4gMi43OC4wCgotLS0KIC4uLi9nbGliLTIuMC97Z2xpYm1t
XzIuNjYuMi5iYiA9PiBnbGlibW1fMi43OC4wLmJifSAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEtb2Uv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGlibW1fMi42Ni4yLmJiID0+IGdsaWJtbV8yLjc4LjAu
YmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xp
Ym1tXzIuNjYuMi5iYiBiL21ldGEtb2UvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWJtbV8yLjc4
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYm1tXzIuNjYuMi5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYm1tXzIuNzguMC5iYgppbmRleCBhNmRjOGZmMjAuLmI0MmE2ZmZkMSAx
MDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYm1tXzIuNjYuMi5i
YgorKysgYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGlibW1fMi43OC4wLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIGluaGVyaXQgZ25vbWViYXNlCiAKIFNIUlRfVkVSID0gIiR7QGQuZ2V0
VmFyKCdQVicpLnNwbGl0KCcuJylbMF19LiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMV19
IgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJiMmE0Y2Q3YjlhZTk4Nzc5NGNiYjVh
MWJlY2MxMGNlY2I2NTE4MmI5YmI4NDE4Njg2MjVkNmJiYjEyM2VkYjFkIgorU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiNWQyZTg3MjU2NDk5NmYwMmEwNmQ4YmJhYzM2NzdlN2MzOTRhZjhi
MDBkZDE1MjZhZWJkNDdhZjg0MmEzZWY1MCIKIAogRklMRVM6JHtQTn0gPSAiJHtsaWJkaXJ9L2xp
Yiouc28uKiIKIEZJTEVTOiR7UE59LWRldiArPSAiJHtkYXRhZGlyfS9nbGlibW0tKiAke2xpYmRp
cn0vZ2xpYm1tLTIuNC9pbmNsdWRlLyAke2xpYmRpcn0vZ2xpYm1tLTIuNC9wcm9jLyAke2xpYmRp
cn0vZ2lvbW0tMi40L2luY2x1ZGUvIgotLSAKMi4zOS4yCgo=

--===============3440338844020613393==--

