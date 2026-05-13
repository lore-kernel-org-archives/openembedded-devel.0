Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43436CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:10:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.122.1778645428845171462
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l386N97u;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645429; x=1810181429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kes+PGJNtVfJyBcBfw7s6ocAascifC0gZoyYGb/W2Bg=;
  b=l386N97u1AaDdgo916icKTuxCgVBr0Qhz6qRgHjSx1B7wMq0OlMy6Fu5
   CZ3mFRuEt+OQ+GSESlzmiMbohNFpo8nY9QMEX3M63mSlL0PFl/BxCeHCG
   PWzinPoSCEdhQMFWe9qT6gJazl54YYllZipx3GlohtOl8eGdftqnJOGwV
   +JR2Gx7jXhZl8vwRrYbBjSjxVR9HuFsY9IyVjVdkwA+DhSNWhS+3BeKmq
   ZtSuupJnJb7m5vGiHLftZzBPQcMAQj5+SJ/jBqcFSQNotdihtydvsBhCZ
   gq1WY7F4PdYJjJsfJhiLq9DAb0nV673kiJfW6I6T1TuXmbZ86VUhQBwSl
   A==;
X-CSE-ConnectionGUID: UgfxjPw7QzefwIBxJOK7cg==
X-CSE-MsgGUID: 646UwrlTTS+EK6RNsJRs7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240206557"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240206557"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:27 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 56291100036A
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:27 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F41DF1C002F1
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7243C1400247;
	Wed, 13 May 2026 04:10:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/56] python3-flask-jwt-extended: upgrade 4.7.1 -> 4.7.3
Date: Wed, 13 May 2026 12:05:22 +0800
Message-ID: <20260513040555.377-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126908

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fix: a unexpected token
- Update active python versions
- Bump PyJWT to 2.12.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...wt-extended_4.7.1.bb => python3-flask-jwt-extended_4.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-jwt-extended_4.7.1.bb => python3-flask-jwt-extended_4.7.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.1.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.3.bb
index b36ea81d97..31d54504d3 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.3.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "flask_jwt_extended"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "8085d6757505b6f3291a2638c84d207e8f0ad0de662d1f46aa2f77e658a0c976"
+SRC_URI[sha256sum] = "a8318a3d983d1f360724b901889f1947ffee418e2a3950b48e99c70923b6615e"
 
 RDEPENDS:${PN} += "\
     python3-werkzeug \
-- 
2.43.0


