Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40179C531DC
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2886.1722934020649367662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pJuztEZq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934022; x=1754470022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t+ouCWjh6ce0+KVlPB5hcfI4ISQExyh6xCNwk1Tkx7g=;
  b=pJuztEZqykRBy+2DfgfIVjf6RoG794bZ/HYYMk4qHw58lTzA6FhEgxzr
   ptxfDbsks+sZwbTmr36hApAzagm9O4xdcJcw1+rczyo6jNovVSjurFvfQ
   Oe8UB/ZSTlPUrW/ywYCkwXUty3/2H1xlx3Jvz4RhQHChOoNsZFqr2Qjat
   cAhiJ72SbedAFyb1DyPWqsf727nboQ6CKLyXJutd7EpVb7IxrpIDCgNPo
   k+S6W3N9dEasSsI1BCz15IyP6hSerMXLBFgA+YPFNLQ9GSKvyR7FiLsIu
   rou3OTSqQd56E4GQqNKW8Lh3ygqxaCyr5C5QZU05Aj8cIiHdUTyTAi5RD
   g==;
X-CSE-ConnectionGUID: hvYmgCOXQ6mDvis8EjLnqg==
X-CSE-MsgGUID: Bz9rcNQdQki129LssvONXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="148947965"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="148947965"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BECBE4289
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 978A31037E
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3412720076D12
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F41DC1A000C;
	Tue,  6 Aug 2024 16:46:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/60] python3-pdm-backend: upgrade 2.3.2 -> 2.3.3
Date: Tue,  6 Aug 2024 16:46:13 +0800
Message-Id: <1722933994-32549-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--0.110200-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4Btg1zuDHEymQH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJon585nKQczq7uce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62ST97KNTzddL+QYear3pn5pl21+F9KvpkFknaNKFqX/6rDn4
	3IcO/tcLy7Xpe5OGC2B8kTOjDQwC2CLohCqMKJZYZ7vnU6oQyWS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111555

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pdm-backend_2.3.2.bb => python3-pdm-backend_2.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-backend_2.3.2.bb => python3-pdm-backend_2.3.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.2.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pdm-backend_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pdm-backend_2.3.3.bb
index bdc9384f6..e78f1957a 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "b0c47e6a5f6bd7b0e2263eede0e6b2cf164a83ade81b7e73dc10f8254f60b828"
+SRC_URI[sha256sum] = "a8616f628ec84353d7a0ba86b228dcf01bab5debc9e4d1a29e5311a52425d594"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


