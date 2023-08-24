Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ADAC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:12:54 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.6290.1692864764041054528
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="117554814"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="117554814"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:12:41 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EB6FFCD7E2
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:12:38 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 253E8D6024
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:12:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 404702FC5EBE;
	Thu, 24 Aug 2023 17:12:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-click: upgrade 8.1.6 -> 8.1.7
Date: Thu, 24 Aug 2023 16:12:00 +0800
Message-Id: <1692864720-2504-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10--0.849400-10.000000
X-TMASE-MatchedRID: S1yJccRFTky7qz8f6326on1zro62qhdCpxAd6mi1Ga14YeSlHZYFoptX
	hf4dcLJZbSL9AN4UjlvWLWhvM11/A00HnCJfuh4HA9lly13c/gEcn2AGT+ezaAfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiDAixBlu3NnC5x7uAXGEprQFA6pSxaDHmAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMWeMpVNhsMwMRB0bsfrpPIcSqbxBgG0w599wLOmNRmGqo1w
	g4co9uuM5L6E3ub3LyzrpxACIBiZaSiFuRyApGDJbLFvOo/IVjbnIpvUAbGrm0/IE8HLvKxiohB
	uGpb3m6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104569

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fix issue with regex flags in shell completion.
Bash version detection issues a warning instead of an error.
Fix issue with completion script for Fish shell.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-click_8.1.6.bb => python3-click_8.1.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-click_8.1.6.bb => python3-click_8.1.7.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-click_8.1.6.bb b/meta-python/recipes-devtools/python/python3-click_8.1.7.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-click_8.1.6.bb
rename to meta-python/recipes-devtools/python/python3-click_8.1.7.bb
index 4858c9e359..a4ec6cd1ef 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.1.7.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "48ee849951919527a045bfe3bf7baa8a959c423134e1a5b98c05c20ba75a1cbd"
+SRC_URI[sha256sum] = "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


