Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB97EC77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:06:55 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.66578.1684069610267815130
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lrc+WkUC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069608; i=@fujitsu.com;
	bh=I7HAhmOpcoT5A+FhuYkYPVRwsaxAxwi2ZUo55GIZpHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=lrc+WkUCCHTeUmLEeTZ58QuLwAuWpoLlrwqwMjXePT9uVaqHfcbdaVrlUQofq2FyT
	 8czeo8NytOCbGB2dA46VpporJjEqM9auJJarjzlFqmqkoGJ5ODoRKMCmgEakCRGpn1
	 xHc4emLvSDPH5IfFuPHARgcp/DLz6rzKj0426bp/CiUFYOGC3EEOiKVwk70UgdrVs7
	 Vqe/1TqjbH1CuoUpJ9uuw7NpyNcxtgpyw4wqgoE6EGe8O/Dl8gPPAmXsP8ABLrmSTy
	 th0GRKK8GT/K1yfqqF2vPvVhm875wRulKtBM++pdyH3eiGtO22tEo3mrDVDNwRI3rm
	 AyBIWmMZY0geg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRWlGSWpSXmKPExsViZ8ORpPv8TkK
  KwZkTqhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bT77eMBbuEKk6/fcncwLhXoIuRk0NIYCOj
  xNHNvl2MXED2NCaJF186mUESbAISEtP3nmQHsUUEdCU+fpjLCGIzC6hIzJh8hAnEFhbwlDhxd
  RJYnEVAVaLv6zqWLkYODl4BJ4k3U1VBwhICChJTHr4HG8kp4Cyx8cN7Roi9ThJLbqxhh6hRk7
  h6bhPzBEaeBYwMqxhNi1OLylKLdE30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0DfUSy4v1Uou
  L9Yorc5NzUvTyUks2MQLDIaWYIXIH4/2df/UOMUpyMCmJ8l4riUsR4kvKT6nMSCzOiC8qzUkt
  PsQow8GhJMGrczMhRUiwKDU9tSItMwcYmjBpCQ4eJRHeuKtAad7igsTc4sx0iNQpRkUpcd4DI
  H0CIImM0jy4Nlg8XGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzMtzA2gKT2ZeCdz0V0CLmY
  AW39oTD7K4JBEhJdXAtO9C9bvtVZaTAjb9X8QQc3de+uxFDx2+CBjFnbve1rFTN96KQzj6QPb
  ewxdFvySyrN3ksFvlSIWpxLXwcxfYbJX+KIvvubhy2qfg1K37a/1dLjIqh7wp+7fVvyJq44ct
  Hu6y1hPSkz4+fnrR1eltdtq3nMUTGr/+mbN7htBxr7n6N3WFGF/tXrVXn6nKwLXHXbPscGqRq
  +ND/xdNG5j5UjrnvX9/4dhPnZZZgTN4FKqvF94922+fGXX584k9EQ/2zmpapGabWlcTxX7le+
  muCdqc3pIBWVe2Ve174P56xUmO1rm/+O1vXXCPbtVTuPXl9ueUsgMrNwd16wREGdr2XHvnqhN
  oOkGSg9U94/KERUosxRmJhlrMRcWJADvJSLoCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1684069607!382686!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4721 invoked from network); 14 May 2023 13:06:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:06:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 437C41AE;
	Sun, 14 May 2023 14:06:47 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6A75F1AC;
	Sun, 14 May 2023 14:06:46 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.5.4 -> 4.5.5
Date: Sun, 14 May 2023 21:06:23 +0800
Message-Id: <1684069583-12337-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069583-12337-1-git-send-email-wangmy@fujitsu.com>
References: <1684069583-12337-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102580

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
New Features
--------------
Add support for CLIENT NO-TOUCH (#2745)
Add support for CLUSTER MYSHARDID (#2704)
Add "address_remap" feature to RedisCluster (#2726)
Add WITHSCORES argument to ZREVRANK command (#2725)
Improve error output for master discovery (#2720)

Bug Fixes
----------
Fix XADD: allow non negative maxlen (#2739)
Fix create single connection client from url (#2752)
Optionally disable disconnects in read_response (#2695)
Fix SLOWLOG GET return value (#2732)
Fix potential race condition during disconnection (#2719)
Return response in case of KeyError (#2628)
Fix incorrect usage of once flag in async Sentinel (#2718)
Fix memory leak caused by hiredis in asyncio case (#2694)
Really do not use asyncio's timeout lib before 3.11.2 (#2699)

 Maintenance
-----------
Clean PytestUnraisableExceptionWarning from asycio client (#2731)
Add RedisCluster.remap_host_port, Update tests for CWE 404 (#2706)
Updated AWS Elasticache IAM connection example (#2702)
Update CONTRIBUTING guidelines (#2736)
Fix ClusterCommandProtocol type (#2729)
Fix TOPK list example. (#2724)
Improving vector similarity search example (#2661)
Update example of Redisearch creating index (#2703)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.5.4.bb => python3-redis_4.5.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.5.4.bb => python3-redis_4.5.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.5.4.bb b/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-redis_4.5.4.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
index 1a439cdc3d..40210b5e25 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1db1f331d351900707368237cc4880cf"
 
-SRC_URI[sha256sum] = "73ec35da4da267d6847e47f68730fdd5f62e2ca69e3ef5885c6a78a9374c3893"
+SRC_URI[sha256sum] = "dc87a0bdef6c8bfe1ef1e1c40be7034390c2ae02d92dcd0c7ca1729443899880"
 
 inherit pypi setuptools3
 
-- 
2.34.1


