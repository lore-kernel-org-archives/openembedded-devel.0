Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3933ECFD315
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13210.1764061998877416235
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rSUMp6Qw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061999; x=1795597999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oBA1T15DEqk0nZ60e1ekJAXqXFWWvo0lhE4UzZw5RJw=;
  b=rSUMp6QwrAM69iqQT9cieSSzYCUmo7I+o7qbEYs4ZOyILjEauw/yns1C
   pVH/f5O8rcz91heIci/k+5g30EgtSRZ+o5FQh8+9SEHCLksX/rHg5k2ML
   wBMLnQUuFcnic0SBPxULLA+1LHElEtuLeqJpqIrGA5OQKzoNH5cY7VIqK
   HF3iHIzM6Mqg4LmhGORuxwgeKZKAFJxeAOczXgGctfUXAr2/ix4zKYu0l
   I/nqKCRgB7DRbvdAcjGemVDM8Vsu0WPHrKDyaEmVwze9MJq/lR+zDI2JR
   SugZWCd4RwuJPnpXXJOQ9kUZP1sRiCjb7NebwhLbxoLe5rnltcMdSgCKf
   g==;
X-CSE-ConnectionGUID: 35T2Gil4QcKtG+kwfyVDvQ==
X-CSE-MsgGUID: f89paaSCSeCuG/8EUpQnRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="219719353"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="219719353"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:13 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 372711C000A1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:12 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E275BC00343
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8036214001E4;
	Tue, 25 Nov 2025 09:13:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/26] python3-asyncinotify: upgrade 4.2.1 -> 4.3.2
Date: Tue, 25 Nov 2025 17:11:41 +0800
Message-ID: <20251125091156.1376-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122038

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.2.1.bb => python3-asyncinotify_4.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.2.1.bb => python3-asyncinotify_4.3.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.2.1.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.3.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.3.2.bb
index f95dadff90..810a142fac 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "8078b0b0d81c19043141ab0fc5654e89a4d3023dc3e4486aaa245b1ff5f5ddc9"
+SRC_URI[sha256sum] = "3321deedc443c8402229a423623d3ae2fc17c433b9b9bfe170828ee0c7ea3871"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


