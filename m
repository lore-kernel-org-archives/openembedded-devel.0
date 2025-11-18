Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44F4CED249
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8432.1763456962801266797
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T8TiDhR9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456964; x=1794992964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sITEY01e5q2RHfvodSd6WGRgeNGRmFB1VpsKVu8hVRg=;
  b=T8TiDhR9jcA8Dr7UZzNtjMWMKevcHfkFnkKJ/T1KuovlAFXIbklUwFBl
   SqpMoY4+Meo3yE0DT9kNtYAG/PYJILHRT8pBfqpguTDmaJWzfoq4drL5z
   fBbccIuZCUOMekUYDxN6n01lt6Cx2jB1zZ2mFn1fRBtPK6DOm9marB2nv
   pNLy2Wm2OWXXfmKNhNS6t5Pl/f7SVnQWBokEXxQnhuzXEbEdJ8gMNFasF
   +sUlWU724OoP5k7o3Rb+iIkmjfRG9B/fLqz+PCG8z0YoH0HosP6cddQ67
   eOf38KhkVpMyaKwy8NBV7mjoiHDRXHo0iqX+zCKX49vlJksvC+JswJLTu
   w==;
X-CSE-ConnectionGUID: WAPDybADSGqV+eOwm18A1A==
X-CSE-MsgGUID: S1VEsFAuSXWnZWl7AvS6Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219608361"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219608361"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:22 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2D1991C0009A
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:21 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C1BC21C00160
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5446A140024E;
	Tue, 18 Nov 2025 09:09:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/29] python3-cachetools: upgrade 6.2.1 -> 6.2.2
Date: Tue, 18 Nov 2025 17:08:34 +0800
Message-ID: <20251118090846.1484-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121828

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Minor improvements from GitHub Copilot code review.
- Improve documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_6.2.1.bb => python3-cachetools_6.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_6.2.1.bb => python3-cachetools_6.2.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_6.2.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_6.2.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cachetools_6.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_6.2.2.bb
index 78b4ab5e2e..f9eb66df8b 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_6.2.2.bb
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "3f391e4bd8f8bf0931169baf7456cc822705f4e2a31f840d218f445b9a854201"
+SRC_URI[sha256sum] = "8e6d266b25e539df852251cfd6f990b4bc3a141db73b939058d809ebd2590fc6"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


