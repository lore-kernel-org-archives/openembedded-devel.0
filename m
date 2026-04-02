Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A37D39420
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 13:08:44 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15255.1775135314645206031
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 06:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZvKPegav;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775135315; x=1806671315;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6XJriCD7oqxEbWG/VykcPht+sQQlWzbI900xxxfs59s=;
  b=ZvKPegavCnsRRGOj9d+DFMlL0ABK8z4XE+QYTMOo2HVw2Cu04R3YJnT1
   E8yHsdFkyTki+IX0HXWpp+0M3ltx/onroOmaJ9bJdXHXjyyK9jeAsipg3
   3geQSKvgOv0TeJK65gtDCafsYkDfd0aLmZIrYVTBFkk0sS0/RjJPoeA5f
   8wKmn/0K2392mQXNnWPIjxhQVMXX7Akf6F44K/gWnWi7L+MJi3gQ+EYsH
   bL2OowPRTkIOxK4g+XvEILTECfFFl4eqaI/Oppj6oYKzBRXGZ/iAEckq8
   Wmt5rFQXWky+Qth50iVNMr4dvx4oG1Dsysoc/LjOINYE+8dkeVrKfMoao
   A==;
X-CSE-ConnectionGUID: KuLjVRW0Qne3CgWeYFwbkQ==
X-CSE-MsgGUID: yF1kO6cRR/G9tjAy+/I9vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235524227"
X-IronPort-AV: E=Sophos;i="6.23,155,1770562800"; 
   d="scan'208";a="235524227"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 22:08:33 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CBEE042A30B
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 13:08:32 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7EAFC1892C40
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 13:08:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 03DD22000AA0;
	Thu,  2 Apr 2026 13:08:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-ujson: upgrade 5.11.0 -> 5.12.0
Date: Thu,  2 Apr 2026 21:08:05 +0800
Message-ID: <20260402130805.1386-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 13:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125966

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ujson_5.11.0.bb => python3-ujson_5.12.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.11.0.bb => python3-ujson_5.12.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
index 95199de839..14b8049f3d 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
@@ -1,10 +1,10 @@
 SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
 DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
 
-LICENSE = "BSD-3-Clause"
+LICENSE = "BSD-3-Clause & TCL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
-SRC_URI[sha256sum] = "e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c12eb8b991fe2010e0"
+SRC_URI[sha256sum] = "14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e8567c9675b8b13bcf4"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 
-- 
2.43.0


