Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99035E92722
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 06:10:48 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59668.1767075043620966445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 22:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ecMwG8cA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767075044; x=1798611044;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZOqkU+nfOp64iabGilAOURmBzzOVfVnW7vNdOPQSn6s=;
  b=ecMwG8cAfZaneZ3UCnqvzqyBfOtBS1ZcW2eRakpKuxD9rclzCrwJN2XG
   xA984sNA7NVz89hmTDVq2MnuRLeqfMcuxWm6KMco8EBW77bhYXIWPWUJn
   ENMvfu79DrxOBj1js05D9D+gJu9BDjCgql1wVkRnmAAmaUlDmI6xy8MlX
   sTAyEV/JHZDk7i2votoFIWMBj0Ib2Bn/vO8ql1w0onC/n+m+t0pwsrxH+
   IfoyeKzMiikQsWCm+kJprMOH/6LZ+1FG0RTS+JfabsfAtQ6J1lULFI7Kc
   5e09Bp96DgKSyRYicaw40m5zy0vKuqHPWpCuvuuOLQ8LWazBPK2GzGQ1f
   w==;
X-CSE-ConnectionGUID: TcgiFxAKSGCQZSPEBmmq8w==
X-CSE-MsgGUID: Fcjl+J5dTFqHUA5+J/kjfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="223694500"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="223694500"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 15:10:42 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0D6CF42A31F
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:42 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B389D10001FC
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:41 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 88887829EE7
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:39 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 3/3] python3-fastapi-cli: upgrade 0.0.16 -> 0.0.20
Date: Tue, 30 Dec 2025 14:10:29 +0800
Message-ID: <20251230061030.4804-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230061030.4804-1-liuyd.fnst@fujitsu.com>
References: <20251230061030.4804-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123003

Changelog:
https://github.com/fastapi/fastapi-cli/releases/tag/0.0.20

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...hon3-fastapi-cli_0.0.16.bb => python3-fastapi-cli_0.0.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi-cli_0.0.16.bb => python3-fastapi-cli_0.0.20.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.16.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.16.bb
rename to meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.bb
index a8f585b607..76ddb409bc 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e0cf8d811ea2046529403707b266fb5a"
 
-SRC_URI[sha256sum] = "e8a2a1ecf7a4e062e3b2eec63ae34387d1e142d4849181d936b23c4bdfe29073"
+SRC_URI[sha256sum] = "d17c2634f7b96b6b560bc16b0035ed047d523c912011395f49f00a421692bc3a"
 
 inherit pypi python_pdm
 
-- 
2.43.0


