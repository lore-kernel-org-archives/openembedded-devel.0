Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D419C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 11:55:51 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.11516.1743681343181160890
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 04:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 3 Apr 2025 20:55:40 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.151 with ESMTP; 3 Apr 2025 20:55:40 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] cyusbserial: fix build with gcc-15
Date: Thu,  3 Apr 2025 20:55:39 +0900
Message-Id: <20250403115539.191034-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 11:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116541

From: "mark.yang" <mark.yang@lge.com>

* Fix incompatible pointer type error in signal function parameter
TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/git/tools/cyusbserialtest.c:101:22: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
  101 |     signal (SIGUSR1, deviceHotPlug);
      |                      ^~~~~~~~~~~~~
      |                      |
      |                      void (*)(void)
In file included from TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/git/tools/cyusbserialtest.c:25:
TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/git/tools/cyusbserialtest.c:83:6: note: 'deviceHotPlug' declared here
   83 | void deviceHotPlug () {
      |      ^~~~~~~~~~~~~
TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
   72 | typedef void (*__sighandler_t) (int);
      |                ^~~~~~~~~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...-15-incompatible-pointer-types-error.patch | 41 +++++++++++++++++++
 .../libcyusbserial/libcyusbserial_git.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-Fix-gcc-15-incompatible-pointer-types-error.patch

diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-Fix-gcc-15-incompatible-pointer-types-error.patch b/meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-Fix-gcc-15-incompatible-pointer-types-error.patch
new file mode 100644
index 0000000000..74ff091c94
--- /dev/null
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-Fix-gcc-15-incompatible-pointer-types-error.patch
@@ -0,0 +1,41 @@
+From 7b5318037b2a21a592e8a85c9724c1dc35078426 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 3 Apr 2025 20:42:03 +0900
+Subject: [PATCH] Fix gcc 15 incompatible-pointer-types error
+
+* Fix incompatible pointer type error in signal function parameter
+TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/git/tools/cyusbserialtest.c:101:22: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+  101 |     signal (SIGUSR1, deviceHotPlug);
+      |                      ^~~~~~~~~~~~~
+      |                      |
+      |                      void (*)(void)
+In file included from TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/git/tools/cyusbserialtest.c:25:
+TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
+   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
+      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
+TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/git/tools/cyusbserialtest.c:83:6: note: 'deviceHotPlug' declared here
+   83 | void deviceHotPlug () {
+      |      ^~~~~~~~~~~~~
+TOPDIR/tmp/work/core2-64-oe-linux/libcyusbserial/1.0.0+git/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/cyrozap/libcyusbserial/pull/7]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ tools/cyusbserialtest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/cyusbserialtest.c b/tools/cyusbserialtest.c
+index 9f21249..92e91a1 100644
+--- a/tools/cyusbserialtest.c
++++ b/tools/cyusbserialtest.c
+@@ -80,7 +80,7 @@ int getUserInput()
+     return output;
+ }
+ 
+-void deviceHotPlug () {
++void deviceHotPlug (int sig) {
+     CY_RETURN_STATUS rStatus;
+     deviceAddedRemoved = true;
+     selectedDeviceNum = -1;
diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
index dd7f457b10..32db913eff 100644
--- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
@@ -10,6 +10,7 @@ PV = "1.0.0+git"
 SRCREV = "655e2d544183d094f0e2d119c7e0c6206a0ddb3f"
 SRC_URI = "git://github.com/cyrozap/${BPN}.git;branch=master;protocol=https \
     file://0001-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch \
+    file://0001-Fix-gcc-15-incompatible-pointer-types-error.patch \
 "
 
 S = "${WORKDIR}/git"

