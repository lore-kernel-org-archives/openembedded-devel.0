Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6FBC0032E
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.64111.1699041739441166258
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D2BZBwTu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=O5DTd6uH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96c77fca-4b0e53f7-e728-441b-a658-33d4758a97f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fhk10FOKJF91y7Kla3CnPu93x+w9joBkVJ/0yI0uZ3k=;
	b=D2BZBwTuSbUoqeTBKWICvX4XwSJ1tqWeLLy6VF0UuRgHZQdZVUwsBgOEOC72IkX/
	x8qj8MVxiwOSYB5S/sef3/n28c+fRHGKKVXtSfkTan5N47BuVOoAGogCXlPcPYPb3YD
	Ki3YQcTuA0hNb+HJCaRKMUboqX9dGyWUuvP1BoBs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fhk10FOKJF91y7Kla3CnPu93x+w9joBkVJ/0yI0uZ3k=;
	b=O5DTd6uHXe5BDcO/l0SbsiF8MesCuqLbAQUvZAyNq2AsNo8j7bUhPlJdDcDvHvfY
	wxe3/SWfIBL1UP8+1OE83eRLqXuJKmWSBCI+TXiY/Awnay5vxsnpq/ZobG2gYYP+f8g
	VjujI/LfWn4Wyfi3wxQCEGQx56I73UZZ0yPWwAY8=
Content-Type: multipart/mixed; boundary="===============2854254383117330045=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] wavpack: upgrading to 5.6.0 FAILED
Message-ID: <0101018b96c77fca-4b0e53f7-e728-441b-a658-33d4758a97f9-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106073

--===============2854254383117330045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wavpack* to *5.6.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-wavpack-upgrade-5.1.0-5.6.0.patch
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
From f8fe71df31283b2d54a180d66de4b9f6ecc71ad0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:13:58 +0000
Subject: [PATCH] wavpack: upgrade 5.1.0 -> 5.6.0

---
 .../{wavpack_5.1.0.bb => wavpack_5.6.0.bb}    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.1.0.bb => wavpack_5.6.0.bb} (27%)

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
similarity index 27%
rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
index 909612393..3aace1155 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- license.txt
+# +++ license.txt
+# @@ -1,4 +1,4 @@
+# -                  Copyright (c) 1998 - 2017 David Bryant
+# +                  Copyright (c) 1998 - 2022 David Bryant
+#                            All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 DESCRIPTION = "WavPack is a completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=8c1a910e5c2a8b30ec8ffb2ffa63d9b2"
+LIC_FILES_CHKSUM = "file://license.txt;md5=bb5d037e3ad41a3c84c9f2d8bb65a7b4"
 
 SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https"
-SRCREV = "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
+SRCREV = "e03e8e29dc618e08e7baba9636e57ba1254874ce"
 S = "${WORKDIR}/git"
 
 inherit autotools lib_package
-- 
2.39.2


--===============2854254383117330045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5058 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:1a608d5832f4c537063e680037052daa85ea607f"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 145 Local 136 Mirrors 0 Missed 9 Current 147 (93% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 156 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 158 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 162 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 163 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe wavpack-5.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wavpack-5.6.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 234 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe wavpack-5.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wavpack-5.6.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 235 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 237 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wavpack-5.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wavpack-5.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 281 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 241 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wavpack-5.6.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe wavpack-5.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 287 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 248 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 250 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wavpack-5.6.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wavpack-5.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 741 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_patch)
NOTE: recipe wavpack-5.6.0-r0: task do_patch: Started
NOTE: recipe wavpack-5.6.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 862 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 873 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_collect_spdx_deps)
NOTE: recipe wavpack-5.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wavpack-5.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe wavpack-5.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wavpack-5.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 874 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_configure)
NOTE: recipe wavpack-5.6.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sy
 sroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'autoconf-native', 'automake-native', 'patch-native', 'pseudo-native', 'linux-libc-headers', 'texinfo-dummy-native', 'm4-native', 'gnu-config-native', 'binutils-cross-x86_64', 'libgcc', 'mpfr-native', 'flex-native', 'libmpc-native', 'zlib-native', 'zstd-native', 'xz-native', 'gmp-native', 'attr-native', 'gettext-minimal-native']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
| libtoolize: and rerunning libtoolize and aclocal.
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: not using Autoheader
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:38: installing './ar-lib'
| configure.ac:36: installing './compile'
| configure.ac:32: installing './config.guess'
| configure.ac:65: error: required file './config.rpath' not found
| configure.ac:32: installing './config.sub'
| configure.ac:5: installing './install-sh'
| configure.ac:5: installing './missing'
| Makefile.am: installing './depcomp'
| autoreconf: error: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/temp/run.do_configure.2504420:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/temp/run.do_configure.2504420, line 285
| 	#2: die, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/temp/run.do_configure.2504420, line 248
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/temp/run.do_configure.2504420, line 227
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/temp/run.do_configure.2504420, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/temp/run.do_configure.2504420, line 289
NOTE: recipe wavpack-5.6.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 874 tasks of which 868 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103191335.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103191335.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: wavpack-5.6.0-r0 do_configure: autoreconf execution failed.
ERROR: wavpack-5.6.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/temp/run.do_configure.2504420', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/wavpack/5.6.0/temp/log.do_configure.2504420
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb:do_configure) failed with exit code '1'

--===============2854254383117330045==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wavpack-upgrade-5.1.0-5.6.0.patch"

RnJvbSBmOGZlNzFkZjMxMjgzYjJkNTRhMTgwZDY2ZGU0YjlmNmVjYzcxYWQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOToxMzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
dnBhY2s6IHVwZ3JhZGUgNS4xLjAgLT4gNS42LjAKCi0tLQogLi4uL3t3YXZwYWNrXzUuMS4wLmJi
ID0+IHdhdnBhY2tfNS42LjAuYmJ9ICAgIHwgMjMgKysrKysrKysrKysrKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1v
ZS9yZWNpcGVzLW11bHRpbWVkaWEvd2F2cGFjay97d2F2cGFja181LjEuMC5iYiA9PiB3YXZwYWNr
XzUuNi4wLmJifSAoMjclKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1tdWx0aW1lZGlh
L3dhdnBhY2svd2F2cGFja181LjEuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1tdWx0aW1lZGlhL3dh
dnBhY2svd2F2cGFja181LjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDI3JQpyZW5hbWUgZnJvbSBt
ZXRhLW9lL3JlY2lwZXMtbXVsdGltZWRpYS93YXZwYWNrL3dhdnBhY2tfNS4xLjAuYmIKcmVuYW1l
IHRvIG1ldGEtb2UvcmVjaXBlcy1tdWx0aW1lZGlhL3dhdnBhY2svd2F2cGFja181LjYuMC5iYgpp
bmRleCA5MDk2MTIzOTMuLjNhYWNlMTE1NSAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLW11
bHRpbWVkaWEvd2F2cGFjay93YXZwYWNrXzUuMS4wLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1t
dWx0aW1lZGlhL3dhdnBhY2svd2F2cGFja181LjYuMC5iYgpAQCAtMSw5ICsxLDI4IEBACisjIEZJ
WE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2Rl
dnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2Vl
biB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUg
TElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMg
dGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxl
OiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBj
aGFuZ2VzOgorIworIyAtLS0gbGljZW5zZS50eHQKKyMgKysrIGxpY2Vuc2UudHh0CisjIEBAIC0x
LDQgKzEsNCBAQAorIyAtICAgICAgICAgICAgICAgICAgQ29weXJpZ2h0IChjKSAxOTk4IC0gMjAx
NyBEYXZpZCBCcnlhbnQKKyMgKyAgICAgICAgICAgICAgICAgIENvcHlyaWdodCAoYykgMTk5OCAt
IDIwMjIgRGF2aWQgQnJ5YW50CisjICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFsbCByaWdo
dHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFu
ZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAKKyMKKwogREVTQ1JJUFRJT04gPSAi
V2F2UGFjayBpcyBhIGNvbXBsZXRlbHkgb3BlbiBhdWRpbyBjb21wcmVzc2lvbiBmb3JtYXQgcHJv
dmlkaW5nIGxvc3NsZXNzLCBoaWdoLXF1YWxpdHkgbG9zc3ksIGFuZCBhIHVuaXF1ZSBoeWJyaWQg
Y29tcHJlc3Npb24gbW9kZS4iCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL2xpY2Vuc2UudHh0O21kNT04YzFhOTEwZTVjMmE4YjMwZWM4ZmZiMmZm
YTYzZDliMiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2xpY2Vuc2UudHh0O21kNT1iYjVk
MDM3ZTNhZDQxYTNjODRjOWYyZDhiYjY1YTdiNCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL2RicnkvV2F2UGFjay5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JF
ViA9ICI5Y2NjM2ZlNGEzN2QwNjkxMzdjZWFiZTUxM2E0ZGQ5YjBhMDljMWMyIgorU1JDUkVWID0g
ImUwM2U4ZTI5ZGM2MThlMDhlN2JhYmE5NjM2ZTU3YmExMjU0ODc0Y2UiCiBTID0gIiR7V09SS0RJ
Un0vZ2l0IgogCiBpbmhlcml0IGF1dG90b29scyBsaWJfcGFja2FnZQotLSAKMi4zOS4yCgo=

--===============2854254383117330045==--

