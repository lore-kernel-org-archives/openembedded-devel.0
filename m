Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557FFCAC5A1
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.15425.1758015728763491680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KFpAy16E;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015729; x=1789551729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VEYQ1c/8dwiHk8xbc2n4nut8ho+P8udakhdJOdfqJwg=;
  b=KFpAy16Ej3hM8e7EWk2lH8VBT1TCsLWOEfhjCiP7if0Z08/k5OgUToKy
   RDeR7GncKWX6tj6vP4FF8owu8J38SqBUxa/lT04F0t4VCeqoLbWkaecVO
   9fnzocxdn0Housy+D3rc3kU9WsTCD5fbxuKQtkFNFgcme+XhUe2Mk5D5p
   EpIljcJNY/o+F0EJcGdppAbIGAhdjY+xrTm/7eEyroFjCymncDAt6BVGW
   813F7MfMx6T56raCpXbc8Ypcn1thzpTo9vw7+iy6oWQ70bmD1h5qldfj3
   SiXWxgzMj+aakyF2Wz8DY36Jd7gAYMu2XXF6X4AvMwDdMcUkIA1ngnZRu
   A==;
X-CSE-ConnectionGUID: 8yEJRiEaQGmTTmxzUJi2GA==
X-CSE-MsgGUID: q6Em4ivwTTi/ZShpwrj1cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="213534101"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="213534101"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id F153D1C00092
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A9A4C180050A
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id EE0B11801555;
	Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A90E1A0074;
	Tue, 16 Sep 2025 17:42:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/42] python3-nanobind: upgrade 2.8.0 -> 2.9.2
Date: Tue, 16 Sep 2025 17:41:35 +0800
Message-ID: <20250916094152.1479-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119445

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.8.0.bb => python3-nanobind_2.9.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.8.0.bb => python3-nanobind_2.9.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.8.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
index 370130af69..85105fd196 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "94e7bf6aa1d7dff9566eddc15252aba94fdadbf67a99a169bfab34b708427cd8"
+SRC_URI[sha256sum] = "e7608472de99d375759814cab3e2c94aba3f9ec80e62cfef8ced495ca5c27d6e"
 
 inherit pypi python_setuptools_build_meta cmake lib_package
 
-- 
2.43.0


