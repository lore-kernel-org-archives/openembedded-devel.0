Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126F8D2D8D0
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6888.1769507074167042098
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r1vKokj1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507074; x=1801043074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rc1JSWBATdsCDNt8mw6pRJewQ6mg6nxPyPrJNMB8xD8=;
  b=r1vKokj1yxcxEPjC6cayiVOB8dCpJZP1uyfwiBsz5XxuNfCDc2LTnGit
   sAlU9SpQh6vKg+r+sZbAGSYosNrjPGZcWNbW3J7vO9NGd23Pmik51bZ8P
   fFgqle2rSiLt+aPYV6gWW/Z9peS5EcxMT7PK3Ioj+m5PLlJS0Tai/7391
   1j1njssmP5xJs7gZfom8iwjl0UORJ8elTRmBqmKdvTbDwCMl57MfzkdEv
   IoJyFjr2jxDTVebE8Sylvl3oqevltE3wf7tRJW7ellrBL51S2JxfRaRWH
   SP6uSqtZ5ff8GGJehjwuLgy7wbtaezP/i6QFxEWihN0a7fQS0kG1MJy+d
   g==;
X-CSE-ConnectionGUID: 1Q2CxHBgT9a9Rl6Fh8mc/w==
X-CSE-MsgGUID: fBj4FtfHROyfyRTBFTdMOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227219703"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="227219703"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 9AF7B42A316
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:32 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5008018026F1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id C329E20000EC;
	Tue, 27 Jan 2026 09:44:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/25] python3-pytest-html: upgrade 4.1.1 -> 4.2.0
Date: Tue, 27 Jan 2026 17:43:36 +0800
Message-ID: <20260127094339.1081-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123925

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pytest-html_4.1.1.bb => python3-pytest-html_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-html_4.1.1.bb => python3-pytest-html_4.2.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
index d45f6a25ee..ea760ff29a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.2.0.bb
@@ -4,7 +4,7 @@ DEPENDS += "python3-setuptools-scm-native"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI[sha256sum] = "70a01e8ae5800f4a074b56a4cb1025c8f4f9b038bba5fe31e3c98eb996686f07"
+SRC_URI[sha256sum] = "b6a88cba507500d8709959201e2e757d3941e859fd17cfd4ed87b16fc0c67912"
 
 PYPI_PACKAGE = "pytest_html"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


