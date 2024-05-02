Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9103C25B75
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:42 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6688.1714628980012248970
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=npAqVHYe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628981; x=1746164981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8GL3WLO96H7AQSjvzeaNJbc/oAAO9rNZ8wqiAH/zn4A=;
  b=npAqVHYev0TXU9JdLeX/GuRJJpdRI7ZZ5sJoHRKUoGjf4x1Vk19kb0LG
   DTK32YnckNaLyvhVl+R9K/Jwhc1yjZA/9Maa2bM8ZUaGOvx3u1YX67b+4
   AKumM9llAxqSxYO5nc47twPQooyDVH1plwPiu0rsQ31GQiLHhuu6xxtV/
   qi8OHw2f+Xr0xWgtam0/2NFvdo4VKXK8K+U5uPE6J90UPDeIpcnTamhfB
   M5UUpvdtwi2IPs6qumP9RtMdghvo3F7FhkZkFtAf7o7gnzixZIgcU3GuQ
   cI9lR9n9XY2OQn5/ESMthg1fV4sJvvPUrjyj02WAo91HW3Dk/drU3E/TU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="136608499"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="136608499"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BBD2D4C2C
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 48A74C19D2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0D362008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:23 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F2A01A0002;
	Thu,  2 May 2024 13:49:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/30] python3-google-api-python-client: upgrade 2.125.0 -> 2.127.0
Date: Thu,  2 May 2024 10:48:08 -0400
Message-Id: <20240502144829.241208-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--1.526300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7m+u
	73sRwrcVk4cmAsm0DhlTt5xKJKvUpFlUsXlcneXFoSedi1ABoLM8CLPJFCVDRDb9S/zxGxkpesH
	D91sB7jXkNacJLt/j9bjBuldNvkMkoq97WSHdFjfupJaud1uZCfRs6uIbkFVw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110233

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.127.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.125.0.bb => python3-google-api-python-client_2.127.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.125.0.bb => python3-google-api-python-client_2.127.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.125.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.127.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.125.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.127.0.bb
index 8abe4699e..4c9bbc6cf 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.125.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.127.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "51a0385cff65ec135106e8be60ee7112557396dde5f44113ae23912baddda143"
+SRC_URI[sha256sum] = "bbb51b0fbccdf40e536c26341e372d7800f09afebb53103bbcc94e08f14b523b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


