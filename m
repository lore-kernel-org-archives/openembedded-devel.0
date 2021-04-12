Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.28295.1618204702460653701
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Apr 2021 22:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QyJFazZ8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618204700; i=@fujitsu.com;
	bh=JA/jL/KTfqZEbq8bcRG4g+zLQ4reM+8pME70/W6fj1I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QyJFazZ8NvtUM8lMXSz0cAXG6nfr9a7Zvt+A+cqxRN0jYD+LADW1eLid/Bvf+Rw8R
	 HWxQ5m/aycS7np3M9eDCvTgGpwwYkJ90Rnh+9kyI5SlruTmMwRsgs0S9BmPhpceKCP
	 6Tzte5qboyHWEAoUvqxkQlhQes4yRrgGrGQgRsCXrHyUGkDQUK3ncEsdPbnz5hW+OU
	 eP5/Ihb4boFs0JKGz72SOXBID0Wvh5wUqnlqXtaFP4lDuNs6flVwTOJeA3SkLtIy24
	 igR/5Q/6IbXn9+11zCcslGS65cK3x84wbgtbXLCCHQdWdG5t48BuDwlhywrGU8duwJ
	 iuqj9NP2Uy5/A==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id C5/AC-38244-C18D3706; Mon, 12 Apr 2021 05:18:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0ZW+UZx
  gcLnDwOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzTj3+ytTwU7OiosP7jE3MD7k6GLk4hASmM0k
  sbBvKiOEs5tRYt+R7UxdjJwcbAK6Eucer2UHsUUE9CWWzt7DDGILC3hJdM14ywZiswioSrw/9
  AQszivgKfH35kFGEFtCQEFiysP3UHFBiZMzn7CA2MwCEhIHX7wAinMA1ShKzJ4uD1FeKbF92l
  nGCYw8s5B0zELSsYCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhsa6RrqmhXmKVbqJeaqlucmpeSVE
  iUFIvsbxYr7gyNzknRS8vtWQTIzCMUgqZjHcwXnv9Qe8QoyQHk5Io7zen4gQhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKErwp14BygkWp6akVaZk5wJCGSUtw8CiJ8PJdAUrzFhck5hZnpkOkTjEqS
  onzvgLpEwBJZJTmwbXB4ugSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeLyBTeDLzSuCmvw
  JazAS0+OLWQpDFJYkIKakGJiW+pT4Lmvc4RKXnF/zyD8i3PXzQ4DHfmaN+O5v7dou8ee6wqSn
  yvHrbxyvJ5vJ7N9RfeLtQ1PdS/4qsNF3p1xWKkp9mv7CviZrfNNtcVUqpiam6W15z3pycnhc7
  Zn078V67gdtxV+atnpvTRJcemCz3j2MCR9DL7XUrwpjfhn4TzV6getz/QxtTXnekb96KJ9dlO
  c8usjBrYo71f/b07ZYPh++4WU8RqT7e3J4hl7fGV7XO+LHZXeutBUU+v5eW9l5dFvFizl25oG
  OGPEvt1iTrNjfetvs0j0mk4vp7Bdu6BylL/t+RfHOrXfER2/7us0zeBhxlbb/Dd2rXX1vUG/e
  gbXpPdLmx7nnxGdkSSizFGYmGWsxFxYkA2rcSoR4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-232.messagelabs.com!1618204699!1257721!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21341 invoked from network); 12 Apr 2021 05:18:19 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Apr 2021 05:18:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13C5IC8i005359
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Apr 2021 06:18:19 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 12 Apr 2021 06:18:11 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-absl: upgrade 0.10.0 -> 0.12.0
Date: Mon, 12 Apr 2021 21:49:55 +0800
Message-ID: <1618235395-126945-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-absl_0.10.0.bb => python3-absl_0.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.10.0.bb => python3-absl_0.12.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.12.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_0.12.0.bb
index 5be00ccb4..2ecf10caa 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_0.12.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "9cb38ddf7a2f000e2c92e5d9dfa36ffa"
-SRC_URI[sha256sum] = "b20f504a7871a580be5268a18fbad48af4203df5d33dbc9272426cb806245a45"
+SRC_URI[md5sum] = "cfc383e2c647698666a7c5d8ef83a675"
+SRC_URI[sha256sum] = "b44f68984a5ceb2607d135a615999b93924c771238a63920d17d3387b0d229d5"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.25.1

