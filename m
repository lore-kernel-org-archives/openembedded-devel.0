Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D20CD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:12 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16795.1779875341485552435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MzwKrHyM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875346; x=1811411346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9gV5CSHAO4AstxPGEALylxuMtok82aMiRkGzdlsZcuQ=;
  b=MzwKrHyM60bbGFXqxI2bI6QHzyEu0Lwy2jtROmjo8cZLQT6yIwxUtCGP
   sGdaijKcMYAf/gjFTtSdyqIVvx+Qm1gDE610+34qddjc3nSihU+b0sax2
   PBTQheAv+vSUE0T0nFQM/kekIsrclbrJvgT73ryJdCNxohJcrHhFpHSUb
   OjX4GibpWlhAosgBFbizuSgKls6Jv0JWSIq9lRKWxcBEk98G6JsKSBu4y
   79qd9bdhD3jZu3BuHuy8JFX4jJpmlHnw7lHwP0VbUXIIr89eBYIDS1yRM
   +2en6Fjw+q7nGfWpGj8znEl+A4+mkL05dZT/UQtR4Ga4JtWSWt0eAsyVF
   Q==;
X-CSE-ConnectionGUID: u1DsTNPhTlS/vjkMlW+4MQ==
X-CSE-MsgGUID: agEjaGAXSTeyGccVdn4jDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241969824"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241969824"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:05 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AEB4D1002BB9
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:04 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 65368C2BA94
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6FFCB82A2D8;
	Wed, 27 May 2026 09:49:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/56] python3-google-auth: upgrade 2.52.0 -> 2.53.0
Date: Wed, 27 May 2026 17:47:37 +0800
Message-ID: <20260527094805.2039-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127235

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- allowlist agents-nonprod trust domains for agent identity
- fail-fast on invalid or non-workload certificate configs in agent identity discovery

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.52.0.bb => python3-google-auth_2.53.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.52.0.bb => python3-google-auth_2.53.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.52.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.53.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.52.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.53.0.bb
index 639fe0926d..840573fcf4 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.52.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.53.0.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "01f30e1a9e3638698d89464f5e603ce29d18e1c0e63ec31ac570aba4e164aaf5"
+SRC_URI[sha256sum] = "e7e6aa16f6bee7b2b264830fd04f08087a1d5a836df516251a5d15327b246c9c"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


