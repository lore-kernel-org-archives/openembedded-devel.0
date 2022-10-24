Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462FEC3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 07:30:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.16786.1666596597193181687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 00:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BKQFI5pN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666596595; i=@fujitsu.com;
	bh=HsdfDR3xkSFYm2WtFUR/w/YkHIDbIrs9/2SgtIe65XE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BKQFI5pNeHUlxkNqbP0s4u4AANVgtqXBbFr0AJPYyYXzLUc1S8ZNkSfijZfiYMVso
	 PEfBdRrp2M5a5BENB5xxRPuuISU9+4UCNDShncL3Ue9QFA7UWeWcVa9HImorT0+U77
	 YxiuIuXO7/MSOJCJ3EcyaVAD1Chokt8sxrP57ghEVW3ZAV0Oa8AJaXZa6k5tGY5Uti
	 UWTlDRCsGLUoW33VZ3HA6frWrJ3jKCQNZF6EY4ouwHxtG/yB5gKLqrbbtCq0lcnsUE
	 vypC+j1Rt3rRS9zbNI7VYoBfjdQXCgValrZajqZVNg+Xs/hjYeXJ5CEseGp7hfqc+F
	 qPPqndZz2+AeQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxSfeTXVi
  ywYUTWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aOU3PYC/5zVOyd8pupgXEJRxcjF4eQwBNG
  iS3/PjBDONeZJB5d3MAE4exhlDh3czN7FyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  4DVCAsESNzo3AdmswioShx9+pAVxOYVcJKYeGgPWK+EgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm1kg7AqJWbPamCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYzYpTi8pSi3QNzfSSijL
  TM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAsMxpVhx6w7GG8v+
  6B1ilORgUhLlZRAPSxbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwVujBZQTLEpNT61Iy8wBxgZMW
  oKDR0mEd5YRUJq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+XmpUuK8W2yBigRAijJK8+BGwOL0Eq
  OslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3mOWQFN4MvNK4Da9AjqCCeiISyuCQI4oSURISTU
  wzT6wW8J27aoVvWq3Nl3XDp6wevvdHrlm5g81gYb2pkb8+TUmwVpVfZxqm7gM3seW1IpM/ypr
  HRm3WyTVMbphauxi+z8Pl8SIdsivfO7Efi2G7dSFJw8vRp8Nc/RoTL/N/OZuzNJXludSlhwL/
  Z2/hU3lKddVJ0vR04vXxkwtLssoXMzd3vB74ZoZfifOKBw/+6B/8emy+9mpltZhVUYu3Ylbp3
  5SeBK4LGFLwgRdL7n5CXVfLJJWCj79xyAezzd1cvTryHtB2ZtLPy2d8qhg8uH5oSy3j91WrTm
  lJJHZdLDH/lrZgmbvJap688JaXvnEldgeWW2S9bhE9ODFy/vXujX6MhjsuLBgU4LXqeI0JZbi
  jERDLeai4kQAXWFohk4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1666596594!212690!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6212 invoked from network); 24 Oct 2022 07:29:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 07:29:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 635D61000DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:29:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5635B1000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 08:29:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 08:29:52 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 5.0.1 -> 6.0
Date: Mon, 24 Oct 2022 15:29:36 +0800
Message-ID: <1666596576-30060-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99292

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_5.0.1.bb => python3-robotframework_6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_5.0.1.bb => python3-robotframework_6.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_5.0.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_6.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-robotframework_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_6.0.bb
index 49c97ad102..c638ef65f4 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_6.0.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "cf5dc59777ed9d8c3e1e91fb4403454890242867735681f22f4f22dbb2a20fc8"
+SRC_URI[sha256sum] = "db9498dad21369a6702384db057994628cd2cf0a172f5685be941c4bf94e242f"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.25.1


