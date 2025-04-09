Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C610C369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 11:29:23 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.6325.1744198153379662536
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 04:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 9 Apr 2025 20:29:10 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.127 with ESMTP; 9 Apr 2025 20:29:10 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] paho-mqtt-c: fix error with gcc-15
Date: Wed,  9 Apr 2025 20:29:09 +0900
Message-Id: <20250409112909.2162606-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 11:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116736

From: "mark.yang" <mark.yang@lge.com>

* gcc-15 uses gnu23 for c.
  'bool' is a keyword.
TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:22: error: 'bool' cannot be defined via 'typedef'
   31 | typedef unsigned int bool;
      |                      ^~~~
TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:22: note: 'bool' is a keyword with '-std=c23' onwards
TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:1: warning: useless type name in empty declaration
   31 | typedef unsigned int bool;
      | ^~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...rror-due-to-bool-keyword-with-gcc-15.patch | 37 +++++++++++++++++++
 .../paho-mqtt-c/paho-mqtt-c_1.3.14.bb         |  5 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch
new file mode 100644
index 0000000000..4215f698c7
--- /dev/null
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch
@@ -0,0 +1,37 @@
+From 02fa96d0d59211e64483273e5253ca45c4395154 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 9 Apr 2025 19:05:55 +0900
+Subject: [PATCH] Fix build error due to bool keyword with gcc-15
+
+* gcc-15 uses gnu23 for c.
+  'bool' is a keyword.
+TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:22: error: 'bool' cannot be defined via 'typedef'
+   31 | typedef unsigned int bool;
+      |                      ^~~~
+TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:22: note: 'bool' is a keyword with '-std=c23' onwards
+TOPDIR/tmp/work/core2-64-oe-linux/paho-mqtt-c/1.3.14/git/src/MQTTPacket.h:31:1: warning: useless type name in empty declaration
+   31 | typedef unsigned int bool;
+      | ^~~~~~~
+
+Upstream-Status: Submitted [https://github.com/eclipse-paho/paho.mqtt.c/pull/1595]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+Signed-off-by: markyang92 <pllpokko@alumni.kaist.ac.kr>
+
+---
+ src/MQTTPacket.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/MQTTPacket.h b/src/MQTTPacket.h
+index fd384ae9..0c64a0f4 100644
+--- a/src/MQTTPacket.h
++++ b/src/MQTTPacket.h
+@@ -28,7 +28,9 @@
+ #include "LinkedList.h"
+ #include "Clients.h"
+ 
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef unsigned int bool;
++#endif
+ typedef void* (*pf)(int, unsigned char, char*, size_t);
+ 
+ #include "MQTTProperties.h"
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
index 7b76f86db6..b971851b90 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.14.bb
@@ -10,7 +10,10 @@ LIC_FILES_CHKSUM = " \
     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master"
+SRC_URI = " \
+    git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master \
+    file://0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch \
+"
 
 SRCREV = "2150ba29d9df24ad1733c460eb099f292af84ee5"
 

