Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3302ACAC591
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7934.1756890228119352621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DICiHE3/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890239; x=1788426239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Kue4zei2c28Zz6Bn3o9gdcUFMX8PrOIbTyTkNr3wUk=;
  b=DICiHE3/VTuqyKO+tGoyqR+HwtyzvfmSgTDcNWTXY4s9Xze5KTMNQNAn
   yAoB19EXoUTfrb29ZPxAnU7SUTXA/gtUn8e4aNXTLHO1+1QxjvnomEDn+
   aGNTTOET0xLeT2yfcZoAyiXXzLTpsf3tf1nlfbAjgHXpnwIzBFPHfF8Se
   7IllQAkX1Zmmby18GOaIrZ3YOFoUkeAJptJdMUa/TooNLHEvfacvwgwnQ
   w+JLzh73jNs7zmfE9Z6DrNzVpCv2Wd3HNexWHaE7K9wXa3fukANNPYST0
   BZzgtla79JYMn/yK5XzyQbhKClcdi0fWQF3Ws0NChpBsEV3fatdY+5qpX
   g==;
X-CSE-ConnectionGUID: +r0UeDBjRdansCldMBzi3Q==
X-CSE-MsgGUID: 7/G51ykrRtGRp1ZXx9IryA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199446319"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199446319"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:59 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 5F93D1C1C71F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:59 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 160478B67B1
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id D6A98101313E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CB4771A008B;
	Wed,  3 Sep 2025 17:03:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 51/56] python3-stevedore: upgrade 5.4.1 -> 5.5.0
Date: Wed,  3 Sep 2025 17:03:12 +0800
Message-ID: <20250903090317.2002-51-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119247

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-stevedore_5.4.1.bb => python3-stevedore_5.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.4.1.bb => python3-stevedore_5.5.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.4.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.4.1.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb
index 6a6fd36cb6..5ec38fdb5e 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "3135b5ae50fe12816ef291baff420acb727fcd356106e3e9cbfa9e5985cd6f4b"
+SRC_URI[sha256sum] = "d31496a4f4df9825e1a1e4f1f74d19abb0154aff311c3b376fcc89dae8fccd73"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.43.0


