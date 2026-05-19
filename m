Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69940CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:43 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19040.1779190837182416817
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CiIMw7Xn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190837; x=1810726837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=00r6d2PqmASNxWYzOlDaH//Xi4y9bAljiGVOd+9R6pE=;
  b=CiIMw7XnHhj+5UBd7vPZ3m8Or2OSUkWYnOHEDgZSrw/JtGslnc+DjdWj
   H5yyR/CeNwpK2RBkRQ0F4w8n5iJ4kpdayAJP3Woo4O57hb4UVLy+61K4U
   snnDILrn2Bxw+cu1hzmZ0cABuJQ8GhW6pFngAk2qOHaeC4ObZRegJcsTf
   jGEA2RfKn/BthVKCjsfj1ur0jjm/H2rBs8Et1fMTZpomODelY9enN/eEy
   Y/OlzWE2/7MTVA/xZJAX4t19eV00MfEvcGi8m338zRW03j+pnQ+6yA2Cd
   F2Akp0b3x+kQ8UAQlTr0AFe2wdb6YJoC3JdP7XyTB/tfS7W0JoED3x0oD
   g==;
X-CSE-ConnectionGUID: qSP6VgPZScKRhSVZoVv1XQ==
X-CSE-MsgGUID: gDzFnQ8FQseVBJs9aHu0xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="244313256"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="244313256"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A30571C00093
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:35 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 511F51800EAB
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id CAF0C4066E3;
	Tue, 19 May 2026 11:40:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/38] python3-paramiko: upgrade 4.0.0 -> 5.0.0
Date: Tue, 19 May 2026 19:39:06 +0800
Message-ID: <20260519113921.655-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127085

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-paramiko_4.0.0.bb => python3-paramiko_5.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_4.0.0.bb => python3-paramiko_5.0.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_4.0.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-paramiko_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb
index b1f86acb4e..607fc6c089 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "6a25f07b380cc9c9a88d2b920ad37167ac4667f8d9886ccebd8f90f654b5d69f"
+SRC_URI[sha256sum] = "36763b5b95c2a0dcfdf1abc48e48156ee425b21efe2f0e787c2dd5a95c0e5e79"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.43.0


