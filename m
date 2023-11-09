Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA35C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 04:36:42 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.114845.1699504599589476779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 20:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="127385199"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="127385199"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:36:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D606D4F51
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:36:35 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 60A21C8BFE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:36:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 318D82FC8194;
	Thu,  9 Nov 2023 13:36:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] function2: upgrade 4.2.3 -> 4.2.4
Date: Thu,  9 Nov 2023 12:35:26 +0800
Message-Id: <1699504526-16419-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27986.002
X-TMASE-Result: 10-0.319000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysTxwvzfR5Qyr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AXjfR3d0weRm1/OiWPM9c7RgN
	lpoj6q+5Y5Eh/SzoiVnVgf6iGPAIAeBzEkCCpnRloMLOoNHsM9lXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIIDjxG5VI5Vbvioo+LbZ+yqaPlT0S/1IE3GN4LlkbKewNhL
	VwN4fPfIBtfe8Q1HyWzGLRUsINqDwrtE8zlbYEbagsRglwbnaJLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 04:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106498

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog: Fix warning for windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../function2/{function2_4.2.3.bb => function2_4.2.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/function2/{function2_4.2.3.bb => function2_4.2.4.bb} (92%)

diff --git a/meta-oe/recipes-support/function2/function2_4.2.3.bb b/meta-oe/recipes-support/function2/function2_4.2.4.bb
similarity index 92%
rename from meta-oe/recipes-support/function2/function2_4.2.3.bb
rename to meta-oe/recipes-support/function2/function2_4.2.4.bb
index 599c490359..2748b84f7c 100644
--- a/meta-oe/recipes-support/function2/function2_4.2.3.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Provides improved implementations of std::function."
 HOMEPAGE = "https://naios.github.io/function2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-SRCREV = "9e303865d14f1204f09379e37bbeb30c4375139a"
+SRCREV = "a354bd093d2b6e50c9325dbce84d20b4e77aabc6"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https"
-- 
2.34.1


