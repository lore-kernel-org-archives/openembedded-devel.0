Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F93EE75434
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117305.1766567651911460820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KqzxPoNt;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567652; x=1798103652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cp9H1TxryVFAZRWMS/DRC5AkxmXpEdnszZWQ6R+8vWc=;
  b=KqzxPoNtTr3iVvUnXFu1Sl7105FQpruSei5Pu/V5lGRcTScsVnTTU+TQ
   fkow56Amvh/766dtUevoMMsLeAQpsMesdGlJOi/BuKGHZs9B5Z6QwrI52
   tmB0fTob0cuKKvh0ETfBr/MkzkjE9nXEJTh2g34fP1cto+Ht4h2q8yvPQ
   lNBxSgsj/SfPYxS0svvntwl+/RoWsJPhkCZlC2od+5zHLsd0kEPi6+6qi
   wqidZ4x+BYbwsv3NdZ3/6wSvM+F3ep0OWeOXQ6pGWL992kFWt59JfwA28
   blK59cbWrxp1lIqrRevV3VDAzFTEwOi4JBxc73KpkvKW+Ad+3G799yGyV
   Q==;
X-CSE-ConnectionGUID: npSD1Ud7RgW5qW1Up8Ifww==
X-CSE-MsgGUID: xP0h2BZ0TWW0BzFaheuJvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="202625813"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="202625813"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:10 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 47E7A1C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:10 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 016F2C02F32
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 2E6912000763;
	Wed, 24 Dec 2025 09:14:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/28] mcelog: upgrade 207 -> 208
Date: Wed, 24 Dec 2025 17:12:45 +0800
Message-ID: <20251224091304.974-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122859

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_207.bb => mcelog_208.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_207.bb => mcelog_208.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_207.bb b/meta-oe/recipes-support/mcelog/mcelog_208.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_207.bb
rename to meta-oe/recipes-support/mcelog/mcelog_208.bb
index b7800066ca..4a72cd4d66 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_207.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_208.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "bcd71be7776f1fdbd043064bf3034a0cbf297666"
+SRCREV = "2965a540ac2fbf1e0a992afd17c01747d6fd66aa"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.43.0


