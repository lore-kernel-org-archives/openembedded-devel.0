Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5142CC369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:14:52 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.4115.1744190091469337183
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.51, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 9 Apr 2025 18:14:49 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.38)
	by 156.147.1.127 with ESMTP; 9 Apr 2025 18:14:49 +0900
X-Original-SENDERIP: 10.185.60.38
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-networking][PATCH] mdns: Fix build with gcc-15
Date: Wed,  9 Apr 2025 18:14:36 +0900
Message-Id: <20250409091436.104600-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 09:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116730

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

Fix error: http://errors.yoctoproject.org/Errors/Details/851809/

../mDNSShared/CommonServices.h:856:13: error: 'bool' cannot be defined via 'typedef'
  856 | typedef int bool;
      |             ^~~~
../mDNSShared/CommonServices.h:856:13: note: 'bool' is a keyword with '-std=c23' onwards
../mDNSShared/CommonServices.h:856:1: warning: useless type name in empty declaration
  856 | typedef int bool;
      | ^~~~~~~

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 .../mdns/0001-Fix-build-with-gcc-15.patch     | 37 +++++++++++++++++++
 .../recipes-protocols/mdns/mdns_2559.80.8.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..22a9c27aad
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-build-with-gcc-15.patch
@@ -0,0 +1,37 @@
+From 189f0d8e9913f4eaca9189f710155ffba9035f7e Mon Sep 17 00:00:00 2001
+From: Nguyen Dat Tho <tho3.nguyen@lge.com>
+Date: Wed, 9 Apr 2025 13:05:24 +0900
+Subject: [PATCH] Fix build with gcc-15
+
+To fix error:
+In file included from ../mDNSCore/mDNS.c:76:
+../mDNSShared/CommonServices.h:856:13: error: 'bool' cannot be defined via 'typedef'
+  856 | typedef int bool;
+      |             ^~~~
+../mDNSShared/CommonServices.h:856:13: note: 'bool' is a keyword with '-std=c23' onwards
+../mDNSShared/CommonServices.h:856:1: warning: useless type name in empty declaration
+
+Upstream-Status: Pending (An owner of this repository has limited the ability to open a pull request to users that are collaborators on this repository.)
+
+Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
+---
+ mDNSShared/CommonServices.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/mDNSShared/CommonServices.h b/mDNSShared/CommonServices.h
+index 7efb077..f0f3a8b 100644
+--- a/mDNSShared/CommonServices.h
++++ b/mDNSShared/CommonServices.h
+@@ -192,6 +192,9 @@ extern "C" {
+ 
+     #include    <stdint.h>
+     #include    <arpa/inet.h>
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L
++    #include    <stdbool.h>
++#endif
+ 
+ #elif ( TARGET_OS_SOLARIS )
+ 
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb b/meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb
index 5f9af2661a..fc5add6c12 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2559.80.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0001-Fix-SIGSEGV-during-DumpStateLog.patch \
            file://0005-Fix-missing-limit-declarations.patch \
            file://0004-Add-definition-for-MAX.patch \
+           file://0001-Fix-build-with-gcc-15.patch \
            "
 BRANCH = "rel/mDNSResponder-2559"
 SRCREV = "ecc02274878b0a70dba229de642b081cd1c30927"
-- 
2.34.1


