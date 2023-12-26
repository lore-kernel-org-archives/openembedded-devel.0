Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5892FC46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:03:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.76195.1703574197017966500
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="133012471"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="133012471"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:03:14 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BD32D772A
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:03:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B2938D3F24
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:03:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 46B9E2005019B
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:03:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D8C571A0072;
	Tue, 26 Dec 2023 15:03:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] jq: upgrade 1.7 -> 1.7.1
Date: Tue, 26 Dec 2023 15:01:07 +0800
Message-Id: <1703574067-12806-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10--4.717900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyumQTCqZT6QS/UJ
	N7+Ijuvuy7jDpn+16bv4oVzKUrUSWYrU8GWDEDNh8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQfiq
	1gj2xET8qqtDuUtwyfM+iRK5D7iW3+y9quXR/V2ADfgpjSDkFN7SgyqRj33XJgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcs1Ehdeka0ICimPOAedTi7O/+fMO4Ds7UACwC
	kDctrCo56IVggBZ/zCOK/GIAnzLVgSbG+SLag3MlWv/+PwSguQWsvvLNas25v6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107790

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- CVE-2023-50246: Fix heap buffer overflow in jvp\_literal\_number\_literal
- CVE-2023-50268: fix stack-buffer-overflow if comparing nan with payload

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/jq/{jq_1.7.bb => jq_1.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.7.bb => jq_1.7.1.bb} (95%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
similarity index 95%
rename from meta-oe/recipes-devtools/jq/jq_1.7.bb
rename to meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 5c2e3aae8..6b1233551 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -12,7 +12,7 @@ GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://run-ptest \
     "
-SRC_URI[sha256sum] = "402a0d6975d946e6f4e484d1a84320414a0ff8eb6cf49d2c11d144d4d344db62"
+SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 
 inherit autotools github-releases ptest
 
-- 
2.34.1


