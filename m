Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AE2C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 01:20:30 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.6146.1656465623052701221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jun 2022 18:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 25T1KGTH001881
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jun 2022 18:20:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Jun 2022 18:20:16 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 28 Jun 2022 18:20:16 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][master][PATCH] redis: upgrade 6.2.6 -> 6.2.7
Date: Wed, 29 Jun 2022 09:20:15 +0800
Message-ID: <20220629012015.500527-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jun 2022 01:20:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97612

From: Changqing Li <changqing.li@windriver.com>

This upgrade include CVE fix:
CVE-2022-24735
CVE-2022-24736

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/redis/GNU_SOURCE.patch  | 14 ++++++++------
 .../redis/{redis_6.2.6.bb => redis_6.2.7.bb}       |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.6.bb => redis_6.2.7.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch b/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
index 12994da56..20f689bd0 100644
--- a/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
+++ b/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
@@ -1,4 +1,4 @@
-From 18dc1457db8f66237e016b85a04dc50833c33c50 Mon Sep 17 00:00:00 2001
+From 98d526f76049be21bf3d77158236b2189419a78e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -10,20 +10,22 @@ Fixes
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/zmalloc.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/zmalloc.c b/src/zmalloc.c
-index ba03685..322304f 100644
+index 1f33d09..5e182d1 100644
 --- a/src/zmalloc.c
 +++ b/src/zmalloc.c
-@@ -32,6 +32,7 @@
- #include "config.h"
- #include "solarisfixes.h"
+@@ -28,6 +28,7 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
  
 +#define _GNU_SOURCE
  #include <stdio.h>
  #include <stdlib.h>
  #include <stdint.h>
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.6.bb b/meta-oe/recipes-extended/redis/redis_6.2.7.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.6.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.7.bb
index 87fade7e0..7f922a4e0 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.7.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab"
+SRC_URI[sha256sum] = "b7a79cc3b46d3c6eb52fa37dde34a4a60824079ebdfb3abfbbfa035947c55319"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


