Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE01C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3280.1787132140872788464
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e3wOPk7l;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132141; x=1818668141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5klPSUP66kElpuhAMp6icoSrAp7TMYxgWPob/D2fr/g=;
  b=e3wOPk7lEOn/sE68dwbqju6KIaIDMbpcIXaeDBHKs69j/l7MzWzigOVn
   9XQfQiaTmVxbf+RZLyCXJEtieIgfVI7RFmEdEcXmT/ViPnTzmLpQhGVaP
   1bza4X3NZywPoTGP0lzCYokTg7a+EiQW4YOZrfvDvdBaV5BeSGFQHou+e
   kH4/R3ntQvig83LSo0isGUsNPIiClmRRkdAJu3he+cuDhxEDnkqWI30rj
   5+cgKUHGGey0FcfW/AtlkBRfwGfTuMBjrw6aojmZjtcthCg7kh9Oxiqw9
   di/rSIzsT8LchX8LK9znl6x3FmPVb0+NnSC0yLNWr5Qp30PR0qSo9Sn1t
   Q==;
X-CSE-ConnectionGUID: FE0ZdLh/TQGNlOTT2A4KRw==
X-CSE-MsgGUID: FEGtoymMRLuvZQ2ugnLgeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="238053866"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="238053866"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:39 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0C4B81C1C71B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:39 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id BC323148AD36
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id CCF3C1801C29;
	Wed, 19 Aug 2026 09:35:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/70] libkcapi: upgrade 1.5.0 -> 1.5.1
Date: Wed, 19 Aug 2026 17:34:15 +0800
Message-ID: <20260819093514.1101-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129281

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Changelog:
==========
- remove tests of ansi_cprng
- apply change suggestions derived from Claude code
- kcapi-enc: add tag processing in decryption without ciphertext for completeness reason
- fix memory corruption (CVE-2026-71226)
- fix potential for an infinite loop (CVE-2026-71227)
- add safety measure to prevent IV reuse (CVE-2026-71225)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libkcapi/{libkcapi_1.5.0.bb => libkcapi_1.5.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/libkcapi/{libkcapi_1.5.0.bb => libkcapi_1.5.1.bb} (90%)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb
similarity index 90%
rename from meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
rename to meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb
index 742a50c3fe..2a6d40b91a 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE = "https://www.chronox.de/libkcapi/index.html"
 LICENSE = "BSD-3-Clause OR GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3d8a091d797491204567185a6efce70f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fed53d2ab12f2d813d4177dcf4792528"
 
-SRCREV = "fc937358e71253a6efaa3ba74885364976b040ea"
+SRCREV = "df40ea48ecbf1afc6d3efa5494673fa73bd40826"
 SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https \
           "
 
-- 
2.43.0


