Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE59CC6B00
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 06:57:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10213.1775113018009809952
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 23:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mvUa4CvD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775113016; x=1806649016;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XQHGxVQD/8F/vdnf+K6NcSXGCFQGQRuUnyzrKA2y4yU=;
  b=mvUa4CvDL1pQiWD83WPG/wKIKy8aY+d6ZeFukFgkNETADMkabeL0DBkr
   npZeCO2cLxVYjnVqnr8c4Shox6/AxGn5ighemFWZPX6kCzHWGijcVb0ir
   HRlcjIi4CknNHsSFUY1ny2URuFYWyqW7+JCUe7bmkwIU1t4Pq9aMWR4No
   zcbss2bvzk8v/AZaWIS1nO7fAzyzayTlEAT7V7V/anuQmVgwFmBe5S5uM
   zML9AiyrV7yGZLhkFGA5d63g0wLJy9Dhlc4GWFJgndO+OMG/1aEyz0KKI
   grnKhkhk229TkHynmeR1os2Yz+28k8MwZFH/srtTgMlX6XDk2HeahEMv+
   w==;
X-CSE-ConnectionGUID: sAw4HTnJTVqi72miRDETzw==
X-CSE-MsgGUID: f7zXuRzoTIeOURNXhisaeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="223468133"
X-IronPort-AV: E=Sophos;i="6.23,155,1770562800"; 
   d="scan'208";a="223468133"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 15:56:54 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 225331C166C9
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:56 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id CFDB11400605
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:55 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id AA0B8100375E
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:53 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] libtsm: upgrade 4.4.2 -> 4.4.3
Date: Thu,  2 Apr 2026 14:56:49 +0800
Message-ID: <20260402065652.14800-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125959

Changelog:
  https://github.com/kmscon/libtsm/releases/tag/v4.4.3

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../libtsm/{libtsm_4.4.2.bb => libtsm_4.4.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.2.bb => libtsm_4.4.3.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
index 6f060cd0f5..8168360dec 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "b052e48cc776be1cdb940be2dcc1603457c01c96"
+SRCREV = "6cdacfc452bf29d98e297fe3a96e55e94a88ce3e"
 
 inherit meson pkgconfig
 
-- 
2.43.0


