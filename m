Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27DCC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 08:21:39 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web11.8277.1743668492509232880
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 01:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.53, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 3 Apr 2025 17:21:30 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.101)
	by 156.147.1.121 with ESMTP; 3 Apr 2025 17:21:30 +0900
X-Original-SENDERIP: 10.185.60.101
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-filesystems][PATCH] udevil: Fix build with gcc-15
Date: Thu,  3 Apr 2025 17:21:20 +0900
Message-Id: <20250403082120.440618-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 08:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116534

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

Fix error related to "error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]".
Details in https://errors.yoctoproject.org/Errors/Details/850171/

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 .../udevil/files/Fix-build-with-gcc15.patch   | 68 +++++++++++++++++++
 .../recipes-utils/udevil/udevil_0.4.4.bb      |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/udevil/files/Fix-build-with-gcc15.patch

diff --git a/meta-filesystems/recipes-utils/udevil/files/Fix-build-with-gcc15.patch b/meta-filesystems/recipes-utils/udevil/files/Fix-build-with-gcc15.patch
new file mode 100644
index 0000000000..bad23327bf
--- /dev/null
+++ b/meta-filesystems/recipes-utils/udevil/files/Fix-build-with-gcc15.patch
@@ -0,0 +1,68 @@
+Fix build with gcc-15
+
+Fix the following errors:
+../../udevil-0.4.4/src/udevil.c: In function 'command_monitor':
+../../udevil-0.4.4/src/udevil.c:4891:21: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+ 4891 |     signal(SIGTERM, command_monitor_finalize );
+      |                     ^~~~~~~~~~~~~~~~~~~~~~~~
+      |                     |
+      |                     void (*)(void)
+In file included from /home/worker/nano-ai/build-nano-ai/BUILD/work/qcs8550_aihub-webos-linux/udevil/0.4.4/recipe-sysroot/usr/include/sys/wait.h:36,
+                 from ../../udevil-0.4.4/src/udevil.c:10:
+/home/worker/nano-ai/build-nano-ai/BUILD/work/qcs8550_aihub-webos-linux/udevil/0.4.4/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
+   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
+      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
+../../udevil-0.4.4/src/udevil.c:4798:6: note: 'command_monitor_finalize' declared here
+ 4798 | void command_monitor_finalize()
+      |      ^~~~~~~~~~~~~~~~~~~~~~~~
+/home/worker/nano-ai/build-nano-ai/BUILD/work/qcs8550_aihub-webos-linux/udevil/0.4.4/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+...
+../../udevil-0.4.4/src/udevil.c: In function 'main':
+../../udevil-0.4.4/src/udevil.c:5035:22: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+ 5035 |     signal( SIGTERM, command_interrupt );
+      |                      ^~~~~~~~~~~~~~~~~
+      |                      |
+      |                      void (*)(void)
+/home/worker/nano-ai/build-nano-ai/BUILD/work/qcs8550_aihub-webos-linux/udevil/0.4.4/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
+   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
+      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
+../../udevil-0.4.4/src/udevil.c:4916:6: note: 'command_interrupt' declared here
+ 4916 | void command_interrupt()
+      |      ^~~~~~~~~~~~~~~~~
+/home/worker/nano-ai/build-nano-ai/BUILD/work/qcs8550_aihub-webos-linux/udevil/0.4.4/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+../../udevil-0.4.4/src/udevil.c:5036:22: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+ 5036 |     signal( SIGINT,  command_interrupt );
+      |                      ^~~~~~~~~~~~~~~~~
+      |                      |
+      |                      void (*)(void)
+
+Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
+
+Upstream-Status: Inactive-Upstream [lastrelease: 10years ago]
+---
+diff --git a/src/udevil.c b/src/udevil.c
+index bab80e9..da629d9 100644
+--- a/src/udevil.c
++++ b/src/udevil.c
+@@ -4795,7 +4795,7 @@ static int command_info( CommandData* data )
+     return ret;
+ }
+ 
+-void command_monitor_finalize()
++void command_monitor_finalize(int)
+ {
+     //if (signal == SIGINT || signal == SIGTERM)
+     //printf( "\nudevil: SIGINT || SIGTERM\n");
+@@ -4913,7 +4913,7 @@ finish_:
+     return 1;
+ }
+ 
+-void command_interrupt()
++void command_interrupt(int)
+ {
+     if ( udev )
+     {
diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
index 20d6036686..c745485a64 100644
--- a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
+++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
@@ -16,6 +16,7 @@ inherit autotools pkgconfig systemd
 SRC_URI = "https://github.com/IgnorantGuru/udevil/raw/pkg/${PV}/udevil-${PV}.tar.xz \
     file://0001-udevil-0.4.3-fix-compile-with-gcc6.patch \
     file://0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch \
+    file://Fix-build-with-gcc15.patch \
 "
 
 SRC_URI[md5sum] = "dc1c489b603a0500a04dc7e1805ac1d9"
-- 
2.34.1


