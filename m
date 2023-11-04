Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BCEC00A5A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.4515.1699074742598920356
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HsJPuA19;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hN5WPy3b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b98bf164b-107ff806-e39e-4a96-af5e-3add2426c89b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3P8R+771waVEw2cYgSDldnvsLG5bQhzl8XgrldbDTeQ=;
	b=HsJPuA19WoTPpFrd4FG+XjBKzMJOqMK8SRJ8e5UlHYy2XeGXSlieGsmwPXN6dSTK
	DTPIlgMJny0Yhcdvo/wEqf7UXNsSElGGnHEMWoQam5HXY4Q4V83N15tpQEbvwZriay5
	Sr7tcoREcpZBbrbJH2sY6Ir+7DhNh/1mZMtPJscY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3P8R+771waVEw2cYgSDldnvsLG5bQhzl8XgrldbDTeQ=;
	b=hN5WPy3bNOsGyyLam9DEC4DyNNo1O+ZmCxwEUILE31sQK0v04IZly+HRHf3gbEOQ
	sN+ALavJShMtNmH2tQ4mk+NYEwuoaJeaEY4jC8wj3ROpCpBHaJz98pvzl99ffXgzwnj
	1IQMtCTvnXI7m8EoSZggIAWcHqP+hXLh68qeVQLg=
Content-Type: multipart/mixed; boundary="===============8303428637422639330=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libwnck: upgrading to 43.0 FAILED
Message-ID: <0101018b98bf164b-107ff806-e39e-4a96-af5e-3add2426c89b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106286

--===============8303428637422639330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwnck* to *43.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libwnck-upgrade-2.31.0-43.0.patch
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
From 6fb17bc17554eb5dead27ffec273fb2fc88b23e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:51:45 +0000
Subject: [PATCH] libwnck: upgrade 2.31.0 -> 43.0

---
 .../libwnck/{libwnck_2.31.0.bb => libwnck_43.0.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck_2.31.0.bb => libwnck_43.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb
index 3abba9499..7865089ee 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb
@@ -11,8 +11,7 @@ PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-s
 inherit gnomebase gobject-introspection features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "f03e1139296e2a3a92e3b65a3080cd32"
-SRC_URI[archive.sha256sum] = "83f732d20781fc88b22cdc6aaf2d4f388db6d3d4ff28d1a8fd45be9fb7743a9e"
+SRC_URI[archive.sha256sum] = "905bcdb85847d6b8f8861e56b30cd6dc61eae67ecef4cd994a9f925a26a2c1fe"
 
 do_install:append() {
     # to avoid conflicts with libwnck3 remove cmdline tools
-- 
2.39.2


--===============8303428637422639330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4904 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:35f473340b794238519f3e4995bffc4ddebaf1fe"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 498 Local 489 Mirrors 0 Missed 9 Current 511 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 520 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 522 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 535 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 1009 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 537 of 1009 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxres-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwnck-43.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libwnck-43.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe startup-notification-0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+-2.24.33-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-common-native-3.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-common-native-3.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwnck-43.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxres-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe startup-notification-0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwnck-43.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gnome-common-native-3.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+-2.24.33-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-common-native-3.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 848 of 1009 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 1009 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: recipe libwnck-43.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwnck-43.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 632 of 2747 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_fetch)
NOTE: recipe gnome-common-native-3.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-common-native-3.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwnck-43.0-r0: task do_fetch: Started
NOTE: Running setscene task 939 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 941 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libwnck-43.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-native-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 961 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 974 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 976 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1749 of 2747 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_unpack)
NOTE: recipe libwnck-43.0-r0: task do_unpack: Started
NOTE: recipe libwnck-43.0-r0: task do_unpack: Succeeded
NOTE: Running task 1835 of 2747 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_patch)
NOTE: recipe libwnck-43.0-r0: task do_patch: Started
NOTE: recipe libwnck-43.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1006 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1009 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2647 of 2747 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2734 of 2747 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_collect_spdx_deps)
NOTE: recipe libwnck-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwnck-43.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwnck-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwnck-43.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2735 of 2747 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_configure)
NOTE: recipe libwnck-43.0-r0: task do_configure: Started
NOTE: recipe libwnck-43.0-r0: task do_configure: Succeeded
NOTE: Running task 2736 of 2747 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_compile)
NOTE: recipe libwnck-43.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52
| make: *** No targets specified and no makefile found.  Stop.
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libwnck/43.0/temp/run.do_compile.1561829:191 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libwnck/43.0/temp/run.do_compile.1561829, line 191
| 	#2: die, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libwnck/43.0/temp/run.do_compile.1561829, line 175
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libwnck/43.0/temp/run.do_compile.1561829, line 170
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libwnck/43.0/temp/run.do_compile.1561829, line 165
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libwnck/43.0/temp/run.do_compile.1561829, line 160
| 	#6: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libwnck/43.0/temp/run.do_compile.1561829, line 204
NOTE: recipe libwnck-43.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2736 tasks of which 2729 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104045122.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104045122.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libwnck-43.0-r0 do_compile: oe_runmake failed
ERROR: libwnck-43.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libwnck/43.0/temp/run.do_compile.1561829', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/libwnck/43.0/temp/log.do_compile.1561829
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck_43.0.bb:do_compile) failed with exit code '1'

--===============8303428637422639330==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwnck-upgrade-2.31.0-43.0.patch"

RnJvbSA2ZmIxN2JjMTc1NTRlYjVkZWFkMjdmZmVjMjczZmIyZmM4OGIyM2UwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDo1MTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnduY2s6IHVwZ3JhZGUgMi4zMS4wIC0+IDQzLjAKCi0tLQogLi4uL2xpYnduY2sve2xpYnduY2tf
Mi4zMS4wLmJiID0+IGxpYnduY2tfNDMuMC5iYn0gICAgICAgICAgICAgfCAzICstLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEtZ25v
bWUvcmVjaXBlcy1nbm9tZS9saWJ3bmNrL3tsaWJ3bmNrXzIuMzEuMC5iYiA9PiBsaWJ3bmNrXzQz
LjAuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2xpYndu
Y2svbGlid25ja18yLjMxLjAuYmIgYi9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvbGlid25jay9s
aWJ3bmNrXzQzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS1nbm9t
ZS9yZWNpcGVzLWdub21lL2xpYnduY2svbGlid25ja18yLjMxLjAuYmIKcmVuYW1lIHRvIG1ldGEt
Z25vbWUvcmVjaXBlcy1nbm9tZS9saWJ3bmNrL2xpYnduY2tfNDMuMC5iYgppbmRleCAzYWJiYTk0
OTkuLjc4NjUwODllZSAxMDA2NDQKLS0tIGEvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2xpYndu
Y2svbGlid25ja18yLjMxLjAuYmIKKysrIGIvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2xpYndu
Y2svbGlid25ja180My4wLmJiCkBAIC0xMSw4ICsxMSw3IEBAIFBBQ0tBR0VDT05GSUdbc3RhcnR1
cC1ub3RpZmljYXRpb25dID0gIi0tZW5hYmxlLXN0YXJ0dXAtbm90aWZpY2F0aW9uLC0tZGlzYWJs
ZS1zCiBpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZmVhdHVyZXNfY2hl
Y2sKIFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJ4MTEiCiAKLVNSQ19VUklbYXJjaGl2ZS5t
ZDVzdW1dID0gImYwM2UxMTM5Mjk2ZTJhM2E5MmUzYjY1YTMwODBjZDMyIgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiODNmNzMyZDIwNzgxZmM4OGIyMmNkYzZhYWYyZDRmMzg4ZGI2ZDNk
NGZmMjhkMWE4ZmQ0NWJlOWZiNzc0M2E5ZSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
IjkwNWJjZGI4NTg0N2Q2YjhmODg2MWU1NmIzMGNkNmRjNjFlYWU2N2VjZWY0Y2Q5OTRhOWY5MjVh
MjZhMmMxZmUiCiAKIGRvX2luc3RhbGw6YXBwZW5kKCkgewogICAgICMgdG8gYXZvaWQgY29uZmxp
Y3RzIHdpdGggbGlid25jazMgcmVtb3ZlIGNtZGxpbmUgdG9vbHMKLS0gCjIuMzkuMgoK

--===============8303428637422639330==--

