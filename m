Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF57C46CA3
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:32:04 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.28398.1701160318422273544
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="142787452"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="142787452"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:31:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FFF2C137B
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:31:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C3317BF49D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:31:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B46ED8859E;
	Tue, 28 Nov 2023 17:31:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-humanize: upgrade 4.8.0 -> 4.9.0
Date: Tue, 28 Nov 2023 16:30:17 +0800
Message-Id: <1701160217-28148-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10-2.094600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzG6iWKMNj1gJZh
	jmb07zEXnagaYWxMXQgUH8PmWo2hhbBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKYhMTcdVKb+FeBzEkCCpnRndCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtSx+wDKXiy9kUaO0eIhSSCf9mHFQYo856gfjD0makeOUwUrRHZK55RryKX
	1qeKn+FmPV8C6d2Iqyiy1IjcZiBYovn/QDYq6TUHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107080

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add support for Python 3.13
-Add Norwegian localization
-Add Hebrew localization
-Add Klingon translation
-Replace Flake8 with Ruff
-Fix DeprecationWarning: Plural value must be an integer, got float
-Remove useless shebangs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.8.0.bb => python3-humanize_4.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.8.0.bb => python3-humanize_4.9.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.8.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-humanize_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb
index aa56a9011..d74070876 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.9.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "9783373bf1eec713a770ecaa7c2d7a7902c98398009dfa3d8a2df91eec9311e8"
+SRC_URI[sha256sum] = "582a265c931c683a7e9b8ed9559089dea7edcf6cc95be39a3cbc2c5d5ac2bcfa"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


