Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B684FC44508
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4912.1783503959116672514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gw4gm9au;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503960; x=1815039960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qkNPIWPaqrufn0r5MzbBihRSN8prcJf0OA2F8Fshhl0=;
  b=Gw4gm9au+BMAxIYJ6rWZo/ArNf8E3Goh55FUsFVhCRn6JWPMpE+6fGBq
   vLex0P7uvCkC5CkKvjgTJ/9rpXKyK2s9+NM8zpVaLEyrKZcwqAZBefwpE
   eZfVbe0U1goKlCKmb/SrSvT1EojQK22E/qA72G3h73ue06r+FipF0GUzg
   Vspn1TPdWW2IvOmg+19XviNP1r4ovHZ4OLaV0UZCsH0edyaytKspPpWWk
   TgpM55inMJsU28BqaouEF6bjXC+WQaWT5unE2aaUnqPxZYQzCH0UyboW4
   y4YpRBU3kFXcLfUVIqEWXrqw+JbBQXmHRak/8JZLE2qBOwsXSrgSRe1rW
   g==;
X-CSE-ConnectionGUID: sKLQLk3mSR+HYzlbBnSm4w==
X-CSE-MsgGUID: sS0fKD8MSsOnLcdH67nCIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246626085"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246626085"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:58 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 588F21C1C73F
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:57 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1375F827746
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3CF921801131;
	Wed,  8 Jul 2026 09:45:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/37] python3-sentry-sdk: upgrade 2.63.0 -> 2.64.0
Date: Wed,  8 Jul 2026 17:44:37 +0800
Message-ID: <20260708094508.2060-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128098

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.63.0.bb => python3-sentry-sdk_2.64.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.63.0.bb => python3-sentry-sdk_2.64.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.63.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.63.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.0.bb
index 54a0e45025..5366444963 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.63.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.64.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "2a1502bf864769275dbc8c2c9fc7a0f7f5e18358180b615d262d13a31ffba216"
+SRC_URI[sha256sum] = "68be2c29e14ae310f8a39e1a79916b6d85c6cb41dcce789d14ff05fe293e4c55"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


