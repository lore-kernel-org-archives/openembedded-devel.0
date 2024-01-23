Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C67C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:50:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.1564.1705974615515426196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="135331289"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="135331289"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:50:12 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A24C3A313B
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:50:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7C50D3F23
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:50:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A82720074726
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:50:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1964B1A006A;
	Tue, 23 Jan 2024 09:50:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.113.0 -> 2.114.0
Date: Tue, 23 Jan 2024 09:49:47 +0800
Message-Id: <1705974587-26037-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-1.445100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xIwS+fKi1+IroIB
	CrHXdfvc4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNSoBv32SuKPVQHHLhhFRhp//fYngVUwrPDMN5fbR6eK9+BYwUoZ3yZqzZmVzNCtF6boHM
	TzFRPgEhtEIxIKFryVRlf9Q6ILJH4JXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108415

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.113.0.bb => python3-google-api-python-client_2.114.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.113.0.bb => python3-google-api-python-client_2.114.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.113.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.114.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.113.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.114.0.bb
index 4e6bb7daf..9564bff70 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.113.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.114.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "bcffbc8ffbad631f699cf85aa91993f3dc03060b234ca9e6e2f9135028bd9b52"
+SRC_URI[sha256sum] = "e041bbbf60e682261281e9d64b4660035f04db1cccba19d1d68eebc24d1465ed"
 
 inherit pypi setuptools3
 
-- 
2.34.1


