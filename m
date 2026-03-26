Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E26410A1E9B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46419.1774526244265377094
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sx35GO1E;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526244; x=1806062244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qDMkpM7TsBrJSo9+oiHS8SKl55WFmiTopkCJjm9wMo0=;
  b=sx35GO1Emv5W8+OnK6hwkwkNC0HrVApOhUOvkX/uVeO3Knci9d3rMD2r
   aGIYSBj1RfnqmwEl9BpoTjNgDaw/Eoou7CwLUPozTg8WHtfG8HO0X8v4H
   Vc0uKLsvWE7B0r/YjvYU+/wMeurU8uilJsFhr/+urGV6KSTIMvYrHoRRN
   7tFYPgkeAbzR71qx2LfFIJbKdI7c/cEdG9CQkFdmj8XNE8lZT39boXzq3
   jk8WhA/c+5uB8FXZL9MmBYmD9SqmgeP9wMgOvVNADe16BLA8OGaiuDOh1
   /oJVFTj9/KDqna1/GayWpvdSxCMdGPqyilLoQMFqonRn+vYbkXICveOMn
   A==;
X-CSE-ConnectionGUID: DzJnbNitRXuCN9qZYSplAA==
X-CSE-MsgGUID: LUKCvHxOTBOv7Waw0S1Wxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213520825"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213520825"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:22 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B14181002B82
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:22 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6DD4614003C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 165A21807164;
	Thu, 26 Mar 2026 11:57:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/63] python3-apiflask: upgrade 3.0.0 -> 3.1.0
Date: Thu, 26 Mar 2026 19:55:56 +0800
Message-ID: <20260326115634.1199-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125681

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Support pagination with Pydantic
- Fix @app.output(Schema(many=True)) is not array type in OpenAPI doc
- Support upload file model
- Fix type checking for view function return types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apiflask_3.0.0.bb => python3-apiflask_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_3.0.0.bb => python3-apiflask_3.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_3.0.0.bb b/meta-python/recipes-devtools/python/python3-apiflask_3.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_3.1.0.bb
index 3b9912454d..25b5075181 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_3.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2b8420a23b93a78407ef5fe3e1f79cdfc7baa9b3c53977a06d6ab68772a7c2b7"
+SRC_URI[sha256sum] = "44ac6de494054e6988afea9d1b9272c36e83ecc8a64c7fbab0b877c0d3820d0f"
 
 RDEPENDS:${PN} += "\
     python3-apispec \
-- 
2.43.0


