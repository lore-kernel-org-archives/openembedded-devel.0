Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.6665.1628157050362726748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 02:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vdSHcQcz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628157048; i=@fujitsu.com;
	bh=CME2rAj2K+J4IzOgQZEd5YSogjjWMzuWMYpz5HEyrpU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vdSHcQczUjZyriz+c38gjsIHHVPNwYDkUTCp63YBHyNfsH0FiFiCuEP4MYscQTFaV
	 iCi1Eeox+zVF74Sbr15mVwfMucUapLMWyMQ3Sq5QZdcRX3wPjf1kz3uIkE3bgrT890
	 GeHnY+9iG9ejyLNwf8xMM05ceYdRE5ZtMdMPrXg8UZvnwGh8TxQCawxHLFI+jEBG+7
	 EnK6YnCukUI7lrMXME3+zEIkb6bMD0RytZkd2UTDbcAV1XNWUe08bCMZqUGIxD0eAA
	 hrdUc3QRghjn0OQEAjbMaGJxmVEqxLDn3THWV1imYbez+rRZ/uiBPc4ECqo1Mx0UGU
	 p4Vzv9eNNx68Q==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id E3/2A-07274-874BB016; Thu, 05 Aug 2021 09:50:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1a3Ywp1
  o0PdFyOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzej4soitYA9nxdP1GxgbGB9ydDFycQgJzGKS
  WPrpGWsXIyeQc5xR4s4dCxCbTUBHouNFNwuILSKgL7F09h5mEFtYwE/i2rsJTCA2i4CKxMlj0
  9lBbF4BN4kVu5aC2RICChJTHr5nhogLSpyc+QRsDrOAhMTBFy+YIWoUJbbvPMMCYVdIvD58iX
  kCI88sJC2zkLQsYGRaxWiRVJSZnlGSm5iZo2toYKBraGika2gJxMameolVuol6qaW65anFJbq
  GeonlxXrFlbnJOSl6eaklmxiBYZRScKB9B+Oj1x/0DjFKcjApifLq93InCvEl5adUZiQWZ8QX
  leakFh9ilOHgUJLgVdkMlBMsSk1PrUjLzAGGNExagoNHSYR38SagNG9xQWJucWY6ROoUo6KUO
  G8rSEIAJJFRmgfXBoujS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeQtBpvBk5pXATX8FtJ
  gJaPGFWE6QxSWJCCmpBib3eTfi5qd9PFjaMMF0aQG3228Doz/i5T65HYe/GboF2s79OKPrY8J
  a9aatfM1pe9R/aqc91wr5/lrH6+ad/odCSy5pHb/x2GaHD9/yfYnRWza+WvrHrH9LnfpjHwme
  Yla25+7pyjLLhMPfrpM9W5D2ZrrcW9klxRNdm/epy9+ZzSj2LHZxV1ij4Oy8yPxHhaLlph/eF
  hg6d7TMONU1p8YwQ1q0XOTCi16+CZUs51X2X7PJOrzlGnPkykNtFx9d/HrZSfVPexk7zxlhzQ
  mzT3lv4vx1pS8loOzxr8qTy5xmuJvu3C7KxyY8y+39Z5fGOj8t8W23Vk2NZZHR6FYyjyuI4pn
  W8P+LYtJShvmJP5VYijMSDbWYi4oTAcNzJNAeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-271.messagelabs.com!1628157047!9588!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9726 invoked from network); 5 Aug 2021 09:50:48 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-12.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 09:50:48 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1759olPT007190
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 10:50:47 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 10:50:45 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.3.0 -> 1.3.1
Date: Fri, 6 Aug 2021 05:50:39 +0800
Message-ID: <1628200239-4559-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Fix detection of contextvars compatibility with Gevent versions >=20.9.0 #1157

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...{python3-sentry-sdk_1.3.0.bb => python3-sentry-sdk_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.3.0.bb => python3-sentry-sdk_1.3.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.1.bb
index f3f2e1d1be..a7810ff0c9 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS:${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "5210a712dd57d88d225c1fc3fe3a3626fee493637bcd54e204826cf04b8d769c"
+SRC_URI[sha256sum] = "ebe99144fa9618d4b0e7617e7929b75acd905d258c3c779edcd34c0adfffe26c"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1

