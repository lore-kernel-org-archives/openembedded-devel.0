Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC671C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:45 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10175.1785820774801618119
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iFDNYtAa;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820776; x=1817356776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PMVFtsPhHNMgegrHh0gUuHgfR+G6ZColwNSRam50Ooc=;
  b=iFDNYtAaKtNZmYRegKHSEHaw4eVWzLcBV8ldglhLG5Mx/XF5C+A1+v0K
   IjL5RNVwiPM/NTIaWl5Im7MyrUvWCwPHkyNBsG+ULB/G8fMWVQrms8dVU
   x4CjihRy5UsQ/4i38M+QjRwHm28ToFqq4ZWAq/x0PKBUGCydkQtjy2L2B
   bZnLBBDCMlHOW6sQNejJACZNfYmKpwJx1CD13XxnBsFG39ycNn474UV+2
   aUGn6wKsXayFF3V5hTsozDkfJz6/XPxFQUhtf/V4sIy+KtjuWepzXeQHJ
   5hDHQs1Zk132dDb32/OvrjLrj7+jy7lU/mwQWaeIhKnmJs7aDVpArLMe9
   Q==;
X-CSE-ConnectionGUID: iGmvOGipRSaSOo1fwPmJnw==
X-CSE-MsgGUID: 33BFy+D3RLqeWr3doxMBHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249616377"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249616377"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:35 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 28CE41000368
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:35 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D2B96101B16D
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E256A1800122;
	Tue,  4 Aug 2026 05:19:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 26/28] sip: upgrade 6.15.3 -> 6.16.0
Date: Tue,  4 Aug 2026 13:17:24 +0800
Message-ID: <20260804051726.1489-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128731

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.15.3.bb => sip_6.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.15.3.bb => sip_6.16.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.15.3.bb b/meta-oe/recipes-devtools/sip/sip_6.16.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.15.3.bb
rename to meta-oe/recipes-devtools/sip/sip_6.16.0.bb
index 5d6d8c78a6..5feb3718fc 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.15.3.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.16.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "bb2516983f9f716d321e5157c00d0de0c12422eba73b8f43a44610a0f6622438"
+SRC_URI[sha256sum] = "22dcb9d02347a3af22a2cba41730c9467f1f781362e97c5eea4ec75c4b7e4ffe"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


