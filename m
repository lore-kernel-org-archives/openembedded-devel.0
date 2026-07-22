Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D45C531BC
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:25:01 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44625.1784715867079135931
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YtPnpWMO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715870; x=1816251870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RL9/kj+MQfmkTg533/3U6UW9zAe5bS2FKXHsF+PhXzI=;
  b=YtPnpWMOemWwYgFPPgolqau/v++t9FlnxNwsDrpTraZoIYjWvp7bBI+l
   V2OVk9Vgh/zLKlnZL5VZw6N8XkbsoCrU7IDx0vJ+UDznyO1oHSbKWAPNb
   Y9pREPQ0mgbJDkXK9zlv6Y1IkXhOVrqG3EbhSozGRH0MJgNCpBLVaCFt6
   VC1jpBeNAeU1bblYwFExzpG9Mf1VZaXtcRaQaUjgbM13pmEgMkTIssx2G
   Ebe+0cEl+5PWP9MF2Uf6xcYL8RnfyALintlZa/EvLuPq/sV1W69XhC5jM
   ZZOFpISchH+eOVsI7xnHE/aydR0E1dxQJunZg7nSUUQSdAd4+RhXQFn3l
   Q==;
X-CSE-ConnectionGUID: /AGzzlwCQAuaphRagjtrkQ==
X-CSE-MsgGUID: 1DwAMzgiTCSaMCaYrmGG1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248149634"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248149634"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:28 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 621998204D8
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:25 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1835F896E09
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 2FC8740433C;
	Wed, 22 Jul 2026 10:24:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/37] python3-inline-snapshot: upgrade 0.34.2 -> 0.35.2
Date: Wed, 22 Jul 2026 18:23:05 +0800
Message-ID: <20260722102320.1019-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128392

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fix passing PYTHONPATH, PYTHONWARNINGS, and PYTHONDONTWRITEBYTECODE while
  running the test suite.
- fix passing PYTEST_DISABLE_PLUGIN_AUTOLOAD and PYTEST_PLUGINS while running
  the test suite.
- inline-snapshot now tracks source files that use external() in
  .inline-snapshot/files_using_external.txt (inside storage-dir) and uses this
  tracked list to detect and trim unused external snapshots.
- The tool.inline-snapshot.test-dir configuration option is only used as a
  compatibility fallback when files_using_external.txt does not exist yet.
- Documentation examples now use rich terminal snapshots to show pytest output
  with colors and formatting.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.34.2.bb => python3-inline-snapshot_0.35.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.34.2.bb => python3-inline-snapshot_0.35.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.2.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.2.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.2.bb
index 6dfb1f1ca7..3ac79251de 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.2.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "d160cb6059e00916c2e846abc014ead6f01fb24479f13696fb8670d7a7937f67"
+SRC_URI[sha256sum] = "6cfd2ea0b52d9cb9beb13c1e73d740ff86f630ba48d9ea6947e54e3ff8494876"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


