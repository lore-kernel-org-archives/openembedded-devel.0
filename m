Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54FEC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:41:04 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.1362.1705974058985517490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="125716683"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="125716683"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:40:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 30CF7D618E
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:40:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 738A1CFBA4
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:40:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F178320059322
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:40:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9121B1A006A;
	Tue, 23 Jan 2024 09:40:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cbor2: upgrade 5.5.1 -> 5.6.0
Date: Tue, 23 Jan 2024 09:39:21 +0800
Message-Id: <1705973961-25606-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzxQl5oSjXy6lmFp
	vph107Tby+qgWoV6E8Gw4IG8kv9gebqjBt7chcgjo3mnYWTBY74rpR1f9mjbqUIRYylHR1f0cOE
	RxUyS90iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108405

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  https://cbor2.readthedocs.io/en/latest/versionhistory.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_5.5.1.bb => python3-cbor2_5.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.5.1.bb => python3-cbor2_5.6.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.5.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.5.1.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.6.0.bb
index c8cfaa8aa..41793aaa4 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.0.bb
@@ -4,7 +4,7 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "f9e192f461a9f8f6082df28c035b006d153904213dc8640bed8a72d72bbc9475"
+SRC_URI[sha256sum] = "9d94e2226f8f5792fdba5ab20e07b9bfe02e76c10c3ca126418cd4310439d002"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


