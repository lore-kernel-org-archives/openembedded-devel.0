Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D237C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:19 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17222.1782811336393109321
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WwLovxmV;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811336; x=1814347336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cJ8zZOl+dK0RdaQNCrV0x7nHCjWk75SNnXrGNUJEOwg=;
  b=WwLovxmVP7kQuYvn7Lrr6BKpnx05LjBi+FcFkCPQWdTnxURMrI+5JaS2
   eEXOD2laagSAzoQXshcrr9VUtL4mX+goMWCzRXLvMPkNF6W0/R2jgigdR
   d4448/fhwPLdzqamQYjzJkmMGwEYliFpG15GCEXMbH+vpl7TDHLKoUGWW
   /pnD9wZ9PtsSwCHQZaTaFJs4VraAxQtIFgMtvyqkMZN+BmWy96pOQgC6q
   OM/G12yGsUq4VDmSDcOEDKzHY9ubGLrfcaw2TE4jX3sSqzXJnwNJrCKpB
   TDdd1cLHObAtNkCnDKC2t3qX96gtIMSGycZ/NQ7aw+GlIg2/sSgKOk4fT
   g==;
X-CSE-ConnectionGUID: lBeljyPDTXqU5mA2OgcSKg==
X-CSE-MsgGUID: oSD03cjIQh64yCKATpfD3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="223513509"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="223513509"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:14 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8116E1002B94
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 3B32AC091A0
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4BB6D826FFF;
	Tue, 30 Jun 2026 09:22:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/37] fastfetch: upgrade 2.64.2 -> 2.65.2
Date: Tue, 30 Jun 2026 17:21:31 +0800
Message-ID: <20260630092206.322-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127945

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfetch/{fastfetch_2.64.2.bb => fastfetch_2.65.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.64.2.bb => fastfetch_2.65.2.bb} (98%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.64.2.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
similarity index 98%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.64.2.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
index 8a953508eb..cf1410a96d 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.64.2.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2090e7d93df7ad5a3d41f6fb4226ac76"
 DEPENDS = "yyjson"
 
 SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "636471c3669201b37fca587e2882eaf3c7062aeb"
+SRCREV = "0e90f3a7d4ac5a7857a968a6f52ea1205be5f404"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


