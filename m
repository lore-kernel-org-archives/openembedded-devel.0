Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199B3C0018C
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:48:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5666.1699084092496405105
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g/jDuENv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HjtIEnxu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b994dc125-a8e8e284-cac9-4617-adff-2c376e298eaf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cVyDliIc17LXyIgXORdg4ZnlkT85qVmCoHRA4qRRpeE=;
	b=g/jDuENvOHL9ZVMO85/bwDhsOL+UGsDptTwpQMC+QmwO+AauixlBReytwl4UGSx+
	fl/FA5qoKNpPiE5iGw6H8ZZD9RR1/4ZDWeH2T4ooZHBOOiMEQ41AJ+PvZ9SxJfTEKG4
	Fo+X7O3XHxIYRPHQRm0WXVPEKbhCgW5ivVySZIQI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cVyDliIc17LXyIgXORdg4ZnlkT85qVmCoHRA4qRRpeE=;
	b=HjtIEnxu1o371cBXWAYQqJOQIfhZI3k2lAa+inQvuUa7SL1z9Dh1+bk7JoeS3BM2
	pFCzN33+2Gi/GL4DQ3bebiKybhz9WrtLw5LULOOOXdSiyTKAgfOJpjp6tgym5p2IBUn
	KB5zAhfWIhF5Epk7JizzJBCLx9jRTwg1WfCjTmYA=
Content-Type: multipart/mixed; boundary="===============6830664651685522569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] yaffs2-utils: upgrading to
 613a901a229e8a701c18f003dd0aee18453e0670 FAILED
Message-ID: <0101018b994dc125-a8e8e284-cac9-4617-adff-2c376e298eaf-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:48:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106359

--===============6830664651685522569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *yaffs2-utils* to *613a901a229e8a701c18f003dd0aee18453e0670* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-yaffs2-utils-upgrade-to-latest-revision.patch
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
From a19aadf841bf21188a2a6d3f859890a5632c7979 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:41:28 +0000
Subject: [PATCH] yaffs2-utils: upgrade to latest revision

---
 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 6bf321e23..21cd299ca 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
            file://0001-define-loff_t-if-not-already-defined.patch \
            "
 
-SRCREV = "9a6f486e56f927eeb8dc7e4e0d84f6bb95eeaa0f"
+SRCREV = "613a901a229e8a701c18f003dd0aee18453e0670"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.39.2


--===============6830664651685522569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4893 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
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
meta-webserver       = "tmp-auh-upgrades:59e27d4b8bfd5df634ce47dc6630194370d65b5b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 202 Local 193 Mirrors 0 Missed 9 Current 208 (95% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 217 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 219 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 226 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_create_spdx_setscene)
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe mtd-utils-2.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 308 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_recipe_qa_setscene)
NOTE: recipe mtd-utils-2.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 341 of 1181 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_fetch)
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 368 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 344 of 1181 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 375 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 930 of 1181 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_patch)
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_patch: Started
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 410 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1139 of 1181 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1168 of 1181 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_collect_spdx_deps)
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1169 of 1181 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_configure)
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_configure: Started
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 1170 of 1181 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_compile)
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52 -e MAKEFLAGS=
| ln -s ../yaffs_packedtags2.c yaffs_packedtags2.c
| ln -s ../yaffs_ecc.c yaffs_ecc.c
| ln -s ../yaffs_ecc.h yaffs_ecc.h
| ln -s ../yaffs_guts.h yaffs_guts.h
| ln -s ../yaffs_packedtags2.h yaffs_packedtags2.h
| ln -s ../yaffs_trace.h yaffs_trace.h
| ln -s ../yaffs_endian.h yaffs_endian.h
| ln -s ../direct/yaffs_hweight.c yaffs_hweight.c
| ln -s ../direct/yportenv.h yportenv.h
| ln -s ../direct/yaffs_hweight.h yaffs_hweight.h
| ln -s ../direct/yaffs_list.h yaffs_list.h
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/
 usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot-native=  -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES mkyaffsimage.c -o mkyaffsimage.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/
 usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot-native=  -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES yaffs_hweight.c -o yaffs_hweight.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/
 usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot-native=  -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES yaffs_ecc.c -o yaffs_ecc.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/
 usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot-native=  -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES mkyaffs2image.c -o mkyaffs2image.o
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/git=/
 usr/src/debug/yaffs2-utils/0.0+git-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/recipe-sysroot-native=  -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES yaffs_packedtags2.c -o yaffs_packedtags2.o
| In file included from yaffs_packedtags2.h:20,
|                  from yaffs_packedtags2.c:13:
| yaffs_guts.h:501:9: error: unknown type name 'YTIME_T'
|   501 |         YTIME_T yst_uid;
|       |         ^~~~~~~
| yaffs_guts.h:502:9: error: unknown type name 'YTIME_T'
|   502 |         YTIME_T yst_gid;
|       |         ^~~~~~~
| yaffs_guts.h:503:9: error: unknown type name 'YTIME_T'
|   503 |         YTIME_T yst_atime;
|       |         ^~~~~~~
| yaffs_guts.h:504:9: error: unknown type name 'YTIME_T'
|   504 |         YTIME_T yst_mtime;
|       |         ^~~~~~~
| yaffs_guts.h:505:9: error: unknown type name 'YTIME_T'
|   505 |         YTIME_T yst_ctime;
|       |         ^~~~~~~
| yaffs_guts.h:1080:1: error: unknown type name 'YTIME_T'
|  1080 | YTIME_T yaffs_oh_ctime_fetch(struct yaffs_obj_hdr *oh);
|       | ^~~~~~~
| yaffs_guts.h:1081:1: error: unknown type name 'YTIME_T'
|  1081 | YTIME_T yaffs_oh_mtime_fetch(struct yaffs_obj_hdr *oh);
|       | ^~~~~~~
| yaffs_guts.h:1082:1: error: unknown type name 'YTIME_T'
|  1082 | YTIME_T yaffs_oh_atime_fetch(struct yaffs_obj_hdr *oh);
|       | ^~~~~~~
| In file included from yaffs_packedtags2.c:16:
| yaffs_endian.h:40:15: error: unknown type name 'YTIME_T'
|    40 | static inline YTIME_T swap_ytime_t(YTIME_T val)
|       |               ^~~~~~~
| yaffs_endian.h:40:36: error: unknown type name 'YTIME_T'
|    40 | static inline YTIME_T swap_ytime_t(YTIME_T val)
|       |                                    ^~~~~~~
| make: *** [Makefile:56: yaffs_packedtags2.o] Error 1
| make: *** Waiting for unfinished jobs....
| In file included from mkyaffsimage.c:30:
| yaffs_guts.h:501:9: error: unknown type name 'YTIME_T'
|   501 |         YTIME_T yst_uid;
|       |         ^~~~~~~
| yaffs_guts.h:502:9: error: unknown type name 'YTIME_T'
|   502 |         YTIME_T yst_gid;
|       |         ^~~~~~~
| yaffs_guts.h:503:9: error: unknown type name 'YTIME_T'
|   503 |         YTIME_T yst_atime;
|       |         ^~~~~~~
| yaffs_guts.h:504:9: error: unknown type name 'YTIME_T'
|   504 |         YTIME_T yst_mtime;
|       |         ^~~~~~~
| yaffs_guts.h:505:9: error: unknown type name 'YTIME_T'
|   505 |         YTIME_T yst_ctime;
|       |         ^~~~~~~
| yaffs_guts.h:1080:1: error: unknown type name 'YTIME_T'
|  1080 | YTIME_T yaffs_oh_ctime_fetch(struct yaffs_obj_hdr *oh);
|       | ^~~~~~~
| yaffs_guts.h:1081:1: error: unknown type name 'YTIME_T'
|  1081 | YTIME_T yaffs_oh_mtime_fetch(struct yaffs_obj_hdr *oh);
|       | ^~~~~~~
| yaffs_guts.h:1082:1: error: unknown type name 'YTIME_T'
|  1082 | YTIME_T yaffs_oh_atime_fetch(struct yaffs_obj_hdr *oh);
|       | ^~~~~~~
| In file included from mkyaffs2image.c:34:
| yaffs_guts.h:501:9: error: unknown type name 'YTIME_T'
|   501 |         YTIME_T yst_uid;
|       |         ^~~~~~~
| yaffs_guts.h:502:9: error: unknown type name 'YTIME_T'
|   502 |         YTIME_T yst_gid;
|       |         ^~~~~~~
| yaffs_guts.h:503:9: error: unknown type name 'YTIME_T'
|   503 |         YTIME_T yst_atime;
|       |         ^~~~~~~
| yaffs_guts.h:504:9: error: unknown type name 'YTIME_T'
|   504 |         YTIME_T yst_mtime;
|       |         ^~~~~~~
| yaffs_guts.h:505:9: error: unknown type name 'YTIME_T'
|   505 |         YTIME_T yst_ctime;
|       |         ^~~~~~~
| yaffs_guts.h:1080:1: error: unknown type name 'YTIME_T'
|  1080 | YTIME_T yaffs_oh_ctime_fetch(struct yaffs_obj_hdr *oh);
|       | ^~~~~~~
| yaffs_guts.h:1081:1: error: unknown type name 'YTIME_T'
|  1081 | YTIME_T yaffs_oh_mtime_fetch(struct yaffs_obj_hdr *oh);
|       | ^~~~~~~
| yaffs_guts.h:1082:1: error: unknown type name 'YTIME_T'
|  1082 | YTIME_T yaffs_oh_atime_fetch(struct yaffs_obj_hdr *oh);
|       | ^~~~~~~
| In file included from mkyaffs2image.c:35:
| yaffs_endian.h:40:15: error: unknown type name 'YTIME_T'
|    40 | static inline YTIME_T swap_ytime_t(YTIME_T val)
|       |               ^~~~~~~
| yaffs_endian.h:40:36: error: unknown type name 'YTIME_T'
|    40 | static inline YTIME_T swap_ytime_t(YTIME_T val)
|       |                                    ^~~~~~~
| make: *** [Makefile:56: mkyaffsimage.o] Error 1
| make: *** [Makefile:56: mkyaffs2image.o] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/temp/run.do_compile.2966168:167 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/temp/run.do_compile.2966168, line 167
| 	#2: die, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/temp/run.do_compile.2966168, line 151
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/temp/run.do_compile.2966168, line 146
| 	#4: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/temp/run.do_compile.2966168, line 141
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/temp/run.do_compile.2966168, line 180
NOTE: recipe yaffs2-utils-0.0+git-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1170 tasks of which 1163 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104074106.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104074106.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: yaffs2-utils-0.0+git-r0 do_compile: oe_runmake failed
ERROR: yaffs2-utils-0.0+git-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/temp/run.do_compile.2966168', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/yaffs2-utils/0.0+git/temp/log.do_compile.2966168
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb:do_compile) failed with exit code '1'

--===============6830664651685522569==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-yaffs2-utils-upgrade-to-latest-revision.patch"

RnJvbSBhMTlhYWRmODQxYmYyMTE4OGEyYTZkM2Y4NTk4OTBhNTYzMmM3OTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzo0MToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHlh
ZmZzMi11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS1maWxlc3lz
dGVtcy9yZWNpcGVzLWZpbGVzeXN0ZW1zL3lhZmZzMi95YWZmczItdXRpbHNfZ2l0LmJiIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLWZpbGVzeXN0ZW1zL3lhZmZzMi95YWZmczIt
dXRpbHNfZ2l0LmJiIGIvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLWZpbGVzeXN0ZW1zL3lhZmZz
Mi95YWZmczItdXRpbHNfZ2l0LmJiCmluZGV4IDZiZjMyMWUyMy4uMjFjZDI5OWNhIDEwMDY0NAot
LS0gYS9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtZmlsZXN5c3RlbXMveWFmZnMyL3lhZmZzMi11
dGlsc19naXQuYmIKKysrIGIvbWV0YS1maWxlc3lzdGVtcy9yZWNpcGVzLWZpbGVzeXN0ZW1zL3lh
ZmZzMi95YWZmczItdXRpbHNfZ2l0LmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiZ2l0
Oi8vd3d3LmFsZXBoMS5jby51ay95YWZmczI7cHJvdG9jb2w9Z2l0O2JyYW5jaD1tYXN0ZXIgXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1kZWZpbmUtbG9mZl90LWlmLW5vdC1hbHJlYWR5LWRlZmlu
ZWQucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI5YTZmNDg2ZTU2ZjkyN2VlYjhk
YzdlNGUwZDg0ZjZiYjk1ZWVhYTBmIgorU1JDUkVWID0gIjYxM2E5MDFhMjI5ZThhNzAxYzE4ZjAw
M2RkMGFlZTE4NDUzZTA2NzAiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKIAotLSAK
Mi4zOS4yCgo=

--===============6830664651685522569==--

