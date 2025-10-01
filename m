Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B456ACAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:50:07 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.18406.1759326605601376612
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=aRS/Q5me;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20251001135003d26155fbb600020727-c1y0pd@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251001135003d26155fbb600020727
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 01 Oct 2025 15:50:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=GDCM9epH5SLkk5JWISXXFFtfn/PBgYoqvf6menbCom8=;
 b=aRS/Q5meDxkWNT+eVMMqCyG+PgN3NDXpn4xVUPt7zLL6wA+LCXQTn9PCs8vO8jyaVDT1Pv
 JxQkf7DUjAsuSEJWQXc5UoBFNPcXcWiGdJvojQ4+8nDzXZn4TFnUpvhsWDUZt/I+IqXX4A/H
 dvwPrhcwGQo72lshGlrQKvhar2mbIdeb3XmTyborMU+TYDszhfO/H8YNv9T/idKoxPMaBeo2
 xXY322T3q565/3m7sXettlHBGcw+4p+C4mTGMBNz+fVyhp16c65MVwvpTv8EseF6iMeLDPar
 OdCkIgUuT/n0zhr1QvQIh3WDMHCoEKcZ4BLhe0kHLyffMRI5ogVx2lng==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] thrift: fix build with gcc 15
Date: Wed,  1 Oct 2025 15:49:50 +0200
Message-ID: <20251001134950.152847-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120114

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Cherry-pick a patch adding missing cstdint include for int64_t in
Mutex.h

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...missing-cstdint-include-for-int64_t-.patch | 51 +++++++++++++++++++
 .../thrift/thrift_0.20.0.bb                   |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t-.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t-.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t-.patch
new file mode 100644
index 0000000000..c5a56338a3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t-.patch
@@ -0,0 +1,51 @@
+From 949cf4dc8973b39138cf89ce817b714d3bcce6eb Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/apache/thrift/pull/3078]
+
+Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
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
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
index 14b98e6717..e4fd07198c 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -11,7 +11,8 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 SRC_URI = "https://archive.apache.org/dist/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
            file://0001-thrift-pr2755.patch \
-"
+           file://0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t-.patch \
+           "
 SRC_URI[sha256sum] = "b5d8311a779470e1502c027f428a1db542f5c051c8e1280ccd2163fa935ff2d6"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.51.0


