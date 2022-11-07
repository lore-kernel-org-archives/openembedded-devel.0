Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D50C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:36:50 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.1260.1667810206203828284
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h5u0ZYCt;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810204; i=@fujitsu.com;
	bh=pbKlRFztqhRPT4hRAX8EdYpOllqa1oqPsFUgq7VPK3c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=h5u0ZYCtROdnlDfDRR3FtLR0B4O+Zf+SePifCpl9K6aCuqsNS108yyasBl0SnkFGA
	 cCkiZugjZAq0sNXOzJmhKr+JI6sUtppsL6143CZLdBgDeTqlit/qRG6VdwtTp2nQMw
	 UyaHu2pFMIrYXCd4HyVemHPIOjp7dvsjRIsaI3uWHcvkfUdQM1347iLeFwFe/OLONn
	 fhNvVArisjERyKer6c4/Bq6DkWxxmiTz3IcAkBcVHk8ptJv7sN7vE7H984RP9qFKDK
	 sglSfMxi901+98NnKdg+iyum7iHuyabcI3Kdlwce46PL/84cl6FvQgzyYwUKeCmNqY
	 AqbRMo9ZOzPZw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSXf24Yx
  kg1XbDCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oy3V7oYC6ZyVWxvu8HawLiCs4uRi0NI4Amj
  RMOlz+wQznUmiWuvD0I5uxkl3v5vYu1i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBI4v7qdYwgNgtQ/OK9lUwgNq+Ak8S6he/AbAkBBYkpD9+D9XIKOEuc27oHbKYQUM3N59
  PZIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrVBzVSTuHpuE/MERsFZSNpnIWlfwMi
  0itGsOLWoLLVI19BcL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMwfFOK2QV2MB5Z9kfvEKMkB5OSKO/v5RnJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4b
  2wEygkWpaanVqRl5gBjCSYtwcGjJMLLDownId7igsTc4sx0iNQpRl2OmV/bDjALseTl56VKif
  Ne2w1UJABSlFGaBzcCFteXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzRh4CmsKTmVcCt+k
  V0BFMQEdUF6SBHFGSiJCSamAqEt/gqPvItadckmHhz0Uzk8trvMUvP756se9ThsTbDd9f9rn7
  /EnwjZ9mKH1GVST1tOuy3ubsMKn6M6v427f2/8pwZLLzCxOeKl9VWfohtSp+l9Z60QO2/98w3
  NvLn2rkfeFP78MdAruMzqi97GrfskrgS/yd0LYN57Yy77nJ6Hyj+43WwZtNzfwbJJauVfq1/5
  LMpJM56T9uNJvuC3r2e/YDYT7VuN4E+U3+IlU8wU/nb9xT42GTlMo7IXKFVwXzE/c9K5R+Tdn
  zSGLR8pNhoi0Kj+01HRYxFDovm2jJ3L/tuczBTJ6yPy/LVbNZ4zW2mOcqT1yzdXbTzMDNm6+s
  CZ7vMr/i8a3T1ittxc2UWIozEg21mIuKEwElVlxdZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1667810203!320915!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11851 invoked from network); 7 Nov 2022 08:36:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:36:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6B9D11000D5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5F3A61000C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:36:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-greenlet: upgrade 1.1.3.post0 -> 2.0.0
Date: Mon, 7 Nov 2022 16:36:17 +0800
Message-ID: <1667810179-31041-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com>
References: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99464

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://greenlet.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-greenlet_1.1.3.post0.bb => python3-greenlet_2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_1.1.3.post0.bb => python3-greenlet_2.0.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.1.3.post0.bb b/meta-python/recipes-devtools/python/python3-greenlet_2.0.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-greenlet_1.1.3.post0.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_2.0.0.bb
index 342227c3f..b65a70e28 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_1.1.3.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_2.0.0.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "f5e09dc5c6e1796969fd4b775ea1417d70e49a5df29aaa8e5d10675d9e11872c"
+SRC_URI[sha256sum] = "6c66f0da8049ee3c126b762768179820d4c0ae0ca46ae489039e4da2fae39a52"
 
 inherit pypi setuptools3
-- 
2.25.1


