Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA0FC4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:41:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.17635.1702543265459212524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143159783"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143159783"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:41:03 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7026DD9DA3
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:41:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BD7ED94DB
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:41:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B79E4202DB306;
	Thu, 14 Dec 2023 17:40:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ansi2html: upgrade 1.8.0 -> 1.9.1
Date: Thu, 14 Dec 2023 16:40:10 +0800
Message-Id: <1702543210-27345-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10--1.104300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv/mj0E9XMZRqm7
	Ppyf7RSRraob308tFzchCBJ5VoC96Rg0GSqyZqi6ecskYZl7mzBUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmip4Yp7RFk6SfdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtFeoZrastUAKxucE8kw2UTapvtBnoFymGqXuKOvUU6ri2xzB+lvQ6pws8H
	SZBX6EflyIm93j82smr7Z7Zymi+r7pYyww2UJX2HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107423

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Enable testing with py312
-Fix project description
-Fix RTD builds
-tests/test_ansi2html.py: use sys.executable instead of hardcoded python3
-Replace optparse with argparse
-Replace sphinx with mkdocs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ansi2html_1.8.0.bb => python3-ansi2html_1.9.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ansi2html_1.8.0.bb => python3-ansi2html_1.9.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
index 8dcd7b0d5..82b8ef37e 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-3.0-only"
 
 PYPI_PACKAGE = "ansi2html"
 
-SRC_URI[sha256sum] = "38b82a298482a1fa2613f0f9c9beb3db72a8f832eeac58eb2e47bf32cd37f6d5"
+SRC_URI[sha256sum] = "5c6837a13ecc1903aab7a545353312049dfedfe5105362ad3a8d9d207871ec71"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


