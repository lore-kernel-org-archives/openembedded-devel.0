Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C6DCCD194
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.11124.1760433666119887066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UW9EsIEI;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433666; x=1791969666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jGtDTzggsjfthk0wDzAwZdIeTceMKGerxBTtIQAzZRA=;
  b=UW9EsIEINE5cuwUt8vPWnRwUoqtTNpEny4Cz2fW2LFHqAHw34Qap5E4V
   xwcjY1jLMzzgpHueTLmCDPgmMIWVLtJ8b5xrcVREWdW3z0mLxy7tdOWev
   2ORol8cEEwIwgPqbH4m8t+EKndg8/BPFS1StXF303niMZnGnU2xg6z0tC
   vJMjR+e3KN2UFjclLNmkRN+u+CWv/xfRed3rp2C/fnRDkLIwDP4A33Skf
   Ke5iVvfqwVZn5Se9KlSK4m08uWd0R6MAlcDCir14Phr89eiWzjJhvS1gf
   0yMtqD4iJnpVKjc0iT9linCn+L95Gryp/md7lAQldooYjiG4KLR76twL/
   Q==;
X-CSE-ConnectionGUID: URNefdXxQqyKEyPKR1b1cQ==
X-CSE-MsgGUID: LdvMKFwoSMa4RerAel3pCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203831882"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203831882"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:04 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 721A582071C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:04 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2B32A8D2043
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9C870101BB77;
	Tue, 14 Oct 2025 09:21:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/44] python3-pyzstd: upgrade 0.17.0 -> 0.18.0
Date: Tue, 14 Oct 2025 17:19:18 +0800
Message-ID: <20251014091927.493-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120592

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Support for Python 3.14
- Deprecate the read_size and write_size parameters of ZstdFile and SeekableZstdFile
- Deprecate richmem_compress and RichMemZstdCompressor
- Rework documentation to suggest using compression.zstd from Python stdlib, and provide a migration guide
- Include the zstd library license in package distributions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyzstd_0.17.0.bb => python3-pyzstd_0.18.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzstd_0.17.0.bb => python3-pyzstd_0.18.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.18.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyzstd_0.17.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzstd_0.18.0.bb
index d93411beba..2aee987efa 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.18.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 PYPI_PACKAGE = "pyzstd"
 
 SRC_URI += "file://0001-Bump-setuptools-dependency-from-74-to-89.patch"
-SRC_URI[sha256sum] = "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
+SRC_URI[sha256sum] = "81b6851ab1ca2e5f2c709e896a1362e3065a64f271f43db77fb7d5e4a78e9861"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


