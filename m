Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293A3C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 07:28:47 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.41364.1744010918688559569
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 00:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 7 Apr 2025 16:28:36 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.127 with ESMTP; 7 Apr 2025 16:28:36 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] rocksdb: fix build with gcc-13
Date: Mon,  7 Apr 2025 16:28:33 +0900
Message-Id: <20250407072833.735139-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 07:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116624

From: "mark.yang" <mark.yang@lge.com>

* From gcc 13, cstdint header must be explicitly included for uint_X data types.
* See also: https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...with-gcc-13-by-adding-cstdint-header.patch | 65 +++++++++++++++++++
 ...point.h-Add-missing-includes-cstdint.patch | 41 ++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb |  2 +
 3 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch
new file mode 100644
index 0000000000..168bd76ac7
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch
@@ -0,0 +1,65 @@
+From 90eba5458cb4ac2f83cac8aa550927876e6a9a09 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lauren=C8=9Biu=20Nicola?= <lnicola@dend.ro>
+Date: Wed, 5 Mar 2025 15:42:46 +0200
+Subject: [PATCH] Add missing include (#13365)
+
+* see more details: http://errors.yoctoproject.org/Errors/Details/851177/
+In file included from TOPDIR/tmp/work/core2-64-oe-linux/rocksdb/9.10.0/git/db/blob/blob_file_meta.cc:6:
+TOPDIR/tmp/work/core2-64-oe-linux/rocksdb/9.10.0/git/db/blob/blob_file_meta.h:28:7: error: 'uint64_t' has not been declared
+   28 |       uint64_t blob_file_number, uint64_t total_blob_count,
+      |       ^~~~~~~~
+TOPDIR/tmp/work/core2-64-oe-linux/rocksdb/9.10.0/git/db/blob/blob_file_meta.h:15:1: note: 'uint64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+   14 | #include "rocksdb/rocksdb_namespace.h"
+  +++ |+#include <cstdint>
+   15 |
+TOPDIR/tmp/work/core2-64-oe-linux/rocksdb/9.10.0/git/db/blob/blob_file_meta.h:28:34: error: 'uint64_t' has not been declared
+   28 |       uint64_t blob_file_number, uint64_t total_blob_count,
+      |                                  ^~~~~~~~
+...
+
+* See also: https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/13437]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ db/blob/blob_file_meta.h           | 1 +
+ include/rocksdb/trace_record.h     | 1 +
+ include/rocksdb/write_batch_base.h | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/db/blob/blob_file_meta.h b/db/blob/blob_file_meta.h
+index d7c8a1243..2e47726f8 100644
+--- a/db/blob/blob_file_meta.h
++++ b/db/blob/blob_file_meta.h
+@@ -6,6 +6,7 @@
+ #pragma once
+ 
+ #include <cassert>
++#include <cstdint>
+ #include <iosfwd>
+ #include <memory>
+ #include <string>
+diff --git a/include/rocksdb/trace_record.h b/include/rocksdb/trace_record.h
+index 8f9c3ee2f..d321f5387 100644
+--- a/include/rocksdb/trace_record.h
++++ b/include/rocksdb/trace_record.h
+@@ -5,6 +5,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <vector>
+diff --git a/include/rocksdb/write_batch_base.h b/include/rocksdb/write_batch_base.h
+index 3334a1292..43b186029 100644
+--- a/include/rocksdb/write_batch_base.h
++++ b/include/rocksdb/write_batch_base.h
+@@ -9,6 +9,7 @@
+ #pragma once
+ 
+ #include <cstddef>
++#include <cstdint>
+ 
+ #include "rocksdb/attribute_groups.h"
+ #include "rocksdb/rocksdb_namespace.h"
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch
new file mode 100644
index 0000000000..a872be5b54
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch
@@ -0,0 +1,41 @@
+From 31012cdfa435d9203da3c3de8127b66bf018692a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jan 2023 21:40:43 -0800
+Subject: [PATCH] checkpoint.h: Add missing includes <cstdint>
+
+It uses uint64_t and it comes from <cstdint>
+This is needed with GCC 13 and newer [1]
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+* build error:
+FAILED: CMakeFiles/checkpoint_test.dir/utilities/checkpoint/checkpoint_test.cc.o 
+In file included from rocksdb/9.10.0/git/utilities/checkpoint/checkpoint_test.cc:11:
+rocksdb/9.10.0/git/include/rocksdb/utilities/checkpoint.h:49:35: error: 'uint64_t' has not been declared
+   49 |                                   uint64_t log_size_for_flush = 0,
+      |                                   ^~~~~~~~
+rocksdb/9.10.0/git/include/rocksdb/utilities/checkpoint.h:14:1: note: 'uint64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+   13 | #include "rocksdb/status.h"
+  +++ |+#include <cstdint>
+   14 | 
+
+Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/11137]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ include/rocksdb/utilities/checkpoint.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: git/include/rocksdb/utilities/checkpoint.h
+===================================================================
+--- git.orig/include/rocksdb/utilities/checkpoint.h
++++ git/include/rocksdb/utilities/checkpoint.h
+@@ -7,6 +7,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
index 1e36d1fc4f..fefb6df8aa 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
@@ -20,6 +20,8 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
            file://static_library_as_option.patch \
            file://0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch \
            file://run-ptest \
+           file://0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch \
+           file://0001-checkpoint.h-Add-missing-includes-cstdint.patch \
           "
 
 SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"

