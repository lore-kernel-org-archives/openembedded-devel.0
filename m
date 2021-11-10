Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41488C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 04:02:14 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.7435.1636516932563429170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 20:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=isNDFlif;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636516930; i=@fujitsu.com;
	bh=y4HMPE1dsKIUzsXJa4HHfBQYVeAG2J6ETGxDx85zXZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=isNDFlifNjsYejreE6AlvQMd7ASThNPYX2r/nFBhNbvc/0k0HBAxipv2WsrnbjVJX
	 tpqOzweZmiOtXWPzWKhW/+ndOi0ks8a/n0Chje8eCzj/v29wUnu8cyw5x5eePrcL6q
	 7MQs7pb5xVvCXSqeri12illeU/DfxBj4jNM9jg/BI3t36aQ5bTH5DvP9IkFFnabTAj
	 KNFjzGj6sH8cKpSwxVussYqFepeBZi6LFt/I6yAxOWg/MW6EnK1+AP29xSCf3/Aiyu
	 YWOc2OS6fMCqOmdRNI7Lh3CKkrHFQms71zPG7npJhYOMF0ygHF/FmFK7ZMlkFJaBIf
	 eIhZFyusvI3EQ==
Received: from [100.112.195.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 45/C8-19641-1444B816;
 Wed, 10 Nov 2021 04:02:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqOvo0p1
  o0PhOyOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzdiy7QhrwUPuii9/1jI2ML7j6mLk5BASeMIo
  8f+aThcjF5B9gUli6rQnzBDOCUaJjj/72ECq2ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhbwlrj8cypYPYuAqsTTt42MIDavgJPEqifLwOISAgoSUx6+B+rl4OAUcJb4elcY4ggnib
  mTvrFAlAtKnJz5hAVivITEwRcvmCFaFSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQEYiMzvcQq3US91FLd8tTiEl1DvcTyYr3iytzk
  nBS9vNSSTYzA8E0pOFC3g/HB6w96hxglOZiURHkPCHUnCvEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgTXcCygkWpaanVqRl5gBjCSYtwcGjJMLb7AyU5i0uSMwtzkyHSJ1iVJQS5/UBSQiAJDJK8+
  DaYPF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7xlHoCk8mXklcNNfAS1mAlp88Es7yOK
  SRISUVAPTLc6XStL7lq/K0RKuVRed/3MCoydzrG1bkXPIxYVG2XEN1fbrl1+Uf/iVcar8mopi
  O2Y1O673905/i1p8+e8Nw4LjuTVC9QJfpwnVHFt+RTnyyROXurVvz1tu+Cn+aMGPhZu2MpV2n
  2k/tv2CbObyGUoLJPdsYf64RCp37fJ7Z2uYG0KDrs1ymJVa/8GMb3raeaG9VbPMnj/g91WxX7
  C6ImS3ndL2NzESubvb1TWSvp6VKLX+n7x7EzfjitnHhDYniBnHWmxdK8fGycPx49mbratiXl/
  ju5owT/XqFZGqRRxO3/9p3rXWUbT/vW1xeG3GuTmT/nxZUuR9/877VScesJ2alyjnNP+0CuPR
  1JA9HUosxRmJhlrMRcWJAP1lKddaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-267.messagelabs.com!1636516929!641342!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13849 invoked from network); 10 Nov 2021 04:02:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Nov 2021 04:02:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D263210024A
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:02:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B48BA10022D
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:02:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 10 Nov 2021 04:01:54 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohttp: upgrade 3.7.4 -> 3.8.0
Date: Wed, 10 Nov 2021 12:01:35 +0800
Message-ID: <1636516897-63008-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636516897-63008-1-git-send-email-wangmy@fujitsu.com>
References: <1636516897-63008-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 04:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93895

License-Update:
 Description of license is replaced by website "http://www.apache.org/licenses/LICENSE-2.0"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-aiohttp_3.7.4.post0.bb => python3-aiohttp_3.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.4.post0.bb => python3-aiohttp_3.8.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.post0.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.post0.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.8.0.bb
index ea47ad2eb9..710f8f4ceb 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Async http client/server framework"
 DESCRIPTION = "Asynchronous HTTP client/server framework for asyncio and Python"
 HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8074d6c6e217873b2a018a4522243ea3"
 
-SRC_URI[sha256sum] = "493d3299ebe5f5a7c66b9819eacdcfbbaaf1a8e84911ddffcdc48888497afecf"
+SRC_URI[sha256sum] = "d3b19d8d183bcfd68b25beebab8dc3308282fe2ca3d6ea3cb4cd101b3c279f8d"
 
 PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
-- 
2.25.1


