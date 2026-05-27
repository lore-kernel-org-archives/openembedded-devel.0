Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782DACD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16925.1779875309172542350
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FDfHSWgr;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875309; x=1811411309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5hPYjjx81sPZTC6lpjmQEimckxq+8eFa5VosNJoGClY=;
  b=FDfHSWgrIb8/TfSBHgI3V1ZKAKOSRr8VB7M7JDZQPz7zlZPAKisRFwrs
   Ns3Jebi9XP3IoT4tlx9vR8Z2T7DjLrR1ypnNhnpxuPl8khXei82FVMRKP
   BTcsJs/OrU+Cd8+pxLWhPr4biwTHnz+j9R+iHvWoVRzWgVohb9/09qjqn
   5YV+ORPRAO+wQ9ZA9AJEhqfp2jt57Nz9Fln1n4wG1Um4RRZhlWa2O7wbO
   UPNFQKvhbKsZnshs6krwc49PwYhR1t2QHR3j6/n/eE0XUhq/g12S4oI8z
   26qJBolFDY9Q5cKnx1AZV2BG6LklFKq+a+PRiMfXe5i38Ezois53K4bt3
   Q==;
X-CSE-ConnectionGUID: mZYyro/IRm2LK/GXB3x29w==
X-CSE-MsgGUID: JO4nxLwrQYi+d3dp8F8Rqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="219714692"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="219714692"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:27 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9C9D54DE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:27 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 536C8C03F75
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7614582A2C9;
	Wed, 27 May 2026 09:48:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/56] graphviz: upgrade 14.1.5 -> 15.0.0
Date: Wed, 27 May 2026 17:47:14 +0800
Message-ID: <20260527094805.2039-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127212

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The MinGW packages no longer have libgd-dependent components enabled.
- **Breaking**: The 'diffimg' utility has been removed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_14.1.5.bb => graphviz_15.0.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_14.1.5.bb => graphviz_15.0.0.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.5.bb b/meta-oe/recipes-graphics/graphviz/graphviz_15.0.0.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_14.1.5.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_15.0.0.bb
index 388de9b452..f8fdb47cf5 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.5.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_15.0.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "b017378835f7ca12f1a3f1db5c338d7e7af16b284b7007ad73ccec960c1b45b3"
+SRC_URI[sha256sum] = "937fe4757687260e46a1c9a171cc677e3d4c89abd1efc8885ccb66467c3616ff"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


