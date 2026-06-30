Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503D0C44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17257.1782811368121412514
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q3NF5o0P;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811373; x=1814347373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LbOB3//n9o3Kumn3a/SKPzlWrowjgQkIXfULy0EKqKU=;
  b=q3NF5o0Pv2EtXHbsjq0NG1NbTRm9XQMY5WzQ9C3rT1DSdHahcD4nRwAE
   SHHaTQB+5f2HnfMqNG3G+ub00UAFuiu6OGMtjMUerlEF363QitCL6tj9z
   sUB1Ke8VtXlRrBK4FBjweLolv7apF69VcqMhK9vGSTc3n0+w749TDjjqQ
   rhhkRlPPRY07Hcfpz4DGaRoYIZ7e8Y/rF2A0KdXzleKy98wh79EgcqsfF
   GeI9iVzwr9JTg8cSchN7rgkaKorQhEU2JmxPd11IGR6Gs+KtCbGExy8jL
   Pb4y15mrjNqHMsDGGLUJy4lJ0+2qKhZVt4xfqCjDf7EcikqXbOqQTtFgI
   A==;
X-CSE-ConnectionGUID: CjskbLweTaCQ/jDqNv2kbA==
X-CSE-MsgGUID: rpM/3xnkQjKXiQ9zTYsImg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="243961076"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="243961076"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:53 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E15C6C01592
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:52 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 97E8BC00313
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A2E2882DDC3;
	Tue, 30 Jun 2026 09:22:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/37] python3-regex: upgrade 2026.5.9 -> 2026.6.28
Date: Tue, 30 Jun 2026 17:21:55 +0800
Message-ID: <20260630092206.322-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127969

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2026.5.9.bb => python3-regex_2026.6.28.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.5.9.bb => python3-regex_2026.6.28.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.5.9.bb b/meta-python/recipes-devtools/python/python3-regex_2026.6.28.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.5.9.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.6.28.bb
index 6dbf329b65..afad386715 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.5.9.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.6.28.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a8234aa23ec39894bfe4a3f1b85616a7032481964a13ac6fc9f10de4f6fca270"
+SRC_URI[sha256sum] = "3cb4b6c5cb3060cc31efdc1fbb27c25fb9b29044afd87e40601a1c4d9db54342"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


