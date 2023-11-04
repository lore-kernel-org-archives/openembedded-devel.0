Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC86C001DD
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.3557.1699067574652257919
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=blQ64YME;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NqXIySHK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b9851bbc4-b6ca752c-d6c5-4e46-9c41-ed6fac4865c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pP+BQWysLcLtbZrBMn2NXkt6rZ6HXmRNmvhGfUncXTE=;
	b=blQ64YMEH/ame5iLUmKoQu6XrIBtFOA1XmHQcnbANWPlxGa3/UYNsKexHcgtpVEK
	GfRug/u11oaIOFN4ttG+f3DWxjl9sJdM2KmmssrO4ti1RTpnckC+2N0lTsVcF9ooKhp
	vhZoFu6xKhuQJ4W79Ldp+eucx9EUxjcIn8G50mj8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pP+BQWysLcLtbZrBMn2NXkt6rZ6HXmRNmvhGfUncXTE=;
	b=NqXIySHK/d3FZRGOs9WWbglam2NXuY4w4O1N+AnnsyXViayghG7srMYW5AmIhs0k
	Dt4R3t8N4fCPIcWY3lWFaIoqMl+Tws07H2i/GMm38/42bYPevEYhs9QnxEjOvX55qyI
	TM4shOt2HmusNN4Apq1mg3RHzuC2HCJQ4VflzpYE=
Content-Type: multipart/mixed; boundary="===============3234828879404585922=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] weechat: upgrading to 4.1.1 FAILED
Message-ID: <0101018b9851bbc4-b6ca752c-d6c5-4e46-9c41-ed6fac4865c6-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106228

--===============3234828879404585922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weechat* to *4.1.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-weechat-upgrade-4.0.4-4.1.1.patch
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
From a42d76101f90d9cb33a5a7aa6426a30c05497dd0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 03:03:49 +0000
Subject: [PATCH] weechat: upgrade 4.0.4 -> 4.1.1

---
 .../recipes-irc/weechat/{weechat_4.0.4.bb => weechat_4.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.0.4.bb => weechat_4.1.1.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.0.4.bb b/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_4.0.4.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.1.1.bb
index d13764e4c..13bfa0df3 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.0.4.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
 
-SRC_URI[sha256sum] = "ae5f4979b5ada0339b84e741d5f7e481ee91e3fecd40a09907b64751829eb6f6"
+SRC_URI[sha256sum] = "774238614d8e63e4d3d5a73a6cb640ec76fe06cc982b87a8c923651579277675"
 
 inherit cmake pkgconfig
 
-- 
2.39.2


--===============3234828879404585922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4915 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:484209844c3fb0b382a04359276b208d4fd12a3c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 339 Local 330 Mirrors 0 Missed 9 Current 290 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 299 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 301 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 354 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 355 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe weechat-4.1.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe weechat-4.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe weechat-4.1.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe weechat-4.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 484 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 523 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 533 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 535 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: recipe weechat-4.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe weechat-4.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 464 of 1762 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe weechat-4.1.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 576 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe weechat-4.1.1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 589 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1078 of 1762 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_unpack)
NOTE: recipe weechat-4.1.1-r0: task do_unpack: Started
NOTE: recipe weechat-4.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1192 of 1762 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_patch)
NOTE: recipe weechat-4.1.1-r0: task do_patch: Started
NOTE: recipe weechat-4.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 1762 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_generate_toolchain_file)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe weechat-4.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe weechat-4.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1592 of 1762 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1746 of 1762 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_collect_spdx_deps)
NOTE: recipe weechat-4.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weechat-4.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe weechat-4.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weechat-4.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1750 of 1762 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_configure)
NOTE: recipe weechat-4.1.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta
 /recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysro
 ot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'glibc', 'ncurses', 'zlib', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'python3', 'quilt-native', 'zstd', 'aspell', 'curl', 'gnutls', 'icu', 'libgcrypt', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'xz-native', 'libidn2', 'opkg-utils', 'libtool-native', 'attr-native', 'linux-libc-headers', 'libseccomp', 'gmp', 'libunistring', 'libtasn1', 'nettle', 'libgpg-error', 'libcap', 'gettext-minimal-native', 'flex-native', 'binutils-cross-x86_64', 'texinfo-dummy-native', 'gnu-config-native', 'gmp-native', 'mpfr-native', 'libmpc-native', 'zlib-native', 'zstd-native', 're2c-native', 'libgcc', 'libnsl2', 'sqlite3', 'libxcrypt', 'xz', 'bzip2', 'libffi', 'expat', 'libtirpc', 'gdbm', 'libedit', 'util-linux-libuuid', 'openssl-native', 'bzip2-native', 'ncurses-native', 'libpam', 'm4-native', 'perl-native', 'cracklib', 'gdbm-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 13.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Found PkgConfig: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2")
| -- Looking for include file langinfo.h
| -- Looking for include file langinfo.h - found
| -- Looking for include file sys/resource.h
| -- Looking for include file sys/resource.h - found
| -- Looking for mallinfo
| -- Looking for mallinfo - found
| -- Looking for mallinfo2
| -- Looking for mallinfo2 - found
| -- Looking for eat_newline_glitch
| -- Looking for eat_newline_glitch - found
| -- Found GCRYPT: -lgcrypt
| -- Found ZLIB: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/recipe-sysroot/usr/lib/libz.so (found version "1.3.#define ZLIB_VERSION "1.3"")
| -- Checking for module 'libzstd'
| --   Found libzstd, version 1.5.5
| -- Looking for iconv_open
| -- Looking for iconv_open - found
| -- Performing Test ICONV_2ARG_IS_CONST
| -- Performing Test ICONV_2ARG_IS_CONST - Failed
| -- Found CURL: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/recipe-sysroot/usr/lib/libcurl.so (found version "8.4.0")
| -- Looking for include file libintl.h
| -- Looking for include file libintl.h - found
| -- Looking for dgettext
| -- Looking for dgettext - not found
| -- Found Intl: built in to C library
| CMake Error at po/CMakeLists.txt:21 (find_program):
|   Could not find XGETTEXT_EXECUTABLE using the following names: xgettext
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/temp/run.do_configure.793748:166 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/weechat-4.1.1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yoc
 to-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DENABLE_NCURSES=ON -DENABLE_PYTHON=ON -DENABLE_PHP=OFF -DENABLE_TCL=OFF -DENABLE_LUA=OFF -DENABLE_JAVASCRIPT=OFF -DENABLE_RUBY=OFF -DENABLE_GUILE=OFF -DENABLE_PERL=OFF -DENABLE_ASPELL=ON -DLIBDIR=/usr/lib -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/temp/run.do_configure.793748, line 166
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/temp/run.do_configure.793748, line 145
| 	#3: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/temp/run.do_configure.793748, line 184
NOTE: recipe weechat-4.1.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1750 tasks of which 1743 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104030328.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104030328.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: weechat-4.1.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/temp/run.do_configure.793748', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/weechat/4.1.1/temp/log.do_configure.793748
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-irc/weechat/weechat_4.1.1.bb:do_configure) failed with exit code '1'

--===============3234828879404585922==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weechat-upgrade-4.0.4-4.1.1.patch"

RnJvbSBhNDJkNzYxMDFmOTBkOWNiMzNhNWE3YWE2NDI2YTMwYzA1NDk3ZGQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMzowMzo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
ZWNoYXQ6IHVwZ3JhZGUgNC4wLjQgLT4gNC4xLjEKCi0tLQogLi4uL3JlY2lwZXMtaXJjL3dlZWNo
YXQve3dlZWNoYXRfNC4wLjQuYmIgPT4gd2VlY2hhdF80LjEuMS5iYn0gIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1uZXR3
b3JraW5nL3JlY2lwZXMtaXJjL3dlZWNoYXQve3dlZWNoYXRfNC4wLjQuYmIgPT4gd2VlY2hhdF80
LjEuMS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1pcmMv
d2VlY2hhdC93ZWVjaGF0XzQuMC40LmJiIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtaXJjL3dl
ZWNoYXQvd2VlY2hhdF80LjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBt
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1pcmMvd2VlY2hhdC93ZWVjaGF0XzQuMC40LmJiCnJlbmFt
ZSB0byBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1pcmMvd2VlY2hhdC93ZWVjaGF0XzQuMS4xLmJi
CmluZGV4IGQxMzc2NGU0Yy4uMTNiZmEwZGYzIDEwMDY0NAotLS0gYS9tZXRhLW5ldHdvcmtpbmcv
cmVjaXBlcy1pcmMvd2VlY2hhdC93ZWVjaGF0XzQuMC40LmJiCisrKyBiL21ldGEtbmV0d29ya2lu
Zy9yZWNpcGVzLWlyYy93ZWVjaGF0L3dlZWNoYXRfNC4xLjEuYmIKQEAgLTEwLDcgKzEwLDcgQEAg
U1JDX1VSSSA9ICJodHRwczovL3dlZWNoYXQub3JnL2ZpbGVzL3NyYy93ZWVjaGF0LSR7UFZ9LnRh
ci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXVzZS1wa2ctY29uZmlnLWZvci1nY3J5cHQt
aW5zdGVhZC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFl
NWY0OTc5YjVhZGEwMzM5Yjg0ZTc0MWQ1ZjdlNDgxZWU5MWUzZmVjZDQwYTA5OTA3YjY0NzUxODI5
ZWI2ZjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzc0MjM4NjE0ZDhlNjNlNGQzZDVhNzNhNmNi
NjQwZWM3NmZlMDZjYzk4MmI4N2E4YzkyMzY1MTU3OTI3NzY3NSIKIAogaW5oZXJpdCBjbWFrZSBw
a2djb25maWcKIAotLSAKMi4zOS4yCgo=

--===============3234828879404585922==--

