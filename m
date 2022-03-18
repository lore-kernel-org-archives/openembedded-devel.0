Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FF3C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 01:32:07 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.4846.1647567126679158027
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 18:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SfgtVZHK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647567124; i=@fujitsu.com;
	bh=p5PrHIct1jGSKap2cIKYo3E+LZsYikIFfWydJT8EAfM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SfgtVZHK4Af5dGgGTaPpsLKj4aAAodLoeyJJGTKt9u44jOrrJqexD2pb8HyBmqcaN
	 MnLQyjswanOPaIrUQ5q1HvdselO8Ue4oBqnBg1iNXNlHYCee1AEiKeW1NDgB78+6xN
	 NCQ4/1onw1OFlG4CYoLqRdkoUFOguzokEvG6E/PKzpOM9Z0iu6YDWzjMVQxdLfKBQi
	 ZCovKVHN+PRNiyYF1pq2rN0k+71DXYnGf0v+O0kejzAG85UNgMqtrku8cpzqOftwGR
	 Ha+Mf+hw0SCW4rmHkvwhtkxcCxa3mQwhIIPNqb12ZSFLGkeuTYD5iUs51OdfdK2GUM
	 srCtMcHgv/sNg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8ORqCv00Dj
  JYEODmcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH1wBf2gj6uin8TlzI1MC7n7GLk4hASeMIo
  cfNuIzuEc4FJorFjPwuEc5JRYuf/C2xdjJwcbALqEo9vvmYEsUUE9CWWzt7DDGIzC6hKdF9cw
  w5iCwtESqyaO4MJxGYBih+/dpoVxOYVcJeYevITWK+EgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBoliRMrPjJB2BUSrw9fgoqrSVw9t4l5AiP/LCTts5C0L2BkWsVom1SUmZ5RkpuYmaNraGC
  ga2hoqmtmoWtkopdYpZuol1qqm5yaV1KUCJTVSywv1kstLtYrrsxNzknRy0st2cQIDM6UYheJ
  HYw3+37qHWKU5GBSEuXNu2+cJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCdytITrAoNT21Ii0zB
  xgpMGkJDh4lEd5b14DSvMUFibnFmekQqVOMilLivL+vAyUEQBIZpXlwbbDovMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmFfnHtAUnsy8Erjpr4AWMwEtbhQwAllckoiQkmpgyueqM0kpqw0
  1TSo1Vi7ckhjQVyb7ht9BX+IhQ9GP/o2XtFc3R7I5fPrRsmjD1adrfvuHMWg9NP3Wl/kk6+im
  xP+3vnms809pn+9b8sb8WtPt+hnxq0sztFzPSd6InV52o/7C8biL9X+0MgPM1F9qhU22uOhqc
  Onwsv/5OrWTzS8qvvzAvfe9wL6jD5IUTvFNnjKncIfTjmln7ysUXddflWue4arWrXHg+ZPuLx
  MiuI9Y5c6/nOhSKu3zYHu9/bqvZrLGpepHE9fa3Gr2f6xen5d9z37TMtuOyjIr38lqL0yf7s7
  jXVO7K+zkxLlzffdlhBStNQy7eTiU47zNq0/hKzb+WxVrf/3H98UGJ9LLlViKMxINtZiLihMB
  1Zzet0kDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-545.messagelabs.com!1647567122!16338!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16944 invoked from network); 18 Mar 2022 01:32:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Mar 2022 01:32:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 602401001B6
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 01:32:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4D807100191
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 01:32:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 18 Mar 2022 01:31:41 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/2] [oe] [meta-python] [PATCH] python3-paramiko: upgrade
 2.9.2 -> 2.10.2
Date: Fri, 18 Mar 2022 09:32:12 +0800
Message-ID: <1647567133-25668-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 01:32:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96054

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
Fix Python 2 compatibility breakage introduced in 2.10.1. Spotted by Christian Hammond.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-paramiko_2.9.2.bb => python3-paramiko_2.10.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.9.2.bb => python3-paramiko_2.10.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.10.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.10.2.bb
index a02a7891a7..27a4905649 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.10.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "944a9e5dbdd413ab6c7951ea46b0ab40713235a9c4c5ca81cfe45c6f14fa677b"
+SRC_URI[sha256sum] = "ff47cc35dd4c4af507d2bdc9d7def9f7fa89977212b4f926e14ac486e930f03a"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.25.1


