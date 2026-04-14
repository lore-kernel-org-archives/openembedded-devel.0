Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FB8ED7BB6
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:30 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15859.1776163228605346039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hCgO+5RC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163228; x=1807699228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ur08HshKv/Ss9QQG6NweVcw/j4nBjIryzKUVgWzgNsA=;
  b=hCgO+5RCBGyVy3miq1xxHd4K+JiXlQZrrqYkbmW0/YAKpT9q49t2thNB
   V+xuR3S6Xm9Pv0CL0uBpRSz/Fk7S44rrHiadQ1DKXM1kC9f2JSrHOGDEG
   gnCP1c+C3tzDFnqU0cPvivqlYHwTgPby3FUOqHMelgl7UV6Up19+OyuKM
   J532VdHmeRAplJJscQsxxJIFGCRCMqGkRWx4JCBiaXHHs3pUdrJPzXu1w
   vWCPa5F3XKIgfMwv2nrQ9xndvzEyN7+AOcyIMD4tCxf71NQP5qHQOl61k
   tnvb9abpKo/2jZZ0O/tEAinxcJA7tNjOoB1D1ZO040Q4o/FWjWMZsSUVO
   w==;
X-CSE-ConnectionGUID: 5E3k2u8dSlusP5cyRTefkA==
X-CSE-MsgGUID: oHZ3FgtQSFmRSVBGQM7N7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="237631568"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="237631568"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:27 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3E2AE1000341
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:27 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id DA7D910000F9
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4F07C14001D2;
	Tue, 14 Apr 2026 10:40:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/32] python3-pyais: upgrade 2.20.1 -> 3.0.0
Date: Tue, 14 Apr 2026 18:38:34 +0800
Message-ID: <20260414103845.1728-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126325

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- ~35% faster compared to v2
- breaking Changes
  removed bitarray dependency. Replaced with a custom bit_vector
  renamed AISSentence.bit_array to AISSentence.bv
  renamed Payload.from_bitarray() to Payload.from_vector()
  renamed Payload.to_bitarray() to Payload.to_bytes()
  changed overflow encoding behavior
  deprecated NonPrintableCharacterException
  dropped support for Python 3.9
- removed bitarray as an external dependency
- improved performance through a custom bit vector implementation
- optimized single-fragment message assembly
- NOTE: If you are not ready to migrate, v2 continues to receive bugfixes on the legacy branch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyais_2.20.1.bb => python3-pyais_3.0.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.20.1.bb => python3-pyais_3.0.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.20.1.bb b/meta-python/recipes-devtools/python/python3-pyais_3.0.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyais_2.20.1.bb
rename to meta-python/recipes-devtools/python/python3-pyais_3.0.0.bb
index 6ee62a6a32..a8b8777821 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_3.0.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/M0r13n/pyais"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
-SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "6cec67eb8e48c2254bd7bc31415f8df60ecb11ce"
+SRCREV = "a88659ae381487e547fde3c18ab45cfe572b1094"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


