Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057D2C5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3367.1787132209881465633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GSkPiUFA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132209; x=1818668209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=csmpUuCpHjVRk7GGMQnNoRKHVndx8hNN75sw42Lprxo=;
  b=GSkPiUFAgbcj8SWCL0wHWDSpp9wKnuDUBFV8x7zSV5KVLuvIEt5vXxux
   P16JOcJ+eRzkZS2GlxMOOHshZuguKb7Fgf5nQRrfTjcMfLCnxhDh4c0M4
   wfVT79QxUYnyRVV1fQSsRaZUVnsX8GpjPJmI8QAph9QJAnU13E1HsgOVg
   lhEMgF4FYLwai2S/PUCT7NXGJGIiVG5JLeAMlN77FoQfCVLzh02cqxHBZ
   B6w95LewpyuU5jivQ8WhxmmccisPHn0ruUNaQWEsarNqF6eC/sJeCEyDV
   cWyVnMZz5j7l7Nn1WCIgwEo79i4ggEXBEnyuvIB53BCfUs/e7czCkdLSF
   A==;
X-CSE-ConnectionGUID: Z2RF2AtoQWu3/2+qJWklRw==
X-CSE-MsgGUID: 5Y8uv5f3S3SqW0yp/ErOjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239835411"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239835411"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:48 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 30A2EC020D4
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:48 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id DCA84148AD37
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id EE0551801C23;
	Wed, 19 Aug 2026 09:36:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/70] python3-pymisp: upgrade 2.5.34.1 -> 2.5.34.2
Date: Wed, 19 Aug 2026 17:34:54 +0800
Message-ID: <20260819093514.1101-50-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129320

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- build(deps): bump actions/checkout from 6 to 7
- build(deps): bump actions/setup-python from 6 to 7
- build(deps): bump codecov/codecov-action from 6 to 7
- fix: block distribution fields on default galaxy clusters
- Add no_sightings option to get_event
- Fix data reference in galaxy cluster fork request
- fix: [openioc] require both search-contexts before merging a composite
- feat: Add fetchFromAllFeeds
- make build_complex_query a staticmethod
- build(deps): bump github/codeql-action from 4 to 4.37.3
- build(deps): bump github/codeql-action from 4.37.3 to 4.37.4
- fix: accept datetime objects for MISPEvent timestamps in from_dict
- fix: Support in-memory STIX uploads
- fix: Correct deleted search parameter type
- build(deps): bump github/codeql-action from 4.37.4 to 4.37.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.34.1.bb => python3-pymisp_2.5.34.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.34.1.bb => python3-pymisp_2.5.34.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.34.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.bb
index cb7e129f28..7a82ab5e18 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.34.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "dc7d44213064b5fc920dfeb8feae21165eb6543288e3809f2a5c6dd86ec37fa5"
+SRC_URI[sha256sum] = "cbf42d6753e788ec4eabeb3b4cfdece12faf36d43551869d4b7cec2329ee9aaf"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


