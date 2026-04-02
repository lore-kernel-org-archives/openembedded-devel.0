Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0903C1112270
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7238.1775096156180116148
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HXYnfK+E;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096156; x=1806632156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gv9EXUEH0WbJvtqWJUPzGxfclHNU2ogVI+8IUB972tM=;
  b=HXYnfK+ESawAmPBFsYKNDXMM52AENNzk9VsBoH4FiDx+5eVasEP59I1i
   BQfSuDqwBF7T+RivYeknOGsHC18vfEGhp/Mm8nXy2Q4VYU+Oap9zU1+zb
   uPL8lr3lETDjgxORYB6o730/j4Gm+D2jzMDscW1hT1D8RnxPwTkXq24X7
   NXwMFCai+VC/4lSEuMHJ5KIPwoKDpiHoXjIy8xtaYKzIFnBd8SWQ3LU0b
   h/R3JVrCcxf+b4+0W6jreI9feQmYeGznEeROeirobPEfakP89Hnve6Y5R
   396jzEXETyo/uQiWmkyEYRJCtEeNCVzHR7yy5lrpylN8YoXYLd/IDMumW
   g==;
X-CSE-ConnectionGUID: dboHEaznTECmXYzlyYk7uw==
X-CSE-MsgGUID: co1L5YDsSTKJ1NJ3JePlKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="214299310"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="214299310"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:54 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 99A54468
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:54 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 41444C0371F
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C38AB1003742;
	Thu,  2 Apr 2026 02:15:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/39] python3-pyais: upgrade 2.20.0 -> 2.20.1
Date: Thu,  2 Apr 2026 10:13:45 +0800
Message-ID: <20260402021355.1324-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125945

From: Wang Mingyu <wangmy@fujitsu.com>

this release reduces the supply chain attack surface
- pins dependencies
- pins workflows
- adds a SHA256 hash sum for deployed artifacts
- migrates to PyPI trusted publishing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_2.20.0.bb => python3-pyais_2.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.20.0.bb => python3-pyais_2.20.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.20.0.bb b/meta-python/recipes-devtools/python/python3-pyais_2.20.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_2.20.0.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.20.1.bb
index ce53d39476..6ee62a6a32 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.20.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "2fc03eee875dd2c54af1220bb876651725c8e559"
+SRCREV = "6cec67eb8e48c2254bd7bc31415f8df60ecb11ce"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


