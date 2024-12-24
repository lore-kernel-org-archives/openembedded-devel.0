Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCC6E7719A
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.30358.1735032439837642540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W2Pvskv0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032446; x=1766568446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Y9MdnsZnCxVqbohHof9cTvFf6J6EAtoF0dzSZehIJ6g=;
  b=W2Pvskv0N6lFvxrfqLQzH6Kd+qzE2avGYSVzK7FkXqUVBESU66Ur/dPX
   JI/mpb20qJ61VtAUyn8OBTxblGB+5pUpVkFeYCvJAwr/sKoZTdLRMz/DV
   kGFgUNDWosOgnqIuUr8bvDghYFkfoZFhGZKMKz5wltxyrHpKEHQxfJI75
   zNz5596bRMUnCe4FvLRZE1sEF5MJ+5QcFqnsBo6exju6E5Y78whEWqQoR
   00yjdhH9Igm6ct9hUSu+jXb8rOLKOx+H8rSQiaV8w7fRyKlKGYxkA7ZWg
   ZAV3P0tXDMir3N6HGRNHzpFZIpixZvlhsoUoFrtv4kafI41KLfLBLp2q4
   g==;
X-CSE-ConnectionGUID: hXNIc860QnKRWPjzhXVZhw==
X-CSE-MsgGUID: STa/EDwjQROPZ0Pq/jGyZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172776101"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172776101"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:25 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E649233DA
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E7E1FD5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CD646BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 440191A006C;
	Tue, 24 Dec 2024 17:27:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/67] python3-janus: upgrade 1.1.0 -> 2.0.0
Date: Tue, 24 Dec 2024 17:26:32 +0800
Message-Id: <1735032421-13513-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--6.765500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrzpTKxJgnxBCfHrjLA9DhZorq
	nYTxkVFKkByyIEVirBdaFfZnYmHiC5OI3+ifh41JKsurITpSv+NomrS6gMbppJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3cgUVP3Cp+vW5MoGKfGX+6YA3qL69rXq5pEX
	AOzwbtMeLzNWBegCW2wgn7iDBesS0gBwKKRHe+r+DUEvGC4grZsHXtIGlSD4Na2exEhNE+q5pF4
	xqr2GHow95ajm6k7bA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114509

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Optimize internal implementation for a little speedup
- Make not-full and not-empty notifications faster
- Add .aclose() async method
- Reduce notifications for a minor speedup
- Allow janus.Queue() instantiation without running asyncio event loop
- Remove sync notifiers for a major speedup
- Fix hang in AsyncQueue.join()
- Implement .shutdown(immediate=False) for both sync and async APIs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-janus_1.1.0.bb => python3-janus_2.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-janus_1.1.0.bb => python3-janus_2.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-janus_1.1.0.bb b/meta-python/recipes-devtools/python/python3-janus_2.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-janus_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-janus_2.0.0.bb
index a5f251f62c..9209f96d66 100644
--- a/meta-python/recipes-devtools/python/python3-janus_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-janus_2.0.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=23878c357ebb4c8ce1109be365043349"
 
-SRC_URI[sha256sum] = "0634df8b2b31f8afda4311abcf7fea912686fef717d13769eeaa01ae08d2b84c"
+SRC_URI[sha256sum] = "0970f38e0e725400496c834a368a67ee551dc3b5ad0a257e132f5b46f2e77770"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


