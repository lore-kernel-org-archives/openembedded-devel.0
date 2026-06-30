Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10337C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16872.1782811379105663003
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ij207b2a;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811379; x=1814347379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L/yZBEKjlHjES3lZdNL7ixJhhydtRJcNTJrgGkUlVTQ=;
  b=Ij207b2aMYfiyXYQdsg14dFeIiTOFA+b5kPKMp2YGKg+l34uzMFGpGYv
   b60nVbFwF9xQ7728xkT4/AZSjLQgYmNu46e6jIK2Zu2wW3r9wYpQbsjaw
   8oq8hysyvnrQbNmQ14cPwhsUChgNghIbfW1jwKJb1vXMuqAeg0NBZ/nzz
   8LIkZ+br1SwXoXhtBTegfY7cKGUo12NkYBs7YQj61oxF/AU6ceCjE4ZsC
   qNpgMknZGfopQN6v7rOhRdzHpKbtqxrYP8WhIDetWTo3s8+GW80Z3oFaX
   nmZsSglRhLaAG0F4ezM4Hci5Z44aJ8JNV692iYdTYnOAwiWI7J0a61Jxd
   w==;
X-CSE-ConnectionGUID: HWCCrZ9xRxWZaB0Mi+C0SQ==
X-CSE-MsgGUID: VL+rB9EtSoGKyjqJXfAupA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="223513573"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="223513573"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:57 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8A8F41C000A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:57 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 42A101809AFA
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6A360826FFD;
	Tue, 30 Jun 2026 09:22:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/37] python3-wand: upgrade 0.7.1 -> 0.7.2
Date: Tue, 30 Jun 2026 17:21:58 +0800
Message-ID: <20260630092206.322-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127972

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed de-synced offsets during file read operations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wand_0.7.1.bb => python3-wand_0.7.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wand_0.7.1.bb => python3-wand_0.7.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-wand_0.7.1.bb b/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-wand_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
index b050390014..8b46b28cb6 100644
--- a/meta-python/recipes-devtools/python/python3-wand_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wand_0.7.2.bb
@@ -4,9 +4,9 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a2b05e6331064556e971cfa0efca0bf"
 
-SRC_URI[sha256sum] = "2325eae60fb21b88e293d5ec8dcdedf2644a0c00eb75024c9b47975e1e902e80"
+SRC_URI[sha256sum] = "0387fd08848d00cadd1d885fcb19a17dd4250df2029e5338b6b668b7fed64b5b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "wand"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


