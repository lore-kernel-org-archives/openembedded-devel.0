Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF53C02187
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.40069.1736843353794222573
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cQCMmAHT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843353; x=1768379353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DMe/j/wkLM2CMyouAlSY9ydu7ZWwnO2DFuDN8Npi5nc=;
  b=cQCMmAHTLVoh8IMGusgZJu6kyAM2/lHrdrlqo3kzMswvSX4PRER5eKCk
   MbpTs+9l/alpYe9Dhk0mD/Ltols0iYRjUENxcZ83gYsKgY0jdV4M00jWx
   onnuAvAumoASmAzMa4CzdKDgMGL6hinUfHr/5n+6s9lb9NA/BvkAJ1rzu
   s1YKN9p9uCzFXGJRi0jJaTY+Dmyw0bj/pFFZsPCtT60cmFbnE7oxkzpPs
   YRMcHVfEug/zDWdKnB0WVvtauHJfGDIUN5Pu99dlEzSNR6JzMGuJoyQJN
   IfZx9PoelqpenD5AtDBeo+BexgWYv1d+B8/RhBgHyRfsIYqJOKDs7ChRM
   Q==;
X-CSE-ConnectionGUID: X/MG6Yb0SH2a1CCzPmTfww==
X-CSE-MsgGUID: QV2tdqtjSgOcwzMNJfGORA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="186709529"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="186709529"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:11 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7671FD500C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DA4AD5093
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0F4A6B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:08 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F3BA1A000B;
	Tue, 14 Jan 2025 16:29:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/30] python3-gnupg: upgrade 0.5.3 -> 0.5.4
Date: Tue, 14 Jan 2025 16:28:38 +0800
Message-Id: <1736843329-4131-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62Sw4egtRxjG6z8TzO8AYnxzxazl74u+gdQFjIkocUNjuXxuK
	ce74Xgj09bRO3RvOjYZU8Zv/ifAS4/r8ctMKknlwAKFUYDtnGaS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114863

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix #242: Handle exceptions in the on_data callable.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gnupg_0.5.3.bb => python3-gnupg_0.5.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.5.3.bb => python3-gnupg_0.5.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.5.3.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.5.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.5.3.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.5.4.bb
index 8c231dce14..5de9a7be0e 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.4.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dabe659eadd6d97325b1582e41cfc11"
 
 PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "290d8ddb9cd63df96cfe9284b9b265f19fd6e145e5582dc58fd7271f026d0a47"
+SRC_URI[sha256sum] = "f2fdb5fb29615c77c2743e1cb3d9314353a6e87b10c37d238d91ae1c6feae086"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


