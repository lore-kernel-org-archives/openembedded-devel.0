Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C00C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 08:23:19 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.8369.1743668590586950538
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 01:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.52, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 3 Apr 2025 17:23:08 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.101)
	by 156.147.1.127 with ESMTP; 3 Apr 2025 17:23:08 +0900
X-Original-SENDERIP: 10.185.60.101
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-oe][PATCH] thrift: Fix build with gcc-15
Date: Thu,  3 Apr 2025 17:23:06 +0900
Message-Id: <20250403082306.441179-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 08:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116536

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

Backport patch to fix issue: https://errors.yoctoproject.org/Errors/Details/850167/

TOPDIR/tmp/work/core2-64-oe-linux/thrift/0.21.0/thrift-0.21.0/lib/cpp/src/thrift/concurrency/Mutex.h:47:26: error: 'int64_t' has not been declared
   47 |   virtual bool timedlock(int64_t milliseconds) const;
      |                          ^~~~~~~
TOPDIR/tmp/work/core2-64-oe-linux/thrift/0.21.0/thrift-0.21.0/lib/cpp/src/thrift/concurrency/Mutex.h:25:1: note: 'int64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
   24 | #include <thrift/TNonCopyable.h>
  +++ |+#include <cstdint>

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 ...-missing-cstdint-include-for-int64_t.patch | 52 +++++++++++++++++++
 .../thrift/thrift_0.21.0.bb                   |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch b/meta-oe/recipes-connectivity/thrift/thrift/0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch
new file mode 100644
index 0000000000..e0bce16537
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch
@@ -0,0 +1,52 @@
+From 947ad66940cfbadd9b24ba31d892dfc1142dd330 Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Mon, 23 Dec 2024 12:33:22 +0900
+Subject: [PATCH] THRIFT-5842: Add missing cstdint include for int64_t in
+ Mutex.h
+
+Client: cpp
+
+GCC 15 (not released yet) requires `#include <cstdint>` for `int64_t`
+but `lib/cpp/src/thrift/concurrency/Mutex.h` doesn't have it. So we
+can't build Thrift with GCC 15:
+
+    [80/359] Building CXX object lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o
+    FAILED: lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o
+    /bin/g++-15 -DBOOST_ALL_DYN_LINK -DBOOST_TEST_DYN_LINK -DTHRIFT_STATIC_DEFINE -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -I/home/kou/work/cpp/thrift.kou.build/lib/cpp -I/home/kou/work/cpp/thrift.kou/lib/cpp -I/home/kou/work/cpp/thrift.kou.build -I/home/kou/work/cpp/thrift.kou/lib/cpp/src -g -std=c++11 -MD -MT lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o -MF lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o.d -o lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o -c /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp
+    In file included from /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/transport/TServerSocket.h:25,
+                     from /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/transport/TSSLServerSocket.h:23,
+                     from /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp:21:
+    /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/concurrency/Mutex.h:47:26: error: 'int64_t' has not been declared
+       47 |   virtual bool timedlock(int64_t milliseconds) const;
+          |                          ^~~~~~~
+    /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/concurrency/Mutex.h:25:1: note: 'int64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+       24 | #include <thrift/TNonCopyable.h>
+      +++ |+#include <cstdint>
+       25 |
+    /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/concurrency/Mutex.h:60:29: error: 'int64_t' has not been declared
+       60 |   Guard(const Mutex& value, int64_t timeout = 0) : mutex_(&value) {
+          |                             ^~~~~~~
+    /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/concurrency/Mutex.h:60:29: note: 'int64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+
+See also: https://github.com/apache/arrow/issues/45096
+
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/947ad66940cfbadd9b24ba31d892dfc1142dd330]
+---
+ lib/cpp/src/thrift/concurrency/Mutex.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/cpp/src/thrift/concurrency/Mutex.h b/lib/cpp/src/thrift/concurrency/Mutex.h
+index 1e5c3fba3..12f1729d6 100644
+--- a/lib/cpp/src/thrift/concurrency/Mutex.h
++++ b/lib/cpp/src/thrift/concurrency/Mutex.h
+@@ -20,6 +20,7 @@
+ #ifndef _THRIFT_CONCURRENCY_MUTEX_H_
+ #define _THRIFT_CONCURRENCY_MUTEX_H_ 1
+ 
++#include <cstdint>
+ #include <memory>
+ #include <thrift/TNonCopyable.h>
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb
index 35e55b2255..85e2e68694 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c40a383cb3f747e0c7abbf1482f194f0 \
 DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
-           file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch"
+           file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
+           file://0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch \
+           "
 SRC_URI[sha256sum] = "9a24f3eba9a4ca493602226c16d8c228037db3b9291c6fc4019bfe3bd39fc67c"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


