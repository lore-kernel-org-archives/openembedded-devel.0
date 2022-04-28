Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C48C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:03:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6996.1651129403369169756
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KnZLIwda;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651129401; i=@fujitsu.com;
	bh=dx5Pt3ufZD++Qm4knkD7uiov7+NK7R377g4pIr6UPd0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KnZLIwdaumAz0BEYifP5CD1Z2rNjukE8semAqQK8a5qIzCdzwfXCkVNnrCUjFY1Vc
	 Qu5y65Kpm/3iPVAGqN8OcxJBJs7pD7Vq3z3TusQZeo5S7pxpa6mFp66m4c6dhWstxj
	 mQTU78i2zky35TvEWf++K6fmfZwsSkiDS9SxAAXQu3Dc9cfal0FJJPK4ZPLlP7lu5h
	 pEy49PBnpl3W1jxkH5ppS8s/CTOYZUSYDQhwAkVJr8dMGIT98LrhYx8KiISeO/tdUy
	 kOrL1vvNT3jTgnMYqXdMJoQRCHG0Orcz4gpjFBNuLc6k05JKVd0qP3MW0RLn/o0R7B
	 qi3MbUvJ1r1EQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxRdfSJiv
  J4Fsrh8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHl5wq2gjucFQ+3tbE1MD7l6GLk5BASmM0k
  cf9OchcjF5B9klHizKknjCAJNgF1icc3X4PZIgL6Ektn72EGsZkFVCW6L65hB7GFBXwkdp6az
  QpiswDFN66fwQZi8wq4SfROncgCYksIKEhMefgerJdTwF2i5eYKVojFbhIrLt+HqheUODnzCQ
  vEfAmJgy9eMEP0KkmcWPGRCcKukHh9+BLzBEb+WUhaZiFpWcDItIrRLqkoMz2jJDcxM0fX0MB
  A19DQVNccSBlY6CVW6SbqpZbqJqfmlRQlAqX1EsuL9VKLi/WKK3OTc1L08lJLNjECQzOl2C1n
  B+PHvp96hxglOZiURHmtTLOShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwKlgD5QSLUtNTK9Iyc
  4BxApOW4OBREuGVMQZK8xYXJOYWZ6ZDpE4xKkqJ87qC9AmAJDJK8+DaYLF5iVFWSpiXkYGBQY
  inILUoN7MEVf4VozgHo5IwrxnIFJ7MvBK46a+AFjMBLV5ZlAmyuCQRISXVwKSe6huX7s3svr9
  yacniw82VtlIOr2Lma013CuU9aaWr33vQ+LGeUHOrQMHy379uTH32uuqxGdO9hbncRhy551gn
  yqQWPm/nvJZYMNeoaumuQ93hc9eEHn2m+nYKi8BPt2lBP04+jZyuuXCaRlph4tdshwyNdNOXe
  zzFhayqfAOPzbF52+D7/82Nqku2dlJTpc5vmfArzVFNSW765hd2R1avDJVb8f9G3NHeicKRbr
  /d4g6eU/bTlef+58C+5S+T8OUPfC+5Fvh3vXSp2LDa//nMNRZbc81PXa/TX/NB+tOOs+7iqXw
  Ooja7LZcu/DghOnjJ+bhzE01+ettoihQK1OecUy0qWPDPzEXntlbFOiWW4oxEQy3mouJEAM/D
  rp9IAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-528.messagelabs.com!1651129400!70927!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18343 invoked from network); 28 Apr 2022 07:03:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-20.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:03:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23S73FDO021997
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:03:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:03:17 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.3.1 -> 4.3.2
Date: Thu, 28 Apr 2022 15:03:33 +0800
Message-ID: <1651129416-8432-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:03:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96825

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    Option to use a callable for cors_allowed_origins #264
    Close aiohttp session when disconnecting #272
    Remove 3.6 and pypy-3.6 builds, add 3.10 and pypy-3.8

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-engineio_4.3.1.bb => python3-engineio_4.3.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.3.1.bb => python3-engineio_4.3.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb b/meta-python/recipes-devtools/python/python3-engineio_4.3.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.3.2.bb
index 35e8d790ab..e9891bc272 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.3.2.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "6e1d26977ffefe3b7da1b5df7a8750aedc7686da8201cd90daf36693db122489"
+SRC_URI[sha256sum] = "e02f8d6686663408533726be2d4ceb403914fd17285d247791c6a91623777bdd"
-- 
2.25.1


