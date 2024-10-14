Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43D8CFC508
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:13 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.50343.1728896173303782133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WOj/KGiw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896173; x=1760432173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0HsI0OnspHMPs6c6+Uay0j5RnDdZu8VDw+Yt8eCYJMU=;
  b=WOj/KGiwF9zZdMCAUmvR/C4dPBbM5SK2YaY9tXVtaZ0R5UtrUIbVvQuK
   DrXa50jXIJByRk4CADo3vNtcUveIN/6UAJz7Gx4gIfXrOD3duxwc/bVCG
   MUu98TUiDOY37ftX6PKJyAbu/dvsbfsUF/BCdlNPw71vaTz1iCTeUvUrg
   0m/F5A+zFj5xjvB/4MNq/EI/HyTRwaOnrbzgLLmSvYrvlYBp1TXNxdE9M
   tBInM12rJAwkozII5soxfpdg2fz9BQcd2dYyOy7SBMQMY7dTwjRj2Jw8o
   Xqu1ADpAnqgKKsOj6YHI/UzKwN1iZ9yZapgKPQ6/cwbLdh11T7FN0opVy
   A==;
X-CSE-ConnectionGUID: UREJVbUtSkqVkWSyHrGnFQ==
X-CSE-MsgGUID: 07no+hTXT1eLMy0uYnNjlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164671135"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164671135"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 204A3D6473
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A8A2D7500
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EEF2F6B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 995AE1A01ED;
	Mon, 14 Oct 2024 16:56:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/54] python3-pdm-backend: upgrade 2.4.1 -> 2.4.2
Date: Mon, 14 Oct 2024 16:54:50 +0800
Message-Id: <1728896115-2944-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--5.436600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrC//1TMV5chPIFck3f6fvyPNY
	yBBaMLojp+uiLk4HyZE5UGidmkKLaO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0f/P
	Iv6AGqLKiX1rgDlKz/jPXPFj39BC7xk724SumXplWK2d2bV+qT
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112878

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use fallback_version for source = "call"
- Update to pyproject_metadata 0.9.0b5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pdm-backend_2.4.1.bb => python3-pdm-backend_2.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-backend_2.4.1.bb => python3-pdm-backend_2.4.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.1.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pdm-backend_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb
index f2175150e..903caad6e 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "d6404e94a612459c5213cc63df035711244173c57441b8312a2a6f4a8c110934"
+SRC_URI[sha256sum] = "1f833e527ae172f34b4b84e2fcf1f65859a2a5ca746e496d8313b3ea6539969f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


