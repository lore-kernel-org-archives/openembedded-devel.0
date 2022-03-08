Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F962C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 03:16:48 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.4545.1646709406788326839
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 19:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2283Gik4019235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 7 Mar 2022 19:16:45 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 7 Mar 2022 19:16:44 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 19:16:44 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 7 Mar 2022 19:16:43 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] redis: remove fuzz warning
Date: Tue, 8 Mar 2022 11:16:42 +0800
Message-ID: <20220308031642.3353354-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 03:16:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95878

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
 WARNING: lib32-redis-7.0-rc1-r0 do_patch: Fuzz detected:

 Applying patch GNU_SOURCE.patch
 patching file src/zmalloc.c
 Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../redis/redis/GNU_SOURCE.patch               | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch b/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
index 9a40d832f..12994da56 100644
--- a/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
+++ b/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
@@ -1,4 +1,7 @@
-Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
+From 18dc1457db8f66237e016b85a04dc50833c33c50 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Dec 2019 12:09:51 -0800
+Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
 
 Fixes
 | zmalloc.c:87:37: error: 'PTHREAD_MUTEX_DEFAULT' undeclared here (not in a function)
@@ -7,11 +10,18 @@ Fixes
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/zmalloc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/zmalloc.c b/src/zmalloc.c
+index ba03685..322304f 100644
 --- a/src/zmalloc.c
 +++ b/src/zmalloc.c
-@@ -28,6 +28,7 @@
-  * POSSIBILITY OF SUCH DAMAGE.
-  */
+@@ -32,6 +32,7 @@
+ #include "config.h"
+ #include "solarisfixes.h"
  
 +#define _GNU_SOURCE
  #include <stdio.h>
-- 
2.25.1


