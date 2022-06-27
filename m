Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C33C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 07:00:46 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.39417.1656313240503532361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 00:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m0CbIBrV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656313238; i=@fujitsu.com;
	bh=sGklsbWJ6zn5s6JSOtXWP85d2zPw4iT9B0aKl1RLPeY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=m0CbIBrVwDC+r3UMY5GAFXqPASqPV6ugNylibQwkEw7BmVSwNrK/Ps/LjIUxDIcke
	 M5AoA1vccFg+6v3sMJw6QCCULqdMvx45b9dGHJ4B6ytOCvf17vQO6lH9TXSedxfCHp
	 LTnluE5etJcgE5yQkGreJROsAzjsSPxKDeTY2UyRvSTV58pSoVnOo8htc8Lvk27EGl
	 rNdubf205UQ57ipoymv3MeML79eZ6KUN3g10JCgKVb4ICLFn7dkAsNaLEx4Rhml5hi
	 ZBaL0Y51zhQxuplU3wQrT5jE2fFUU6pdpPOMXX7PX/VT4CuQ3yIFxKpMi2hhTxeJpI
	 RMbwTDa3ck7mA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqDstdGe
  Swc1FghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b7A/PZClq4Ku5uXsnSwPiGo4uRi0NI4Amj
  xJH+uawQznUmialH17NAOHsYJT5f7wZyODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFrCTeL/zAlANBweLgKrErm9g5bwCThKL9+0EsyUEFCSmPHzPDBEXlDg58wkLxBgJiYMvXj
  BD1ChKzL7czAJhV0jMmLGNDcJWk7h6bhPzBEb+WUjaZyFpX8DItIrROqkoMz2jJDcxM0fX0MB
  A19DQVNfYQtfQyFwvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwLFOK1ep3
  ML5Y+VPvEKMkB5OSKO8ptZ1JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4rUKAcoJFqempFWmZO
  cAYgUlLcPAoifC2eQOleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolzrs7CKhIAKQoozQPbg
  QsXi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZlA7mEJzOvBG7TK6AjmICO8Ju4A+SIkkS
  ElFQD03btHx/2Td0bKVo9L3RzzY959mKyaR87871EgotNlgRLn1nGPJPx5oGppe8t7pUEaVse
  jPs9L+Za57miZn7bOcXvVErDHsR1OzHdzBVd+JM1aMX+rQ75dsE8necaSu7WFj2Zwz6xl13M8
  PDLKjkJB4slNpILrsSl1nJrFj6Q4ao9sb7R9cbNT7cuRaRbTuN/lLW6pMv091UmCauyunzjBr
  0pz+wdfJ8VrCpqDvPg3bH/65f9KxS3u9XMvFIx51DiWWWmV2JzN8j4CSvtXJbkU/xx5vvqBTv
  e/N76rmLa66nZ9k8kErwE/kfuYPH/e8f4W+6p2bMOTbn2v5pHbfrx1n/GfzKZLvDvvzFn5Y1d
  okosxRmJhlrMRcWJAAFbQtRSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-548.messagelabs.com!1656313238!85695!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1565 invoked from network); 27 Jun 2022 07:00:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jun 2022 07:00:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D3296100199
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 08:00:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C6BE7100193
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 08:00:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 27 Jun 2022 08:00:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libzip: upgrade 1.8.0 -> 1.9.0
Date: Mon, 27 Jun 2022 15:00:23 +0800
Message-ID: <1656313226-23852-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 07:00:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97595

Changelog:
============
    Add zip_file_is_seekable().
    Improve compatibility with WinAES.
    Fix encoding handling in zip_name_locate().
    Add option to zipcmp to output summary of changes.
    Various bug fixes and documentation improvements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libzip/{libzip_1.8.0.bb => libzip_1.9.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.8.0.bb => libzip_1.9.0.bb} (92%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.8.0.bb b/meta-oe/recipes-extended/libzip/libzip_1.9.0.bb
similarity index 92%
rename from meta-oe/recipes-extended/libzip/libzip_1.8.0.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.9.0.bb
index 71072a592..6349b61bd 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.8.0.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.9.0.bb
@@ -21,7 +21,7 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f0763bda24ba947e80430be787c4b068d8b6aa6027a26a19923f0acfa3dac97e"
+SRC_URI[sha256sum] = "a17240ee88f0705a9067bb0087fde1cee73948b3cf6c3978a21a58fdb73b76a2"
 
 # Patch for CVE-2017-12858 is applied in version 1.2.0.
 CVE_CHECK_IGNORE += "CVE-2017-12858"
-- 
2.25.1


