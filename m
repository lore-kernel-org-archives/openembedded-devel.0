Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5C0C88CB4
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.3821.1686620448027044036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108574472"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108574472"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:41:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DD2B1C6811
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 232EBD5E8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B7FD20074724;
	Tue, 13 Jun 2023 10:40:56 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.5.2 -> 1.5.3
Date: Tue, 13 Jun 2023 09:40:19 +0800
Message-Id: <1686620422-29962-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--3.020300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyZtziFUn+D+UOp
	9fPjoo9to7X3fw0NGZie5yFLdY+IPADNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsLJjQpIWhSuM3PhwfmFb3pg7Cl8sx4HBG1XgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZI+i0VtxUMwaWY77bMVpN8SgAJZECnTA+7Ph18sJuNwMbshz
	QDkB4x5p71gZTLkP7pXIJHYb700Xfv+w5qm0ZukqT9W2OZ5WtFLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103246

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 - Add logic to avoid error in the case where content-length header does not exist, bug introduced in 1.5.2 (#911)
 - Fix wsdump.py script typing, bug introduced in 1.5.2 (#91)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...socket-client_1.5.2.bb => python3-websocket-client_1.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.5.2.bb => python3-websocket-client_1.5.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.2.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb
index 742a9389b..f7650f9bb 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
 
-SRC_URI[sha256sum] = "c7d67c13b928645f259d9b847ab5b57fd2d127213ca41ebd880de1f553b7c23b"
+SRC_URI[sha256sum] = "b96f3bce3e54e3486ebe6504bc22bd4c140392bd2eb71764db29be8f2639aa65"
 
 inherit pypi setuptools3
 
-- 
2.34.1


