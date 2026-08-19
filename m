Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F95C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:03 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3346.1787132215165408141
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hT4uPfXi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132215; x=1818668215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kLmV9A90EUR637qdifwAbLbpPboSxlChFLbySIzZRSE=;
  b=hT4uPfXikvUDsn21mtNkFvYNlrze7caPHcLg01nJjvSY1YhtO76bYdqN
   nUZyOWjD+4dEKWklNbdWaO51eebZA1uNNaIaWYE4pfnkxAJ08DScVlBC+
   hSPeEVun74YlLz43ncouiKwY8We8lFCFMH9hcCOYL4XOuUOW+hYLYiWuP
   +5mfxbPtQ7cDVVMbOg90P5YeytnE6mtEt3RgnXmBrY+8Der4ndxfanjLj
   N/8ANDEowuPMMi07InMVcbpe3ziWBdT4VCVSfCh3z6voxz++1ZCOITyzX
   zd478OzXYE26DWgocWgoIeMuwb0UZN8/hAU4jPuVjjM4vMgADL0Gcwf0G
   g==;
X-CSE-ConnectionGUID: C4qVb1tdSPuBQXX+fUTm6g==
X-CSE-MsgGUID: ANicLAZsT6qwUwpyAgdhUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="238053998"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="238053998"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:53 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 90A848200BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:53 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 45B7DC01816
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4DB451801C20;
	Wed, 19 Aug 2026 09:36:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/70] python3-qface: upgrade 2.0.13 -> 2.0.14
Date: Wed, 19 Aug 2026 17:34:57 +0800
Message-ID: <20260819093514.1101-53-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129323

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-qface_2.0.13.bb => python3-qface_2.0.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qface_2.0.13.bb => python3-qface_2.0.14.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.13.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.14.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-qface_2.0.13.bb
rename to meta-python/recipes-devtools/python/python3-qface_2.0.14.bb
index 679c9af629..9e78074e0e 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.13.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.14.bb
@@ -2,7 +2,7 @@ SUMMARY = "A generator framework based on a common modern IDL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
 
-SRC_URI[sha256sum] = "e47be09989e3bf1c3201740501a07d9cd631fb29fb442445e343c94af7b480cb"
+SRC_URI[sha256sum] = "df31014fbe95b3d910d059ce1a8e827d57d234aca3a5c42094d6ad096fd8f39e"
 
 inherit pypi setuptools3
 
-- 
2.43.0


