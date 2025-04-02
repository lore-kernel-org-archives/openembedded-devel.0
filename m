Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C8FC36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 02:16:11 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.4082.1743560165490968380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 19:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 2 Apr 2025 11:16:02 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.125 with ESMTP; 2 Apr 2025 11:16:02 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] xmlrpc-c: fix build with gcc-15.0.1
Date: Wed,  2 Apr 2025 11:16:00 +0900
Message-Id: <20250402021600.4164452-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 02:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116490

From: "mark.yang" <mark.yang@lge.com>

* Fix build error with gcc-15.0.1
  http://errors.yoctoproject.org/Errors/Details/850147/
    srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'false' as enumeration constant
    13 |     false = 0,
        |     ^~~~~
    srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with '-std=c23' onwards
    srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier or '(' before 'bool'
    15 | } bool;
        |   ^~~~
    srcdir/lib/util/include/bool.h:15:3: warning: useless type name in empty declaration
    In file included from sleep.c:2:
    srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'false' as enumeration constant
    13 |     false = 0,
        |     ^~~~~
    srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with '-std=c23' onwards
    srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier or '(' before 'bool'
    15 | } bool;
        |   ^~~~

  gcc-15 switched to -std=c23 by default.
  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...x-bool-reserved-word-error-in-gcc-15.patch | 50 +++++++++++++++++++
 .../xmlrpc-c/xmlrpc-c_1.64.0.bb               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-bool-reserved-word-error-in-gcc-15.patch

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-bool-reserved-word-error-in-gcc-15.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-bool-reserved-word-error-in-gcc-15.patch
new file mode 100644
index 0000000000..3761a68745
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-bool-reserved-word-error-in-gcc-15.patch
@@ -0,0 +1,50 @@
+From a811ea6af5296b89ee7c2a358dd4ffd2584429f4 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 2 Apr 2025 11:00:27 +0900
+Subject: [PATCH] fix bool reserved word error in gcc 15
+
+* Fix build error with gcc-15.0.1
+  http://errors.yoctoproject.org/Errors/Details/850147/
+    srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'false' as enumeration constant
+    13 |     false = 0,
+        |     ^~~~~
+    srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with '-std=c23' onwards
+    srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier or '(' before 'bool'
+    15 | } bool;
+        |   ^~~~
+    srcdir/lib/util/include/bool.h:15:3: warning: useless type name in empty declaration
+    In file included from sleep.c:2:
+    srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'false' as enumeration constant
+    13 |     false = 0,
+        |     ^~~~~
+    srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with '-std=c23' onwards
+    srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier or '(' before 'bool'
+    15 | } bool;
+        |   ^~~~
+
+  gcc-15 switched to -std=c23 by default.
+  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+Upstream-Status: Submitted [https://github.com/mirror/xmlrpc-c/pull/4]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ stable/lib/util/include/bool.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/stable/lib/util/include/bool.h b/stable/lib/util/include/bool.h
+index 312477c4..a5e81eb6 100644
+--- a/stable/lib/util/include/bool.h
++++ b/stable/lib/util/include/bool.h
+@@ -9,10 +9,12 @@
+ /* At least the GNU compiler defines __bool_true_false_are_defined */
+ #ifndef __bool_true_false_are_defined
+ #define __bool_true_false_are_defined
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef enum {
+     false = 0,
+     true = 1
+ } bool;
+ #endif
+ #endif
++#endif
+ 
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
index 62ba0f53e6..298c84bb2c 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://no-automake.patch \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
            file://0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch \
+           file://0001-fix-bool-reserved-word-error-in-gcc-15.patch;striplevel=2 \
            "
 # one more commit after Release 1.64.0 in the Stable series
 SRCREV = "8ce36bce2438df9b02fcaafd19efa90a56426601"

