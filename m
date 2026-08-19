Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0C5C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:21 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3322.1787132172740308325
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gFyiH0G7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132173; x=1818668173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VmphTqFSiWRx8RT4sujkEJhaxUsFyFiXibYb19oA8ME=;
  b=gFyiH0G7R/o2yjYajdu6WVFFGMWzJstPNWZHq/MRJyZoPkhvDhH6Yk5P
   O412VKGUgCo54c/B37MPCQ+MdnvvpTmEveUzEdaUfoXPOfdXxpURWr6qr
   aWoLNDy6oc1gRoWEWTWptLY3n6jaka2kdDCyfO2+wd7zP7/Yx/uLbA4q9
   qd3JNuuEDz07iHZhlx9PJ/RrzY8hlNKnXqV3D7qMUeY1EeV/b6i1xPJy0
   KW2wNx1fLyuHhOb18L56TQ1hC2AGkrPOlWhz7kBb84f+YSeB7zGljAXiG
   tDDBG7UiJt1e77KfExj06thDDMAsmrayOYUuZ0p6tMczJE6C7aHig3mm7
   A==;
X-CSE-ConnectionGUID: 9dI+VM1OTV2WaHNCU85BKg==
X-CSE-MsgGUID: TeDqDWHxShSoEyIoHmztaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251882226"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251882226"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0505E8200BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:11 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B4073C0077E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B7E651801C0A;
	Wed, 19 Aug 2026 09:36:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/70] python3-engineio: upgrade 4.13.4 -> 4.13.5
Date: Wed, 19 Aug 2026 17:34:33 +0800
Message-ID: <20260819093514.1101-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129299

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  revent unnecessary resource allocation in ASGI driver

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.13.4.bb => python3-engineio_4.13.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.13.4.bb => python3-engineio_4.13.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.13.4.bb b/meta-python/recipes-devtools/python/python3-engineio_4.13.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.13.4.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.13.5.bb
index 21de0c4a25..c31972041e 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.13.5.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "413cb98d56c62f0f5ef29931592a360d437b82b3fa7ab415da3f6c7d3ebc0cb7"
+SRC_URI[sha256sum] = "b5764d62243e3ffbc4c76dda3d7897c329dc52294c80c27105f9faa054e76897"
-- 
2.43.0


