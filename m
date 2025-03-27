Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C0EC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 07:59:17 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.44764.1743062347220191323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 00:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 27 Mar 2025 16:59:05 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.151 with ESMTP; 27 Mar 2025 16:59:05 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] daemonize: fix build with gcc-15
Date: Thu, 27 Mar 2025 16:59:03 +0900
Message-Id: <20250327075903.815947-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 07:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116317

From: "mark.yang" <mark.yang@lge.com>

* fix build with gcc-15.0.1
  submitted to upstream: https://github.com/bmc/daemonize/pull/37

  following error:
../git/getopt.c: In function 'x_getopt':
../git/getopt.c:51:16: error: too many arguments to function 'write'; expected 0, have 3
51 | (void) write(2, argv[0], (unsigned)strlen(argv[0]));
| ^~~~~ ~
../git/getopt.c:78:17: note: in expansion of macro 'ERR'
78 | ERR(": illegal option -- ", c);
| ^~~
../git/getopt.c:48:20: note: declared here
48 | extern int write();
| ^~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...-many-arguments-to-function-write-er.patch | 46 +++++++++++++++++++
 .../daemonize/daemonize_git.bb                |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch

diff --git a/meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch b/meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch
new file mode 100644
index 0000000000..3a79dba682
--- /dev/null
+++ b/meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch
@@ -0,0 +1,46 @@
+From c47fdcc0a900aea93b1967c20db42743171ab1ac Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 27 Mar 2025 16:46:42 +0900
+Subject: [PATCH] fix getopt.c too many arguments to function 'write' error in
+ gcc-15.0.1
+
+In the original code, write() was declared as 'extern int write();',
+which is interpreted as a function taking no parameters.
+This caused errors when actually calling it with 3 parameters.
+The current fix to declare it as 'extern int write(int, const void *, unsigned);'
+is the correct solution.
+This properly defines the write function to accept 3 parameters.
+
+../git/getopt.c: In function 'x_getopt':
+../git/getopt.c:51:16: error: too many arguments to function 'write'; expected 0, have 3
+   51 |         (void) write(2, argv[0], (unsigned)strlen(argv[0]));\
+      |                ^~~~~ ~
+../git/getopt.c:78:17: note: in expansion of macro 'ERR'
+   78 |                 ERR(": illegal option -- ", c);
+      |                 ^~~
+../git/getopt.c:48:20: note: declared here
+   48 |         extern int write();\
+      |                    ^~~~~
+      
+Upstream-Status: Submitted [https://github.com/bmc/daemonize/pull/37]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ getopt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/getopt.c b/getopt.c
+index 3f37c55..f298da7 100644
+--- a/getopt.c
++++ b/getopt.c
+@@ -45,7 +45,7 @@
+ #include <string.h>
+ 
+ #define ERR(s, c)	if(x_opterr){\
+-	extern int write();\
++	extern int write(int, const void *, unsigned);\
+ 	char errbuf[2];\
+ 	errbuf[0] = c; errbuf[1] = '\n';\
+ 	(void) write(2, argv[0], (unsigned)strlen(argv[0]));\
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
index f46dec59fc..b0712e521b 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -7,7 +7,9 @@ PV = "1.7.8"
 inherit autotools
 
 SRCREV = "18869a797dab12bf1c917ba3b4782fef484c407c"
-SRC_URI = "git://github.com/bmc/daemonize.git;branch=master;protocol=https \
+SRC_URI = " \
+    git://github.com/bmc/daemonize.git;branch=master;protocol=https \
+    file://0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


