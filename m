Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0476105A569
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:57 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18772.1773312824760925638
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GoF/3aJ0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312830; x=1804848830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fpDTlKolaMTEI7FlGZYB8p6LQfsCq/NAcy5r0EbWQNg=;
  b=GoF/3aJ0f6HexmFku8UUUw0j2/aLfueoqUiLCKF6Hl6LhnUncZj9svTa
   oWimt8C7tDYqETUe3YfOlE7W9FOFi1Utm3VR5X1lgTyreE0SsQkSAfrDY
   1xHygWSjf5es/3Jg1QrEo6LmjbZUooartOlbxlIt5jGE+7Bs0r+yZLwpN
   kJk5RpMipyCE8lNJ2Tw/ECs+9Aq7j5CBznVX+P/6MRD2W+NtWXmZw/Ef9
   tg2kwRjRH50KGp45jQpxAzMapGZNGdD2b5lqGxhjBbR1f9in1Rp1OZhHx
   lji2dcWKC/0WsJZSWsvoTmVUZfuraN64A8x44WSNmjEIskVGFRCyUyzd0
   w==;
X-CSE-ConnectionGUID: O1m5aTPPSeuoZMxbBOJDag==
X-CSE-MsgGUID: r/R77hzhR6ah9Tfte2dVmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220449429"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220449429"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:49 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B20451C000B7
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:49 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5CCD21001511
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 79EDB18005BE;
	Thu, 12 Mar 2026 10:53:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/64] python3-isort: upgrade 8.0.0 -> 8.0.1
Date: Thu, 12 Mar 2026 18:51:55 +0800
Message-ID: <20260312105220.1856-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125139

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix #2461: Added compression to stdlibs for Python 3.14 in isort/stdlibs/py314.py
- Fix unindented comments being corrupted in indented blocks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-isort_8.0.0.bb => python3-isort_8.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_8.0.0.bb => python3-isort_8.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_8.0.0.bb b/meta-python/recipes-devtools/python/python3-isort_8.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-isort_8.0.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_8.0.1.bb
index 36cf91ba6e..b8e32a5563 100644
--- a/meta-python/recipes-devtools/python/python3-isort_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_8.0.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=197c46995787b46a2dbf0d519c1754cf"
 
-SRC_URI[sha256sum] = "fddea59202f231e170e52e71e3510b99c373b6e571b55d9c7b31b679c0fed47c"
+SRC_URI[sha256sum] = "171ac4ff559cdc060bcfff550bc8404a486fee0caab245679c2abe7cb253c78d"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


