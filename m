Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BA6CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:24:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4782.1761099854659276877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dyC+dDGL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099854; x=1792635854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zKute6fl7WZp5plmRLm+B07zH36G/+oN+1Vu3ZxFkwk=;
  b=dyC+dDGLy6Q2mhhAlE1srfNW+bYFzOsT4DQTlVQik5OyKkfcKoLz+cyo
   1L6OpxWcy0zMChufxK3hEjePv4Q+3j0y2c2SherMlBm91j5rwM2W8Hea7
   vjqUQ1g0MiwzSy6CIu3Juyljo3biy0WhpLYKqU4k3eZs8gLL15lmJbaSP
   Gsx4jcoFifVCHopDlFKZwMszODRFH/N2VE2vSe531O91hbsICk+vws94r
   9+EgwTXOOHVgYzfCeVjZ35hLPoxp3N3pe1eYNsqz+gNotUiPpMqRLVyUD
   36RgVvp50m1qBAPreLawpOa/F/z947STCe427cH18b34AKvqMr8108P8a
   A==;
X-CSE-ConnectionGUID: ZDbvpduDRiizYYRnsrc09g==
X-CSE-MsgGUID: vqYpop8mR16BMl6nPlJMPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="205221178"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="205221178"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:24:10 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A0FFB40755D
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:10 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 596751800EBF
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BCA7F82C0E7;
	Wed, 22 Oct 2025 02:24:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 27/29] swagger-ui: upgrade 5.29.4 -> 5.29.5
Date: Wed, 22 Oct 2025 10:22:23 +0800
Message-ID: <20251022022227.226-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120875

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- core: handle complex value stringification in Property component
- correct spec paths for parameters, responses and request bodies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.29.4.bb => swagger-ui_5.29.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.29.4.bb => swagger-ui_5.29.5.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.4.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.5.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.4.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.5.bb
index 2dca388ac2..cc7d5d52ce 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.4.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "526c9ee9227e07e55eb45a4c1749dd0880f97ea1"
+SRCREV = "04b9ad7b37f02bce0e1cb8c521e40b68585ccf9f"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


