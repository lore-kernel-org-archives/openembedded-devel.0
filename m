Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FF4C001DB
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62986.1699041168460482837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BLxpUJMT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iBhMHUJl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bef9b1-9aafd2dd-4fa6-4ff9-9904-33bda283c8bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041180;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v9bG+ZKSdEQq2RcunCzlaMq96fBc+vxEQ/Gozr4u2uo=;
	b=BLxpUJMTiGLZKt+uhIxldtLWNi9xhNuuZ2FLKH/bR85J1Dx2lUSffIO7GaSvA6oC
	J32MgNWwTC7JYLIGWVDu1lwKqneL04bh1FFYrkr4PXMMoHYRj947TzFfL9k/xIjbfkN
	nwk5sFVSxlxzZ8AIp2pNpyHRl4kFPGYjHaCYMkPk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041180;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v9bG+ZKSdEQq2RcunCzlaMq96fBc+vxEQ/Gozr4u2uo=;
	b=iBhMHUJlgppdMD4TvlxR4456i6B/rNBAhcFee37iSw5EUgMnNMsD0QjQHpYg9DoB
	13aegpoKvDDmBXoSWvlyJDdlLXbmv5hN5oJKLvlS9+fNfBTGphAcHs0bL8ZJFOAZBhf
	bhVBnliyLBud4IYBs3UH5jIiklZL7PmpTCdtpeps=
Content-Type: multipart/mixed; boundary="===============2091351487061380402=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] zile: upgrading to 2.6.2 FAILED
Message-ID: <0101018b96bef9b1-9aafd2dd-4fa6-4ff9-9904-33bda283c8bd-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:53:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106049

--===============2091351487061380402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zile* to *2.6.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-zile-upgrade-2.4.15-2.6.2.patch
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
From 721353e6f0cdc4c84f80e13a6011c8cce689076a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:45:49 +0000
Subject: [PATCH] zile: upgrade 2.4.15 -> 2.6.2

---
 meta-oe/recipes-support/zile/{zile_2.4.15.bb => zile_2.6.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/zile/{zile_2.4.15.bb => zile_2.6.2.bb} (80%)

diff --git a/meta-oe/recipes-support/zile/zile_2.4.15.bb b/meta-oe/recipes-support/zile/zile_2.6.2.bb
similarity index 80%
rename from meta-oe/recipes-support/zile/zile_2.4.15.bb
rename to meta-oe/recipes-support/zile/zile_2.6.2.bb
index e86b3f82d..c62889378 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.15.bb
+++ b/meta-oe/recipes-support/zile/zile_2.6.2.bb
@@ -9,8 +9,7 @@ SRC_URI = "${GNU_MIRROR}/zile/${BP}.tar.gz \
            file://remove-help2man.patch \
 "
 
-SRC_URI[md5sum] = "05efa90dfee1821ca018b0b2ef8f50a8"
-SRC_URI[sha256sum] = "39c300a34f78c37ba67793cf74685935a15568e14237a3a66fda8fcf40e3035e"
+SRC_URI[sha256sum] = "77eb7daff3c98bdc88daa1ac040dccca72b81dc32fc3166e079dd7a63e42c741"
 
 inherit autotools pkgconfig
 
-- 
2.39.2


--===============2091351487061380402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5081 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:908c14296bd89c67c8ae271dfd1542a901f850e5"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 165 Local 156 Mirrors 0 Missed 9 Current 169 (94% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 172 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/bdwgc/bdwgc_8.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 179 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 181 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 183 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 192 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: recipe bdwgc-8.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zile-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zile-2.6.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zile-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zile-2.6.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 266 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe bdwgc-8.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 276 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 278 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zile-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 280 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe zile-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 302 of 988 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 282 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zile-2.6.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zile-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 303 of 988 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 286 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe zile-2.6.2-r0: task do_unpack: Started
NOTE: recipe zile-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 293 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 295 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 823 of 988 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_patch)
NOTE: recipe zile-2.6.2-r0: task do_patch: Started
NOTE: recipe zile-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 333 of 334 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 960 of 988 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 975 of 988 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_collect_spdx_deps)
NOTE: recipe zile-2.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zile-2.6.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe zile-2.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 976 of 988 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_configure)
NOTE: recipe zile-2.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zile-2.6.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/bdwgc/bdwgc_8.2.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/
 yocto-worker/auh-meta-oe/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bdwgc', 'glibc', 'ncurses', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'acl', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'libatomic-ops', 'texinfo-dummy-native', 'attr', 'gnu-config-native', 'm4-native', 'xz-native', 'zlib-native', 'binutils-cross-x86_64', 'linux-libc-headers', 'flex-native', 'libmpc-native', 'mpfr-native', 'zstd-native', 'gmp-native', 'opkg-utils', 'attr-native', 'libgcc', 'gettext-minimal-native']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/zile-2.6.2/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/zile-2.6.2/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/zile-2.6.2/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot-native/usr/share/aclocal/ --force
| configure.ac:47: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../autoconf-2.72c/lib/autoconf/general.m4:2979: AC_RUN_IFELSE is expanded from...
| ../autoconf-2.72c/lib/m4sugar/m4sh.m4:690: _AS_IF_ELSE is expanded from...
| ../autoconf-2.72c/lib/m4sugar/m4sh.m4:697: AS_IF is expanded from...
| ../autoconf-2.72c/lib/autoconf/general.m4:2249: AC_CACHE_VAL is expanded from...
| ../autoconf-2.72c/lib/autoconf/general.m4:2270: AC_CACHE_CHECK is expanded from...
| aclocal.m4:3410: gl_GETOPT_CHECK_HEADERS is expanded from...
| aclocal.m4:3370: gl_FUNC_GETOPT_POSIX is expanded from...
| aclocal.m4:4303: gl_INIT is expanded from...
| configure.ac:47: the top level
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/zile-2.6.2/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../zile-2.6.2/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot  --disable-static  --enable-acl
| configure: WARNING: unrecognized options: --with-libtool-sysroot, --disable-static, --enable-acl
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot... none
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for getopt.h... yes
| checking for sys/cdefs.h... yes
| checking for langinfo.h... yes
| checking for limits.h... yes
| checking for xlocale.h... no
| checking for sys/mman.h... yes
| checking for sys/param.h... yes
| checking for malloc.h... yes
| checking for sys/time.h... yes
| checking for wchar.h... yes
| checking for features.h... yes
| checking for crtdefs.h... no
| checking for wctype.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking how to run the C preprocessor... x86_64-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking for egrep -e... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for Minix Amsterdam compiler... no
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking the archiver (x86_64-poky-linux-gcc-ar) interface... ar
| checking for x86_64-poky-linux-ar... (cached) x86_64-poky-linux-gcc-ar
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot option to enable large file support... none needed
| checking for x86_64-poky-linux-ar... (cached) x86_64-poky-linux-gcc-ar
| checking the archiver (x86_64-poky-linux-gcc-ar) interface... (cached) ar
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking for gawk... (cached) gawk
| checking for GNU make... make
| checking for valac... valac
| configure: WARNING: valac not found or too old: cannot compile Vala sources
| checking for glib-2.0 gobject-2.0 gio-2.0 gee-0.8... no
| configure: error: Package requirements (glib-2.0 gobject-2.0 gio-2.0 gee-0.8) were not met:
| 
| No package 'glib-2.0' found
| No package 'gobject-2.0' found
| No package 'gio-2.0' found
| No package 'gee-0.8' found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables GLIB_CFLAGS
| and GLIB_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/temp/run.do_configure.2691479:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/temp/run.do_configure.2691479, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/temp/run.do_configure.2691479, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/temp/run.do_configure.2691479, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/temp/run.do_configure.2691479, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/temp/run.do_configure.2691479, line 289
NOTE: recipe zile-2.6.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 976 tasks of which 970 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103194523.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103194523.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: zile-2.6.2-r0 do_configure: configure failed
ERROR: zile-2.6.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/temp/run.do_configure.2691479', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/zile/2.6.2/temp/log.do_configure.2691479
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/zile/zile_2.6.2.bb:do_configure) failed with exit code '1'

--===============2091351487061380402==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-zile-upgrade-2.4.15-2.6.2.patch"

RnJvbSA3MjEzNTNlNmYwY2RjNGM4NGY4MGUxM2E2MDExYzhjY2U2ODkwNzZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOTo0NTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHpp
bGU6IHVwZ3JhZGUgMi40LjE1IC0+IDIuNi4yCgotLS0KIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L3ppbGUve3ppbGVfMi40LjE1LmJiID0+IHppbGVfMi42LjIuYmJ9IHwgMyArLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhLW9lL3Jl
Y2lwZXMtc3VwcG9ydC96aWxlL3t6aWxlXzIuNC4xNS5iYiA9PiB6aWxlXzIuNi4yLmJifSAoODAl
KQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3ppbGUvemlsZV8yLjQuMTUu
YmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC96aWxlL3ppbGVfMi42LjIuYmIKc2ltaWxhcml0
eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvemlsZS96aWxl
XzIuNC4xNS5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvemlsZS96aWxlXzIu
Ni4yLmJiCmluZGV4IGU4NmIzZjgyZC4uYzYyODg5Mzc4IDEwMDY0NAotLS0gYS9tZXRhLW9lL3Jl
Y2lwZXMtc3VwcG9ydC96aWxlL3ppbGVfMi40LjE1LmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L3ppbGUvemlsZV8yLjYuMi5iYgpAQCAtOSw4ICs5LDcgQEAgU1JDX1VSSSA9ICIke0dO
VV9NSVJST1J9L3ppbGUvJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3JlbW92ZS1o
ZWxwMm1hbi5wYXRjaCBcCiAiCiAKLVNSQ19VUklbbWQ1c3VtXSA9ICIwNWVmYTkwZGZlZTE4MjFj
YTAxOGIwYjJlZjhmNTBhOCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzOWMzMDBhMzRmNzhjMzdi
YTY3NzkzY2Y3NDY4NTkzNWExNTU2OGUxNDIzN2EzYTY2ZmRhOGZjZjQwZTMwMzVlIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjc3ZWI3ZGFmZjNjOThiZGM4OGRhYTFhYzA0MGRjY2NhNzJiODFkYzMy
ZmMzMTY2ZTA3OWRkN2E2M2U0MmM3NDEiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwog
Ci0tIAoyLjM5LjIKCg==

--===============2091351487061380402==--

