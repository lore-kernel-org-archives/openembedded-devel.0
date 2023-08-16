Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB834C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:44:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.151835.1692150258439466080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="128229009"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="128229009"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:44:17 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D01E10881
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:44:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9150ED9688
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:44:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F81220050193;
	Wed, 16 Aug 2023 10:44:13 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-luma-oled: upgrade 3.12.0 -> 3.13.0
Date: Wed, 16 Aug 2023 09:43:43 +0800
Message-Id: <1692150223-5563-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-0.250400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKLCKVcuIo7Eq+KqsqwtV8SpUg80P/0XxDEC5
	LHJ7VXRQSeK6HRat7/xEURZbmrSwdNZa4cnL5tM2n6IGi5FShc3xlXJANHtnv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104390

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Add support for 128x128 SH1107

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-luma-oled_3.12.0.bb => python3-luma-oled_3.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.12.0.bb => python3-luma-oled_3.13.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.12.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.12.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
index 87f7ad6635..13ced6b204 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.13.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5ec447eb69733e20a55838de7e8cb991"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "af97d79fa3481d2c48b7bccfb6de349219f6d814fdc9a3dd075c7b2c71206450"
+SRC_URI[sha256sum] = "7e2a0d6a4c968c64980255d681ec27914d9abd5a66a9019b289bf3ad050c2125"
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


