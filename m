Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A4CC352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:13:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.101841.1670066009833119538
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y9GVUfBB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066008; i=@fujitsu.com;
	bh=ZfJJmfQzoo4BqchHqQXPWwBX73gXsEwX8f1CEM51tnk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y9GVUfBBHX+friVJs1FcGzfuKWRBiQwGbwH4CFOcIaaiH8uzh2prQP/9t9SXRnM2a
	 TuJ97MXG8mhq//WGCWtX5jp8oq+D0V/cZ9+mchhChE4zgbsduw28rMXY1F/IgINM+b
	 ReS3MF1Pqb5l03q71ftAtkIfb5aTuS0OeV30W8i5zDla0Kt/lsWWMiLZfCNRCFRexG
	 ChCgzxF6R2pY24G+f3NxOICE/7Rtscp0irXP1mfXQQkNb6jfCsP/9wShE2LW/k++mx
	 5Pzodsx04srK9hLF6FMOIcBK2eVjxhVZ+FcM+UU/3Qib9o2kFMai7v7qVkNv8a7LIQ
	 sV9WVQ2r2GgEQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8ORqBuu351
  sMPM4k8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHj8GPmgnOcFbf+/mNqYHzE0cXIxSEk8IRR
  YnHbJFYI5zqTxIJnK6Gc3YwSfzcvBnI4OdgEpCRu3P/PBmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWcJa4MvcLUxcjBwcLUPzb+gqQMK+Ak8TcpoWMILaEgILElIfvmSHighInZz5hgRgjIXHwxQ
  tmiBpFidmXm1kg7AqJWbPamCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYzYpTi8pSi3QNDfSSijL
  TM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAoMxpVilbwfj22V/
  9A4xSnIwKYnyHgvrShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwRut3Z0sJFiUmp5akZaZA4wMm
  LQEB4+SCG+XKlCat7ggMbc4Mx0idYpRl2Pm17YDzEIsefl5qVLivHJ6QEUCIEUZpXlwI2BReo
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK8YyBSezLwSuE2vgI5gAjpiI38XyBEliQgpqQY
  mgy3ay41ZGUQfLjrtG/iCQc3v3bvNXpEeKRuCnZwc5GW73syWaE6WnBl577JL2LJd1a9PmQn2
  2Pq9Fdt9Zi4P09qmCRxcx9KPZd/9yRl/y9Tw77r2+4lnarnLLK9rSx1/96VvxbcHRtXrahuDT
  Lyec0+cdG7Px/8cNce1Pwp3HfknPfXq23cus771vJW4rXGa5UVPknbHt4PafrHF7J/r/nY7y9
  6+K7XxjPv6xJa1ltaRE5NvzNfONJ15ckU6/3IHEeuOtGmfLgV+3bFuZ7k2n+XDx80bKy6bFN5
  5EJLwRPfJpcWi6ZO3RdnssfOLeuoQ3Vl9avX6xrt74uu37mDVeljvOuugTMYevfLW1z/blViK
  MxINtZiLihMBJBk0UE0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-548.messagelabs.com!1670066006!63966!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5775 invoked from network); 3 Dec 2022 11:13:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:13:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BD305100191
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:13:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B0F5910018D
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:13:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:13:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] capnproto: upgrade 0.10.2 -> 0.10.3
Date: Sat, 3 Dec 2022 19:12:54 +0800
Message-ID: <1670065978-24517-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99919

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../capnproto/{capnproto_0.10.2.bb => capnproto_0.10.3.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_0.10.2.bb => capnproto_0.10.3.bb} (88%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.10.2.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.10.3.bb
similarity index 88%
rename from meta-oe/recipes-devtools/capnproto/capnproto_0.10.2.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_0.10.3.bb
index 3d4f549b6..bf98d561e 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.10.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.10.3.bb
@@ -5,9 +5,8 @@ SECTION = "console/tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
-SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
-           "
-SRCREV = "2e88221d3dde22266bfccf40eaee6ff9b40d113d"
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-0.10.3;protocol=https"
+SRCREV = "a16468f296a9584f4068072efecdee8a9eb9c2ed"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.25.1


