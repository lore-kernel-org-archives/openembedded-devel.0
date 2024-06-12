Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32DDC2BA2B
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2432.1718161119922720466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=meWPmply;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161124; x=1749697124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aL71RqazmRf1IkS9e8vWHQ7pBUPSIr0aJDdwk0MZEjw=;
  b=meWPmplyEXm92RgyEDDEHso/jziFymmEYhCh3z8Hsi5QKt8l6Asje9zp
   qCW4QWgvXHmRq9BRn3wH5e2Qz7P8ndQdH3mkYEbpczTOyNYlcfOmm+1on
   g3J851Ti00XORpv0ShxhbmmPzKJoeUWHpkZelBXxZgHlgTMgSw042CE8G
   RLNPrdrF+WLASRKOQqbQYCbzmeFJ+yz/5agK3izPOZeeT8ifPChvutaE2
   Z/yT6BiUmnFKneUteqgrUym0m6kUnMO/YOg6GSHBMI4V4tLEVgc2lfN+k
   YChfSkmkd0i4A3zF7FLgKy6PPUOdAKzQgCIZ4oiOokGeHapLddboMaU+j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="150756313"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="150756313"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:42 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE3EED7AD6
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 28F89BDC95
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B895DE290B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 652871A0002;
	Wed, 12 Jun 2024 10:58:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/43] python3-openpyxl: upgrade 3.1.2 -> 3.1.3
Date: Wed, 12 Jun 2024 10:57:50 +0800
Message-Id: <1718161096-29710-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--0.869600-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrZdOg+SGzWLb+RaR64jcCBU9c
	5L7XedS4coRG7KG/Cmt12N+IPsNCGRs7n0Ur0F2Y1l+BjLM8lsoJlr1xKkE5uR/IyQ3t7z0DCMc
	v2jG+74Qzlb1THdaeoC0ZvJVnYPOtEnwQg0CZxZtIcJTn2HkqsVQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaLnrSohRETsvTsKXyzHgcEbfS0Ip2eEHnwj/1Rbkzl1EymDn
	I5x2hWCjoczmuoPCq2sUQNgZ/HxxHLC70auYlTIge56iyZ6g/+uRfkyekw2FVX6lCtXC21RD1xx
	15bWetHWGVFUX3lX584ovsgeUOVm7OuW/y0zdOodJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110852

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Column name caches are slow and use a lot of memory
- Improved handling of duplicate named styles
- Rich-text can be saved if lxml is not installed
- Documentation for sheet views is incorrect
- Timedeltas not read properly in read-only mode
- List of formulae names contains mistakes
- Filters does not handle non-numerical filters
- Type checking increases exponentially
- Loading pivot tables can be unnecessarily slow
- Improve performance when reading files with lots of custom properties
- Setting Trendline.name attribute raises exception when saving
- Timezone and Zombie formatting cannot be combined.
- Column name generation is inefficient and slow
- File handlers not always released in read-only mode
- Workbook files not properly closed on Python >= 3.11.8 and Windows
- Pivot cache definitions using tupleCache had serialisation issues
- Add a __repr__ method for Row and Column dimension objects so you don't need to check every time.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-openpyxl_3.1.2.bb => python3-openpyxl_3.1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.1.2.bb => python3-openpyxl_3.1.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.1.3.bb
index 4a3254cc5..934bf319b 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a6f5977418eff3b2d5500d54d9db50c8277a368436f4e4f8ddb1be3422870184"
+SRC_URI[sha256sum] = "8dd482e5350125b2388070bb2477927be2e8ebc27df61178709bc8c8751da2f9"
 
 RDEPENDS:${PN} += "\
 	python3-compression \
-- 
2.34.1


