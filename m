Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D5FC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:40:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.28530.1701160811987212607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="129590523"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="129590523"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:40:09 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 531D4D4F5B
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:40:07 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 74C70D3F1D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:40:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F4718418A;
	Tue, 28 Nov 2023 17:40:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.1 -> 2.5.2
Date: Tue, 28 Nov 2023 16:38:34 +0800
Message-Id: <1701160714-28412-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10--0.503600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxs1Ir4NZzFmsEj
	oFgm7EFKXkAdogeWcpua/3zDweDPK+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4k8EtpVA6crmrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNepA4NlCHKVYRJUCXpTiuczmp6DlJvq9hXzqOiMSSczLa9SizQG6nqLpG0OQhhqOQMqLk
	kMoytVtVL+d6p7j+6QZqKa5kB95a2JbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107086

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-uprev pydantic-core to 2.14.5
-Add ConfigDict.ser_json_inf_nan
-Fix validation of Literal from JSON keys when used as dict key
-Fix bug re custom_init on members of Union
-Fix JsonValue bool serialization
-Fix handling of unhashable inputs with Literal in Unions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_2.5.1.bb => python3-pydantic_2.5.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.5.1.bb => python3-pydantic_2.5.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.5.1.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
index 609411fe1..3750d49a9 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.5.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "0b8be5413c06aadfbe56f6dc1d45c9ed25fd43264414c571135c97dd77c2bedb"
+SRC_URI[sha256sum] = "ff177ba64c6faf73d7afa2e8cad38fd456c0dbe01c9954e71038001cd15a6edd"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


