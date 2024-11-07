Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F006D5D694
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 21:59:53 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.4615.1731016786012621757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 13:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LqbeAW6w;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241107215941a840401f79ef8e47cc-fyxfxu@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241107215941a840401f79ef8e47cc
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 07 Nov 2024 22:59:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=reTnYAmCXu5CCu/Rm+TcATEpJYhtSMGRsU1NqGr3e+Y=;
 b=LqbeAW6wXPHbtao4u1PtM4Es7acT8C0HfT10kVnwLD2+Hsd+LGwC1jKv3NZRJZikx5PSct
 b0LsukgcMDc7/R7Zish5Lhqb9m4i4DhpoMrS1n0PZcx8RJo+I3o/KpWeNpKPO7xc8u76xHBr
 L99F1LflsZ2kG2M9FcYcaYM3MFdqVUf4VD4AlChLYR0J+4Ic8oB0kU9LnQ3TYWCDrE+JLtpl
 6l+Yq0ZOlmOK3AWrgEKm+i7W/NaqNAoITNuaj+wWUIo8227KX18zDeN1QQkC54ydFJjcchfz
 wwldL8Uftq5rhpHguxs0ry9nJKB7+Qanp3LeZ6veq5v02cPNhsgxmMbw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/2] squid: upgrade 6.10 -> 6.12
Date: Thu,  7 Nov 2024 22:58:48 +0100
Message-Id: <20241107215849.2282940-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 21:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113757

From: Peter Marko <peter.marko@siemens.com>

License-Update: copyright year updated

Add patch to fix new build failure from release tarball.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...e-reference-to-nonexisting-directory.patch | 55 +++++++++++++++++++
 .../squid/{squid_6.10.bb => squid_6.12.bb}    |  5 +-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
 rename meta-networking/recipes-daemons/squid/{squid_6.10.bb => squid_6.12.bb} (95%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
new file mode 100644
index 0000000000..9babcfb24d
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
@@ -0,0 +1,55 @@
+From a6638a007a42917fea4b03e5c30d9b7208c634c4 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Thu, 7 Nov 2024 22:04:40 +0100
+Subject: [PATCH] libltdl: remove reference to nonexisting directory
+
+Commit [1] removed directory libltdl/m4 from release tarball by merging
+all those files into libltdl/aclocal.m4, however makefiles still
+reference it causing following error in do_configure:
+
+| autoreconf: Entering directory 'libltdl'
+| autoreconf: configure.ac: not using Gettext
+| autoreconf: running: aclocal --system-acdir=WORKDIR/recipe-sysroot/usr/share/aclocal/ -I WORKDIR/squid-6.12/acinclude/ -I WORKDIR/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
+| aclocal: error: couldn't open directory 'm4': No such file or directory
+| autoreconf: error: aclocal failed with exit status: 1
+
+Remove these invalid references.
+
+[1] https://github.com/squid-cache/squid/commit/b4addc2262e5bee37543f8d1ab9dd98337bafba3
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Upstream-Status: Inappropriate [upstream ticket https://lists.squid-cache.org/pipermail/squid-users/2024-November/027244.html]
+---
+ libltdl/Makefile.am | 2 +-
+ libltdl/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libltdl/Makefile.am b/libltdl/Makefile.am
+index aad98e2..8a9539b 100644
+--- a/libltdl/Makefile.am
++++ b/libltdl/Makefile.am
+@@ -29,7 +29,7 @@
+ ## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+ #####
+ 
+-ACLOCAL_AMFLAGS = -I m4
++ACLOCAL_AMFLAGS =
+ AUTOMAKE_OPTIONS = foreign
+ AM_CPPFLAGS =
+ AM_LDFLAGS =
+diff --git a/libltdl/Makefile.in b/libltdl/Makefile.in
+index 9929557..c77df2e 100644
+--- a/libltdl/Makefile.in
++++ b/libltdl/Makefile.in
+@@ -448,7 +448,7 @@ target_alias = @target_alias@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-ACLOCAL_AMFLAGS = -I m4
++ACLOCAL_AMFLAGS =
+ AUTOMAKE_OPTIONS = foreign
+ 
+ # -I$(srcdir) is needed for user that built libltdl with a sub-Automake
+-- 
+2.30.2
+
diff --git a/meta-networking/recipes-daemons/squid/squid_6.10.bb b/meta-networking/recipes-daemons/squid/squid_6.12.bb
similarity index 95%
rename from meta-networking/recipes-daemons/squid/squid_6.10.bb
rename to meta-networking/recipes-daemons/squid/squid_6.12.bb
index 984209ad21..cc3d2f25db 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.10.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.12.bb
@@ -19,13 +19,14 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://volatiles.03_squid \
            file://0002-squid-make-squid-conf-tests-run-on-target-device.patch \
+           file://0001-libltdl-remove-reference-to-nonexisting-directory.patch \
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "0b07b187e723f04770dd25beb89aec12030a158696aa8892d87c8b26853408a7"
+SRC_URI[sha256sum] = "f3df3abb2603a513266f24a5d4699a9f0d76b9f554d1848b67f9c51cd3b3cb50"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://errors/COPYRIGHT;md5=d324bc1f9447d1d1588d75b22a678dc4 \
+                    file://errors/COPYRIGHT;md5=6fbb6a2adc362e206da7b4f42846cdec \
                     "
 DEPENDS = "libtool"
 
-- 
2.30.2


