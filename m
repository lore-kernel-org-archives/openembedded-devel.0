Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140771112272
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7115.1775096157321046455
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YJ6j77TC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096157; x=1806632157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iiwAlUxvmsVynkECaAZEic+uJ9W28iJwrrmSGXH4lEM=;
  b=YJ6j77TCM8Nk6CX7cYygGE6txntSltePJTTf2aI1DOt5GrKlLd8/aIB3
   7tK1HEALN0LOz+SZlc1RVHKGCIDRYljGeXP8/nw+4Tpve3CTAyDmtEFkJ
   Sw5A/7l7oq64IcTpwLCQCy1f2ZkBfz4DdGBVN9UgfRHcvZ+V9Kgi0DPFe
   mGSssn42KKjJRlXOYvMflg9leorDlUU1Qz6pB7qZBHFiJsdT6pC3Gh1Jc
   dUFe4riSKh1ZffKu4y6AwGX5jW9kooS7iweouIbiF8fMb29vchTvNTLV5
   SRNQiRRWufWDqdmyO5l+CZF3K/VKVQk0T23GjG6VtKG8zfrdV0hgTZqYN
   g==;
X-CSE-ConnectionGUID: IB/i6HU1RXy34SaBZZeX3w==
X-CSE-MsgGUID: u/K6uWQJTBSSjbUb7AVNhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="239868213"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="239868213"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:56 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DCC7B1002B97
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:55 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 97A8A148AD12
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 4DF521003740;
	Thu,  2 Apr 2026 02:15:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/39] python3-redis: upgrade 7.3.0 -> 7.4.0
Date: Thu,  2 Apr 2026 10:13:46 +0800
Message-ID: <20260402021355.1324-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125946

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix AttributeError in cluster metrics recording when connection is None or
  ClusterNode object instance is used to extract the connection info (#3999)
- Fixing security concern in repr methods for ConnectionPools - passwords might
  leak in plain text logs (#3998)
- Refactored connection count and SCH metric collection (#4001)
- Refactored health check logic for MultiDBClient (#3994)
- Expose basic Otel classes and functions to be importable through
  redis.observability to match the examples in the readthedocs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_7.3.0.bb => python3-redis_7.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_7.3.0.bb => python3-redis_7.4.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_7.3.0.bb b/meta-python/recipes-devtools/python/python3-redis_7.4.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
rename to meta-python/recipes-devtools/python/python3-redis_7.4.0.bb
index 861221d3ee..5978ef51e1 100644
--- a/meta-python/recipes-devtools/python/python3-redis_7.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_7.4.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
-SRC_URI[sha256sum] = "4d1b768aafcf41b01022410b3cc4f15a07d9b3d6fe0c66fc967da2c88e551034"
+SRC_URI[sha256sum] = "64a6ea7bf567ad43c964d2c30d82853f8df927c5c9017766c55a1d1ed95d18ad"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


