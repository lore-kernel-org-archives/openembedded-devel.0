Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4FEC072A4
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.5403.1699083061296566508
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DYHpmh2V;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HSiHyEmf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b993e0573-3f2cbc0c-82f2-4245-9e31-c79a38bad7af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+YaRS1nZCINU/6uMjlVVli0bQQuo1n9fGFs1ThzYIuI=;
	b=DYHpmh2VUMq0e2luHYxmWaqS99WUwmIW6cNz7m3oGxMBtSDN5hic4Us8gV7Z/Tth
	zDwjPdWwkcYZrnN5aODLqk5+l8A8sRpt64yWZgvVaUv+aaFEirsibsisW6nAwyIeVR6
	U9gC5vankvd6FkMIY44osiaOWNgVOE96A2QioX0c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+YaRS1nZCINU/6uMjlVVli0bQQuo1n9fGFs1ThzYIuI=;
	b=HSiHyEmfzJgbD2KWi5qcuKQeP9USwSUEZ3LwzL237sagLU+B7o63klAYBofx/p32
	Ch7DD0OoVLKyugUu1cA8NQnV6jd9YRU5zpi2p1qAn1ncQ7MLkXQ4reKdiFC9wsggT6v
	llLPWpZQVajN825DyWPIMOPN1Wj+6d8edc2RI8hI=
Content-Type: multipart/mixed; boundary="===============6552582703600101832=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-whiskermenu-plugin: upgrading to 2.8.0 FAILED
Message-ID: <0101018b993e0573-3f2cbc0c-82f2-4245-9e31-c79a38bad7af-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106343

--===============6552582703600101832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-whiskermenu-plugin* to *2.8.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xfce4-whiskermenu-plugin-upgrade-2.7.1-2.8.0.patch
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
From 1280d754729cfb3ff0804e5737fce88accb4afd4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:16:25 +0000
Subject: [PATCH] xfce4-whiskermenu-plugin: upgrade 2.7.1 -> 2.8.0

---
 ...ermenu-plugin_2.7.1.bb => xfce4-whiskermenu-plugin_2.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.7.1.bb => xfce4-whiskermenu-plugin_2.8.0.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb
index 3dfc76f24..66e831729 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[sha256sum] = "04ae0c1764a0d5ec70f18a760d998a2109bb6724f048554d7d6999d9072ca63e"
+SRC_URI[sha256sum] = "bcf8035ee9080a955b7ad6f2da0fdefa4db283f9ce2d1717ad0faef5c23244e6"
-- 
2.39.2


--===============6552582703600101832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4973 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:5af0cf58c3f05ea331068deeb72de77e0d01b8c4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 596 Local 587 Mirrors 0 Missed 9 Current 615 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 624 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 626 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 808 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 579 of 3314 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_fetch)
NOTE: recipe libxfce4ui-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 837 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_fetch: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 607 of 3314 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_unpack)
NOTE: recipe libxfce4util-4.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_unpack: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 859 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 860 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_unpack: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 867 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1134 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1136 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1163 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1169 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1176 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1178 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 2239 of 3314 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_patch)
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_patch: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 3314 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_generate_toolchain_file)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1206 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1208 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1211 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3276 of 3314 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3301 of 3314 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_collect_spdx_deps)
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3302 of 3314 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_configure)
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/l
 ibtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recip
 es-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libxfce4ui', 'libxfce4util', 'xfce4-panel', 'glibc', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'gdk-pixbuf', 'gtk+3', 'hicolor-icon-theme', 'gettext-native', 'autoconf-native', 'automake-native', 'intltool-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'gtk+3-native', 'binutils-cross-x86_64', 'texinfo-dummy-native', 'libxrandr-native', 'libxfixes-native', 'libxcomposite-native', 'at-spi2-core-native', 'glib-2.0-native', 'libx11-native', 'fontconfig-native', 'pango-native', 'cairo-native', 'libjpeg-turbo-native', 'xz-native', 'libxdamage-native', 'libxcursor-native', 'libxext-native', 'gettext-minimal-native', 'libxrender-native', 'libpng-native', 'libxi-native', 'gdk-pixbuf-native', 'python3-native', 'gobject-introspection-native', 'glib-2.0', 'libpng', 'gobject-introspection', 'libjpeg-turbo', 'shared-mime-info', 'gnu-config-native', 'm4-native'
 , 'linux-libc-headers', 'libgcc', 'desktop-file-utils', 'exo', 'cairo', 'garcon', 'libwnck3', 'libx11', 'libxml2', 're2c-native', 'vala', 'flex-native', 'mpfr-native', 'zlib-native', 'libmpc-native', 'zstd-native', 'gmp-native', 'libxml-parser-perl-native', 'libxext', 'libxcomposite', 'pango', 'libxdamage', 'libxcursor', 'libxi', 'libxkbcommon', 'at-spi2-core', 'mesa', 'libxrender', 'libxfixes', 'wayland-protocols', 'libxrandr', 'libepoxy', 'wayland', 'fontconfig', 'opkg-utils', 'attr-native', 'openssl-native', 'bzip2-native', 'ncurses-native', 'startup-notification', 'xfce4-dev-tools', 'libsm', 'libice', 'xfconf', 'xorgproto-native', 'util-macros-native', 'libxml2-native', 'dbus-native', 'libxtst-native', 'util-linux-native', 'libffi-native', 'libpcre2-native', 'xtrans-native', 'libxcb-native', 'freetype-native', 'expat-native', 'libxft-native', 'fribidi-native', 'harfbuzz-native', 'libsm-native', 'pixman-native', 'shared-mime-info-native', 'sqlite3-native', 'libtirpc-native', 'gdb
 m-native', 'libedit-native', 'libnsl2-native', 'util-linux-libuuid-native', 'libpcre2', 'bash-completion', 'libffi', 'zlib', 'util-linux', 'python3', 'libxcb', 'pixman', 'libxres', 'xtrans', 'xorgproto', 'util-macros', 'perl-native', 'fribidi', 'harfbuzz', 'libxft', 'freetype', 'xkeyboard-config', 'dbus', 'libxtst', 'libxxf86vm', 'vulkan-headers', 'libdrm', 'libxshmfence', 'vulkan-loader', 'expat', 'xrandr', 'xcb-util', 'perl', 'libcap-ng-native', 'xcb-proto-native', 'libxau-native', 'libpthread-stubs-native', 'libxdmcp-native', 'icu-native', 'libice-native', 'itstool-native', 'bzip2', 'libxcrypt', 'libcap-ng', 'ncurses', 'libpam', 'util-linux-libuuid', 'gdbm', 'libedit', 'libnsl2', 'xz', 'openssl', 'libtirpc', 'sqlite3', 'libxdmcp', 'xcb-proto', 'libpthread-stubs', 'libxau', 'make-native', 'icu', 'shadow-native', 'systemd', 'update-rc.d', 'base-files', 'shadow-sysroot', 'initscripts', 'shadow', 'base-passwd', 'libpciaccess', 'unzip-native', 'cracklib', 'kmod', 'acl', 'zstd', 'libca
 p', 'libseccomp', 'attr']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 13.2.0
| -- The CXX compiler identification is GNU 13.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Found PkgConfig: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2")
| -- Checking for module 'gio-2.0'
| --   Found gio-2.0, version 2.78.0
| -- Checking for module 'gtk+-3.0>=3.22'
| --   Found gtk+-3.0, version 3.24.38
| -- Checking for module 'exo-2>=0.12'
| --   Found exo-2, version 4.18.0
| -- Checking for module 'garcon-1>=0.6.4'
| --   Found garcon-1, version 4.18.1
| -- Checking for module 'libxfce4panel-2.0>=4.14'
| --   Found libxfce4panel-2.0, version 4.18.3
| -- Checking for module 'libxfce4ui-2>=4.14'
| --   Found libxfce4ui-2, version 4.18.3
| -- Checking for module 'libxfce4util-1.0>=4.14'
| --   Found libxfce4util-1.0, version 4.18.1
| -- Checking for module 'libxfconf-0>=4.14'
| --   Found libxfconf-0, version 4.18.0
| -- Checking for module 'accountsservice>=0.6.45'
| --   No package 'accountsservice' found
| CMake Error at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/recipe-sysroot-native/usr/share/cmake-3.27/Modules/FindPkgConfig.cmake:607 (message):
|   A required package was not found
| Call Stack (most recent call first):
|   /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/recipe-sysroot-native/usr/share/cmake-3.27/Modules/FindPkgConfig.cmake:829 (_pkg_check_modules_internal)
|   panel-plugin/CMakeLists.txt:74 (pkg_check_modules)
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/temp/run.do_configure.2765736:173 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/xfce4-whiskermenu-plugin-2.8.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/p
 ython3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/temp/run.do_configure.2765736, line 173
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/temp/run.do_configure.2765736, line 152
| 	#3: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/temp/run.do_configure.2765736, line 191
NOTE: recipe xfce4-whiskermenu-plugin-2.8.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3302 tasks of which 3295 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104071559.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104071559.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: xfce4-whiskermenu-plugin-2.8.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/temp/run.do_configure.2765736', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-whiskermenu-plugin/2.8.0/temp/log.do_configure.2765736
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.8.0.bb:do_configure) failed with exit code '1'

--===============6552582703600101832==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-whiskermenu-plugin-upgrade-2.7.1-2.8.0.patch"

RnJvbSAxMjgwZDc1NDcyOWNmYjNmZjA4MDRlNTczN2ZjZTg4YWNjYjRhZmQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzoxNjoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXdoaXNrZXJtZW51LXBsdWdpbjogdXBncmFkZSAyLjcuMSAtPiAyLjguMAoKLS0tCiAuLi5l
cm1lbnUtcGx1Z2luXzIuNy4xLmJiID0+IHhmY2U0LXdoaXNrZXJtZW51LXBsdWdpbl8yLjguMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3doaXNrZXJtZW51L3t4ZmNl
NC13aGlza2VybWVudS1wbHVnaW5fMi43LjEuYmIgPT4geGZjZTQtd2hpc2tlcm1lbnUtcGx1Z2lu
XzIuOC4wLmJifSAoNzQlKQoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBs
dWdpbnMvd2hpc2tlcm1lbnUveGZjZTQtd2hpc2tlcm1lbnUtcGx1Z2luXzIuNy4xLmJiIGIvbWV0
YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy93aGlza2VybWVudS94ZmNlNC13aGlza2VybWVu
dS1wbHVnaW5fMi44LjAuYmIKc2ltaWxhcml0eSBpbmRleCA3NCUKcmVuYW1lIGZyb20gbWV0YS14
ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy93aGlza2VybWVudS94ZmNlNC13aGlza2VybWVudS1w
bHVnaW5fMi43LjEuYmIKcmVuYW1lIHRvIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMv
d2hpc2tlcm1lbnUveGZjZTQtd2hpc2tlcm1lbnUtcGx1Z2luXzIuOC4wLmJiCmluZGV4IDNkZmM3
NmYyNC4uNjZlODMxNzI5IDEwMDY0NAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVn
aW5zL3doaXNrZXJtZW51L3hmY2U0LXdoaXNrZXJtZW51LXBsdWdpbl8yLjcuMS5iYgorKysgYi9t
ZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3doaXNrZXJtZW51L3hmY2U0LXdoaXNrZXJt
ZW51LXBsdWdpbl8yLjguMC5iYgpAQCAtNSw0ICs1LDQgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKIGlu
aGVyaXQgeGZjZS1wYW5lbC1wbHVnaW4gY21ha2UKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA0
YWUwYzE3NjRhMGQ1ZWM3MGYxOGE3NjBkOTk4YTIxMDliYjY3MjRmMDQ4NTU0ZDdkNjk5OWQ5MDcy
Y2E2M2UiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmNmODAzNWVlOTA4MGE5NTViN2FkNmYyZGEw
ZmRlZmE0ZGIyODNmOWNlMmQxNzE3YWQwZmFlZjVjMjMyNDRlNiIKLS0gCjIuMzkuMgoK

--===============6552582703600101832==--

