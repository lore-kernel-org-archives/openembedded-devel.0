Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A990EC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 08:56:38 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.3454.1743584194553523170
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 01:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 2 Apr 2025 17:56:32 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.127 with ESMTP; 2 Apr 2025 17:56:32 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] pm-qa: fix build with gcc-15.0.1
Date: Wed,  2 Apr 2025 17:56:30 +0900
Message-Id: <20250402085630.1837417-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 08:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116515

From: "mark.yang" <mark.yang@lge.com>

* fix following error:
  http://errors.yoctoproject.org/Errors/Details/850314
    utils/uevent_reader.c: In function 'main':
    utils/uevent_reader.c:33:24: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
    33 |         signal(SIGINT, exit_handler);
        |                        ^~~~~~~~~~~~
        |                        |
        |                        void (*)(void)
    In file included from utils/uevent_reader.c:4:
    TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
    88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
        |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
    utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
    15 | void exit_handler()
        |      ^~~~~~~~~~~~
    TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
    72 | typedef void (*__sighandler_t) (int);
        |                ^~~~~~~~~~~~~~
    make: *** [<builtin>: utils/uevent_reader] Error 1

  Set PATCHTOOL to git because this recipe compiles all .c files including those in .pc/ directory which causes build errors.
  .pc/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch/utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
   15 | void exit_handler()

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...cc-15-Wincompatible-pointer-types-er.patch | 69 +++++++++++++++++++
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb       |  7 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch b/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch
new file mode 100644
index 0000000000..7efd8dd71a
--- /dev/null
+++ b/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch
@@ -0,0 +1,69 @@
+From b6b968d1c8fbba79b33d63874b551225e663435e Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 2 Apr 2025 16:59:00 +0900
+Subject: [PATCH] fix build with gcc-15 -Wincompatible-pointer-types error
+
+See more details: http://errors.yoctoproject.org/Errors/Details/850314
+utils/uevent_reader.c:33:24: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+   33 |         signal(SIGINT, exit_handler);
+      |                        ^~~~~~~~~~~~
+      |                        |
+      |                        void (*)(void)
+In file included from utils/uevent_reader.c:4:
+TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
+   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
+      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
+utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
+   15 | void exit_handler()
+      |      ^~~~~~~~~~~~
+TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+
+* Set the parameter of exit_handler() to int.
+  Changed to use exit_handler(0).
+  The parameter is not used inside exit_handler() anyway.
+
+Upstream-Status: Inactive-Upstream [lastrelease: 6 years ago]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ utils/uevent_reader.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/utils/uevent_reader.c b/utils/uevent_reader.c
+index afbb426..75d445c 100644
+--- a/utils/uevent_reader.c
++++ b/utils/uevent_reader.c
+@@ -12,7 +12,7 @@
+ 
+ FILE *fp;
+ 
+-void exit_handler()
++void exit_handler(int sig)
+ {
+ 	fprintf(stdout, "exiting from uevent reader...\n");
+ 	fclose(fp);
+@@ -42,20 +42,20 @@ int main(int argc, char *argv[])
+ 	pfd.fd = socket(PF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);
+ 	if (pfd.fd == -1) {
+ 		perror("error: socket()");
+-		exit_handler();
++		exit_handler(0);
+ 	}
+ 
+ 	if (bind(pfd.fd, (struct sockaddr *) &nls,
+ 				sizeof(struct sockaddr_nl))) {
+ 		perror("error : bind()");
+-		exit_handler();
++		exit_handler(0);
+ 	}
+ 
+ 	while (-1 != poll(&pfd, 1, -1)) {
+ 		int i, len = recv(pfd.fd, buf, sizeof(buf), MSG_DONTWAIT);
+ 		if (len == -1) {
+ 			perror("error : recv()");
+-			exit_handler();
++			exit_handler(0);
+ 		}
+ 
+ 		i = 0;
diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index b108218297..482e5694f6 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -10,12 +10,17 @@ BRANCH ?= "master"
 
 SRCREV = "05710ec5032be4c8edafb4109d4d908d31243906"
 
-SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
+SRC_URI = " \
+    git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH} \
+    file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch \
+"
 
 S = "${WORKDIR}/git"
 
 CFLAGS += "-pthread"
 
+PATCHTOOL = "git"
+
 do_compile () {
     # Find all the .c files in this project and build them.
     for x in `find . -name "*.c"`

