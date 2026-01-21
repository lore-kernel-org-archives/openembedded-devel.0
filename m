Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08065C4451A
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:33:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9546.1768995193769012729
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pzUaTdwO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995194; x=1800531194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PBbkpVAFaYJZ0RqR/wY/gENpxV6o1t8jpi45WGqk1sU=;
  b=pzUaTdwOrd4lIU7YRkckMGFhMuqSUTio70N5r1iCIyCYxqawzMl0XGpA
   4i8kQ8eFoeO9wMiChyUYCbD6XqXQA5n2y6VMeUXGExVwoNMOqdZOzxIeH
   +OsLsh0OjuYH1dfR6Yww/P/NkCsfl7pnqw8G8nQOnuVf1EkvkWKS/huTh
   brp8YhGZCnk+ItUMTas9G4TpBLhn9LcPWhTCKyLb79GaySboYR0ldtxVb
   9QW29d6W70Oj+QQCaN5+ia2W+6gMpcwtC7plcoxYxwmkVgKIOkxjivfUe
   7Fes1OAcWxzmaBUf1vja80dB4unTLR/eB7ZFnS5diBNIXcc2SY2lp46J8
   A==;
X-CSE-ConnectionGUID: C/iRzVfkT8m7aKqBgWNUqw==
X-CSE-MsgGUID: VwU7lnLWTs+R7DJT5UhOiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="226523313"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="226523313"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:33:13 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 356F21002B97
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:12 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E2ECD8D206A
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5339B1401D61;
	Wed, 21 Jan 2026 11:33:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 27/30] geos: upgrade 3.13.1 -> 3.14.1
Date: Wed, 21 Jan 2026 19:29:18 +0800
Message-ID: <20260121112921.857-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123718

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-navigation/geos/{geos_3.13.1.bb => geos_3.14.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geos/{geos_3.13.1.bb => geos_3.14.1.bb} (88%)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.13.1.bb b/meta-oe/recipes-navigation/geos/geos_3.14.1.bb
similarity index 88%
rename from meta-oe/recipes-navigation/geos/geos_3.13.1.bb
rename to meta-oe/recipes-navigation/geos/geos_3.14.1.bb
index ba01968052..28a620c5bf 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.13.1.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.14.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "df2c50503295f325e7c8d7b783aca8ba4773919cde984193850cf9e361dfd28c"
+SRC_URI[sha256sum] = "3c20919cda9a505db07b5216baa980bacdaa0702da715b43f176fb07eff7e716"
 
 inherit cmake pkgconfig binconfig
 
-- 
2.43.0


