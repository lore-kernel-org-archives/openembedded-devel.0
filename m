Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC38C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:30:24 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.28380.1701160222325964097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="141440209"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="141440209"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:30:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B155D6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:30:18 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FA11D3F23
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:30:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FD082FC80DE;
	Tue, 28 Nov 2023 17:30:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dbus-fast: upgrade 2.14.0 -> 2.15.0
Date: Tue, 28 Nov 2023 16:29:01 +0800
Message-Id: <1701160141-28109-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10-3.973700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkpVVTEg9RDJNMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz6Q/kA8msiAbjR0
	uJd4qZ6mfWydOUCOe0lU1VxPoNC8pKX6kwKEv8Cfw2GKS55brCVL7oJusQItmyOvoYKgxjMihtx
	mZDjiPviB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107079

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Make ErrorType enums compare as strings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.14.0.bb => python3-dbus-fast_2.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.14.0.bb => python3-dbus-fast_2.15.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.14.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.15.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.14.0.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.15.0.bb
index 5ce05c383..b3cb377ec 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.15.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "91a88fea66b4e69ce73ac4c1ac04952c4fbd5e9b902400649013778a177129ea"
+SRC_URI[sha256sum] = "c98c7dfc3c589d6a5ded3427addfef1f9199525422f976e10d70a5c10558f5bf"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


