Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B99ECD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:10:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.124.1778645436935718757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KUNRZupn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645437; x=1810181437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uh59RAd038Cx+nzNjHWWBcMIJ6FbsA9NR8Q+jCY4KWk=;
  b=KUNRZupnSldNcWN6JrceyT0mt9LPr1b8nV7nV/+NLnM+XmU9KHsNGaLP
   SWLj8oAQv2BIHUmoPXG1wf3qN7PJJDc6IUK2Cyj2aBFtKOYS+3BeE3nWs
   SvtAhvmuFxZeOVQAKoAasuADZNIMHvlhHhr0Fkb3F9EBdl3jgGJnebpTG
   6e2cBUStwQwFRIVwnZaSrwJtyP6KHUhS59Mrg81FjOhtIA5Df0b5BEc3W
   qCOmXqyrIj34abt+KE3AaGYbiz5gWGz8X6EOb+FeaurpcUQ4mnxaFkE4I
   /tlBS+f9vLYxXO/mICmoO9J8/ie4HbWhXNfl+3aAur+RjppiYGf5XjC+x
   g==;
X-CSE-ConnectionGUID: WLU3fv/zTz+vmyYCTeyQsg==
X-CSE-MsgGUID: Se0Hs5GlTbWq/8SStVAp7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228214073"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228214073"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:35 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6D859100035E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:35 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 1D8081009E17
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8A7891400247;
	Wed, 13 May 2026 04:10:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/56] python3-google-auth: upgrade 2.49.2 -> 2.52.0
Date: Wed, 13 May 2026 12:05:26 +0800
Message-ID: <20260513040555.377-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126910

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.49.2.bb => python3-google-auth_2.52.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.49.2.bb => python3-google-auth_2.52.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.49.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.52.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.49.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.52.0.bb
index fc6df70f45..639fe0926d 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.49.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.52.0.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "c1ae38500e73065dcae57355adb6278cf8b5c8e391994ae9cbadbcb9631ab409"
+SRC_URI[sha256sum] = "01f30e1a9e3638698d89464f5e603ce29d18e1c0e63ec31ac570aba4e164aaf5"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


