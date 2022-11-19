Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B36C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:53:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.15891.1668844415740175364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qa/pR390;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668844413; i=@fujitsu.com;
	bh=G4e8j8wD4usd80w5KwwbsZs7jzBtaq4gGFyYFx6IRbM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qa/pR390udNEoVhjAUbpFS81cofezW7BSV+PFjLohqZ10QhfpImod38wmRgAzLUCg
	 Sbh++0JPDR+MuObAYIsDmV5drreGNQnwdLh5vF7R1pPqaini1CZ2+d7luhopAmz8dl
	 Z66jziwc6NOfoQl9BPeIyd0SHGXLg7LsIYiYkY5anU/2LCRaWaO5MgyNmddtvChE4s
	 528362SM09N791iCVeD4477qf5/fXRUfRFanbaJIam46YYZWHlrux30B6xm4iXED2i
	 iDzE67IU9uWC0Q1DpZHxthvI13UfUR8E8Oe8773oWZSiqE/BrlsDAPC8SG/ONfIYFw
	 nBCQzgQQwiDhA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8OxWbemuyL
  ZYNUjHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPeGbmCOdwVs/bENTAe4upi5OAQEnjEKHGL
  tYuRC8i8yiTx4VkLI4Szh1Hi94K3QA4nB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+97CD2
  MICcRLdL66DxVkEVCVWHG8Eq+cVcJS48PEtK4gtIaAgMeXhe2aIuKDEyZlPWCDmSEgcfPGCGa
  JGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRvPi1KKy1CJdQ3O9pKLM9Iy
  S3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9vNSSTYzAQEwpTn29g/HYsj96
  hxglOZiURHn3tpcnC/El5adUZiQWZ8QXleakFh9ilOHgUJLgjWurSBYSLEpNT61Iy8wBRgVMW
  oKDR0mEV8QHKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKXHehx1ARQIgRRmleXAjYBF6iV
  FWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb1Yn0BSezLwSuE2vgI5gAjoix7kM5IiSRISUVAP
  T2XgLRhbxOU8VDkxq6lkl2dyhOd/hu9x0oZjm/8cVpjZEf/ZcfZl9g/uNaJM/zxbtzGrvfaO5
  OnZCdYNEd9miOY8d7r7aNO9Ds8Piyh0T8vavk8k/vMtv0cZnx3LnFBt/XHzJr8T4x7b4zXFL/
  6j8WBt8yOpdw5HZk1Jc3mlM76n3Wy205xVfhkll4zabkhfM13knvMwVaaq6bSp9Jnp76ofEHQ
  llgY9CNrT7FhdFlwYc/9awqufFxrLy1+sXbMpfYPCsYXesxI+UwLzr3IcOvn0951Fa/Y7vjvI
  sl485zJ76J3xhw8vf/LJ/0oJy5h744/FxR+QRMZ3027otjifP1Be6tRYxPkgy+j6/dlWjpBJL
  cUaioRZzUXEiAGtY3+RLAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1668844412!178355!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8067 invoked from network); 19 Nov 2022 07:53:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:53:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3BCC24B19
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:53:32 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2F2E34B11
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:53:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:53:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.65.0 -> 2.66.0
Date: Sat, 19 Nov 2022 15:53:08 +0800
Message-ID: <1668844391-3117-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99636

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md#features-1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.65.0.bb => python3-google-api-python-client_2.66.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.65.0.bb => python3-google-api-python-client_2.66.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.65.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.66.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.65.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.66.0.bb
index 4246d461e..3a985cd78 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.65.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.66.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b8a0ca8454ad57bc65199044717d3d214197ae1e2d666426bbcd4021b36762e0"
+SRC_URI[sha256sum] = "4cfaf0205aa7c538c8fb1772368be3d049dfed7886adf48597e9a766e9828a6e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


