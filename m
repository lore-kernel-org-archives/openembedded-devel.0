Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACED2EDE9A3
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.18336.1725959012835706305
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nTd/LgNp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959012; x=1757495012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EVhHneWr7bs9IENum00MC+iq4TyzGHTCTxjFHmyrn9A=;
  b=nTd/LgNpCLF0/qVSBSeGFPyHxNq1+K5gLvruxloRuAfLzg7tumq4de7q
   bZ+CDWiio+d5H6SQXew8QlljosOX5xOHYD02JkL7if4wQu/Mfvf8Iu76F
   j7opbBOmuw88mXixsSGmYeB6C78lmuRIsEuFczE3RoQEM8YoG4Zb41y8w
   XkHe24cENppZD8BH4+Wryr9gbtpX+4SMNnNComQtGjoHxwi/OhvctsviI
   88UcbRd2YrfXWu0qoVER9jmJQ/NHHRCXPwXRcfBOO8Cz5h6HGA5HkLRUY
   DS6fwHq0IoWbTYLZ1GSAL2PsOEuUE5akXBXe+vZCWH3h8qZwrTX/23mWl
   Q==;
X-CSE-ConnectionGUID: AuVV1ahSSGiyj4yicAH2hA==
X-CSE-MsgGUID: asXKR8dJQC2X/rn1VWEAVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173393773"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173393773"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A8B416B900
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DF719D3F0F
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68170200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1BC871A01E9;
	Tue, 10 Sep 2024 17:03:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/42] python3-parse-type: upgrade 0.6.2 -> 0.6.3
Date: Tue, 10 Sep 2024 17:02:51 +0800
Message-Id: <1725958990-5719-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--3.035100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrMoS2PLq1B75M+b8yxBqvAz9w
	6ansMmYs1joxU3t+0uRbfyRJXs6anwWR61Hf0UjEqhcdnP91eXFUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw65x7uAXGEprfOd2ImQcUyEW1EpqtJXzRujxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipctsKZH+lkYX8gCiK22OEA9pR7gJug5BK0y4LG
	5+VGf8IDzeeAXKfVhelpC5XxRtt1Glaz8/jhPLyoGpwtvYwVORo5N95uUyEdP6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112209

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- UPDATE: parse_type/parse.py
- Copy structured test suite to "tests/parse_tests/"
- Copy structured test suite to "tests/parse_tests_with_parse_type"
- REMOVE: tests/test_parse.py
- README: Fix compact display of BADGES (was using multi-line)
- CI: Add support for Python 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-parse-type_0.6.2.bb => python3-parse-type_0.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse-type_0.6.2.bb => python3-parse-type_0.6.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
rename to meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
index 4c5efa185..db9d52cdc 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jenisys/parse_type"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2e469278ace89c246d52505acc39c3da"
 
-SRC_URI[sha256sum] = "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef876aa48d75a73a355"
+SRC_URI[sha256sum] = "8e99d2f52fab2f0f1f3d68ba9d026060140bf0e53680aada0111fb27b2f0e93a"
 SRC_URI += " \
     file://run-ptest \
 "
-- 
2.34.1


