Return-Path: <hieu2.nguyen@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21971D5CC8F
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:52:22 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.12169.1730285537040144935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 03:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: hieu2.nguyen@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 30 Oct 2024 19:52:14 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: hieu2.nguyen@lge.com
Received: from unknown (HELO vsl.LGE.NET) (10.218.140.120)
	by 156.147.1.125 with ESMTP; 30 Oct 2024 19:52:14 +0900
X-Original-SENDERIP: 10.218.140.120
X-Original-MAILFROM: hieu2.nguyen@lge.com
From: hieu2.nguyen@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: hieu2.nguyen@lge.com
Subject: [meta-oe] libmtp: enable stack memory protection
Date: Wed, 30 Oct 2024 10:51:53 +0000
Message-ID: <20241030105153.3049343-1-hieu2.nguyen@lge.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 10:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113343

From: Hieu Van Nguyen <hieu2.nguyen@lge.com>

Add 0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch:
Use "return 0" instead of "exit(0)" to let the program exit normally
by returning from the main function. This allows the compiler to
perform necessary cleanup operations, including stack canary checks.

Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
---
 ...lug.c-Enable-stack-memory-protection.patch | 33 +++++++++++++++++++
 .../libmtp/libmtp_1.1.21.bb                   |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp/0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp/0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch b/meta-oe/recipes-connectivity/libmtp/libmtp/0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch
new file mode 100644
index 0000000000..9cd4b2fbd6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp/0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch
@@ -0,0 +1,33 @@
+From 0644188a537a06bc6d04483b21e23b80987eb497 Mon Sep 17 00:00:00 2001
+From: Hieu Van Nguyen <hieu2.nguyen@lge.com>
+Date: Fri, 11 Oct 2024 04:21:21 +0000
+Subject: [PATCH] util/mtp-hotplug.c: Enable stack memory protection
+
+Use "return 0" instead of "exit(0)" at the end of main()
+function to enable checking for Stack Overflow at Runtime.
+
+Use "return 0" to let the program exit normally by returning from
+the main function. This allows the compiler to perform necessary
+cleanup operations, including stack canary checks.
+
+__stack_chk_fail function isn't being invoked when using exit(0) at
+the end of the main function
+$ objdump -T ./util/.libs/mtp-hotplug | grep __stack_chk_fail
+This return empty.
+---
+Upstream-Status: Backport [https://github.com/libmtp/libmtp/commit/e89dbb6ecf244936acc9a52aa4af9635bda5926a]
+
+ util/mtp-hotplug.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/mtp-hotplug.c b/util/mtp-hotplug.c
+index b5bc6da40f..db75cb38a1 100644
+--- a/util/mtp-hotplug.c
++++ b/util/mtp-hotplug.c
+@@ -301,5 +301,5 @@ int main (int argc, char **argv)
+     printf("\n");
+   }
+ 
+-  exit (0);
++  return 0;
+ }
diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb
index 16f82c6ba3..69dff50cd7 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb
@@ -18,7 +18,8 @@ DEPENDS = "libusb1 gettext-native"
 DEPENDS:append:class-target = " ${BPN}-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI:append:class-target = " file://0001-Use-native-mtp-hotplug.patch"
+SRC_URI:append:class-target = " file://0001-Use-native-mtp-hotplug.patch \
+                                file://0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch"
 SRC_URI[sha256sum] = "f4c1ceb3df020a6cb851110f620c14fe399518c494ed252039cbfb4e34335135"
 
 UPSTREAM_CHECK_URI = "https://github.com/libmtp/libmtp/releases"
-- 
2.45.1


