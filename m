Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC339C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:20:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.191051.1673939999389150351
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:19:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hYOeqvRO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939997; i=@fujitsu.com;
	bh=NE+3/va8A2dr5o0hUdzbM4dZk0VPhpGUc+Jnofhnct4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hYOeqvROLhsHl5O6//I867iT4QyS7+9IM7WObSgYQQZZQ2BE5m3d00jK9RBLDFcOg
	 qQngku7cCUDLfXBeX+JC4vHPwIAEPxVNdgaGWosf/T0R/Wz+G1Psv3kDr63wawCB+c
	 /9HX4K73sD1Im12u3mb5t/XbnPuAk8mx118rKZI6D9XM3M3WtrxVoGlh6T9K0UncYo
	 bfnwh+ITmZNgvDc5K3Kmm8ixkQldg5jacnNZhWKG93HzCW0Y4SE4Lwld0a0fTcaFgV
	 IAMxuGuC8ZKUcOUHxLRtNJND2DTTxpdE4Byw0aBx5rCemQnFtyirZtzg/NWNj5UONf
	 +e/BOquroDGDA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqCvrcyz
  ZoD3C4uLhpcwOjB7nNq5gDGCMYs3MS8qvSGDNaHk6g7HgGFfF/0WX2BoYL3J2MXJxCAk8YZRo
  ObaQEcK5wSQx8dtdFghnL6PEzyuXgDKcHGwCUhI37v9nA7FFBPQlls7ewwxiMwuoSLz43cMOY
  gsL+EnsfjSJCcRmEVCVWHB7AwuIzSvgJHFl5RmwORICChJTHr4H6+UUcJZ4ePs+2EwhoJp/7Y
  sZIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGuklFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjl
  pZZsYgQGb0pxctgOxt6lf/QOMUpyMCmJ8p40PZYsxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3l
  BdQTrAoNT21Ii0zBxhJMGkJDh4lEd5wS6A0b3FBYm5xZjpE6hSjopQ47zWQPgGQREZpHlwbLH
  ovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmfeIBNIUnM68EbvoroMVMQIs9So6CLC5JREh
  JNTBtquUqnPieT3aB9aX0Oeeit71IXxh3MUXF2TJ/qw5vsCa3fsDWv08Mvv9QVA7/E6Ie9zJF
  iK+73EY8o+rhKR4zIyOdtrotj1222i3Y1BZjXK+XbMGWvIVddMuZJylpt8MTD9xZv/T8Q8Vtn
  6Z4yTCtrjq3TyNnqYsp17op9YpXJbmitE9kW0gEr172Rvuqrt/RX5XTwh2nr1bTPdHs9ys18c
  SX7Jjn8WFndQ4al307+i0gv8+UO/iovsvDHxF28m2neo7KPrv+ddnOzs3Bf6YteSwnHODEdt+
  AWby00HFfQY34pySVSQ1O9gKrvtZnvA8wytp/ZV2I4VPPjKzPrUmrP+le/b+okf9M1uQoByWW
  4oxEQy3mouJEAJwEYX1ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1673939996!378173!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11393 invoked from network); 17 Jan 2023 07:19:56 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:19:56 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6FBC4100197
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:56 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6331A100194
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:19:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dateparser: upgrade 1.1.5 -> 1.1.6
Date: Tue, 17 Jan 2023 15:19:29 +0800
Message-ID: <1673939970-20246-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939970-20246-1-git-send-email-wangmy@fujitsu.com>
References: <1673939970-20246-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100612

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Fix the bug where Monday is parsed as a month (#1121)
    Prevent ReDoS in Spanish sentence splitting regex (#1084)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dateparser_1.1.5.bb => python3-dateparser_1.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.1.5.bb => python3-dateparser_1.1.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.5.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.1.5.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.1.6.bb
index d61189bfd..80869d016 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "107f3cc87a60770e10d111349adc1504224a6b60753a47a64b0ec842ab85b5a9"
+SRC_URI[sha256sum] = "e703db1815270c020552f4b3e3a981937b48b2cbcfcef5347071b74788dd9214"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.25.1


