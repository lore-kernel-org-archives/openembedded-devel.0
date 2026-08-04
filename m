Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF079C55AB9
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10173.1785820768266474762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tAlx5AOY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820768; x=1817356768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EqMDLReDvlWJWbqAzc2nHJVkgxUjjjbMlrReg27naKs=;
  b=tAlx5AOYcAakY2Gj0aFY8Rs7DEf7LmWwN/a2e9FWE+JWWzv7VPbfIrFz
   cwG1U26Tr7PpArl5MrkMrNwsDjRBeYedcA0XdfUhddAgMeVxuUkMdaJK1
   Xy++1DVE8pKlPVWprEa62jHalI0Vz2IIctNtlvfUHd2t7+/utttDtJsc4
   I4X2kufTd5YYVKTQ91I1QROkGMq0CJjFmWzo5AjRJUmsrA3knx80dP7ji
   bdPo5ItCWJtuAstzkI2G6wN5xr/NGxU1CAYNAAyRX+sYzT+1/ovmCebSu
   YRjjO00n5fp2jmBL06LBnRYjiqOxWOcPesl+UQJ3CTr3q+r889aOy3cXH
   Q==;
X-CSE-ConnectionGUID: i1WtG/LdSvmWPOaEeTviGA==
X-CSE-MsgGUID: qhsAjzYCTAOtUJ0FxDCMbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249096128"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249096128"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:26 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A012E1C000A7
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:26 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 53350100D11E
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6BA161800139;
	Tue,  4 Aug 2026 05:19:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/28] python3-redis: upgrade 8.0.1 -> 8.1.0
Date: Tue,  4 Aug 2026 13:17:20 +0800
Message-ID: <20260804051726.1489-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128727

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_8.0.1.bb => python3-redis_8.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_8.0.1.bb => python3-redis_8.1.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_8.0.1.bb b/meta-python/recipes-devtools/python/python3-redis_8.1.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_8.0.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_8.1.0.bb
index 5278e45128..286c4b6f4a 100644
--- a/meta-python/recipes-devtools/python/python3-redis_8.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_8.1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
-SRC_URI[sha256sum] = "afc5a7a2f5a084f5b1880dec548dd45be17db7e43c82a30d84f952aefb05cfb0"
+SRC_URI[sha256sum] = "6e1a19beef9225c83efd689c7e6b7da2d5215b1f42cd13b7fc3714d0a09c7b25"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


