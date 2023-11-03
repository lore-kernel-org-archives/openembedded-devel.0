Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46752C0018A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.64116.1699041739806523196
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d8MlSKlr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LlKTpO9s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b96c78174-fe35cb68-e3e4-438c-964d-83500c65e9c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vtGigV4gyo3VmOKVF4atcUP3xxEbpMcg84V4B4lrjjE=;
	b=d8MlSKlr2VWrGw7puVKDSRPo0hjxJlab73d8UUR9iyFrMc79HXJ7kF7xXbvFtKLg
	IY9P+pp1gsR3JQ6j8XoWJ0zzfHeelFxDPMBA/chVC9YQMzEV0stVdJRYMeGWOXoNHRd
	l8iXrH2cK8cQEdQvYd8Z7yQT4stA2C1F3u1aGTIM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vtGigV4gyo3VmOKVF4atcUP3xxEbpMcg84V4B4lrjjE=;
	b=LlKTpO9sYqq8Bva4qW25jFlibcJw0poKqwlc6BS1LGkks/EvZxujURrdHsoeFxKh
	eGct3SH180WZ9JVX0LRUqWfxd4S4QngOx61W1KRAmwbetQ6tTswkys+fUVKhmVWuwwI
	q4hLB3IdBCqccPolLchqFwaTBR3um4v/F0Isx1v0=
Content-Type: multipart/mixed; boundary="===============1727456021270211177=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] pcsc-tools: upgrading to 1.7.0 FAILED
Message-ID: <0101018b96c78174-fe35cb68-e3e4-438c-964d-83500c65e9c4-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:19 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106081

--===============1727456021270211177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pcsc-tools* to *1.7.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pcsc-tools-upgrade-1.6.2-1.7.0.patch
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
From 4426e0a834ed6d2274c162c3da8dd78da11e06c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:42:16 +0000
Subject: [PATCH] pcsc-tools: upgrade 1.6.2 -> 1.7.0

---
 .../pcsc-tools/{pcsc-tools_1.6.2.bb => pcsc-tools_1.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.6.2.bb => pcsc-tools_1.7.0.bb} (92%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb
similarity index 92%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb
index b71fb0427..3dd257db5 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master"
 
-SRCREV = "b1018b83346f8a3bc3d42c96f2ed4dc62147cb24"
+SRCREV = "a2c5a18891c3abae33f22edb579d1d62cf23c1d3"
 
 inherit autotools pkgconfig
 
-- 
2.39.2


--===============1727456021270211177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5023 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:ee2858bac1b0451482b40c9031954fc1307d93ae"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 365 Local 356 Mirrors 0 Missed 9 Current 359 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 366 of 724 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 374 of 724 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 376 of 724 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pcsc-tools-1.7.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libpcsc-perl-1.4.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe pcsc-tools-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pcsc-tools-1.7.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe pcsc-tools-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 724 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcsc-perl-1.4.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 724 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 532 of 724 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: recipe pcsc-tools-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pcsc-lite-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pcsc-tools-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 451 of 2003 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_fetch)
NOTE: recipe pcsc-lite-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pcsc-tools-1.7.0-r0: task do_fetch: Started
NOTE: recipe pcsc-tools-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 602 of 2003 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_unpack)
NOTE: recipe pcsc-tools-1.7.0-r0: task do_unpack: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 712 of 724 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 714 of 724 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 724 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe pcsc-tools-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1480 of 2003 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1879 of 2003 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pcsc-tools-1.7.0-r0: task do_patch: Started
NOTE: Running task 1977 of 2003 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe pcsc-tools-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe pcsc-tools-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pcsc-tools-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pcsc-tools-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pcsc-tools-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1991 of 2003 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_configure)
NOTE: recipe pcsc-tools-1.7.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_popul
 ate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['pcsc-lite', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'linux-libc-headers', 'gnu-config-native', 'texinfo-dummy-native', 'm4-native', 'systemd', 'attr-native', 'binutils-cross-x86_64', 'libgcc', 'xz-native', 'flex-native', 'mpfr-native', 'gmp-native', 'zlib-native', 'zstd-native', 'libmpc-native', 'gettext-minimal-native', 'util-linux', 'update-rc.d', 'bash-completion', 'base-files', 'opkg-utils', 'libxkbcommon', 'shadow-sysroot', 'libcap', 'kmod', 'zstd', 'shadow-native', 'libseccomp', 'libpam', 'shadow', 'acl', 'base-passwd', 'initscripts', 'ncurses', 'libcap-ng', 'util-linux-libuuid', 'libxcrypt', 'zlib', 'libxml2', 'wayland', 'libxcb', 'wayland-protocols', 'xkeyboard-config', 'xz', 'openssl', 'cracklib', 'attr', 'python3', 'libffi', 'expat', 'xcb-proto', 'libxdmcp', 'libpthread-stubs', 'lib
 xau', 'xorgproto', 'util-macros', 'libnsl2', 'sqlite3', 'gdbm', 'libedit', 'bzip2', 'libtirpc']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:20: installing './compile'
| configure.ac:16: installing './config.guess'
| configure.ac:16: installing './config.sub'
| configure.ac:7: installing './install-sh'
| configure.ac:7: installing './missing'
| Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../git/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot  --disable-static
| configure: WARNING: unrecognized options: --with-libtool-sysroot, --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports nested variables... (cached) yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot understands -c and -o together... yes
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot... none
| checking for msgfmt... no
| configure: WARNING: msgfmt not found. Please install gettext
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking for libpcsclite... yes
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for winscard.h... yes
| checking for SCardEstablishContext... yes
| checking for unistd.h... (cached) yes
| checking for time.h... yes
| checking for string.h... (cached) yes
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for sys/time.h... yes
| ../git/configure: line 4855: syntax error near unexpected token `$datarootdir,'
| ../git/configure: line 4855: `AX_RECURSIVE_EVAL($datarootdir, datarootdir_exp)'
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/temp/run.do_configure.18009:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/temp/run.do_configure.18009, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/temp/run.do_configure.18009, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/temp/run.do_configure.18009, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/temp/run.do_configure.18009, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/temp/run.do_configure.18009, line 289
NOTE: recipe pcsc-tools-1.7.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1991 tasks of which 1985 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103174144.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103174144.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: pcsc-tools-1.7.0-r0 do_configure: configure failed
ERROR: pcsc-tools-1.7.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/temp/run.do_configure.18009', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/pcsc-tools/1.7.0/temp/log.do_configure.18009
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.0.bb:do_configure) failed with exit code '1'

--===============1727456021270211177==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pcsc-tools-upgrade-1.6.2-1.7.0.patch"

RnJvbSA0NDI2ZTBhODM0ZWQ2ZDIyNzRjMTYyYzNkYThkZDc4ZGExMWUwNmM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzo0MjoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBj
c2MtdG9vbHM6IHVwZ3JhZGUgMS42LjIgLT4gMS43LjAKCi0tLQogLi4uL3Bjc2MtdG9vbHMve3Bj
c2MtdG9vbHNfMS42LjIuYmIgPT4gcGNzYy10b29sc18xLjcuMC5iYn0gICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvcGNzYy10b29scy97cGNzYy10b29sc18xLjYuMi5iYiA9PiBwY3Nj
LXRvb2xzXzEuNy4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L3Bjc2MtdG9vbHMvcGNzYy10b29sc18xLjYuMi5iYiBiL21ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L3Bjc2MtdG9vbHMvcGNzYy10b29sc18xLjcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpy
ZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9wY3NjLXRvb2xzL3Bjc2MtdG9vbHNf
MS42LjIuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3Bjc2MtdG9vbHMvcGNz
Yy10b29sc18xLjcuMC5iYgppbmRleCBiNzFmYjA0MjcuLjNkZDI1N2RiNSAxMDA2NDQKLS0tIGEv
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvcGNzYy10b29scy9wY3NjLXRvb2xzXzEuNi4yLmJiCisr
KyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3Bjc2MtdG9vbHMvcGNzYy10b29sc18xLjcuMC5i
YgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRTttZDU9
OTRkNTVkNTEyYTliYTM2Y2FhOWI3ZGYwNzliYWUxOWYiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9MdWRvdmljUm91c3NlYXUvcGNzYy10b29scztwcm90b2NvbD1odHRwczticmFuY2g9
bWFzdGVyIgogCi1TUkNSRVYgPSAiYjEwMThiODMzNDZmOGEzYmMzZDQyYzk2ZjJlZDRkYzYyMTQ3
Y2IyNCIKK1NSQ1JFViA9ICJhMmM1YTE4ODkxYzNhYmFlMzNmMjJlZGI1NzlkMWQ2MmNmMjNjMWQz
IgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcKIAotLSAKMi4zOS4yCgo=

--===============1727456021270211177==--

