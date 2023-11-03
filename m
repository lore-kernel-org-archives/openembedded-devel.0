Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA7CC25B4C
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62988.1699041169001019615
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CqMY+sgR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q0zjCkXK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96becc24-3c0ae864-ac90-45a9-b616-d2ce933260e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G+qR4FBq9tcIbG/kP8S1/mRyv9GV9CwxtqpL40S+z10=;
	b=CqMY+sgRWPi5rPhcUYl05qlGoxc2yjO29QrPAMAriajmcVID1GHKibg1GV/v8H7Y
	Dj4NqERDlH8fywLyKL26ncxAtSKBJyqbU1FC9E4kl9K0ZIXl8s/7WRDUwXgEkpNmqDD
	msZDhjbyStfmjYcEjIa57NaMJy+RbL4L214CYAwE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G+qR4FBq9tcIbG/kP8S1/mRyv9GV9CwxtqpL40S+z10=;
	b=Q0zjCkXKJTmdEfpk//qOKQR11l8a7nZQaAHwxCCKF8K7U8nHU7Qg0SjtGoFcEqeq
	dxsZ6zJZNXbagehwvJ0RLPPePUZR6/h19iB2cBK6eNbAgUvdOU+BFCHnsfIg6HPI3qp
	qc5DULxuA5Hvph2trnQgrxrE90uEXUm694VZUY5Y=
Content-Type: multipart/mixed; boundary="===============2751273310448539770=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libdbd-mysql-perl: upgrading to 5.002 FAILED
Message-ID: <0101018b96becc24-3c0ae864-ac90-45a9-b616-d2ce933260e7-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105958

--===============2751273310448539770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdbd-mysql-perl* to *5.002* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libdbd-mysql-perl-upgrade-4.050-5.002.patch
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
From 5be469aec50df869a087cb6c5e9f394f95c1d77d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 13:48:33 +0000
Subject: [PATCH] libdbd-mysql-perl: upgrade 4.050 -> 5.002

---
 .../{libdbd-mysql-perl_4.050.bb => libdbd-mysql-perl_5.002.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libdbd-mysql-perl_4.050.bb => libdbd-mysql-perl_5.002.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
rename to meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb
index fc505fe1e..dc41177e4 100644
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb
@@ -14,7 +14,7 @@ DEPENDS += "libdev-checklib-perl-native libdbi-perl-native libmysqlclient"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d0a06964340e5c0cde88b7af611f755c"
 
-SRCREV = "9b5b70ea372f49fe9bc9e592dae3870596d1e3d6"
+SRCREV = "d52d3bd0792d232e3d77c93295cc8b59de142708"
 SRC_URI = "git://github.com/perl5-dbi/DBD-mysql.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============2751273310448539770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4966 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:8cba9f53d5d22086feff4858ce7f8edc5b1fbe6b"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 444 Local 434 Mirrors 0 Missed 10 Current 339 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 342 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 349 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_populate_lic_setscene)
NOTE: Running setscene task 351 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 362 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 783 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb:do_create_spdx_setscene)
NOTE: Running setscene task 445 of 783 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 783 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 783 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_populate_lic_setscene: Started
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdbi-perl-native-1.643-r0: task do_create_spdx_setscene: Started
NOTE: recipe mariadb-10.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdev-checklib-perl-native-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdev-checklib-perl-native-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdbi-perl-native-1.643-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdbi-perl-native-1.643-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 547 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_recipe_qa_setscene)
NOTE: recipe libdev-checklib-perl-native-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mariadb-10.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdev-checklib-perl-native-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 783 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libdev-checklib-perl-native-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdbi-perl-native-1.643-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 783 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb:do_recipe_qa_setscene)
NOTE: Running task 566 of 2195 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_fetch)
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_fetch: Started
NOTE: recipe libdbi-perl-native-1.643-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 716 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 724 of 783 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: recipe libdev-checklib-perl-native-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-native-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdbi-perl-native-1.643-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_fetch: Succeeded
NOTE: Running task 590 of 2195 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_unpack)
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 728 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe perl-native-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 739 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 741 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_unpack: Succeeded
NOTE: Running task 1440 of 2195 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_patch)
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_patch: Started
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 783 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2022 of 2195 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2179 of 2195 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_collect_spdx_deps)
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2183 of 2195 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_configure)
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/per
 l/libdev-checklib-perl_1.16.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['mariadb', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'perl', 'quilt-native', 'libdbi-perl-native', 'libdev-checklib-perl-native', 'patch-native', 'perl-native', 'pseudo-native', 'libpam', 'shadow-sysroot', 'libevent', 'curl', 'fmt', 'opkg-utils', 'libxml2', 'base-files', 'zstd', 'update-rc.d', 'zlib', 'ncurses', 'initscripts', 'libedit', 'openssl', 'gnutls', 'libaio', 'lzo', 'shadow-native', 'base-passwd', 'libpcre2', 'lz4', 'shadow', 'boost', 'linux-libc-headers', 'zstd-native', 'zlib-native', 'xz-native', 'mpfr-native', 'libtool-native', 'gmp-native', 'flex-native', 'gnu-config-native', 'libmpc-native', 'binutils-cross-x86_64', 'texinfo-dummy-native', 'gdbm', 'libxcrypt', 'libgcc', 'attr-native', 'gdbm-native', 'make-native', 'cracklib', 'libidn2', 'python3', 'nettle', 'gmp', 'libunistring', 'libseccomp', 'libtasn1', 'bzip2', 'attr', 'icu', 'gettext-minimal-native', 'm4-native', 'libnsl2', 'xz', 'util-linux-libuuid', 'libffi', 'expa
 t', 'libtirpc', 'sqlite3']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| *** Module name IN: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.0/x86_64-linux/Cwd.pm
| *** p1: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.38.0/  p5: x86_64-linux/ p7: Cwd.pm
| *** Module name OUT: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/lib/perl5/5.38.0/x86_64-linux/Cwd.pm
| *** Module name IN: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.0/x86_64-linux/Encode.pm
| *** p1: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.38.0/  p5: x86_64-linux/ p7: Encode.pm
| *** Module name OUT: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/lib/perl5/5.38.0/x86_64-linux/Encode.pm
| *** Module name IN: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.0/x86_64-linux/Fcntl.pm
| *** p1: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.38.0/  p5: x86_64-linux/ p7: Fcntl.pm
| *** Module name OUT: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/lib/perl5/5.38.0/x86_64-linux/Fcntl.pm
| *** Module name IN: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.0/x86_64-linux/Storable.pm
| *** p1: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.38.0/  p5: x86_64-linux/ p7: Storable.pm
| *** Module name OUT: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/lib/perl5/5.38.0/x86_64-linux/Storable.pm
| *** Module name IN: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.0/x86_64-linux/I18N/Langinfo.pm
| *** p1: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.38.0/  p5: x86_64-linux/ p7: I18N/Langinfo.pm
| *** Module name OUT: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/lib/perl5/5.38.0/x86_64-linux/I18N/Langinfo.pm
| *** Module name IN: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.0/x86_64-linux/Data/Dumper.pm
| *** p1: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.38.0/  p5: x86_64-linux/ p7: Data/Dumper.pm
| *** Module name OUT: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/lib/perl5/5.38.0/x86_64-linux/Data/Dumper.pm
| *** Module name IN: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.0/x86_64-linux/IO.pm
| *** p1: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.38.0/  p5: x86_64-linux/ p7: IO.pm
| *** Module name OUT: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/lib/perl5/5.38.0/x86_64-linux/IO.pm
| *** Module name IN: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.0/x86_64-linux/List/Util.pm
| *** p1: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.38.0/  p5: x86_64-linux/ p7: List/Util.pm
| *** Module name OUT: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/lib/perl5/5.38.0/x86_64-linux/List/Util.pm
| *** Module name IN: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.38.0/x86_64-linux/Time/HiRes.pm
| *** p1: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/  p3: perl5/5.38.0/  p5: x86_64-linux/ p7: Time/HiRes.pm
| *** Module name OUT: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/recipe-sysroot-native/usr/lib/perl5/5.38.0/x86_64-linux/Time/HiRes.pm
| 
| 
| PLEASE NOTE:
| 
| For 'make test' to run properly, you must ensure that the
| database user 'pokybuild' can connect to your MySQL server
| and has the proper privileges that these tests require such
| as 'drop table', 'create table', 'drop procedure', 'create procedure'
| as well as others.
| 
| mysql> CREATE USER 'pokybuild'@'localhost' IDENTIFIED BY 's3kr1t';
| mysql> GRANT ALL PRIVILEGES ON test.* TO 'pokybuild'@'localhost';
| 
| You can also optionally set the user to run 'make test' with:
| 
| perl Makefile.PL --testuser=username
| 
| DBD::mysql requires MySQL 8.x for building. Version reported by mysql_config --version: 10.11.5 at Makefile.PL line 450, <PIPE> line 3.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/temp/run.do_configure.3708323:154 exit 255 from 'perl Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 PERL=$(which perl)'
| WARNING: Backtrace (BB generated script):
| 	#1: cpan_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/temp/run.do_configure.3708323, line 154
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/temp/run.do_configure.3708323, line 147
| 	#3: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/temp/run.do_configure.3708323, line 189
NOTE: recipe libdbd-mysql-perl-5.002-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2183 tasks of which 2177 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 13 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103134712.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103134712.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libdbd-mysql-perl-5.002-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/temp/run.do_configure.3708323', 255, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/5.002/temp/log.do_configure.3708323
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.002.bb:do_configure) failed with exit code '1'

--===============2751273310448539770==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdbd-mysql-perl-upgrade-4.050-5.002.patch"

RnJvbSA1YmU0NjlhZWM1MGRmODY5YTA4N2NiNmM1ZTlmMzk0Zjk1YzFkNzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMzo0ODozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRiZC1teXNxbC1wZXJsOiB1cGdyYWRlIDQuMDUwIC0+IDUuMDAyCgotLS0KIC4uLi97bGliZGJk
LW15c3FsLXBlcmxfNC4wNTAuYmIgPT4gbGliZGJkLW15c3FsLXBlcmxfNS4wMDIuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3tsaWJkYmQtbXlzcWwtcGVybF80LjA1MC5i
YiA9PiBsaWJkYmQtbXlzcWwtcGVybF81LjAwMi5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRh
LW9lL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJkYmQtbXlzcWwtcGVybF80LjA1MC5iYiBiL21l
dGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYmRiZC1teXNxbC1wZXJsXzUuMDAyLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9w
ZXJsL2xpYmRiZC1teXNxbC1wZXJsXzQuMDUwLmJiCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9saWJkYmQtbXlzcWwtcGVybF81LjAwMi5iYgppbmRleCBmYzUwNWZlMWUu
LmRjNDExNzdlNCAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGli
ZGJkLW15c3FsLXBlcmxfNC4wNTAuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvbGliZGJkLW15c3FsLXBlcmxfNS4wMDIuYmIKQEAgLTE0LDcgKzE0LDcgQEAgREVQRU5EUyAr
PSAibGliZGV2LWNoZWNrbGliLXBlcmwtbmF0aXZlIGxpYmRiaS1wZXJsLW5hdGl2ZSBsaWJteXNx
bGNsaWVudCIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZDBhMDY5
NjQzNDBlNWMwY2RlODhiN2FmNjExZjc1NWMiCiAKLVNSQ1JFViA9ICI5YjViNzBlYTM3MmY0OWZl
OWJjOWU1OTJkYWUzODcwNTk2ZDFlM2Q2IgorU1JDUkVWID0gImQ1MmQzYmQwNzkyZDIzMmUzZDc3
YzkzMjk1Y2M4YjU5ZGUxNDI3MDgiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcGVybDUt
ZGJpL0RCRC1teXNxbC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKIAogUyA9ICIk
e1dPUktESVJ9L2dpdCIKLS0gCjIuMzkuMgoK

--===============2751273310448539770==--

