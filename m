Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2361.1595019634553272634
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 14:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06HL0DSl030346
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 14:00:23 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Jul 2020
 13:59:56 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] lvm2: reproducible binaries
Date: Fri, 17 Jul 2020 13:59:56 -0700
Message-ID: <20200717205956.131825-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

For reproducible binaries, create a static CONFIGURE_LINE
during configuration rather than reporting the command line
invoking configure.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../lvm2/files/reproducible-build.patch            | 24 ++++++++++++++++++++++
 meta-oe/recipes-support/lvm2/lvm2.inc              |  2 ++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/files/reproducible-build.patch

diff --git a/meta-oe/recipes-support/lvm2/files/reproducible-build.patch b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
new file mode 100644
index 0000000..db598a8
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/files/reproducible-build.patch
@@ -0,0 +1,24 @@
+configure.ac:  override CONFIGURE_LINE
+
+For reproducible binaries, we need to report a constant CONFIGURE_LINE.
+This patched is only applied for such builds.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -15,7 +15,10 @@ AC_PREREQ(2.69)
+ ################################################################################
+ dnl -- Process this file with autoconf to produce a configure script.
+ AC_INIT
+-CONFIGURE_LINE="$0 $@"
++dnl The default CONFIGURE_LINE has been overridden for reproducible binaries
++dnl CONFIGURE_LINE="$0 $@"
++CONFIGURE_LINE="configure parameters are not available for reproducible builds"
++
+ AC_CONFIG_SRCDIR([lib/device/dev-cache.h])
+ AC_CONFIG_HEADERS([include/configure.h])
+ 
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 01c9df4..ab618b4 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -15,7 +15,9 @@ SRC_URI = "git://sourceware.org/git/lvm2.git \
            file://0001-Avoid-bashisms-in-init-scripts.patch \
            file://0005-do-not-build-manual.patch \
            file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
+           ${@bb.utils.contains('BUILD_REPRODUCIBLE_BINARIES','1','file://reproducible-build.patch','', d)} \
            "
+
 SRCREV = "b9391b1b9f0b73303fa21f8f92574d17ce4c2b02"
 S = "${WORKDIR}/git"
 
-- 
2.7.4

