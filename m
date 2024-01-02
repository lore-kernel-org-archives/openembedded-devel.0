Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C743BC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:05:05 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.24345.1704179103021221109
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="145316496"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="145316496"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:05:00 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AC66D69D5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:04:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A7FAE1414A
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:04:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3410D6B4E0
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:04:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C150C1A0070;
	Tue,  2 Jan 2024 15:04:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis-plus-plus: upgrade 1.3.10 -> 1.3.11
Date: Tue,  2 Jan 2024 15:04:22 +0800
Message-Id: <1704179062-7936-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--1.768200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysc5SGKNk1CGxEo
	er5sO6Ai6V+wThLTbQuay7rv659o0FWSiIz6EL6ZP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6pByRBJ91zJDiMwfFTaQrQOwTo9ZXISSyeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNVprfrw0uph3DvAyUjUwVQlkzNmd1DXnQu3JmqlymTnZSb20ylpyv4tYs+qWBVNs2Z867
	MZShavo+GAE3xfCVvywGsMFRsqNQI4g39jQjFhNU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107996

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix redlock to make multiple threads be able to lock on the same RedMutex
-Asynchronously update slot-node mapping in some edge cases
-Use weak_ptr to avoid joining EvenLoop thread in itself
-Support setting connection name
-Support shard pub/sub

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{redis-plus-plus_1.3.10.bb => redis-plus-plus_1.3.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.10.bb => redis-plus-plus_1.3.11.bb} (95%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.10.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
similarity index 95%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.10.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
index 2df5e0919..3e757e603 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.10.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
@@ -8,7 +8,7 @@ DEPENDS += "hiredis"
 
 SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https \
            file://0001-CMakeLists.txt-fix-substitution-for-static-libs.patch"
-SRCREV = "8b9ce389099608cf9bae617d79d257d2cc05e12f"
+SRCREV = "ad6baa121f4c6fbc7622d83d606210ac22549c78"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


