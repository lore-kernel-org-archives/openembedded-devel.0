Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E02C54E73
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8159.1710827206450089136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VicQIUL+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827213; x=1742363213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qemF8u47WQX2KYs4h+TbWf38NqVB8ZpGiz5tiGJs0rM=;
  b=VicQIUL+R4HLE4EpASkNgTnGRXWTzzZ0Z+KO0KeJEe4KP0DKdBNXJFGY
   tZ7tP+nD9sk1BwiEgrSx2l4ig4dPCFT2bPVBW+lfjoGTg6dEk6A7lnGci
   im/3UlwctfvbiYUk2J7kHm2OAEewU6JTGmkT50D/AidIx2zHpPKCvjyd+
   I+ZLpR6x0wlagm1UQXXU6JBz4ekMVZCN6lrG8BPK3Vizmxs4j/MhAtzkK
   3cNcTdjrRyNDPeV6Cv6fMSR2NRSlWmBvAs9QPre3+TL3bl7ppF5cgDB1T
   w6JELorYHQgvvRjcn+D7Z5mpRz3H/cB4JuV5hvS4NVvXT+QpwFXtn1zBS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152674089"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152674089"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8900B14121C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B0330D4F5E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F9652235E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EE57D1A006B;
	Tue, 19 Mar 2024 13:46:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/50] python3-pytest-lazy-fixtures: upgrade 1.0.5 -> 1.0.6
Date: Tue, 19 Mar 2024 13:45:28 +0800
Message-Id: <1710827139-30056-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.855000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysT4iDztnfIOQQF
	TLnXm7yY4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedB82
	GyGpZHXuBkESMI05d4lzjFhM9hn+YbZ3DSPtWJmueAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNT9FMMFmEfcexbxdLtdS0lA4RyEkPuTFLFlGqyiDxA84ckYrFn0oJeigj4eVwNiXeaz70
	iAQtRQs3pwnifvL5fHTNxrHtu393WJbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109456

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix tests, add tests to sdist

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-fixtures_1.0.5.bb => python3-pytest-lazy-fixtures_1.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-lazy-fixtures_1.0.5.bb => python3-pytest-lazy-fixtures_1.0.6.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.5.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.6.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.6.bb
index dcf662a2c..43e4f37ee 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.6.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "https://github.com/dev-petrov/pytest-lazy-fixtures"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4475e66fcfabe27395e6764c8f69c876"
 
-SRC_URI[sha256sum] = "066b253a94c249e6d9cdfad465e2503d2219139fb468d8f687243dfde39ab9cb"
+SRC_URI[sha256sum] = "d69320b53b7e10888a2b1e98a89d891fa7b39f210b9f2087ebe3042a38e28a2e"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


