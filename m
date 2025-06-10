Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447FCC71134
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.78439.1749526433911033951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nsJ6pl0/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526440; x=1781062440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GT6zuiFuK0ubpxbSMWnFeO6WPqokp3/aBoOMgNn7PVM=;
  b=nsJ6pl0/+30LVTTLfoqkH+QqF+1MqaR5QXLxHH2K9DEvX0LXer6k7Ult
   kf0mwlumt4gynEOgZs3fm6QozpL4nvj3ypXH2GQ59us8JF0EXh93n47nG
   BJcmMzk6+6V6HggCTFsmYYFueUOkV6E+ShkNcb3PM5FZL2nV0G5+2qUz1
   VKNx3JAqBq6Qim8HJ6vPEXlWetFmUWpFq2ubuNuS9Ji1YkF0n8UXRfX7u
   kI+Tq0GiboDsNldEnPGw4HJcZsG4w5kWbhWyaUYsvn2p06Aw/CWv7TaVS
   iOrMvxmcju6sf0EeEpJGuD3j8jT9/wOV6gVhTzuTNsEUV21ijT+/OFit0
   w==;
X-CSE-ConnectionGUID: 7CDw1Qu+S+iuSIi4lsylfQ==
X-CSE-MsgGUID: 98OncKm9Qpq+OeJebFHP6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202196209"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202196209"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2728ED5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C3693D506E
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:55 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 045C21A0071;
	Tue, 10 Jun 2025 11:33:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 57/64] python3-xmlschema: upgrade 4.0.1 -> 4.1.0
Date: Tue, 10 Jun 2025 11:33:23 +0800
Message-ID: <20250610033330.924-57-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117848

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add XPath selectors: ElementSelector and ElementPathSelectors
- Add selector argument to XMLResource and iterparse filters
- Fix element substitution
- Restore v3.4.5 builder methods as helpers
- Add overall_min_occurs and overall_max_occurs helpers to XsdElement
- Extend error message for XML syntax errors
- Fix query/fragment like for filenames

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_4.0.1.bb => python3-xmlschema_4.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_4.0.1.bb => python3-xmlschema_4.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_4.0.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_4.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_4.1.0.bb
index ed759ab532..abdbf828c2 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "9a8598daa2e2859c499f6f08242f7547804ae0c2d037971c44bcb9aae154ff22"
+SRC_URI[sha256sum] = "88ac771cf94d5fc6bbd1a763db8c157f3d683ad23120b0d0b8c46fe4537f2adf"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


