Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD8CFD7F7A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92464.1772187311204317051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q+9cMg2l;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187313; x=1803723313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P5sStK4NyV2QJtwABRPNxpSruXXbBXhOkmGp1XvRL18=;
  b=q+9cMg2lUJtRV+rqJzbzlDnkMsiBj12Td6r5BS2517wtqy5YpS7cij3s
   TGE5mWDI9QuoU82SQdy/+PFs+V+1I88MpoDMr3QcJu660X25u1P2oXbZ7
   KBCYqQ7rN3NKrN+Idx3HTqyqdkLPNf2j1yh/+kJ5BGJLjb8XEVs8LY27w
   iwg0ORQvJ4HosWdzOM+qxkA/WTSctrJ/s80a+Qg0uwf1VKB4QTVHrfetF
   UGhOTlqhozFq29rPnK5835J7ijx6oxiXkza7o/nIRD93FGrWILBIrl+lR
   Qszwq1yK6zWMNBXtM/MnEPZ6podQZ+TaQzGCgaTtE8cO7Gp+rZwI10qSg
   Q==;
X-CSE-ConnectionGUID: gSgq+045TjGa2mGXDDQcIg==
X-CSE-MsgGUID: RQTR5iZ2ROya3LqUiTFGoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231325560"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231325560"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BFBEA7336
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:13 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 741A91C00121
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 987A3180059F;
	Fri, 27 Feb 2026 10:15:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/52] python3-typer: upgrade 0.21.1 -> 0.24.1
Date: Fri, 27 Feb 2026 18:13:10 +0800
Message-ID: <20260227101327.1432-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124735

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.21.1.bb => python3-typer_0.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.21.1.bb => python3-typer_0.24.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.21.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.24.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.24.1.bb
index 0bf2c0ec4f..6538f16f0d 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.24.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "ea835607cd752343b6b2b7ce676893e5a0324082268b48f27aa058bdb7d2145d"
+SRC_URI[sha256sum] = "e39b4732d65fbdcde189ae76cf7cd48aeae72919dea1fdfc16593be016256b45"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


