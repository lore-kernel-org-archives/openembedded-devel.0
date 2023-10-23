Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1897C25B41
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:40:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.116046.1698050425809763920
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137174215"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137174215"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:40:24 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CE4D8D29E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:40:21 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C528D9467
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:40:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E96FF2FC8541;
	Mon, 23 Oct 2023 17:40:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-utils: upgrade 2.2.1 -> 2.2.2
Date: Mon, 23 Oct 2023 16:40:07 +0800
Message-Id: <1698050407-25465-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--1.874600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxHaB5v9ZGyDnw6
	H06bMgivAU6hHhq84xwNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4iiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0X9r
	pBZuBDbSbjRaJ5IfNmRRMr3Ire3QMJ6F2bj/Ahyy2h9sL/QIPA8fwzXreUQy93pVNCJpZn/xMQ8
	TSh+mn9R7bIgq0rLpFvEv7vq7e8ffIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105662

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add information to docs for utilities which did not have any.
-Pull latest from template repo to fix release script, update wording in
 comments and docs. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-utils_2.2.1.bb => python3-eth-utils_2.2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_2.2.1.bb => python3-eth-utils_2.2.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_2.2.1.bb b/meta-python/recipes-devtools/python/python3-eth-utils_2.2.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-utils_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_2.2.2.bb
index bace620eef..839e8cd9a1 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_2.2.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "f79a95f86dd991344697c763db40271dbe43fbbcd5776f49b0c4fb7b645ee1c4"
+SRC_URI[sha256sum] = "5ca6265177ce544d9d43cdf2272ae2227e5d6d9529c270bbb707d17339087101"
 
 inherit pypi setuptools3
 
-- 
2.34.1


