Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00268C531C8
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44634.1784715888279986838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nmvhTYQT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715888; x=1816251888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9vRV1W3ugVba+fRl1FFqQW/qyZq0vY7kJMHL59lQBYg=;
  b=nmvhTYQT698VnUEE+ZSnkOkeuJbLA3o9F2N9ehKEJ7XOBwwo0ugKwdtt
   aQDLSk0lm8h9TtddinJq4MzyU1wEXqmPstAnhO8/e/xvE1FUfrg8SeuQ2
   Jy41w7wiVQNuZNRnsNy3wyk2ynLMUsA2FO1rl+4nGFY5qqTVpiKQqwG1u
   1yLiPYalG0RlHkJubhYF6OVgKxoLM9OpIuwfbjGyevQOUrmOyZvpgl+mV
   Vq4tXCYRfZxFogQLWpGMyjx0F6h0T5XeB/uvKTbqSNlBy2xv3/QcnfVRu
   CFvJYwuu6mDeTD+OaqOn/V1wYyqXpQ9V4zy7XYpsPgHBWrLnn/gFVl8uv
   g==;
X-CSE-ConnectionGUID: 902fjuPDRqGTp7wi4zw2eg==
X-CSE-MsgGUID: lWpifJ1VTOe6UcQHEacCdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="246377114"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="246377114"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:46 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B27F6100034B
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:46 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6044E1C000D7
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 67D944046B3;
	Wed, 22 Jul 2026 10:24:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/37] python3-typer: upgrade 0.26.8 -> 0.27.0
Date: Wed, 22 Jul 2026 18:23:15 +0800
Message-ID: <20260722102320.1019-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128402

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Bump the python-packages group across 1 directory with 5 updates.
- Bump ty to 0.0.53. PR #1877 by @YuriiMotov.
- Bump the github-actions group across 1 directory with 4 updates.
- Set Dependabot schedule interval to "monthly".
- Bump pre-commit hooks.
- Add GH workflow to bump pre-commit hook versions.
- Fix latest-changes checkout target.
- Update issue-manager to 0.8.1.
- Bump the github-actions group across 1 directory with 8 updates.
- Bump the python-packages group across 1 directory with 5 updates.
- Update latest-changes to 0.6.1.
- Bump https://github.com/crate-ci/typos from v1.46.0 to 1.47.2 in the pre-commit group across 1 directory.
 -Bump pydantic-settings from 2.14.1 to 2.14.2.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.26.8.bb => python3-typer_0.27.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.26.8.bb => python3-typer_0.27.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.26.8.bb b/meta-python/recipes-devtools/python/python3-typer_0.27.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.26.8.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.27.0.bb
index d7c95a01eb..42b5cdc07d 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.26.8.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.27.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "c244a6bd558886fe3f8780efb6bdd28bb9aff005a94eedebaa5cb32926fe2f7e"
+SRC_URI[sha256sum] = "629bd12ea5d13a17148125d9a264f949eb171fb3f120f9b04d85873cab054fa5"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


