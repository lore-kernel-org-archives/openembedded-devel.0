Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A816EC4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44632.1784715886775455221
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rQiyVlko;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715887; x=1816251887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6wMH5X2bfLR72vZWAkZm2gl0pKI6/rZxw0XEoAvEHDk=;
  b=rQiyVlko4jf6PgL5E4U2/1xoTtV/SPakb6s3PIGBLzQmOdlMxyeBHAkq
   m+3zaP3/XT0uFsLU1tR8JnGglHPRGFWfQLbKFoPrhRh2ZlXtKV8WHSLdv
   X+cLlv/P4Eo9R1GJCgHxfXwp6q9tlTdXB2TuGr32f5FbmzNWLzdTU7LkH
   BsdNoczjx5lmRS2EGOr1RAobtHVtpuhpWCFYJlykBy0HQsbWmTFyZGzGl
   kAW6zqH5zH2bP25z0ucnPiXW8PLy6gwGr+7Ja/BZ0oFNy2d33/x7zF/Xl
   BTSUe+hQvfysX5BVFReq+K0dhfzdDAShyxUrm2KIuj4NBfYSn+8wWCKku
   g==;
X-CSE-ConnectionGUID: afiZ4E4bSiOx2T84WSWuNQ==
X-CSE-MsgGUID: Zsx1/1hySUeFlLr+gRNrLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248228280"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248228280"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:45 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1FC89100034B
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:45 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C47371001509
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id CF3C54028B3;
	Wed, 22 Jul 2026 10:24:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/37] python3-tqdm: upgrade 4.68.4 -> 4.69.0
Date: Wed, 22 Jul 2026 18:23:14 +0800
Message-ID: <20260722102320.1019-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128401

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- add tqdm.asyncio.gather(..., return_exceptions=False)
- misc minor framework updates
- bump workflow actions & pre-commit hooks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.68.4.bb => python3-tqdm_4.69.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.68.4.bb => python3-tqdm_4.69.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.69.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.69.0.bb
index a8a657502b..aa9681f6b7 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.68.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.69.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT AND MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=9a9bed097dea538bf341c8623c8f8852"
 
-SRC_URI[sha256sum] = "19829c9673638f2a0b8617da4cdcb927e831cd88bcfcb6e78d42a4d1af131520"
+SRC_URI[sha256sum] = "700c5e85dcd5f009dd6222588a29180a193a748247a5d855b4d67db93d79a53b"
 
 CVE_PRODUCT = "tqdm"
 
-- 
2.43.0


