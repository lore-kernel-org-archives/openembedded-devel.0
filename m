Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33D2CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:02 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19029.1779190790925853936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h6t2DwNp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190802; x=1810726802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BZe5u2iz9CtWcLo+RWrt8qvMWxZpwAiev6PLWIZ6J24=;
  b=h6t2DwNpPHRtZLZwhlBQpjQ3onuyelx1gEGOEUwQuOkt6THFpNUHxNIS
   3DzVSetWAgifHPMxfN9ifiw6J6lrJOYR66mLyZFXuZKKoG3JxHqImVHwr
   0nNf2ufk/7JkSq9dy7Y+hOzdeKaFEgJ7fCPh6PG/mF4Qx8a6iCPLntqhd
   5Ii5Y7mQp6bTVHt5iGMwqdBnp4RQtWHB/O7nvBuxejeoWW8T11WhVKlIy
   J1hRNolLBv0uwUxWjTDxXvct5lD7eEB/jM7Pj857mg765n9Xrqwbe1gtf
   2/sRKWJm12IPN+OGkqiSO6PmTKbxD252ncvCn77z3eF2gaqHPzuoNgAX7
   w==;
X-CSE-ConnectionGUID: tFKYHAVuRaOHAm6ODumMLw==
X-CSE-MsgGUID: zaBeXeo/QTaI3bIGUVmAaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="219995187"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="219995187"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:01 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 94C75100035B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:01 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 42BD71C135D0
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id ADC5D4066C7;
	Tue, 19 May 2026 11:39:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/38] python3-inline-snapshot: upgrade 0.32.7 -> 0.33.0
Date: Tue, 19 May 2026 19:39:00 +0800
Message-ID: <20260519113921.655-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127079

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.32.7.bb => python3-inline-snapshot_0.33.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.32.7.bb => python3-inline-snapshot_0.33.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.7.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.33.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.7.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.33.0.bb
index 57a1b4965f..c39ea57961 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.32.7.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.33.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "1a97a50420de32b86c422cceadf950f1f343ba03a28b878a757ee492b741c093"
+SRC_URI[sha256sum] = "856cfc18dea755dd78ffa0fbac8c161038ca0bfb4bd0bbb5d519f4bca3dfeff4"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


