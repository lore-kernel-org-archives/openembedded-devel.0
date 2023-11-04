Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCF6C001DD
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.5393.1699083060403949600
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CqxXZcPo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WTktxWf8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b993e017d-f3e738a2-8908-4fbb-87a9-8f7884d0bf89-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vXwxMWdP3cJixGatvXX6jXgxjZInrQb5uTnjiEpqQZ0=;
	b=CqxXZcPoS8LSRdENSBT/s4+B7ivqgINQBWg1agia436vkAfQMrFdKFgVTHUgQw9P
	na8/X2PPBV7rfxBiKpWMczLwbCAH4ZkT/44YhGdpc6TNf8xP9EpfR0+Rw52AzUHbEty
	PWtY2abMFYZRTDpKoDSKFuKeecpRQaFF/8OY8MMA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083059;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vXwxMWdP3cJixGatvXX6jXgxjZInrQb5uTnjiEpqQZ0=;
	b=WTktxWf8fqgs58eJS+QWVy+d2tynjTBhxLiPGYyTO2k1QZ7lqvfHoKBkMmre1sOe
	wfQihLF5UWUrntflkurDqT9NV6pog956n3ctGpXfHJ7aoAM+UTkc/LhvbLpW8BPW62w
	wpAAx1A35ZoEoOrBMk7XNq+RypNIIw+nor+4heyc=
Content-Type: multipart/mixed; boundary="===============1775144048222684818=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-clipman-plugin: upgrading to 1.6.5 FAILED
Message-ID: <0101018b993e017d-f3e738a2-8908-4fbb-87a9-8f7884d0bf89-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:30:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106308

--===============1775144048222684818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-clipman-plugin* to *1.6.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xfce4-clipman-plugin-upgrade-1.6.2-1.6.5.patch
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
From 98f5a5fe158ffbe6e0da2ca8180320a3e66928f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 06:07:20 +0000
Subject: [PATCH] xfce4-clipman-plugin: upgrade 1.6.2 -> 1.6.5

---
 ...e4-clipman-plugin_1.6.2.bb => xfce4-clipman-plugin_1.6.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.6.2.bb => xfce4-clipman-plugin_1.6.5.bb} (84%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb
similarity index 84%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb
index 39a8f2edf..865a34bd5 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb
@@ -8,7 +8,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xorgproto libxtst"
 
-SRC_URI[sha256sum] = "ab8a5fe6f68fb1789190e498243a1d1385de3f64e984f470cbd3d1eb779399b8"
+SRC_URI[sha256sum] = "73156d66c1f866d2af0c20526c5ce58aedbce511b89bb436ba9bc6413fac5190"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-- 
2.39.2


--===============1775144048222684818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4920 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:cb22fc1708e5e465748e9beb053a64b46e996209"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 593 Local 584 Mirrors 0 Missed 9 Current 618 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 627 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_populate_lic_setscene)
NOTE: Running setscene task 629 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 812 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_recipe_qa_setscene)
NOTE: recipe xfce4-panel-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 822 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfce4ui-4.18.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 584 of 3313 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_fetch)
NOTE: recipe libxfce4ui-4.18.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 840 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_fetch: Started
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_fetch: Succeeded
NOTE: Running task 592 of 3313 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_unpack)
NOTE: recipe xfconf-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_unpack: Started
NOTE: recipe xfconf-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 847 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_unpack: Succeeded
NOTE: recipe libxfce4util-4.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfce4util-4.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 863 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 864 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 867 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 974 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1100 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1131 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1133 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1161 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1169 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1176 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1178 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 2270 of 3313 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_patch)
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_patch: Started
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1206 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1208 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1211 of 1211 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3275 of 3313 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3300 of 3313 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_collect_spdx_deps)
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3301 of 3313 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_configure)
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_configure: Started
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_configure: Succeeded
NOTE: Running task 3302 of 3313 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_compile)
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52
| make  all-recursive
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/build'
| Making all in protocols
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/build/protocols'
| wayland-scanner client-header ../../xfce4-clipman-plugin-1.6.5/protocols/wlr-data-control-unstable-v1.xml wlr-data-control-unstable-v1-client.h
| /bin/bash: wayland-scanner: command not found
| make[2]: *** [Makefile:733: wlr-data-control-unstable-v1-client.h] Error 127
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/build/protocols'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/build'
| make[1]: *** [Makefile:502: all-recursive] Error 1
| make: *** [Makefile:434: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/temp/run.do_compile.2216142:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/temp/run.do_compile.2216142, line 183
| 	#2: die, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/temp/run.do_compile.2216142, line 167
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/temp/run.do_compile.2216142, line 162
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/temp/run.do_compile.2216142, line 157
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/temp/run.do_compile.2216142, line 152
| 	#6: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/temp/run.do_compile.2216142, line 196
NOTE: recipe xfce4-clipman-plugin-1.6.5-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 3302 tasks of which 3295 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104060646.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104060646.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xfce4-clipman-plugin-1.6.5-r0 do_compile: oe_runmake failed
ERROR: xfce4-clipman-plugin-1.6.5-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/temp/run.do_compile.2216142', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-clipman-plugin/1.6.5/temp/log.do_compile.2216142
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.5.bb:do_compile) failed with exit code '1'

--===============1775144048222684818==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-clipman-plugin-upgrade-1.6.2-1.6.5.patch"

RnJvbSA5OGY1YTVmZTE1OGZmYmU2ZTBkYTJjYTgxODAzMjBhM2U2NjkyOGY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjowNzoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LWNsaXBtYW4tcGx1Z2luOiB1cGdyYWRlIDEuNi4yIC0+IDEuNi41CgotLS0KIC4uLmU0LWNs
aXBtYW4tcGx1Z2luXzEuNi4yLmJiID0+IHhmY2U0LWNsaXBtYW4tcGx1Z2luXzEuNi41LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvY2xpcG1hbi97eGZjZTQtY2xpcG1h
bi1wbHVnaW5fMS42LjIuYmIgPT4geGZjZTQtY2xpcG1hbi1wbHVnaW5fMS42LjUuYmJ9ICg4NCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9jbGlwbWFuL3hm
Y2U0LWNsaXBtYW4tcGx1Z2luXzEuNi4yLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1
Z2lucy9jbGlwbWFuL3hmY2U0LWNsaXBtYW4tcGx1Z2luXzEuNi41LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODQlCnJlbmFtZSBmcm9tIG1ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMvY2xpcG1h
bi94ZmNlNC1jbGlwbWFuLXBsdWdpbl8xLjYuMi5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lw
ZXMtcGFuZWwtcGx1Z2lucy9jbGlwbWFuL3hmY2U0LWNsaXBtYW4tcGx1Z2luXzEuNi41LmJiCmlu
ZGV4IDM5YThmMmVkZi4uODY1YTM0YmQ1IDEwMDY0NAotLS0gYS9tZXRhLXhmY2UvcmVjaXBlcy1w
YW5lbC1wbHVnaW5zL2NsaXBtYW4veGZjZTQtY2xpcG1hbi1wbHVnaW5fMS42LjIuYmIKKysrIGIv
bWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy9jbGlwbWFuL3hmY2U0LWNsaXBtYW4tcGx1
Z2luXzEuNi41LmJiCkBAIC04LDcgKzgsNyBAQCBpbmhlcml0IHhmY2UtcGFuZWwtcGx1Z2luCiAK
IERFUEVORFMgKz0gInhmY29uZiB4b3JncHJvdG8gbGlieHRzdCIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImFiOGE1ZmU2ZjY4ZmIxNzg5MTkwZTQ5ODI0M2ExZDEzODVkZTNmNjRlOTg0ZjQ3MGNi
ZDNkMWViNzc5Mzk5YjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzMxNTZkNjZjMWY4NjZkMmFm
MGMyMDUyNmM1Y2U1OGFlZGJjZTUxMWI4OWJiNDM2YmE5YmM2NDEzZmFjNTE5MCIKIAogUEFDS0FH
RUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUdbcXJlbmNvZGVdID0gIi0tZW5hYmxlLWxpYnFy
ZW5jb2RlLC0tZGlzYWJsZS1saWJxcmVuY29kZSxxcmVuY29kZSIKLS0gCjIuMzkuMgoK

--===============1775144048222684818==--

