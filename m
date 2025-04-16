Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCB5C369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:33:43 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.14949.1744796017810671947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 16 Apr 2025 18:33:34 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.151 with ESMTP; 16 Apr 2025 18:33:34 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-networking][PATCH] ssmtp: fix build error with gcc-15
Date: Wed, 16 Apr 2025 18:33:33 +0900
Message-Id: <20250416093333.3442943-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116902

From: "mark.yang" <mark.yang@lge.com>

* fix build error with gcc-15
../ssmtp-2.64/ssmtp.c:1454:31: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
 1454 |         (void)signal(SIGALRM, (void(*)())handler);      /* Catch SIGALRM */
      |                               ^~~~~~~~~~~~~~~~~~
      |                               |
      |                               void (*)(void)
In file included from TOPDIR/tmp/work/core2-64-oe-linux/ssmtp/2.64/recipe-sysroot/usr/include/sys/param.h:28,
                 from ../ssmtp-2.64/ssmtp.c:18:
TOPDIR/tmp/work/core2-64-oe-linux/ssmtp/2.64/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
../ssmtp-2.64/ssmtp.c:1393:6: note: 'handler' declared here
 1393 | void handler(void)
      |      ^~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...ible-pointer-types-error-with-gcc-15.patch | 47 +++++++++++++++++++
 .../recipes-support/ssmtp/ssmtp_2.64.bb       |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch b/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
new file mode 100644
index 0000000000..920c1cd2c5
--- /dev/null
+++ b/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
@@ -0,0 +1,47 @@
+From 7d3db0f63b9fa4a0deca486eccbe60c3cfa00750 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 16 Apr 2025 18:28:24 +0900
+Subject: [PATCH] Fix incompatible-pointer-types error with gcc 15
+
+../ssmtp-2.64/ssmtp.c:1454:31: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+ 1454 |         (void)signal(SIGALRM, (void(*)())handler);      /* Catch SIGALRM */
+      |                               ^~~~~~~~~~~~~~~~~~
+      |                               |
+      |                               void (*)(void)
+In file included from TOPDIR/tmp/work/core2-64-oe-linux/ssmtp/2.64/recipe-sysroot/usr/include/sys/param.h:28,
+                 from ../ssmtp-2.64/ssmtp.c:18:
+TOPDIR/tmp/work/core2-64-oe-linux/ssmtp/2.64/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
+   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
+      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
+../ssmtp-2.64/ssmtp.c:1393:6: note: 'handler' declared here
+ 1393 | void handler(void)
+      |      ^~~~~~~
+
+Upstream-Status: Inactive-Upstream [This package has been orphaned https://bugs.debian.org/925056]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ ssmtp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ssmtp.c b/ssmtp.c
+index 4dedaf8..a938d14 100644
+--- a/ssmtp.c
++++ b/ssmtp.c
+@@ -1390,7 +1390,7 @@ handler() -- A "normal" non-portable version of an alarm handler
+ 			like a socket. So we longjump instead, which is erronious on
+ 			a small number of machines and ill-defined in the language
+ */
+-void handler(void)
++void handler(__attribute__((unused)) int sig)
+ {
+ 	extern jmp_buf TimeoutJmpBuf;
+ 
+@@ -1451,7 +1451,7 @@ int ssmtp(char *argv[])
+ 	from = from_format(uad, override_from);
+ 
+ 	/* Now to the delivery of the message */
+-	(void)signal(SIGALRM, (void(*)())handler);	/* Catch SIGALRM */
++	(void)signal(SIGALRM, handler);	/* Catch SIGALRM */
+ 	(void)alarm((unsigned) MAXWAIT);			/* Set initial timer */
+ 	if(setjmp(TimeoutJmpBuf) != 0) {
+ 		/* Then the timer has gone off and we bail out */
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
index 499a79d1ed..8dc2d76477 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
@@ -9,6 +9,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
            file://use-DESTDIR.patch \
            file://0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch \
            file://0001-include-libgen.h-for-basename.patch \
+           file://0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch \
            "
 
 SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"

