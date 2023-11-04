Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22016C072A2
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.5528.1699083060961518797
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eMnwUt4k;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=irW1k91z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b993e03de-8db78683-c932-4f36-aa41-081bb8f180b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bJ/xSl531hWFMD/oewqBtO8WnjNoGv4YErCuUJVnjMU=;
	b=eMnwUt4kXcivUulO8+4AkeQ8vhvylbIFPTnxm8HLnrtMRa9RinsTFmISd+HaE0Yy
	xwTcGAB0kRkFdchHZsbDUX9EoUUT1GgPLVgtOYTQJjaEz5id2kHN6Kx6rlVf4OpQ74t
	RsVsrNjfNSmhqbvVSv9TvLCuhys6PUURvGLGFwpM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bJ/xSl531hWFMD/oewqBtO8WnjNoGv4YErCuUJVnjMU=;
	b=irW1k91zr0y5tbhgKPKucWqk3xt772JFdeOS7F//km23BG4W1cQwTKc/xFRAUHsH
	CDCLKI+DCJTxVROFfZ5vqj46k1lq4qD1pTSrrOLwDhZFoo/teH3Rr+lquJW/4Oe+cdk
	0HHf8ZuOxy7aoaKQCGbbw0kBPNtLAs8uEsFjP+fI=
Content-Type: multipart/mixed; boundary="===============2814714485219380833=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-power-manager: upgrading to 4.19.1 FAILED
Message-ID: <0101018b993e03de-8db78683-c932-4f36-aa41-081bb8f180b3-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106334

--===============2814714485219380833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-power-manager* to *4.19.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xfce4-power-manager-upgrade-4.18.1-4.19.1.patch
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
From be7f8cfafcfa2fed04ae1b6aaca052cd671589a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:42:29 +0000
Subject: [PATCH] xfce4-power-manager: upgrade 4.18.1 -> 4.19.1

---
 ...e4-power-manager_4.18.1.bb => xfce4-power-manager_4.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.18.1.bb => xfce4-power-manager_4.19.1.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb
index f7f72356d..abeb26a19 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb
@@ -11,7 +11,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[sha256sum] = "6b08b10c4cb7516377dbd32c6cc2296a9faf47022c555f11e75b38fde14aff03"
+SRC_URI[sha256sum] = "b2623f7ab32558b86df69c4bc73f602b70ef59076af57d20a1479b30e14e097d"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.39.2


--===============2814714485219380833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4947 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:2758a3606011c40f3c1fad7a340858a73259b575"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 739 Local 730 Mirrors 0 Missed 9 Current 666 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 682 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/upower/upower_0.99.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 685 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 692 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 694 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 716 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxscrnsaver-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe upower-0.99.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe upower-0.99.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_recipe_qa_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxscrnsaver-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 930 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 931 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1061 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1112 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 813 of 3825 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1208 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_fetch: Started
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: Running task 939 of 3825 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1323 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1350 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1352 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1357 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1359 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1363 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1370 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1372 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 2421 of 3825 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_patch)
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_patch: Started
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1400 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1402 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1405 of 1405 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3693 of 3825 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3779 of 3825 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_collect_spdx_deps)
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3813 of 3825 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_configure)
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/upower/upower_0.99.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:d
 o_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb:do_populate_sysroot', 'virtual:na
 tive:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/
 gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['upower', 'xfce4-panel', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'gdk-pixbuf', 'gtk+3', 'hicolor-icon-theme', 'libnotify', 'libx11', 'libxext', 'libxrandr', 'libxscrnsaver', 'gettext-native', 'autoconf-native', 'automake-native', 'intltool-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'gtk+3-native', 'texinfo-dummy-native', 'libgudev', 'libusb1', 'systemd', 'glib-2.0', 'dbus-glib', 'gobject-introspection', 'libxml-parser-perl-native', 'xorgproto', 'util-macros', 'gmp-native', 'zstd-native', 'libmpc-native', 'linux-libc-headers', 'xz-native', 'gnu-config-native', 'binutils-cross-x86_64', 'flex-native', 'zlib-native', 'mpfr-native', 'attr-native', 'glib-2.0-native', 'at-spi2-core-native', 'python3-native', 'libxcomposite-native', 'gdk-pixbuf-native', 'libxrandr-native', 'libxfixes-native', 'libxext-native', 'gobject-introspection-native', 'gettext-minimal-native', 'lib
 png-native', 'libjpeg-turbo-native', 'cairo-native', 'libx11-native', 'libxrender-native', 'fontconfig-native', 'libxdamage-native', 'libxcursor-native', 'libxi-native', 'pango-native', 'cairo', 'libxml2', 'desktop-file-utils', 'libwnck3', 'exo', 'garcon', 'libgcc', 'libxcomposite', 'libjpeg-turbo', 'libxfixes', 'opkg-utils', 'libxkbcommon', 'wayland', 'pango', 'fontconfig', 'at-spi2-core', 'libxrender', 'libpng', 'libxdamage', 'libxcursor', 'libepoxy', 'mesa', 'libxi', 'wayland-protocols', 'xtrans', 'libxcb', 'm4-native', 'shared-mime-info', 'libcap', 'util-linux', 'shadow-native', 'update-rc.d', 'shadow', 'libseccomp', 'kmod', 'base-passwd', 'base-files', 'initscripts', 'shadow-sysroot', 'zstd', 'libpam', 'acl', 'bash-completion', 'zlib', 'libpcre2', 'libffi', 'expat', 'dbus', 'python3', 'perl-native', 'expat-native', 'util-linux-native', 'libffi-native', 'libpcre2-native', 'libxtst-native', 'libxml2-native', 'dbus-native', 'libedit-native', 'openssl-native', 'sqlite3-native', 'bz
 ip2-native', 'ncurses-native', 'libtirpc-native', 'gdbm-native', 'util-linux-libuuid-native', 'libnsl2-native', 'util-macros-native', 'xorgproto-native', 'shared-mime-info-native', 'cmake-native', 'pixman-native', 'libsm-native', 'libxcb-native', 'xtrans-native', 'freetype-native', 'libxft-native', 'harfbuzz-native', 'fribidi-native', 'pixman', 'libsm', 'startup-notification', 'libxres', 'libxfce4ui', 'xkeyboard-config', 'freetype', 'harfbuzz', 'fribidi', 'libxft', 'libxtst', 'libxshmfence', 'vulkan-headers', 'xrandr', 'libdrm', 'libxxf86vm', 'vulkan-loader', 'xcb-proto', 'libxdmcp', 'libxau', 'libpthread-stubs', 'libxcrypt', 'ncurses', 'util-linux-libuuid', 'libcap-ng', 'attr', 'openssl', 'xz', 'cracklib', 'bzip2', 'libedit', 'libtirpc', 'sqlite3', 'gdbm', 'libnsl2', 'make-native', 'libcap-ng-native', 'itstool-native', 'libice-native', 'libpthread-stubs-native', 'libxdmcp-native', 'xcb-proto-native', 'libxau-native', 'icu-native', 'libice', 'xcb-util', 'libxfce4util', 'xfconf', 'xf
 ce4-dev-tools', 'icu', 'libpciaccess', 'unzip-native', 'vala', 'perl']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/xfce4-power-manager-4.19.1/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/xfce4-power-manager-4.19.1/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
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
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/xfce4-power-manager-4.19.1/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/xfce4-power-manager-4.19.1/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/xfce4-power-manager-4.19.1/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:16: installing './compile'
| configure.ac:11: installing './missing'
| common/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../xfce4-power-manager-4.19.1/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot      --enable-network-manager     --enable-panel-plugins  --disable-static   --disable-polkit --enable-nls
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether make supports nested variables... (cached) yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot... none
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot... (cached) none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -F
| checking how to print strings... printf
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot   option to reload object files... -r
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
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for errno.h... yes
| checking for signal.h... yes
| checking for stddef.h... yes
| checking for sys/types.h... (cached) yes
| checking for memory.h... yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/user.h... yes
| checking for sys/wait.h... yes
| checking for time.h... yes
| checking for math.h... yes
| checking for unistd.h... (cached) yes
| checking for sys/resource.h... yes
| checking for sys/socket.h... yes
| checking for sys/sysctl.h... no
| checking for fcntl.h... yes
| checking for sys/param.h... yes
| checking for procfs.h... no
| checking for getpwuid... yes
| checking for setsid... yes
| checking for sigaction... yes
| checking for round in -lm... yes
| checking whether NLS is requested... yes
| checking for msgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/msgfmt
| checking for gmsgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/msgfmt
| checking for xgettext... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/xgettext
| checking for msgmerge... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/msgmerge
| checking for ld... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot   -m elf_x86_64
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot   -m elf_x86_64) is GNU ld... yes
| checking for shared library run path origin... done
| checking 32-bit host C ABI... no
| checking how to run the C preprocessor... x86_64-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking for egrep -e... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for ELF binary format... yes
| checking for the common suffixes of directories in the library search path... lib,lib,lib64
| checking for CFPreferencesCopyAppValue... no
| checking for CFLocaleCopyCurrent... no
| checking for GNU gettext in libc... yes
| checking whether to use NLS... yes
| checking where the gettext function comes from... libc
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gtk+-3.0 >= 3.24.0... 3.24.38
| checking GTK_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/gtk-3.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/at-spi2-atk/2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/at-spi-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/gtk-3.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-6
 4-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/gio-unix-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/cairo -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/pango-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/harfbuzz -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/pango-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/fribidi -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/harfbuzz -I/home/pokybuild/yocto-worker/auh-me
 ta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/atk-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/cairo -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/pixman-1 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/freetype2 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/libdrm -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/gdk-pixbuf-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/libpng16 -I/h
 ome/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/libmount -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/blkid -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GTK_LIBS... -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for glib-2.0 >= 2.66.0... 2.78.0
| checking GLIB_CFLAGS... -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GLIB_LIBS... -lglib-2.0
| configure: setting GLIB_VERSION_MAX_ALLOWED and GLIB_VERSION_MIN_REQUIRED according to 2.66.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gobject-2.0 >= 2.66.0... 2.78.0
| checking GOBJECT_CFLAGS... -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GOBJECT_LIBS... -lgobject-2.0 -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gthread-2.0 >= 2.66.0... 2.78.0
| checking GTHREAD_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GTHREAD_LIBS... -lgthread-2.0 -pthread -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gmodule-2.0 >= 2.66.0... 2.78.0
| checking GMODULE_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GMODULE_LIBS... -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gio-2.0 >= 2.66.0... 2.78.0
| checking GIO_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/libmount -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/blkid -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GIO_LIBS... -lgio-2.0 -lgobject-2.0 -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gio-unix-2.0 >= 2.66.0... 2.78.0
| checking GIO_UNIX_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/gio-unix-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/libmount -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/blkid -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GIO_UNIX_LIBS... -lgio-2.0 -lgobject-2.0 -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for libxfconf-0 >= 4.12.0... 4.18.0
| checking XFCONF_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/xfce4/xfconf-0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/libmount -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/blkid -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking XFCONF_LIBS... -lxfconf-0 -lgio-2.0 -lgobject-2.0 -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for libxfce4ui-2 >= 4.18.4... found, but 4.18.3
| *** The required package libxfce4ui-2 was found on your system,
| *** but the installed version (4.18.3) is too old.
| *** Please upgrade libxfce4ui-2 to atleast version 4.18.4, or adjust
| *** the PKG_CONFIG_PATH environment variable if you installed
| *** the new version of the package in a nonstandard prefix so
| *** pkg-config is able to find it.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/temp/run.do_configure.2499600:286 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/temp/run.do_configure.2499600, line 286
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/temp/run.do_configure.2499600, line 262
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/temp/run.do_configure.2499600, line 232
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/temp/run.do_configure.2499600, line 152
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/temp/run.do_configure.2499600, line 290
NOTE: recipe xfce4-power-manager-4.19.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3813 tasks of which 3807 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104064154.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104064154.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xfce4-power-manager-4.19.1-r0 do_configure: configure failed
ERROR: xfce4-power-manager-4.19.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/temp/run.do_configure.2499600', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-power-manager/4.19.1/temp/log.do_configure.2499600
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.19.1.bb:do_configure) failed with exit code '1'

--===============2814714485219380833==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-power-manager-upgrade-4.18.1-4.19.1.patch"

RnJvbSBiZTdmOGNmYWZjZmEyZmVkMDRhZTFiNmFhY2EwNTJjZDY3MTU4OWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjo0MjoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXBvd2VyLW1hbmFnZXI6IHVwZ3JhZGUgNC4xOC4xIC0+IDQuMTkuMQoKLS0tCiAuLi5lNC1w
b3dlci1tYW5hZ2VyXzQuMTguMS5iYiA9PiB4ZmNlNC1wb3dlci1tYW5hZ2VyXzQuMTkuMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0LXBvd2VyLW1hbmFnZXIve3hmY2U0LXBv
d2VyLW1hbmFnZXJfNC4xOC4xLmJiID0+IHhmY2U0LXBvd2VyLW1hbmFnZXJfNC4xOS4xLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtcG93ZXItbWFu
YWdlci94ZmNlNC1wb3dlci1tYW5hZ2VyXzQuMTguMS5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXhm
Y2UveGZjZTQtcG93ZXItbWFuYWdlci94ZmNlNC1wb3dlci1tYW5hZ2VyXzQuMTkuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0
LXBvd2VyLW1hbmFnZXIveGZjZTQtcG93ZXItbWFuYWdlcl80LjE4LjEuYmIKcmVuYW1lIHRvIG1l
dGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtcG93ZXItbWFuYWdlci94ZmNlNC1wb3dlci1tYW5h
Z2VyXzQuMTkuMS5iYgppbmRleCBmN2Y3MjM1NmQuLmFiZWIyNmExOSAxMDA2NDQKLS0tIGEvbWV0
YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1wb3dlci1tYW5hZ2VyL3hmY2U0LXBvd2VyLW1hbmFn
ZXJfNC4xOC4xLmJiCisrKyBiL21ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtcG93ZXItbWFu
YWdlci94ZmNlNC1wb3dlci1tYW5hZ2VyXzQuMTkuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBSRVFV
SVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAieDExIgogCiBERVBFTkRTICs9ICJsaWJub3RpZnkgbGli
eHJhbmRyIHZpcnR1YWwvbGlieDExIGxpYnhleHQgeGZjZTQtcGFuZWwgdXBvd2VyIGxpYnhzY3Ju
c2F2ZXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2YjA4YjEwYzRjYjc1MTYzNzdkYmQzMmM2
Y2MyMjk2YTlmYWY0NzAyMmM1NTVmMTFlNzViMzhmZGUxNGFmZjAzIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImIyNjIzZjdhYjMyNTU4Yjg2ZGY2OWM0YmM3M2Y2MDJiNzBlZjU5MDc2YWY1N2QyMGEx
NDc5YjMwZTE0ZTA5N2QiCiAKIEVYVFJBX09FQ09ORiA9ICIgXAogICAgIC0tZW5hYmxlLW5ldHdv
cmstbWFuYWdlciBcCi0tIAoyLjM5LjIKCg==

--===============2814714485219380833==--

