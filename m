Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F646C021AB
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.46464.1739178120388111908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mXrnv1Hm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178121; x=1770714121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6JneiVTXSh+sxFueWPcPaGJq4z5WEtEFDMPvS3ljy70=;
  b=mXrnv1HmJ6rYVNgSlAJMkK1MP/XO3Gr7UEWBe74Ej8uT+KljQ7uRcUDJ
   q4inNumOCyUrMQwJAca5LHroPk9k22DhcBK+/GFRx/fQH9qO7ZnmGCETE
   TppSByd3Izbok8nXoxbktoqz06lgxsWVCpEE7twAFQzysK19VsNoERIwS
   b+mQgSOCaAhVFLY4ij5jUpNrR33iw9f1DMszESvzmcRF0HLS1qMUDpRng
   uFgPz1MpydVGwidI2lCXLLjAmnjRfHVheKs+8TQdaM0CXgaGrIvbCbvp4
   uK5R01CwLdlLxtJHrnd8llHT1DB+nzFfcPkAH8YieRYxRcmtKf8Cpio8T
   Q==;
X-CSE-ConnectionGUID: eDtwbDJlTrSMntzXCsSmVg==
X-CSE-MsgGUID: HfY5dyF7TuiCZSmcqnDgYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="188641297"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="188641297"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BEB6BE8525
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8730315569
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B1321A000B;
	Mon, 10 Feb 2025 17:01:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/66] python3-dateparser: upgrade 1.2.0 -> 1.2.1
Date: Mon, 10 Feb 2025 17:00:59 +0800
Message-Id: <1739178095-26432-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115360

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix PytzUsageWarning
- Fix date_parser with prefer_month_of_year wrong results
- Fix skipped day when UTC and tz are different days
- Avoid repeated loop over timezones
- Proofread README.rst
- Check for derived types for configuration
- Parse some abbreviated strings as relative dates
- Migrate from hijri-converter to hijridate
- Fixed ClusterFuzz build error by adding dateparser.data as a binary
- Fix an issue detected by OSSFuzz
- Support two-digit years in non-Gregorian calendars
- Refactored CI to run extras separately and test minimum versions of dependencies, replaced flake8 with ruff, fixed tests
- Set minimum versions for dependencies
- Limited numpy to 1.x when installing dateparser[fasttext]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dateparser_1.2.0.bb => python3-dateparser_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.2.0.bb => python3-dateparser_1.2.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.2.0.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.2.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.2.1.bb
index a08564b3f5..d3541c89c7 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "7975b43a4222283e0ae15be7b4999d08c9a70e2d378ac87385b1ccf2cffbbb30"
+SRC_URI[sha256sum] = "7e4919aeb48481dbfc01ac9683c8e20bfe95bb715a38c1e9f6af889f4f30ccc3"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.43.0


