Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A52CD8CBE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:22 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76252.1781001017125201583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r6x1Iq9Y;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001017; x=1812537017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BMT0AxZCHw+C22Zc3ESRTqMtqopXdjvewPIMniknNbY=;
  b=r6x1Iq9YRqIjV8fx2Ce/ZWoRUKWZNwvniuNsXT884zjfHEZuuPlWRv7n
   68bHqRoGep1wslNI8y3dqAjMNAd3zUOEMMLSzmvu2AmNsDNcu7U6XMHKk
   n/MfD5jIC2jfTfu3OJOVVA7O5XY6vBViYAIm644gjVQug/Hda7UZSnpYG
   ALU1sxYOaWCDHijWVUqTRuI1uQ2xHsuCxAj+UOBNzNDeNyV8WYi1P6hqH
   xZF/VWKy8zA3luXU9YUu3LwMh/RYWILGfm3cdCdMgdeqvyzhdiIRo/8Ar
   UVyTNpxHByyRXEgMn10q+b35NH1WNQty7ygnto5jG4cn7n31OagpNlneq
   Q==;
X-CSE-ConnectionGUID: uMtDJARGSsShyqQcSMWevQ==
X-CSE-MsgGUID: ruZybU2ISYe9/9gI7o5BOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="222420348"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="222420348"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:15 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9CE001000377
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:15 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 508A5188C998
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 616C410003C5;
	Tue,  9 Jun 2026 10:30:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/30] python3-typer: upgrade 0.26.4 -> 0.26.7
Date: Tue,  9 Jun 2026 18:29:10 +0800
Message-ID: <20260609102913.2204-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127481

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.26.4.bb => python3-typer_0.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.26.4.bb => python3-typer_0.26.7.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.26.4.bb b/meta-python/recipes-devtools/python/python3-typer_0.26.7.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.26.4.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.26.7.bb
index 2d4bf4a996..5a6675a342 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.26.4.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.26.7.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "25b128964de66c5ea36d5ac82adc579e5e113509b17469edf9f5a4a1864ff2a9"
+SRC_URI[sha256sum] = "e314a34c617e419c091b2830dda3ea1f257134ff593061a8f5b9717ab8dddb3a"
 
 inherit pypi python_pdm ptest
 
-- 
2.43.0


