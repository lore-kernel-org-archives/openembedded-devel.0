Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91459CCFA19
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:02:25 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2494.1693965737332010424
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="110357830"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="110357830"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:02:14 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0465CA1EB
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:02:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E7C34BF4A3
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:02:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5925520074717;
	Wed,  6 Sep 2023 11:02:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.174 -> 2.4.175
Date: Wed,  6 Sep 2023 10:02:03 +0800
Message-Id: <1693965723-14738-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10-3.822100-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrRWl9Bl0RPNZShcWO/83xoguV
	MctAPCgt4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLn22EcSrQBnaBl62lPHvgXFfViMFFmQDLdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtUs+0Sg2/lToT5Tyduij6ZBVmmMGwd7x+SCssVzv0hmRma7yYwdqASUtoB
	TjWkUh/c61FEbk/O/SvQF0+93xOntM6OabTdrKWHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104755

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Update Sharing group info from full object.
- Changes in msg-extract strip a character.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.174.bb => python3-pymisp_2.4.175.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.174.bb => python3-pymisp_2.4.175.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.175.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.175.bb
index d6ab0d6a88..969e4b7b5a 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.175.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "94983c01ecced6086df28133a38a297111534142"
+SRCREV = "69e660ef03108cc16a52b170e7ab4440bd202520"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


