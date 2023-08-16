Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC649C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:44:45 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.152066.1692150282163325342
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="116321770"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="116321770"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:44:39 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B063AD3EA3
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:44:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ECF3FF814
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:44:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 75FE221F78C;
	Wed, 16 Aug 2023 10:44:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 3.9.1 -> 3.10.0
Date: Wed, 16 Aug 2023 09:44:07 +0800
Message-Id: <1692150247-5601-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--0.277800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysBqTWBO7g4fr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74C0oMqkY991yYFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKtlA0Czbn39Ox9MBItKwNC8P5wwTmjsATUzX
	ERIPAKq556Zn6nN1X8IbzJStkYG9o+/AkrCirAek7KQo+2WBWv8PqLRgSfuVX+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104391

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Fix docs build failure
platformdirs: introduce site_runtime_dir

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-platformdirs_3.9.1.bb => python3-platformdirs_3.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.9.1.bb => python3-platformdirs_3.10.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
index c52d9d2169..264b06d676 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.10.0.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "1b42b450ad933e981d56e59f1b97495428c9bd60698baab9f3eb3d00d5822421"
+SRC_URI[sha256sum] = "b45696dab2d7cc691a3226759c0d3b00c47c8b6e293d96f6436f733303f77f6d"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


