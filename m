Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFCBC7EE43
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.3859.1686620461720052009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="99729202"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="99729202"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:41:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 58632C6811
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 91567D5EB6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C53920074732;
	Tue, 13 Jun 2023 10:40:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.25.0 -> 1.25.1
Date: Tue, 13 Jun 2023 09:40:18 +0800
Message-Id: <1686620422-29962-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--4.454900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyszp4g55fnQWEKo
	/65yrX6p/DW1GvHktOho8g39smD+7nLFfK847zVizLo88rvlvYFULRRq00o2mUYx760ONDcWMKV
	o3BM1rsxKQo2k8AdJy1UXnW/Ett9Z7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AE59
	pk4kcc5bF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKly9JRveEdOmA/fF3hlyPmLzCyFK
	4T0iLf+TY/U4qYqTVeIxxANopPqWzQYmGsrkWqecugYgJnSWC4PvmyopluXvA6xPOuymZ4e/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103248

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Fix parse_url (#2161)
    Better version parsing in integrations (#2152)
    Align HTTP status code as span data field http.response.status_code (#2113)
    Do not encode cached value to determine size (#2143)
    Fix using unittest.mock whenever available (#1926)
    Fix 2.7 common tests (#2145)
    Bump actions/stale from 6 to 8 (#1978)
    Bump black from 22.12.0 to 23.3.0 (#1984)
    Bump mypy from 1.2.0 to 1.3.0 (#2110)
    Bump sphinx from 5.3.0 to 7.0.1 (#2112)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.25.0.bb => python3-sentry-sdk_1.25.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.25.0.bb => python3-sentry-sdk_1.25.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.1.bb
index 10e77ae60..51f63af49 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "5be3296fc574fa8a4d9b213b4dcf8c8d0246c08f8bd78315c6286f386c37555a"
+SRC_URI[sha256sum] = "aa796423eb6a2f4a8cd7a5b02ba6558cb10aab4ccdc0537f63a47b038c520c38"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


