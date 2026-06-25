Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30874CDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7020.1782378144014515135
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YafrPShB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378149; x=1813914149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D3/wornYK0pj1F4VQNnOmJcECysqo6jXqzMycW2qd5g=;
  b=YafrPShBweXy4XuHMmxdHfHgQOzBFcsYit3lX4sVZui0ZGgJlfKCi/2B
   TTKQ0ts6ETgO8AbUj3+ht4mIusxgSm/pqkBP8nLvlMRgtOVAXrTd7R8kh
   kJZM+k0CFiNy7u6H0ZTEJBfyB1XqHA5mLqXXmwj8UrFwFib+vP1G6JOII
   aHD3HNq29mxQ2YyiOalgzb3CTqYtGSLyhwsHPXak+Vv9VQbkv9R9o4P7j
   IJ25wJAV5n8ZnddSgXp6k6RpOLPz75SZuL+xzEo0dbCzDD0/SXsS6zkko
   VU16rHLKW23g6cv8KdgdCKmUDk0ZfP02ZBYUavRYqrh+SX1iEXEtQRYbB
   A==;
X-CSE-ConnectionGUID: A1kmXGUNSAKIG56CT5WI2w==
X-CSE-MsgGUID: 4V+t5MZ7SuSVw3aD2aQStA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="244743182"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="244743182"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:28 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A4B521C1C704
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:28 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 604778267B7
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 63E09101732C;
	Thu, 25 Jun 2026 09:02:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/47] python3-sentry-sdk: upgrade 2.62.0 -> 2.63.0
Date: Thu, 25 Jun 2026 17:01:16 +0800
Message-ID: <20260625090127.1563-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127768

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Prevent double wrapping of sync handlers on FastAPI >= 0.137
- Use effective_route_context path for prefixed routers
- (asgi) Gate query string and client IP behind send_default_pii
- (serializer) Avoid creating reference cycles on every call
- (user) Set user.ip_address on telemetry if present
- Remove 0000 trace_id fallbacks
- MANIFEST.in: Graft tests directory.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.62.0.bb => python3-sentry-sdk_2.63.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.62.0.bb => python3-sentry-sdk_2.63.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.62.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.63.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.62.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.63.0.bb
index dffbfcf6c6..54a0e45025 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.62.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.63.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "3c870b9f50d9fd15b58c817dbde1c7cfaa9fe3f05df0a4c6edd5571cb82f5491"
+SRC_URI[sha256sum] = "2a1502bf864769275dbc8c2c9fc7a0f7f5e18358180b615d262d13a31ffba216"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


