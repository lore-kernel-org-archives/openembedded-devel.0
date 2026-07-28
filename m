Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E64C54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:10 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5632.1785218827523995408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=axNCr/By;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218827; x=1816754827;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wWf62lwwpAM8qKxIEXSr5jfXQBqS9q5aZCtvy7SiKLw=;
  b=axNCr/Byq1VA3c2hmLcBg7xg7HZzRwXMnDBcr2C/9CVh1s95GlZKWCtV
   s23DAkdfIVcMxf97yunc6MxsPNJ03fZoidxuMl7GQdd0iYO+AxnGCEXzT
   NH3SEkbQI85b70xB39f0AtBaKYukR+ehMgI8UFLM+JDb1ouzrhEtOioz3
   tdObNpyyRcBTIuG799dp+IUJLG+iKJb8OPSFXPJNd2rybjFkyOCivKDei
   ggiQX+e/uYWiIpWzW+BU7y4C9qsGE/+f+RUQJSiGyL4qWoLe9DdYUZHzv
   XzwZTGGMLQBUZYRYdNWUMrz0jg3Lhe/Apgc+TyYf66kW4fqIv7QtgL4G2
   A==;
X-CSE-ConnectionGUID: Dc6Y359eTmmItLLGViAJvQ==
X-CSE-MsgGUID: CSd/+W2pQ16caqr4MIbbnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="246995024"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="246995024"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DE0021C00084
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:05 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8FD38180CCCA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:05 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id D6DB210005EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:03 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-fastapi: upgrade 0.138.1 -> 0.140.0
Date: Tue, 28 Jul 2026 14:06:26 +0800
Message-ID: <20260728060645.819-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128483

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.138.1.bb => python3-fastapi_0.140.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.138.1.bb => python3-fastapi_0.140.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.138.1.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.140.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.138.1.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.140.0.bb
index 87bcadc0c3..b8129fe817 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.138.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.140.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "96e3702dce09ee0dce48856135620d3d865ca684a79fe7513fd7b13a12f82862"
+SRC_URI[sha256sum] = "f338951b82fd74ca8f843163aec43ea1a1ce84d515415a50fa98fa25572a5544"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


