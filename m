Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C094C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 12:30:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.10347.1648470616316326384
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 05:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hmPgc05f;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648470614; i=@fujitsu.com;
	bh=jkKB+VsY7X0S9Ly05ES62wElglTxR1ZFK+peO/XfZsQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hmPgc05f1Hij0srGdeZPhKAf5y3R0beJCU0ux+kQOGcyKr2xY+njWI9B3A0KymJNz
	 32Kf3F2Idy/FIH7qkFSJvhJNSNYSic5Qo3k5mt/T9/CZy/6FLY0mbZ+auZWbZ8xwHv
	 6m/cH559bVJcgF5nnY8O/QKFuIakK2FvIFjM8DCf1a+Zsl7fcQ13eK5Zj5+/jVkIH4
	 ZdrSkugEqW23twDMQdiF2YrB3EyrmKtGfRDZ4q76T1J8v+TxNwKRE7xnpohgXsFYTy
	 R+mNTsfKiR7TOs8j3DmXY3FI554o8J2EPSH+uzhnJUVYc7FJxdVbNC1mX0u0tGhFfM
	 H4um9pv3+MVUQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSTdslWO
  SwbEuLouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN55lTmgkccFQ3n3rM3MPZwdDFycggJPGGU
  OPW8rIuRC8i+wCTR9X46O4Szh1Hi2M2N7CBVbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdA
  1YjLOAj8f7XNUYQm0VAVeLMro1A9RwcvAJOErf6CkHCEgIKElMevgdr5RUQlDg58wkLxBgJiY
  MvXjBD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVonVSUmZ5RkpuYmaN
  raGCga2hoqmtsoWtoZK6XWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYlCnF
  avU7GF+s/Kl3iFGSg0lJlPfiXMckIb6k/JTKjMTijPii0pzU4kOMMhwcShK8jSuBcoJFqempF
  WmZOcAIgUlLcPAoifAGzAZK8xYXJOYWZ6ZDpE4xKkqJ80qA9AmAJDJK8+DaYFF5iVFWSpiXkY
  GBQYinILUoN7MEVf4VozgHo5Iw7/0VQFN4MvNK4Ka/AlrMBLR47TtbkMUliQgpqQamtJPHNSU
  TkkOmJTz5sYSn98Wy427hFucN2c1fPa2MUHJkOFcvFtTwK3cB8/z1+efcTtu1Smnd2uJ6JvHe
  3L7VHQv2v52pOO+PNM8XEV6B5MQzft9vL1G5rJAUJrxh8k+N20qT5NffNRaPPbx4km+vTYbiM
  Yt959/48fzWlnC5FNf0MnVlo8IejiaGh6sCsydz2DzKapKdZ/Dzgk7vnIXcDhIXrDQrjjQ8nB
  t9x/fnDO7+rE8CSRyvDPwfx3x24T3sLMv24M3Mza2hkcoSQX4zIxRZardtPiz8+310uHpc8aT
  vd54xuHTFTxN9ed4/yPv07qUW3AK1l/ZdyZuxttDEcNrGste8oZv//3pzYraeEktxRqKhFnNR
  cSIAuyRrrEUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1648470613!273989!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32487 invoked from network); 28 Mar 2022 12:30:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 12:30:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BE50C10033A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 13:30:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B18201000FE
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 13:30:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 13:29:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.12.2 -> 2.13.2
Date: Mon, 28 Mar 2022 20:29:43 +0800
Message-ID: <1648470583-16659-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 12:30:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96237

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pylint_2.12.2.bb => python3-pylint_2.13.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.12.2.bb => python3-pylint_2.13.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.12.2.bb b/meta-python/recipes-devtools/python/python3-pylint_2.13.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pylint_2.12.2.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.13.2.bb
index 6407417d7b..9c699f8f2f 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.13.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "9d945a73640e1fec07ee34b42f5669b770c759acd536ec7b16d7e4b87a9c9ff9"
+SRC_URI[sha256sum] = "0c6dd0e53e6e17f2d0d62660905f3868611e734e9d9b310dc651a4b9f3dc70da"
 
 inherit pypi setuptools3
 
-- 
2.25.1


