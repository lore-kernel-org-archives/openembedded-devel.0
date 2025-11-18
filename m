Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0F6CED24D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8429.1763456956113087599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JwWqc8Fa;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456956; x=1794992956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JTsixulXoDhtcn3/SJxMdg2WFd+84jVO+hROqMQADSU=;
  b=JwWqc8Fa4M2Yu3fzvxve/7VWWROC/IDd7pxVAy7oKhNAk8GJyLb064Rv
   1Obn7NWSkd7U2W3Gcw8hI0rd7nyQsqiStICVb24g6yndcg29WXBNW0FPH
   FOsy3/oVIU4us0fFcjJ2YLt7TL42vO27ZfrMMiqs2biVCW5hUK5DS2aNK
   6lMnv64NBHrW/W9gISXeKSgDXkXhgxrhL4EZbDHDv4Zz1Ed39h5xm1cU0
   6vFs6AQixac3U2mPnaYwdIXjADP/cLzPOLk5CoJZEMMhJ3TlZ+DgBzdYN
   TXWwmFFU0OtdeBvf7Q4i5rAuibba9KivlJo+NWkmUWOUWI7eznuVrN2hE
   w==;
X-CSE-ConnectionGUID: VX1MRgSxTsSbcjZowOutqA==
X-CSE-MsgGUID: GXLXwh5MRR62uuinRzr5HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219649484"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219649484"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:14 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 6C3CB1000348
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:14 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 152251C00162
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 98CDF14001F2;
	Tue, 18 Nov 2025 09:09:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/29] python3-alembic: upgrade 1.17.1 -> 1.17.2
Date: Tue, 18 Nov 2025 17:08:30 +0800
Message-ID: <20251118090846.1484-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121824

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added Operations.implementation_for.replace parameter to Operations.
  implementation_for(), allowing replacement of existing operation implementations.
- Fixed issue in SQL Server dialect where the DROP that's automatically emitted
  for existing default constraints during an ALTER COLUMN needs to take place
  before not just the modification of the column's default, but also before the column's type is changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.17.1.bb => python3-alembic_1.17.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.17.1.bb => python3-alembic_1.17.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.17.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.17.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb
index 4c3602cdd2..81bfdc64be 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8a289f6778262df31571d29cca4c7fbacd2f0f582ea0816f4c399b6da7528486"
+SRC_URI[sha256sum] = "bbe9751705c5e0f14877f02d46c53d10885e377e3d90eda810a016f9baa19e8e"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


