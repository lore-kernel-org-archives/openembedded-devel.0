Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9DFCCA47C
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:14:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.19895.1656555266375123218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eP05uVI4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555264; i=@fujitsu.com;
	bh=xQe58R9u+lm9BeMZmS7wYGp3hQrrnjWTIwaOqJHhgXk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eP05uVI4LvVllvdumdjfixpVAh3r+aeXOGJDC8XWGoYJE5AYYI2s/VVAs5DlLC9a7
	 JvmFhNk6k95sk+NB+5BY+uimJibsWdBuWjXDsew5zwY7T4yQpmgq4NgKQWpHhuXSJJ
	 vfyduHsiDG8xEyhrRTx5TtMJeajlD3MSX9CvQ/cNsTna2hx89zrMRExiAyI+eGrVHD
	 Z4I67/+fyh6KEds7mhL3qEykXCHyoRhXk6tWywjqsJRMlT3EqsAWpzD88/FUPtFo0R
	 zaE9UqtTQUTwPkFi18Nxf4C9g95rCMteSIz6WMVz62UVoIhKJ9ZzBInThTrQEVsA6r
	 YuEe9+lZ3Semg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8MxSfc/294
  kg9O3NC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyb6xMKVvJULJpyha2BsZu7i5GLQ0jgCaPE
  t81PWSCc60wS65ZegXJOMko8mtvF2MXIycEmoC7x+OZrMFtEQF9i6ew9zCA2s4CqRPfFNewgt
  rCAj8SknpNANgcHC1D82E+wMK+Au8Smjf2sILaEgILElIfvmUFKOAU8JN4cUwEJCwGVzPp9mQ
  WiXFDi5MwnLBDTJSQOvnjBDNGqJHFixUcmCLtC4vXhS1BxNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YrZOKMtMzSnITM3N0DQ0MdA0NTXWNTXUNLUz0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OT
  c1L08lJLNjECQzilWHnHDsa2VT/1DjFKcjApifI+nbYnSYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IE73qGvUlCgkWp6akVaZk5wHiCSUtw8CiJ8N74DtTKW1yQmFucmQ6ROsVoyTF19r/9zBzLwe
  TMr20HmIVY8vLzUqXEeVeyAM0TAGnIKM2DGweL+UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORi
  VhHkZgAlEiCczrwRu6yugg5iADto5DeygkkSElFQDU8OWgwrZrjcFQyeo6j9LYFrzZB3Drcsf
  pM0fvozjSNIwSVWawvDnkMVf/UMp82uqQvnCfm3/KZ7d/XnZ9H0+zToyM+J1rse3Pi/ZXXehV
  oGh89i3srtBu/0t85ZHzb0oOnP7y6KutYce169Ky+95P3VbUOq+drYUTo/+GRmPb4a0VcvE3n
  mz+hHDoiTFExITf9zqsM7zVytg2/fTNNKxZo90OKuy0YUN+W8FriRE/tF1W83lJFt752nJyYx
  L7Zwcu/T+xN+37vQNOaB8e9dnwceyOdmB67oeqB13qu9XLth4IF043k8qVlFF4cZXxjeMW012
  TzZXvPBr8+5dq0M3m52dKR34s/H3oxy7tU52SizFGYmGWsxFxYkAqv4WdXQDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1656555263!12441!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14306 invoked from network); 30 Jun 2022 02:14:23 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:14:23 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 641401000C0
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5764B100078
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:23 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:14:21 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-colorama: upgrade 0.4.4 -> 0.4.5
Date: Thu, 30 Jun 2022 10:14:03 +0800
Message-ID: <1656555244-20637-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656555244-20637-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1656555244-20637-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97626

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
============
  Catch a racy ValueError that could occur on exit.
  Create README-hacking.md, for Colorama contributors.
  Tweak some README unicode characters that don't render correctly on PyPI.
  Fix some tests that were failing on some operating systems.
  Add support for Python 3.9.
  Add support for PyPy3.
  Add support for pickling with the dill module.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-colorama_0.4.4.bb => python3-colorama_0.4.5.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorama_0.4.4.bb => python3-colorama_0.4.5.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.5.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
rename to meta-python/recipes-devtools/python/python3-colorama_0.4.5.bb
index 54640de04..122ae5399 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.5.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "57b22f2597f63df051b69906fbf310cc"
-SRC_URI[sha256sum] = "5941b2b48a20143d2267e95b1c2a7603ce057ee39fd88e7329b0c292aa16869b"
+SRC_URI[sha256sum] = "e6c6b4334fc50988a639d9b98aa429a0b57da6e17b9a44f0451f930b6967b7a4"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


