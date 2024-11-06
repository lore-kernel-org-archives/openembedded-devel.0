Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF649D29F8C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.40026.1730874675772138845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mKKRJJmk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874680; x=1762410680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Q5cnN5NzXUXTcqpaVeUDvGL8swboNp7abFwRJfLqJ8M=;
  b=mKKRJJmkTs5uHvNjDocIzRrftU77laxXEOINihr6yPbLrmDaBcF84Uz6
   t8A+IxVO0WSY3xCIxPJ+LouYkTjG3T9pxjCIAs9ViSle0fgFX3D9AdXdU
   kBYzoaGL+5h9pzIwEQyJhbmGnFKlF21nv+jDDTkAaaPJ0YDqHc9Xma9cl
   11tYp64M7fp31isfPpbhfIC5FGCzj6ONcire6DFMhAHxQFJFWdyadtrlQ
   rzrKZ36UuXpeaCi3e2Zg8pmUNUV07UGgwHTClGvzm8j2Ki79xdy71I4ML
   snlbCKofYoaV9NJutWMRVvuhor4h0tZKXyzxsHTLBbadmSgfygq7Hqwpo
   Q==;
X-CSE-ConnectionGUID: HD/9wXzlRvSy2N7tUKFePA==
X-CSE-MsgGUID: YEavMx2KQTGPpEJiM1y+Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179274369"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179274369"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A8E72E8521
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D9446D50F8
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68ADA20071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 16DE91A000A;
	Wed,  6 Nov 2024 14:31:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/46] python3-colorlog: upgrade 6.8.2 -> 6.9.0
Date: Wed,  6 Nov 2024 14:30:32 +0800
Message-Id: <1730874660-2364-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--2.586800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJohxE9KrxaZbhngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDWeY9TlJrwFGhuXLYw3Ai1Drv9ALy5D2cXK3jq8xhfuGB60AES/cxkxIuo7DQFaUClM/P
	S5m+BvPl6zZR4VnYolH05c3/POxWLyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113702

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- satisfy mypySupport Python 3.13
- satisfy mypy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-colorlog_6.8.2.bb => python3-colorlog_6.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.8.2.bb => python3-colorlog_6.9.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.9.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.9.0.bb
index df5fdedfc..a418d213a 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.9.0.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "3e3e079a41feb5a1b64f978b5ea4f46040a94f11f0e8bbb8261e3dbbeca64d44"
+SRC_URI[sha256sum] = "bfba54a1b93b94f54e1f4fe48395725a3d92fd2a4af702f6bd70946bdc0c6ac2"
 
 RDEPENDS:${PN} += "python3-logging"
 
-- 
2.34.1


