Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49102C27C5B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:07 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62994.1699041175513935768
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NHh4uaeg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qx04fDs1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bee8c9-eda3d93a-87d5-4fba-a8bc-634955848d11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=optn8XBoF15IxNpcTbXQOTOSC37nUtt+x5662XwLw0g=;
	b=NHh4uaegz0aZ2jDw3yAhvRpeGGG42PQoyfKzQWyXTx0tMfS1fzjGj2pCVr05wH+y
	ph48oQCGwJz5hgW6WqkGQQCX4K7GM2JYHLSCc8kSHJ/6ZnNWa7a/IxcEndcRTsBNSUR
	npFRtE+yd7Q2bWgmW3um28PneDiZZJgP++8Ms80A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=optn8XBoF15IxNpcTbXQOTOSC37nUtt+x5662XwLw0g=;
	b=qx04fDs1SziHJ/9wpxxm1Vb5pQcUy/V4czi06hRYgE6Dnyvo8j4NUGRpcWh7zsKe
	EgkaHAsmLraCHdpneTnP0//+LUd929PAN0FyMxlAu622pPRQqvDsbs04v+Ql3+FmFdX
	pjC0eCjtYw696pDNzlQvIVQbBtlCRdLZmjGStBww=
Content-Type: multipart/mixed; boundary="===============2138242914630205401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] transmission: upgrading to 4.0.4 FAILED
Message-ID: <0101018b96bee8c9-eda3d93a-87d5-4fba-a8bc-634955848d11-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106027

--===============2138242914630205401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *transmission* to *4.0.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-transmission-upgrade-3.00-4.0.4.patch
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
From 8d92cf44ba7b5305e63923ea5d05b11039a48bd6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 18:51:54 +0000
Subject: [PATCH] transmission: upgrade 3.00 -> 4.0.4

---
 .../transmission/transmission_git.bb          | 32 +++++++++++++++----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_git.bb b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
index 735db1441..8982a0d41 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_git.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
@@ -1,20 +1,38 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,4 +1,4 @@
+# -Copyright 2005-2020. All code is copyrighted by the respective authors.
+# +Copyright 2005-2023. All code is copyrighted by the respective authors.
+#  
+#  Transmission can be redistributed and/or modified under the terms of
+#  the GNU GPLv2 (http://www.gnu.org/licenses/license-list.html#GPLv2),
+# 
+#
+
 DESCRIPTION = "Transmission is a fast, easy, and free BitTorrent client"
 SECTION = "network"
 HOMEPAGE = "https://transmissionbt.com/"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=73f535ddffcf2a0d3af4f381f84f9b33"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ba8199e739948e198310093de27175fa"
 
 DEPENDS = "curl libevent gnutls openssl libtool intltool-native glib-2.0-native"
 RDEPENDS:${PN}-web = "${PN}"
 
-SRC_URI = " \
-	gitsm://github.com/transmission/transmission;branch=master;protocol=https \
-	file://transmission-daemon \
-"
+SRC_URI = "gitsm://github.com/transmission/transmission;branch=4.0.x;protocol=https \
+           file://transmission-daemon \
+           "
 
 # Transmission release 3.00
-SRCREV = "bb6b5a062ee594dfd4b7a12a6b6e860c43849bfd"
-PV = "3.00"
+SRCREV = "24077e35111cd6a6498fa61910bb54288a702bfc"
+PV = "4.0.4"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============2138242914630205401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5054 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:5fdbf742e1ee13a3414490bafeae5229bc4fe552"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 549 Local 540 Mirrors 0 Missed 9 Current 507 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 516 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 518 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 522 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 524 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 532 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 533 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe transmission-4.0.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe transmission-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe transmission-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe transmission-4.0.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 642 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/systemd/systemd_254.4.bb:do_create_spdx_setscene)
NOTE: recipe transmission-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe transmission-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 600 of 2871 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_fetch)
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe transmission-4.0.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_254.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 834 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 837 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 912 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 957 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1056 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 963 of 1056 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe intltool-native-0.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe intltool-native-0.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 990 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe intltool-native-0.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe intltool-native-0.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 998 of 1056 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 999 of 1056 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1003 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe intltool-native-0.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml-parser-perl-native-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe intltool-native-0.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml-parser-perl-native-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1056 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1012 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1014 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml-parser-perl-native-2.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml-parser-perl-native-2.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1048 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1050 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1056 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe transmission-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2853 of 2871 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_unpack)
NOTE: Running task 2854 of 2871 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe transmission-4.0.4-r0: task do_unpack: Started
NOTE: recipe transmission-4.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe transmission-4.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe transmission-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2855 of 2871 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_patch)
NOTE: Running task 2856 of 2871 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_collect_spdx_deps)
NOTE: recipe transmission-4.0.4-r0: task do_patch: Started
NOTE: recipe transmission-4.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe transmission-4.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2858 of 2871 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_configure)
NOTE: recipe transmission-4.0.4-r0: task do_configure: Started
NOTE: recipe transmission-4.0.4-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/systemd/systemd_254.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/po
 kybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/lib
 event/libevent_2.1.12.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/poky
 build/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'glibc', 'initscripts', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'desktop-file-utils', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'libtool', 'quilt-native', 'gtk+3', 'curl', 'gnutls', 'libevent', 'gettext-native', 'glib-2.0-native', 'autoconf-native', 'automake-native', 'intltool-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'util-linux-native', 'python3-native', 'gettext-minimal-native', 'libffi-native', 'libpcre2-native', 'zlib-native', 'xz-native', 'linux-libc-headers', 'libgcc', 'libxml-parser-perl-native', 'gnu-config-native', 'm4-native', 'texinfo-dummy-native', 'libseccomp', 'shadow', 'acl', 'shadow-sysroot', 'libcap', 'opkg-utils', 'util-linux', 'kmod', 'base-files', 'libpam', 'bash-completion', 'zstd', 'shadow-native', 'libxkbcommon', 'base-passwd', 'nettle', 'libidn2', 'libunistring', 'libtasn1', 'gmp', 'libxrandr', 'libxfixes', 'wayland-protocols', 'libjpeg-tu
 rbo', 'gdk-pixbuf', 'libxcursor', 'libxdamage', 'at-spi2-core', 'libxcomposite', 'pango', 'glib-2.0', 'cairo', 'libxi', 'fontconfig', 'libxrender', 'mesa', 'wayland', 'libx11', 'libxext', 'libepoxy', 'libpng', 'gobject-introspection', 'zlib', 'binutils-cross-x86_64', 'gmp-native', 'flex-native', 'mpfr-native', 'zstd-native', 'libmpc-native', 'attr-native', 'util-linux-libuuid-native', 'ncurses-native', 'libcap-ng-native', 'libedit-native', 'libnsl2-native', 'expat-native', 'sqlite3-native', 'bzip2-native', 'gdbm-native', 'libtirpc-native', 'openssl-native', 'perl-native', 'libxcrypt', 'attr', 'ncurses', 'util-linux-libuuid', 'libcap-ng', 'xz', 'cracklib', 'libxml2', 'libxcb', 'xkeyboard-config', 'util-macros', 'xorgproto', 'shared-mime-info', 'dbus', 'libxtst', 'freetype', 'fribidi', 'harfbuzz', 'libxft', 'libpcre2', 'libffi', 'libsm', 'pixman', 'expat', 'xrandr', 'libxshmfence', 'libxxf86vm', 'vulkan-headers', 'libdrm', 'vulkan-loader', 'xtrans', 'python3', 'cmake-native', 'make-na
 tive', 'libxdmcp', 'xcb-proto', 'libxau', 'libpthread-stubs', 'icu', 'bzip2', 'libice', 'libpciaccess', 'libtirpc', 'sqlite3', 'libedit', 'gdbm', 'libnsl2']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| sed: can't read /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/transmission/4.0.4/git/configure.ac: No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/transmission/4.0.4/temp/run.do_configure.2426862:152 exit 2 from 'sed -i /AM_GLIB_GNU_GETTEXT/d /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/transmission/4.0.4/git/configure.ac'
| WARNING: Backtrace (BB generated script):
| 	#1: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/transmission/4.0.4/temp/run.do_configure.2426862, line 152
| 	#2: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/transmission/4.0.4/temp/run.do_configure.2426862, line 210
NOTE: recipe transmission-4.0.4-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2859 tasks of which 2853 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103185126.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103185126.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: transmission-4.0.4-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/transmission/4.0.4/temp/run.do_configure.2426862', 2, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/transmission/4.0.4/temp/log.do_configure.2426862
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_git.bb:do_configure) failed with exit code '1'

--===============2138242914630205401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-transmission-upgrade-3.00-4.0.4.patch"

RnJvbSA4ZDkyY2Y0NGJhN2I1MzA1ZTYzOTIzZWE1ZDA1YjExMDM5YTQ4YmQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxODo1MTo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRy
YW5zbWlzc2lvbjogdXBncmFkZSAzLjAwIC0+IDQuMC40CgotLS0KIC4uLi90cmFuc21pc3Npb24v
dHJhbnNtaXNzaW9uX2dpdC5iYiAgICAgICAgICB8IDMyICsrKysrKysrKysrKysrKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvdHJhbnNtaXNzaW9uL3RyYW5zbWlzc2lv
bl9naXQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L3RyYW5zbWlzc2lvbi90cmFu
c21pc3Npb25fZ2l0LmJiCmluZGV4IDczNWRiMTQ0MS4uODk4MmEwZDQxIDEwMDY0NAotLS0gYS9t
ZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L3RyYW5zbWlzc2lvbi90cmFuc21pc3Npb25fZ2l0
LmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvdHJhbnNtaXNzaW9uL3RyYW5z
bWlzc2lvbl9naXQuYmIKQEAgLTEsMjAgKzEsMzggQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNf
Q0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMg
VGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBu
ZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5l
ZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ug
dmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTog
Y29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBD
T1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IDIw
MDUtMjAyMC4gQWxsIGNvZGUgaXMgY29weXJpZ2h0ZWQgYnkgdGhlIHJlc3BlY3RpdmUgYXV0aG9y
cy4KKyMgK0NvcHlyaWdodCAyMDA1LTIwMjMuIEFsbCBjb2RlIGlzIGNvcHlyaWdodGVkIGJ5IHRo
ZSByZXNwZWN0aXZlIGF1dGhvcnMuCisjICAKKyMgIFRyYW5zbWlzc2lvbiBjYW4gYmUgcmVkaXN0
cmlidXRlZCBhbmQvb3IgbW9kaWZpZWQgdW5kZXIgdGhlIHRlcm1zIG9mCisjICB0aGUgR05VIEdQ
THYyIChodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvbGljZW5zZS1saXN0Lmh0bWwjR1BMdjIp
LAorIyAKKyMKKwogREVTQ1JJUFRJT04gPSAiVHJhbnNtaXNzaW9uIGlzIGEgZmFzdCwgZWFzeSwg
YW5kIGZyZWUgQml0VG9ycmVudCBjbGllbnQiCiBTRUNUSU9OID0gIm5ldHdvcmsiCiBIT01FUEFH
RSA9ICJodHRwczovL3RyYW5zbWlzc2lvbmJ0LmNvbS8iCiBMSUNFTlNFID0gIkdQTC0yLjAtb25s
eSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTczZjUzNWRkZmZjZjJh
MGQzYWY0ZjM4MWY4NGY5YjMzIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YmE4MTk5ZTczOTk0OGUxOTgzMTAwOTNkZTI3MTc1ZmEiCiAKIERFUEVORFMgPSAiY3VybCBs
aWJldmVudCBnbnV0bHMgb3BlbnNzbCBsaWJ0b29sIGludGx0b29sLW5hdGl2ZSBnbGliLTIuMC1u
YXRpdmUiCiBSREVQRU5EUzoke1BOfS13ZWIgPSAiJHtQTn0iCiAKLVNSQ19VUkkgPSAiIFwKLQln
aXRzbTovL2dpdGh1Yi5jb20vdHJhbnNtaXNzaW9uL3RyYW5zbWlzc2lvbjticmFuY2g9bWFzdGVy
O3Byb3RvY29sPWh0dHBzIFwKLQlmaWxlOi8vdHJhbnNtaXNzaW9uLWRhZW1vbiBcCi0iCitTUkNf
VVJJID0gImdpdHNtOi8vZ2l0aHViLmNvbS90cmFuc21pc3Npb24vdHJhbnNtaXNzaW9uO2JyYW5j
aD00LjAueDtwcm90b2NvbD1odHRwcyBcCisgICAgICAgICAgIGZpbGU6Ly90cmFuc21pc3Npb24t
ZGFlbW9uIFwKKyAgICAgICAgICAgIgogCiAjIFRyYW5zbWlzc2lvbiByZWxlYXNlIDMuMDAKLVNS
Q1JFViA9ICJiYjZiNWEwNjJlZTU5NGRmZDRiN2ExMmE2YjZlODYwYzQzODQ5YmZkIgotUFYgPSAi
My4wMCIKK1NSQ1JFViA9ICIyNDA3N2UzNTExMWNkNmE2NDk4ZmE2MTkxMGJiNTQyODhhNzAyYmZj
IgorUFYgPSAiNC4wLjQiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============2138242914630205401==--

