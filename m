Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7650C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 01:18:34 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.6336.1635211109227981585
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 18:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lWAmCWhz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635211095; i=@fujitsu.com;
	bh=iRYT6sgOTiQsAq4LCkihSh625Nf6kQD+G0LU+0pgB6w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lWAmCWhzq4CeuYo86geom08XMJr94yrwQF5QXnXx9Jw8MiQ7n+f0XmwIyFxa+PUtU
	 tahYqM6TKGm5TYfu0++u6NWjJZQ8/n8ynEDBPEmC33xYmOKHsAo4fs4U7VkN5pS0F2
	 lKu/JjKJypdZvghatkC8m9Pj8QEJt5izicmVkE5E64jrnRJ2k2Bxm7LmkOCZ2inn70
	 QuRoRVw9HhWXWCfZOWTqlhMx9hZ0M1NdtVVuvrGk69OdExijQj0rec4nRY8+PshF+l
	 ixDhnWazTtqP8nyNNRNxFJh2ibev/wGB+Dg5UzAIrbS4qjy2wdCg+hHWmLribPo0ZW
	 pL6ow+b53IXqw==
Received: from [100.112.195.149] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 27/05-30013-75757716;
 Tue, 26 Oct 2021 01:18:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8ORqBseXp5
  osPsSi8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHw/xTmgtccFfOeXmJsYHzN3sXIxSEk8IRR
  Yvm9T1DOBSaJidNnsEI4exgl/p9dy9LFyMnBJqArce7xWnYQW0RAX2Lp7D3MILawgLXEll3rw
  eIsAqoScxY9YQSxeQU8JG6tvsgGYksIKEhMefieGSIuKHFy5hOwmcwCEhIHX7wAinMA1ShKzJ
  4uD1FeIfH68CVmCFtN4uq5TcwTGPlmIemehaR7ASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUN
  LIDYy00us0k3USy3VLU8tLtE11EssL9YrrsxNzknRy0st2cQIDLyUggN1OxgfvP6gd4hRkoNJ
  SZR3+dmyRCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvFxh5YlCgkWp6akVaZk5wCiASUtw8CiJ8
  G4OAUrzFhck5hZnpkOkTjEqSonz+oH0CYAkMkrz4NpgkXeJUVZKmJeRgYFBiKcgtSg3swRV/h
  WjOAejkjBvCMgUnsy8Erjpr4AWMwEt9tMtAVlckoiQkmpg8lnOoGp4/92zqezeR0UFrRi3d3m
  0p3Ud0b55ZrvpVbOIab7W9YsED9Q1buL1klvtbbBx/emuHKezv/b3vZy1Vut58ZOLcaGeByTN
  SgIFHq5fc/heuHXMM4nuBb6Ss9bm/7nfMudQ2sFUh638Dd/kpxd+dtH5IVY3OzQ+82hSVO7y1
  gnzjvxUvBhbPeW+Psd/5vOHN3zo4ij/Zhf56L/LnQzD4k23tJ1WTpzfWl0rndL7ZpPnzOpmge
  wTbnymfEk3f4q8kbS+rMRjp2gVpxXT80l4UvusfB570wVr7xRY+NeddN5cuWyHUq+7ybqGkMl
  zG5gvxe6SaNB7P5P31NY7mwR/uR2S33RB7nx7+fbrSizFGYmGWsxFxYkAR3QwGDcDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-267.messagelabs.com!1635211094!1313675!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22575 invoked from network); 26 Oct 2021 01:18:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Oct 2021 01:18:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A0ECD100231
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 02:18:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9193D10022F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 02:18:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 26 Oct 2021 02:17:53 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] links: upgrade 2.22 -> 2.25
Date: Tue, 26 Oct 2021 09:17:46 +0800
Message-ID: <1635211066-45948-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 01:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93581

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-support/links/{links_2.22.bb => links_2.25.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/links/{links_2.22.bb => links_2.25.bb} (64%)

diff --git a/meta-oe/recipes-support/links/links_2.22.bb b/meta-oe/recipes-support/links/links_2.25.bb
similarity index 64%
rename from meta-oe/recipes-support/links/links_2.22.bb
rename to meta-oe/recipes-support/links/links_2.25.bb
index f2b4a6a80d..1986358b21 100644
--- a/meta-oe/recipes-support/links/links_2.22.bb
+++ b/meta-oe/recipes-support/links/links_2.25.bb
@@ -8,5 +8,4 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-libtiff --without-svgalib --with-fb \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
-SRC_URI[sha256sum] = "0364986b3a7f1e8e3171bea362b53f71e1dd3360a8842d66fdc65580ebc2084d"
-SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
+SRC_URI[sha256sum] = "2dd78508698e8279ef4f09a3a2a21e9595040113402da6c553974414fb49dd2c"
-- 
2.25.1


