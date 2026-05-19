Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6E3CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19323.1779190828299705321
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SVW3dGyw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190828; x=1810726828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dYRNUBWKI536IfdZj55s+lZ9dd3kO4u3h1VKDF6mGEc=;
  b=SVW3dGywchgYd4kHfzyjug3ZT9oXkYfVXgX0M5rTUpNO6zNLmY9hipjC
   8YLGP+iMGnYXut4fYdh/dnjRL6owfAaLpCIvj/UJpLJ6R9bR9pUtUSWnV
   e8OfQe3feO5nT7TSh60rmlcncZeRvG3AX4rLfFBj+vKyWlfe0tStZEtrx
   tB/FrVgAzd1PIfRQqAkapVeET5gsUxUSasR0Nv2wF0EDt0yPugQih8naL
   xcPLbuucppcLf125OGv4MB4eLpq3fvtnuBBRwYGQINO52E4nGK0xiDL/h
   IkeV9D+ndqr3fYSClIekmwscwzLTS9HFqm+Ahvx8MPlzpRsC3qDD+BYvS
   A==;
X-CSE-ConnectionGUID: Q0rCcduLSBCXDqMesuMhyQ==
X-CSE-MsgGUID: Gfde0WaXSliSDMW9lGCPbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="228472106"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="228472106"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9D881306B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:26 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 536B6C0209C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id C809A4066EC;
	Tue, 19 May 2026 11:40:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/38] python3-myst-parser: upgrade 5.0.0 -> 5.1.0
Date: Tue, 19 May 2026 19:39:04 +0800
Message-ID: <20260519113921.655-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127083

From: Wang Mingyu <wangmy@fujitsu.com>

New Features
============
- Add "alert" syntax extension for GFM alerts (e.g. > [!NOTE])
- Add "gfm_autolink" syntax extension for GFM autolinks
- Add myst_strikethrough_single_tilde config option to allow single tilde (~)
  for strikethrough
- Add myst_colon_fence_exact_match config option to require the closing colon
  fence to have exactly the same number of colons as the opening

Improvements =============
- Update myst_gfm_only mode to use the unified gfm_plugin, which now includes
  GFM autolinks, alerts, and improved strikethrough/tasklist handling
- Improve MathJax 4 compatibility for Sphinx 9
- Stop directive-option parsing at colon fences, fixing nested colon fence
  directives

Bug Fixes ===========
- Use docname instead of source path in warning locations
- Correctly encode & in Markdown URLs by not HTML-escaping refuri
- Fix RemovedInSphinx10Warning for inventory item iteration
- Pin mdit-py-plugins>=0.6.1 for nested field list fix

Dependency Upgrades ====================
- Upgrade to markdown-it-py~=4.2 and mdit-py-plugins~=0.6
- Update pygments requirement from <2.20 to <2.21

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-myst-parser_5.0.0.bb => python3-myst-parser_5.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-myst-parser_5.0.0.bb => python3-myst-parser_5.1.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-myst-parser_5.0.0.bb b/meta-python/recipes-devtools/python/python3-myst-parser_5.1.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-myst-parser_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-myst-parser_5.1.0.bb
index 826d1f8f87..6471e370cc 100644
--- a/meta-python/recipes-devtools/python/python3-myst-parser_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-myst-parser_5.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/executablebooks/MyST-Parser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
 
-SRC_URI[sha256sum] = "f6f231452c56e8baa662cc352c548158f6a16fcbd6e3800fc594978002b94f3a"
+SRC_URI[sha256sum] = "ab69322dc6719dcc7f296479dbb70181b66df6ed315064f92dbc85c0e1bf2f02"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


