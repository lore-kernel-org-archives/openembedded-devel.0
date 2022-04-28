Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3660C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:03:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.7000.1651129424579232147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=omAYEIuX;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651129422; i=@fujitsu.com;
	bh=D4zfGdHBoy0nQ9Yt8QvjKV7w3kkVGWxfUoxGryXUftc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=omAYEIuX0BNlMiu4wYFmtvX45g0AEl/GbFxy1HOZE0I9ZvjSXhvzrQnS2MSsH/5hb
	 3UuPQArwqAwpZtYyfQw1nVMItrokY/ZE5Jh+ENWI7hA1zbXvvANWPhietPnkzuAtYE
	 gEw8xclKLnwF7qMo39i7WXnzfcr/2Kan1jXLV7hX5F+c+vSVcdkMaKB4dOOW0B7u4o
	 QD1UOs0dx4cA49DIkK+g++PNG9L8/F5WEXkgJr3/NeKpS3dbKEYeV+n2j6QdyvEM1m
	 gHqzMIFXyH84UK1FM9+5g6LxV2yJvlylggoWB5+rBJpHYVKWfFvKV7Yip91bItFAci
	 eCaQrHUrV22rA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSdfPJiv
  J4NsbCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPP9j+MBe28FS1N6Q2MD7m7GLk4hASeMEp0
  PmphhXAuMEm0Ln7BAuGcZJTYu+kcYxcjJwebgLrE45uvwWwRAX2JpbP3MIPYzAKqEt0X17CD2
  MICPhJHFr9mBbFZgOLrnh5g6mLk4OAVcJN4+lsAJCwhoCAx5eF7sFZOAXeJlpsrwMqFgEpWXL
  7PBmLzCghKnJz5hAVivITEwRcvmCF6lSROrPjIBGFXSLw+fAkqriZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1VSUWZ6RkluYmaOrqGBga6hoamuma6RoYFeYpVuol5qqW55anGJrqFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgCKcUs13awTi376feIUZJDiYlUV4r06wkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8CtZAOcGi1PTUirTMHGA8waQlOHiURHhljIHSvMUFibnFmekQqVOMilLivK4gfQIgiY
  zSPLg2WAxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMawYyhSczrwRu+iugxUxAi1cWZYI
  sLklESEk1MDUHHRV9/3pm0tLL8pnmB148K7EJWdbyZmX7X84kA1VWl/3tfapiy5eJ9P9OfPFY
  x0dTX6lk5Rv2jWwPF3HVhWjNvuRv3xN081+G0S+x17tD3x6fMenUgeSbjx7znz2nGsISstLjQ
  /2eBqFmdabLM6cvenrg+fszX58497+z03qh6czc7v5i2sl7mg72c1kuaSjs6Lt76tQ+FlXpu3
  eYclw/7I+acPlT8VomW8c1ZgdKNRtYqxMXpKxZwLvznc8Gf11Oie0Tfpif92N8NVtzfnPLuts
  vVctkq3dPvT1p04xFuVoJnB+PfyuLj5275/tV1W12ab+e+sbltLdqvNKZf36vnoZp4rIlTv9S
  b05aE+SoxFKckWioxVxUnAgAcJrtclwDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-591.messagelabs.com!1651129422!12844!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11672 invoked from network); 28 Apr 2022 07:03:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:03:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E1205100440
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:03:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D250D1000FC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:03:41 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:03:24 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-graphviz: upgrade 0.19.2 -> 0.20
Date: Thu, 28 Apr 2022 15:03:36 +0800
Message-ID: <1651129416-8432-6-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96828

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
- Add keyword-only neato_no_op argument to .render(), .pipe(), and stand-alone
  graphviz.render() and graphviz.pipe().
- When building a Graph or Digraph, warn about an expected DOT syntax error in
  rendering when passing a string that ends with an odd number of backslashes
  (e.g. invalid dot.node('spam', label='\\') instead of correct ..., label=r'\\'
  for a node labled as a backslash).
- Increase visibility of graphviz.escape() in the documentation.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-graphviz_0.19.2.bb => python3-graphviz_0.20.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.19.2.bb => python3-graphviz_0.20.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.19.2.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.20.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.19.2.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.20.bb
index 3cae19673f..81b591247f 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.20.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=951dd0868a9606c867ffda0ea3ea6da2"
 
-SRC_URI[sha256sum] = "7c90cebc147c18bcdffcd3c76db58cbface5d45fe0247a2f3bfb144d32a8c77c"
+SRC_URI[sha256sum] = "76bdfb73f42e72564ffe9c7299482f9d72f8e6cb8d54bce7b48ab323755e9ba5"
 
 inherit pypi setuptools3
 
-- 
2.25.1


