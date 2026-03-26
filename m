Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AEE10A1E8A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:56:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46400.1774526206205150620
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YeSevuUx;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526206; x=1806062206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GwgZg8O38CO+6XkHZoGxKehT1X1Vm8n7v6ep+tj5LT8=;
  b=YeSevuUxEOxtn8YVC79i9MNKRe+W6vIBkda/SxGPWxAYUJoQv6Cw2g8N
   Y4qSoWEFxtnlq7WJwUvOYtnX22Lo9KBiVIK5UYQTe838fpu4unWQvZ4pQ
   G3oV2Bua4aJ7wfTPBIhQ8lJn27SR61uPxI4VcGavtz6ANPYPiCnrOEoP7
   8JmL6ZLnBzoWWqp1Ygo2Pn/olegqny+YkryPLCWS2zpy2HkQOsIgOtyMG
   /4NxKR0JhNsuAK8qDl8u57WqCn6h+uLMw38mLfQAU+bBKsi7KpTSuMVrS
   a9LzGSw9fMsQ4baeDdYTTZP6mzCLmZflOo/w1sOIQIz3ndRh4B5Q3rX6J
   Q==;
X-CSE-ConnectionGUID: Ds620KnZSmOZlgb2E7ghPA==
X-CSE-MsgGUID: 9vSpw8l2SMmzIqVciuiDdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213717043"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213717043"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:44 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9026C42A30A
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:44 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3E5651C00292
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id BED121807148;
	Thu, 26 Mar 2026 11:56:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/63] bmap-writer: upgrade 1.0.2 -> 1.0.3
Date: Thu, 26 Mar 2026 19:55:33 +0800
Message-ID: <20260326115634.1199-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125658

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{bmap-writer_1.0.2.bb => bmap-writer_1.0.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/bmap-writer/{bmap-writer_1.0.2.bb => bmap-writer_1.0.3.bb} (90%)

diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.3.bb
similarity index 90%
rename from meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb
rename to meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.3.bb
index f49aa480da..e08525b1c9 100644
--- a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.2.bb
+++ b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.3.bb
@@ -8,8 +8,8 @@ SECTION = "console/utils"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e49f4652534af377a713df3d9dec60cb"
 
-SRC_URI = "git://github.com/embetrix/${BPN};branch=master;protocol=https"
-SRCREV = "7489280a7a1247f23543343aba4e95bf2f2e8fa6"
+SRC_URI = "git://github.com/embetrix/${BPN};branch=master;protocol=https;tag=${PV}"
+SRCREV = "991e2c4264b843f61e502712f497103472a1b6e7"
 
 DEPENDS = "libtinyxml2 libarchive"
 inherit cmake pkgconfig
-- 
2.43.0


