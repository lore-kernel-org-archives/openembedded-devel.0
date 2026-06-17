Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BADCD98F5
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11263.1781686712526515305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cnKD06M+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686713; x=1813222713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WFhQRShEcZrXJ5+7h6S2CO8ltPro5zSVuOtlOg03u8w=;
  b=cnKD06M+q7fiss3Bgv1W1xwYcCWBkBT9ELaS27r3DP/1NuU64RiCsuHP
   KYqQ5r3+nnH1ME5WW7rl5gd0baoX7KBVB4oFRQeCoyrPxYRt45DikGlKk
   8Wfen1sOlOdllKuSBZ8q+vKh4w2xb6Qp6SdYb29Bf1/L5Y3NI3ypEJAPQ
   1FBKsJOcfPDU2C2FDWogbrroB9Eo69uhDtc+ikNUcMpJxRoqaAY+K4rKJ
   ScSrYWTbWBvBXXe6w8mbuWatGIEofQcMA8MAHWcPBIvB1dtbYZT1W04y4
   IVwbkmdxymMH87He2HDg8dtrsfZ+GIE0J2nH+3Tx6UchmYTxl5kaTFwKV
   g==;
X-CSE-ConnectionGUID: TPhUtH9SSw2XcsYlTrIJyQ==
X-CSE-MsgGUID: idanNTvqTMO68Af5+Su1kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="242543050"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="242543050"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:32 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E245BC000A1
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:30 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9C1B414003D4
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C36E510017CF;
	Wed, 17 Jun 2026 08:58:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/17] python3-google-auth: upgrade 2.53.0 -> 2.54.0
Date: Wed, 17 Jun 2026 16:58:00 +0800
Message-ID: <20260617085807.542-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127647

From: Wang Mingyu <wangmy@fujitsu.com>

Features
=========
- implement regional access boundary support for standalone JWT and async
  service accounts

Bug Fixes
=========
- configure mTLS for impersonated credentials
- fail-fast on missing ECP config file to avoid 30s hang
- Rename the &#39;seed&#39; argument for setting an initial regional access
  boundary for clarity
- update incorrect urls in setup.py to point at monorepo vs splitrepo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.53.0.bb => python3-google-auth_2.54.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.53.0.bb => python3-google-auth_2.54.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.53.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.54.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.53.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.54.0.bb
index 840573fcf4..b7b5a416a9 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.53.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.54.0.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "e7e6aa16f6bee7b2b264830fd04f08087a1d5a836df516251a5d15327b246c9c"
+SRC_URI[sha256sum] = "130f6fd5e3f497fdad897a23ed9489973437edf561238c4b92a4d02c435f8af9"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


