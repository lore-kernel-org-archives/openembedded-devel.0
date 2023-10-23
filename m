Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12201C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:58:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.116591.1698051509891530359
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="124890792"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="124890792"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:58:27 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2673DDC77
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:58:25 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D360D9467
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:58:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7505786F98;
	Mon, 23 Oct 2023 17:58:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.4.1 -> 2.4.2
Date: Mon, 23 Oct 2023 16:57:37 +0800
Message-Id: <1698051457-26225-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--1.083000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNR3Y7kpVKWrn0JL
	NSh4QSBd0/R8dJ7wiQENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJRFHBShklV4UC4xNfx9pao5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbeZeCl12h7qqQ3Fobr+yRsiLDvaMGsBaE9cUi9Qs5mmo7kBsChanaSCP1f1xcVczxu7cw
	BQ5G8Scz5/5nQqEdPGg33WVKhDanvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105681

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Fix bug with JSON schema for sequence of discriminated union
Fix schema references in discriminated unions
Fix json schema generation for recursive models
Fix models_json_schema for generic models
Fix xfailed test for generic model signatures

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_2.4.1.bb => python3-pydantic_2.4.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.4.1.bb => python3-pydantic_2.4.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.4.1.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.4.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.4.2.bb
index 6d06650eb0..a83789d977 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.4.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "b172505886028e4356868d617d2d1a776d7af1625d1313450fd51bdd19d9d61f"
+SRC_URI[sha256sum] = "94f336138093a5d7f426aac732dcfe7ab4eb4da243c88f891d65deb4a2556ee7"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


