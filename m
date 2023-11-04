Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB7CC4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 08:02:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.5773.1699084914928523498
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 01:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ScoXiDTb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Xasx93tV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b995a4d4e-a95fb0c8-fc2e-4eb5-b5b9-5f4340fc61e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PVy4Zww98OIJKdx+uQv8dS7FFN3fhRGv8nM+zgJZoYQ=;
	b=ScoXiDTbUf79gugCplgzB+Q8lSq+r3CH1J4qRHumnL2RFhR6Vmnu1MP/kGkqCpur
	skyP0OZBL1+RwGSePoXsxIYUzlk0rYydV2T9FukLEkxTrWeYCnU+IhfOGwYhzAlyagK
	DsNb+0IB/a2n3yJPMY3MKdKyZfpe7s9/jj6Ft0Gg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PVy4Zww98OIJKdx+uQv8dS7FFN3fhRGv8nM+zgJZoYQ=;
	b=Xasx93tV9bl2Uz56iC7T9oNqyLWgEYskjQKp2U3nleKTxnTHsupDBBd+1tD8xpM4
	w+TSiwZ1IZvHTX5wEyZ7eYVzIk9ZkpEYe28Luz7D9RN8SYTK7EqVjWXweg8TMJp2Xmf
	LyNsbq3fxdMB7ClVcoolkZB9y/c8Tr/YpdUzpFxs=
Content-Type: multipart/mixed; boundary="===============0460799147951225730=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] apache2: upgrading to 2.4.58 FAILED
Message-ID: <0101018b995a4d4e-a95fb0c8-fc2e-4eb5-b5b9-5f4340fc61e2-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 08:01:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 08:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106367

--===============0460799147951225730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apache2* to *2.4.58* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-apache2-upgrade-2.4.57-2.4.58.patch
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
From 4fefdd28099e9edb6654690b5e123efe802147e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:53:03 +0000
Subject: [PATCH] apache2: upgrade 2.4.57 -> 2.4.58

---
 ...config9.m4-Add-server-directory-to-i.patch | 31 -------------------
 .../{apache2_2.4.57.bb => apache2_2.4.58.bb}  | 10 ++++--
 2 files changed, 7 insertions(+), 34 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => apache2_2.4.58.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
deleted file mode 100644
index 9accbf18a..000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00 2001
-From: Valeria Petrov <valeria.petrov@spinetix.com>
-Date: Tue, 18 Apr 2023 15:38:53 +0200
-Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
- include path if mod_rewrite is enabled.
-
-Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&revision=1909241]
-
----
- modules/mappers/config9.m4 | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/modules/mappers/config9.m4 b/modules/mappers/config9.m4
-index 55a97ab993..7120b729b7 100644
---- a/modules/mappers/config9.m4
-+++ b/modules/mappers/config9.m4
-@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to user-specific directories, , , mos
- APACHE_MODULE(alias, mapping of requests to different filesystem parts, , , yes)
- APACHE_MODULE(rewrite, rule based URL manipulation, , , most)
- 
-+if test "x$enable_rewrite" != "xno"; then
-+    # mod_rewrite needs test_char.h
-+    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server])
-+fi
-+
- APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
- 
- APACHE_MODPATH_FINISH
--- 
-2.25.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
index 00f8aaa41..fec833af1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
@@ -16,8 +16,12 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://0001-make_exports.awk-not-expose-the-path.patch \
-           file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch \
-          "
+           file://0010-apache2-do-not-use-relative-path-for-gen_test_char.patch \
+           file://init \
+           file://apache2-volatile.conf \
+           file://apache2.service \
+           file://volatiles.04_apache2 \
+           "
 
 SRC_URI:append:class-target = " \
            file://0010-apache2-do-not-use-relative-path-for-gen_test_char.patch \
@@ -28,7 +32,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a"
+SRC_URI[sha256sum] = "fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.39.2


--===============0460799147951225730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4888 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:ab1463cd31c53afbff4015f9642e3b38607948c8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 381 Local 369 Mirrors 0 Missed 12 Current 308 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 320 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 325 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/apr/apr-util_1.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 439 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre_8.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 460 of 689 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 689 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 529 of 689 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/apr/apr-util_1.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 689 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe apache2-2.4.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe apr-util-1.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe apache2-native-2.4.58-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre-native-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe apache2-native-2.4.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe apr-util-native-1.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe apache2-2.4.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 473 of 1953 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_fetch)
NOTE: recipe libpcre-8.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 563 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 564 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 570 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/apr/apr_1.7.4.bb:do_create_spdx_setscene)
NOTE: recipe apache2-native-2.4.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe apache2-native-2.4.58-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 573 of 689 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_recipe_qa_setscene)
NOTE: recipe apache2-2.4.58-r0: task do_fetch: Started
NOTE: recipe libpcre-native-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 689 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libpcre/libpcre_8.45.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe apr-util-native-1.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe apr-1.7.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 583 of 689 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/apr/apr-util_1.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 689 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/apr/apr_1.7.4.bb:do_populate_sysroot_setscene)
NOTE: recipe apache2-2.4.58-r0: task do_fetch: Succeeded
NOTE: Running task 493 of 1953 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_unpack)
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe apache2-native-2.4.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe apr-1.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre-native-8.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 625 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 627 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe apache2-2.4.58-r0: task do_unpack: Started
NOTE: Running setscene task 636 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe apr-util-native-1.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe apache2-native-2.4.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe apr-native-1.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 545 of 1953 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_fetch)
NOTE: recipe libpcre-native-8.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe apr-util-native-1.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe apache2-native-2.4.58-r0: task do_fetch: Started
NOTE: recipe apr-native-1.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 689 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/apr/apr_1.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 639 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe apr-native-1.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe apr-native-1.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 646 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 656 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe apache2-native-2.4.58-r0: task do_fetch: Succeeded
NOTE: recipe apache2-2.4.58-r0: task do_unpack: Succeeded
NOTE: Running task 1233 of 1953 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_unpack)
NOTE: Running task 1234 of 1953 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_patch)
NOTE: Running task 1311 of 1953 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_prepare_recipe_sysroot)
NOTE: recipe apache2-2.4.58-r0: task do_patch: Started
NOTE: recipe apache2-native-2.4.58-r0: task do_unpack: Started
NOTE: recipe apache2-native-2.4.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apache2-native-2.4.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 689 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe apache2-native-2.4.58-r0: task do_unpack: Succeeded
NOTE: Running task 1929 of 1953 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_patch)
NOTE: Running task 1932 of 1953 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_collect_spdx_deps)
NOTE: recipe apache2-native-2.4.58-r0: task do_patch: Started
NOTE: recipe apache2-2.4.58-r0: task do_collect_spdx_deps: Started
NOTE: recipe apache2-2.4.58-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe apache2-native-2.4.58-r0: task do_patch: Succeeded
NOTE: Running task 1934 of 1953 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_configure)
NOTE: recipe apache2-native-2.4.58-r0: task do_configure: Started
NOTE: recipe apache2-2.4.58-r0: task do_patch: Failed
NOTE: recipe apache2-native-2.4.58-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1934 tasks of which 1925 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104075238.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104075238.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: apache2-2.4.58-r0 do_patch: Applying patch '0010-apache2-do-not-use-relative-path-for-gen_test_char.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/apache2/2.4.58/httpd-2.4.58'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/apache2/2.4.58/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0010-apache2-do-not-use-relative-path-for-gen_test_char.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/apache2/2.4.58/temp/log.do_patch.3016334
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb:do_patch) failed with exit code '1'

--===============0460799147951225730==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-apache2-upgrade-2.4.57-2.4.58.patch"

RnJvbSA0ZmVmZGQyODA5OWU5ZWRiNjY1NDY5MGI1ZTEyM2VmZTgwMjE0N2U5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzo1MzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
YWNoZTI6IHVwZ3JhZGUgMi40LjU3IC0+IDIuNC41OAoKLS0tCiAuLi5jb25maWc5Lm00LUFkZC1z
ZXJ2ZXItZGlyZWN0b3J5LXRvLWkucGF0Y2ggfCAzMSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e2FwYWNoZTJfMi40LjU3LmJiID0+IGFwYWNoZTJfMi40LjU4LmJifSAgfCAxMCArKysrLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2FwYWNoZTIvYXBhY2hlMi8w
MDExLW1vZHVsZXMtbWFwcGVycy1jb25maWc5Lm00LUFkZC1zZXJ2ZXItZGlyZWN0b3J5LXRvLWku
cGF0Y2gKIHJlbmFtZSBtZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2FwYWNoZTIve2FwYWNo
ZTJfMi40LjU3LmJiID0+IGFwYWNoZTJfMi40LjU4LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21l
dGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvYXBhY2hlMi9hcGFjaGUyLzAwMTEtbW9kdWxlcy1t
YXBwZXJzLWNvbmZpZzkubTQtQWRkLXNlcnZlci1kaXJlY3RvcnktdG8taS5wYXRjaCBiL21ldGEt
d2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvYXBhY2hlMi9hcGFjaGUyLzAwMTEtbW9kdWxlcy1tYXBw
ZXJzLWNvbmZpZzkubTQtQWRkLXNlcnZlci1kaXJlY3RvcnktdG8taS5wYXRjaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggOWFjY2JmMThhLi4wMDAwMDAwMDAKLS0tIGEvbWV0YS13ZWJz
ZXJ2ZXIvcmVjaXBlcy1odHRwZC9hcGFjaGUyL2FwYWNoZTIvMDAxMS1tb2R1bGVzLW1hcHBlcnMt
Y29uZmlnOS5tNC1BZGQtc2VydmVyLWRpcmVjdG9yeS10by1pLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsMzEgKzAsMCBAQAotRnJvbSA1YzkyNTdmYTM0MzM1ZmY4M2Y3YzAxNTgxY2Y5NTMxMTEw
NzJhNDU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogVmFsZXJpYSBQZXRyb3YgPHZh
bGVyaWEucGV0cm92QHNwaW5ldGl4LmNvbT4KLURhdGU6IFR1ZSwgMTggQXByIDIwMjMgMTU6Mzg6
NTMgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gKiBtb2R1bGVzL21hcHBlcnMvY29uZmlnOS5tNDog
QWRkICdzZXJ2ZXInIGRpcmVjdG9yeSB0bwotIGluY2x1ZGUgcGF0aCBpZiBtb2RfcmV3cml0ZSBp
cyBlbmFibGVkLgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL3N2bi5hcGFj
aGUub3JnL3ZpZXd2Yz92aWV3PXJldmlzaW9uJnJldmlzaW9uPTE5MDkyNDFdCi0KLS0tLQotIG1v
ZHVsZXMvbWFwcGVycy9jb25maWc5Lm00IHwgNSArKysrKwotIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL21vZHVsZXMvbWFwcGVycy9jb25maWc5Lm00IGIv
bW9kdWxlcy9tYXBwZXJzL2NvbmZpZzkubTQKLWluZGV4IDU1YTk3YWI5OTMuLjcxMjBiNzI5Yjcg
MTAwNjQ0Ci0tLS0gYS9tb2R1bGVzL21hcHBlcnMvY29uZmlnOS5tNAotKysrIGIvbW9kdWxlcy9t
YXBwZXJzL2NvbmZpZzkubTQKLUBAIC0xNCw2ICsxNCwxMSBAQCBBUEFDSEVfTU9EVUxFKHVzZXJk
aXIsIG1hcHBpbmcgb2YgcmVxdWVzdHMgdG8gdXNlci1zcGVjaWZpYyBkaXJlY3RvcmllcywgLCAs
IG1vcwotIEFQQUNIRV9NT0RVTEUoYWxpYXMsIG1hcHBpbmcgb2YgcmVxdWVzdHMgdG8gZGlmZmVy
ZW50IGZpbGVzeXN0ZW0gcGFydHMsICwgLCB5ZXMpCi0gQVBBQ0hFX01PRFVMRShyZXdyaXRlLCBy
dWxlIGJhc2VkIFVSTCBtYW5pcHVsYXRpb24sICwgLCBtb3N0KQotIAotK2lmIHRlc3QgIngkZW5h
YmxlX3Jld3JpdGUiICE9ICJ4bm8iOyB0aGVuCi0rICAgICMgbW9kX3Jld3JpdGUgbmVlZHMgdGVz
dF9jaGFyLmgKLSsgICAgQVBSX0FERFRPKElOQ0xVREVTLCBbLUlcJCh0b3BfYnVpbGRkaXIpL3Nl
cnZlcl0pCi0rZmkKLSsKLSBBUFJfQUREVE8oSU5DTFVERVMsIFstSVwkKHRvcF9zcmNkaXIpLyRt
b2RwYXRoX2N1cnJlbnRdKQotIAotIEFQQUNIRV9NT0RQQVRIX0ZJTklTSAotLS0gCi0yLjI1LjEK
LQpkaWZmIC0tZ2l0IGEvbWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy1odHRwZC9hcGFjaGUyL2FwYWNo
ZTJfMi40LjU3LmJiIGIvbWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy1odHRwZC9hcGFjaGUyL2FwYWNo
ZTJfMi40LjU4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEtd2Vic2Vy
dmVyL3JlY2lwZXMtaHR0cGQvYXBhY2hlMi9hcGFjaGUyXzIuNC41Ny5iYgpyZW5hbWUgdG8gbWV0
YS13ZWJzZXJ2ZXIvcmVjaXBlcy1odHRwZC9hcGFjaGUyL2FwYWNoZTJfMi40LjU4LmJiCmluZGV4
IDAwZjhhYWE0MS4uZmVjODMzYWYxIDEwMDY0NAotLS0gYS9tZXRhLXdlYnNlcnZlci9yZWNpcGVz
LWh0dHBkL2FwYWNoZTIvYXBhY2hlMl8yLjQuNTcuYmIKKysrIGIvbWV0YS13ZWJzZXJ2ZXIvcmVj
aXBlcy1odHRwZC9hcGFjaGUyL2FwYWNoZTJfMi40LjU4LmJiCkBAIC0xNiw4ICsxNiwxMiBAQCBT
UkNfVVJJID0gIiR7QVBBQ0hFX01JUlJPUn0vaHR0cGQvaHR0cGQtJHtQVn0udGFyLmJ6MiBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDA4LUZpeC1wZXJsLWluc3RhbGwtZGlyZWN0b3J5LXRvLXVzci1i
aW4ucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwOS1zdXBwb3J0LWFweHMuaW4tZm9yY2Ut
ZGVzdGRpci10by1iZS1lbXB0eS1zdHJpbmcucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1tYWtlX2V4cG9ydHMuYXdrLW5vdC1leHBvc2UtdGhlLXBhdGgucGF0Y2ggXAotICAgICAgICAg
ICBmaWxlOi8vMDAxMS1tb2R1bGVzLW1hcHBlcnMtY29uZmlnOS5tNC1BZGQtc2VydmVyLWRpcmVj
dG9yeS10by1pLnBhdGNoIFwKLSAgICAgICAgICAiCisgICAgICAgICAgIGZpbGU6Ly8wMDEwLWFw
YWNoZTItZG8tbm90LXVzZS1yZWxhdGl2ZS1wYXRoLWZvci1nZW5fdGVzdF9jaGFyLnBhdGNoIFwK
KyAgICAgICAgICAgZmlsZTovL2luaXQgXAorICAgICAgICAgICBmaWxlOi8vYXBhY2hlMi12b2xh
dGlsZS5jb25mIFwKKyAgICAgICAgICAgZmlsZTovL2FwYWNoZTIuc2VydmljZSBcCisgICAgICAg
ICAgIGZpbGU6Ly92b2xhdGlsZXMuMDRfYXBhY2hlMiBcCisgICAgICAgICAgICIKIAogU1JDX1VS
STphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDEwLWFwYWNo
ZTItZG8tbm90LXVzZS1yZWxhdGl2ZS1wYXRoLWZvci1nZW5fdGVzdF9jaGFyLnBhdGNoIFwKQEAg
LTI4LDcgKzMyLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCiAgICAgICAg
ICAgICIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YmRkZWRkZmFj
ODBiMmM5YTg4MjI0MWQwMDhiYjQxYzMiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGJjY2I4NGFl
ZTk1ZTA5NWVkZmJiODFlNWViOTI2Y2NkMjRlNmFkYTU1ZGNkODNjYWVjYjI2MmU1Y2Y5NGQyYSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmYTE2ZDcyYTA3ODIxMGE1NGM0N2RkNWJlZjJmOGI5Yjhh
MDFkOTQ5MDlhNTE0NTM5NTZiM2VjNjQ0MmVhNGM1IgogCiBTID0gIiR7V09SS0RJUn0vaHR0cGQt
JHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============0460799147951225730==--

