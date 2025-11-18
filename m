Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0478CCEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8434.1763456969421001241
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QMAoqxcn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456969; x=1794992969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HChL5sJV/bik0UG5eJ0hU9QHYpdYB9mzhUX2p4rk8Mc=;
  b=QMAoqxcnyYJ5PRB53pixe0jwvENPp74zAvV9lo21Fs8agnh1mPGoJs6K
   w14jfSgydVelVOltJQz4PKPbc6UgeHfXNCZiiIeq3V6MTV+T+UOnpLJXh
   yM4CpLUdHvwganNW6SmsgZIgaWrQ9J9dxKSHTEFctwIWAkpNPw5yYPRu6
   y5mxbvBeljO0+h2WgeTmoWGnkwpuT0JewsFL15NRinvOyZgxt0c2dkIRk
   GtY9Lh4NPB8R22+7O/yo/cztVpeF9riDTtzYJ7LRbUNkk2IPVVnVYLQlq
   mjFc6eA3lDL8FOWyUMDkjeExoRvfa6kToADrpbFYhJEugv95Z10w0acXO
   Q==;
X-CSE-ConnectionGUID: grAp072lT1K5ib65WFzzyA==
X-CSE-MsgGUID: KzQv4+8lRceNDvKzRGpz2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219649506"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219649506"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:28 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E44B642A32E
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:27 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9912FC02E52
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1C35714001F2;
	Tue, 18 Nov 2025 09:09:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/29] python3-prettytable: upgrade 3.16.0 -> 3.17.0
Date: Tue, 18 Nov 2025 17:08:38 +0800
Message-ID: <20251118090846.1484-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121832

From: Wang Mingyu <wangmy@fujitsu.com>

Added
---------
Add support for Python 3.15 (and test 3.13t-3.15t)
Set dicts with column-specific config for all column-specific attrs
Add missing type annotations for properties
Use type stubs for wcwidth

Changed
-------
Drop support for Python 3.9
Simplify empty dictionary/None check
Replace pre-commit with prek

Fixed
-------
In add_rows(), check length of array with len()
Fix README for sort_key
Fix filter example

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-prettytable_3.16.0.bb => python3-prettytable_3.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.16.0.bb => python3-prettytable_3.17.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.16.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.17.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.16.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.17.0.bb
index abb13bb890..4e9b53adae 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.17.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "3c64b31719d961bf69c9a7e03d0c1e477320906a98da63952bc6698d6164ff57"
+SRC_URI[sha256sum] = "59f2590776527f3c9e8cf9fe7b66dd215837cca96a9c39567414cbc632e8ddb0"
 
 inherit pypi ptest-python-pytest python_hatchling
 
-- 
2.43.0


