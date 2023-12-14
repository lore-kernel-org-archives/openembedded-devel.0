Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E3EC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:04:46 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.17923.1702544678210307969
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="144922677"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="144922677"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 18:04:36 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C0F99D6187
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:04:33 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F4076D2BA7
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:04:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE87D883E1;
	Thu, 14 Dec 2023 18:04:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-asyncio: upgrade 0.22.0 -> 0.23.2
Date: Thu, 14 Dec 2023 17:04:19 +0800
Message-Id: <1702544659-28375-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10--4.339800-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrG24YVeuZGmP+Aw16GgqpO2f0
	psGams1svG2nbFCBoOJ4jlsQMzBA0vYpLfQXSTTJ8KdIN9q4LF/865QlVwxmG69jXNy2Un1MntU
	3Lv5Rb/34G0Niaio+lsEg6YWqBQi0jaZpiigzMUSqh5pv1eDPz1raggjkdwXwlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDdfeP+V/VXwsn1jLnFWLDii5BWXfK+lF6AanR
	UYx3SG4WyXEB937q1d5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFMPh+ONrrgvDX7YU
	/wePe8j6sijGIwGwXex4BeRDZ0GpHaRSUXe6iJ7DK07NZ4hXXm7Nxc/HKp09CJ41yzcizqAwshM
	IujfdRux9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107446

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fixes a bug that caused an internal pytest error when collecting .txt files
-Fixes a bug that caused an internal pytest error when using module-level skips
-This release is backwards-compatible with v0.21. Changes are non-breaking,
 unless you upgrade from v0.22.
-BREAKING: The asyncio_event_loop mark has been removed. Event loops with class,
 module, package, and session scopes can be requested via the scope keyword
 argument to the _asyncio_ mark.
-Introduces the event_loop_policy fixture which allows testing with non-default
 or multiple event loops
-Introduces pytest_asyncio.is_async_test which returns whether a test item is
 managed by pytest-asyncio
-Removes and pytest-trio, mypy, and flaky from the test dependencies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-asyncio_0.22.0.bb => python3-pytest-asyncio_0.23.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.22.0.bb => python3-pytest-asyncio_0.23.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.22.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.22.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.2.bb
index 8fa77ac05..a00778c99 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python,
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "01da1bf94ff0b969cc8d760104f7c1011903d0d658bdaef0bbae769660a7fbc4"
+SRC_URI[sha256sum] = "c16052382554c7b22d48782ab3438d5b10f8cf7a4bdcae7f0f67f097d95beecc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


