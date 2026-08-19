Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23601C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:32 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3330.1787132187341698754
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HwAsiIpR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132191; x=1818668191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7NK3QpXulPuP70w4mXNzo1c31me4YkGl0o+yBji3KwQ=;
  b=HwAsiIpREt1LBTwyT/Agwk7N4t/Fvckk8IWdPVPIhEEAqVxlQQ5AN0KM
   B3YHzg66Z9TkSEYqSI+PT22q82j9CpcDdJCl3F2pGPqYSmZ0faLJHuhuf
   6YBFTCTUTgaOu0SPwcAyRclYTqCx5MzlTmh01uFXO/lt4Lofefuyb3x6K
   y5XozbGdHDyzuwlgmalzMZzA5LPL0xEZTOz3rj8QntCpFDTsJCh6nPJ9p
   PDOBnTzc6SBebTW/OezIW2BxyYLQVwelSI2fOrbO+HfLfmdIiSVRpcke+
   wYCRueEcIbccnQbthxVjrfio9hDVGfkdnYolXiiBx+qc0XsnI/doM0Y24
   w==;
X-CSE-ConnectionGUID: Ev0H5Yw1QsuIh7L6uiOd8w==
X-CSE-MsgGUID: 6GC75PG2QjOpdYA0IfESSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="230759459"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="230759459"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:29 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B0BC2FC8B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:25 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 64B7B1000104
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D93851801C0A;
	Wed, 19 Aug 2026 09:36:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/70] python3-inline-snapshot: upgrade 0.35.3 -> 0.35.4
Date: Wed, 19 Aug 2026 17:34:41 +0800
Message-ID: <20260819093514.1101-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129307

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Prevented --inline-snapshot=trim from changing snapshots when a test body
  fails or pytest is limited with -k, a test path, or a test node ID. Skipped
  tests and fixture teardown errors do not prevent trimming. A message now
  explains why trimming was disabled when it was requested implicitly. An
  explicit --inline-snapshot=trim overrides this safeguard.
- Fixed a crash during session finalization when pytest's capture plugin is
  disabled.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.35.3.bb => python3-inline-snapshot_0.35.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.35.3.bb => python3-inline-snapshot_0.35.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.3.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.3.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.bb
index 466648f41c..c4af98c9e0 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.3.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.35.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "5d76f3b4b134fb190b7883669eb496f5c3e7d1c9549bbd6d78b5b8ac17e553e3"
+SRC_URI[sha256sum] = "82432a58b7ea77a172515f5024cd26fdea8dc0f873c7a4251e4e0471a914db14"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


