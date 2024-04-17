Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FFBC04FF8
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2759.1713318098760736329
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bSOUbsfR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318100; x=1744854100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pea+VxtzOamN4qs4TFMszyHoS0oNzweL7ulM4QJ6TJc=;
  b=bSOUbsfRGTVcWdU8/P/gfMUAZ74wFzwXB7mHLgtBJKwZCTsc0lwPIV24
   8gFswwGImJ3zEgZDJ/P04YhgAb5lcV2C1dq6UZ2ZETUUWvLlOs5SkfHB2
   Y0B8kHXStWMURW8adbn8eVHhDd7jyUqjwdYGLPCdhoIiMDCTghihLZKXZ
   O8sBsax1RjrbxfWy/oxThKyoq3KyMROmd58T+m4M521R+5U+4xHPiLuDo
   0vPfpVjY4fhvNulJn/DUVGp5xZjCIXRa3o1ymyIOhpeHNb7/9l9ScDgnv
   C3cTDhd7oe9MYnQoUqY0rZ96fT+mW/v3FvMe/X6oK7hwWAExAsPm0ZIzx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="134609870"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="134609870"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 62A3DD4800
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D93EFD90A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C90E6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD69E1A0002;
	Wed, 17 Apr 2024 09:41:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/49] python3-pymodbus: upgrade 3.6.6 -> 3.6.7
Date: Wed, 17 Apr 2024 09:40:45 +0800
Message-Id: <1713318061-17128-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--6.783300-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyrNVSgF5+L4Qla
	FzN4biir7Sh5cFoT8p1f3S97XDkLiq+CQswOit7PzmwpmAFt7kU1kR+05VC1hrqln+jYe7ZhXVJ
	6loCpH40ZW0CB9APUihs/R4RL90yUxEEtnnH5KRc/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bq8FBzdsKASwepi+JVYshcp4HMSQIKmdGd0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTt+Tf0tcxKuLprZ8vij9riryIqzQHWo/wPo/z+JOolBB+kSOrKahX/SA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110018

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add lock to async requests, correct logging and length calc.
-test_simulator: use unused_tcp_port fixture
-streamline imports in Factory.py
-Secure testing is done with pymodbus in PR.
-Fix link to github in README
-Wildcard exception catch from pyserial.
-Problem with stale CI.
-Add connection exception to list of exceptions catpured in retries
-Move on_reconnect to client level
-Bump github stale.
-update package_test_tool (add 4 test scenarios)
-Bump dependencies.
-Cancel send if no connection.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.6.6.bb => python3-pymodbus_3.6.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.6.6.bb => python3-pymodbus_3.6.7.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.6.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.7.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.6.6.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.6.7.bb
index 8e181640b..323377253 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "c4d556a0954d00a9e1c8f1d0de03f41c4800336e6d785e820f2917eeb4ee7736"
+SRC_URI[sha256sum] = "e6cefac57f8d0e887ef49a705743787d8f1f005df94bd148e3da43c2599c77f3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


