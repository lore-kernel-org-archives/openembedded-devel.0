Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B625FC54E58
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:43:47 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7723.1709714623199855872
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O01NvVqR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714623; x=1741250623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bPGE7ZiRICsQjhmcUFxKXqBuak1BwA9beC2oXqC3qg8=;
  b=O01NvVqRqyJyUrJ93frM+0vawHPgRZWzgsxvCYNJDa4yiITVv+oIdQl+
   v6Mqz6Scha6YumK0Gb+NxTewxcBS5/7RP1qmThWQ1W0TrRH/7sIz0NJK+
   Rs5K85YwgYggfF3f7HDyEqLczpoSCjw6g/wbg9ZRb/bVd7Ju6QGitwbR/
   eTLBWfgySw2hdgc31Wwhk/cKnh2Aej2GcNSlGbHPJKPQsF0nIDF1kVqPq
   TpOsO4WG7uLCzK7SoTEoOSZY8Io5T5v0dapRluGQLg81Re0yOILPhVPTR
   L/JjgT+kJ4oPrg6axuiSw89q9PxwqSX4TwYqLLt75hbjfzmb/id1yA4uk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139861473"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139861473"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:43:40 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 78C34EB464
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B2A66D5D09
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 527D72008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 041EF1A006A;
	Wed,  6 Mar 2024 16:43:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/26] bats: upgrade 1.10.0 -> 1.11.0
Date: Wed,  6 Mar 2024 16:43:04 +0800
Message-Id: <1709714608-19296-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--2.063400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yfx0ykrbAxjCRzUPAqhCjtiHJC/JOD1QlSFL
	Sh+QCTPZIvrftAIhWmLy9zcRSkKatRtybdvWAMHw3QqJN4m15UF9LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4I8ZW5ai5WKlyrRYcbNDKzgjX3t2qYLovd7oCYbsDHQ0IdJ8i1qu2DJaUkS
	KIrJCFxaXwwEub8s7nxC1qxggNLpiU4hJR9TZ4zv4bWNKelY9n/r/b+dmSKFo6AH9/PcRd1xUpP
	R4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109142

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.10.0.bb => bats_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/bats/{bats_1.10.0.bb => bats_1.11.0.bb} (94%)

diff --git a/meta-oe/recipes-test/bats/bats_1.10.0.bb b/meta-oe/recipes-test/bats/bats_1.11.0.bb
similarity index 94%
rename from meta-oe/recipes-test/bats/bats_1.10.0.bb
rename to meta-oe/recipes-test/bats/bats_1.11.0.bb
index d2a93e190..f0615f7b7 100644
--- a/meta-oe/recipes-test/bats/bats_1.10.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.11.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
   "
 
 # v1.10.0
-SRCREV = "f7defb94362f2053a3e73d13086a167448ea9133"
+SRCREV = "7531b575bb81487553553aecb654c41b237ae96c"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


