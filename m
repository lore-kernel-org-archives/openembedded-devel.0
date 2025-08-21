Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2A6CA0FE1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.4678.1755766813635282172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rj5PaSoA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766815; x=1787302815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NRVPfmqrcDW8iRGr9X0JHtw3Ja8N8HXlQO7tvZY64a0=;
  b=Rj5PaSoASJ2qmZc+MXLkVU19Zd9YFRviMY/F5XnRiPgSteAyTpC2YdWY
   sZTGymwqoVUE14bmtNMYDUcXsJX7y/3hPeAWSnrfX+vkqIkf4ZLp1c0SG
   5K5w729gipQvVuaGEq5Un/H5lARbLORCNV3C3KYC2w5t7Din78vaac133
   ZgI2kZ+axI/nPPlGGM9Wuys6HwYVxfSNm+qvk+yqR4XIT9VQjtBd5EviY
   mU2zgliFcWdUPh5jlDmEss0UNfsGdbWHnHaHWfB4lS9Q88m3vRNAq42m5
   dgIawuUOOv/z9Jy765uSOFH+mr8DfAV8HJV0Pp5BztRn+nFcHnF/Jyruc
   A==;
X-CSE-ConnectionGUID: zDMErcWCRAKjG2hpBot23A==
X-CSE-MsgGUID: OV3tfTEMQw2qznsrcPjOSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210706588"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="210706588"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:13 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 2F310455
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DE4DAC0426A
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:13 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 9D8D2826FE6
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 363971A0071;
	Thu, 21 Aug 2025 17:00:07 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/21] python3-pymisp: upgrade 2.5.12 -> 2.5.17
Date: Thu, 21 Aug 2025 16:59:43 +0800
Message-ID: <20250821085954.2056-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119060

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.12.bb => python3-pymisp_2.5.17.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.12.bb => python3-pymisp_2.5.17.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.12.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.17.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.12.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.17.bb
index 861e7d021e..7267143e7e 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "75dd505d96e1d67b9bfec7a5e1aea3b967426da348e69bdbaa1e554821e10fd6"
+SRC_URI[sha256sum] = "91f1f75a18076e66c9275065d455b76099a723f4f7b66920b89893f942bbaf56"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


