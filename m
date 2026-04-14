Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4744EED7BAD
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:19 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15982.1776163214916307199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dk5/19UE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163216; x=1807699216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mPCj2Cg7B2Mh6It+5ncM3vbgLhmu1euUcYDll2d3g0g=;
  b=Dk5/19UEw1jaBbaGuLb2juo+B/V9aawzoq3QBmpLZkQP+DRMsMJfRHvR
   0/lMi/Y1eeneXXn2eJhy+9JoQGuOn6gMoDIGniwv6KucNEr0w9KTI0Om+
   0kyYEjPAtzKLEWHxU6i6zAoL+yQR2D0zEuINXCaAe2siDn18z2gX9lBI/
   0tERqtvZ5NeWKOc9JqoHO0vpAyUXbLE81Ef5NZ3kiljdCiBG0vryVFhdH
   3cvM/HMgWZ5zNLRGiCLf+BfBRnzOcxyplhgmZOeO/HR4Uqlf0CfpuS9s8
   APoahzqygMU6hAvM2YeJNImcvjP5XJmnSS0ezGNivyk8vXyGg5utIjD5Z
   Q==;
X-CSE-ConnectionGUID: zQy2sEwNR3apN7Wh4cwL2A==
X-CSE-MsgGUID: biP7VuEESlGNKwIbGgDT8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236851662"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236851662"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:14 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 65BEB820714
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:13 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1F3ECC008A0
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id EB74C14000E2;
	Tue, 14 Apr 2026 10:40:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/32] python3-git-pw: upgrade 2.7.1 -> 2.8.0
Date: Tue, 14 Apr 2026 18:38:28 +0800
Message-ID: <20260414103845.1728-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126319

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git-pw_2.7.1.bb => python3-git-pw_2.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-git-pw_2.7.1.bb => python3-git-pw_2.8.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-git-pw_2.7.1.bb b/meta-python/recipes-devtools/python/python3-git-pw_2.8.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-git-pw_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-git-pw_2.8.0.bb
index 6308732f49..4cb8621ad8 100644
--- a/meta-python/recipes-devtools/python/python3-git-pw_2.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-git-pw_2.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/getpatchwork/git-pw"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26e1a171d943c64f00c51f90c256b9d4"
 
-SRC_URI[sha256sum] = "f69c57aafd13d21d6fa604dff680c4f9113a8f31bf3f65dd663bad0e1839b0e1"
+SRC_URI[sha256sum] = "212743923badb38b9da658b0df0b9f3770997684a9e787d489eed5d103e96100"
 PYPI_PACKAGE = "git_pw"
 
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


