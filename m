Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4391CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:58 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.49303.1727682230246643019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GmC6cw4H;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682233; x=1759218233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/58P3mVx44vJRPaqOgaes4NU+uRppS6mb1kff06vFeM=;
  b=GmC6cw4HzySNvWuIEuhWKnGiYsCFyNJTUXnLXqSCqiIQuA21zQc79399
   4xMZ8OrvE2usbFQna+/upXAyZ/eVUUTpjxwRtZU0QKzMH/SN0qWQBWMsD
   jVfNYf23kD4cVePmOw8DQSZXt1vfb9kQIyTNa9DeW7HKc+kIFdfHIKBx/
   SZ8fwNMA3if5U+wB9cHHMqvi1xPOwsvKJF1Zbc7T23M2YxHpTJxPpoC/H
   GMdDtkUvGoUW1y74QgI4s/moLvN7uzvhcMpM+5eKfIk3qL/V9x5pPqT5z
   3IXugqri22sLZ4IpJIiFTBT0Nznu/AkZSZRjxcbhyRivbpdcHCfyfYHGp
   w==;
X-CSE-ConnectionGUID: qCcYpvzAR3uQvyMBuXo5IQ==
X-CSE-MsgGUID: 8wHf7xAVRt6nxcdqZI2vPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="154116691"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="154116691"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:52 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A5FACA1E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DE61AD773A
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D8136B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 29FD01A000A;
	Mon, 30 Sep 2024 15:43:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/40] python3-pyyaml-include: upgrade 2.1 -> 2.2
Date: Mon, 30 Sep 2024 15:42:53 +0800
Message-Id: <1727682185-12664-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-0.621100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4YeSlHZYFotN3
	A9FjogGZ4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0540yMkq5fGHu2eVs
	0skyEaS2BkESMI05d4qHvyg1ZsxTfNrsgG44+2ESeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNa9Ut/tFox/MbrLAtsBSq+aHi4/mqDqBM9pFLHGKb7/DHrKoCy/TwN2B9RDqs5RDYdyGX
	Ml9pr7RdWRem6D/1cCi6i3P+Vddy1LvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112585

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add flatten argument.
- fix issue if glob_params is not int.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pyyaml-include_2.1.bb => python3-pyyaml-include_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyyaml-include_2.1.bb => python3-pyyaml-include_2.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
index 058699fdf..f39b63ea5 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tanbro/pyyaml-include"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS += "python3-setuptools-scm-native"
-SRCREV = "dc16153b28f5cab997814c0ce9b43dc4c58507e7"
+SRCREV = "c5be2b7dfc4aaa91e44dbeb6fa42adc80936ef9d"
 
 SRC_URI = " \
             git://github.com/tanbro/pyyaml-include;protocol=https;branch=main \
-- 
2.34.1


