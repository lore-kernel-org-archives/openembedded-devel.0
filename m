Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.3456.1585100584041451872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 18:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,302,1580745600"; 
   d="scan'208";a="87205962"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 09:43:05 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id CC221406AB15
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 09:32:53 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 09:43:03 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 25 Mar 2020 09:43:12 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] avro-c: upgrade 1.9.1 -> 1.9.2
Date: Tue, 24 Mar 2020 23:47:15 -0700
Message-ID: <1585118838-33916-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: CC221406AB15.AC435
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
removed since it is included in 1.9.2

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-C-to-be-built-on-musl-based-systems.patch | 42 -------------------
 .../avro/{avro-c_1.9.1.bb => avro-c_1.9.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
 rename meta-oe/recipes-support/avro/{avro-c_1.9.1.bb => avro-c_1.9.2.bb} (76%)

diff --git a/meta-oe/recipes-support/avro/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch b/meta-oe/recipes-support/avro/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
deleted file mode 100644
index 8964d6b72..000000000
--- a/meta-oe/recipes-support/avro/avro-c/0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9b39a985bcd6cd34f0820f3680f145d46c0e56bd Mon Sep 17 00:00:00 2001
-From: Titouan Christophe <titouan.christophe@railnova.eu>
-Date: Sun, 8 Dec 2019 01:55:59 +0100
-Subject: [PATCH] Allow avro C to be built on musl based systems.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The type `ssize_t` is defined in sys/types.h, and nowhere else
-in the musl standard C library, so it should be included for the
-compilation to succeed.
-
-This fixes several errors like:
-
-    In file included from src/generic.c:29:0:
-    src/generic.c: In function ‘avro_generic_value_new’:
-    src/avro_generic_internal.h:63:39:
-        error: ‘ssize_t’ undeclared (first use in this function);
-               did you mean ‘size_t’?
-
-Upstream-Status: Backport
-Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
----
- lang/c/src/avro_generic_internal.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lang/c/src/avro_generic_internal.h b/lang/c/src/avro_generic_internal.h
-index 709403c03..9843ed652 100644
---- a/lang/c/src/avro_generic_internal.h
-+++ b/lang/c/src/avro_generic_internal.h
-@@ -24,6 +24,8 @@ extern "C" {
- #define CLOSE_EXTERN
- #endif
- 
-+#include <sys/types.h>
-+
- #include "avro/generic.h"
- #include "avro/schema.h"
- #include "avro/value.h"
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-support/avro/avro-c_1.9.1.bb b/meta-oe/recipes-support/avro/avro-c_1.9.2.bb
similarity index 76%
rename from meta-oe/recipes-support/avro/avro-c_1.9.1.bb
rename to meta-oe/recipes-support/avro/avro-c_1.9.2.bb
index 8954c9802..0642179fb 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.9.2.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"
 
 BRANCH = "branch-1.9"
-SRCREV = "89218262cde62e98fcb3778b86cd3f03056c54f3"
+SRCREV = "bf20128ca6138a830b2ea13e0490f3df6b035639"
 SRC_URI = "git://github.com/apache/avro;branch=${BRANCH} \
-           file://0001-Allow-avro-C-to-be-built-on-musl-based-systems.patch;patchdir=../../ \
            file://0001-cmake-Use-GNUInstallDirs-instead-of-hard-coded-paths.patch;patchdir=../../ \
           "
 
-- 
2.17.1



