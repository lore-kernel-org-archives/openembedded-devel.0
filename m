Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8B4C07C79
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2726.1713318103627840586
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MvxbS5Z7;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318104; x=1744854104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CiqsIAKdWGee/aZZy/OSuQ+dRxQ1yQSNjmEKJKzHbME=;
  b=MvxbS5Z7aAj751IG+0b81lMfxuEvrH30QmcLUiz7M02pBPcbRlIUZPIM
   wGsqKnwL3s64i9qQgr6K9BF/5PxJs2pZmI3Q3yWXPZAjbnDb1b9ngJwbC
   5mn5aulP4zMrZiUdXPASEdmIWhejWRgjsIu+O3/9ZDE4+UPSPcAUMug08
   PoUSWVu2kQiiQvOryB1YuWxy1HSk+9x7fWOmBq6HcDmWMrp+nU/lLwiOP
   F6BktvxilJm0kz34Zq2V1x/uTUZpAwkqnMaNgSo6zi6Q+jCxShYYW2n9H
   XjBaBIqKltsGJKX8SnxV/q+BfM0F8/+7CoBcB1gmDUKSrFgM7i39d7RDx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135076061"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135076061"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:43 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BD6D107D31
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B1873FD907
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 507FE6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F17ED1A0002;
	Wed, 17 Apr 2024 09:41:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/49] python3-web3: upgrade 6.16.0 -> 6.17.0
Date: Wed, 17 Apr 2024 09:40:51 +0800
Message-Id: <1713318061-17128-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--5.956700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mregIHHX2L4YwqJxi32tUa/lq6
	Uucg4wAEOuzeNmOGKnN7L4dx4z+0QPil247XDr/jGqSG/c50XgOxq37CBjJNbJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3cgUVP3Cp+vRCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrYbaLjLw/bFed0H8LFZNFG7/nnwJ52QYi+pygCGKFPC+BjmG
	TzO6ysWV7LEKfM5jsTJvPR4e2E9G2ETh0uCcBs92M12S9uoCas=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add feedback survey banner to docs
-Fix eth_createAccessList docs to reflect the correct behavior.
-Add request formatter for maxFeePerBlobGas when sending blob transactions. Add
 formatters for blobGasPrice and blobGasUsed for eth_getTransactionReceipt.
-Add formatters to ensure that the result of a eth_createAccessList response
 can be plugged directly into an accessList in a transaction.
-Add Cancun support to EthereumTesterProvider; update Cancun-related fields in
 some internal types.
-Use pre-commit for linting the v6 branch
-Add an upperpin at eth-typing<4.2.0 due to removal of EthPM types in that lib

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.16.0.bb => python3-web3_6.17.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.16.0.bb => python3-web3_6.17.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.16.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_6.16.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
index 01738f22c..f1be4dcf4 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "b10c93476c106acc44b8428e47c61c385b7d0885e82cdc24049d27f521833552"
+SRC_URI[sha256sum] = "1b535272a40da3d8d2b120856edb53b84b0c08bcc8fe1a5bbd5f816fd72f4ec6"
 
 inherit pypi setuptools3
 
-- 
2.34.1


