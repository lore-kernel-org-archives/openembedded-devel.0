Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F85CD6E67
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:14 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21211.1780394884280178988
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mWhoRKnn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394885; x=1811930885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oNwAEbMCli5KPvNswFkz9npp6Uaq5Jeg0b9vV1U3UOA=;
  b=mWhoRKnn0rrFbCdMJC/2z+yL4ihYyeRlqb/2vkepsszW9FNnuWWIc3C5
   Oz2/tHLaF2i9pvX90RS8yTwVJ6hrGytrjwKYHoegFM4bsu3MrjJjCyW+Q
   z6Nurx1H/4bNUK5sj9cvsn1mUjAivt5xd0puGqaFD8nCHGpgO1du1J9eR
   +Wxo9ToDs2X/XmQzHE0UMMnOj1OQ/JzcRSOShsjijB0N8FZqbJvsC9yS/
   cFapBwKyIfq1615cEvoOoplpTqbASKlHKEp4kMFag4EKQgN4EFLt4MVxM
   2teDCfIvoBPFHTQA1IumjSerm/vBItPC6m3XXyC92lb+WxqFoyQRoOMQf
   Q==;
X-CSE-ConnectionGUID: vT/k2Z5GSEWv3B9n2pteWw==
X-CSE-MsgGUID: 0XELR1fzQG+1pqRaQtBoug==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="245981254"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="245981254"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:03 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CFB881002B84
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:02 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 87E60181AA54
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8B7E21800107;
	Tue,  2 Jun 2026 10:08:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/38] debootstrap: upgrade 1.0.143 -> 1.0.144
Date: Tue,  2 Jun 2026 18:07:18 +0800
Message-ID: <20260602100755.2117-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127324

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{debootstrap_1.0.143.bb => debootstrap_1.0.144.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.143.bb => debootstrap_1.0.144.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.143.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.144.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.143.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.144.bb
index 531d613cea..543d7405a4 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.143.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.144.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "c638730e50d3cd8a46ff4ce8b1f74d579e9c8323974285cf3fd1ac36aa8f2ade"
+SRC_URI[sha256sum] = "3e1bafd4bb813cf4d6c17a0adca449ca07603263a8ea40a67257d2d60c186f9a"
 
 S = "${UNPACKDIR}/debootstrap"
 
-- 
2.43.0


