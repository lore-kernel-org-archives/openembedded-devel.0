Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7F6C001DB
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4713.1699074742715885954
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YQkBQ9OJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YaSrr8un;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b98bf1661-c32726f0-f719-4846-a220-0c64e3a8710c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ULTeTHFedPdHUMWRQ16hhw//fo/niK7a7jIFutFCjIY=;
	b=YQkBQ9OJvpkXzYR7Sl8Iyd/HsMBrL069QGj9eENKE8WQM+Ee1KJoWxkJkA5Ww6qU
	wfsxlvSzjZvB7mU7vw6cCVTKOYjKmIA76XWbcNMOZJhRwAFaRdo2kxkFloS4ez99xTx
	f0PUGKLCVUoCGFP5JEVmsACWFxvEeaGcKCZ1uz4w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ULTeTHFedPdHUMWRQ16hhw//fo/niK7a7jIFutFCjIY=;
	b=YaSrr8unE3ist2beppVYX6wDe+pKRVw7dQ3scKq/3Ok/n8oNfe8Y/Ro5upHbERuP
	rZbSJAEeBfIVkjtz1Kts/+INHmvGBwzKi6c45u0TnTzuH/Zj0e6PDFL869zDFoPl8mR
	O8w4RTck0KtnWhxpYmsa7kGBa9b+nPXvtKmViMXQ=
Content-Type: multipart/mixed; boundary="===============7350761891944440831=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libchamplain: upgrading to 0.12.21 FAILED
Message-ID: <0101018b98bf1661-c32726f0-f719-4846-a220-0c64e3a8710c-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106288

--===============7350761891944440831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libchamplain* to *0.12.21* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libchamplain-upgrade-0.12.20-0.12.21.patch
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
From a4c4a98952c5ec72ae713fc3f8747815823e79e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:42:55 +0000
Subject: [PATCH] libchamplain: upgrade 0.12.20 -> 0.12.21

---
 .../{libchamplain_0.12.20.bb => libchamplain_0.12.21.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libchamplain/{libchamplain_0.12.20.bb => libchamplain_0.12.21.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
rename to meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index 859eab916..2996718dd 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -7,7 +7,7 @@ inherit features_check gobject-introspection meson pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRCREV = "145e417f32e507b63c21ad4e915b808a6174099e"
+SRCREV = "941560af497148588783db991e8135f52a82574d"
 SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============7350761891944440831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4897 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:ed1b0105db76a9c757124e20a25aaf29cd608970"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 506 Local 497 Mirrors 0 Missed 9 Current 523 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 532 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_populate_lic_setscene)
NOTE: Running setscene task 534 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 535 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 546 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb:do_create_spdx_setscene)
NOTE: recipe libchamplain-0.12.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libchamplain-0.12.21-r0: task do_populate_lic_setscene: Started
NOTE: recipe libsoup-2.4-2.74.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe clutter-gtk-1.0-1.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libchamplain-0.12.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libchamplain-0.12.21-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 664 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-2.4-2.74.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 483 of 2803 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_write_config)
NOTE: recipe clutter-gtk-1.0-1.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-graphics/clutter/clutter-1.0_1.26.4.bb:do_create_spdx_setscene)
NOTE: recipe libchamplain-0.12.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libchamplain-0.12.21-r0: task do_write_config: Started
NOTE: recipe clutter-1.0-1.26.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libchamplain-0.12.21-r0: task do_write_config: Succeeded
NOTE: recipe libchamplain-0.12.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 499 of 2803 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_fetch)
NOTE: recipe clutter-1.0-1.26.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 678 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: recipe libchamplain-0.12.21-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libchamplain-0.12.21-r0: task do_fetch: Succeeded
NOTE: Running task 504 of 2803 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_unpack)
NOTE: recipe libchamplain-0.12.21-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe libchamplain-0.12.21-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 900 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 969 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 987 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 994 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 996 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1807 of 2803 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_patch)
NOTE: recipe libchamplain-0.12.21-r0: task do_patch: Started
NOTE: recipe libchamplain-0.12.21-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1026 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1029 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2763 of 2803 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2790 of 2803 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_collect_spdx_deps)
NOTE: recipe libchamplain-0.12.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libchamplain-0.12.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe libchamplain-0.12.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libchamplain-0.12.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2791 of 2803 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_configure)
NOTE: recipe libchamplain-0.12.21-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-graphics/clutter/clutter-1.0_1.26.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:d
 o_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig
 /pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['clutter-1.0', 'clutter-gtk-1.0', 'glib-2.0', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gdk-pixbuf', 'gobject-introspection', 'gtk+3', 'libsoup-2.4', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'gobject-introspection-native', 'bzip2-native', 'util-linux-libuuid-native', 'openssl-native', 'ncurses-native', 'libedit-native', 'libtool-native', 'expat-native', 'libffi-native', 'sqlite3-native', 'xz-native', 'gdbm-native', 'libtirpc-native', 'libnsl2-native', 'zlib-native', 'libxcomposite', 'at-spi2-core', 'libxkbcommon', 'mesa', 'libxrender', 'libxdamage', 'libxcursor', 'libx11', 'opkg-utils', 'libxi', 'libxfixes', 'pango', 'libxext', 'wayland', 'libjpeg-turbo', 'fontconfig', 'libpng', 'wayland-protocols', 'libepoxy', 'cairo', 'libxrandr', 'systemd', 'cogl-1.0', 'json-glib', 'libpsl', 'sqlite3', 'libxml2', 'mpfr-native', 'libmpc-native', 'zstd-nativ
 e', 'gmp-native', 'binutils-cross-x86_64', 'texinfo-dummy-native', 'gnu-config-native', 'flex-native', 'linux-libc-headers', 'glib-2.0-native', 'bash-completion', 'libpcre2', 'libffi', 'zlib', 'util-linux', 'libgcc', 'shared-mime-info', 'python3-setuptools-native', 'python3-build-native', 'python3-installer-native', 'python3-wheel-native', 're2c-native', 'attr-native', 'python3', 'gettext-minimal-native', 'perl-native', 'cmake-native', 'xorgproto', 'util-macros', 'libxtst', 'dbus', 'xkeyboard-config', 'libxcb', 'libdrm', 'libxxf86vm', 'expat', 'vulkan-headers', 'vulkan-loader', 'xrandr', 'libxshmfence', 'xtrans', 'fribidi', 'libxft', 'harfbuzz', 'freetype', 'pixman', 'libsm', 'shadow-sysroot', 'base-files', 'acl', 'shadow', 'update-rc.d', 'initscripts', 'kmod', 'zstd', 'shadow-native', 'libseccomp', 'base-passwd', 'libpam', 'libcap', 'icu', 'm4-native', 'util-linux-native', 'gettext-native', 'libpcre2-native', 'bzip2', 'ncurses', 'libxcrypt', 'libcap-ng', 'util-linux-libuuid', 'pyth
 on3-packaging-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'libnsl2', 'libedit', 'openssl', 'gdbm', 'libtirpc', 'xz', 'make-native', 'libxdmcp', 'xcb-proto', 'libpthread-stubs', 'libxau', 'libpciaccess', 'libice', 'attr', 'cracklib', 'libcap-ng-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=true ...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/git
| Build dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/build
| Build type: cross build
| Project name: libchamplain
| Project version: 0.12.21
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Library m found: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency glib-2.0 found: YES 2.78.0
| Run-time dependency gobject-2.0 found: YES 2.78.0
| Run-time dependency gio-2.0 found: YES 2.78.0
| Run-time dependency gdk-3.0 found: YES 3.24.38
| Run-time dependency clutter-1.0 found: YES 1.26.4
| Run-time dependency cairo found: YES 1.16.0
| Run-time dependency sqlite3 found: YES 3.43.2
| Found CMake: NO
| Run-time dependency libsoup-3.0 found: NO (tried pkgconfig)
| 
| ../git/meson.build:75:16: ERROR: Dependency "libsoup-3.0" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/temp/run.do_configure.1505091:178 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/temp/run.do_configure.1505091, line 178
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/temp/run.do_configure.1505091, line 167
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/temp/run.do_configure.1505091, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/temp/run.do_configure.1505091, line 191
NOTE: recipe libchamplain-0.12.21-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2791 tasks of which 2784 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104044230.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104044230.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libchamplain-0.12.21-r0 do_configure: meson failed
ERROR: libchamplain-0.12.21-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/temp/run.do_configure.1505091', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libchamplain/0.12.21/temp/log.do_configure.1505091
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb:do_configure) failed with exit code '1'

--===============7350761891944440831==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libchamplain-upgrade-0.12.20-0.12.21.patch"

RnJvbSBhNGM0YTk4OTUyYzVlYzcyYWU3MTNmYzNmODc0NzgxNTgyM2U3OWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDo0Mjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNoYW1wbGFpbjogdXBncmFkZSAwLjEyLjIwIC0+IDAuMTIuMjEKCi0tLQogLi4uL3tsaWJjaGFt
cGxhaW5fMC4xMi4yMC5iYiA9PiBsaWJjaGFtcGxhaW5fMC4xMi4yMS5iYn0gICAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2xpYmNoYW1wbGFpbi97bGliY2hhbXBsYWluXzAuMTIu
MjAuYmIgPT4gbGliY2hhbXBsYWluXzAuMTIuMjEuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS1nbm9tZS9yZWNpcGVzLWdub21lL2xpYmNoYW1wbGFpbi9saWJjaGFtcGxhaW5fMC4xMi4yMC5i
YiBiL21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9saWJjaGFtcGxhaW4vbGliY2hhbXBsYWluXzAu
MTIuMjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS1nbm9tZS9yZWNp
cGVzLWdub21lL2xpYmNoYW1wbGFpbi9saWJjaGFtcGxhaW5fMC4xMi4yMC5iYgpyZW5hbWUgdG8g
bWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2xpYmNoYW1wbGFpbi9saWJjaGFtcGxhaW5fMC4xMi4y
MS5iYgppbmRleCA4NTllYWI5MTYuLjI5OTY3MThkZCAxMDA2NDQKLS0tIGEvbWV0YS1nbm9tZS9y
ZWNpcGVzLWdub21lL2xpYmNoYW1wbGFpbi9saWJjaGFtcGxhaW5fMC4xMi4yMC5iYgorKysgYi9t
ZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvbGliY2hhbXBsYWluL2xpYmNoYW1wbGFpbl8wLjEyLjIx
LmJiCkBAIC03LDcgKzcsNyBAQCBpbmhlcml0IGZlYXR1cmVzX2NoZWNrIGdvYmplY3QtaW50cm9z
cGVjdGlvbiBtZXNvbiBwa2djb25maWcKIAogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIm9w
ZW5nbCIKIAotU1JDUkVWID0gIjE0NWU0MTdmMzJlNTA3YjYzYzIxYWQ0ZTkxNWI4MDhhNjE3NDA5
OWUiCitTUkNSRVYgPSAiOTQxNTYwYWY0OTcxNDg1ODg3ODNkYjk5MWU4MTM1ZjUyYTgyNTc0ZCIK
IFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nbm9tZS9saWJjaGFtcGxhaW4uZ2l0O2JyYW5j
aD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjM5
LjIKCg==

--===============7350761891944440831==--

