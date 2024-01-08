Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE68C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:53:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6954.1704721979421174066
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="124859036"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="124859036"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:52:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5376BDCC15
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:52:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 770192527D
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:52:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 058D06BC70
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:52:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B813C1A0072;
	Mon,  8 Jan 2024 21:52:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyflakes: upgrade 3.1.0 -> 3.2.0
Date: Mon,  8 Jan 2024 21:52:05 +0800
Message-Id: <1704721925-30917-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-2.146700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz85LGH6Xi15L6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzd1BtuB9j9kkmVz
	zA+aX2+62tRMUB1DO1srdz0UYlriJ0BOMainWJsGBbNDA7eJsrrBHMfvsUEDU/z147I0uWfyNIw
	JUdP1a2iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108159

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add support for *T (TypeVarTuple) and **P (ParamSpec) in PEP 695 annotations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyflakes_3.1.0.bb => python3-pyflakes_3.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_3.1.0.bb => python3-pyflakes_3.2.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_3.2.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_3.2.0.bb
index 11f11b776..b7ee20ebe 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_3.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "a0aae034c444db0071aa077972ba4768d40c830d9539fd45bf4cd3f8f6992efc"
+SRC_URI[sha256sum] = "1c61603ff154621fb2a9172037d84dca3500def8c8b630657d1701f026f8af3f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


