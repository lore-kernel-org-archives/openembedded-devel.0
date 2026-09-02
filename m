Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F0CC624D9
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:01 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9745.1788344997896498549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mG5p0yv5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788345002; x=1819881002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u2o+Y7CBBMiqM24kq2fl7q+TKffucEcVN9O2S+OFl78=;
  b=mG5p0yv5dPfLlabPIRSDTE+4nGWGqT071Etvo2ja/RHew+NznCUyEhzA
   /Aa/R6YLnIKOQ/YJfFN8D40M0JkuIKUhgL0dAOlUhiCfvkWINKjfnLZYe
   jHkBhkbzC8r2EacebcCH/dLgwyCVsH43FtBRWVhGaLWLEwW2CZg4Dbu+z
   O6Q8BZl4MRGai108fU7ULHHG13/+/tLBKmzO0uwuRAkA0Rq52Yo9zDDzy
   OnV2oFw+gfBYSt9mTcuyRss9YvTVssTZBpva4voqE3xMQkGXWLjs8Wid5
   J57BX6LtlAjZLUzX7zLFSkNon1LeP4Xute1PH3KM6i7Y4AuA05f0djZK5
   g==;
X-CSE-ConnectionGUID: UybKxOV0T3y7s6rqnj5hlQ==
X-CSE-MsgGUID: XjUCfZZiSFG2lex1pFocnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="253510181"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="253510181"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:30:00 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 22A495507
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:56 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C99B410029A1
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id DB01B2000772;
	Wed,  2 Sep 2026 10:29:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/34] python3-typer: upgrade 0.27.1 -> 0.27.2
Date: Wed,  2 Sep 2026 18:28:53 +0800
Message-ID: <20260902102900.1296-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129686

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.27.1.bb => python3-typer_0.27.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.27.1.bb => python3-typer_0.27.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.27.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.27.2.bb
index 3246de7472..68c74ecf48 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.27.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "a79bef8469a79c45498e7b814ecf8d603cc7644e9acbd9e19cac0334240b18df"
+SRC_URI[sha256sum] = "269b7eb9d3c202ca84b4bc9618cb04ebb43d3d4d1e567e4c768607232c05f945"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


