Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC71C04E83
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.4716.1699074743266763813
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XIbFsE04;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dj4HQWAk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b98bf1880-7e55df10-1cc1-4ab9-9827-67239d085a67-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tfHUVS59xDZWCUMgxouL0RxRJKJrCv8ojxyg/tEgJqE=;
	b=XIbFsE04Uw+t7hfG2iq+O66hVG16L9YdjUz+hZ1Mj/nwktu8A2cHJs1XZNSd+kCL
	tyor8fNiI4czogJ0Z+fE5brx/JEqeS3cm/wdZJDmOXMCZicr8cAX3zxmk44XHq+7WAd
	WS0kwNu7NFJ4fMzSwsPXYovBEDYor8WHJvT2MHfk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tfHUVS59xDZWCUMgxouL0RxRJKJrCv8ojxyg/tEgJqE=;
	b=dj4HQWAk2yjhZ4CuN/C/G5grv47dJw7MRenF35OBAAk0VUQaLj11e3eRsg4gKkLi
	WSGdHEde/fUyjpDLl7dTsEeszoJVS8J2ZL9QgjlijJXhL8N8rSW9SKY9NbPTsqQUbJq
	j8ANWB5mJfjhbtJxcZXyHFJe1asjIE8vPqkeOnFQ=
Content-Type: multipart/mixed; boundary="===============6544052969154430910=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] webp-pixbuf-loader: upgrading to 0.2.5 FAILED
Message-ID: <0101018b98bf1880-7e55df10-1cc1-4ab9-9827-67239d085a67-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106294

--===============6544052969154430910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webp-pixbuf-loader* to *0.2.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-webp-pixbuf-loader-upgrade-0.2.4-0.2.5.patch
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
From 880d7fa43cabc96f8804b66bde41d5edf0e7bdda Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 05:05:14 +0000
Subject: [PATCH] webp-pixbuf-loader: upgrade 0.2.4 -> 0.2.5

---
 ...{webp-pixbuf-loader_0.2.4.bb => webp-pixbuf-loader_0.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/webp-pixbuf-loader/{webp-pixbuf-loader_0.2.4.bb => webp-pixbuf-loader_0.2.5.bb} (91%)

diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.4.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb
similarity index 91%
rename from meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.4.bb
rename to meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb
index 6f9156ded..eef25d6e1 100644
--- a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.4.bb
+++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb
@@ -15,7 +15,7 @@ EXTRA_OEMESON = "-Dupdate_cache=true"
 SRC_URI = "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=https;branch=mainline"
 
 S = "${WORKDIR}/git"
-SRCREV = "a35014104a226265e44fe30fcdb4df9305af3466"
+SRCREV = "f7253133ba0902afbe65bd2482f3b9e1a84b58fb"
 
 FILES:${PN} = " \
     ${datadir}/thumbnailers/webp-pixbuf.thumbnailer \
-- 
2.39.2


--===============6544052969154430910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4912 entries from dependency cache.
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
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:45fe6b92fafcf344297961adfcc5eda7913ee340"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 286 Local 277 Mirrors 0 Missed 9 Current 297 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 306 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_populate_lic_setscene)
NOTE: Running setscene task 308 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running task 371 of 1659 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_write_config)
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_write_config: Succeeded
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 421 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 507 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 483 of 1659 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_fetch: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 486 of 1659 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 550 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 1215 of 1659 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_patch)
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_patch: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 583 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1597 of 1659 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1646 of 1659 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_collect_spdx_deps)
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1647 of 1659 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_configure)
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/po
 kybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gdk-pixbuf', 'libwebp', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 're2c-native', 'glib-2.0-native', 'zlib-native', 'xz-native', 'gdbm-native', 'libedit-native', 'libtool-native', 'util-linux-libuuid-native', 'libnsl2-native', 'ncurses-native', 'expat-native', 'bzip2-native', 'sqlite3-native', 'openssl-native', 'libtirpc-native', 'libffi-native', 'gmp-native', 'libmpc-native', 'linux-libc-headers', 'zstd-native', 'mpfr-native', 'gnu-config-native', 'binutils-cross-x86_64', 'texinfo-dummy-native', 'flex-native', 'libgcc', 'attr-native', 'python3-build-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-wheel-native', 'gobject-introspection', 'libjpeg-turbo', 'libpng', 'glib-2.0', 'shared-mime-info', 'gettext-minimal-native', 'libpcre2-native', 'util-linux-native', 'gettext-native',
  'cmake-native', 'perl-native', 'm4-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-flit-core-native', 'libffi', 'zlib', 'opkg-utils', 'python3', 'util-linux', 'libpcre2', 'bash-completion', 'libxml2', 'libcap-ng-native', 'make-native', 'unzip-native', 'sqlite3', 'expat', 'xz', 'openssl', 'gdbm', 'libnsl2', 'libtirpc', 'libedit', 'ncurses', 'bzip2', 'libxcrypt', 'util-linux-libuuid', 'libpam', 'libcap-ng', 'cracklib']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dupdate_cache=true ...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/git
| Build dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/build
| Build type: cross build
| Project name: webp-pixbuf-loader
| Project version: undefined
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency gio-2.0 found: YES 2.78.0
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.10
| Dependency libwebp found: NO found 1.3.2 but need: '>1.3.2'
| Found CMake: NO
| Run-time dependency libwebp found: NO
| 
| ../git/meson.build:10:7: ERROR: Dependency lookup for libwebp with method 'pkgconfig' failed: Invalid version, need 'libwebp' ['>1.3.2'] found '1.3.2'.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/temp/run.do_configure.1698264:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/temp/run.do_configure.1698264, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/temp/run.do_configure.1698264, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/temp/run.do_configure.1698264, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/temp/run.do_configure.1698264, line 186
NOTE: recipe webp-pixbuf-loader-0.2.5-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1647 tasks of which 1640 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104050452.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104050452.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: webp-pixbuf-loader-0.2.5-r0 do_configure: meson failed
ERROR: webp-pixbuf-loader-0.2.5-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/temp/run.do_configure.1698264', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/webp-pixbuf-loader/0.2.5/temp/log.do_configure.1698264
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.5.bb:do_configure) failed with exit code '1'

--===============6544052969154430910==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webp-pixbuf-loader-upgrade-0.2.4-0.2.5.patch"

RnJvbSA4ODBkN2ZhNDNjYWJjOTZmODgwNGI2NmJkZTQxZDVlZGYwZTdiZGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNTowNToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
YnAtcGl4YnVmLWxvYWRlcjogdXBncmFkZSAwLjIuNCAtPiAwLjIuNQoKLS0tCiAuLi57d2VicC1w
aXhidWYtbG9hZGVyXzAuMi40LmJiID0+IHdlYnAtcGl4YnVmLWxvYWRlcl8wLjIuNS5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhLWdub21lL3JlY2lwZXMtc3VwcG9ydC93ZWJwLXBpeGJ1Zi1sb2FkZXIve3dlYnAtcGl4
YnVmLWxvYWRlcl8wLjIuNC5iYiA9PiB3ZWJwLXBpeGJ1Zi1sb2FkZXJfMC4yLjUuYmJ9ICg5MSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS1nbm9tZS9yZWNpcGVzLXN1cHBvcnQvd2VicC1waXhidWYtbG9h
ZGVyL3dlYnAtcGl4YnVmLWxvYWRlcl8wLjIuNC5iYiBiL21ldGEtZ25vbWUvcmVjaXBlcy1zdXBw
b3J0L3dlYnAtcGl4YnVmLWxvYWRlci93ZWJwLXBpeGJ1Zi1sb2FkZXJfMC4yLjUuYmIKc2ltaWxh
cml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS1nbm9tZS9yZWNpcGVzLXN1cHBvcnQvd2Vi
cC1waXhidWYtbG9hZGVyL3dlYnAtcGl4YnVmLWxvYWRlcl8wLjIuNC5iYgpyZW5hbWUgdG8gbWV0
YS1nbm9tZS9yZWNpcGVzLXN1cHBvcnQvd2VicC1waXhidWYtbG9hZGVyL3dlYnAtcGl4YnVmLWxv
YWRlcl8wLjIuNS5iYgppbmRleCA2ZjkxNTZkZWQuLmVlZjI1ZDZlMSAxMDA2NDQKLS0tIGEvbWV0
YS1nbm9tZS9yZWNpcGVzLXN1cHBvcnQvd2VicC1waXhidWYtbG9hZGVyL3dlYnAtcGl4YnVmLWxv
YWRlcl8wLjIuNC5iYgorKysgYi9tZXRhLWdub21lL3JlY2lwZXMtc3VwcG9ydC93ZWJwLXBpeGJ1
Zi1sb2FkZXIvd2VicC1waXhidWYtbG9hZGVyXzAuMi41LmJiCkBAIC0xNSw3ICsxNSw3IEBAIEVY
VFJBX09FTUVTT04gPSAiLUR1cGRhdGVfY2FjaGU9dHJ1ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9hcnVpei93ZWJwLXBpeGJ1Zi1sb2FkZXIuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5j
aD1tYWlubGluZSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKLVNSQ1JFViA9ICJhMzUwMTQxMDRh
MjI2MjY1ZTQ0ZmUzMGZjZGI0ZGY5MzA1YWYzNDY2IgorU1JDUkVWID0gImY3MjUzMTMzYmEwOTAy
YWZiZTY1YmQyNDgyZjNiOWUxYTg0YjU4ZmIiCiAKIEZJTEVTOiR7UE59ID0gIiBcCiAgICAgJHtk
YXRhZGlyfS90aHVtYm5haWxlcnMvd2VicC1waXhidWYudGh1bWJuYWlsZXIgXAotLSAKMi4zOS4y
Cgo=

--===============6544052969154430910==--

