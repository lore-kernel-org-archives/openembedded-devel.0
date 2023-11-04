Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDD2C04E83
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.5519.1699083060528169209
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TxYdEyrW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TeayRief;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b993e0224-aa55c25e-f624-4e82-a008-b21d5f8d7eb8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3bQiTL6MBKZyuu8VrE6RoJKeECA+wRiisbbnuzoqI6s=;
	b=TxYdEyrWXeZDtJYmqpwVKXvxAHC6bAH8J29pBP6DwMD4X/vpbWw537XsQRB16XpZ
	Uaac5sM1yo5mpV4AOMpfW4nDVB8jlLEK+oVJiVZMvv3hRh2fqEPWHRLJdB7ps4EbC/O
	MhcESwYuPe6H1DxJDu7lWbMXGQq/851ipZTohIVI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3bQiTL6MBKZyuu8VrE6RoJKeECA+wRiisbbnuzoqI6s=;
	b=TeayRiefPxQuo5x7PIs4s2r56tcGc5IblLU4sLPsZ7UX3NoHKuJAXfW5ixccS+wI
	n+UWNw0kRvdCnIs2HnjVEhhNn+OdJce4qE0R1TUcj405At164ZI26fcOkO3lWF3Lsio
	EHLWX8/zL41i54g8UVXZmVaFZgNMBrEvdqwOReCw=
Content-Type: multipart/mixed; boundary="===============2650879334757548382=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-dev-tools: upgrading to 4.19.0 FAILED
Message-ID: <0101018b993e0224-aa55c25e-f624-4e82-a008-b21d5f8d7eb8-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106315

--===============2650879334757548382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-dev-tools* to *4.19.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xfce4-dev-tools-upgrade-4.18.0-4.19.0.patch
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
From 0dfe20d20a8ea1a92037dfb60f8835a9096b0054 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:15:17 +0000
Subject: [PATCH] xfce4-dev-tools: upgrade 4.18.0 -> 4.19.0

---
 .../{xfce4-dev-tools_4.18.0.bb => xfce4-dev-tools_4.19.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.18.0.bb => xfce4-dev-tools_4.19.0.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb
index 6ca18b8b3..7c05dde81 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
            "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
-SRC_URI[sha256sum] = "eedb4fc955f0e3459c46864ff98579295db2b900743e0ff69cad5970ba76be37"
+SRC_URI[sha256sum] = "ac9fd11f9749303683d80480dac6bbb91c8bf160d8ea5a794bb4f2041eb61d1d"
 
 inherit autotools pkgconfig
 
-- 
2.39.2


--===============2650879334757548382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4927 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:7b56dbbf0efcb4584a2979227ef8226838da24d0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 276 Local 266 Mirrors 0 Missed 10 Current 259 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 268 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 270 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 278 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 333 of 535 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 535 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 535 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 444 of 1538 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 446 of 1538 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_fetch: Started
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 447 of 1538 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 448 of 1538 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_unpack)
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 493 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 454 of 1538 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 502 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1096 of 1538 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_patch)
NOTE: Running task 1110 of 1538 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_patch: Started
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1178 of 1538 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_configure)
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_configure: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 535 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1516 of 1538 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfce4-dev-tools-4.19.0-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libtool-native', 'quilt-native', 'glib-2.0-native', 'autoconf-native', 'automake-native', 'pkgconfig-native', 'python3-native', 'util-linux-native', 'libpcre2-native', 'gettext-native', 'gettext-minimal-native', 'zlib-native', 'xz-native', 'libffi-native', 'texinfo-dummy-native', 'gnu-config-native', 'm4-native', 'gdbm-native', 'ncurses-native', 'sqlite3-native', 'libtirpc-native', 'bzip2-native', 'util-linux-libuuid-native', 'libedit-native', 'openssl-native', 'expat-native', 'libnsl2-native', 'libcap-ng-native', 'perl-native', 'cmake-native', 'make-native', 'zstd-native']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/xfce4-dev-tools-4.19.0/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/xfce4-dev-tools-4.19.0/m4macros/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/xfce4-dev-tools-4.19.0/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/xfce4-dev-tools-4.19.0/m4macros/ --force -I m4 -I m4macros ${ACLOCAL_FLAGS}
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/xfce4-dev-tools-4.19.0/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/xfce4-dev-tools-4.19.0/m4macros/ --force -I m4 -I m4macros ${ACLOCAL_FLAGS}
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/xfce4-dev-tools-4.19.0/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/xfce4-dev-tools-4.19.0/m4macros/ --force
| autoreconf: configure.ac: not using Autoheader
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:46: installing './compile'
| configure.ac:37: installing './missing'
| tests/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../xfce4-dev-tools-4.19.0/configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr 		  --exec_prefix=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr 		  --bindir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/bin 		  --sbindir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/sbin 		  --libexecdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/libexec 		  --datadir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-s
 ysroot-native/usr/share 		  --sysconfdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/etc 		  --sharedstatedir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/com 		  --localstatedir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/var 		  --libdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/lib 		  --includedir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/include 		  --oldincludedir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/include 		  --infodir=/home/pokybuild/yocto-worker/auh-meta-oe/buil
 d/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/share/info 		  --mandir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		    --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/recipe-sysroot-native/usr/share/x86_64-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether make supports nested variables... (cached) yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-pc-linux-gnu
| checking for x86_64-linux-gcc... gcc
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... no
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether gcc  accepts -g... yes
| checking for gcc  option to enable C11 features... none needed
| checking whether gcc  understands -c and -o together... yes
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of gcc ... none
| checking for xsltproc... no
| configure: error: package 'xsltproc' missing
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/temp/run.do_configure.2270927:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/temp/run.do_configure.2270927, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/temp/run.do_configure.2270927, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/temp/run.do_configure.2270927, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/temp/run.do_configure.2270927, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/temp/run.do_configure.2270927, line 289
NOTE: recipe xfce4-dev-tools-native-4.19.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1521 tasks of which 1512 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104061451.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104061451.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xfce4-dev-tools-native-4.19.0-r0 do_configure: configure failed
ERROR: xfce4-dev-tools-native-4.19.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/temp/run.do_configure.2270927', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/x86_64-linux/xfce4-dev-tools-native/4.19.0/temp/log.do_configure.2270927
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.19.0.bb:do_configure) failed with exit code '1'

--===============2650879334757548382==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-dev-tools-upgrade-4.18.0-4.19.0.patch"

RnJvbSAwZGZlMjBkMjBhOGVhMWE5MjAzN2RmYjYwZjg4MzVhOTA5NmIwMDU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjoxNToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LWRldi10b29sczogdXBncmFkZSA0LjE4LjAgLT4gNC4xOS4wCgotLS0KIC4uLi97eGZjZTQt
ZGV2LXRvb2xzXzQuMTguMC5iYiA9PiB4ZmNlNC1kZXYtdG9vbHNfNC4xOS4wLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtZGV2LXRvb2xzL3t4ZmNlNC1kZXYtdG9vbHNf
NC4xOC4wLmJiID0+IHhmY2U0LWRldi10b29sc180LjE5LjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1kZXYtdG9vbHMveGZjZTQtZGV2LXRvb2xz
XzQuMTguMC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtZGV2LXRvb2xzL3hmY2U0
LWRldi10b29sc180LjE5LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0
YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1kZXYtdG9vbHMveGZjZTQtZGV2LXRvb2xzXzQuMTgu
MC5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1kZXYtdG9vbHMveGZj
ZTQtZGV2LXRvb2xzXzQuMTkuMC5iYgppbmRleCA2Y2ExOGI4YjMuLjdjMDVkZGU4MSAxMDA2NDQK
LS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1kZXYtdG9vbHMveGZjZTQtZGV2LXRv
b2xzXzQuMTguMC5iYgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0LWRldi10b29s
cy94ZmNlNC1kZXYtdG9vbHNfNC4xOS4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAi
aHR0cDovL2FyY2hpdmUueGZjZS5vcmcvc3JjL3hmY2UvJHtCUE59LyR7QCcke1BWfSdbMDo0XX0v
JHtCUE59LSR7UFZ9CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW00bWFjcm9zLUNoZWNrLWZvci1h
LWZ1bmN0aW9uLXByb3ZpZGVkLWJ5LWxpYlgxMS1pbi0ucGF0Y2ggXAogICAgICAgICAgICAiCiBT
UkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIGZpbGU6Ly8wMDAxLVJ1bi1uYXRpdmUteGR0
LWNzb3VyY2Utb24tdGVzdHMucGF0Y2giCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWVkYjRmYzk1
NWYwZTM0NTljNDY4NjRmZjk4NTc5Mjk1ZGIyYjkwMDc0M2UwZmY2OWNhZDU5NzBiYTc2YmUzNyIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYzlmZDExZjk3NDkzMDM2ODNkODA0ODBkYWM2YmJiOTFj
OGJmMTYwZDhlYTVhNzk0YmI0ZjIwNDFlYjYxZDFkIgogCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcKIAotLSAKMi4zOS4yCgo=

--===============2650879334757548382==--

