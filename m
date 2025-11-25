Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D37CFD315
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:17:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13261.1764062248287372389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U9AJuoH3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062248; x=1795598248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t+SqgSq9VNI6SklrrIjN/Rm53y0CRANk1bzswVJ5tsg=;
  b=U9AJuoH3E9iIVxlNa6WaWPDDHApEPt7FUdjAj4UYBEnM1Zizb5f2Tzbm
   oJ82qduorqgjwr10DgusK1lmzSfiBeTn62gQclMXKyJkqbL4+lDenrG59
   lah383nymJbkdoiR0pPYJZjdJDaVCgyAWHFtu8lz5DHTsvnSxRgY+KUsd
   OJk66DTHhoE9sUiBBaSDMH6Mk/mDEm+hq8jgPGSAm/YQc7ATCC0YygvkD
   NIi/WnvOoZYXKzyGH6spdmd94owWDbC/Y111UUsX/0yZBC5Mf2dIg+kzG
   izWqScmpBbyR9/v+UMerlD7+utWKHx+nK+F3FiaRbBkCZIsfVg8MxU9gM
   Q==;
X-CSE-ConnectionGUID: +ORoph9+SDC35j6ZNlIG5g==
X-CSE-MsgGUID: 6oBeO/t5TR20HcGezCr//g==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="220318431"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="220318431"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:17:26 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BB0811C000A1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:26 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 749421000856
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2B51F101A427;
	Tue, 25 Nov 2025 09:17:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/26] python3-psycopg: upgrade 3.2.12 -> 3.2.13
Date: Tue, 25 Nov 2025 17:17:08 +0800
Message-ID: <20251125091714.1420-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091714.1420-1-wangmy@fujitsu.com>
References: <20251125091714.1420-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122046

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Show the host name in the error message in case of name resolution error
- Fix Cursor.copy() and AsyncCursor.copy() to hold the connection lock for the
  entire operation, preventing concurrent access issues
- Fix GSSAPI check with C extension built with libpq < v16

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.12.bb => python3-psycopg_3.2.13.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.12.bb => python3-psycopg_3.2.13.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.12.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.13.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.12.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.13.bb
index 4133a4b5b0..49030c56fd 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.12.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.13.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "85c08d6f6e2a897b16280e0ff6406bef29b1327c045db06d21f364d7cd5da90b"
+SRC_URI[sha256sum] = "309adaeda61d44556046ec9a83a93f42bbe5310120b1995f3af49ab6d9f13c1d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


