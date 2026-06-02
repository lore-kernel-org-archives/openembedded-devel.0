Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ADCCD6E61
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21214.1780394886243772362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S7fPLSWY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394886; x=1811930886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r4M/KS4SBTvMI3nhq0VH9LL/1miuK8YtY8YV4QJTIPs=;
  b=S7fPLSWYxl0Yo7x+YJ1t33ob3ViIXTunaI3mVnHdgYhuZiCfYc4o+x/+
   Mqi0jHFMGgIXcCsJKAHtnXFbmTuCDygg0/qsnZekMng33TFdPOJuDHxP+
   93yq5JKaeDWJEdFaejdbr0SxtVAEPLxomLa7fEMWX9maz64OYZT+borx2
   x00pXq1M7jXcfegFHKcEZMA08Iom9C8jbRZl4e7e5wDCGbcNU6bYIFq8D
   nq6J5mkMqQyf6kMGEpZX9ieEIJakFyCRIbscaokRDeRLH6v7JLLuYPY7w
   N/zVraY8M0nqLRKLpL2zay1/j6KDWQH0bHJM6bxHdyZFMBRBDZaK60EWG
   g==;
X-CSE-ConnectionGUID: zAnluCwfR1+5FjuomTHeRQ==
X-CSE-MsgGUID: CsverUTHRGusDswUNuzgxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="221621217"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="221621217"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:05 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6BDD91002B84
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:04 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2352614771D4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2A718180051C;
	Tue,  2 Jun 2026 10:08:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/38] evince: upgrade 48.1 -> 48.4
Date: Tue,  2 Jun 2026 18:07:19 +0800
Message-ID: <20260602100755.2117-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127325

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
* Bump DjVuLibre version required
* Fix crash in the accessible code when page cache text is NULL
* Fix xml element in Hindi translation
* Quote strings in arguments used when calling ev_spawn

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/evince/{evince_48.1.bb => evince_48.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_48.1.bb => evince_48.4.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_48.1.bb b/meta-gnome/recipes-gnome/evince/evince_48.4.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/evince/evince_48.1.bb
rename to meta-gnome/recipes-gnome/evince/evince_48.4.bb
index 9cf048f14b..5756fa5fcb 100644
--- a/meta-gnome/recipes-gnome/evince/evince_48.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_48.4.bb
@@ -33,7 +33,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "7d8b9a6fa3a05d3f5b9048859027688c73a788ff6e923bc3945126884943fa10"
+SRC_URI[archive.sha256sum] = "f296c5c662886635d4cd597e8ac0afcde7982be4486533c2b7f095b268be8668"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.43.0


