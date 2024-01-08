Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3377BC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:44:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.6876.1704721453514141909
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145305234"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145305234"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:44:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 161A2D9D8F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:44:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 413E9D4BC1
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:44:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CBE18202D4AB8
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:44:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 80D701A0072;
	Mon,  8 Jan 2024 21:44:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohttp-jinja2: upgrade 1.5.1 -> 1.6
Date: Mon,  8 Jan 2024 21:43:59 +0800
Message-Id: <1704721439-30617-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--2.311600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrSExHL6o3BeDqWOQST6GEBwQF
	TLnXm7yY4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2bmyqTXHGxLIlNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJ9g5dcXFxJVXv2SgjlAU3k92upjf3QbnrXwdaJf7hVJPOWSBz5/akuvXp8UOE9I6jxcXo
	4KIem7wghtAeM2ar3wf4AVYYM8H8/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108152

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Switch to aiohttp.web.AppKey, and deprecate the old 'static_root_url' key.
-Drop Python 3.7, add Python 3.12.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-aiohttp-jinja2_1.5.1.bb => python3-aiohttp-jinja2_1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp-jinja2_1.5.1.bb => python3-aiohttp-jinja2_1.6.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
index 4c4ed3ffd..694f577b0 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.6.bb
@@ -3,7 +3,7 @@ SUMMARY = "jinja2 template renderer for aiohttp.web (http server for asyncio)"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=29dca541e03964615590ca7b50392d97"
 
-SRC_URI[sha256sum] = "8d149b2a57d91f794b33a394ea5bc66b567f38c74a5a6a9477afc2450f105c01"
+SRC_URI[sha256sum] = "a3a7ff5264e5bca52e8ae547bbfd0761b72495230d438d05b6c0915be619b0e2"
 
 inherit pypi setuptools3
 
-- 
2.34.1


