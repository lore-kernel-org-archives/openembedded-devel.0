Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2EACFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:12:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13194.1764061934009042372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J1MqbRye;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061934; x=1795597934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YFSwNVyPyEjXhELI18NOwlpjX6cK+GqLEwRva9VPD5c=;
  b=J1MqbRye8hRNbf4rU3B+Qge4Sb51sy34Ink1mSB+DOYDwsUJSOAekjTV
   QhiIE5a35cS7a+a69BOCAP6vTjYnylJtW2/qxCb1EDYgE3tue4kEyybdY
   sDG6/Sanq1y3z35XSV7ISKQiLH9LvctVFBaFafYkyR0ayo7lCQAF8TU1l
   Lrw7TE1d3cG0cyHMEKiCPCmscPtgfcbYsLNzDBCFPAZUdBV2Meo83T5l/
   DH9Dti6K8Z8O9kQSqNT3ruKQqcBc6KkCWOvF0xn84k55ndxZl7+6y7kAR
   VNfExSA5uFKpDbYSCT5GpAL9UhZ0Uqy5bKF9ZedozjKrI1bWXKXQBZW1i
   g==;
X-CSE-ConnectionGUID: Co1suXNqR/OHkEk4JOJr+Q==
X-CSE-MsgGUID: 4lBUizWQRaCoVO5s1MEDTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="220290051"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="220290051"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:12:13 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 6D8FD1002BA3
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:12 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2CF3314003BD
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E049614001E4;
	Tue, 25 Nov 2025 09:12:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/26] libgphoto2: upgrade 2.5.32 -> 2.5.33
Date: Tue, 25 Nov 2025 17:11:35 +0800
Message-ID: <20251125091156.1376-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122028

From: Wang Mingyu <wangmy@fujitsu.com>

serial:
* added caching

canon:
* use caching from serial driver

ptp2:
* fixed crash on capture regression
* added new ids:
  * Sony ZV-E10M2
  * Fuji X-M5
  * Ricoh GR IIIx (corrected id)
* imported libmtp ids

translations: updated romanian, chinese, polish, ukrainian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gphoto2/{libgphoto2_2.5.32.bb => libgphoto2_2.5.33.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.32.bb => libgphoto2_2.5.33.bb} (93%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
similarity index 93%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 20e0645d21..6b5e6c21b9 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -13,7 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
 "
-SRC_URI[libgphoto2.sha256sum] = "495a347be21b8f970607a81e739aa91513a8479cbd73b79454a339c73e2b860e"
+SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gphoto/files/libgphoto/"
 
-- 
2.43.0


