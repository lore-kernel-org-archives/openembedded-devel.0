Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0031C36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 10:53:11 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.15948.1743504783708713018
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 03:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 1 Apr 2025 19:53:01 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.151 with ESMTP; 1 Apr 2025 19:53:01 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] sqlite-orm: fix build with gcc-15.0.1
Date: Tue,  1 Apr 2025 19:52:58 +0900
Message-Id: <20250401105258.1631515-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 10:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116471

From: "mark.yang" <mark.yang@lge.com>

* see more details:
  http://errors.yoctoproject.org/Errors/Details/850148/
    TOPDIR/tmp/work/core2-64-oe-linux/sqlite-orm/1.5/git/examples/synchronous.cpp:7:5: error: 'uint16_t' does not name a type
        7 |     uint16_t src_port;
        |     ^~~~~~~~
    TOPDIR/tmp/work/core2-64-oe-linux/sqlite-orm/1.5/git/examples/synchronous.cpp:3:1: note: 'uint16_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
        2 | #include <sqlite_orm/sqlite_orm.h>
    +++ |+#include <cstdint>
        3 | #include <string>

While this was backported from 6a96d1cec4(Explicitly included <cstdint> in examples and unit tests),
since it was a commit made in v1.9, only synchronous.cpp was modified as other files do not exist in the current version.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...01-fix-cstdint-error-with-gcc-15.0.1.patch | 52 +++++++++++++++++++
 .../sqlite-orm/sqlite-orm_1.5.bb              |  5 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/sqlite-orm/sqlite-orm/0001-fix-cstdint-error-with-gcc-15.0.1.patch

diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm/0001-fix-cstdint-error-with-gcc-15.0.1.patch b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm/0001-fix-cstdint-error-with-gcc-15.0.1.patch
new file mode 100644
index 0000000000..af884808f2
--- /dev/null
+++ b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm/0001-fix-cstdint-error-with-gcc-15.0.1.patch
@@ -0,0 +1,52 @@
+From f011501e719e0042fc6ca29ac7b33e8a14562246 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 1 Apr 2025 19:45:01 +0900
+Subject: [PATCH] fix cstdint error with gcc-15.0.1
+
+* see more details:
+  http://errors.yoctoproject.org/Errors/Details/850148/
+    TOPDIR/tmp/work/core2-64-oe-linux/sqlite-orm/1.5/git/examples/synchronous.cpp:7:5: error: 'uint16_t' does not name a type
+        7 |     uint16_t src_port;
+        |     ^~~~~~~~
+    TOPDIR/tmp/work/core2-64-oe-linux/sqlite-orm/1.5/git/examples/synchronous.cpp:3:1: note: 'uint16_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+        2 | #include <sqlite_orm/sqlite_orm.h>
+    +++ |+#include <cstdint>
+        3 | #include <string>
+
+While this was backported from 6a96d1cec4(Explicitly included <cstdint> in examples and unit tests),
+since it was a commit made in v1.9, only synchronous.cpp was modified as other files do not exist in the current version.
+
+Signed-off-by: mark.yang <mark.yang@lge.com>
+
+Upstream-Status: Backport [6a96d1c Explicitly included <cstdint> in examples and unit tests]
+---
+ examples/synchronous.cpp | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/examples/synchronous.cpp b/examples/synchronous.cpp
+index d10da13d..b103b48c 100644
+--- a/examples/synchronous.cpp
++++ b/examples/synchronous.cpp
+@@ -1,15 +1,16 @@
+ 
+ #include <sqlite_orm/sqlite_orm.h>
++#include <cstdint>
+ #include <string>
+ 
+ struct Query {
+     std::string src_ip;
+-    uint16_t src_port;
+-    uint16_t txn_id;
+-    uint32_t tv_sec;
+-    uint32_t tv_usec;
++    std::uint16_t src_port;
++    std::uint16_t txn_id;
++    std::uint32_t tv_sec;
++    std::uint32_t tv_usec;
+     std::string name;
+-    uint16_t type;
++    std::uint16_t type;
+ };
+ 
+ int main(int, char **) {
+
diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
index db90bc589e..17c24d5abf 100644
--- a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
+++ b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
@@ -8,7 +8,10 @@ inherit cmake
 DEPENDS += "sqlite3"
 
 SRCREV = "e8a9e9416f421303f4b8970caab26dadf8bae98b"
-SRC_URI = "git://github.com/fnc12/sqlite_orm;protocol=https;branch=master"
+SRC_URI = " \
+    git://github.com/fnc12/sqlite_orm;protocol=https;branch=master \
+    file://0001-fix-cstdint-error-with-gcc-15.0.1.patch \
+"
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE += "-DSqliteOrm_BuildTests=OFF -DLIB_INSTALL_DIR=${libdir} \
-- 
2.34.1


