Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2733BC38A05
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.3741.1649837434645688069
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Zt+zzHgE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649837432; i=@fujitsu.com;
	bh=thsrl3TKGMBrD7I9vKZyoSZ3Ss862WxEZUwEcDGOKtk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Zt+zzHgEPpJYuJhH8wv290my/bPMYBvpo8AjLg6qHh/eC6oVrOT0OJTqAsbjnc3s8
	 24JmLkjZeEeI8f61l+Hlp5MCMaGI10S5MV/vT3XT6TKfMCwLpCDzq3RNVAEvIbJgww
	 kzxlZ/O/P+Ex91wvwVTJgp8L8/uzkyyFCdkOlBzprwGUDHB42VAsZnWaxcrvRtYwfQ
	 juXzX1kOCnhQfuDAvqnD8bYxVog10wJZjphz9AqLoFzxLqdO8eHRambspUVDBAQCvA
	 V8g9FCD1uLPUQ3v6m/SoK2agiDI3Fim2aT7sSBz0fyUoYCIrJlEEYA76i+lip/N1S/
	 zkxSRYDQAJkkw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MRolvRGpZ
  kcLJPyOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfg8pZGpYCZHxeOfPxgbGDezdzFycQgJzGaS
  OHOykwnC2cMoseRII2sXIycHm4CaxPRbN8BsEQF9iaWz9zCD2MwCKhIvfvewg9jCAvYS5+b2g
  NWwCKhKHNuwD6yGV8BJ4s3qDWwgtoSAgsSUh+/B4pwCzhINk04xgdhCQDWLZ7xnhagXlDg58w
  kLxHwJiYMvXjBD9CpKzL7czAJhV0jMmtXGNIGRfxaSlllIWhYwMq1itE0qykzPKMlNzMzRNTQ
  w0DU0NNU1s9Q1NtZLrNJN1Est1U1OzSspSgTK6iWWF+ulFhfrFVfmJuek6OWllmxiBIZmSrGr
  4g7Ga30/9Q4xSnIwKYnyXq8JTRLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXuyKSxJSLAoNT21I
  i0zBxgnMGkJDh4lEV73BqA0b3FBYm5xZjpE6hSjMcfVK1f2MnPcAJFCLHn5ealS4rzmLUClAi
  ClGaV5cINg8XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvH8gUnsy8Erh9r4BOYQI65du
  qUJBTShIRUlINTLP5fl6SEw2d23SD97Kf1UpmveCnV9fFPRQR418wyc1yyn7eh1r7o7t23/9w
  ZtXKxZUx9xOlDoY5bvk9Y/v+95ts3Pd3LmxJ1tv7uV96afLL15yKYZu0JybXZC3P1JBnPD9N4
  d/0G6vrT7Bv2KZfHOl6cs+xizw2E5ROC8p5bf70gnt396G33e47/Fpdpe59Wlz97fw1353VOo
  kGgqs1P/8/6qG8qbLe/DObdGFJXv6ZkDd203ucS3s3vXRtNJFUXd3Y03a90M0je9WHrTdS5h5
  Od6v34Is5HF9cqxjpwqxySMnlcvnlyUt27Fh2ZF5au0bPmdneDYGm/KV31lwPkeBdqL6RYcmM
  mx3S11QcZyixFGckGmoxFxUnAgCKDtIRWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-545.messagelabs.com!1649837431!141307!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19317 invoked from network); 13 Apr 2022 08:10:32 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-17.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Apr 2022 08:10:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23D8AOt8018439
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:10:31 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 13 Apr 2022 09:10:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ocl-icd: upgrade 2.3.0 -> 2.3.1
Date: Sun, 10 Apr 2022 23:06:59 +0800
Message-ID: <1649603220-12209-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649603220-12209-1-git-send-email-wangmy@fujitsu.com>
References: <1649603220-12209-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96611

Changelog:
==========
  Updated OpenCL Headers
  Add support for MacOS
  Add CI through GitHub Actions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-core/opencl/{ocl-icd_2.3.0.bb => ocl-icd_2.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{ocl-icd_2.3.0.bb => ocl-icd_2.3.1.bb} (89%)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
similarity index 89%
rename from meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb
rename to meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
index 1746e21dbf..ae9c5bc811 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.0.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1238d5bccbb6bda30654e48dcc0a554b"
 
 SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https;branch=master"
 
-SRCREV = "59c098b6b1f97a339e3e5308499aee6538ecea40"
+SRCREV = "1165deedb2ae741cd76e60986f7c2cb5023059d9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


