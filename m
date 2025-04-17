Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5B6C369BD
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 01:53:58 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.36053.1744854827140171170
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 18:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 17 Apr 2025 10:53:44 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.151 with ESMTP; 17 Apr 2025 10:53:44 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-networking][PATCH] netcat-openbsd: fix build error with gcc-15
Date: Thu, 17 Apr 2025 10:53:43 +0900
Message-Id: <20250417015343.34122-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 01:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116916

From: "mark.yang" <mark.yang@lge.com>

* submit fix:
  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1097448
  to fix:
    netcat.c:1443:41: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
    1443 |                         signal(SIGALRM, quit);
        |                                         ^~~~
        |                                         |
        |                                         void (*)(void)
    In file included from netcat.c:100:
    TOPDIR/tmp/work/core2-64-oe-linux/netcat-openbsd/1.195/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
    88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
        |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
    netcat.c:241:13: note: 'quit' declared here
    241 | static void quit();
        |             ^~~~
    TOPDIR/tmp/work/core2-64-oe-linux/netcat-openbsd/1.195/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
    72 | typedef void (*__sighandler_t) (int);
        |                ^~~~~~~~~~~~~~
    make: *** [Makefile:17: netcat.o] Error 1

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...fix-netcat-openbsd-ftbfs-with-GCC-15.patch | 51 +++++++++++++++++++
 .../netcat/netcat-openbsd_1.195.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch
new file mode 100644
index 0000000000..c1757d39ad
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch
@@ -0,0 +1,51 @@
+From 4ca437b129252635e89694446945e69912300ceb Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 16 Apr 2025 20:35:46 +0900
+Subject: [PATCH] fix netcat-openbsd: ftbfs with GCC-15
+
+* fix build failure with GCC-15
+netcat.c:1443:41: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+ 1443 |                         signal(SIGALRM, quit);
+      |                                         ^~~~
+      |                                         |
+      |                                         void (*)(void)
+In file included from netcat.c:100:
+TOPDIR/tmp/work/core2-64-oe-linux/netcat-openbsd/1.195/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
+   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
+      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
+netcat.c:241:13: note: 'quit' declared here
+  241 | static void quit();
+      |             ^~~~
+TOPDIR/tmp/work/core2-64-oe-linux/netcat-openbsd/1.195/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+make: *** [Makefile:17: netcat.o] Error 1
+
+Upstream-Status: Submitted [https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1097448]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ netcat.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/netcat.c b/netcat.c
+index d70598a..b8ba959 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -238,7 +238,7 @@ char *proto_name(int uflag, int dccpflag);
+ static int connect_with_timeout(int fd, const struct sockaddr *sa,
+         socklen_t salen, int ctimeout);
+ 
+-static void quit();
++static void quit(int sig);
+ 
+ int    b64_ntop(u_char const *src, size_t srclength, char *target, size_t targsize);
+ int    b64_pton(char const *src, u_char *target, size_t targsize);
+@@ -2235,7 +2235,7 @@ usage(int ret)
+  * quit()
+  * handler for a "-q" timeout (exit 0 instead of 1)
+  */
+-static void quit()
++static void quit(__attribute__((unused)) int sig)
+ {
+ 	exit(0);
+ }
diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
index 20ad43a4d5..99ae90aa91 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.195.bb
@@ -10,6 +10,7 @@ do_patch[depends] = "quilt-native:do_populate_sysroot"
 SRC_URI = "http://snapshot.debian.org/archive/debian/20181022T085404Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
            http://snapshot.debian.org/archive/debian/20181022T085404Z/pool/main/n/netcat-openbsd/netcat-openbsd_${PV}-1.debian.tar.xz;name=netcat-patch;subdir=${BP} \
            file://0001-bundle-own-base64-encode-decode-functions.patch \
+           file://0001-fix-netcat-openbsd-ftbfs-with-GCC-15.patch \
            "
 
 SRC_URI[netcat.md5sum] = "219d5e49c45658e229a3bda63063a986"

