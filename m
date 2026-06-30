Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FC6C44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16855.1782811342477526380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S1dZA6hC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811343; x=1814347343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cCLqfBq9/r95UE1mmsK3Bws0xCs/uHFAUCt4vaiJeds=;
  b=S1dZA6hCML1uPkFiNMdY1OmIpZaRAq5mhhkVbJ4Fei/WICpqTQFPnWDb
   7dXM0qBrGcnApCmYHgw/tixSWHQSkXo5ge16sNIppac10qG0OO/C0hVHV
   N3NOYhQUzg7uI1z/Fgtp+Dvo1wypPCr3bCVUaKWFNQ+wakiEbymOhtUQl
   UGKEZDHB2CWFshUG/BUVkA+mDeybMcnOxdVh7qh/e3HxpdL87KKi/jtk4
   C5vPECO2HRa5I8vFcW1tFEaKNRWdRMiX4blchpwgxDRiP3LL6eqKfFlG4
   9f0/HcIlZJXBL5S9DfriVAAfT/JqFVwLEOp4Q/DsTUK29fobU9evx+BGj
   A==;
X-CSE-ConnectionGUID: nsoosr0zRvqfmV3z60ZWiA==
X-CSE-MsgGUID: 84qxbgxsQAeB9ZcP2vYsSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245819308"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245819308"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:21 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ABF427A65
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:20 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 58DEA1C00147
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 817D6826FEE;
	Tue, 30 Jun 2026 09:22:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/37] libass: upgrade 0.17.4 -> 0.17.5
Date: Tue, 30 Jun 2026 17:21:35 +0800
Message-ID: <20260630092206.322-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127949

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libass/{libass_0.17.4.bb => libass_0.17.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libass/{libass_0.17.4.bb => libass_0.17.5.bb} (91%)

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb b/meta-oe/recipes-multimedia/libass/libass_0.17.5.bb
similarity index 91%
rename from meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
rename to meta-oe/recipes-multimedia/libass/libass_0.17.5.bb
index 3165736981..6237f35745 100644
--- a/meta-oe/recipes-multimedia/libass/libass_0.17.4.bb
+++ b/meta-oe/recipes-multimedia/libass/libass_0.17.5.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 
 DEPENDS = "fontconfig freetype fribidi harfbuzz"
 
-SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=master"
-SRCREV = "bbb3c7f1570a4a021e52683f3fbdf74fe492ae84"
+SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "4a05d8127f525943ebf45fdc6497c9e665947f0d"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


