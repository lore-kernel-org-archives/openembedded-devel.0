Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736D5C369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:51:12 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.4549.1744192264611073625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 9 Apr 2025 18:51:01 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.126 with ESMTP; 9 Apr 2025 18:51:00 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] perfetto: fix error with gcc-15
Date: Wed,  9 Apr 2025 18:51:00 +0900
Message-Id: <20250409095100.1818740-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 09:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116734

From: "mark.yang" <mark.yang@lge.com>

  * Add missing cstdint include to fix build error with gcc-15

  * To fix the error with gcc-15.
  http://errors.yoctoproject.org/Errors/Details/851189/
    ../git/include/perfetto/ext/tracing/core/slice.h:47:46: error: 'uint8_t' was not declared in this scope
    47 |   static Slice TakeOwnership(std::unique_ptr<uint8_t[]> buf, size_t size) {
        |                                              ^~~~~~~
    ../git/include/perfetto/ext/tracing/core/slice.h:25:1: note: 'uint8_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
    24 | #include <string>
    +++ |+#include <cstdint>

  * See also: https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
  Some C++ Standard Library headers have been changed to no longer include
  other headers that were being used internally by the library.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb |  1 +
 ...r-due-to-missing-cstdint-with-gcc-15.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto/0001-Fix-build-error-due-to-missing-cstdint-with-gcc-15.patch

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 5a5d4de899..229a5caee0 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -28,6 +28,7 @@ SRC_URI:append = " \
            \
            file://0001-Remove-check_build_deps-build-steps.patch \
            file://0002-traced-fix-missing-include.patch \
+           file://0001-Fix-build-error-due-to-missing-cstdint-with-gcc-15.patch \
            "
 
 SRCREV_bionic = "a0d0355105cb9d4a4b5384897448676133d7b8e2"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto/0001-Fix-build-error-due-to-missing-cstdint-with-gcc-15.patch b/meta-oe/recipes-devtools/perfetto/perfetto/0001-Fix-build-error-due-to-missing-cstdint-with-gcc-15.patch
new file mode 100644
index 0000000000..9f51290dcc
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto/0001-Fix-build-error-due-to-missing-cstdint-with-gcc-15.patch
@@ -0,0 +1,39 @@
+From 2413c2f7d4a96d4f6b5a5155fc35979183ddf291 Mon Sep 17 00:00:00 2001
+From: markyang92 <pllpokko@alumni.kaist.ac.kr>
+Date: Wed, 9 Apr 2025 18:25:09 +0900
+Subject: [PATCH] Fix build error due to missing cstdint with gcc-15
+
+  * Add missing cstdint include to fix build error with gcc-15
+
+  * To fix the error with gcc-15.
+  http://errors.yoctoproject.org/Errors/Details/851189/
+    ../git/include/perfetto/ext/tracing/core/slice.h:47:46: error: 'uint8_t' was not declared in this scope
+    47 |   static Slice TakeOwnership(std::unique_ptr<uint8_t[]> buf, size_t size) {
+        |                                              ^~~~~~~
+    ../git/include/perfetto/ext/tracing/core/slice.h:25:1: note: 'uint8_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+    24 | #include <string>
+    +++ |+#include <cstdint>
+
+  * See also: https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+  Some C++ Standard Library headers have been changed to no longer include
+  other headers that were being used internally by the library.
+
+Upstream-Status: Submitted [https://github.com/google/perfetto/pull/1214]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+Signed-off-by: markyang92 <pllpokko@alumni.kaist.ac.kr>
+---
+ include/perfetto/ext/tracing/core/slice.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/perfetto/ext/tracing/core/slice.h b/include/perfetto/ext/tracing/core/slice.h
+index cdabc39465..ebbc402d49 100644
+--- a/include/perfetto/ext/tracing/core/slice.h
++++ b/include/perfetto/ext/tracing/core/slice.h
+@@ -24,6 +24,7 @@
+ #include <memory>
+ #include <string>
+ #include <vector>
++#include <cstdint>
+ 
+ #include "perfetto/base/logging.h"
+ 

