Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A691BCCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10936.1760433628634480309
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rIwvfA2U;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433628; x=1791969628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/TpCDM6gLtxR8NyznO+pVNXJVi3hewTAjGQ2gFwng1c=;
  b=rIwvfA2UxMzvDr+yCX0lskoNcuM/Aqc96TngmA0J3XRnlbquQGXWIaj1
   ZF7Fq4BbOohNIQMwLqxM3Pgvkj6w5UmWrhxOXSxFXHW+FIxNAGmhIjcaO
   ZT8AsDSHjj88rTU7o56vJwegpA2lhYCoAM+Jwb90v8bVXSYmfqLptTDOm
   wHf7ugCJo65HzQNe0CIJ9OGTlo20hSNawC7HHyRfrj6ceg+bMc9LrsvDb
   JUoEIBNbq5shh9SpYQJUrrq9Z8e9RikIjOJU45f+TT8CeNXEcaDoBCq3A
   k9HxYfZlfOQ/UDse5sTpGlG9MAnCuPi38CduHCNT1GBz1NgWS6llj66AV
   g==;
X-CSE-ConnectionGUID: Ov0Umb0KTvacW3YIDMSfqg==
X-CSE-MsgGUID: IvgFp+VNRLO1j5elI6TyAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215838970"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215838970"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:27 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 19D7F100034C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:27 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C499A1C002F9
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 5CC11101BB76;
	Tue, 14 Oct 2025 09:20:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/44] python3-propcache: upgrade 0.3.2 -> 0.4.1
Date: Tue, 14 Oct 2025 17:19:13 +0800
Message-ID: <20251014091927.493-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120587

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-propcache_0.3.2.bb => python3-propcache_0.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-propcache_0.3.2.bb => python3-propcache_0.4.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb b/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
rename to meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
index 8e2394a5c4..0bb31cd5d9 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/propcache"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "20d7d62e4e7ef05f221e0db2856b979540686342e7dd9973b815599c7057e168"
+SRC_URI[sha256sum] = "f48107a8c637e80362555f37ecf49abe20370e557cc4ab374f04ec4423c97c3d"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
-- 
2.43.0


