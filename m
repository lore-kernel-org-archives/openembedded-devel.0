Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.4762.1623389374911193697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 22:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bUrs/gT7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623389368; i=@fujitsu.com;
	bh=3oO3U4JlLjwesD4HlUIgCb6RxAAIdzhlssSaqeQuEq0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bUrs/gT706fZ9Rx3XUCQc/WGUXeqDHV8iftfNdnLx1qsAZp+JbDNIyqDd9uRd13lu
	 TSgl8+c4QNqEW0Y6S58WfB7g+6A32TsRTLI4bVE7Tzy240iRWdDZChsibjls0+Rbwu
	 q8oadZCSO/bMA+fj1uheFfoq92rLGOidb3hsRj3NauYLp4ESF8k8oluS5QZeHgcZlz
	 TB/HpW2NuNdMpSvMaMq5SsTjY05MZCrSzksS3M7VM5I0Jmqgl62I3OTHnYzM1QyYf+
	 +13LGQMrOYvbyO1fBdrkFNYbA0rFqvjYnXfPW/NNhLdv8GOb6DQoh6PUA1Q9UzBlXt
	 8sJSfz6edo7sQ==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 7C/C3-25406-7B4F2C06; Fri, 11 Jun 2021 05:29:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0d305VC
  Cwf3JxhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bn7iOsBTM5Ko5O7GdsYDzK3sXIxSEkMJtJ
  ontlDzOEc4JRYmbXRCCHk4NNQEei40U3C4gtIqAvsXT2HrC4sIC/xOu5R8HiLAKqEi2P5rOC2
  LwC7hLX555kA7ElBBQkpjx8zwwRF5Q4OfMJWD2zgITEwRcvmCFqFCW27zzDAmFXSMyYsY1tAi
  PPLCQts5C0LGBkWsVokVSUmZ5RkpuYmaNraGCga2hopGtoaa5raGyul1ilm6SXWqpbnlpcomu
  ol1herFdcmZuck6KXl1qyiREYSCkFRzt3MP569UHvEKMkB5OSKO+Uu4cShPiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwHnkPlBMsSk1PrUjLzAEGNUxagoNHSYQ37zNQmre4IDG3ODMdInWKUVFKn
  PfTJ6CEAEgiozQPrg0WSZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOuBpnCk5lXAjf9Fd
  BiJqDFzBpgi0sSEVJSDUz8MyWN//6Z39CYv1tjKfuLb2v52aZnPlf6sXjpVN0eX/eCJWsP32E
  597n1subz6dkOYgpF3wIP1N9coFDx6abXsrwjW2aoJNSesdi9z5dZUMfwWv7FzNLijdfvZH6w
  LVk5/5DQ23STBM5pLrHT1px25O6Ot5ves8ztvdBdlf0S9eVzdV3z7bxktpjUlkfN+9jr7PyoY
  vvri6fUN8jdbbPyU2f9tOaNksWfRT85NJoltxQc0zl7VFijUjrN4/HjFd6qSbqv0toNfvpUfI
  1j79pT5XsvJu35Exvein9nRbxfl86rlvf3ila91+91RXhDzLslftvlryklSxdIrN1dmMkmyio
  0bYW26rO52Q8Or1ZiKc5INNRiLipOBABs4FnCHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-287.messagelabs.com!1623389356!285435!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5471 invoked from network); 11 Jun 2021 05:29:20 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jun 2021 05:29:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15B5T9pv021738
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 06:29:16 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 11 Jun 2021 06:29:08 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210502.0 -> 5.9.20210606.0
Date: Fri, 11 Jun 2021 13:29:00 +0800
Message-ID: <1623389340-48664-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210502.0.bb => ctags_5.9.20210606.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210502.0.bb => ctags_5.9.20210606.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210606.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20210606.0.bb
index 273d6e5730..471b8edce0 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210606.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "6df08b82d4845d1b9420d9268f24d5db16ee4480"
+SRCREV = "92b49e2ef6961d6b39890f430a56478ec9e5e82f"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

