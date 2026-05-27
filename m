Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EFECD6E46
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16941.1779875338055763111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gV84NvDf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875338; x=1811411338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wcvHozzsGb1aaTwggsUwecVEGo6OsWyauD2tRowrpIY=;
  b=gV84NvDftuM1K37Xm9qgeR9l2VJRzMGRw+LeWlsiXS0GpTnC49lYv2XE
   UnwWSroOEH/Ih2f30G1dpD4caQB0SBQjMQu8PZFV6IFTO04HWRzxPypLw
   TPNy7VGRpAcx2trLcyNMX1bEoqT8JYmaORvyF3mWLdADkg7qJBKaOk54d
   qmLwdIQlrzxLjXlhGS0xINkDgyZt4++Rz8HTPQRcqvrmIHi8WQEONuUoy
   s4KNlIxOnQxmoDS33/8DBTpL/3dVZp0QConB2q/V37pkbmQcsz2QbKGMJ
   4ouwMEUnVQEqjdENtXQUQLwq4eJk/SrShjTSZ173GTq4ozc62IeY8Gc34
   w==;
X-CSE-ConnectionGUID: UU+NIsLlTmyaG5kXONzF+A==
X-CSE-MsgGUID: 4cFWQhb7S2i2565HtgWGmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241434776"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241434776"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:56 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 976AA1000143
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:56 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4BEC618915F6
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6A2D882A2D2;
	Wed, 27 May 2026 09:48:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/56] python3-decorator: upgrade 5.2.1 -> 5.3.1
Date: Wed, 27 May 2026 17:47:32 +0800
Message-ID: <20260527094805.2039-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127230

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Changelog:
===========
- Added license SPDX identifier to pyproject.toml
- Added official support for Python 3.14
- Fixed a bug with "return await"
- Moved decorator.py to a package structure ('decorator/__init__.py') and
  added a stub file ('decorator/__init__.pyi')

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-decorator_5.2.1.bb => python3-decorator_5.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.2.1.bb => python3-decorator_5.3.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.2.1.bb b/meta-python/recipes-devtools/python/python3-decorator_5.3.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-decorator_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.3.1.bb
index e0ab87f89e..611db8a3f5 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.3.1.bb
@@ -7,9 +7,9 @@ can be abused and you should not try to solve every problem with a \
 decorator, just because you can."
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=69f84fd117b2398674e12b8380df27c8"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fb3c386712bc6cfb52aae3692d1ebbd4"
 
-SRC_URI[sha256sum] = "65f266143752f734b0a7cc83c46f4618af75b8c5911b00ccb61d0ac9b6da0360"
+SRC_URI[sha256sum] = "4cbcdd55a6efadb9dbea26b858f4fb3264567b52d69ca0d25b721b553f60ea82"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


