Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3B9CD6E64
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:09:15 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21235.1780394943783420458
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aCVbO2k9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394948; x=1811930948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fnde7lekgDaHhNmL0svwqdnNEq2PsWSejanPCvzaOPg=;
  b=aCVbO2k9PBNpsSguGRZ8TwXpXB9upaEZbgcNbJnWNM9Mxx3iYRpjlepn
   IUeraqHzNCystyUf1heQO8clYKdEQZyljD09Ax+IUO1NmXm+e8oiUYuDC
   JP471xhw/wpz6u4LyT0MbRzO900x5Gd2nS6Gapnph04u+zJP+770lniZg
   e9C1Y0UskxVffprBRux3Qs1IK6x6YV+RLVRUs87RejBm2JeLs2Qy67I1H
   cRXkvMJslXI6IuMhE9fPGX8sBFhWIiPIGg5JTjAh6he76n8EGAAUG3hxy
   JEPsmyLwOwwHfBRdTeHU/KFH9w39gwc1hxoeJ5wZ2X8ch0VLXHVA9Zvt5
   w==;
X-CSE-ConnectionGUID: 5Q5eiuQ+TOiZkShmv84OTg==
X-CSE-MsgGUID: h8sy3akAQ+aHn7KD46JILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="228863300"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="228863300"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:09:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BC6421C00095
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:09:07 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6E4C9180CCF5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:09:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 860371800522;
	Tue,  2 Jun 2026 10:09:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 38/38] xlsclients: upgrade 1.1.5 -> 1.1.6
Date: Tue,  2 Jun 2026 18:07:54 +0800
Message-ID: <20260602100755.2117-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127359

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xlsclients_1.1.5.bb => xlsclients_1.1.6.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsclients_1.1.5.bb => xlsclients_1.1.6.bb} (83%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.5.bb b/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.6.bb
similarity index 83%
rename from meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.6.bb
index d73a27f971..5ba0831dec 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.6.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=350e1b718a56df39cfe8ca9345ea4575"
 BBCLASSEXTEND = "native"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "68baee57e70250ac4a7759fb78221831f97d88bc8e51dcc2e64eb3f8ca56bae3"
+SRC_URI[sha256sum] = "909810a3fdbd01d84747907f2c0cc32ee732e77afc88cb310abb9d155b2a0807"
-- 
2.43.0


