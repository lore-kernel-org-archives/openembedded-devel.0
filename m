Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47DAC072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:38:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.13904.1700635109858203302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="128884812"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="128884812"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:38:27 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 51B29D6194
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:38:25 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 935E815802
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:38:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A14287FE4;
	Wed, 22 Nov 2023 15:38:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.0 -> 2.5.1
Date: Wed, 22 Nov 2023 14:32:42 +0800
Message-Id: <1700634762-8233-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.005
X-TMASE-Result: 10--1.007600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuvY+2jZ6Y7ZWsW
	ZV9YMDBbQqQbeumwtdJkHkhZG636SW94Ipa1otxoP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiF7M/D8JRnBg3dCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtjzWBcu6imRVSFQ5oTIx5EEK040Qbcm9y2N1hTNTbARkKQLkXbKWNbG5oG
	5/VL/B9Wxu5bqWZSYA8yV2Qt9jVWdEErjm8B8KpHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107003

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-uprev pydantic-core to 2.14.3
-Fix package description limit
-Fix ValidateCallWrapper error when creating a model which has a
 @validate_call wrapped field annotation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_2.5.0.bb => python3-pydantic_2.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.5.0.bb => python3-pydantic_2.5.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.5.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.5.1.bb
index 21be58e08..609411fe1 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "69bd6fb62d2d04b7055f59a396993486a2ee586c43a0b89231ce0000de07627c"
+SRC_URI[sha256sum] = "0b8be5413c06aadfbe56f6dc1d45c9ed25fd43264414c571135c97dd77c2bedb"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


