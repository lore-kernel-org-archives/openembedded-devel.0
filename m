Return-Path: <martin@geanix.com>
X-Greylist: delayed 468 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Jul 2018 21:00:56 UTC
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 9C64974599
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 21:00:56 +0000 (UTC)
Received: from hundeboll.local (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 81D221C08F8;
	Tue, 10 Jul 2018 22:53:09 +0200 (CEST)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 22:53:02 +0200
Message-Id: <20180710205302.14034-1-martin@geanix.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ell: update to 0.6
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
X-List-Received-Date: Tue, 10 Jul 2018 21:00:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed patch is upstreamed

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 .../0001-ell-fix-build-with-musl-libc.patch   | 39 -------------------
 .../ell/{ell_0.4.bb => ell_0.6.bb}            |  6 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
 rename meta-oe/recipes-core/ell/{ell_0.4.bb => ell_0.6.bb} (64%)

diff --git a/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch b/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
deleted file mode 100644
index a172a93ca..000000000
--- a/meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 4f8c68757b05d12392cd1a8aed174cb8e56f80e3 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Thu, 5 Apr 2018 17:19:44 +0300
-Subject: [PATCH] ell: fix build with musl libc
-
-musl libc doesn't implement TEMP_FAILURE_RETRY. Use the
-TEMP_FAILURE_RETRY from glibc to fix build.
-
-Upstream-Status: Submitted [https://lists.01.org/pipermail/ell/2018-April/001209.html]
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- ell/dbus.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/ell/dbus.h b/ell/dbus.h
-index a7c08d2..3ff5e0f 100644
---- a/ell/dbus.h
-+++ b/ell/dbus.h
-@@ -28,6 +28,16 @@
- #include <stddef.h>
- #include <stdarg.h>
- 
-+/* taken from glibc unistd.h for musl support */
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression)             \
-+  (__extension__                                   \
-+    ({ long int __result;                          \
-+       do __result = (long int) (expression);      \
-+       while (__result == -1L && errno == EINTR);  \
-+       __result; }))
-+#endif
-+
- #ifdef __cplusplus
- extern "C" {
- #endif
--- 
-2.4.0
-
diff --git a/meta-oe/recipes-core/ell/ell_0.4.bb b/meta-oe/recipes-core/ell/ell_0.6.bb
similarity index 64%
rename from meta-oe/recipes-core/ell/ell_0.4.bb
rename to meta-oe/recipes-core/ell/ell_0.6.bb
index 1524bd6b9..8e7c88c52 100644
--- a/meta-oe/recipes-core/ell/ell_0.4.bb
+++ b/meta-oe/recipes-core/ell/ell_0.6.bb
@@ -7,10 +7,8 @@ SECTION = "libs"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "b4aea06fabb2af1af01f861f8f394c75950b6d47"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git \
-           file://0001-ell-fix-build-with-musl-libc.patch \
-          "
+SRCREV = "59ff3160fe55a841e662f8776f0520f2038235f4"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
 
 do_configure_prepend () {
     mkdir ${S}/build-aux
-- 
2.18.0


