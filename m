Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F1E1112259
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:14:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7071.1775096057622354780
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zoxg+meE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096056; x=1806632056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e+lV3ciPEFGl5mte/Owg2SdY8wF/SPkDzJ1FMkMHPv0=;
  b=Zoxg+meE31EE1bzPI8IqRYBc6k4tE2MVknsP1Ia3jF2YX3YSuCGH5Pho
   1AsUVhJLOdogp+eTIpqZHGus7bUhx2WGl1t/VIxLRdyAEIH9qYFMdQcUG
   plMZKDoVd3ZyG7gI4OvusYudtmEyRtohEIi0GhcNk/rrkl9GYpVmzDQRB
   v0YDuv/c/fenawIPrykIgvKRLR6PRS+I55R8GjfyGfPoP+TK1H7qsMe9r
   W9C2HMFe5BGrxqvODCqX7zUDFr+5dhC6UAWnBmNJKuEBuWofkSKABUjMw
   hfEqTBJ1FFAE4KxWV1mTMu5hoPZKld4GZowjF6TRhT39vIYs625RCUWN0
   w==;
X-CSE-ConnectionGUID: Oqja6pcuSsOpQoZoz7dUdA==
X-CSE-MsgGUID: d49Rlbr8Qp6I1xJTnwnQUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235493301"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="235493301"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:14:15 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0BE558204FA
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:16 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B9C73C252F6
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5D3C91003740;
	Thu,  2 Apr 2026 02:14:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/39] gegl: upgrade 0.4.68 -> 0.4.70
Date: Thu,  2 Apr 2026 10:13:22 +0800
Message-ID: <20260402021355.1324-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125922

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.68.bb => gegl_0.4.70.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.68.bb => gegl_0.4.70.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.68.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.68.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb
index 83612aa3f7..64ff475dc4 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.68.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb
@@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5002309b9a701260658e8b3a61540fd5673887cef998338e1992524a33b23ae3"
+SRC_URI[sha256sum] = "47f50d9c3aecd375deb48c11ebfead52d162e4fc162a4b3d44618277f1faec02"
 
 PACKAGECONFIG ??= "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "librsvg"
-- 
2.43.0


