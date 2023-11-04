Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67B8C41535
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4518.1699074743213456211
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=W/BhFKz2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OdSK7zQm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b98bf18be-50eb8a3d-8df2-4f3d-a22b-459bd5499fee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lSksBj8zgph1iZY5q8w0ScYuv4bGRvte+qO1vLRqWOs=;
	b=W/BhFKz2wMKSvYN6WoNxCoVnSZwTSOCujw99ztuNA43wXBXG5RNYt2PABll8UV6m
	MKYQVIFMEnQv8TdZ3yPi6D9K1LoDjtWocUrFDC/7TTjvRmjz6I/go7TuusND34Ytv5c
	12pFXdnC0WSwQxTkYgH9G5JcgSk/fEV0lRo+6hJU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lSksBj8zgph1iZY5q8w0ScYuv4bGRvte+qO1vLRqWOs=;
	b=OdSK7zQmNnALNq+bCzeEb7fxcfZoF07kQTRf9EU45EhnnkUYvMzsR9nynzWxp9qR
	Mhf27xrjnZoAyfZsURTSbsxmO050X1UmMVUSROCNOfJdJZIN9cLtzclypYlhKlconOs
	VBIpq1Lu7dy17Vg094GrOduL8HFgU6gKpZIcw/8M=
Content-Type: multipart/mixed; boundary="===============3759649494424665319=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] rest: upgrading to 0.9.1 FAILED
Message-ID: <0101018b98bf18be-50eb8a3d-8df2-4f3d-a22b-459bd5499fee-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106292

--===============3759649494424665319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rest* to *0.9.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-rest-upgrade-0.9.0-0.9.1.patch
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
From 14c33e6a903808a9b5bd7eb365c35be12d9555a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:58:28 +0000
Subject: [PATCH] rest: upgrade 0.9.0 -> 0.9.1

---
 meta-gnome/recipes-gnome/rest/{rest_0.9.0.bb => rest_0.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/rest/{rest_0.9.0.bb => rest_0.9.1.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.0.bb b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/rest/rest_0.9.0.bb
rename to meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
index 2256a1899..329b411a8 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.0.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -22,4 +22,4 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
 PACKAGECONFIG[soup2] = "-Dsoup2=true,,libsoup-2.4"
 PACKAGECONFIG[soup3] = "-Dsoup2=false,,libsoup-3.0"
 
-SRC_URI[archive.sha256sum] = "85b2bc9341128139539b53ee53f0533310bc96392fd645863a040410b81ebe66"
+SRC_URI[archive.sha256sum] = "9266a5c10ece383e193dfb7ffb07b509cc1f51521ab8dad76af96ed14212c2e3"
-- 
2.39.2


--===============3759649494424665319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4908 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:d9acee322de5d36ea3dd6cd3f82a22f1f7b30205"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 282 Local 273 Mirrors 0 Missed 9 Current 314 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 323 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 325 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 334 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 338 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_create_spdx_setscene)
NOTE: Running task 406 of 1698 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_write_config)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe rest-0.9.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe rest-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe rest-0.9.1-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe rest-0.9.1-r0: task do_write_config: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rest-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rest-0.9.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 448 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe rest-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rest-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 437 of 1698 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_fetch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe rest-0.9.1-r0: task do_fetch: Started
NOTE: recipe rest-0.9.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 536 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 554 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1205 of 1698 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_unpack)
NOTE: recipe rest-0.9.1-r0: task do_unpack: Started
NOTE: recipe rest-0.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1281 of 1698 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_patch)
NOTE: recipe rest-0.9.1-r0: task do_patch: Started
NOTE: recipe rest-0.9.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 591 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 596 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1650 of 1698 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1685 of 1698 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_collect_spdx_deps)
NOTE: recipe rest-0.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rest-0.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rest-0.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rest-0.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1686 of 1698 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_configure)
NOTE: recipe rest-0.9.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/
 build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/h
 ome/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glib-2.0', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'vala', 'gi-docgen', 'gobject-introspection', 'json-glib', 'libsoup', 'glib-2.0-native', 'libxml2-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'vala-native', 'xz-native', 'gi-docgen-native', 'gobject-introspection-native', 'libtool-native', 'texinfo-dummy-native', 'binutils-cross-x86_64', 'flex-native', 'zstd-native', 'zlib-native', 'linux-libc-headers', 'libmpc-native', 'mpfr-native', 'gmp-native', 'gnu-config-native', 'gettext-minimal-native', 'attr-native', 'python3-markdown-native', 'python3-build-native', 'python3-jinja2-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-pygments-native', 'python3-typogrify-native', 'python3-toml-native', 'python3-wheel-native', 'python3-markupsafe-native', 'util-linux-native', 'gettext-native', 'libpcre2-native', 'libffi-n
 ative', 'opkg-utils', 'zlib', 'python3', 'libffi', 'ncurses-native', 'expat-native', 'libnsl2-native', 'sqlite3-native', 'bzip2-native', 'gdbm-native', 'libtirpc-native', 'openssl-native', 'util-linux-libuuid-native', 'libedit-native', 'libpcre2', 'util-linux', 'bash-completion', 're2c-native', 'libgcc', 'nghttp2', 'sqlite3', 'libxml2', 'libpsl', 'm4-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-smartypants-native', 'libcap-ng-native', 'gdbm', 'expat', 'libnsl2', 'util-linux-libuuid', 'bzip2', 'libtirpc', 'ncurses', 'libedit', 'libxcrypt', 'xz', 'openssl', 'cmake-native', 'perl-native', 'libpam', 'libcap-ng', 'icu', 'unzip-native', 'make-native', 'cracklib']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=true -Dsoup2=false...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/rest-0.9.1
| Build dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/build
| Build type: cross build
| Project name: rest
| Project version: 0.9.1
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency glib-2.0 found: YES 2.78.0
| Run-time dependency gobject-2.0 found: YES 2.78.0
| Run-time dependency libsoup-3.0 found: YES 3.4.2
| Run-time dependency json-glib-1.0 found: YES 1.6.6
| Run-time dependency libxml-2.0 found: YES 2.11.5
| Configuring config.h using configuration
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/recipe-sysroot-native/usr/bin/pkg-config-native (0.29.2)
| Build-time dependency glib-2.0 found: YES 2.78.0
| Program glib-mkenums found: YES (glib-mkenums)
| Dependency glib-2.0 found: YES 2.78.0 (cached)
| Program glib-mkenums found: YES (glib-mkenums)
| Dependency glib-2.0 found: YES 2.78.0 (cached)
| Program glib-genmarshal found: YES (glib-genmarshal)
| Run-time dependency gobject-introspection-1.0 found: YES 1.78.1
| Program msgfmt found: YES (/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/recipe-sysroot-native/usr/bin/msgfmt)
| Program msginit found: YES (/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/recipe-sysroot-native/usr/bin/msginit)
| Program msgmerge found: YES (/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/recipe-sysroot-native/usr/bin/msgmerge)
| Program xgettext found: YES (/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/recipe-sysroot-native/usr/bin/xgettext)
| Could not find file LINGUAS in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/rest-0.9.1/examples/demo/po
| Found CMake: NO
| Run-time dependency libadwaita-1 found: NO (tried pkgconfig)
| 
| ../rest-0.9.1/examples/demo/meson.build:12:2: ERROR: Dependency "libadwaita-1" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/temp/run.do_configure.1629193:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/temp/run.do_configure.1629193, line 180
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/temp/run.do_configure.1629193, line 169
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/temp/run.do_configure.1629193, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/temp/run.do_configure.1629193, line 193
NOTE: recipe rest-0.9.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1686 tasks of which 1679 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104045804.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104045804.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: rest-0.9.1-r0 do_configure: meson failed
ERROR: rest-0.9.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/temp/run.do_configure.1629193', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rest/0.9.1/temp/log.do_configure.1629193
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb:do_configure) failed with exit code '1'

--===============3759649494424665319==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rest-upgrade-0.9.0-0.9.1.patch"

RnJvbSAxNGMzM2U2YTkwMzgwOGE5YjViZDdlYjM2NWMzNWJlMTJkOTU1NWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDo1ODoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
c3Q6IHVwZ3JhZGUgMC45LjAgLT4gMC45LjEKCi0tLQogbWV0YS1nbm9tZS9yZWNpcGVzLWdub21l
L3Jlc3Qve3Jlc3RfMC45LjAuYmIgPT4gcmVzdF8wLjkuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLWdub21lL3Jl
Y2lwZXMtZ25vbWUvcmVzdC97cmVzdF8wLjkuMC5iYiA9PiByZXN0XzAuOS4xLmJifSAoODYlKQoK
ZGlmZiAtLWdpdCBhL21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9yZXN0L3Jlc3RfMC45LjAuYmIg
Yi9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvcmVzdC9yZXN0XzAuOS4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9yZXN0L3Jlc3Rf
MC45LjAuYmIKcmVuYW1lIHRvIG1ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9yZXN0L3Jlc3RfMC45
LjEuYmIKaW5kZXggMjI1NmExODk5Li4zMjliNDExYTggMTAwNjQ0Ci0tLSBhL21ldGEtZ25vbWUv
cmVjaXBlcy1nbm9tZS9yZXN0L3Jlc3RfMC45LjAuYmIKKysrIGIvbWV0YS1nbm9tZS9yZWNpcGVz
LWdub21lL3Jlc3QvcmVzdF8wLjkuMS5iYgpAQCAtMjIsNCArMjIsNCBAQCBQQUNLQUdFQ09ORklH
ID8/PSAiJHtQQUNLQUdFQ09ORklHX1NPVVB9IgogUEFDS0FHRUNPTkZJR1tzb3VwMl0gPSAiLURz
b3VwMj10cnVlLCxsaWJzb3VwLTIuNCIKIFBBQ0tBR0VDT05GSUdbc291cDNdID0gIi1Ec291cDI9
ZmFsc2UsLGxpYnNvdXAtMy4wIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI4NWIy
YmM5MzQxMTI4MTM5NTM5YjUzZWU1M2YwNTMzMzEwYmM5NjM5MmZkNjQ1ODYzYTA0MDQxMGI4MWVi
ZTY2IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiOTI2NmE1YzEwZWNlMzgzZTE5M2Rm
YjdmZmIwN2I1MDljYzFmNTE1MjFhYjhkYWQ3NmFmOTZlZDE0MjEyYzJlMyIKLS0gCjIuMzkuMgoK

--===============3759649494424665319==--

