Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BB2C001DE
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2280.1687157424694865802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="100718884"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="100718884"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C0CDCA1EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:20 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 69014D88B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 840CD2FC8457;
	Mon, 19 Jun 2023 15:50:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-mock: upgrade 3.10.0 -> 3.11.1
Date: Mon, 19 Jun 2023 14:48:12 +0800
Message-Id: <1687157308-17342-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-0.921200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgPHjBIcyvbaoNG
	5puei0OkVoPGGDGJ1Sn5fIu2trOcXe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3rrjPebt7kkbHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7uNC
	fYtZR5ow2ueK2TixB9frnzvZCVTIH7pVcsLFqswMywBbstBKKPHaqCrTLchZVDzkjLiyACpSfes
	YfGiw6X/KVpEsXxRICCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103364

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Fixed introspection for failed assert_has_calls (#365).
 Updated type annotations for mocker.patch and mocker.spy (#364).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-mock_3.10.0.bb => python3-pytest-mock_3.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-mock_3.10.0.bb => python3-pytest-mock_3.11.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
index bf5bc250a..69d74567c 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.11.1.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV ?= "6c03dfd4240de4a178bab67c0a32fba28d8bcf91"
+SRCREV ?= "d3e73f2e93f7b93eba0a36e17e43bafd969da4fe"
 
 SRC_URI[sha256sum] = "fbbdb085ef7c252a326fd8cdcac0aa3b1333d8811f131bdcc701002e1be7ed4f"
 
-- 
2.34.1


