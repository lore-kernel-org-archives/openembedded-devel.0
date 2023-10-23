Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1448C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:41:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.116067.1698050497912905944
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="138662233"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="138662233"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:41:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 70929D4240
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:41:33 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D455742C47
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:41:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 751D086F98;
	Mon, 23 Oct 2023 17:41:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-babel: upgrade 3.1.0 -> 4.0.0
Date: Mon, 23 Oct 2023 16:41:18 +0800
Message-Id: <1698050478-25539-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--0.483600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrzoS4pqkGrkPW9fCW86UUS76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AXjfR3d0weRmAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6qRl
	iiNwv4ssJo3zM+1GQdlO/Z1ro43G+bWE4LbVqlFS6fISoPzOjnJRxn2uT+qAY7ZeOOTKytjb/SP
	P1Yg4TiYCw7MKW5CSyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105664

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Dropped support for end-of-life Python 3.7. Support PyPy 3.9
Replace deprecated locked_cached_property decorator with cached_property

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-flask-babel_3.1.0.bb => python3-flask-babel_4.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-babel_3.1.0.bb => python3-flask-babel_4.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_3.1.0.bb b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-babel_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
index 610c40f84d..4d8aee532c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-babel_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_4.0.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "i18n and l10n support for Flask based on babel and pytz"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9"
 
-SRC_URI[sha256sum] = "be015772c5d7f046f3b99c508dcf618636eb93d21b713b356db79f3e79f69f39"
+SRC_URI[sha256sum] = "dbeab4027a3f4a87678a11686496e98e1492eb793cbdd77ab50f4e9a2602a593"
 
 PYPI_PACKAGE = "flask_babel"
 
-- 
2.34.1


