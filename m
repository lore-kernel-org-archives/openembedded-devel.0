Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1152D3B7FC
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:40 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4199.1765274193324067662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GZR1J2x6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274198; x=1796810198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aJmKgpItvsZZQ0KCjRPm/4uFqBsv+z4xwH6vlieaA0M=;
  b=GZR1J2x6j5sqHrR8sHyq+WcZKzOoQAYNN9bvqueF0/1tXWyg21dxA10C
   R5Vc7/SKZJCD7bv8ou5IJca22rUt8jCS7AL3Hz0Adoxn3rbXkkSShy5yl
   epjD8TpVPIgaR9WDVIPcijyK711+jCgfw+1YVJdfcY0R/lsFeaEn/+WBN
   6/w3X8NfFNXqFjkD1SQEnm/V1p/3uFwAmwRUk6823fzDv75d6oD5YBh+6
   qQPm+wTV5EBQ2tC7s8QtvP7Xxx1PATHsCKC5TVD4YUpptuBuQaPkvAw43
   CFJOJYsRvEnzFDwyF+RacLDdFHDm4k2n/cuRBdldlir1U7qTWWzRjJyhE
   A==;
X-CSE-ConnectionGUID: 7mRX+WxoRQqPf55AHRcQ5w==
X-CSE-MsgGUID: mTRligfSQHivU3K0HoP9bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="222613686"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="222613686"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:38 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5173CC0182C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:38 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0AC191401216
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 9120B20002BB;
	Tue,  9 Dec 2025 09:56:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/38] python3-aiodns: upgrade 3.5.0 -> 3.6.0
Date: Tue,  9 Dec 2025 17:55:30 +0800
Message-ID: <20251209095552.690-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122420

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix resolver garbage collection during pending queries (#211)
  - Prevents resolver from being garbage collected while queries are in progress
- Socket callback optimizations (#172)
  - Improved performance for socket state handling
- Fixed RTD links (#176)
- Added Python 3.14 to the CI (#212)
- Updated dependencies- Fix resolver garbage collection during pending queries (#211)
  - Prevents resolver from being garbage collected while queries are in progress
- Socket callback optimizations (#172)
  - Improved performance for socket state handling
- Fixed RTD links (#176)
- Added Python 3.14 to the CI (#212)
- Updated dependencies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiodns_3.5.0.bb => python3-aiodns_3.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiodns_3.5.0.bb => python3-aiodns_3.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.5.0.bb b/meta-python/recipes-devtools/python/python3-aiodns_3.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-aiodns_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-aiodns_3.6.0.bb
index a714e3ad1a..eb207aa31f 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_3.6.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/saghul/aiodns"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d574ab425d1fcb37c9f1ad3961f18527"
 
-SRC_URI[sha256sum] = "11264edbab51896ecf546c18eb0dd56dff0428c6aa6d2cd87e643e07300eb310"
+SRC_URI[sha256sum] = "9b0ef54339e6687cdbd39a7d73d7de2467cb5c115281da28f2598f058633dac8"
 
 PYPI_PACKAGE = "aiodns"
 
-- 
2.43.0


