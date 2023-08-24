Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64901C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:21:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.6397.1692865273669529347
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="108099576"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="108099576"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:20:58 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1947BA79A9
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:20:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 64969D67A7
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:20:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D2DF20093544;
	Thu, 24 Aug 2023 17:20:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-typeguard: upgrade 4.1.0 -> 4.1.2
Date: Thu, 24 Aug 2023 16:20:27 +0800
Message-Id: <1692865227-3035-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.006
X-TMASE-Result: 10-5.014900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr5sPqcQkI8ptUjspoiX02F/LI
	4hxCWana4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedp/E
	Ni4s95siBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNW51dXWkg8NvHmPPkD6k7IvgnODBVsxoMyXfesyql2n1i8eiWuj3xljzOUDKdujZEk8dD
	eGHp7O3CE5A6DY5de9AgIaJGdC0WV8I4oUq5Vga
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104582

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Fixed Any being removed from a subscript that still contains other elements
 Fixed suppress_type_checks() causing annotated variable assignments to always assign None

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_4.1.0.bb => python3-typeguard_4.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.1.0.bb => python3-typeguard_4.1.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.1.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.1.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.1.2.bb
index f64c70a72d..828e2727e3 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "b05a54bb0276eefd28880df42e004a71e699c8081fcb9d0536b2ceb01019f60c"
+SRC_URI[sha256sum] = "3be187945f9ef5a9f6d7a926dfe54babb7dfd807085ce05f9a5e8735f2487990"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


