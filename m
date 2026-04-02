Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F591112251
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:14:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7190.1775096052976715283
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AcpsGsyg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096051; x=1806632051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oPXjjdpv5kkNp9enrH7Y3/aA8L41VgTHcayCE2ayVYw=;
  b=AcpsGsygCTeOL/OGR2supSGF/myDI43bTbySVHXlJY9Bw4cl896M1cF0
   LZVm4AkaTvdGpBVsgyV85FHYieUzJm0B/34+o9FJ/5JPPFr9BTa9yZSgT
   qeVoP2kGSIVMy7fS3l6Sv7+SFB2HeGxCKkterLp/nnEK9LXH3JzqRoSPk
   Vpe/9e+wRphJDXPU6MWh0w3EL45Km0X84oEpsGB4ebr+W27LDug0kd5aO
   rFk3Um34aCKc17d8oprtMexh+HVXkgeKm/JGePpp6updGR0B6WSCGcAgu
   NzPXhFIyz+zInozZw8dexeiUptUY3dTOD7iV5zT4bPNIV4xJByh5K/GB+
   w==;
X-CSE-ConnectionGUID: SRQzqSP5Rwm1IwPugyIWSQ==
X-CSE-MsgGUID: qlhg92z0QtiNukvQRmo7lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="224160829"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="224160829"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:14:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4A4CF820C1B
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:11 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 05189145A2D2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9F3D5100249C;
	Thu,  2 Apr 2026 02:14:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/39] debootstrap: upgrade 1.0.142 -> 1.0.143
Date: Thu,  2 Apr 2026 10:13:19 +0800
Message-ID: <20260402021355.1324-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125919

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{debootstrap_1.0.142.bb => debootstrap_1.0.143.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.142.bb => debootstrap_1.0.143.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.142.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.143.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.142.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.143.bb
index 1478ebb1e4..531d613cea 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.142.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.143.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "334b188c2bab5c1aa6f858a044274631d342f07f5ddec1bad870d728f02fd652"
+SRC_URI[sha256sum] = "c638730e50d3cd8a46ff4ce8b1f74d579e9c8323974285cf3fd1ac36aa8f2ade"
 
 S = "${UNPACKDIR}/debootstrap"
 
-- 
2.43.0


