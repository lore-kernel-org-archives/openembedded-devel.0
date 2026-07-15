Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2F8C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:00 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3438.1784111994956034428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HbbsLOsK;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111995; x=1815647995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TeRDmnXtmX+XTX4gHBLXb7EfCzqF+6tTzkdUGUyMPtA=;
  b=HbbsLOsK3ylEbGaPb0c08rZAR1m3ucOIP8zSOwzcW4vmdNV0F1r5aJ5v
   8B2jh8TARDqBXGntDJ/IkD/PJIo7ojBRMDjWdQAzAzV3civaGDXnc4px7
   RbTZuuZBa51E8SxsP+RCQE01fetQG12Men14DosWCS/P0LhyvgNaO2EEs
   hXoK697ZQkb3RtU2C48ChdTasXAc5++MxTT2q/8q9CxnoG1i/eYvFLN2j
   wT7CwkhfJXRNdz3oumwD1t8/xqBTBdaV0Kjy3YWtxIKN1nlkUlxN4GeUF
   h3j7VZUpsT+EglvP39i3nUBe+5GRtA+8ON/Y9bBaqZ8dz68MgEguPmLHn
   A==;
X-CSE-ConnectionGUID: y74y/Gp4Td6c1CwtUWwKcA==
X-CSE-MsgGUID: kzEbH0QuRoCDOrqAestzpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="225218888"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="225218888"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:53 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 40CE1100014F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:53 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E00F5C073D8
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id EDF231800B81;
	Wed, 15 Jul 2026 10:39:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 11/44] python3-asttokens: upgrade 3.0.1 -> 3.0.2
Date: Wed, 15 Jul 2026 18:38:41 +0800
Message-ID: <20260715103914.2120-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128184

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Modernize type annotations
- Fix pypy CI by skipping redundant mypy runs on it
- Fix IndexError on source mixing lone CR with LF line endings
- Release modernization, and publish to PyPI from CI via trusted publishing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asttokens_3.0.1.bb => python3-asttokens_3.0.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_3.0.1.bb => python3-asttokens_3.0.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
index 5b6cf0624f..8f460cee8d 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "71a4ee5de0bde6a31d64f6b13f2293ac190344478f081c3d1bccfcf5eacb0cb7"
+SRC_URI[sha256sum] = "3ecdbd8f2cc195f53ccada3a613538bb5f9ef6f6869129f13e03c30a677b8fe2"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


