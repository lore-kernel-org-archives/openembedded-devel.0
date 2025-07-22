Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0122C83F26
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.4286.1753153988028971761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bNSCxK+0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153989; x=1784689989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C2dLZs4gGFYY5PqMwvYR34n1MnO90Z6cOYMyYM10aZs=;
  b=bNSCxK+03+aMP5HwqKyfBJafNhG8U4xSIyOYOt8ViAGbvWSgZqQUEGDq
   BrX2iKAA6SuBHsnEwX2k38TKRChuX86OT+aS0qAssR6vU6ZKdebtpWakn
   ZkVNuSUHSlrWAVc213gSyI3r3JWY0FCKm5Zmo+yPp0XbIKUf21MA4qJoW
   +yCP7LqHCAKk3OP5SlFTyVfwrkpTOBy+pI13/TecisiF29gGU+sq22P7u
   HAQEhH97sXWClfdJISMRHXqMqFYYfV5/Rzj44z7BLEvwj37czbpFr52tY
   hAGBambXBwFB42/VmwIf13K11yA0aJFirlBUJxs+yMNeM8g3F90aDTDaB
   w==;
X-CSE-ConnectionGUID: GBlyvhs0Thyje8aRYD4L8A==
X-CSE-MsgGUID: eDfPXIsjRKOeTWEW4uKndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="207510938"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="207510938"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:07 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D224342A304
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 453651800336
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:07 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3E55E1A009A;
	Tue, 22 Jul 2025 11:13:04 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 14/21] python3-pyproject-api: upgrade 1.8.0 -> 1.9.1
Date: Tue, 22 Jul 2025 11:12:22 +0800
Message-ID: <20250722031245.884-14-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118677

Changelog:
==========
- Create FUNDING.yml
- Fix the CI
- Wheel is not part of the default requries

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...n3-pyproject-api_1.8.0.bb => python3-pyproject-api_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.8.0.bb => python3-pyproject-api_1.9.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.9.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.9.1.bb
index ddbddbea84..02fbfbcef6 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.9.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "77b8049f2feb5d33eefcc21b57f1e279636277a8ac8ad6b5871037b243778496"
+SRC_URI[sha256sum] = "43c9918f49daab37e302038fc1aed54a8c7a91a9fa935d00b9a485f37e0f5335"
 
 PYPI_PACKAGE = "pyproject_api"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


