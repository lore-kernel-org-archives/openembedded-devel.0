Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E94BC36013
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.61110.1742893331453657027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IaWLLXvE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893339; x=1774429339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0YTLL4ITCAgRrO8Ck23DwCmbLUr/VHBfv35vN4q4VcQ=;
  b=IaWLLXvEjGQV6nSSdNwMZnbT+1Tj/labTnGCJQqxqGjGKDHAug32/WXt
   D/vkAS9TMvK4PxfFMnqbYme+NOrIKg2V6XGhF/s2MeMCkteEqaxZOcG3p
   RzDPquHrVHbEfkEacZAELqLvUX/vK8+CiBX1c9HhDfOOflvwoqCoT5XUo
   UuWAw9EtqWsKOySYPV0V9+PP/sXVzkwZiEGiINNdrAvJTXnr3dVO0IFQG
   MW0/R5qnDBQkjGC5t9X7DYqOHKi6zYh8FqPtn+rqoodlRWqwnAaEAVot7
   9U57Cfn0ZHOZt3JAl4y9Nt41K3aB0wA93navs/8ZWinfsU8M+tpzYIIiB
   A==;
X-CSE-ConnectionGUID: sw+vEsoRTuiYZPkUaBm68g==
X-CSE-MsgGUID: nVdCTlI/RKyB6GlgBtpB3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="173638095"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="173638095"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DAA81C2260
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E669D729C
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 37CC01A00AF;
	Tue, 25 Mar 2025 17:02:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/45] python3-aiohappyeyeballs: upgrade 2.5.0 -> 2.6.1
Date: Tue, 25 Mar 2025 17:01:27 +0800
Message-Id: <1742893312-3809-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116240

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Resolve typeerror on import for python < 3.9.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...happyeyeballs_2.5.0.bb => python3-aiohappyeyeballs_2.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.5.0.bb => python3-aiohappyeyeballs_2.6.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.5.0.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.1.bb
index a24434d85f..441016fd23 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "18fde6204a76deeabc97c48bdd01d5801cfda5d6b9c8bbeb1aaaee9d648ca191"
+SRC_URI[sha256sum] = "c3f9d0113123803ccadfdf3f0faa505bc78e6a72d1cc4806cbd719826e943558"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


