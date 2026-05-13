Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F09CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:10:48 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.124.1778645436935718757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l0BoA6SN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645444; x=1810181444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fHf1RqRfgwJSXKFGj22A+2SfnNvCFC1S3pywGzPMwwk=;
  b=l0BoA6SN0Ej4Sw+ghzqmJOSab+ZDiM5v3jc7QZlhhG/ag6oTvjbry4UB
   dVoPQoYmqGsSA6bk44Rv0WMOMdYn7/+1LSI9iNxiiVkhb/tScMXXiuf4p
   42PvwQixhb71KXJdCBtnjv6CrcdQn9sOcYcAcLOkc83x+9oLV4WNBZRFa
   A04y327jTtZXkCS2nEyP1IJqHYtoWDk5nXmKrPLwmNEmnFe0Zoln/HYy+
   5RvDUfY6IuG3cFkFlN4YxjHMCbCahUtBp0Na1/8sa85y3WySYTdhazq0Z
   QayN9FDE8A0lC90ZR6P9Xe8tNslwbePS1TEVtk/ntteOArVQXM91w7dWm
   A==;
X-CSE-ConnectionGUID: L5ePFTjMTeidsrUjY4JVeQ==
X-CSE-MsgGUID: rRwu9yXvQ7uKZpbOLDjiXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228214106"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228214106"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:44 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DBA2140757B
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:43 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8CFCB1801EB6
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 12C37140025E;
	Wed, 13 May 2026 04:10:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/56] python3-mdit-py-plugins: upgrade 0.5.0 -> 0.6.0
Date: Wed, 13 May 2026 12:05:30 +0800
Message-ID: <20260513040555.377-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126913

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add AGENTS.md and copilot-setup-steps workflow
- NEW: Add superscript plugin and tests
- Add GFM autolink and composite GFM plugins
- Fix pre-commit

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...dit-py-plugins_0.5.0.bb => python3-mdit-py-plugins_0.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mdit-py-plugins_0.5.0.bb => python3-mdit-py-plugins_0.6.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.5.0.bb b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.0.bb
index e449b0f11f..779f618311 100644
--- a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/executablebooks/mdit-py-plugins"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
 
-SRC_URI[sha256sum] = "f4918cb50119f50446560513a8e311d574ff6aaed72606ddae6d35716fe809c6"
+SRC_URI[sha256sum] = "2436f14a7295837ac9228a36feeabda867c4abc488c8d019ad5c0bda88eee040"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


