Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1A5C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:29 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.63222.1699041739096037992
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NzF8RsUY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FODwA3X/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96c78145-a27db9d3-d3ab-431c-845b-8b7f68f72616-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4NSmrQs0AKq0db2LhNM6UU90c6goT7JSltMYw2zdebM=;
	b=NzF8RsUY3IuNuJpuqwjLHcvkvRKuGuvAKNvgQ8eHuukT+EpKlMxGHKWZMKqHZ2rD
	YVJFpTonHc0fUs48tkqRJ3jmU99XMDc9AhVcxD2o6KL8y3f3BE6QvOH5aa9Eh68ASWs
	chSg8nUSNTN6XSh57Zzmzgr/1fYJrudE9oTmuZ5Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4NSmrQs0AKq0db2LhNM6UU90c6goT7JSltMYw2zdebM=;
	b=FODwA3X/IvvzJqiRvvNP2JDzC63hE7BMYESIOgMMngo9rQ/ewYR9DEK93leScYph
	lnRBDvqy5R1wz9uvTBT9agu3NE15djr1cN3/lK5iVlHIqOze6SUYDM+PIDaiKd7XCaV
	F4BY5qpyOLNaKwm1E5Buws0FvUbrFCROq7LlyLUw=
Content-Type: multipart/mixed; boundary="===============0622425557107127651=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] pangomm: upgrading to 2.50.1 FAILED
Message-ID: <0101018b96c78145-a27db9d3-d3ab-431c-845b-8b7f68f72616-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106070

--===============0622425557107127651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pangomm* to *2.50.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pangomm-upgrade-2.46.2-2.50.1.patch
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
From 491ab0b03a6769daf0c0c225ca3bbe40393f76b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:39:39 +0000
Subject: [PATCH] pangomm: upgrade 2.46.2 -> 2.50.1

---
 .../pango/{pangomm_2.46.2.bb => pangomm_2.50.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.46.2.bb => pangomm_2.50.1.bb} (84%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb
similarity index 84%
rename from meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb
index 42074c14a..060c3b4c8 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb
@@ -12,7 +12,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "57442ab4dc043877bfe3839915731ab2d693fc6634a71614422fb530c9eaa6f4"
+SRC_URI[archive.sha256sum] = "ccc9923413e408c2bff637df663248327d72822f11e394b423e1c5652b7d9214"
 
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${libdir}/*/include/ ${libdir}/pangomm-*/"
-- 
2.39.2


--===============0622425557107127651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5022 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:d6d02994f5189ea2c3ff4e01873a08ba067ccdcd"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 417 Local 408 Mirrors 0 Missed 9 Current 392 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 397 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 398 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 407 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx_setscene)
NOTE: Running task 386 of 2214 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_write_config)
NOTE: recipe glibmm-2.66.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairomm-1.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe pangomm-2.50.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe pangomm-2.50.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pangomm-2.50.1-r0: task do_write_config: Started
NOTE: recipe glibmm-2.66.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairomm-1.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pangomm-2.50.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe pangomm-2.50.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_recipe_qa_setscene)
NOTE: recipe pangomm-2.50.1-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pangomm-2.50.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 709 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe pangomm-2.50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 584 of 2214 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pangomm-2.50.1-r0: task do_fetch: Started
NOTE: recipe pangomm-2.50.1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 758 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 765 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 767 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1404 of 2214 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_unpack)
NOTE: recipe pangomm-2.50.1-r0: task do_unpack: Started
NOTE: recipe pangomm-2.50.1-r0: task do_unpack: Succeeded
NOTE: Running task 1443 of 2214 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_patch)
NOTE: recipe pangomm-2.50.1-r0: task do_patch: Started
NOTE: recipe pangomm-2.50.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 809 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2154 of 2214 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2201 of 2214 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_collect_spdx_deps)
NOTE: recipe pangomm-2.50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pangomm-2.50.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe pangomm-2.50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pangomm-2.50.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2202 of 2214 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_configure)
NOTE: recipe pangomm-2.50.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do
 _populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended
 /xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibmm', 'mm-common', 'cairomm', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'pango', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'zlib-native', 'glib-2.0-native', 'linux-libc-headers', 'libtool-native', 'attr-native', 'texinfo-dummy-native', 'mpfr-native', 'gnu-config-native', 'flex-native', 'binutils-cross-x86_64', 'gmp-native', 'zstd-native', 'libmpc-native', 'gettext-minimal-native', 'libgcc', 'fontconfig', 'gobject-introspection', 'freetype', 'glib-2.0', 'libx11', 'libxft', 'fribidi', 'harfbuzz', 'cairo', 're2c-native', 'libsigc++-2.0', 'libnsl2-native', 'libedit-native', 'ncurses-native', 'bzip2-native', 'libffi-native', 'sqlite3-native', 'openssl-native', 'util-linux-libuuid-native', 'gdbm-native', 'expat-native', 'libtirpc-native', 'python3-build-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-wheel-
 native', 'boost', 'gettext-native', 'util-linux-native', 'libpcre2-native', 'm4-native', 'zlib', 'util-linux', 'expat', 'python3', 'libffi', 'opkg-utils', 'libpng', 'libpcre2', 'bash-completion', 'xtrans', 'xorgproto', 'libxcb', 'util-macros', 'libxrender', 'icu', 'pixman', 'mesa', 'libxext', 'libsm', 'perl-native', 'cmake-native', 'python3-packaging-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'bzip2', 'libcap-ng-native', 'util-linux-libuuid', 'libpam', 'libcap-ng', 'ncurses', 'libxcrypt', 'libedit', 'libnsl2', 'libtirpc', 'openssl', 'gdbm', 'sqlite3', 'xz', 'libpthread-stubs', 'libxdmcp', 'xcb-proto', 'libxau', 'libxxf86vm', 'libxdamage', 'libxshmfence', 'libxfixes', 'vulkan-headers', 'wayland-protocols', 'xrandr', 'libdrm', 'wayland', 'vulkan-loader', 'libice', 'make-native', 'unzip-native', 'cracklib', 'libxrandr', 'libpciaccess', 'libxml2']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson ...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/pangomm-2.50.1
| Build dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/build
| Build type: cross build
| Project name: pangomm
| Project version: 2.50.1
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-g++ (GCC) 13.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/recipe-sysroot ld.bfd 2.41.0.20230926
| C++ compiler for the build machine: g++ (gcc 12.2.0 "g++ (GCC) 12.2.0")
| C++ linker for the build machine: g++ ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/recipe-sysroot-native/usr/bin/nativepython3)
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency pangocairo found: YES 1.51.0
| Found CMake: NO
| Run-time dependency cairomm-1.16 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency cairomm-1.16
| 
| ../pangomm-2.50.1/meson.build:113:14: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/temp/run.do_configure.4130927:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/temp/run.do_configure.4130927, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/temp/run.do_configure.4130927, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/temp/run.do_configure.4130927, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/temp/run.do_configure.4130927, line 186
NOTE: recipe pangomm-2.50.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2202 tasks of which 2195 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 9 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103173901.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103173901.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: pangomm-2.50.1-r0 do_configure: meson failed
ERROR: pangomm-2.50.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/temp/run.do_configure.4130927', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pangomm/2.50.1/temp/log.do_configure.4130927
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/pango/pangomm_2.50.1.bb:do_configure) failed with exit code '1'

--===============0622425557107127651==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pangomm-upgrade-2.46.2-2.50.1.patch"

RnJvbSA0OTFhYjBiMDNhNjc2OWRhZjBjMGMyMjVjYTNiYmU0MDM5M2Y3NmIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzozOTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
bmdvbW06IHVwZ3JhZGUgMi40Ni4yIC0+IDIuNTAuMQoKLS0tCiAuLi4vcGFuZ28ve3BhbmdvbW1f
Mi40Ni4yLmJiID0+IHBhbmdvbW1fMi41MC4xLmJifSAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLW9l
L3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28ve3BhbmdvbW1fMi40Ni4yLmJiID0+IHBhbmdvbW1fMi41
MC4xLmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9wYW5n
by9wYW5nb21tXzIuNDYuMi5iYiBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5n
b21tXzIuNTAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhLW9lL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29tbV8yLjQ2LjIuYmIKcmVuYW1lIHRvIG1ldGEtb2Uv
cmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb21tXzIuNTAuMS5iYgppbmRleCA0MjA3NGMxNGEu
LjA2MGMzYjRjOCAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3Bh
bmdvbW1fMi40Ni4yLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5n
b21tXzIuNTAuMS5iYgpAQCAtMTIsNyArMTIsNyBAQCBpbmhlcml0IGdub21lYmFzZSBmZWF0dXJl
c19jaGVjawogCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVT
fSIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNTc0NDJhYjRkYzA0Mzg3N2JmZTM4
Mzk5MTU3MzFhYjJkNjkzZmM2NjM0YTcxNjE0NDIyZmI1MzBjOWVhYTZmNCIKK1NSQ19VUklbYXJj
aGl2ZS5zaGEyNTZzdW1dID0gImNjYzk5MjM0MTNlNDA4YzJiZmY2MzdkZjY2MzI0ODMyN2Q3Mjgy
MmYxMWUzOTRiNDIzZTFjNTY1MmI3ZDkyMTQiCiAKIEZJTEVTOiR7UE59ID0gIiR7bGliZGlyfS9s
aWIqLnNvLioiCiBGSUxFUzoke1BOfS1kZXYgKz0gIiR7bGliZGlyfS8qL2luY2x1ZGUvICR7bGli
ZGlyfS9wYW5nb21tLSovIgotLSAKMi4zOS4yCgo=

--===============0622425557107127651==--

