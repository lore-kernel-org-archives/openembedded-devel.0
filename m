Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5F9C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:37:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.1338.1705973848293871570
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146787510"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146787510"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:37:16 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DA61A3133
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:37:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 641F1CFAB0
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:37:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EBBAA26638D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:37:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 950381A006A;
	Tue, 23 Jan 2024 09:37:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-beautifulsoup4: upgrade 4.12.2 -> 4.12.3
Date: Tue, 23 Jan 2024 09:32:39 +0800
Message-Id: <1705973559-25506-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-0.090200-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrUb+p9cXL9hNudFA5SQQUhjnG
	P45AxioiKVgllcEszwvVk154nKAeGDuZPz8QQL7+EzEoOqAAVLNUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw4rCLswi3NpjRC26qzoFs8nYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD7q9UFRTJ0kKxEHRux+uk8hxKpvEGAbTDkRwc
	uTDLF2HunZfPn42CLNzmGhPSXk509s9MaupeyrxU6tgk5okideINHfLQQnZd+OFWpRrA6OLG1LE
	ZAtFnM4GbbSW+TVNJYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108403

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* The Beautiful Soup documentation now has a Spanish translation
* Fixed a regression such that if you set .hidden on a tag
* Fixed a case where html.parser giving up on
  markup would result in an AssertionError instead of a
  ParserRejectedMarkup exception.
* Added the correct stacklevel to instances of the XMLParsedAsHTMLWarning.
* Corrected the syntax of the license definition in pyproject.toml.
* Corrected a typo in a test that was causing test failures when run against
  libxml2 2.12.1.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...eautifulsoup4_4.12.2.bb => python3-beautifulsoup4_4.12.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.12.2.bb => python3-beautifulsoup4_4.12.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.2.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.2.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
index 7eb2d7c34..628309877 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
-SRC_URI[sha256sum] = "492bbc69dca35d12daac71c4db1bfff0c876c00ef4a2ffacce226d4638eb72da"
+SRC_URI[sha256sum] = "74e3d1928edc070d21748185c46e3fb33490f22f52a3addee9aee0f4f7781051"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


