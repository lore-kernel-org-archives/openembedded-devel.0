Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AB7EA3C39
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:21 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128837.1775730854919170532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=is6ZzoTf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730854; x=1807266854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LIjgkL2qVcZK2MDb4A6D8T3IbSOH15a/JUKhmfCYAb4=;
  b=is6ZzoTf/sWu6KOCBud2OSZEcub7H8hKK6HrgWFc7BqhE8FTdRT1bv7f
   MSAfKb7Mlo1G5xzUYehL3TCCcogzkxqf0Kw6BQFSMpmnbUTgkdxP9OTsR
   R+tmfD1NgnG+eT6O1lQTDnQFvmkzLojl7/rv15rVUnqhzICrBftLZBnxD
   LBlUisWPJKxBCFEdClIPC9QDJRIWREzFWv8hqjKwL7xZJWFF9uwkelzOJ
   LzuD6AllkRuZDATvSoyrTZQPGtjP80Fx3ZzAMs/3QhL3cdQefB3rqkxo2
   GGh1TVqCP63rqYJD/PkSQPm50F121qIWs9se820s8qKM/N0fBxsZPeZWD
   g==;
X-CSE-ConnectionGUID: PgWKbCaiS8qE6+SbRxHAwQ==
X-CSE-MsgGUID: Eu2MR8eaRJSe9yrBsxemyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236342792"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236342792"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:12 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4321942A337
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:13 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E61D0C00568
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 544024041C9;
	Thu,  9 Apr 2026 10:34:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/37] python3-python-multipart: upgrade 0.0.22 -> 0.0.24
Date: Thu,  9 Apr 2026 18:32:12 +0800
Message-ID: <20260409103223.1574-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126175

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Validate chunk_size in parse_form()
- Remove unused trust_x_headers parameter and X-File-Name fallback
- Return processed length from QuerystringParser._internal_write
- Cleanup metadata dunders from __init__.py

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.22.bb => python3-python-multipart_0.0.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.22.bb => python3-python-multipart_0.0.24.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.22.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.24.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.22.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.24.bb
index b54fe5d309..15a35655da 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.22.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.24.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
 
-SRC_URI[sha256sum] = "7340bef99a7e0032613f56dc36027b959fd3b30a787ed62d310e951f7c3a3a58"
+SRC_URI[sha256sum] = "9574c97e1c026e00bc30340ef7c7d76739512ab4dfd428fec8c330fa6a5cc3c8"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


