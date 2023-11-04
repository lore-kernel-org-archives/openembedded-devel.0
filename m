Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977EAC05022
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3433.1699067574983149398
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B7lEvh5G;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DGh4ABmB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b9851b807-fe351b96-2edc-4a03-8fe3-419bee939bfd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zfkAQzM4l7JKNK/GiDWYlwX3CBY7GyIEUarfMCzIvTE=;
	b=B7lEvh5GedTzX0TPlhqNRF/o27MXtd4jNlJHl8twiH4EKRcxnxnPLhlrIdUVah/v
	kXMs5L7efbppLY1Je5cvNLEdXXDWHg4/8WNNRo+yxcrTr5t8VS9UlalxymeSRtlXRTQ
	QUOYu/OsDcKleRLk+L92EqzaYnm3x5CcvYF9uosg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zfkAQzM4l7JKNK/GiDWYlwX3CBY7GyIEUarfMCzIvTE=;
	b=DGh4ABmBVEra5e84isaEK0Pp7xILAfwS66NXZXzRbnvUHAagGDWyFpJliMnI6j9Q
	uTV+B+2K4DsLXD2FETVUwsPtoA6rpOEy2Wy7RBz5tAE/SHXQX44mYDKRuwC194LaObv
	tUoouYHwOS5qfEEobUK+6MGZqyCEfn+wJME5JeE4=
Content-Type: multipart/mixed; boundary="===============6379461761847361751=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] networkmanager-openconnect: upgrading to 1.2.10 FAILED
Message-ID: <0101018b9851b807-fe351b96-2edc-4a03-8fe3-419bee939bfd-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106215

--===============6379461761847361751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *networkmanager-openconnect* to *1.2.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-networkmanager-openconnect-upgrade-1.2.8-1.2.10.patch
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
From ae7bf5e04d8f1244d350c04c25d3bfa8b8c139dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 02:34:10 +0000
Subject: [PATCH] networkmanager-openconnect: upgrade 1.2.8 -> 1.2.10

---
 ...penconnect_1.2.8.bb => networkmanager-openconnect_1.2.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openconnect_1.2.8.bb => networkmanager-openconnect_1.2.10.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb
index c978defbb..efd099252 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb
@@ -10,7 +10,7 @@ inherit gnomebase useradd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openconnect/${@gnome_verdir("${PV}")}/NetworkManager-openconnect-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5dedaa785d82d8e239ddd082bfac5250c691e964464be1807b6827263633cdcc"
+SRC_URI[sha256sum] = "844b6bf64ecadb97b4a68c776db89aa5e6ee7e59bd24b0180228406863136464"
 
 S = "${WORKDIR}/NetworkManager-openconnect-${PV}"
 
-- 
2.39.2


--===============6379461761847361751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4902 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:ac583c7fc5d3c4065144a95a28c1c2495689e8be"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 494 Local 485 Mirrors 0 Missed 9 Current 480 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 489 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_populate_lic_setscene)
NOTE: Running setscene task 491 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 492 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 494 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb:do_create_spdx_setscene)
NOTE: recipe openconnect-9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_populate_lic_setscene: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe networkmanager-1.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe openconnect-9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe networkmanager-1.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 689 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 701 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 702 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 770 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: Running task 624 of 2664 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_fetch: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 919 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 920 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 921 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 927 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 934 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 936 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1641 of 2664 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_unpack)
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_unpack: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1707 of 2664 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_patch)
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_patch: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 971 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 974 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2532 of 2664 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2645 of 2664 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_collect_spdx_deps)
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2652 of 2664 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_configure)
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtoo
 ls/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtoo
 ls/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['networkmanager', 'openconnect', 'base-files', 'base-passwd', 'glibc', 'libxml2', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'shadow-sysroot', 'shadow', 'glib-2.0-native', 'autoconf-native', 'automake-native', 'intltool-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'shadow-native', 'xz-native', 'texinfo-dummy-native', 'linux-libc-headers', 'python3', 'zlib', 'attr-native', 'gnutls', 'bash-completion', 'lz4', 'libproxy', 'krb5', 'vpnc', 'dbus', 'gobject-introspection', 'vala', 'update-rc.d', 'readline', 'opkg-utils', 'libnl', 'curl', 'bluez5', 'initscripts', 'libnewt', 'nss', 'util-linux', 'systemd', 'libndp', 'binutils-cross-x86_64', 'libpam', 'attr', 'libxcrypt', 'gnu-config-native', 'm4-native', 'zlib-native', 'libmpc-native', 'flex-native', 'zstd-native', 'gmp-native', 'mpfr-native', 'gettext-native', 'libxml-parser-perl-native', 'libgcc', 'gettext-minimal-native', 'python3-n
 ative', 'libpcre2-native', 'util-linux-native', 'libffi-native', 'openssl', 'expat', 'gdbm', 'sqlite3', 'libnsl2', 'xz', 'bzip2', 'util-linux-libuuid', 'libffi', 'libtirpc', 'libedit', 'ncurses', 'libtasn1', 'libseccomp', 'nettle', 'gmp', 'libunistring', 'libidn2', 'glib-2.0', 'e2fsprogs', 'libgcrypt', 'libx11', 'libsm', 'libcheck', 'libical', 'slang', 'popt', 'nspr', 'libcap-ng', 'libxkbcommon', 'zstd', 'kmod', 'acl', 'libcap', 'cracklib', 'expat-native', 'perl-native', 'libtirpc-native', 'bzip2-native', 'gdbm-native', 'sqlite3-native', 'ncurses-native', 'libnsl2-native', 'util-linux-libuuid-native', 'libedit-native', 'openssl-native', 'libcap-ng-native', 'libpcre2', 'libgpg-error', 'xtrans', 'xorgproto', 'libxcb', 'util-macros', 'libice', 'icu', 'libpcre', 'wayland', 'xkeyboard-config', 'wayland-protocols', 'cmake-native', 'make-native', 'libxdmcp', 'libpthread-stubs', 'xcb-proto', 'libxau']
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
| NOTE: Executing glib-gettextize --force --copy
| Copying file po/Makefile.in.in
| 
| Please add the files
|   codeset.m4 gettext.m4 glibc21.m4 iconv.m4 isc-posix.m4 lcmessage.m4
|   progtest.m4
| from the /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/share/aclocal directory to your autoconf macro directory
| or directly to your aclocal.m4 file.
| You will also need config.guess and config.sub, which you can get from
| ftp://ftp.gnu.org/pub/gnu/config/.
| 
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/NetworkManager-openconnect-1.2.10/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/NetworkManager-openconnect-1.2.10/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
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
| autoreconf: running: intltoolize --copy --force
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/NetworkManager-openconnect-1.2.10/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/NetworkManager-openconnect-1.2.10/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/NetworkManager-openconnect-1.2.10/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:14: installing './compile'
| configure.ac:7: installing './missing'
| Makefile.am:78: warning: shell $(GLIB_COMPILE_RESOURCES: non-POSIX variable name
| Makefile.am:78: (probably a GNU make extension)
| Makefile.am:81: warning: shell $(GLIB_COMPILE_RESOURCES: non-POSIX variable name
| Makefile.am:81: (probably a GNU make extension)
| Makefile.am:85: warning: '%'-style pattern rules are a GNU make extension
| Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../NetworkManager-openconnect-1.2.10/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot  --disable-static  --without-gnome --without-gtk4
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot... none
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
| checking for sys/time.h... yes
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot... (cached) none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot   option to reload object files... -r
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
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for glib-compile-resources... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/glib-compile-resources
| checking for file... yes
| checking for find... yes
| checking for egrep... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for fcntl.h... yes
| checking for paths.h... yes
| checking for sys/ioctl.h... yes
| checking for sys/time.h... (cached) yes
| checking for syslog.h... yes
| checking for unistd.h... (cached) yes
| checking for mode_t... yes
| checking for pid_t... yes
| checking for working memcmp... (cached) yes
| checking for select... yes
| checking for socket... yes
| checking for uname... yes
| checking for library containing dlopen... none required
| checking whether NLS is requested... yes
| checking for intltool >= 0.35... 0.51.0 found
| checking for intltool-update... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/intltool-update
| checking for intltool-merge... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/intltool-merge
| checking for intltool-extract... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/intltool-extract
| checking for xgettext... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/xgettext
| checking for msgmerge... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/msgmerge
| checking for msgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/msgfmt
| checking for gmsgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/msgfmt
| checking for locale.h... yes
| checking for LC_MESSAGES... yes
| checking for CFPreferencesCopyAppValue... no
| checking for CFLocaleCopyCurrent... no
| checking for libintl.h... yes
| checking for ngettext in libc... yes
| checking for dgettext in libc... yes
| checking for bind_textdomain_codeset... yes
| checking for msgfmt... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/msgfmt
| checking for dcgettext... yes
| checking if msgfmt accepts -c... yes
| checking for gmsgfmt... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/msgfmt
| checking for xgettext... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/xgettext
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for glib-2.0 >= 2.34... yes
| checking for gmodule-2.0... yes
| checking for libxml-2.0... yes
| checking for webkit2gtk-4.1... no
| checking for webkit2gtk-4.0... no
| configure: error: Neither webkit2gtk-4.0 nor wekit2gtk-4.1 found
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/temp/run.do_configure.591314:292 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/temp/run.do_configure.591314, line 292
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/temp/run.do_configure.591314, line 268
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/temp/run.do_configure.591314, line 238
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/temp/run.do_configure.591314, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/temp/run.do_configure.591314, line 296
NOTE: recipe networkmanager-openconnect-1.2.10-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2652 tasks of which 2646 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104023340.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104023340.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: networkmanager-openconnect-1.2.10-r0 do_configure: configure failed
ERROR: networkmanager-openconnect-1.2.10-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/temp/run.do_configure.591314', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/networkmanager-openconnect/1.2.10/temp/log.do_configure.591314
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.10.bb:do_configure) failed with exit code '1'

--===============6379461761847361751==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-networkmanager-openconnect-upgrade-1.2.8-1.2.10.patch"

RnJvbSBhZTdiZjVlMDRkOGYxMjQ0ZDM1MGMwNGMyNWQzYmZhOGI4YzEzOWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjozNDoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5l
dHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0OiB1cGdyYWRlIDEuMi44IC0+IDEuMi4xMAoKLS0tCiAu
Li5wZW5jb25uZWN0XzEuMi44LmJiID0+IG5ldHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0XzEuMi4x
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21h
bmFnZXIve25ldHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0XzEuMi44LmJiID0+IG5ldHdvcmttYW5h
Z2VyLW9wZW5jb25uZWN0XzEuMi4xMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXIt
b3BlbmNvbm5lY3RfMS4yLjguYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXItb3BlbmNvbm5lY3RfMS4yLjEwLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9uZXR3b3JrbWFuYWdlci9uZXR3b3JrbWFuYWdlci1vcGVuY29ubmVjdF8xLjIu
OC5iYgpyZW5hbWUgdG8gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldHdv
cmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0XzEuMi4xMC5iYgppbmRleCBjOTc4
ZGVmYmIuLmVmZDA5OTI1MiAxMDA2NDQKLS0tIGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29u
bmVjdGl2aXR5L25ldHdvcmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0XzEuMi44
LmJiCisrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXR3b3JrbWFu
YWdlci9uZXR3b3JrbWFuYWdlci1vcGVuY29ubmVjdF8xLjIuMTAuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgaW5oZXJpdCBnbm9tZWJhc2UgdXNlcmFkZAogCiBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9S
fS9OZXR3b3JrTWFuYWdlci1vcGVuY29ubmVjdC8ke0Bnbm9tZV92ZXJkaXIoIiR7UFZ9Iil9L05l
dHdvcmtNYW5hZ2VyLW9wZW5jb25uZWN0LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjVkZWRhYTc4NWQ4MmQ4ZTIzOWRkZDA4MmJmYWM1MjUwYzY5MWU5NjQ0NjRiZTE4MDdi
NjgyNzI2MzYzM2NkY2MiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODQ0YjZiZjY0ZWNhZGI5N2I0
YTY4Yzc3NmRiODlhYTVlNmVlN2U1OWJkMjRiMDE4MDIyODQwNjg2MzEzNjQ2NCIKIAogUyA9ICIk
e1dPUktESVJ9L05ldHdvcmtNYW5hZ2VyLW9wZW5jb25uZWN0LSR7UFZ9IgogCi0tIAoyLjM5LjIK
Cg==

--===============6379461761847361751==--

