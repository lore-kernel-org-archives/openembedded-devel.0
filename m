Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEC8C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:15:32 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web11.4110.1744190123602723630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.53, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 9 Apr 2025 18:15:22 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.38)
	by 156.147.1.121 with ESMTP; 9 Apr 2025 18:15:22 +0900
X-Original-SENDERIP: 10.185.60.38
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-networking][PATCH] drbd-utils: Fix build with gcc-15
Date: Wed,  9 Apr 2025 18:15:17 +0900
Message-Id: <20250409091517.104863-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 09:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116731

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

To fix error: http://errors.yoctoproject.org/Errors/Details/851808/
In file included from string_matching.cpp:1:
./string_matching.h:10:18: error: 'uint16_t' does not name a type
   10 |     extern const uint16_t   PATTERN_LIMIT;
      |                  ^~~~~~~~
./string_matching.h:7:1: note: 'uint16_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 .../0001-Fix-build-with-gcc-15.patch          | 34 +++++++++++++++++++
 .../recipes-support/drbd/drbd-utils_9.30.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-Fix-build-with-gcc-15.patch

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..00105fb844
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-Fix-build-with-gcc-15.patch
@@ -0,0 +1,34 @@
+From b42265af87d9efcc9aac91b3a3da3df5c5c66e29 Mon Sep 17 00:00:00 2001
+From: Nguyen Dat Tho <tho3.nguyen@lge.com>
+Date: Wed, 9 Apr 2025 17:33:25 +0900
+Subject: [PATCH] Fix build with gcc-15
+
+To fix the following error:
+In file included from string_matching.cpp:1:
+./string_matching.h:10:18: error: 'uint16_t' does not name a type
+   10 |     extern const uint16_t   PATTERN_LIMIT;
+      |                  ^~~~~~~~
+./string_matching.h:7:1: note: 'uint16_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+
+Upstream-Status: Submitted [https://github.com/LINBIT/drbd-utils/pull/50]
+
+Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
+---
+ user/drbdmon/string_matching.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/user/drbdmon/string_matching.h b/user/drbdmon/string_matching.h
+index 9b3918fe..b783ba48 100644
+--- a/user/drbdmon/string_matching.h
++++ b/user/drbdmon/string_matching.h
+@@ -4,6 +4,7 @@
+ #include <string>
+ #include <memory>
+ #include <stdexcept>
++#include <cstdint>
+ 
+ namespace string_matching
+ {
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
index d9f1ae3f77..ab515603f5 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;prot
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers;branch=master;protocol=https \
            file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
+           file://0001-Fix-build-with-gcc-15.patch \
            "
 SRCREV_drbd-utils = "36ea199f38b543b2da92219109c2832e122e5bf9"
 SRCREV_drbd-headers = "94f4472513f351efba5788f783feba6ac6efe9fc"
-- 
2.34.1


