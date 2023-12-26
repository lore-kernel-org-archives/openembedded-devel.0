Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB28C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:09:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.76234.1703574536526558006
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="123395838"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="123395838"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:08:54 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E200D618A
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:08:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 950DACFF89
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:08:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F29420078B05
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:08:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B827D1A0072;
	Tue, 26 Dec 2023 15:08:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-apispec: upgrade 6.3.0 -> 6.3.1
Date: Tue, 26 Dec 2023 15:08:19 +0800
Message-Id: <1703574499-13015-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10--0.452600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu/UKSk38cGDHf9
	C9ZSAECa4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz6UHjweZ/7DHB9d
	zd4AG/QW2SwFcVpL/OucDKkJFmgghrrX6A8gIMPrZVZOeHFQTYtxGGH+vtaSjgD0ci0jOu91evZ
	kITS597iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107795

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fix conversion of deprecated flag on parameters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apispec_6.3.0.bb => python3-apispec_6.3.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.3.0.bb => python3-apispec_6.3.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.3.0.bb b/meta-python/recipes-devtools/python/python3-apispec_6.3.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-apispec_6.3.0.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.3.1.bb
index fcdcd7a80..6b9f704a6 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.3.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=824d596e050c0d5e3361efb438425945"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6cb08d92ce73ff0b3bf46cb2ea5c00d57289b0f279fb0256a3df468182ba5344"
+SRC_URI[sha256sum] = "b38e4479916d43f2b1e88ce15fc2fae93adf2e8d55cb59ec74ac66a827941483"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.34.1


