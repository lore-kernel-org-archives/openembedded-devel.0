Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0ACC10DAA
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.62973.1699041165526848112
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e9M9jsBS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K1Thf7t7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96bebddf-61ba3e4b-01ae-4761-ba50-df172ee02579-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IGSRuvbQtNa3VtHwauTtysJjLcyrzWDlBcbhWynk/1U=;
	b=e9M9jsBSvuDMmbua9O3CUGNMkHpxZUtCkAurPgS40Btv/5VyKLrrVmGmcV2A+biO
	BHavdhomRYqrkwpEqVx0pgqn25Z7gAmfKAMghLu5+S353056zltbGnBFXZJ20QcQQlD
	1oyl7XL7dncwZ7CfHBwtwAspIA4ho9yUMMCi5yZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IGSRuvbQtNa3VtHwauTtysJjLcyrzWDlBcbhWynk/1U=;
	b=K1Thf7t7If6Ruswuojuzt2Y5VL+AGTlcAX6tJyw7Jlmermfk4pjKuOhJXVG/88Ie
	fZu+iFcNMSWcncsGNuHMmkThn9kJzU4OhbxnL94eaEwpbU5dg/fCtWWbyK97VvWR1BI
	UaeGciNcSG0yom4vcJrbVrOjREwPhwogjBDZvbPM=
Content-Type: multipart/mixed; boundary="===============1551244295106655582=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] cairomm: upgrading to 1.18.0 FAILED
Message-ID: <0101018b96bebddf-61ba3e4b-01ae-4761-ba50-df172ee02579-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:44 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105883

--===============1551244295106655582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cairomm* to *1.18.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cairomm-upgrade-1.14.3-1.18.0.patch
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
From 3028678206b9bcbea3d97805afdeec37a5722219 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 11:44:48 +0000
Subject: [PATCH] cairomm: upgrade 1.14.3 -> 1.18.0

---
 .../cairo/{cairomm_1.14.3.bb => cairomm_1.18.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cairo/{cairomm_1.14.3.bb => cairomm_1.18.0.bb} (81%)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb
similarity index 81%
rename from meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
rename to meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb
index 8123509f4..1d0c477da 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb
@@ -9,7 +9,7 @@ inherit gnomebase
 DEPENDS += "boost cairo libsigc++-2.0"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0d37e067c5c4ca7808b7ceddabfe1932c5bd2a750ad64fb321e1213536297e78"
+SRC_URI[sha256sum] = "b81255394e3ea8e8aa887276d22afa8985fc8daef60692eb2407d23049f03cfb"
 
 FILES:${PN}-doc += "${datadir}/devhelp"
 FILES:${PN}-dev += "${libdir}/cairomm-*/"
-- 
2.39.2


--===============1551244295106655582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4900 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:e4b12b9b471f88a12a53d11ef1b25114a6f50fc2"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 417 Local 408 Mirrors 0 Missed 9 Current 346 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 349 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 356 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 358 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 368 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/boost/boost_1.83.0.bb:do_create_spdx_setscene)
NOTE: Running task 266 of 2094 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_write_config)
NOTE: recipe libsigc++-2.0-2.10.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairomm-1.18.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe cairomm-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe boost-1.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairomm-1.18.0-r0: task do_write_config: Started
NOTE: recipe cairomm-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe cairomm-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairomm-1.18.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 446 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsigc++-2.0-2.10.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe boost-1.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe cairomm-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairomm-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 546 of 2094 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairomm-1.18.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe cairomm-1.18.0-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 718 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 720 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1353 of 2094 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_unpack)
NOTE: recipe cairomm-1.18.0-r0: task do_unpack: Started
NOTE: recipe cairomm-1.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1396 of 2094 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_patch)
NOTE: recipe cairomm-1.18.0-r0: task do_patch: Started
NOTE: recipe cairomm-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1998 of 2094 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2081 of 2094 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_collect_spdx_deps)
NOTE: recipe cairomm-1.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairomm-1.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe cairomm-1.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cairomm-1.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2082 of 2094 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_configure)
NOTE: recipe cairomm-1.18.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/boost/boost_1.83.0.bb:do_populate_sysroot', 'virtual:native:
 /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libsigc++-2.0', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'cairo', 'boost', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gmp-native', 'gnu-config-native', 'zlib-native', 'libtool-native', 'texinfo-dummy-native', 'binutils-cross-x86_64', 'flex-native', 'zstd-native', 'mpfr-native', 'libmpc-native', 'linux-libc-headers', 'gettext-minimal-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-build-native', 'python3-installer-native', 'libxrender', 'libxcb', 'fontconfig', 'zlib', 'libx11', 'libxext', 'mesa', 'libpng', 'glib-2.0', 'opkg-utils', 'libsm', 'pixman', 'libgcc', 'icu', 'python3', 'bzip2', 'libffi-native', 'libtirpc-native', 'gdbm-native', 'libedit-native', 'openssl-native', 'libnsl2-native', 'bzip2-native', 'ncurses-native', 'sqlite3-native', 'util-linux-libuuid-native', 'expat-native', 'glib-2.0-native', 'mm-
 common', 're2c-native', 'attr-native', 'm4-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'xorgproto', 'util-macros', 'libpthread-stubs', 'xcb-proto', 'libxdmcp', 'libxau', 'util-linux', 'freetype', 'expat', 'xtrans', 'libxfixes', 'libxxf86vm', 'libxdamage', 'libdrm', 'xrandr', 'wayland-protocols', 'vulkan-headers', 'libxshmfence', 'vulkan-loader', 'wayland', 'libpcre2', 'bash-completion', 'libffi', 'libice', 'libtirpc', 'xz', 'libxcrypt', 'libnsl2', 'ncurses', 'gdbm', 'util-linux-libuuid', 'openssl', 'sqlite3', 'libedit', 'perl-native', 'cmake-native', 'gettext-native', 'util-linux-native', 'libpcre2-native', 'unzip-native', 'libpam', 'libcap-ng', 'libpciaccess', 'libxrandr', 'libxml2', 'make-native', 'libcap-ng-native', 'cracklib']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson ...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/cairomm-1.18.0
| Build dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/build
| Build type: cross build
| Project name: cairomm
| Project version: 1.18.0
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-g++ (GCC) 13.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/recipe-sysroot ld.bfd 2.41.0.20230926
| C++ compiler for the build machine: g++ (gcc 12.2.0 "g++ (GCC) 12.2.0")
| C++ linker for the build machine: g++ ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Program python3 found: YES 3.11.5 (/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/recipe-sysroot-native/usr/bin/python3-native/python3)
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Found CMake: NO
| Run-time dependency sigc++-3.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency sigc++-3.0
| 
| ../cairomm-1.18.0/meson.build:109:13: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/temp/run.do_configure.4012616:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/temp/run.do_configure.4012616, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/temp/run.do_configure.4012616, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/temp/run.do_configure.4012616, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/temp/run.do_configure.4012616, line 186
NOTE: recipe cairomm-1.18.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2082 tasks of which 2075 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103114427.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103114427.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cairomm-1.18.0-r0 do_configure: meson failed
ERROR: cairomm-1.18.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/temp/run.do_configure.4012616', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/cairomm/1.18.0/temp/log.do_configure.4012616
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.18.0.bb:do_configure) failed with exit code '1'

--===============1551244295106655582==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cairomm-upgrade-1.14.3-1.18.0.patch"

RnJvbSAzMDI4Njc4MjA2YjliY2JlYTNkOTc4MDVhZmRlZWMzN2E1NzIyMjE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMTo0NDo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNh
aXJvbW06IHVwZ3JhZGUgMS4xNC4zIC0+IDEuMTguMAoKLS0tCiAuLi4vY2Fpcm8ve2NhaXJvbW1f
MS4xNC4zLmJiID0+IGNhaXJvbW1fMS4xOC4wLmJifSAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLW9l
L3JlY2lwZXMtZ3JhcGhpY3MvY2Fpcm8ve2NhaXJvbW1fMS4xNC4zLmJiID0+IGNhaXJvbW1fMS4x
OC4wLmJifSAoODElKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9jYWly
by9jYWlyb21tXzEuMTQuMy5iYiBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9jYWlyby9jYWly
b21tXzEuMTguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhLW9lL3Jl
Y2lwZXMtZ3JhcGhpY3MvY2Fpcm8vY2Fpcm9tbV8xLjE0LjMuYmIKcmVuYW1lIHRvIG1ldGEtb2Uv
cmVjaXBlcy1ncmFwaGljcy9jYWlyby9jYWlyb21tXzEuMTguMC5iYgppbmRleCA4MTIzNTA5ZjQu
LjFkMGM0NzdkYSAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL2NhaXJvL2Nh
aXJvbW1fMS4xNC4zLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9jYWlyby9jYWly
b21tXzEuMTguMC5iYgpAQCAtOSw3ICs5LDcgQEAgaW5oZXJpdCBnbm9tZWJhc2UKIERFUEVORFMg
Kz0gImJvb3N0IGNhaXJvIGxpYnNpZ2MrKy0yLjAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cu
Y2Fpcm9ncmFwaGljcy5vcmcvcmVsZWFzZXMvJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjBkMzdlMDY3YzVjNGNhNzgwOGI3Y2VkZGFiZmUxOTMyYzViZDJhNzUwYWQ2NGZiMzIx
ZTEyMTM1MzYyOTdlNzgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjgxMjU1Mzk0ZTNlYThlOGFh
ODg3Mjc2ZDIyYWZhODk4NWZjOGRhZWY2MDY5MmViMjQwN2QyMzA0OWYwM2NmYiIKIAogRklMRVM6
JHtQTn0tZG9jICs9ICIke2RhdGFkaXJ9L2RldmhlbHAiCiBGSUxFUzoke1BOfS1kZXYgKz0gIiR7
bGliZGlyfS9jYWlyb21tLSovIgotLSAKMi4zOS4yCgo=

--===============1551244295106655582==--

