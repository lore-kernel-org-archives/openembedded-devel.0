Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08404C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 09:54:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.6760.1641462896145140708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 01:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hT9fF13P;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641462893; i=@fujitsu.com;
	bh=cRfFuDVIgZtUBwCE6Bh6yTWg7OQn9CaPkX6fn+c55Ng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hT9fF13Pnw/qJD7DWuyL7nnaeL0V16kn0A1b0CXUFoqiZ2C/ZiKT+Bp/A/Gu2TrIP
	 JbqqgR7oiudeomxtuYDj58a5YBXRiWsUDt3DHPqI/T/ZcR5qE5ZVdayMPnOGdCF5G+
	 ygqrIR05TQiZ5ugIbITXHJh6aeezehB8c9Q/Tqe+8mugwvMVGDzmqCUMZhfCuCLEYm
	 ngbIBVUAeVrOAlLTbHvR+izmr3qu2piW5rnzWJD6iVwaUVXfERelaC/2vslnH+XnFe
	 KFkKUYmenYc5r4FMRtqzAfTbLeUsFza1L1w/aoPbvehQzmE9z7C0PHDYBVMM3SO/vQ
	 YjoFgF+3LeMHw==
Received: from [100.115.32.243] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 37/E8-28974-D6CB6D16;
 Thu, 06 Jan 2022 09:54:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MRovt597V
  EgyezOSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyz886xF0zmrNh2ZwFrA+Mmji5GLg4hgRlM
  EhOnP2HsYuQEck4wSmybawpiswmoSzy++RosLiKgL7F09h5mEJtZQFWi++IadhBbWMBToqV9H
  licRUBF4vOH92wgNq+Au8S1k1+ZQGwJAQWJKQ/fg9VwCnhI9Pe3sULscpc4Of0jK0S9oMTJmU
  9YIOZLSBx88YIZoldJ4sSKj1BzKiReH77EPIGRfxaSlllIWhYwMq1itE4qykzPKMlNzMzRNTQ
  w0DU0NNU1NtU1tDDRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMqUYuUd
  OxjbVv3UO8QoycGkJMrbpXUtUYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb90OoJxgUWp6akVaZ
  g4wQmDSEhw8SiK8vzYCpXmLCxJzizPTIVKnGBWlxHn7QfoEQBIZpXlwbbCovMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmHcWyBSezLwSuOmvgBYzAS0+J3cZZHFJIkJKqoEpxkdz+iXmmR7
  znp5ef9lRbEtyQaSEx5zOLX6lXZd3m8t7Jp19kdVW+D3BuOnOGVbhUyVMnpt7p22qXC18+ukG
  UYYpRhu+zwh3nz7xudCEiymTAzXN1+w+5WUc4urVpLJYbp8da/COJKbUB+seN02x1svPaChr0
  FPp5f39/GHpgZfiSw9OXbSV/Zgv09J7k2RnJYX8cLGLv+n4kfON3/0ZD3y9DBd38JjVe0zkmv
  dsl4LHRosVnutvz325vuX2Yq7pxr8zrhgEMs9pmPvu9+17Nt+bTq3n8TtseObI7+DD+/eflDJ
  Zav1PeEdbybW1fEHykWs3SWzLeFiuy6sXenLX9G4HuRn8e3j2LMv+XyN4X4mlOCPRUIu5qDgR
  AN+bbeBFAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1641462770!109167!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20071 invoked from network); 6 Jan 2022 09:52:51 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jan 2022 09:52:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2069qjUc026360
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Jan 2022 09:52:50 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 6 Jan 2022 09:52:43 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-parso: upgrade 0.8.2 -> 0.8.3
Date: Thu, 6 Jan 2022 17:52:25 +0800
Message-ID: <1641462745-19071-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641462745-19071-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1641462745-19071-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jan 2022 09:54:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94669

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
Add basic support for Python 3.11 and 3.12

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-parso_0.8.2.bb => python3-parso_0.8.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.8.2.bb => python3-parso_0.8.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
index 950e82d1e9..e14f28ad03 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
 PYPI_PACKAGE = "parso"
 
-SRC_URI[sha256sum] = "12b83492c6239ce32ff5eed6d3639d6a536170723c6f3f1506869f1ace413398"
+SRC_URI[sha256sum] = "8c07be290bb59f03588915921e29e8a50002acaf2cdc5fa0e0114f91709fafa0"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


