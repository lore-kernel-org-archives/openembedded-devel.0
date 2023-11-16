Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C574AC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:39:56 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2952.1700123995173751817
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139861831"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139861831"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:39:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D1B45D9D92
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:39:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 06F2ED561C
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:39:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42A1D70B02;
	Thu, 16 Nov 2023 17:39:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.11.2 -> 6.11.3
Date: Thu, 16 Nov 2023 16:38:11 +0800
Message-Id: <1700123891-22651-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--5.721700-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9dnyL8x0tKlO9Uc
	StYMaHX/zwuL+DIlWw6qLHYw/Ac7JlXge4zpAX3dag//jiWuh4MzNsXWBvGVBnhh5KUdlgWiXFx
	o8bkiqTwnajXSbZssEvYnOrrJm4Gprl4gMPWmkhQK3Ma88LL+bgv/9UzFeXITJYvGOWtLLy9dty
	ovrIDmzPhxVIsrPpAADcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4Ixtofra
	Cyyl8ERgZBEjCNOXeIojn9TQ5wiPq1i/8UCZ5uOngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiTP1uK8x0C2Rw/ii8Dys0s2fcZoiK6ZvRq8ITfsjHbrDn7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106803

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-When coming back through the middleware onion after a request is made, we have
 the response id. Use it to match to the cached request information and process
 the response accordingly.
-Adds Discord bot template repo to Resources page
-Additional contract abi documentation to make it a clear requirement for
 contract instances.
-Fix type annotations for web3 constants.
-Add upper pin to deprecated dependency lru-dict whose new minor version release
 introduced a typing issue with CI lint builds.
-Recompile test contracts with new Solidity version v0.8.23 to ensure compatibility.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.11.2.bb => python3-web3_6.11.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.11.2.bb => python3-web3_6.11.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb b/meta-python/recipes-devtools/python/python3-web3_6.11.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-web3_6.11.2.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.11.3.bb
index 8cc5dd728..2c7aca9ba 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.11.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "77340b9a8109835a680950e09f21ae77e41ea38076215ab8be2ba4bee7b8034a"
+SRC_URI[sha256sum] = "f9bec9d2339bf649fe25293435a5c897a4b035aa96d6c33670ed467acf59dbe7"
 
 inherit pypi setuptools3
 
-- 
2.34.1


