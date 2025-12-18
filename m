Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7988D68BFF
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37576.1766048649108837317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WEWi1q9n;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048648; x=1797584648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uHCRWN5qu7R8b5XlNacky6egKf0qRHLgQDETUhJpTUY=;
  b=WEWi1q9nHokM3ws4nYEBlwIRbV6gyHNSOrdl9AB2wh6/qrYrBMkl4Jfh
   01nq1H5AnUfNX/edeDj4N+9KaMH14j2DNb4GV7mHSC0Tgi/tPUW2Ha5PT
   68RFu7nVdsle6IiixPUFEEofkrjRIVj19bXmeScGDtqrICtVnH3FZnIkF
   06ht5uX1OMgpOMa/GYTaiBN6A+zUYYBajSPiymsAYZqciaYrcxlJlrmtR
   2H52gzJjoWNg5N8GBuRnKHzmuRmAPq35NDHgjuT9XIX/pS4Mhm7jp4svz
   AUbMUT2l4aIrnOOCwmNlm/tGVco9Jm5NOGwIM99sSIIdueB81RauodtJr
   Q==;
X-CSE-ConnectionGUID: AFfMGTCoSqe4D3AhUn3MXg==
X-CSE-MsgGUID: xS5aCe48QJ+wG0dHAmYLxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223059409"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223059409"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:07 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 866011C17349
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:07 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 40E39C01814
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B0F13101E516;
	Thu, 18 Dec 2025 09:04:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/20] python3-aiodns: upgrade 3.6.0 -> 3.6.1
Date: Thu, 18 Dec 2025 17:03:34 +0800
Message-ID: <20251218090346.735-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122742

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Pin pycares to < 5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiodns_3.6.0.bb => python3-aiodns_3.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiodns_3.6.0.bb => python3-aiodns_3.6.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.6.0.bb b/meta-python/recipes-devtools/python/python3-aiodns_3.6.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-aiodns_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-aiodns_3.6.1.bb
index eb207aa31f..4d40a0e486 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_3.6.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/saghul/aiodns"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d574ab425d1fcb37c9f1ad3961f18527"
 
-SRC_URI[sha256sum] = "9b0ef54339e6687cdbd39a7d73d7de2467cb5c115281da28f2598f058633dac8"
+SRC_URI[sha256sum] = "b0e9ce98718a5b8f7ca8cd16fc393163374bc2412236b91f6c851d066e3324b6"
 
 PYPI_PACKAGE = "aiodns"
 
-- 
2.43.0


