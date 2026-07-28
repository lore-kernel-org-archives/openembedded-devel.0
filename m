Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250FEC54F53
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5786.1785218845844921076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DTRvTzT9;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218846; x=1816754846;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hLNzvjygYZokpU29huIO/C7LusspS0XpXVfcvzG+KQQ=;
  b=DTRvTzT9mM1LK6hfkgwNAksZ8n7otDVm/9mzLWcHhZjKkNnvCyISPSds
   a3WibjSwZV4SHHEQe4Nk7bMQRJkt58qV+h5dkWVFT3nBi99GoLRAS2P5L
   /vAyaIzUFBUo0jl78155ENaA6AevR2LVBandSu3AoTtTuzwUWes+6YtEX
   +tbEc/J/MZT1okDfGRMf3ie3qir4WHS+9dccwIWmhxvNkW8eClZJWUvvB
   3BlnaA/4cMOnJtNdIOKh34VZRJTPaisxghq9cgCyRZyfuE1Yr0MgPPMxm
   +mKX8kROB25Z1DtvTGRyw6ny3uMBf6sahxiyiz7UWbTzxuLPEF9vqStbs
   g==;
X-CSE-ConnectionGUID: hdUyq19fSnqiEMYsRmPPUA==
X-CSE-MsgGUID: shZFD2CyRi+w3LC10RbNWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="226549491"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="226549491"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:24 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4D88FC0009E
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:24 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 055F8C08A4C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:24 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5F96610005EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:22 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-tqdm: upgrade 4.69.0 -> 4.69.1
Date: Tue, 28 Jul 2026 14:06:40 +0800
Message-ID: <20260728060645.819-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128497

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.69.0.bb => python3-tqdm_4.69.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.69.0.bb => python3-tqdm_4.69.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.69.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.69.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.69.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.69.1.bb
index aa9681f6b7..ed2b0b5d0c 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.69.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT AND MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=9a9bed097dea538bf341c8623c8f8852"
 
-SRC_URI[sha256sum] = "700c5e85dcd5f009dd6222588a29180a193a748247a5d855b4d67db93d79a53b"
+SRC_URI[sha256sum] = "2be21080a0ce17e902c2f1baeb6a74bf551b67bbdfa4bc0109fad471d0b4cb0d"
 
 CVE_PRODUCT = "tqdm"
 
-- 
2.43.0


