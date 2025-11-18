Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0474ECCD19A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8411.1763456971054138096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CuEdETek;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456971; x=1794992971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RbkeHrFSA7hvcHCtfS81xVhrBqlkiOZ6GHixYh04vWY=;
  b=CuEdETekJ7g4pS9aUbDKn5+yRBHk9RltqnOqt26t3+K04hy5kdxzToyS
   DBgSO1mpWbdDBo3tYf9+hwrVjtN77r2f65XNdJ+SyDSsUy1UxJS32CkYL
   K+yPbLjtZvwY2+zUvJr1Xb9itvHv+oJt5CxNT/Wn7JlZYVAua5q6katPy
   bGb0FTNGtuv3IsqgGj0Aa9WrWUQk03j0xdCW8UQL/Z509nPEvpWEFq4Mz
   nsNpvkIchi6NddobBZhBqDQzXHR5V96c+k3SPDBnyDn1k6bQ9lgNDBH2D
   JZ1nHqDadW5OPNeseBPJDUquKr8J7qQEEz13cCtnd6bvZpQdjVIdfhgi0
   Q==;
X-CSE-ConnectionGUID: vSQncpNnT/2v8pm2sVfrrg==
X-CSE-MsgGUID: JJ2hndb3RxmHLgJil2hdDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="198586330"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="198586330"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:29 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id A08B81C000B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:29 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 51FEC1800EBC
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id BDA24140027A;
	Tue, 18 Nov 2025 09:09:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/29] python3-protobuf: upgrade 6.33.0 -> 6.33.1
Date: Tue, 18 Nov 2025 17:08:39 +0800
Message-ID: <20251118090846.1484-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121833

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_6.33.0.bb => python3-protobuf_6.33.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.0.bb => python3-protobuf_6.33.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb
index 633c82f365..fcf53cb9a0 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "140303d5c8d2037730c548f8c7b93b20bb1dc301be280c378b82b8894589c954"
+SRC_URI[sha256sum] = "97f65757e8d09870de6fd973aeddb92f85435607235d20b2dfed93405d00c85b"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.43.0


