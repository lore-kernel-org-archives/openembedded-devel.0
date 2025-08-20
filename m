Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADBDCA0EFD
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.15250.1755679199610507839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fCflPupO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679208; x=1787215208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5c4hotrLRnXio+kGnh3yKReKJfpxrNrAfjosMTIVCL0=;
  b=fCflPupOp3wJdREtCrvi24EQlu4pwh+aXUx7HM5XiUlJpcD+d4lTy2hX
   EdsXgYlDBSyrvDU6Uu9Ey5nnsTRJFNcHfL/+Yn4LLktaS/RuW+7jMLenC
   ly6ihbnjg5RRec9yHz2Fn/JltaLX8gOs0ohl+zgZrsO7eyuWQ/R48OZ49
   m3Ly+a+7eZT9y6bDIFPfE0J8EVbsSfKFf1MSHNJYdlS/NNGcvAaWq2ZG4
   vh4qF5ZHhOMdpG5NC3BAylTDnQweDoHhLZn7CR3EwEEexBC/wxMjE1ImQ
   P9VNHi6gast2g4JaHMAf9ANs76INLbw84Ehxv+nKpcKWTp4PyoUSNXq/T
   A==;
X-CSE-ConnectionGUID: bUcIuzE0RS+v8OWuZsu7vw==
X-CSE-MsgGUID: 8q/M4CbSRdiJlYmXLXdnZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210000434"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="210000434"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:07 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 36DFB1000344
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:07 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E576A1802AE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id C615C10000B2
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D26371A0086;
	Wed, 20 Aug 2025 16:40:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/26] python3-coverage: upgrade 7.10.1 -> 7.10.4
Date: Wed, 20 Aug 2025 16:39:42 +0800
Message-ID: <20250820083945.802-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119034

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix: some code with NOP bytecodes could report missing branches that are actually executed.
- Fixes for patch = subprocess
- Fix: really close all SQLite databases, even in-memory ones.
- Added patch = fork for times when the built-in forking support is insufficient.
- Fix: patch = execv also inherits the entire coverage configuration now.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.10.1.bb => python3-coverage_7.10.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.10.1.bb => python3-coverage_7.10.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.10.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.10.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.10.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.10.4.bb
index 1a97db31ae..d54d218326 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.10.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "ae2b4856f29ddfe827106794f3589949a57da6f0d38ab01e24ec35107979ba57"
+SRC_URI[sha256sum] = "25f5130af6c8e7297fd14634955ba9e1697f47143f289e2a23284177c0061d27"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


