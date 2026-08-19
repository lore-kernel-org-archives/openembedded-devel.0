Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DECC5DF8C
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3321.1787132170962724067
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WWvfyKHo;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132171; x=1818668171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G+3k07E7oqcywlS4L56pt72xaNuSMBaxCDW3JW/0l68=;
  b=WWvfyKHoOlzYLwh5ycJ1U1PK6gdepmoqVX33OqCTWhJsCxlm8/FWmC1p
   qTOI3jy0S0E7MWT1w/Ys2pQTc/Oit2Q4lc91+hgVKq49CxlWi4bJ/BOvP
   pOygS1T9S+d4WPw4E34suYoXWcX4oyFK7SEzZp8UNyXVfTsfSdaKial8m
   64/7kzNcwVRQoScSMQv77yKiQ0dEHMJQkCrfHZHWkKyJwTiokni1A/YNX
   +wlImsS7mTPStOvewkluM2xLEkaykej0E8Yy4eK5KoL2voqlZbeQxbA1b
   0F05vEGqsfmrl1yq901xfSsn1SABXdDf+eI9XChWC4rU4MmPnhR3Pa2JT
   Q==;
X-CSE-ConnectionGUID: GIV7bNH4SeqVIxf+NM5Lmg==
X-CSE-MsgGUID: vcZNDlh4Q6GtBPVpRRC3/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239835360"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239835360"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 372108200BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:09 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E6777148AD3B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id F41361801C0F;
	Wed, 19 Aug 2026 09:36:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/70] python3-elementpath: upgrade 5.1.3 -> 5.1.4
Date: Wed, 19 Aug 2026 17:34:32 +0800
Message-ID: <20260819093514.1101-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129298

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add allow_environment and allow_external_resources arguments to XPath30Parser
- some/every statements: revert to v4.8 implementation
- reverse axis position: workaround until next minor-version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_5.1.3.bb => python3-elementpath_5.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.1.3.bb => python3-elementpath_5.1.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.1.3.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.1.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.1.3.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.1.4.bb
index 88b0995720..8f15d5c723 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c04ab6ce886cc843af8941bb199406ba"
 
-SRC_URI[sha256sum] = "35e98cc2e26332305a49b32eaaebfb7289d1963c88d3989ff5ccb02c46809820"
+SRC_URI[sha256sum] = "3c912a9c41311ac5244c038867670d7c0b0fec0e444813608e5b846dbb3428ac"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.43.0


