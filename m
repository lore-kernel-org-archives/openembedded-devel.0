Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F3BC83000
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.13876.1750662713949908377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r02GghCk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662714; x=1782198714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nQr1C+kzW1OdauguTVILgksaapD7fAFpZniTX/lwoY0=;
  b=r02GghCkMPLiI1p2a26w/MUPvxdS0/zis1ZuysVfqYr6CY1mWujfBUYU
   KkGoEJYKNzyvg3DZQ2ZVZ30+s58iWKOuk7FtrltyMR7DhPUB9Au4nSAv8
   Rv7sX+e+85D/r90nnwbWEcfsAYjI85AWHYX+4ik04zPsPVsWf1PyrVKoM
   4cvmQlGAEl0GG5AjSmL7O2xxhSEZiTYT1Ea/+FiaYo0JSL8QmZW5JyYLw
   NNX8BpzbLb7PZVyytAnLQKjGI5P0S2f2YInP1j0uQsLlxmfclGStnkyes
   XE9L/P32kk8R68uieTYOz5aRgKm6w+b6pqhoYaVQ2Es91Ds0E8z0yBdyE
   Q==;
X-CSE-ConnectionGUID: VGYlCdsISBe9IQAEbHUKMA==
X-CSE-MsgGUID: cY6YrSpHQu+5d5Nvk82ajQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="203577700"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="203577700"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:52 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 93CB72D058
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 45219D7624
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:49 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BEC931A0073;
	Mon, 23 Jun 2025 15:11:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/30] python3-alembic: upgrade 1.16.1 -> 1.16.2
Date: Mon, 23 Jun 2025 15:11:16 +0800
Message-ID: <20250623071138.402-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118039

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed issue where dialect-specific keyword arguments in dialect_kwargs were
  not rendered when rendering the Operations.create_foreign_key() operation.
- Fixed rendering of pyproject.toml to include two newlines when appending
  content to an existing file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.16.1.bb => python3-alembic_1.16.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.16.1.bb => python3-alembic_1.16.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.16.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.16.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.16.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.16.2.bb
index 415b147175..a40a594522 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.16.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "43d37ba24b3d17bc1eb1024fe0f51cd1dc95aeb5464594a02c6bb9ca9864bfa4"
+SRC_URI[sha256sum] = "e53c38ff88dadb92eb22f8b150708367db731d58ad7e9d417c9168ab516cbed8"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


