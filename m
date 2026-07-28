Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD94C54F56
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5627.1785218820361991143
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YdWIblJs;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218821; x=1816754821;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9BRki3QMEJiPLFSGTOGY3/KYikS6IHFVUzfSgrWB/qQ=;
  b=YdWIblJsH8ZnUjCP+o6gYncfcY0jLAeQJGAyMRkfdHiRSRt3N/LvSRUd
   qIgBXYU1mJw1mRPJ2x983VgN0vXeb+GydJsWZpWRLO2iiXZhgRBCC9vYD
   ovOkvN+1GoVA/xfIAA8qDySuuBckTpKgMqtN/+IxTDEm9Qs9y9JHm5XKo
   fI7cXen5vbboDAJ+dvp4FIZ8pv4f6ZQkctz4xWLgdIJo6zo8Ww+bc99+4
   MpNDwtH2NAGaWQroAs2XWYpVwWRahtvRojib34jXiGawM0dCJkn6AS0KX
   q1VgaQI7WHhDK4FFpXR0NiLCnz7iNhuh6HSknVC6fvUz12mhCd91EJeRh
   Q==;
X-CSE-ConnectionGUID: LNZaDsk/Rgqrw6FJ3rfNAA==
X-CSE-MsgGUID: ibCIDjMNS+qlcE85h8RlTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="226549417"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="226549417"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:06:59 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 49025E462
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:59 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EFE72180CCCA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:58 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3DB6310005DA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:56 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-aiohttp: upgrade 3.14.1 -> 3.14.3
Date: Tue, 28 Jul 2026 14:06:21 +0800
Message-ID: <20260728060645.819-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128478

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.14.1.bb => python3-aiohttp_3.14.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.14.1.bb => python3-aiohttp_3.14.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
index 656cef368a..033fc7c804 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b5e9e27554f71f0f132919037cb967b2"
 
-SRC_URI[sha256sum] = "307f2cff90a764d329e77040603fa032db89c5c24fdad50c4c15334cba744035"
+SRC_URI[sha256sum] = "9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f7844bc"
 
 CVE_PRODUCT = "aiohttp"
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"
-- 
2.43.0


