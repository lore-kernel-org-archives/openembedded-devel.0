Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF68C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:56:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.17823.1702544171448012213
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="130968637"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="130968637"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:56:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0673BD7AC6
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:56:07 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B080156D1
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:56:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F00386A76;
	Thu, 14 Dec 2023 17:56:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-greenlet: upgrade 3.0.1 -> 3.0.2
Date: Thu, 14 Dec 2023 16:55:49 +0800
Message-Id: <1702544149-27990-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10--3.266600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqywZuykSn6+/FYM
	JR3dIrh2+FyTwBk2ojxxefTIh2KtJT13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtlWnoPpNxFKtY11e7R23YdWRyAGCXpMGE7z8xkutqUd1EZ4Ipmtg71bllR
	7pGivJxylZxuVnYHgcJNJwuKzA5lx2IR1OyD1biHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107437

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Packaging: Add a minimal "pyproject.toml" to sdists.
- Packaging: Various updates to macOS wheels.
- Fix a test case on Arm32. Note that this is not a supported platform

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.0.1.bb => python3-greenlet_3.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.0.1.bb => python3-greenlet_3.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
index 523c2b6b2..337bd95a6 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.2.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "816bd9488a94cba78d93e1abb58000e8266fa9cc2aa9ccdd6eb0696acb24005b"
+SRC_URI[sha256sum] = "1c1129bc47266d83444c85a8e990ae22688cf05fb20d7951fd2866007c2ba9bc"
 
 inherit pypi setuptools3
-- 
2.34.1


