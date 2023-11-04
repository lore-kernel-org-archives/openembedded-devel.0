Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F67C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:48:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.5510.1699084092146096067
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KGDDNhwg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BeLvl2mv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b994dbf8e-b1c98e94-b791-451d-86f9-29874cb032b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lckbnOAPOZ3WrEGB6+XWNR2QNFeaEnO3wDrtLVK7hTU=;
	b=KGDDNhwgBpGAqT9uVbX0lp1aZ5YIq5Oh2g3w+9NHLCWV8UJEHKCpd1cQhQ2uWeQF
	gEEfAwd7XbKY7saTdj4B/n75E4eQwdsxlqFmQ6+Lsyng4S6dDge0UipppZPwt5YjJV7
	exGRGEbt6Ed36tKS+Oiudsx1Fsiag7JJwOgX8ldk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lckbnOAPOZ3WrEGB6+XWNR2QNFeaEnO3wDrtLVK7hTU=;
	b=BeLvl2mvzaqmBMnV+S1AFPJ2HsNzoZUCHcLq1mrR+a9+LXBzt7KGKWlsGOIj6BS+
	dL9+8eUm1D8pG12q2MCvGMNh9hP1suPzmi9FdEjoBczARoxJVdsoml/h5xXX5e4M5sr
	OkuCI4MT3LLj4smpVpSXo6ZLZzm0DTs9WxMNAHAA=
Content-Type: multipart/mixed; boundary="===============0289613103844262038=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libisoburn: upgrading to 1.5.6 FAILED
Message-ID: <0101018b994dbf8e-b1c98e94-b791-451d-86f9-29874cb032b3-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:48:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106356

--===============0289613103844262038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libisoburn* to *1.5.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libisoburn-upgrade-1.5.4-1.5.6.patch
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
From 0ba1202b2299238b3763be0f704d2d7be6d9f01e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:30:24 +0000
Subject: [PATCH] libisoburn: upgrade 1.5.4 -> 1.5.6

---
 .../burnia/{libisoburn_1.5.4.bb => libisoburn_1.5.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/burnia/{libisoburn_1.5.4.bb => libisoburn_1.5.6.bb} (89%)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.4.bb b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
similarity index 89%
rename from meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.4.bb
rename to meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
index f263b5135..3982eae63 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.4.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYRIGHT;md5=43cfe25a7e4a65f722d6253fa0649bb1"
 
 SRC_URI = "http://files.libburnia-project.org/releases/libisoburn-${PV}.tar.gz"
-SRC_URI[sha256sum] = "2d89846d43880f17fa591c53b3bea42ffb803628e4e630c680fc2c9184f79132"
+SRC_URI[sha256sum] = "2b80a6f73dd633a5d243facbe97a15e5c9a07644a5e1a242c219b9375a45f71b"
 
 DEPENDS = "libisofs libburn"
 # This replaces the xorriso recipe
-- 
2.39.2


--===============0289613103844262038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4888 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:ee1dfc4f74d070dd0e2c155b4f227c2f9bbf7701"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 159 Local 150 Mirrors 0 Missed 9 Current 174 (94% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 177 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 184 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 186 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 187 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libisofs-1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libisoburn-1.5.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe libisoburn-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libburn-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libisoburn-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libisofs-1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libisoburn-1.5.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 266 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libburn-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 283 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 284 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libisoburn-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libisoburn-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 308 of 989 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 285 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 287 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libisoburn-1.5.6-r0: task do_fetch: Started
NOTE: recipe libisoburn-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 309 of 989 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libisoburn-1.5.6-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 291 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libisoburn-1.5.6-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 298 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 300 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 805 of 989 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_patch)
NOTE: recipe libisoburn-1.5.6-r0: task do_patch: Started
NOTE: recipe libisoburn-1.5.6-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 333 of 333 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 961 of 989 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 976 of 989 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_collect_spdx_deps)
NOTE: recipe libisoburn-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libisoburn-1.5.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libisoburn-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libisoburn-1.5.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 977 of 989 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_configure)
NOTE: recipe libisoburn-1.5.6-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt
 -native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libburn', 'libisofs', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'attr-native', 'linux-libc-headers', 'xz-native', 'texinfo-dummy-native', 'mpfr-native', 'gnu-config-native', 'binutils-cross-x86_64', 'gmp-native', 'flex-native', 'zlib-native', 'libmpc-native', 'zstd-native', 'libgcc', 'zlib', 'acl', 'm4-native', 'gettext-minimal-native', 'attr', 'opkg-utils']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot-native/usr/share/aclocal/ --force -I ./
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, './'.
| libtoolize: copying file './/libtool.m4'
| libtoolize: copying file './/ltoptions.m4'
| libtoolize: copying file './/ltsugar.m4'
| libtoolize: copying file './/ltversion.m4'
| libtoolize: copying file './/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot-native/usr/share/aclocal/ --force -I ./
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: not using Autoheader
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:65: installing './compile'
| configure.ac:10: installing './missing'
| Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../libisoburn-1.5.6/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot --enable-pkg-check-modules --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking target system type... x86_64-poky-linux-gnu
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot... none
| checking for an ANSI C-conforming const... yes
| checking for inline... inline
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot option to enable large file support... none needed
| checking for declarations of fseeko and ftello... yes
| checking for fseeko... yes
| checking for iconv() in separate -liconv ... no
| checking for libiconv in -liconv... no
| checking for const qualifier with iconv() ... no
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot   option to reload object files... -r
| checking for x86_64-poky-linux-file... no
| checking for file... file
| configure: WARNING: using cross tools not prefixed with host triplet
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for struct tm.tm_gmtoff... yes
| checking for timezone variable ... timezone
| checking target operating system... linux
| checking for overridden pkgconfig directory path... no
| enabled  installation of xorriso-dd-target/xorriso-dd-target
| checking for desired functions in libreadline... no
| checking for desired functions in libedit... no
| checking for sys/acl.h... yes
| checking for acl_to_text in -lacl... yes
| enabled  libacl, local processing of ACL
| checking for attr/xattr.h... no
| disabled local processing of extended file attributes
| checking for zlib.h... yes
| checking for compressBound in -lz... yes
| checking for libjte/libjte.h... no
| enabled  xorriso external filter programs
| disabled xorriso external filter programs under setuid
| enabled  xorriso command -launch_frontend
| disabled xorriso command -launch_frontend under setuid
| disabled xorriso write size default 64 KB on DVD
| enabled  strict symbol encapsulation
| checking for libburn/libburn.h... yes
| checking for libisofs/libisofs.h... yes
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for libburn-1 >= 1.5.6... yes
| checking for libisofs-1 >= 1.5.6... no
| configure: error: Package requirements (libisofs-1 >= 1.5.6) were not met:
| 
| Requested 'libisofs-1 >= 1.5.6' but version of libisofs is 1.5.4
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables LIBISOFS_CFLAGS
| and LIBISOFS_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/temp/run.do_configure.2836867:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/temp/run.do_configure.2836867, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/temp/run.do_configure.2836867, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/temp/run.do_configure.2836867, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/temp/run.do_configure.2836867, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/temp/run.do_configure.2836867, line 289
NOTE: recipe libisoburn-1.5.6-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 977 tasks of which 971 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104072956.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104072956.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libisoburn-1.5.6-r0 do_configure: configure failed
ERROR: libisoburn-1.5.6-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/temp/run.do_configure.2836867', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libisoburn/1.5.6/temp/log.do_configure.2836867
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb:do_configure) failed with exit code '1'

--===============0289613103844262038==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libisoburn-upgrade-1.5.4-1.5.6.patch"

RnJvbSAwYmExMjAyYjIyOTkyMzhiMzc2M2JlMGY3MDRkMmQ3YmU2ZDlmMDFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzozMDoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ymlzb2J1cm46IHVwZ3JhZGUgMS41LjQgLT4gMS41LjYKCi0tLQogLi4uL2J1cm5pYS97bGliaXNv
YnVybl8xLjUuNC5iYiA9PiBsaWJpc29idXJuXzEuNS42LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1m
aWxlc3lzdGVtcy9yZWNpcGVzLWZpbGVzeXN0ZW1zL2J1cm5pYS97bGliaXNvYnVybl8xLjUuNC5i
YiA9PiBsaWJpc29idXJuXzEuNS42LmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEtZmlsZXN5
c3RlbXMvcmVjaXBlcy1maWxlc3lzdGVtcy9idXJuaWEvbGliaXNvYnVybl8xLjUuNC5iYiBiL21l
dGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1maWxlc3lzdGVtcy9idXJuaWEvbGliaXNvYnVybl8xLjUu
Ni5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhLWZpbGVzeXN0ZW1zL3Jl
Y2lwZXMtZmlsZXN5c3RlbXMvYnVybmlhL2xpYmlzb2J1cm5fMS41LjQuYmIKcmVuYW1lIHRvIG1l
dGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1maWxlc3lzdGVtcy9idXJuaWEvbGliaXNvYnVybl8xLjUu
Ni5iYgppbmRleCBmMjYzYjUxMzUuLjM5ODJlYWU2MyAxMDA2NDQKLS0tIGEvbWV0YS1maWxlc3lz
dGVtcy9yZWNpcGVzLWZpbGVzeXN0ZW1zL2J1cm5pYS9saWJpc29idXJuXzEuNS40LmJiCisrKyBi
L21ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1maWxlc3lzdGVtcy9idXJuaWEvbGliaXNvYnVybl8x
LjUuNi5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
RzttZDU9OWFjMmU3Y2ZmMWRkYWY0OGI2ZWFiNjAyOGYyM2VmODggXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vQ09QWVJJR0hUO21kNT00M2NmZTI1YTdlNGE2NWY3MjJkNjI1M2ZhMDY0OWJi
MSIKIAogU1JDX1VSSSA9ICJodHRwOi8vZmlsZXMubGliYnVybmlhLXByb2plY3Qub3JnL3JlbGVh
c2VzL2xpYmlzb2J1cm4tJHtQVn0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJkODk4
NDZkNDM4ODBmMTdmYTU5MWM1M2IzYmVhNDJmZmI4MDM2MjhlNGU2MzBjNjgwZmMyYzkxODRmNzkx
MzIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmI4MGE2ZjczZGQ2MzNhNWQyNDNmYWNiZTk3YTE1
ZTVjOWEwNzY0NGE1ZTFhMjQyYzIxOWI5Mzc1YTQ1ZjcxYiIKIAogREVQRU5EUyA9ICJsaWJpc29m
cyBsaWJidXJuIgogIyBUaGlzIHJlcGxhY2VzIHRoZSB4b3JyaXNvIHJlY2lwZQotLSAKMi4zOS4y
Cgo=

--===============0289613103844262038==--

