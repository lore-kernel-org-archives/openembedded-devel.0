Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735C2CD8CBF
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:12 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76507.1781001004444133264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tvaw4GoZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001005; x=1812537005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pr0ponwrisc8r15RHQCAQufSrouOfMfGuM2y4D57/7s=;
  b=tvaw4GoZGvm0iEU3OQchIJ+E05FDMQbkAKZnbN3EWvw7WzXlG2EPZbTL
   5ceXyUzn7z0tOFgvwlF5NwxyTUfTBGShDRStWMBo/+hUvspAxLYl5gjBN
   ztCdy2wcwBfPbTdf6fmjQHrKWCwyMxdcY6x+WPEgFQgJCvMHs7E4NQtny
   XM/IJef2oV/PeHcN4AKxOHuqtPm+6W9Kujda9Cewk9WY9p7TMd5VOmYPg
   FZNHWz7UAL/YQ58Wol8H3iE+v558/VwPEL2wdI5ImD6vGcWjgwI+OJITc
   jVwzvJkQU/A7z8U+shqUm3SU5UhoGqo93DwkVh+WiAnIkPAYKNgCYzlov
   Q==;
X-CSE-ConnectionGUID: EIKkSIaeSHSii5kzRIOZ4w==
X-CSE-MsgGUID: T/PsV3tOQwy8+V4rdGBxIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="243544174"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="243544174"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:03 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E4AE51C1C70A
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:02 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9B745C06BD5
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id CA43910003C5;
	Tue,  9 Jun 2026 10:30:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/30] python3-inline-snapshot: upgrade 0.34.0 -> 0.34.1
Date: Tue,  9 Jun 2026 18:29:02 +0800
Message-ID: <20260609102913.2204-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127473

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixed snapshot_arg() to use the fix category (instead of create) when
  creating an argument with an existing non-ellipsis default argument value.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.34.0.bb => python3-inline-snapshot_0.34.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.34.0.bb => python3-inline-snapshot_0.34.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.1.bb
index cc665919fd..de3c84aaaa 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "bb814ada843aba77356516dce5e07857bb76591c4258296a087a7cbe9e0d70f7"
+SRC_URI[sha256sum] = "f8af37876c42069b7c0ed73f64357ace482955c3225ebcd27f243197ecfbcb65"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


