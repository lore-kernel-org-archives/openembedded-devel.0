Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2930CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:54:27 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13020.1764060866663508229
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Nf2ZHO5C;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764060867; x=1795596867;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/S98sPByjgJcHLOnPpV0kWLuIradgUNHWp3KwBC4NLc=;
  b=Nf2ZHO5CAx/b2OB00almyCuOmI6d11qzItXlRdcr1GygwaG3AiEA6FNN
   W9YRTZ3RG/61ojGfxh6XZP2b/D6wIjGCerpRWLVs5mARkzGQgQYu143og
   +W8SYdJE6zW5gISXnWJlMbBfYHqo3kfhjqiy0pIodqBjxxN03lf8qEF4L
   p/8SpppduORIc9MNRqMeWs/owUz+XocEVNpBxdeTum+uYhe0iwOnmusyl
   IRoA1QI/r88ygIZjPQQKyPjdqRnhFB2YKW2pQVWmC7hAPV1M/EjUwLulW
   CqH1FHrL64YabvncPdq1aSBW34Y7LEjNKv2G5lVheHkYwD08M1PWhzqe0
   w==;
X-CSE-ConnectionGUID: T34p3AtWTyCHpwL/GdOk3w==
X-CSE-MsgGUID: 4yU/l0xmRfOXsdbcgaQZoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="220287452"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="220287452"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 17:54:25 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 8EFAA21D4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:54:24 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4ABAAC012A0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:54:24 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 20D6810000A6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:54:21 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/2] sdbus-c++-tools: upgrade 2.1.0 -> 2.2.1
Date: Tue, 25 Nov 2025 16:54:15 +0800
Message-ID: <20251125085415.3340-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122025

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.1

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{sdbus-c++-tools_2.1.0.bb => sdbus-c++-tools_2.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_2.1.0.bb => sdbus-c++-tools_2.2.1.bb} (89%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.2.1.bb
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.2.1.bb
index 0467c834b8..13a7b8a45e 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.2.1.bb
@@ -8,7 +8,7 @@ inherit cmake
 
 DEPENDS += "expat"
 
-SRCREV = "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
+SRCREV = "28b78822cfc5fbec4bd9906168493e9985f586ed"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;tag=v${PV};subpath=tools"
 
 S = "${UNPACKDIR}/tools"
-- 
2.43.0


