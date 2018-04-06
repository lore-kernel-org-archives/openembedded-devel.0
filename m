Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 81A8A747AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 08:33:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2018 01:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,414,1517904000"; d="scan'208";a="214393007"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 06 Apr 2018 01:33:09 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 8CF965803C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 01:33:07 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Apr 2018 11:33:27 +0300
Message-Id: <1523003607-9699-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] ell: upgrade to version 0.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2018 08:33:08 -0000

1. Upgrade to version 0.4 and rename from _git to exact version _0.4
2. Fix build issues with musl libc

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../ell/0001-ell-fix-build-with-musl-libc.patch    | 39 ++++++++++++++++++++++
 .../recipes-core/ell/{ell_git.bb => ell_0.4.bb}    |  6 ++--
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
 rename meta-oe/recipes-core/ell/{ell_git.bb => ell_0.4.bb} (64%)

diff --git a/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch b/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000..a172a93
--- /dev/null
+++ b/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
@@ -0,0 +1,39 @@
+From 4f8c68757b05d12392cd1a8aed174cb8e56f80e3 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Thu, 5 Apr 2018 17:19:44 +0300
+Subject: [PATCH] ell: fix build with musl libc
+
+musl libc doesn't implement TEMP_FAILURE_RETRY. Use the
+TEMP_FAILURE_RETRY from glibc to fix build.
+
+Upstream-Status: Submitted [https://lists.01.org/pipermail/ell/2018-April/001209.html]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ ell/dbus.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/ell/dbus.h b/ell/dbus.h
+index a7c08d2..3ff5e0f 100644
+--- a/ell/dbus.h
++++ b/ell/dbus.h
+@@ -28,6 +28,16 @@
+ #include <stddef.h>
+ #include <stdarg.h>
+ 
++/* taken from glibc unistd.h for musl support */
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression)             \
++  (__extension__                                   \
++    ({ long int __result;                          \
++       do __result = (long int) (expression);      \
++       while (__result == -1L && errno == EINTR);  \
++       __result; }))
++#endif
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+-- 
+2.4.0
+
diff --git a/meta-oe/recipes-core/ell/ell_git.bb b/meta-oe/recipes-core/ell/ell_0.4.bb
similarity index 64%
rename from meta-oe/recipes-core/ell/ell_git.bb
rename to meta-oe/recipes-core/ell/ell_0.4.bb
index 4354974..1524bd6 100644
--- a/meta-oe/recipes-core/ell/ell_git.bb
+++ b/meta-oe/recipes-core/ell/ell_0.4.bb
@@ -7,8 +7,10 @@ SECTION = "libs"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "8192131685be0f27d6f51b14b78ef93fa7f3c692"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
+SRCREV = "b4aea06fabb2af1af01f861f8f394c75950b6d47"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git \
+           file://0001-ell-fix-build-with-musl-libc.patch \
+          "
 
 do_configure_prepend () {
     mkdir ${S}/build-aux
-- 
2.4.0


