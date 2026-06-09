Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7CCCD8CBD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:22 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76510.1781001013794666326
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OXypwzTO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001014; x=1812537014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fS1PcRmpz6QukZdn5B8S156uY8Mf7EIO/iqRohyJXgI=;
  b=OXypwzTO7NInFS39rRzUki9LL6CK7lRvcYJnOMdFx++efIncfeXAa/X6
   8tUdhTbzOWdbVGfGxoZOKDpOL3ZlKztZRAB1FVkmdMEkZmT5yrI1FBjDb
   v6aWUcTBZR0MrayBCTzNBfoLeLrGNhs3DLrMRoXguUisl2V/j/xkJrTEu
   BLxz53lvTEQe/lm65ZB4Of/zvsHqwp13/SMMH12Q48+4bl+fO0XCjg5fs
   X9wmFa2nJin7UC4WVFdfeicbV4BD9rRwLnJb3HAspuUlK6B98evTF1oiD
   fAlAHJ0jeXJaAnTidgtbQLMTYLVGr/kxfu5HnxP99HbhcVSiftt/59TJS
   g==;
X-CSE-ConnectionGUID: xpZ9Z7fWTfeVwcffYrdfDA==
X-CSE-MsgGUID: IC8FTqp5SzGZu7FiQGM39w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="241652331"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="241652331"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5B7BA1C1C70A
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:12 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 14363831C48
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3AD7C10003CE;
	Tue,  9 Jun 2026 10:30:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/30] python3-sentry-sdk: upgrade 2.61.0 -> 2.61.1
Date: Tue,  9 Jun 2026 18:29:08 +0800
Message-ID: <20260609102913.2204-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127479

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Pin fakeredis<2.36.0 in tests
- Unpin redis and fakeredis for tests
- (aiohttp) Unfurl spans explicitly instead of using pop()
- (tox) Migrate from pip to uv via tox-uv
- Pin redis<8 for rq

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.61.0.bb => python3-sentry-sdk_2.61.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.61.0.bb => python3-sentry-sdk_2.61.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.1.bb
index 4cc2462383..967dbb7a24 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "1ca9b4bb777eb5be67004edab7eb894f21c6301f1d05ed64966719ad5d1764ce"
+SRC_URI[sha256sum] = "9c6adccb3feefa9ba032c8d295ca477575c2f11896046a2b0ad686c47c4af555"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


