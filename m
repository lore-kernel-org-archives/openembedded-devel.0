Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C28C5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:53 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3344.1787132204597593426
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uM74mOPL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132208; x=1818668208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FvrpVJ1TSPq+1tbJQE98L3UErjojdplvSAITJ4aIqQY=;
  b=uM74mOPLI7qKefH88ytiQNE/uwhmoNgyptVAyXd/gehqDeAompeJh87H
   ghhziLGw2w43+8FTWHSCIO0xcvmQsZvRZrhR7aCXjCLpBuTStu+rRw3QM
   ZmEUnu1nvui0BgSkRRQe9jg70tKm10GC1Ko7ahbNBVViOc1JnR58vDNX+
   nwLz98fXQ39fvXVjIt0FjczROpSlal5cVl2rd8KHQtsHsCj7Sd1CfI9VI
   +gyjtIN3wsLIoWEcrIDDa30LZiLeN/v5x3dKuvqkj0j25jj9BYShb8NDF
   WRPnVfN/JV/5FG4JCJUBwih23RrN69cQ0VDQfEnDa0ZKdlsBpr6NSJpwM
   Q==;
X-CSE-ConnectionGUID: 2AZ2ZgdOTs+t70nDlTOmGw==
X-CSE-MsgGUID: 0JawUC6MQI2FfbcohPoZnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="230759492"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="230759492"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:46 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F302A406EF6
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:42 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A98D410003A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A56E91801C0F;
	Wed, 19 Aug 2026 09:36:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/70] python3-pybase64: upgrade 1.4.3 -> 1.5.0
Date: Wed, 19 Aug 2026 17:34:51 +0800
Message-ID: <20260819093514.1101-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129317

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Changelog:
===========
- Speed-up translation on aarch64
- Fix invalid data successfully decoded when using altchars (slice ends with padding)
- Fix thread safety selecting codec
- Add padded and wrapcol parameters to b64encode
- Add padded parameter to urlsafe_b64encode
- Add padded parameter to b64decode & urlsafe_b64decode
- urlsafe_b64decode now defaults to padded=False to align with Python 3.15 behavior
- Add ignorechars and canonical parameters to b64decode
- Handle excess padding with the same behavior as CPython 3.15
- Reject non-ASCII strings in b64decode when validate=False
- Deprecate accepting the + and / characters with an alternative alphabet when decoding
- Use ValueError instead of AssertionError on altchars length validation
- Add SBOM to PyPI wheels
- Publish python 3.15 wheels
- Drop python 3.8 support
- Stop publishing python 3.13t wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pybase64_1.4.3.bb => python3-pybase64_1.5.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybase64_1.4.3.bb => python3-pybase64_1.5.0.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-pybase64_1.4.3.bb b/meta-python/recipes-devtools/python/python3-pybase64_1.5.0.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-pybase64_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-pybase64_1.5.0.bb
index e4a90c3f7d..a07c5042d5 100644
--- a/meta-python/recipes-devtools/python/python3-pybase64_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pybase64_1.5.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Fast Base64 encoding/decoding in Python"
 HOMEPAGE = "https://github.com/mayeut/pybase64"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=84b11fa55a5d83cf6fa202fd3b49c7e8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5042ea9bdb8e0560ebab12bceefcd3f7"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "c2ed274c9e0ba9c8f9c4083cfe265e66dd679126cd9c2027965d807352f3f053"
+SRC_URI[sha256sum] = "545ab2a433769e3b8e1ce2b4f7b07218bbde202f4954fbfe52948b2522120727"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


