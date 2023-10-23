Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEF2C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:41:25 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.136458.1698104481425152487
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="125245308"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="125245308"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:41:18 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D34DD3EA9
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:41:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BDD4CDA220
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:41:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EE4A26BA6C;
	Tue, 24 Oct 2023 08:41:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.6.3 -> 1.6.4
Date: Tue, 24 Oct 2023 07:40:57 +0800
Message-Id: <1698104457-31978-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10--1.230300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvozDhGeQC9Ejx4
	rrTwcxZW4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZPjSKtQ5PQ/xbN/ckWm0QEJtNIlbc7vrTE4oHhLfjV9ZfUBhycqwZZOkqst34CkxwtfL
	bPT67cbbvXmwXbtWTvWgKA/zQp0+ujgMZI4KJ30U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105702

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix #952, add support for HTTP 307 and 308 redirect codes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...socket-client_1.6.3.bb => python3-websocket-client_1.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.6.3.bb => python3-websocket-client_1.6.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.6.3.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.6.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.6.4.bb
index 8104d37599..961cdb916c 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.6.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6eae3bb7247ccb2c3a087ea8de759c01"
 
-SRC_URI[sha256sum] = "3aad25d31284266bcfcfd1fd8a743f63282305a364b8d0948a43bd606acc652f"
+SRC_URI[sha256sum] = "b3324019b3c28572086c4a319f91d1dcd44e6e11cd340232978c684a7650d0df"
 
 inherit pypi setuptools3
 
-- 
2.34.1


