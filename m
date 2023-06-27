Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307C9EB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:35 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.7467.1687850065498359756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="121818345"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="121818345"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:25 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 74CE6D66A0
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:22 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1D02D3F13
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id D4D6288D20;
	Tue, 27 Jun 2023 16:14:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.25.1 -> 1.26.0
Date: Tue, 27 Jun 2023 15:12:17 +0800
Message-Id: <1687849939-19941-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--0.366800-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrjlQQ+MHi1dNrKB8Ch3Q6N4IS
	RhVH2oABzjZas1OTfE0ep5R/z/M+R5t7ZCTW/W0/upDIC9422DpS5VVMJCvrampOP5xbvk4geZ8
	+GF560TTgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJZjm/42WWfFCgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3UVrejG+BVldjwr1dTktnQDQHHKHiBg5F31s4G/KoszyQE/
	9QEfi6oaFcSLIg4Qf3/AsN4LRsgXKyh7nfIoIgKGYrIIS917YwdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103610

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Tracing without performance (#2136)
 Load tracing information from environment (#2176)
 Auto-enable HTTPX integration if HTTPX installed (#2177)
 Support for SOCKS proxies (#1050)
 Wrap parse_url calls in capture_internal_exceptions (#2162)
 Run 2.7 tests in CI again (#2181)
 Crons: Do not support sub-minute cron intervals (#2172)
 Profile: Add function name to profiler frame cache (#2164)
 Dependencies: bump checkouts/data-schemas from 0ed3357 to 7fdde87 (#2165)
 Update changelog (#2163)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.25.1.bb => python3-sentry-sdk_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.25.1.bb => python3-sentry-sdk_1.26.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
index 51f63af494..697f102a2e 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.25.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.26.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "aa796423eb6a2f4a8cd7a5b02ba6558cb10aab4ccdc0537f63a47b038c520c38"
+SRC_URI[sha256sum] = "760e4fb6d01c994110507133e08ecd4bdf4d75ee4be77f296a3579796cf73134"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


