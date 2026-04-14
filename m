Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1950CED7BAF
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:40 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15867.1776163235264108708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V/JD3J2i;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163234; x=1807699234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=78GPFApdxWs2x5f2+HXz6A1rZDIoDh403gX+LcE4hag=;
  b=V/JD3J2ilZUP4dvYui0GToLoWSR8rziW3YlwD3AnwolfowR4NMiDjqpv
   lF/GFdRKh5RcuDybbJX6N7U9GLtDcc1nIXAhZzQon4bispRWYdzGcM11K
   LYDNkyhKZWNv1jKVqNV8fRcT1c4Fj5rx39IxTF87qzjtRmv3Kq5OQqX7/
   /BtvBIStj2CFHbPYQxGK6nTBVfrz3/1V/TbOnN6iBEEGxdsr2VknpE2AE
   OUkMQpY2HwgOLKNiEjx80j37k8UjgpCXYEzynJI1ZFMX6zdHTSqjzXFhb
   q5C6XIAr2wTCH6RXNDDcktIEcwJ9O54VlKilzk91/zAbe7pHWKLEM/oTA
   g==;
X-CSE-ConnectionGUID: YYm6xJFZRomvIHbww++fQA==
X-CSE-MsgGUID: UN0XsfxHRiW93mqplgrRhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236908290"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236908290"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:32 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C678B100035D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:33 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 76ED810000F9
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D3DB114001D2;
	Tue, 14 Apr 2026 10:40:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/32] python3-python-multipart: upgrade 0.0.24 -> 0.0.26
Date: Tue, 14 Apr 2026 18:38:37 +0800
Message-ID: <20260414103845.1728-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126328

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Skip preamble before the first multipart boundary more efficiently
- Silently discard epilogue data after the closing multipart boundary
- Add MIME content type info to File
- Handle CTE values case-insensitively
- Remove custom FormParser classes
- Add UPLOAD_DELETE_TMP to FormParser config
- Emit field_end for trailing bare field names on finalize
- Handle multipart headers case-insensitively
- Apply Apache-2.0 properly

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...multipart_0.0.24.bb => python3-python-multipart_0.0.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.24.bb => python3-python-multipart_0.0.26.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.24.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.26.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.24.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.26.bb
index 15a35655da..46046dc050 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.24.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.26.bb
@@ -1,8 +1,8 @@
 SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9574c97e1c026e00bc30340ef7c7d76739512ab4dfd428fec8c330fa6a5cc3c8"
+SRC_URI[sha256sum] = "08fadc45918cd615e26846437f50c5d6d23304da32c341f289a617127b081f17"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


