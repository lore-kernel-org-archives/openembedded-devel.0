Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09CCC27C43
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:48 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.12694.1716860984234472027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Mo5XKODh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860985; x=1748396985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RpZc7/rby8q8LPKyGl8C2xRdnc+4Ep5toGZR/6X3tPw=;
  b=Mo5XKODh/SDKe1MUBcLYaim5HBDicuG3LpbFiYbCvQNXnh33VsY+0DwY
   gArzg7qofgwT2UL2eujQpj62ieG92km2Dpczs+oJ7uX9fU9RD5A135cKI
   WbVqqA5GtGpEjZcjQI9azTrPbiy5po96J2FDlkg/kMTtrET6drymAkrJ4
   hZAeu7t8w12X5H5kR1J4SzUNOYCAatOnJQl0+DdBoGV+l4bAok/pogkJz
   +rG52HFkWJl52eYAHBcPXxberbYMdMzDowdhRODXsv94EMvNijvFIusXp
   qRG3O6zf57Fj8ijgaOLjXYi/M359ixxPUIMAceLvrKMNY9mENsmI3W4LK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="139925658"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="139925658"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EB650D5A48
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E1AFD5613
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C92E42007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 75EC71A000C;
	Tue, 28 May 2024 09:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/40] python3-pycurl: upgrade 7.45.2 -> 7.45.3
Date: Tue, 28 May 2024 09:48:02 +0800
Message-Id: <1716860901-863-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--2.206300-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxnyL8x0tKlOyRM
	9pS/s/NIjJWC0R+d7j46q5FCorhu8S01VXlcjcCUPKN38CLPK0G/yN2q8U674tP7VmP7Drr6Vgw
	lHd0iuHYgwXj0ZLRYK0DmMsULe3K9DvX2Sk47fs8LwUwfdPoXvkEe5VjFzwNb/gMNehoKqTvE68
	3wZxeesucX1GoDDiCw3C+gAndgRru7/XI2R8wfC3pSJjJwJFleI3CelQUbNByU8ftiyKjZrdMjj
	wb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZLGwqtA6scrnN+kHj2KKg39CGL+fkb1/3jVnb3
	r0U01hHIhVIFobEYy4cEJJ/+TRMhbxXpDt7K9k6A3r4glyYj11knsGgeXFSxLv5Eyr/YIrqsDhz
	tRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110556

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Add CURLOPT_REQUEST_TARGET option
* Add missing 2nd parameters to METH_NOARGS functions
* Add CURLOPT_AWS_SIGV4 option
* Add consistent names for newer Curl version constants
* Only run HTTP version 3 option constant test if curl supported
* Expose COMPILE_SSL_LIB in Python and use for test filtering
* Filter tests based on *compile* libcurl version not runtime version
* Use print function in callbacks documentation
* Add missing shebang to tests/ext/test-suite.sh
* Officially declare support for Python 3.12
* Fix curl_multi_info_read flow that loses messages
* Support using environment variables for setup on Windows
* Add support for Schannel SSL backend
* Skip HTTP2 tests based on a curl support check
* Fix fake-curl tests so they work when run out of tree
* xfail test_easy_pause_unpause unconditionally
* Provide generic error strings in pycurl.error objects
* Change URLs to new curl mailing list
* Add missing HTTPS proxy options
* Add support for setting CURLOPT_SSLCERT_BLOB
* Add support for setting rest of CURLOPTTYPE_BLOB fields
* Build wheels on Linux/macOS/Windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycurl_7.45.2.bb => python3-pycurl_7.45.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.45.2.bb => python3-pycurl_7.45.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb
index a6863e21f..774c1343c 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "5730590be0271364a5bddd9e245c9cc0fb710c4cbacbdd95264a3122d23224ca"
+SRC_URI[sha256sum] = "8c2471af9079ad798e1645ec0b0d3d4223db687379d17dd36a70637449f81d6b"
 
 DEPENDS = "curl"
 
-- 
2.34.1


