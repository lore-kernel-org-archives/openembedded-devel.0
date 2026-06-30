Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32924C43638
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:01 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16871.1782811377560044753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hT/X3/RF;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811377; x=1814347377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EdplocRUAhjJVpNbOXMXvvFQ88TAtizSjYtEUxoX8Qg=;
  b=hT/X3/RFaQ/pqE7gxtWtNPtF/ed3xhlRy4m4PGowPX+C0h07J+4O8kDM
   IsVUzWKJI2N7jWw5OsivbIoTd4xBwsLughi6MSBXHvt5SCw3WYgatg7nm
   t87YvimnGp7r/LbGa5dz8tED4NG/cJ9nD0wJQH4YZjzr+pV7jQeNZHISe
   YWJ4AJuS/I4Pr7jFp3SrH+JcRPD0qI9yIkyGA5p5o1KhGFALufrPPeaZj
   ANRHqnU4KbCftGVIFk1/JpOX2T/k8rU2RWUWNM4xgYxb2d4EbegqPhLmO
   W8wc9XfTJ4PHgmgYYxun+4RuJ87HWraD9VelsRnplleJlUhuV8jkQ4OlK
   Q==;
X-CSE-ConnectionGUID: HkEuLb2xR4CsHak2XEJmbg==
X-CSE-MsgGUID: vUyslfsLRfyw7hSn1ipZ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="231987076"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="231987076"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:56 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 03EAC1000377
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:56 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AF6BDC00341
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id CCBE4826FFA;
	Tue, 30 Jun 2026 09:22:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/37] python3-typer: upgrade 0.26.7 -> 0.26.8
Date: Tue, 30 Jun 2026 17:21:57 +0800
Message-ID: <20260630092206.322-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127971

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.26.7.bb => python3-typer_0.26.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.26.7.bb => python3-typer_0.26.8.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.26.7.bb b/meta-python/recipes-devtools/python/python3-typer_0.26.8.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.26.7.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.26.8.bb
index 5a6675a342..d7c95a01eb 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.26.7.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.26.8.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "e314a34c617e419c091b2830dda3ea1f257134ff593061a8f5b9717ab8dddb3a"
+SRC_URI[sha256sum] = "c244a6bd558886fe3f8780efb6bdd28bb9aff005a94eedebaa5cb32926fe2f7e"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


