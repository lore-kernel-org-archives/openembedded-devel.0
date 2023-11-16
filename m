Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98A5C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:26:46 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2750.1700123197017986611
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="118691546"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="118691546"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:26:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A494D6186
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:26:32 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5B59D208F
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:26:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id E01DE88599;
	Thu, 16 Nov 2023 17:26:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 3.11.0 -> 4.0.0
Date: Thu, 16 Nov 2023 16:19:59 +0800
Message-Id: <1700122799-22227-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10-1.452200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrFei5YP5NvsJjvA9ERrks6L6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74C0oMqkY991yYFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKbIKvNVLwMhKsi5FmIdk731GHbhAxJltFGTk
	97ynoOXJpeIaWg6jlaCvCDkkeC+SAlAKHCl39+Zky3PIftWt0F3crPfzGBsyj+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106793

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 site_cache_dir: Use /var/cache again instead of /var/tmp on UNIX

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-platformdirs_3.11.0.bb => python3-platformdirs_4.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.11.0.bb => python3-platformdirs_4.0.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.0.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.0.0.bb
index 5a65d6770..5a33be400 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.0.0.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "cf8ee52a3afdb965072dcc652433e0c7e3e40cf5ea1477cd4b3b1d2eb75495b3"
+SRC_URI[sha256sum] = "cb633b2bcf10c51af60beb0ab06d2f1d69064b43abf4c185ca6b28865f3f9731"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


