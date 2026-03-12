Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDBF105A56B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:58 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18537.1773312827006384909
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=euvJdhPl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312832; x=1804848832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=shVMFWuNuvzkh42RlNgnN2zswSNfLs1CinCUOrwo2hk=;
  b=euvJdhPlWGmq0ie4tNTgZow5s1VTYYXMXnu1Yug43a7uGxuUN7grG8ou
   uCr7CPKJjmh+vTmY3OI3B/0f8PYWNjCht+udcF7P4HItmGdpz9E0FsjXp
   23jfnIfICPYFILEX/7jgTljaHdg5k15J3BorBo4WjsNoMwTxFHmHr+NER
   sGwk6l1sZ3fepXlS6gS6WjondjyeJ0yp7vaemErehpxYoWs1q68LUt5h5
   kNDpj6XKXvhQ736KDJ5Oh2s732ukBb7+XpAkJQj8CM2owpVcmn113QBCG
   G5GgKIeFlVAYa4mTvLaleBCLIw/WCyxbUX9FxJbsOeSaWxEtdmZTdLacz
   Q==;
X-CSE-ConnectionGUID: 4vGFAXJ8QlOnSdLTI8bKSw==
X-CSE-MsgGUID: 7ye7vfQuQaiF99/+kPnw2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232989832"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232989832"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:51 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D6F928204F2
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:51 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8BC4F14042CD
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9C1721801925;
	Thu, 12 Mar 2026 10:53:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/64] python3-luma-oled: upgrade 3.14.0 -> 3.15.0
Date: Thu, 12 Mar 2026 18:51:56 +0800
Message-ID: <20260312105220.1856-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125140

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-luma-oled_3.14.0.bb => python3-luma-oled_3.15.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.14.0.bb => python3-luma-oled_3.15.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
index 0c0906cedc..1182ad1de3 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
@@ -4,11 +4,11 @@ A small library to drive an OLED device with either SSD1306 , SSD1309, SSD1322,
 SSD1325, SSD1327, SSD1331, SSD1351 or SH1106 chipset"
 HOMEPAGE = "https://github.com/rm-hull/luma.oled"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=95cba8b3a40c6f55d5d901980fe6e067"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ddfca5d3a55dc20707b094137c913c4c"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "36218565eda0614c8cf44ef42cb9a5904ddf808e4516e99ddae111fc93c5a206"
+SRC_URI[sha256sum] = "16925fe668f484803df0683add800b19e5dd7316a1d64eb06ec2ae817473901e"
 
 PYPI_PACKAGE = "luma_oled"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


