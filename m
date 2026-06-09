Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FC1CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76246.1781000999797312638
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XXWMKEE4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001000; x=1812537000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GXaag/fEaefY9S2gxzsv/YKVu9IRc4DKSUtlOVPcGnw=;
  b=XXWMKEE4BayRQjhXWGoF3jQoUttglRSJ4QORthOW8xdv3Z6/5bIZPe5B
   J8IFaFz9lzk2tKL3w+Cgvl6ELQ7frH5GcByz0g8jFZJ7TcjYZJ/Fp6JYr
   dT/84ncckT6TiW/fTSH+rWxfqVnqllyrpb1RU4H04sUAaRYaa/8u9X96P
   1jpud7J4vfZdqBFBkXKqjJpCWYGHCHmmDowmFCwZhitkDXpDk8IBb6ntv
   lcpbygYyOeTpibIDjfsboqwnvmjwjc3cmh1dtOUIYsMuQVKpO6/N2JoCW
   WgCfoNp2xgMn4uPmCs0QORY7g79MVtndlHYcrXJij0V7Bn03fdmC/K+dO
   Q==;
X-CSE-ConnectionGUID: CeR+Mm/XRiO4BpM6OYg6Fg==
X-CSE-MsgGUID: P0gDatdCTcOxTTBDu1BlQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="230895874"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="230895874"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:58 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 60B781C000CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:58 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0D57BC09B60
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 2754610003C5;
	Tue,  9 Jun 2026 10:29:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/30] python3-cyclonedx-python-lib: upgrade 11.7.0 -> 11.8.0
Date: Tue,  9 Jun 2026 18:28:59 +0800
Message-ID: <20260609102913.2204-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127470

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- chore: extract glob for pyupgrade to separate script for cross-platform compatibility
- docs: update CDX summary
- chore: fix test coverage reporting
- chore(deps-dev): update tomli requirement from 2.3.0 to 2.4.1
- chore(release): use own GH app for releasing
- chore(ci): pin GitHub Actions to immutable SHAs while preserving tag tracking
- chore: add zizmor workflow to harden GitHub Actions security
- Update PULL_REQUEST_TEMPLATE.md
- chore: Update CONTRIBUTING.md
- chore(ci): comments for pinned actions
- feat: add support CycloneDX 1.7.1 & 1.6.2 & 1.5.1
- chore(deps): bump actions/create-github-app-token from 3.1.1 to 3.2.0
- chore(deps): bump actions/download-artifact from 7.0.0 to 8.0.1
- chore(deps): bump actions/upload-artifact from 6.0.0 to 7.0.1
- feat: pull SPDX license IDs v1.1-3.28.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon-lib_11.7.0.bb => python3-cyclonedx-python-lib_11.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cyclonedx-python-lib_11.7.0.bb => python3-cyclonedx-python-lib_11.8.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.7.0.bb b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.8.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.7.0.bb
rename to meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.8.0.bb
index 56c108c6fe..1947b4b2f4 100644
--- a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/CycloneDX/cyclonedx-python-lib/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "fb1bc3dedfa31208444dbd743007f478ab6984010a184e5bd466bffd969e936e"
+SRC_URI[sha256sum] = "a8935b06dfe53d80efd47b5f6a202eb678cea00f2930e94e3710f2c1510166c9"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


