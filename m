Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001B1FA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:40:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.7037.1667205621478288315
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Jp747P7f;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205619; i=@fujitsu.com;
	bh=nWJlzlIr8sYRb4DKZ1iLcEXfg+/Cp8a7qnjcqaehZ5Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Jp747P7fDwZnk4sLiuzmJgfEgNqjY099wbOOtZaHOfBtouGFYMLLuWblXCnUIy0Ns
	 aSECbnRtw4PxhvC2NllFM12o0RVJOTzuKl3mWEQ2i/Rb6qnnksu/P+2sU9p+S12879
	 QHwrDYud6ig+dgOrAiH8UOLwkFJgSidvnRVdf96hGWYUbsezevQUQZ9rE48+HKncHP
	 bcARBZxa6+vYu/8kURXiEeWZ2qQmNmQ7pGVFMcUqf3ATQZPbUtuc9vKmteu1GUDoMR
	 kd1MDvN0/V4m4Gl1CoOmE/x/PrM/P49KUF+lZKrOraAk5U7y3mTUQ2rhIrheB/EgCN
	 H74IgSiyscdkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWfdTZ3y
  ywf5PNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8byn0tYCmZxVvScVm1g3MLRxcjFISTwkFGi
  +9UXli5GTiDnCpPE5w2OEIk9jBLv559iAkmwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPe
  xcjB4ewgKPE5pfxIGEWAVWJx8sfM4LYvEDhL+2TwMolBBQkpjx8D2ZzCjhJLNo1hwlir6PEk3
  fX2CHqBSVOznzCAjFeQuLgixdQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFacWlaUW6ZroJRVlpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To
  5aWWbGIEBm5KcZLNDsa/S//oHWKU5GBSEuV91xKfLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCl
  7EdKCdYlJqeWpGWmQOMIpi0BAePkghvbytQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4r
  zdHUBFAiBFGaV5cCNgEX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvVpBLeDLzSuA2vQI
  6ggnoCLb2OJAjShIRUlINTIGJu3jMM3x2yKgbs/8KDyq/cCt71gmlt6apO/oW682b9bnrRr9H
  Dkvy/DXPd1bv7+dn6lg2V1WwncVlwcXpp8RqbaWll91n55Z55u1y8cKKJJtJfO6L/50+uS44f
  pq9SvZjw3NRd64GZHa5v2Thflz4wGqDlcTs5gedCnKPOAr918yc23jJ6tZ6QcFpXo+Oejf96v
  JyPdx58sw0YT6F5j1HtC1DxUpLP2vtWh1h/mZjyzrFG90b37+NSjq+mVUoTXrplr2dl2qUjif
  qzFXenGu1Y8IjmbMujembbt6dssi1OdiMYaccU1/klK287Dd49695dCeoU+Jtw1/DUHY+m4Vf
  gyL3v89+X3lp9gbbZ0osxRmJhlrMRcWJADooFx5jAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1667205618!796344!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1802 invoked from network); 31 Oct 2022 08:40:18 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:40:18 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 796A2155
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6CAEC151
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:40:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] function2: upgrade 4.2.1 -> 4.2.2
Date: Mon, 31 Oct 2022 16:39:45 +0800
Message-ID: <1667205585-3786-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667205585-3786-1-git-send-email-wangmy@fujitsu.com>
References: <1667205585-3786-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99369

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../function2/{function2_4.2.1.bb => function2_4.2.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/function2/{function2_4.2.1.bb => function2_4.2.2.bb} (92%)

diff --git a/meta-oe/recipes-support/function2/function2_4.2.1.bb b/meta-oe/recipes-support/function2/function2_4.2.2.bb
similarity index 92%
rename from meta-oe/recipes-support/function2/function2_4.2.1.bb
rename to meta-oe/recipes-support/function2/function2_4.2.2.bb
index 8e3718102e..31cd077d91 100644
--- a/meta-oe/recipes-support/function2/function2_4.2.1.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Provides improved implementations of std::function."
 HOMEPAGE = "https://naios.github.io/function2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-SRCREV = "f569a63cfe369df867a1a4d17aaa12269156536c"
+SRCREV = "2d3a878ef19dd5d2fb188898513610fac0a48621"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https"
-- 
2.25.1


