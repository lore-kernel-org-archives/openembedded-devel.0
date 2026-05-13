Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3BCCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:11:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.137.1778645481941141965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=baJRYy09;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645482; x=1810181482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8L1OoXDS7VPZ6YnyYNkpBBXDiD5kgZGLAR94+DwgChs=;
  b=baJRYy09i3XtJZcZo69oNKgtbh/djJrd8WPzUzeiwUvsVQiV7X0LjCJA
   k9UioKRGsv8sFU92UAy5nMSH/vAbuDtgakaq+Zz2dc7kEbXbveQInLGXf
   Nr/rwoAXUyWKQLLZQJjucROm0vTB+3Z9xPCB+LsEGSgurODkFojeXrJWo
   XUGGV8FEa0EX8TW7QgRQkfZEFcHP9/W6YqDJXgGotsea548RPqBvuog5I
   yIDg9/MJEF+iteer3tgQSw1aURdD1aU5OTrCbJoO61YeeCO4VwgYUelbm
   TdbsVw9WrXywF/AaUb/oRXZGCMdX63Hycj1qDr/GsjE+fqRACmqi9JfKh
   A==;
X-CSE-ConnectionGUID: 9iguXsWWSkCANGUtNDIuNg==
X-CSE-MsgGUID: jnmdTB7sSzam0ImDOnqj+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240206782"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240206782"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:11:20 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 47A63C0009E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:50 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0217118000E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 219191400251;
	Wed, 13 May 2026 04:10:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/56] python3-pika: upgrade 1.3.2 -> 1.4.0
Date: Wed, 13 May 2026 12:05:33 +0800
Message-ID: <20260513040555.377-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126915

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pika_1.3.2.bb => python3-pika_1.4.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.3.2.bb => python3-pika_1.4.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pika_1.4.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pika_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.4.0.bb
index 865accc595..06ec5df736 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.4.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pika.readthedocs.io"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
-SRC_URI[sha256sum] = "b2a327ddddf8570b4965b3576ac77091b850262d34ce8c1d8cb4e4146aa4145f"
+SRC_URI[sha256sum] = "84aa6d0cf60bbdb79d5780544a4a4e1799392760127bf9de2a03d3c3b92f5f1a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


