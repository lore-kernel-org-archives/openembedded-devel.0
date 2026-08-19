Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ED4C5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:24 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3377.1787132242730939076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E2AOPSXX;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132243; x=1818668243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RbruQGkIqmTXphbZ04DvZE2Y1ejTige2FYdSqZy98bc=;
  b=E2AOPSXXQ1v1g71ts5LqfOBPQyOga7SNvy+IqyYrb3w9RLErwiRv1+91
   fujpsiePrPFE1IhRn8uNY/CzzAy11H1QgSkpL7erd7Ym39g/M22esJYuI
   cWbTqtkoJW5JekuPQqJSHFvzZ+La8iTk0jYVyGNbRSRH3IVzEzJVYV4BS
   5oJ/hghHgmJ19Dl7tIAQZ8exPEV6cXeglGnWLwEH0Tvy5ozfE0TGBUYiu
   WT/R6/G53zbL6d3YAepoUd29WP5BucNMiDMW7RhUkj/6oxngZXE6zMRUh
   ZNAcvsxU0UBIiEke6ifKZHvqGNrZXB4nl3EKfoSdtZ4JS+1siOns3cKPB
   w==;
X-CSE-ConnectionGUID: nkDppBFkQD62tihDOFMxJQ==
X-CSE-MsgGUID: OczxfN2pSmSRiN4M7Va2sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="229586442"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="229586442"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:21 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 293A51C1C71A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:21 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D70D1181AEA8
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id DA3B01801C11;
	Wed, 19 Aug 2026 09:37:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 68/70] sip: upgrade 6.16.0 -> 6.16.1
Date: Wed, 19 Aug 2026 17:35:12 +0800
Message-ID: <20260819093514.1101-68-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129338

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.16.0.bb => sip_6.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.16.0.bb => sip_6.16.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.16.0.bb b/meta-oe/recipes-devtools/sip/sip_6.16.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.16.0.bb
rename to meta-oe/recipes-devtools/sip/sip_6.16.1.bb
index 5feb3718fc..2de9260821 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.16.0.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.16.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "22dcb9d02347a3af22a2cba41730c9467f1f781362e97c5eea4ec75c4b7e4ffe"
+SRC_URI[sha256sum] = "0a739c9cd2929de4e0884456d8caf3cfb22c10534757c7797bd8dc6bd9ed69bc"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


