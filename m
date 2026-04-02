Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D501112276
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7126.1775096168942585997
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iTom1FRx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096169; x=1806632169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8m4aVnYFog1svEgegAVY1d+ffcmCreH7vuKWIGgsVuE=;
  b=iTom1FRxNw8IKBWYML7GyeIvLD6+RRBB9x/55NDU7kavx5/p5QZI2kU0
   oHfG/0h72M+f3Gdgn65AwMlTcT0XsQddB7QucF+s6qBs9qBVGW8+tsVTo
   fKt2SZSinSFpCCvl3THcEvlfuLTDXA38wJyL57kjgcyNwMdE6mzxvE/ha
   SpyjmR5/oHrd6L3OzNyM4rtoZgAdksO+OBoL7ZDJYlmQ5h6pBWrlH963a
   yw1ukz3QELOYDJUFvSOlgn4D6iRpMGIIMGK0DEVnHhq4UZHbNXY8uPC09
   9vMAEsws1K5Z9HxXaXHtOLSAu/kTkAm2o+TaQX/fNYU2cRrLgd7obvdqi
   A==;
X-CSE-ConnectionGUID: lOM4YQDrQciAQNwmGKYeRQ==
X-CSE-MsgGUID: ISTjVm05Rze/YaGEctsfvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="239868266"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="239868266"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:16:07 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 849EA21F5
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:07 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 36117102FB93
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B0BF8100374A;
	Thu,  2 Apr 2026 02:16:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 38/39] thingsboard-gateway: upgrade 3.8.2 -> 3.8.3
Date: Thu,  2 Apr 2026 10:13:53 +0800
Message-ID: <20260402021355.1324-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125952

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hingsboard-gateway_3.8.2.bb => thingsboard-gateway_3.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.8.2.bb => thingsboard-gateway_3.8.3.bb} (98%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.3.bb
similarity index 98%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.3.bb
index 1b619120f3..806d9d24e0 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRCREV = "d3d58c848a53403e5468e1a55ff03c44e7c70a39"
+SRCREV = "7f7e0bf061bf92c2feb12b5098620f118dce364b"
 PYPI_SRC_URI = "git://github.com/thingsboard/${BPN};protocol=https;branch=master;tag=${PV}"
 PYPI_PACKAGE = "thingsboard-gateway"
 
-- 
2.43.0


