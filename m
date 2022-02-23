Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EA2C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:51:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.4982.1645602694984329568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p3+U5cfy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602693; i=@fujitsu.com;
	bh=pkx4EMuKusfV5UBY1sXuhc85KjyObQTiwlLz6r/AazY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=p3+U5cfyBoa9Q41xWlrogXILyUvz7pEU3TvqyQtDEIOygyRO6Uz0iBWB634tk8cdX
	 1vLoG1batYTOi638MZ+f9bzqSdqwKrNo99HwFZDe3dgDzEger0pcPyKW5wTOv3Dl3m
	 304644x4maMxeTdkoSrW+EWOBLuuT/T+oO8HX6AcCVHNFMj69c5SFmLECRe06BHCdL
	 oF2Dda/9PNYN9EOQCHmIvJgwhwALqsoFnCZnUuSnw9sTuHRP9t1L/vPydp9idztu5x
	 3CdNf1EDELiIRhi8cGVUn4x0ue5WYILmaxmmQA6E3z4bff1WMY/yCfPPIMaGtYj839
	 hsirnSIQh2DSQ==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id DE/5C-00700-487E5126;
 Wed, 23 Feb 2022 07:51:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqNv0XDT
  JYPYSZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePCBfWCCRwV05+2szYwbmTvYuTiEBJ4wijR
  c/IrG4RzgUniw+ZPUM4JRolnb5uBHE4ONgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexh
  QXcJRZ0zAWzWQRUJbofHwar4RVwklj37R5Yr4SAgsSUh+/B4pwCzhJ3V3wEms8BtMxJ4sfhQI
  hyQYmTM5+wQIyXkDj44gUzRKuixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJGplW
  MlklFmekZJbmJmTm6hgYGuoaGpromupbGeolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgQGcUswSu4Nxa99PvUOMkhxMSqK8hUdEk4T4kvJTKjMSizPii0pzUosPMcpwcChJ8
  PY9AcoJFqWmp1akZeYAowkmLcHBoyTCKwKS5i0uSMwtzkyHSJ1iVJQS5/1+DyghAJLIKM2Da4
  NF8CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwiz4Cm8GTmlcBNfwW0mAlo8ZQsIZDFJYk
  IKakGphUc0byXVM9PPfIrnCUnYvmUI2+EtFMfRf+49+WOCO/JacvucOhphLQunmvq9W7ey9jk
  92eEFvfx1e/b0HiG612Snf2ZozxsUQyuCRz1K77XL2IufJ6trXu6KdrxgFrShTfz+F20pI9Oi
  3WN9y6Qv79jx4uVN5p0r768JLRpjr98tIv1HJMQS/GX6tmvZp9YHCJZ8Fft0Z/mMwfz1OuFnA
  Mt6qUa3u/dpbDtk73bpQdBRse5K7fuFar/Epm25mCC9ptS3lt1Xzu3vn+pWbuq+Z7MBz9Pu5+
  O2h9kUq+WajEWcH+VrPVePtfh07zyX5PkWXj3ZNcJB86qKnuzYjZjmKLvtI82y/3ehC47H1/2
  U4mlOCPRUIu5qDgRAIr500VbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1645602690!72918!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18138 invoked from network); 23 Feb 2022 07:51:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:51:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0A5CD10019C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:51:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DE9F910019F
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:51:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:51:26 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 5.1.0- > 5.2.0
Date: Wed, 23 Feb 2022 15:51:10 +0800
Message-ID: <1645602670-28373-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645602670-28373-1-git-send-email-wangmy@fujitsu.com>
References: <1645602670-28373-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 07:51:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95471

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.1.0.bb => wolfssl_5.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.1.0.bb => wolfssl_5.2.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.1.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.1.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb
index 7b43b06781..a597fb3ccd 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.1.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.2.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "2b670c026debc8e70621eb5c75b60931c9aa0bc5"
+SRCREV = "e6c07a296d2996e8d5c3cc615dfc50013bbcc794"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


