Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E647DC6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:10:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.8825.1664269798212117554
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W7/ec/vD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269796; i=@fujitsu.com;
	bh=w6gGv42Tvz5ZuLDDCDKHYjNvxVFTU4uklIBAZIxrNVc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=W7/ec/vDj5BnLRI/OFrZTySVIkzqe/Do4ST023cEwWQwLvCgyHR7hMT/UkI5591MY
	 4SkoIXPN79/w/Z8WSlMGB8UZmVFR8I5PAvaf0l9on/Iy4JJ27jeQiuYQm0qMpBF1oT
	 PjbNbxlm9+iDy8Ge/s79+eyO4nFmivthGmXztKVqkiKYBA5Z9cvWIUqK2288SA0+MC
	 zw7osl7G/2hQT4J8QvpD3P+SayG5riXbrtTne9NDYAbQJsGLcHgBqzBeefER1uoxUu
	 dlSQHtZ8mk4WKsm1zzMMqkg8qW8owTSzPryfplK/5zMeCke/bmG55fsy6VO0J/iSl4
	 Oq+NLOTJlZ8Gw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSffxXqN
  kg2fXzC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyJ198zFvRxVLx4+4OxgfEQexcjF4eQwBNG
  iXWfrjJDONeZJJ6c3cEK4exhlLh8+yhQGScHm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373g
  NUIC3hKPOtezgJiswioSvT/WcfWxcjBwSvgKNH/wA4kLCGgIDHl4XuwVk4BJ4kPd7uZQUqEgE
  r6WhJAwrwCghInZz5hgZguIXHwxQtmiFZFidmXm1kg7AqJxumHmCBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYbZKKMtMzSnITM3N0DQ0MdA0NTXUtzXSNDA30Eqt0E/VSS3Xz8otKMnQN9RLLi/VS
  i4v1iitzk3NS9PJSSzYxAsM4pTjh0g7Gdft+6R1ilORgUhLltV9klCzEl5SfUpmRWJwRX1Sak
  1p8iFGGg0NJgldyN1BOsCg1PbUiLTMHGFMwaQkOHiUR3nVLgNK8xQWJucWZ6RCpU4y6HDO/th
  1gFmLJy89LlRLnNd0CVCQAUpRRmgc3AhbflxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ85r
  uAZrCk5lXArfpFdARTEBH2PHpgxxRkoiQkmpgMm0+xV+/dNUXp6YTc9jnFG3PcdH4e0jZojXw
  deOlV20JsjoOQXPFl/9IvjT7U8OB6W+OPdgeXmF/4qJbldV1B4WL1VsXPvgm6zZV8oks00+ml
  zz5We5aP0yq1hbNn9inKnnI13TFX2l987KUjW7dtrE6UR126ormrYpTlrbENynMj0h67TjV/f
  gn9umXfWMXa0sLl3z85Fsv9m6RRP6FmhXv/vFbFmu5euetWeJ+dlq0gaRDAceC5bq3XjPqlt8
  /9O1I7v1bE+6rPrtxa1GEnNrjyguKbIv799odjb4udVx/sn/9wk/rLZwWfFDY6e8u7n507es0
  h6ydRQc3aNw+kdbxaBOvRS5z99tjIXMeKLEUZyQaajEXFScCAAjbmNpqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1664269795!251745!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7225 invoked from network); 27 Sep 2022 09:09:55 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:09:55 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 58D5F1000CD
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:09:55 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4B0B41000CC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:09:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:09:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-h11: upgrade 0.13.0 -> 0.14.0
Date: Tue, 27 Sep 2022 17:09:38 +0800
Message-ID: <1664269780-2655-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664269780-2655-1-git-send-email-wangmy@fujitsu.com>
References: <1664269780-2655-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:10:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98981

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-h11_0.13.0.bb => python3-h11_0.14.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h11_0.13.0.bb => python3-h11_0.14.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.13.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-h11_0.13.0.bb
rename to meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
index afc6439654..7bda0eae18 100644
--- a/meta-python/recipes-devtools/python/python3-h11_0.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h11_0.14.0.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f5501d19c3116f4aaeef89369f458693"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "70813c1135087a248a4d38cc0e1a0181ffab2188141a93eaf567940c3957ff06"
+SRC_URI[sha256sum] = "8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d"
-- 
2.25.1


