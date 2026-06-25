Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC709CDE009
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:28 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7237.1782378142157152778
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cy+Usy3K;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378142; x=1813914142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QLJXVWGjyyfFEr0Y9sZq8wHA9dVyk1c9DPNQbyYaBYo=;
  b=cy+Usy3KvkiYHaewUdqZbLYqxGciACCcvqj0XrLkh7cKrtQr2X+0c5PC
   L1xeEO4E2dk5mPFSQQu9wORpsBJFOHR5LypW30qigSbkkdeNjhBkKFTyg
   t2GBR031zqy3cMpR4+LIuC7sTpQrLNnuecsf9Py9rWy4Qc22CCDI39EPM
   6CM2e4hagbFEsjv0GwaLm9YwXabECmVOfNX8muTpJZy2HckeZ1MmJemj6
   y9KYyI2SOGgX8IxcI69hmGSxqKhvoZKMrraHRfWTj0SYtzy3P+t/BYAB2
   URxp98+yT233u3kmQAel+Txe4emIwg2YvtUpsdF5JcbfUMEr02FmF8/RE
   Q==;
X-CSE-ConnectionGUID: YH6f3tNKQYKcaGBswOZRdQ==
X-CSE-MsgGUID: sLxo4R5pTTeHny1y2Y/XAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="232700762"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="232700762"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:20 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9B3C51C00183
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:20 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4D3B4180009C
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 71293101732B;
	Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/47] python3-pyfuse3: upgrade 3.4.2 -> 3.5.0
Date: Thu, 25 Jun 2026 17:01:11 +0800
Message-ID: <20260625090127.1563-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127763

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Filesystems may now define a ~Operations.poll method to support the epoll and select system calls.
- The FileHandleT and InodeT types are no longer declared as NewTypes but are now simply aliases for int.
- Future releases of pyfuse will be signed with signify rather than GPG.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyfuse3_3.4.2.bb => python3-pyfuse3_3.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyfuse3_3.4.2.bb => python3-pyfuse3_3.5.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb b/meta-python/recipes-devtools/python/python3-pyfuse3_3.5.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pyfuse3_3.5.0.bb
index 4b20c186a1..9d375513db 100644
--- a/meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfuse3_3.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=622e3d340933e3857b7561f37a2f412b"
 
 inherit pypi python_setuptools_build_meta python_pep517 cython pkgconfig
 
-SRC_URI[sha256sum] = "0a59031969c4ba51a5ec1b67f3c5c24f641a6a3f8119a86edad56debcb9084d9"
+SRC_URI[sha256sum] = "88399a9494b88603230bba300f4ba9ad63fece5ed514ca3633d555a0c6a42b24"
 
 DEPENDS = " \
     fuse3 \
-- 
2.43.0


