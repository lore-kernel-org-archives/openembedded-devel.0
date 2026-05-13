Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F917CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:20:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.254.1778646034131806037
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G56bD00O;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646034; x=1810182034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XOVyHViH7qE8iUfENL6ZWBVoLBLWEE7mxFfMB7QDc7o=;
  b=G56bD00Owy0LOzXYixGLROrXBJl6QuFaYMo3fhRe1FY0lknJ1Zm3nup+
   ZYDqVawYy3COsV5PmWKqSL8ZSzhU1O6SYraCt2urKxr0LGIHaO4gtoSnR
   dUnWJ6GwRErdygq6LiU61zjmQQiMmGKrT+SKTLGhLVNUj3Ta6eIqkxXu4
   0lw7ipGu1kioY1NvpdaPoxsJy14H1Lsqlppaaz4NEVX7889hldfZ70m+7
   wXMA9g0HVM8InhGVvWMJrT0rVVsfAtHQ5ysfxD1arUy3pIFqPXUL2e/CM
   HEwPozIdzbYJnyitjjKBb363FVKekwS6D2zOQ9kk4H0JT+nlijrEPVJfv
   w==;
X-CSE-ConnectionGUID: hTGW05wnQBuD91G2pP2U4A==
X-CSE-MsgGUID: OmwggNIFQKS63soDNamJlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240208852"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240208852"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:20:33 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 92FF242A310
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:02 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 482381C00F8B
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id C1B0B14001C7;
	Wed, 13 May 2026 04:19:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/56] python3-typer: upgrade 0.25.0 -> 0.25.1
Date: Wed, 13 May 2026 12:19:40 +0800
Message-ID: <20260513041952.450-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126934

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add Typer Library Skill for Agents.
- Bump ruff from 0.15.11 to 0.15.12.
- Bump prek from 0.3.10 to 0.3.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.25.0.bb => python3-typer_0.25.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.25.0.bb => python3-typer_0.25.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.25.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.25.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.25.0.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.25.1.bb
index c38fbc9761..173a30fb76 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.25.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "123eaf9f19bb40fd268310e12a542c0c6b4fab9c98d9d23342a01ff95e3ce930"
+SRC_URI[sha256sum] = "9616eb8853a09ffeabab1698952f33c6f29ffdbceb4eaeecf571880e8d7664cc"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


