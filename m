Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFCFC71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.78436.1749526427996707314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m5Xg1UW6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526441; x=1781062441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q6tW67u/JW4zwR0nY55J4fqhrEinVrdu2T+5E3ydEXw=;
  b=m5Xg1UW6ZblpTAM45hUWvT8QdI/7RdHWH5lKqhPX93OyBBnbf2at1iXv
   UjVMFSjPuhKy6nyq1e6iQ+9TewB+jKQ9XzKotomkmLifVUobBn0sxvdcu
   zzzI+5c+K5ne7gpHFKezw4xQI8iBPEbFzv39MFMGdoztpRvVSqHh+w41X
   V95evYC0SvyeoMbRzNENU4B1AJR91YycrpXiQaxeD0/XZzA/8KnStEyZv
   IsgJnY3MBaHrbR6QMxO+NkxqzpRFXQnb7ZPMZhVXx0OpTGz8xFgykclno
   zarcEfnhvOLUwL+BW2m3wU1H4cemtEkuhJKB4g+BUqQhcEpNY8BYd1Nad
   g==;
X-CSE-ConnectionGUID: u44CTbFoRBCizZWtW28ePg==
X-CSE-MsgGUID: HrY66QM5T1OnvUbl5IDRkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202680500"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202680500"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DEAAD8033
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 47599BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:57 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7682A1A009A;
	Tue, 10 Jun 2025 11:33:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 61/64] thrift: upgrade 0.21.0 -> 0.22.0
Date: Tue, 10 Jun 2025 11:33:27 +0800
Message-ID: <20250610033330.924-61-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117853

From: Wang Mingyu <wangmy@fujitsu.com>

0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch
removed since it's included in 0.22.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-missing-cstdint-include-for-int64_t.patch | 52 -------------------
 .../{thrift_0.21.0.bb => thrift_0.22.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.21.0.bb => thrift_0.22.0.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch b/meta-oe/recipes-connectivity/thrift/thrift/0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch
deleted file mode 100644
index e0bce16537..0000000000
--- a/meta-oe/recipes-connectivity/thrift/thrift/0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 947ad66940cfbadd9b24ba31d892dfc1142dd330 Mon Sep 17 00:00:00 2001
-From: Sutou Kouhei <kou@clear-code.com>
-Date: Mon, 23 Dec 2024 12:33:22 +0900
-Subject: [PATCH] THRIFT-5842: Add missing cstdint include for int64_t in
- Mutex.h
-
-Client: cpp
-
-GCC 15 (not released yet) requires `#include <cstdint>` for `int64_t`
-but `lib/cpp/src/thrift/concurrency/Mutex.h` doesn't have it. So we
-can't build Thrift with GCC 15:
-
-    [80/359] Building CXX object lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o
-    FAILED: lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o
-    /bin/g++-15 -DBOOST_ALL_DYN_LINK -DBOOST_TEST_DYN_LINK -DTHRIFT_STATIC_DEFINE -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -I/home/kou/work/cpp/thrift.kou.build/lib/cpp -I/home/kou/work/cpp/thrift.kou/lib/cpp -I/home/kou/work/cpp/thrift.kou.build -I/home/kou/work/cpp/thrift.kou/lib/cpp/src -g -std=c++11 -MD -MT lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o -MF lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o.d -o lib/cpp/CMakeFiles/thrift.dir/src/thrift/transport/TSSLServerSocket.cpp.o -c /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp
-    In file included from /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/transport/TServerSocket.h:25,
-                     from /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/transport/TSSLServerSocket.h:23,
-                     from /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp:21:
-    /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/concurrency/Mutex.h:47:26: error: 'int64_t' has not been declared
-       47 |   virtual bool timedlock(int64_t milliseconds) const;
-          |                          ^~~~~~~
-    /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/concurrency/Mutex.h:25:1: note: 'int64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
-       24 | #include <thrift/TNonCopyable.h>
-      +++ |+#include <cstdint>
-       25 |
-    /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/concurrency/Mutex.h:60:29: error: 'int64_t' has not been declared
-       60 |   Guard(const Mutex& value, int64_t timeout = 0) : mutex_(&value) {
-          |                             ^~~~~~~
-    /home/kou/work/cpp/thrift.kou/lib/cpp/src/thrift/concurrency/Mutex.h:60:29: note: 'int64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
-
-See also: https://github.com/apache/arrow/issues/45096
-
-Upstream-Status: Backport [https://github.com/apache/thrift/commit/947ad66940cfbadd9b24ba31d892dfc1142dd330]
----
- lib/cpp/src/thrift/concurrency/Mutex.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/cpp/src/thrift/concurrency/Mutex.h b/lib/cpp/src/thrift/concurrency/Mutex.h
-index 1e5c3fba3..12f1729d6 100644
---- a/lib/cpp/src/thrift/concurrency/Mutex.h
-+++ b/lib/cpp/src/thrift/concurrency/Mutex.h
-@@ -20,6 +20,7 @@
- #ifndef _THRIFT_CONCURRENCY_MUTEX_H_
- #define _THRIFT_CONCURRENCY_MUTEX_H_ 1
- 
-+#include <cstdint>
- #include <memory>
- #include <thrift/TNonCopyable.h>
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
index 85e2e68694..9c50317eff 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.21.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -10,9 +10,8 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
-           file://0002-THRIFT-5842-Add-missing-cstdint-include-for-int64_t.patch \
            "
-SRC_URI[sha256sum] = "9a24f3eba9a4ca493602226c16d8c228037db3b9291c6fc4019bfe3bd39fc67c"
+SRC_URI[sha256sum] = "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


