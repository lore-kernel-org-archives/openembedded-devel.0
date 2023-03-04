Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD7CC678DB
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:07:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.6883.1677928020308543380
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Od41GUu3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928018; i=@fujitsu.com;
	bh=ftit0wrsuBGqBUoB9iEa7OeDns1RC1u23q11S1E2XPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Od41GUu35zIEWYVGbWVJKYJGfZwIsCry5TboGzdTxQrYUxe40q08AG+lNntlpjP/Y
	 dtwZz/6RxDmOEKwfBv7zMl4/6KUgxOcxWbylEV+5JMMD0xy37eI1DFe4bzrF+g+Aiu
	 F+4KwdCfodbcLYKB/nClESV9QfVEGcSoHfDYmEqVtjvl2jRGUVcgBoAYdcpwzYyhJP
	 gBD434QJZOYQTejCBa9kiMIJWVCVLvVrWj0cxNlAQgtFrV6YehwutJAVp3sB/uUjPd
	 vT7qekEYQGr4kH53/h0pa9dStcdL6dq6g9zVl9vrjaSutSjFoya/h+pPaoPbLi/w1E
	 bTuz9u0jNRzGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORpBuoxpx
  isOGFicXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFo5ybWgo/cFRdm7GNsYLzO1cXIxSEk8JBR
  Yl/nPCYI5yqTxIbGs1DOHkaJm5tPsHUxcnKwCUhJ3Lj/H8wWEdCXWDp7DzOIzSygIvHidw97F
  yMHh7BAoMTDmQ4gJgtQ+O1vERCTV8BJ4s0OXZBiCQEFiSkP34M1cgo4SzT9+wRmCwGV3Hjfzg
  Ji8woISpyc+YQFYriExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQtTi0qSy3SNdJLKspMzyjJTczM0Uus0k3USy3VLU8tLgHKJJYX66UWF+sVV+Ym56To5aWW
  bGIEhm1KsWr/Dsa1vX/1DjFKcjApifJOYmVIEeJLyk+pzEgszogvKs1JLT7EKMPBoSTBK6PKn
  CIkWJSanlqRlpkDjCGYtAQHj5II7xYRoDRvcUFibnFmOkTqFKOilDivgDJQQgAkkVGaB9cGi9
  tLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5t6gATeHJzCuBm/4KaDET0GKN0wwgi0sSEVJ
  SDUw++8W4lkasnCB5y8me/4nbsitJX67NPrrWQ/AYV06g5P+NXcpxuSa5kXaVCfYiQmEJL0zP
  PVbu7FAsTVw7NXdZwY7C5Bjhf8xh1iqXYhVN31Ve0tWSNyv5ta20UluzvbVzasC8qsATX631H
  nwWZVL5fKxjt8+BQ5xxgQb+kf7Xltq4Cc0vezl7T98f3TvbQzJ92LrP/NYJ+bvsYqTrFymRUq
  mYoMib24ozjz9Y6yXZwj7Vk5enJJZN59k0Kc8s9tMFm2Z47nyQoLq7yqG/ybnhXlTH4XO/p88
  WZTTv+x2YoL42xfWJeMt8/fJS7inCYjo+1lbSmQFlVa9+cvRkP8x/tXe9MYu2bqU5+2klluKM
  REMt5qLiRADeefJ7VgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1677928017!148569!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13591 invoked from network); 4 Mar 2023 11:06:57 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:06:57 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 92A8D1BA
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:06:57 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 86CBE1B3
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:06:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:06:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.16.1 -> 2.16.2
Date: Sat, 4 Mar 2023 19:06:42 +0800
Message-ID: <1677928005-22986-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928005-22986-1-git-send-email-wangmy@fujitsu.com>
References: <1677928005-22986-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101367

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
=========
    Call gcloud config get project to get project for user cred (#1243) (c078a13)
    Do not use hardcoded string 'python', when you mean sys.executable. (#1233) (91ac8e6)
    Don't retry if error or error_description is not string (#1241) (e2d263a)
    Improve ADC related errors and warnings (#1237) (2dfa213)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.16.1.bb => python3-google-auth_2.16.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.16.1.bb => python3-google-auth_2.16.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.16.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.16.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.16.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.16.2.bb
index c70abb047..b5f2b7e76 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.16.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5fd170986bce6bfd7bb5c845c4b8362edb1e0cba901e062196e83f8bb5d5d32c"
+SRC_URI[sha256sum] = "07e14f34ec288e3f33e00e2e3cc40c8942aa5d4ceac06256a28cd8e786591420"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


