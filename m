Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059B4C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:54:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.1653.1705974848905305800
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146943403"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146943403"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:54:07 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ADF44A3124
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:54:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F13ECD219E
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:54:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83A3F6B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:54:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0AB8F1A006A;
	Tue, 23 Jan 2024 09:54:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pdm: upgrade 2.11.2 -> 2.12.1
Date: Tue, 23 Jan 2024 09:52:18 +0800
Message-Id: <1705974738-26150-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJon585nKQczq7uce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFOgPJLZZor7FlQrXx01SgIVOnA
	OgPYYQAasCXAdr2FZ6UTEEFIHiCNzIX/oxFqJEOSoLPJXZOHu1n2Q5gccsBDSOuk1bFvGBn+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108418

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Hotfix: missing identifier attribute for package type fixer. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.11.2.bb => python3-pdm_2.12.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.11.2.bb => python3-pdm_2.12.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.11.2.bb b/meta-python/recipes-devtools/python/python3-pdm_2.12.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.11.2.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.12.1.bb
index f8a593c2b..1ae40a7c4 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.12.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "5b31255c48d4aca596c73fb872a82848cbe8ff92f008712a9a264455247063ee"
+SRC_URI[sha256sum] = "39a2aba19986c945a79bf584c3775285e24e9c7f8ed8a603815b61c5fac5db4c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


