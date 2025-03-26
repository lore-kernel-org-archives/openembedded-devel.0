Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B885C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 07:34:27 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.16849.1742974457727903049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 00:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 26 Mar 2025 16:34:15 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.121 with ESMTP; 26 Mar 2025 16:34:15 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] cpulimit: fix build with gcc-15
Date: Wed, 26 Mar 2025 16:34:09 +0900
Message-Id: <20250326073409.3683022-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 07:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116289

From: "mark.yang" <mark.yang@lge.com>

* to fix: Error occurs in gcc 15.0.1 environment.
busy.c: In function 'main':
busy.c:20:58: error: passing argument 3 of 'pthread_create' from incompatible pointer type [-Wincompatible-pointer-types]
   20 |                 if ((ret = pthread_create(&thread, NULL, loop, NULL)) != 0)
      |                                                          ^~~~
      |                                                          |
      |                                                          void * (*)(void)
In file included from busy.c:3:
recipe-sysroot/usr/include/pthread.h:204:36: note: expected 'void * (*)(void *)' but argument is of type 'void * (*)(void)'
  204 |                            void *(*__start_routine) (void *),
      |                            ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
busy.c:6:7: note: 'loop' declared here
    6 | void *loop()
      |       ^~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...-Fix-incompatible-pointer-type-error.patch | 51 +++++++++++++++++++
 .../recipes-support/cpulimit/cpulimit_0.2.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit/0002-busy.c-Fix-incompatible-pointer-type-error.patch

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit/0002-busy.c-Fix-incompatible-pointer-type-error.patch b/meta-oe/recipes-support/cpulimit/cpulimit/0002-busy.c-Fix-incompatible-pointer-type-error.patch
new file mode 100644
index 0000000000..c75cbe1950
--- /dev/null
+++ b/meta-oe/recipes-support/cpulimit/cpulimit/0002-busy.c-Fix-incompatible-pointer-type-error.patch
@@ -0,0 +1,51 @@
+From 86b71c49a373f78920d78c0e88f530f476b4fe70 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 26 Mar 2025 15:57:54 +0900
+Subject: [PATCH] busy.c: Fix incompatible pointer type error.
+
+Error occurs in gcc 15.0.1 environment.
+busy.c: In function 'main':
+busy.c:20:58: error: passing argument 3 of 'pthread_create' from incompatible pointer type [-Wincompatible-pointer-types]
+   20 |                 if ((ret = pthread_create(&thread, NULL, loop, NULL)) != 0)
+      |                                                          ^~~~
+      |                                                          |
+      |                                                          void * (*)(void)
+In file included from busy.c:3:
+recipe-sysroot/usr/include/pthread.h:204:36: note: expected 'void * (*)(void *)' but argument is of type 'void * (*)(void)'
+  204 |                            void *(*__start_routine) (void *),
+      |                            ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
+busy.c:6:7: note: 'loop' declared here
+    6 | void *loop()
+      |       ^~~~
+
+Set loop parameter to void* since it requires void* type argument.
+
+Signed-off-by: mark.yang <mark.yang@lge.com>
+
+Upstream-Status: Inactive-Upstream [lastcommit: 9 Years ago and lastrelease: 9 Years ago]
+---
+ tests/busy.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/busy.c b/tests/busy.c
+index b3afb7c..2d726eb 100644
+--- a/tests/busy.c
++++ b/tests/busy.c
+@@ -3,7 +3,7 @@
+ #include <pthread.h>
+ #include <unistd.h>
+ 
+-void *loop()
++void *loop(void *arg)
+ {
+ 	while(1);
+ }
+@@ -23,7 +23,7 @@ int main(int argc, char **argv) {
+ 			exit(1);
+ 		}
+ 	}
+-	loop();
++	loop(NULL);
+ 	return 0;
+ }
+ 
\ No newline at end of file
diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
index f88d3b6ca1..ee2f91343e 100644
--- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -7,6 +7,7 @@ SRCREV ?= "f4d2682804931e7aea02a869137344bb5452a3cd"
 
 SRC_URI = "git://github.com/opsengine/cpulimit.git;protocol=https;branch=master \
            file://0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch \
+           file://0002-busy.c-Fix-incompatible-pointer-type-error.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


