Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB15D11704
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:30 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4472.1764669136963812832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KnpSDYq3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669137; x=1796205137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1xuBlBeuaxAhRDJ84/U5E6HA865mcjRSa/O1Zoj8Cm4=;
  b=KnpSDYq3N7s7F09lY7L8EY/CcBsSCeG46/2/cXWYgMzYugDhMGPMgV/B
   rTvPQ/fyaAfHGCUifG4S/43GMmXYwS7BL+huE1TzFAlIbNc0RhC2XLiiE
   CIiBzR/Edg1r1L40gCzkUPZBq0PI2vBoR+3el6FxczJBQO1yePaXK+o6A
   euXGqNRlF/oea+6K8babb5vf7qD3hMli5tKvClvLmK1V+tbh87edpkDPZ
   RbJzsKFlCeNnu8SR3tW/jxdZeSGkemZof/Vodd6cycJfYj2TyAyMm4eeF
   Va/8FpHk4XqTz5ru0t7whnOQ6LVDN05XUSyDmaVIRMZeAXR59JF+QiM9n
   A==;
X-CSE-ConnectionGUID: YfyEYf0NQmemZfrLauNzaA==
X-CSE-MsgGUID: mOQ9KtydRYCwqn8pz6fq0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="220569809"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="220569809"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:17 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 76F328203C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2B00A8D204A
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A5788101A434;
	Tue,  2 Dec 2025 09:52:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/25] python3-sqlparse: upgrade 0.5.3 -> 0.5.4
Date: Tue,  2 Dec 2025 17:51:27 +0800
Message-ID: <20251202095132.652-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122253

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Enhancements
---------------
* Add support for Python 3.14.
* Add type annotations to top-level API functions and include py.typed marker
  for PEP 561 compliance, enabling type checking with mypy and other tools
* Add pre-commit hook support. sqlparse can now be used as a pre-commit hook
  to automatically format SQL files. The CLI now supports multiple files and
  an '--in-place' flag for in-place editing
* Add 'ATTACH' and 'DETACH' to PostgreSQL keywords
* Add 'INTERSECT' to close keywords in WHERE clause
* Support 'REGEXP BINARY' comparison operator

Bug Fixes
----------
* Add additional protection against denial of service attacks when parsing
  very large lists of tuples. This enhances the existing recursion protections
  with configurable limits for token processing to prevent DoS through
  algorithmic complexity attacks. The new limits (MAX_GROUPING_DEPTH=100,
  MAX_GROUPING_TOKENS=10000) can be adjusted or disabled (by setting to None)
  if needed for legitimate large SQL statements.
* Remove shebang from cli.py and remove executable flag
* Fix strip_comments not removing all comments when input contains only
  comments
* Fix splitting statements with IF EXISTS/IF NOT EXISTS inside BEGIN...END
  blocks
* Fix splitting on semicolons inside BEGIN...END blocks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-sqlparse_0.5.3.bb => python3-sqlparse_0.5.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.3.bb => python3-sqlparse_0.5.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
index e3e0e67c15..d8c3bc0ed7 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI[sha256sum] = "09f67787f56a0b16ecdbde1bfc7f5d9c3371ca683cfeaa8e6ff60b4807ec9272"
+SRC_URI[sha256sum] = "4396a7d3cf1cd679c1be976cf3dc6e0a51d0111e87787e7a8d780e7d5a998f9e"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.43.0


