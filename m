Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF04BED7BA1
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:39:28 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15967.1776163165650361513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MdDFk06d;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163165; x=1807699165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SE/yVh61GGcYG66Fs947acN0UG0Bio/5sz4I0hehBto=;
  b=MdDFk06dr6qU5dINGfp9UahhBzSf8Jxq76OWD6kPRsp+GxobrIEQ0pQZ
   h+B2Seqk9o7lGw21fkneP2pKniYI9QPToSOoZnvnQa0YkIH/g/95HBj35
   kJmDQJuLLD//lThZoPoa7rvvIfdPWq+wOSmVZQPFA0PEEiMyL0zlnHavj
   JMkHUF1KTrU4wD2yWBoJPUkW6+ZiLqjO/DK3IXnpTyvYKeOq2pcQRKMGP
   72lrpNaBrG53fiQtCn4uqrZW/voXW45+mV9xqpi8Qdd6og1PQ5FkoZIOy
   bOOSbPNWwNvpWN2DzhJJ/WcSH8KYBf0u4bhmZe1UmE1P75t9dq9RvJGca
   w==;
X-CSE-ConnectionGUID: 3wHWyMqdSD2O3yzLYAeQVQ==
X-CSE-MsgGUID: NAfYuEA+QBi7VCpV3b62vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="237631489"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="237631489"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:39:24 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 31EC942A316
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:24 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D3EF31800323
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 47E1114000EC;
	Tue, 14 Apr 2026 10:39:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/32] glaze: upgrade 7.3.0 -> 7.3.3
Date: Tue, 14 Apr 2026 18:38:18 +0800
Message-ID: <20260414103845.1728-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126309

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/glaze/{glaze_7.3.0.bb => glaze_7.3.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.3.0.bb => glaze_7.3.3.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.3.0.bb b/meta-oe/recipes-support/glaze/glaze_7.3.3.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.3.0.bb
rename to meta-oe/recipes-support/glaze/glaze_7.3.3.bb
index 698f0fab3c..e733d166b2 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.3.0.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.3.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "d59555bced07d7d4a633e1a282917b567b997b15"
+SRCREV = "dbf6caec935b768546587a413e45d033480c4483"
 
 inherit cmake
 
-- 
2.43.0


