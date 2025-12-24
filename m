Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789E6E7543E
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:40 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117313.1766567674028219723
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HiDSQfN+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567674; x=1798103674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QCWrR8GfSlTI62AhxrJdZHxHRifH1+ji4R/upeTFYvU=;
  b=HiDSQfN+QGN7iNflmSRd0r6iRWz6J9ENgs5d9WmtFKD9SQjPTHTADrcP
   la3k/4u31fpAU9xLnWkRX7n7qWHd9n+dgzV4Q6Ij4cpAmiS1oGEplnTvN
   TNYpbtH7AFtLt7JsSWIs+i55tpIZrAusiv+cF3Pvg0x4SI8M5SSAXb8Uq
   yZ0h0ITvPsvEm0GIwqg0qFx7TbqvklIWLxJWYFQxLUzAhOEmS3b6eTNoD
   9udosKnxwOKgAfi1X0l84gg3olvNmY8RIxHNqLTgxXv9vrxOC/7hb08Tf
   wif6IeA+7T5xsN14BM1nRAuRvSHYSgRI0//RtraiMAMT4rOBEmDpXD4ZZ
   g==;
X-CSE-ConnectionGUID: FMlAOKBOR7mnt9tG4AYoNg==
X-CSE-MsgGUID: uZzl8NVLRdOiUU15bhkXiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="223179837"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="223179837"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:33 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 7A6771002B97
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:32 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3049014003D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 72FD62000769;
	Wed, 24 Dec 2025 09:14:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/28] python3-nodeenv: upgrade 1.9.1 -> 1.10.0
Date: Wed, 24 Dec 2025 17:12:56 +0800
Message-ID: <20251224091304.974-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122870

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Use lowercase lookup for archmap
- Add support for Python 3.13
- Add UV Virtual Environment support
- Use sh instead of bash
- Replace additional use of which(1) with shutil.which()
- Support leading v in .node-version
- Check host platform when finding node version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nodeenv_1.9.1.bb => python3-nodeenv_1.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nodeenv_1.9.1.bb => python3-nodeenv_1.10.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-nodeenv_1.9.1.bb b/meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-nodeenv_1.9.1.bb
rename to meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb
index 3c2a29ddac..1f02ce7055 100644
--- a/meta-python/recipes-devtools/python/python3-nodeenv_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nodeenv_1.10.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a9e238ffae5bb6447dbac6291e1dc3a3"
 PYPI_PACKAGE = "nodeenv"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "6ec12890a2dab7946721edbfbcd91f3319c6ccc9aec47be7c7e6b7011ee6645f"
+SRC_URI[sha256sum] = "996c191ad80897d076bdfba80a41994c2b47c68e224c542b48feba42ba00f8bb"
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.43.0


