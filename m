Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1AACD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:53 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19044.1779190846901659753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AZe0l5jR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190847; x=1810726847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jb5/MmJBI9qMd3IeFmTWDG1aH0UP5s6IWHKfvUf31pE=;
  b=AZe0l5jR/Q6MBB0h9tVaJUzTV0SxXnptDOovPbWXpSJFyHkyxHK/QhPo
   cvZbulk5eVe9vI5Q2K7HGlR0ST9N+C/TPddqQlYFI6EgIcX/I0e02jKlp
   L8CjJDxobZuzHhSgvjdBjFoI1Mfs7fsGiXybf40xMXayZYXNoDd2X5Wb+
   1289cX84AeaVNADJE/dI+fsgizfY5eJAr4V8ri2LCYeoyzB/r0R5O649b
   iRAZ4Av77vNLJpvQQvN/lO+dLwLWrjZrf+KPCOiN8rvKhubJ/9zNFKPBf
   OD5qki/CoP1k035OKHtyMjTy39/Q3aOaUXrUwM5feu1PXtiILauti40vL
   g==;
X-CSE-ConnectionGUID: N2KxdhHmSiaWfpQoJVVHEw==
X-CSE-MsgGUID: TYGq1FPcRCqvGx0/J/5D/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="227255638"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="227255638"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:45 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6ABAA1002B9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:45 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2257114042E3
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id BFC8C405E0C;
	Tue, 19 May 2026 11:40:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/38] python3-python-multipart: upgrade 0.0.27 -> 0.0.28
Date: Tue, 19 May 2026 19:39:08 +0800
Message-ID: <20260519113921.655-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127087

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Speed up partial-boundary tail scan via bytes.find
- Cap multipart boundary length at 256 bytes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.27.bb => python3-python-multipart_0.0.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.27.bb => python3-python-multipart_0.0.28.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.27.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.28.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.27.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.28.bb
index 184f5212a8..1c57dc03f2 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.27.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.28.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9870a6a8c5a20a5bf4f07c017bd1489006ff8836cff097b6933355ee2b49b602"
+SRC_URI[sha256sum] = "8550da197eac0f7ab748961fc9509b999fa2662ea25cef857f05249f6893c0f8"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


