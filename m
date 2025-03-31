Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24846C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:17:01 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.47606.1743412610621684267
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.52, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 31 Mar 2025 18:16:49 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.84)
	by 156.147.1.127 with ESMTP; 31 Mar 2025 18:16:49 +0900
X-Original-SENDERIP: 10.185.60.84
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-filesystems][PATCH] libburn: Fix build with gcc-15
Date: Mon, 31 Mar 2025 18:16:24 +0900
Message-Id: <20250331091624.1849493-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116427

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

Backport patch to fix the following error:
../libburn-1.5.6/test/poll.c: In function 'main':
../libburn-1.5.6/test/poll.c:67:27: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
   67 |         newact.sa_handler = catch_int;
      |                           ^
../libburn-1.5.6/test/poll.c:17:13: note: 'catch_int' declared here
   17 | static void catch_int ()
      |             ^~~~~~~~~
In file included from ../libburn-1.5.6/test/poll.c:9:
/home/worker/nano-ai/build-nano-ai/BUILD/work/qcs8550_aihub-webos-linux/libburn/1.5.6/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
   72 | typedef void (*__sighandler_t) (int);
      |                ^~~~~~~~~~~~~~
make: *** [Makefile:1024: test/poll-poll.o] Error 1

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 ...ignal-handler-prototype-spoiled-comp.patch | 27 +++++++++++++++++++
 .../burnia/libburn_1.5.6.bb                   |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/burnia/libburn/0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch

diff --git a/meta-filesystems/recipes-filesystems/burnia/libburn/0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch b/meta-filesystems/recipes-filesystems/burnia/libburn/0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch
new file mode 100644
index 0000000000..6061352cb7
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/burnia/libburn/0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch
@@ -0,0 +1,27 @@
+From d537f9dd35282df834a311ead5f113af67d223b3 Mon Sep 17 00:00:00 2001
+From: Thomas Schmitt <scdbackup@gmx.net>
+Date: Tue, 26 Nov 2024 23:02:03 +0100
+Subject: [PATCH] Bug fix: Faulty signal handler prototype spoiled compilation
+ under C23
+
+Upstream-Status: Backport [https://dev.lovelyhq.com/libburnia/libburn/commit/d537f9dd35282df834a311ead5f113af67d223b3]
+---
+ test/poll.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/poll.c b/test/poll.c
+index 660f384..cd5ff90 100644
+--- a/test/poll.c
++++ b/test/poll.c
+@@ -14,7 +14,7 @@ static struct burn_drive_info *drives;
+ static unsigned int n_drives;
+ int NEXT;
+ 
+-static void catch_int ()
++static void catch_int (int signum)
+ {
+ 	NEXT = 1;
+ }
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
index e0f6664ab3..e84a60a543 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
@@ -5,7 +5,9 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYRIGHT;md5=a91b9b862895b64e68e5b321873c9111"
 
-SRC_URI = "http://files.libburnia-project.org/releases/${BP}.tar.gz"
+SRC_URI = "http://files.libburnia-project.org/releases/${BP}.tar.gz \
+           file://0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch"
+
 SRC_URI[sha256sum] = "7295491b4be5eeac5e7a3fb2067e236e2955ffdc6bbd45f546466edee321644b"
 
 inherit autotools pkgconfig lib_package
-- 
2.34.1


