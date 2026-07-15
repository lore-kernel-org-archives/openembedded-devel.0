Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51641C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3431.1784112035952588858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LAChIFvM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112041; x=1815648041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=opf51rGk1fEHonKH2F+XUEYFkH1ngVRm4w4VOrWhqYw=;
  b=LAChIFvMjjdacg3rNGqv/hMbiqtsVBoU/RNOLxw0AEkc5UxinQTtFfIZ
   SCB7WTjMRChBjG+AJ3Inv/uhJAVhx1UV3KMnoxQCEF+EDbEHdX5BSV1xX
   PZ3vQcVRPZ90NVln2v5LNM8YeE9jUWTI75vqzEMOt/uXC5ZqCTze23Yiv
   Beq56pAGpb9+EgKRHM8wtJqegiSP2wU+cOFQiwcBfQfbva4WHMJIHr57b
   ENJY8KWumQ6SW1DREwPMepsvkdKIhtQ4Ff8pKgG6as9X6LWV8lhzhmg0E
   ItoftZtld4iHhy8GcOokjc/CjoFuMaJDiOIapJ9UQump2+xRknOb9v0bQ
   A==;
X-CSE-ConnectionGUID: 2aH40uNhQ76CInMSEiF0oQ==
X-CSE-MsgGUID: Xj7BvBoZR3Sch9w6NMF+Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247518964"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247518964"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:41 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8199C1002819
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:40 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 39C9918578CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 572961800B81;
	Wed, 15 Jul 2026 10:40:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 41/44] xsetroot: upgrade 1.1.3 -> 1.1.4
Date: Wed, 15 Jul 2026 18:39:11 +0800
Message-ID: <20260715103914.2120-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128214

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xsetroot_1.1.3.bb => xsetroot_1.1.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xsetroot_1.1.3.bb => xsetroot_1.1.4.bb} (81%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.4.bb
similarity index 81%
rename from meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
rename to meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.4.bb
index 7e909f90cf..b1ce3fa599 100644
--- a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.4.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ea29dbee22324787c061f039e0529de"
 DEPENDS += "xbitmaps libxcursor libxmu"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "6081b45a9eb4426e045d259d1e144b32417fb635e5b96aa90647365ac96638d1"
+SRC_URI[sha256sum] = "1315a3f7e9abe06357363b93461e272601f67225ce0bc075c430cce35073362b"
-- 
2.43.0


