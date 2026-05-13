Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70DACD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:21:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.258.1778646081921167695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c14CEF+q;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646082; x=1810182082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wMcBdNQQmFG9/WazIQ4iCGtFZDQxKOf3aCkl5W8XdOo=;
  b=c14CEF+qZDO7nR6/OS3wLjJ4QOWydhBmj8EflPtvdYay9rFEn38/D76C
   jsDDIOG6SZpnSctKjr2rARgANHTz6K2tDZB/3Jmy6Y1Eh56GVWTmCFFqh
   FHrJ6PMhNpwjyQUvXUWwjVUhi7enoU3U0FhzvTjmwTxpT9zKx0KPm/ErI
   cVrY2EDx9qxhWJeh3lcq10MIO0Py58PR0jP+IN/OKCRDakT6wSPNxvLV7
   tyo2djT3u2hmq41qIhG2AvWjxtDYEdzKFbU4HhNWVl8bR7udFJ/5gI9+o
   Ne0UtAjuQsgeo7jxSgEYj2VO9PqeQtWzT7j8r7sD9/52JHqmhe1fMGkyK
   A==;
X-CSE-ConnectionGUID: cVtWR125RwChrYxD918dag==
X-CSE-MsgGUID: E4rLhXF0S8yylHJsrTiyzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="219134887"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="219134887"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:21:20 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4FD711000345
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:21:20 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F31C2C0128C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:21:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8216F1400247;
	Wed, 13 May 2026 04:21:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 56/56] znc: upgrade 1.10.1 -> 1.10.2
Date: Wed, 13 May 2026 12:19:52 +0800
Message-ID: <20260513041952.450-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126940

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix build with SWIG 4.4.
- Fix build in the event some parts of Boost are installed but Boost.Locale is not.
- Make GetClient() work in the OnClientGetSASLMechanisms module callback.
- Stop accidentally requiring new perl 5.35.1, regression from 1.10.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/znc/{znc_1.10.1.bb => znc_1.10.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/znc/{znc_1.10.1.bb => znc_1.10.2.bb} (94%)

diff --git a/meta-networking/recipes-irc/znc/znc_1.10.1.bb b/meta-networking/recipes-irc/znc/znc_1.10.2.bb
similarity index 94%
rename from meta-networking/recipes-irc/znc/znc_1.10.1.bb
rename to meta-networking/recipes-irc/znc/znc_1.10.2.bb
index 4477068bba..7793813234 100644
--- a/meta-networking/recipes-irc/znc/znc_1.10.1.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.10.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib"
 SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https;tag=${BP}"
 
-SRCREV = "29694fd26f5e9ec46731ee13bf66224181984966"
+SRCREV = "59af2206c62724eec0d8c43d3c1c0b70610ca1d9"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


