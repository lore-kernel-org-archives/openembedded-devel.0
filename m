Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E10E10A1E9D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46411.1774526228175921692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mCzKplal;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526237; x=1806062237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c9tx1lJIMNDARuP5Kubt70uv+9N879rNUirYJX4c0EI=;
  b=mCzKplal7U1AWVlB5lYk/zHAB9NoPdXndoJxeHo2oc3jZErSgA1bZfqO
   9G85D7TWgaws5pE3Wk+2YBD38iCb9XiTDwt5A0hKHsrF1Lz9ExpKDoFx9
   UQvhmrvdKPg3AkjLnOR3RbRKnOSA8f0X5D8fZPR7pAdQFVeG4VsaXrrTr
   QfNY7RrReDJbuVBm7E0Vn+Nk4k5zP9NF0rwPvhnOe4sQPxkQk/ExKH/hd
   pVPlY/KIrPhLNUcC244Hvk9e7BFIVXstrrcyr+7tgWBVAYoLCHFLLbagL
   nZaqiaNblYcPIAYY2BxQGx2eQLQpKgUCsGKIuT/iNBTPMemRJasgi74KA
   A==;
X-CSE-ConnectionGUID: SgWyMlvyTbWD2ycm9jID/g==
X-CSE-MsgGUID: YAo1D9juRSm3ZK12iuN80g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="235420861"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="235420861"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:16 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 82DA9675C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:16 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 34A9AC006C4
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A7C33180714B;
	Thu, 26 Mar 2026 11:57:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 22/63] lldpd: upgrade 1.0.20 -> 1.0.21
Date: Thu, 26 Mar 2026 19:55:52 +0800
Message-ID: <20260326115634.1199-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125677

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.20.bb => lldpd_1.0.21.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.20.bb => lldpd_1.0.21.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.21.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.21.bb
index 044f1e0745..11e0e45696 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.21.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450"
+SRC_URI[sha256sum] = "5b1b0106079a0785b55e1be45cec40b66b41779f3ee6f1a8d2dbd75d389df091"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 
-- 
2.43.0


