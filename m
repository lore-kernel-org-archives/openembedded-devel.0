Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.4068.1595527182557397011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 10:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06NHxeUB009178
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2020 10:59:41 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 23 Jul 2020
 10:59:21 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2][meta-oe][PATCH 1/1] lvm2: allow for reproducible binary builds
Date: Thu, 23 Jul 2020 10:59:21 -0700
Message-ID: <20200723175921.15883-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Modify original method to eliminate conditional patching
of configure.ac.  Use SOURCE_DATE_EPOCH which is
required for reproducible binaries.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-support/lvm2/files/reproducible-build.patch  | 16 ++++++++++------
 meta-oe/recipes-support/lvm2/lvm2.inc                    |  2 +-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/reproducible-build.patch b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
index db598a8..3f53db9 100644
--- a/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
+++ b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
@@ -1,23 +1,27 @@
 configure.ac:  override CONFIGURE_LINE
 
 For reproducible binaries, we need to report a constant CONFIGURE_LINE.
-This patched is only applied for such builds.
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
 
 --- git.orig/configure.ac
 +++ git/configure.ac
-@@ -15,7 +15,10 @@ AC_PREREQ(2.69)
+@@ -15,7 +15,15 @@ AC_PREREQ(2.69)
  ################################################################################
  dnl -- Process this file with autoconf to produce a configure script.
  AC_INIT
 -CONFIGURE_LINE="$0 $@"
-+dnl The default CONFIGURE_LINE has been overridden for reproducible binaries
-+dnl CONFIGURE_LINE="$0 $@"
-+CONFIGURE_LINE="configure parameters are not available for reproducible builds"
++
++dnl per reproducible-builds.org check SOURCE_DATE_EPOCH
++dnl
++if test -z "${SOURCE_DATE_EPOCH+set}" ; then
++    CONFIGURE_LINE="$0 $@"
++else
++    CONFIGURE_LINE="configure options are not available for reproducible builds"
++fi
 +
  AC_CONFIG_SRCDIR([lib/device/dev-cache.h])
  AC_CONFIG_HEADERS([include/configure.h])
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index ab618b4..3c6c7ed 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -15,7 +15,7 @@ SRC_URI = "git://sourceware.org/git/lvm2.git \
            file://0001-Avoid-bashisms-in-init-scripts.patch \
            file://0005-do-not-build-manual.patch \
            file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
-           ${@bb.utils.contains('BUILD_REPRODUCIBLE_BINARIES','1','file://reproducible-build.patch','', d)} \
+           file://reproducible-build.patch \
            "
 
 SRCREV = "b9391b1b9f0b73303fa21f8f92574d17ce4c2b02"
-- 
2.7.4

