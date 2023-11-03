Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB53C10F05
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.63858.1699041164963085182
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WTEtu2o0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PgEgRekz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b96bebb2b-45afd877-faa0-4d20-a3e2-5e0c8d9148ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t72wZV2b6BtwoEQqjDob2Os4fz6CpUtxGGouyzSZ7yg=;
	b=WTEtu2o0PRNFX0FHegDr21VfWHQxYfZPxvtXjqzKM9rRDpw49AcLVC6n3KEDSndW
	6gEmtrWXw4JsC52GqPiywbzCSiiZ53n8jATAsgIGu6RH3EHEPtf38TL/WWQj9j7SFHi
	qlXZYBd9MTCT3934Fssi7YFXjta0ZyQ/i6v3F5Po=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t72wZV2b6BtwoEQqjDob2Os4fz6CpUtxGGouyzSZ7yg=;
	b=PgEgRekzl71iJ2R7hPnjbt9b0hV48/N3hm5r4YGkOCRXtIvG6M7ZmSxcAFo9irSV
	dLS3mnPq4XUk0IvJgJLI9wwlfUzb1v0WdO54PywJ9oZk8Ve1894rux+WgJsXRVTDFVl
	6DKI90Lc3O1eKL+gq0ONzDk3xm/aMX1AGT2nbkwg=
Content-Type: multipart/mixed; boundary="===============1735391146629291202=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] atkmm: upgrading to 2.36.2 FAILED
Message-ID: <0101018b96bebb2b-45afd877-faa0-4d20-a3e2-5e0c8d9148ea-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:44 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105877

--===============1735391146629291202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *atkmm* to *2.36.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-atkmm-upgrade-2.28.2-2.36.2.patch
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
From c90cc1ee7270d3c18ed5603c4d1c686423a2c431 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 11:29:15 +0000
Subject: [PATCH] atkmm: upgrade 2.28.2 -> 2.36.2

---
 meta-oe/recipes-gnome/atk/{atkmm_2.28.2.bb => atkmm_2.36.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/atk/{atkmm_2.28.2.bb => atkmm_2.36.2.bb} (83%)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb b/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb
similarity index 83%
rename from meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
rename to meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb
index f6cb0a1e1..c29b0ca9a 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb
@@ -13,7 +13,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "a0bb49765ceccc293ab2c6735ba100431807d384ffa14c2ebd30e07993fd2fa4"
+SRC_URI[archive.sha256sum] = "6f62dd99f746985e573605937577ccfc944368f606a71ca46342d70e1cdae079"
 
 EXTRA_OEMESON = "-Dbuild-documentation=false"
 
-- 
2.39.2


--===============1735391146629291202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4889 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:167fd570683b8ba9510405ba4a66cde1544522f3"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 480 Local 470 Mirrors 0 Missed 10 Current 296 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 299 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 306 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 308 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 315 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_create_spdx_setscene)
NOTE: Running task 149 of 2136 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_write_config)
NOTE: recipe atkmm-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atkmm-2.36.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe glibmm-2.66.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe atkmm-2.36.2-r0: task do_write_config: Started
NOTE: recipe atkmm-2.36.2-r0: task do_write_config: Succeeded
NOTE: recipe atkmm-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe atkmm-2.36.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe glibmm-2.66.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 500 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe atkmm-2.36.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-8.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atkmm-2.36.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 300 of 2136 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-8.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe atkmm-2.36.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 609 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe atkmm-2.36.2-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe meson-native-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 628 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-native-8.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-native-8.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-native-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 679 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ninja-native-1.11.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 681 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe meson-native-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-native-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-native-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 699 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ninja-native-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-native-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe ninja-native-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 707 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/re2c/re2c_3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 710 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 712 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ninja-native-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe re2c-native-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-native-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-native-0.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe re2c-native-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/re2c/re2c_3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-wheel_0.41.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-native-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe re2c-native-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe re2c-native-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-native-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 738 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-native-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-native-23.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-native-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-native-1.4.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe m4-native-1.4.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 763 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-23.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe m4-native-1.4.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20230216+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-native-1.4.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20230216+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gnu-config-native-20230216+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20230216+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 776 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe quilt-native-0.67-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quilt-native-0.67-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 776 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_recipe_qa_setscene)
NOTE: recipe quilt-native-0.67-r0: task do_recipe_qa_setscene: Started
NOTE: recipe quilt-native-0.67-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1914 of 2136 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_unpack)
NOTE: Running task 1999 of 2136 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe atkmm-2.36.2-r0: task do_unpack: Started
NOTE: recipe atkmm-2.36.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atkmm-2.36.2-r0: task do_unpack: Succeeded
NOTE: Running task 2120 of 2136 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_patch)
NOTE: Running task 2121 of 2136 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_collect_spdx_deps)
NOTE: recipe atkmm-2.36.2-r0: task do_patch: Started
NOTE: recipe atkmm-2.36.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe atkmm-2.36.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atkmm-2.36.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe atkmm-2.36.2-r0: task do_patch: Succeeded
NOTE: Running task 2123 of 2136 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_configure)
NOTE: recipe atkmm-2.36.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:
 native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibmm', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'at-spi2-core', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'libgcc', 'linux-libc-headers', 'mm-common', 'libsigc++-2.0', 'glib-2.0', 'python3-wheel-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-build-native', 'dbus', 'libxi', 'libxtst', 'libx11', 'gobject-introspection', 'libxml2', 'binutils-cross-x86_64', 'zlib-native', 'texinfo-dummy-native', 'gmp-native', 'mpfr-native', 'flex-native', 'libtool-native', 'libmpc-native', 'zstd-native', 'gnu-config-native', 're2c-native', 'gettext-minimal-native', 'glib-2.0-native', 'attr-native', 'libtirpc-native', 'ncurses-native', 'gdbm-native', 'bzip2-native', 'util-linux-libuuid-native', 'libnsl2-native', 'libffi-native', 'sqlite3-native', 'libedit-native', 'openssl-native', 'expat-native', 'libpcre2', 'zlib', 'uti
 l-linux', 'bash-completion', 'libffi', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'systemd', 'shadow', 'base-files', 'update-rc.d', 'base-passwd', 'libsm', 'shadow-native', 'expat', 'shadow-sysroot', 'initscripts', 'libxext', 'xorgproto', 'libxfixes', 'util-macros', 'libxcb', 'xtrans', 'python3', 'opkg-utils', 'm4-native', 'gettext-native', 'util-linux-native', 'libpcre2-native', 'perl-native', 'cmake-native', 'bzip2', 'ncurses', 'libcap-ng', 'util-linux-libuuid', 'libpam', 'libxcrypt', 'unzip-native', 'zstd', 'kmod', 'libseccomp', 'acl', 'libcap', 'libxkbcommon', 'attr', 'libice', 'libxdmcp', 'libpthread-stubs', 'libxau', 'xcb-proto', 'gdbm', 'sqlite3', 'libtirpc', 'openssl', 'libedit', 'xz', 'libnsl2', 'libcap-ng-native', 'make-native', 'cracklib', 'xkeyboard-config', 'wayland-protocols', 'wayland']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dbuild-documentation=false ...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/atkmm-2.36.2
| Build dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/build
| Build type: cross build
| Project name: atkmm
| Project version: 2.36.2
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-g++ (GCC) 13.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/recipe-sysroot ld.bfd 2.41.0.20230926
| C++ compiler for the build machine: g++ (gcc 12.2.0 "g++ (GCC) 12.2.0")
| C++ linker for the build machine: g++ ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/recipe-sysroot-native/usr/bin/nativepython3)
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency atk found: YES 2.50.0
| Found CMake: NO
| Run-time dependency glibmm-2.68 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glibmm-2.68
| 
| ../atkmm-2.36.2/meson.build:111:13: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/temp/run.do_configure.3928186:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/temp/run.do_configure.3928186, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/temp/run.do_configure.3928186, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/temp/run.do_configure.3928186, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/temp/run.do_configure.3928186, line 186
NOTE: recipe atkmm-2.36.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2124 tasks of which 2117 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103112852.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103112852.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: atkmm-2.36.2-r0 do_configure: meson failed
ERROR: atkmm-2.36.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/temp/run.do_configure.3928186', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/atkmm/2.36.2/temp/log.do_configure.3928186
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/atk/atkmm_2.36.2.bb:do_configure) failed with exit code '1'

--===============1735391146629291202==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-atkmm-upgrade-2.28.2-2.36.2.patch"

RnJvbSBjOTBjYzFlZTcyNzBkM2MxOGVkNTYwM2M0ZDFjNjg2NDIzYTJjNDMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMToyOToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGF0
a21tOiB1cGdyYWRlIDIuMjguMiAtPiAyLjM2LjIKCi0tLQogbWV0YS1vZS9yZWNpcGVzLWdub21l
L2F0ay97YXRrbW1fMi4yOC4yLmJiID0+IGF0a21tXzIuMzYuMi5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhLW9lL3Jl
Y2lwZXMtZ25vbWUvYXRrL3thdGttbV8yLjI4LjIuYmIgPT4gYXRrbW1fMi4zNi4yLmJifSAoODMl
KQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1nbm9tZS9hdGsvYXRrbW1fMi4yOC4yLmJi
IGIvbWV0YS1vZS9yZWNpcGVzLWdub21lL2F0ay9hdGttbV8yLjM2LjIuYmIKc2ltaWxhcml0eSBp
bmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWdub21lL2F0ay9hdGttbV8yLjI4
LjIuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1nbm9tZS9hdGsvYXRrbW1fMi4zNi4yLmJi
CmluZGV4IGY2Y2IwYTFlMS4uYzI5YjBjYTlhIDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMt
Z25vbWUvYXRrL2F0a21tXzIuMjguMi5iYgorKysgYi9tZXRhLW9lL3JlY2lwZXMtZ25vbWUvYXRr
L2F0a21tXzIuMzYuMi5iYgpAQCAtMTMsNyArMTMsNyBAQCBpbmhlcml0IGdub21lYmFzZSBmZWF0
dXJlc19jaGVjawogCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRV
UkVTfSIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYTBiYjQ5NzY1Y2VjY2MyOTNh
YjJjNjczNWJhMTAwNDMxODA3ZDM4NGZmYTE0YzJlYmQzMGUwNzk5M2ZkMmZhNCIKK1NSQ19VUklb
YXJjaGl2ZS5zaGEyNTZzdW1dID0gIjZmNjJkZDk5Zjc0Njk4NWU1NzM2MDU5Mzc1NzdjY2ZjOTQ0
MzY4ZjYwNmE3MWNhNDYzNDJkNzBlMWNkYWUwNzkiCiAKIEVYVFJBX09FTUVTT04gPSAiLURidWls
ZC1kb2N1bWVudGF0aW9uPWZhbHNlIgogCi0tIAoyLjM5LjIKCg==

--===============1735391146629291202==--

