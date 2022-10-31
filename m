Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B22FA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:42:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.7051.1667205759467258705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fXQkll4X;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205757; i=@fujitsu.com;
	bh=hKVJUeccVEqSvKp7gHujy4ZMzb8fgTu3a4cu7RSQhzY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fXQkll4XFq2M8vELTfcd62vsT1ZBAHELhIK2Vy/XgNLaAgCiDrIi1gmAv0Ii1Bbee
	 sg+iNi/0FLsmsTSm0jirnchPH0SaJR0nTiggbzKqAeyLXAyqjCnrxLHKzQceE0qRxk
	 pb4N1ZXv4HR0y0FvfFsHUysUrLOddj5U7iYg20Mh63Ts7/aRrVYXzWAfjM2LJFGa0v
	 s/qdTGasRHRFgwoRH5BPDJ5w4jhyroR83fOdecaP7ecTTL1lrOKj7ZZ3MAtrbQ8tZq
	 S9zaOTy2mmkwu8cnFnXVTxbCf5r//T9Xm2BmYebZacYfMa+c4RQuCK3nH+zgNLx9FB
	 hEbpA2fwNmlKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWbe2Kz7
  ZYOdHWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePoy32MBTs4Km73XmVtYLzC3sXIxSEk8JBR
  4uehTcwQzhUmiUXnzzNCOHsYJda0bGHrYuTkYBOQkrhx/z+YLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBd4sbbU0wgNouAqsTP+78ZQWxeAUeJmcefsoLYEgIKElMevgfr5RRwkrhw6gZYvRBQzd
  17p1kh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMZoWpxaVpRbpGuklFWWmZ5TkJmbm6CVW6SbqpZbqlqcWlwBlEsuL9VKLi/WKK3OTc1L0
  8lJLNjECgzelWOH7DsbupX/0DjFKcjApifK+a4lPFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBy
  9gOlBMsSk1PrUjLzAFGEkxagoNHSYS3txUozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd
  6yTqAiAZCijNI8uBGwqL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3K8glPJl5JXCbXgE
  dwQR0BFt7HMgRJYkIKakGJvfbVmf2pxa9MT6q8mtNh6/9XKvG4Hdm8vtSp1+ZM63r2P9f2w9O
  VFCf/dGtLrbSVcRW5tzf0w7n5N2fvGTr2LHL6Xjeb5Gm/RVi7+yi1ktL1b68KefPsbTsY2bou
  sL5n1L5l5gJvO+v5vF/n6HuxfGDS0i7seEe/wm+e1LJ/6Rs+CTPPrsmUv97b7DcKp9Tha/kts
  aYHjrc6K235IQ9N8Ps1Ox5X06krWouKk+1nbzG+or1xf2nf/5jmc39JpR1T/Z3hnOyCnUWqld
  2WWavebQzNe3EwQPrQx7f6OsKql8vzNlq+8JnS+j96V4l16NjNsnMZEwvmq5tWZkn9HibAUv7
  zu2vFN/n3hXRVnDbqcRSnJFoqMVcVJwIAEqkmrplAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1667205757!174789!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5739 invoked from network); 31 Oct 2022 08:42:37 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:42:37 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 37BDD153
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2B244151
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:42:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 5.5.1 -> 5.5.2
Date: Mon, 31 Oct 2022 16:42:13 +0800
Message-ID: <1667205733-3829-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667205733-3829-1-git-send-email-wangmy@fujitsu.com>
References: <1667205733-3829-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99374

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.5.1.bb => wolfssl_5.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.5.1.bb => wolfssl_5.5.2.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.2.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.1.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.2.bb
index 790fa68b33..aafb6d370f 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.2.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "f1e2165c591f074feb47872a8ff712713ec411e1"
+SRCREV = "0ea0b887a51771cc1668d71b9113bbc286dd4f8a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


