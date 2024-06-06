Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F89C27C65
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9754.1717664828042196525
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mH8cSqwu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664828; x=1749200828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jkkoiXH5jaRV3kSKy3EDn0suH1ulDXxKlS7K41XVJO4=;
  b=mH8cSqwuX9tnIx82WKUZBmOQpLtI9zK9niW6Y47myZ+hslYp7tvu3sWU
   DAZ/+SC9DCmslqmgJB9WIQlg8sGDpx0bR4hAVAZi4VqS8idE/zihQoGZo
   s4be2UJBbAboTc7QNsrHEojqsrJG005/LsfQdYvVBSR7YpnSfatjr0tuk
   6LMsNgGjJsCDnztfKVtgea5oO6zUXqXhfv5EGuzXRkzVoT6lTX9CB9lz6
   Yp5oEWFpoufY1x3tJ+im9ciN9dScjer/h0jK/RsoDKzyjOtx5cU+IC9sE
   EiJwW/J6mYLODe51ceoP6QLy/MR2sVzCkQ/GPXU5x9W5QvqjIn/oN7AFB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="161402991"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="161402991"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:06 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 71AF6DB3AF
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BA273D061D
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DA5920081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DEBB21A000A;
	Thu,  6 Jun 2024 17:07:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 27/36] mcelog: upgrade 198 -> 199
Date: Thu,  6 Jun 2024 17:06:26 +0800
Message-Id: <1717664795-13902-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--3.916500-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yRvMKxHA9efNkdS3kPlaZyVkDFfw8NSG/Nnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQB1e
	gkZdCJXdsXqCizdUSQ9o7nBvaGi9BVoG8mkAKgzyseLhOr9XBOgTHaede/M0jXL3alrQqMpJmWP
	0XV61CjSoRocau+3jCSTNMtJng+0j0hqgkYn/QixMxKDqgAFSzDGPdYDozjWMR34ro7k23nYfra
	Cyyl8ERQi/7aW08INbQ1eGkfrkoDmgg/RoiPVm2l1VzLtWj2rz+yhO1yCoLfAdVRmAIzhtAo8WM
	kQWv6iUoTQl7wNH8PgP5zT0d393cxlblqLlYqXIX3Bf3cRwa+CeK8ZMW2rk3ChoCB6KtcChpDVe
	DntVV7WbDNqWDHAKjmVxP45kxT/HsOsnKVl87SVB+UcjLy8TaWdnCEqYwftP+v9v52ZIoWjoAf3
	89xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110736

From: Wang Mingyu <wangmy@fujitsu.com>

0001-server-Correct-prameter-type-for-connect-API.patch
removed since it's included in 199

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...orrect-prameter-type-for-connect-API.patch | 43 -------------------
 .../mcelog/{mcelog_198.bb => mcelog_199.bb}   | 14 +++---
 2 files changed, 6 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mcelog/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
 rename meta-oe/recipes-support/mcelog/{mcelog_198.bb => mcelog_199.bb} (76%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch b/meta-oe/recipes-support/mcelog/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
deleted file mode 100644
index 2f26f9ced..000000000
--- a/meta-oe/recipes-support/mcelog/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 0370e7a9fb0ca1b27d7b0897739e2a7cce8977ab Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 May 2024 22:42:07 -0700
-Subject: [PATCH] server: Correct prameter type for connect() API
-
-connect() function expects the second argument to be point to sockaddr
-as per man sockaddr
-
-int connect (int, const struct sockaddr *, socklen_t);
-
-Fixes build failures with -Wincompatible-pointer-types when using GCC-14
-and musl
-
-Fixes
-| server.c: In function 'server_ping':
-| server.c:308:33: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
-|   308 |                 if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
-|       |                                 ^~
-|       |                                 |
-|       |                                 struct sockaddr_un *
-
-Upstream-Status: Submitted [ sent to contact@mcelog.org ]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- server.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/server.c b/server.c
-index 54c7d57..51b7d3a 100644
---- a/server.c
-+++ b/server.c
-@@ -305,7 +305,7 @@ static int server_ping(struct sockaddr_un *un)
- 	if (sigsetjmp(ping_timeout_ctx, 1) == 0) {
- 		ret = -1;
- 		alarm(initial_ping_timeout);
--		if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
-+		if (connect(fd, (const struct sockaddr *)un, sizeof(struct sockaddr_un)) < 0)
- 			goto cleanup;
- 		if (write(fd, PAIR("ping\n")) < 0)
- 			goto cleanup;
--- 
-2.45.0
-
diff --git a/meta-oe/recipes-support/mcelog/mcelog_198.bb b/meta-oe/recipes-support/mcelog/mcelog_199.bb
similarity index 76%
rename from meta-oe/recipes-support/mcelog/mcelog_198.bb
rename to meta-oe/recipes-support/mcelog/mcelog_199.bb
index 10b229319..0a48fc48c 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_198.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_199.bb
@@ -5,14 +5,12 @@ and should run on all Linux systems that need error handling."
 HOMEPAGE = "https://mcelog.org/"
 SECTION = "System Environment/Base"
 
-SRC_URI = "\
-    git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master \
-    file://0001-client-Include-string.h-form-mem-function-prototypes.patch \
-    file://0001-server-Correct-prameter-type-for-connect-API.patch \
-    file://run-ptest \
-"
-
-SRCREV = "ab58f07b9b1a4456fca0f5f41639d5cbecc80e36"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master \
+           file://0001-client-Include-string.h-form-mem-function-prototypes.patch \
+           file://run-ptest \
+           "
+
+SRCREV = "c17897deb52daab300c585a6a6c2456d062d80cf"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.34.1


