Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40646C43638
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17246.1782811357311126278
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tIhTVtdF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811358; x=1814347358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yRCB7ExZxWOFJc4Wb1bmswJ3rkk4p84a8OkKz/J0bQE=;
  b=tIhTVtdFf65GplM3hEDh46Bbl2fHUCXyN+f0iNsF0CHC4MiA51dCxvGL
   5SN6S8amMOFD8tRFxTgQlCW9M6wi4bJ5HFgL1i1tkb+w/fODchzjoSZdy
   ECQkK7UG/TZs8S1wQedpOuMwjRrYs1DijHOdiIE2p2pc/5UfGTLq+dn8z
   FQYHecKtTTECldCwCDMaesLqoAKCXdprXGdZCVye/TCWcrr4z393R2z6A
   CpN+7O96zDpL/6E5lXC+L8PI2f8f3DcIeAwFTmhce5lmHaUz84lp+C39y
   FXYhLm0kr7zWf66EXzaNj6keTHnZZMlrpep+WR5VNfGk/nr8lUCO0bxFj
   Q==;
X-CSE-ConnectionGUID: HyuWv7LNQHSrC2FMXwvVEg==
X-CSE-MsgGUID: eR3AZ/dRQ3KNCE/kNuz68w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245819330"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245819330"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:36 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 746561000377
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:35 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2892DC02093
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DB525826FFA;
	Tue, 30 Jun 2026 09:22:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/37] python3-anyio: upgrade 4.14.0 -> 4.14.1
Date: Tue, 30 Jun 2026 17:21:41 +0800
Message-ID: <20260630092206.322-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127958

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Fixed teardown of higher-scoped async fixtures failing on asyncio with
  RuntimeError: Attempted to exit cancel scope in a different task than it was
  entered in when an async test raise an outcome exception (e.g., pytest.skip(),
  pytest.xfail(), or pytest.fail())
- Fixed CapacityLimiter.total_tokens rejecting a value of 0 when the limiter
  was instantiated outside of an event loop, contradicting the documented
  behavior of allowing 0 total tokens

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.14.0.bb => python3-anyio_4.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.14.0.bb => python3-anyio_4.14.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.14.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.14.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.14.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.14.1.bb
index c1066d21e9..b582b8eb0e 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.14.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b47c1f9ccf73e67021df785332508f99379c68fa7d0684e8e3492cb1d4b23f89"
+SRC_URI[sha256sum] = "8d648a3544c1a700e3ff78615cd679e4c5c3f149904287e73687b2596963629e"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.43.0


