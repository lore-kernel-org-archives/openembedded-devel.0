Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0F3CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:17:28 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.223.1778645847007740311
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hefrosxq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645847; x=1810181847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jE78mHrWFw5tykpQ5UEeYHhYdc4AYM/0Hg7Gi4JzE9o=;
  b=hefrosxqwX3fPSRHr8DGhwhWx5E1duTAAmNY0rEAv+mtrB8694sV+hAy
   TOFS9UfgFk1boKrxXbh0BElGQA4LNNQz3djx2JP3gGfifeKvEeLjAu908
   i6qSgNW3oqvossVQ21tUhAzUViXtcjQWNexy15suYyi8u0jejsz/G0n4/
   Cv248XnkitGW5AnUb6V2y0uXh1psR/81OG2n1qjtLLdE7c6YIvMdFSvs6
   a6ABjWsKWYIAFEXwwb9ykXmu3LZMkzCE+kE7dNxvI4d4VecitIJ6Crxcl
   iIO69tGUTqbJdzWkSO5KNpDEPgyBnlAYssBbgZiCfM73ZsBA8ABfd7TjC
   Q==;
X-CSE-ConnectionGUID: 1NctKMcITJ2Ru0bJSDRAYQ==
X-CSE-MsgGUID: /x1owdoBQBWOJ1C1Mync6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240267253"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240267253"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:17:25 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 69D4282072C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:55 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2373118000F8
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 96EF5101905E;
	Wed, 13 May 2026 04:16:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/56] python3-rich-argparse: upgrade 1.7.2 -> 1.8.0
Date: Wed, 13 May 2026 12:16:09 +0800
Message-ID: <20260513041626.412-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041626.412-1-wangmy@fujitsu.com>
References: <20260513041626.412-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126927

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Python 3.8 is no longer supported (EOL since 7/10/2024)
- Add support for PyPy 3.11
- Add ExtendedParagraphRichHelpFormatter to rich_argparse.contrib. This is
  similar to ParagraphRichHelpFormatter but with better support for paragraph
  spacing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-rich-argparse_1.7.2.bb => python3-rich-argparse_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rich-argparse_1.7.2.bb => python3-rich-argparse_1.8.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.2.bb b/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-rich-argparse_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.bb
index 1d0d6ecba5..2da95ab053 100644
--- a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-argparse_1.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=06f5c372171ce02f7e6a18f5f57f0b69"
 PYPI_PACKAGE = "rich_argparse"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "64fd2e948fc96e8a1a06e0e72c111c2ce7f3af74126d75c0f5f63926e7289cd1"
+SRC_URI[sha256sum] = "679df3d832fa94ad6e4bdb07ded088cd7ea2dddc58ae9b2b46346a40b06cbc0c"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


