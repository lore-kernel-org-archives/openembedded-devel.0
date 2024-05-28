Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E3FC27C43
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.12691.1716860977226423694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IBv+UZT5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860978; x=1748396978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Acn4zwFiXfLr4MB7nZ57vNHdG0JH+XGu95wfqg1oVg4=;
  b=IBv+UZT5ZGKKnVtbMIcbXEYIDMHuPUrsHJqadGE3S5nBjLMXgzz5PVBv
   tNN2lZx2Pt3d7InCYXsVH2susygFAW0IQFaqLeSBHB5kjnmrDG0pOrpgL
   QWLk4ESa3anlopr8Ro/YrDE4gEj/cxjdPd9N8dBNmNlSGE0A0T+oFeJpt
   fayaCj6HQIYOILWnKFyl4w1KX4gU7P9vp31OVT+shNvcnlbsgaAHyEhFk
   4Xyv0fRZNrskB6O4tUASZftsjkkvy9L95r3tssFAtLA95RZawLMYzPl1H
   LqLoLYY/TWbf9A5wbtw99P0jaRHXB/dohKDkROea4MDxNYorVUUmzz96T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160573496"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160573496"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:36 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 86782E4289
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C8925CFA5C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5863C41063
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 06FA51A000C;
	Tue, 28 May 2024 09:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/40] python3-google-api-python-client: upgrade 2.129.0 -> 2.130.0
Date: Tue, 28 May 2024 09:47:57 +0800
Message-Id: <1716860901-863-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--1.526300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7Y5V
	V1pw9NnDMhtBliu9UNbsUtOjbRoXfUJenaVQ7+2loSedi1ABoLM8CLPJFCVDRDb9S/zxGxkpesH
	D91sB7jcV8qdAiU+1aCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110550

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.130.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.129.0.bb => python3-google-api-python-client_2.130.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.129.0.bb => python3-google-api-python-client_2.130.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.129.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.130.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.129.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.130.0.bb
index 2517cddd3..9ba73ebd2 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.129.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.130.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "984cc8cc8eb4923468b1926d2b8effc5b459a4dda3c845896eb87c153b28ef84"
+SRC_URI[sha256sum] = "2bba3122b82a649c677b8a694b8e2bbf2a5fbf3420265caf3343bb88e2e9f0ae"
 
 inherit pypi setuptools3
 
-- 
2.34.1


