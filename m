Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA28BC04FE0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:38 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7633.1690875734649116257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105920462"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105920462"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F269DB3C7
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B0801CF7CA
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F2BE10211;
	Tue,  1 Aug 2023 16:42:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tomlkit: upgrade 0.11.8 -> 0.12.1
Date: Tue,  1 Aug 2023 15:41:52 +0800
Message-Id: <1690875717-21608-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-2.705700-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrXs5nqGvDCfNs1Ir4NZzFmpKy
	Pf1j7t43RrhA8w8T1ITSWUUEZVF85cRBLZ5x+SkXP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsO8j2/Qpcz48RY1tl9vG/AY7Cl8sx4HBG4OpkJE16YK7Ahn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUP5Hs7/FxjgPkZPvmFamLuWMGr
	RHZbLizkMQalx6JQeWJyeTaZqSeU7+0d5O+9rkpL+MIpdsDSTldbgPIHFnn4/sqOecvGqHj7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104193

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
========
  Make float and int hashable.
  Allow users to specify encoders for custom types.
  Fix the incorrect sort when building a table with dotted keys.
  Complete the methods required for integer and float items.
  Replace the deprecated usage of datetime.utcnow().
  Minor performance improvements when iterating over the escape sequences. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tomlkit_0.11.8.bb => python3-tomlkit_0.12.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.11.8.bb => python3-tomlkit_0.12.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
index 5ec7e6e9af..e86a3c7898 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "9330fc7faa1db67b541b28e62018c17d20be733177d290a13b24c62d1614e0c3"
+SRC_URI[sha256sum] = "38e1ff8edb991273ec9f6181244a6a391ac30e9f5098e7535640ea6be97a7c86"
 
 inherit pypi python_poetry_core ptest
 
-- 
2.34.1


