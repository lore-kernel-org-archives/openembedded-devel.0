Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F227C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 11:16:43 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web11.6128.1744197399850579441
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 04:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 9 Apr 2025 20:16:35 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.127 with ESMTP; 9 Apr 2025 20:16:35 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH v2] perfetto: fix error with gcc-15
Date: Wed,  9 Apr 2025 20:16:34 +0900
Message-Id: <20250409111634.2118891-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 11:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116735

From: "mark.yang" <mark.yang@lge.com>

  * Backport fix from:
    https://github.com/google/perfetto/commit/3953f56f98420e2ecb0e1c4542e20bfbb81da965
  * To fix the error with gcc-15.
  http://errors.yoctoproject.org/Errors/Details/851189/
    ../git/include/perfetto/ext/tracing/core/slice.h:47:46: error: 'uint8_t' was not declared in this scope
    47 |   static Slice TakeOwnership(std::unique_ptr<uint8_t[]> buf, size_t size) {
        |                                              ^~~~~~~
    ../git/include/perfetto/ext/tracing/core/slice.h:25:1: note: 'uint8_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
    24 | #include <string>
    +++ |+#include <cstdint>

Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2: Backported the patch
 meta-oe/recipes-devtools/perfetto/perfetto.bb |   1 +
 ...udes-for-the-build-with-use_libcxx_m.patch | 105 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto/0001-add-missing-includes-for-the-build-with-use_libcxx_m.patch

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 5a5d4de899..6b4e6372d3 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -28,6 +28,7 @@ SRC_URI:append = " \
            \
            file://0001-Remove-check_build_deps-build-steps.patch \
            file://0002-traced-fix-missing-include.patch \
+           file://0001-add-missing-includes-for-the-build-with-use_libcxx_m.patch \
            "
 
 SRCREV_bionic = "a0d0355105cb9d4a4b5384897448676133d7b8e2"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto/0001-add-missing-includes-for-the-build-with-use_libcxx_m.patch b/meta-oe/recipes-devtools/perfetto/perfetto/0001-add-missing-includes-for-the-build-with-use_libcxx_m.patch
new file mode 100644
index 0000000000..225810e511
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto/0001-add-missing-includes-for-the-build-with-use_libcxx_m.patch
@@ -0,0 +1,105 @@
+From 3953f56f98420e2ecb0e1c4542e20bfbb81da965 Mon Sep 17 00:00:00 2001
+From: Takuto Ikuta <tikuta@google.com>
+Date: Mon, 9 Dec 2024 18:45:36 +0900
+Subject: [PATCH] add missing includes for the build with use_libcxx_modules
+
+This is to fix build error when we set use_libcxx_modules=true in
+chromium build.
+
+Bug: 40440396
+Change-Id: I0cca5190c2c3551cc62bafafd12da9283e4afdd4
+
+Upstream-Status: Backport [3953f56 add missing includes for the build with use_libcxx_modules]
+- Removed some patches for files that do not exist in the current version v47.0
+
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+
+diff --git a/include/perfetto/base/flat_set.h b/include/perfetto/base/flat_set.h
+index 9390537b39..5be590ea6b 100644
+--- a/include/perfetto/base/flat_set.h
++++ b/include/perfetto/base/flat_set.h
+@@ -17,7 +17,10 @@
+ #ifndef INCLUDE_PERFETTO_BASE_FLAT_SET_H_
+ #define INCLUDE_PERFETTO_BASE_FLAT_SET_H_
+ 
++#include <stddef.h>
++
+ #include <algorithm>
++#include <utility>
+ #include <vector>
+ 
+ // A vector-based set::set-like container.
+diff --git a/include/perfetto/base/time.h b/include/perfetto/base/time.h
+index 6436503d20..8de7648267 100644
+--- a/include/perfetto/base/time.h
++++ b/include/perfetto/base/time.h
+@@ -17,6 +17,7 @@
+ #ifndef INCLUDE_PERFETTO_BASE_TIME_H_
+ #define INCLUDE_PERFETTO_BASE_TIME_H_
+ 
++#include <stdint.h>
+ #include <time.h>
+ 
+ #include <chrono>
+diff --git a/include/perfetto/ext/base/string_utils.h b/include/perfetto/ext/base/string_utils.h
+index c8264a2fb7..3b15e55771 100644
+--- a/include/perfetto/ext/base/string_utils.h
++++ b/include/perfetto/ext/base/string_utils.h
+@@ -24,6 +24,7 @@
+ #include <cinttypes>
+ #include <optional>
+ #include <string>
++#include <system_error>
+ #include <vector>
+ 
+ #include "perfetto/ext/base/string_view.h"
+diff --git a/include/perfetto/ext/base/subprocess.h b/include/perfetto/ext/base/subprocess.h
+index 12121e0284..4075169df1 100644
+--- a/include/perfetto/ext/base/subprocess.h
++++ b/include/perfetto/ext/base/subprocess.h
+@@ -20,6 +20,7 @@
+ #include <condition_variable>
+ #include <functional>
+ #include <initializer_list>
++#include <memory>
+ #include <mutex>
+ #include <optional>
+ #include <string>
+diff --git a/include/perfetto/ext/base/waitable_event.h b/include/perfetto/ext/base/waitable_event.h
+index 0e786196f8..a4b268a2f3 100644
+--- a/include/perfetto/ext/base/waitable_event.h
++++ b/include/perfetto/ext/base/waitable_event.h
+@@ -17,6 +17,8 @@
+ #ifndef INCLUDE_PERFETTO_EXT_BASE_WAITABLE_EVENT_H_
+ #define INCLUDE_PERFETTO_EXT_BASE_WAITABLE_EVENT_H_
+ 
++#include <stdint.h>
++
+ #include <condition_variable>
+ #include <mutex>
+ 
+diff --git a/include/perfetto/ext/tracing/core/slice.h b/include/perfetto/ext/tracing/core/slice.h
+index 063043bdc6..cdabc39465 100644
+--- a/include/perfetto/ext/tracing/core/slice.h
++++ b/include/perfetto/ext/tracing/core/slice.h
+@@ -18,6 +18,7 @@
+ #define INCLUDE_PERFETTO_EXT_TRACING_CORE_SLICE_H_
+ 
+ #include <stddef.h>
++#include <stdint.h>
+ #include <string.h>
+ 
+ #include <memory>
+diff --git a/src/trace_processor/util/trace_blob_view_reader.h b/src/trace_processor/util/trace_blob_view_reader.h
+index c39ffaba7c..6ffa7ff050 100644
+--- a/src/trace_processor/util/trace_blob_view_reader.h
++++ b/src/trace_processor/util/trace_blob_view_reader.h
+@@ -19,6 +19,7 @@
+ 
+ #include <cstddef>
+ #include <optional>
++#include <vector>
+ 
+ #include "perfetto/ext/base/circular_queue.h"
+ #include "perfetto/trace_processor/trace_blob_view.h"

