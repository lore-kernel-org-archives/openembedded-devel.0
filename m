Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC8EC6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:31:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.7361.1663641066760116412
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fuVZlG7y;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663641065; i=@fujitsu.com;
	bh=zbe8Avj5GS4aHliLrGmzxr8M0/0Jk6mBhBo5rf365BA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fuVZlG7yJzjCadha2PLIAq3BAnkJvpZPwxKStij8xgvyS4bPi+SVJYGYl/f0D9Bvd
	 3z4rykTUxv0u047d/7LB8MTER98zCHB1SZxS4Ig2gIQ+8dSvGgKYleaD/iXjH5xR+j
	 RaPxnWNCRA0eFYN1EZLTX2MuYqU1HTh5050AiRtYX/8FYpnbgTf/YJxioTQs55vjPe
	 P4HW2pIIghYygynRcXyNI6cg/j1eJ1mv6Ym3Iy1qFkEihnRA+Vc4tYPxDdInMBzBUa
	 eec9Hk6WKE+x+eCeYMKLuDc1j2K5tai5M6oK+LeKK9WUpbz3c0y4A2UGXTGNQVv3s0
	 qFqxNM4+Ivm/Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8OxWfeFqma
  ywfWf6hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b0Js6CcxwVNy9PYm9g/MzexcjFISTwkFHi
  w6cJTBDOFSaJJ50wzgFGid3P7wA5nBxsAroSL34sZgGxRQT0JZbO3sMMYgsLeEtMPDAFKM7Bw
  SKgKtH1SAUkzCvgLtG07g4jiC0hoCAx5eF7Zoi4oMTJmU/AxjALSEgcfPGCGaRVQkBRYvZ0eY
  jyConG6YeYIGw1iavnNjFPYOSbhaR7FpLuBYxMqxitk4oy0zNKchMzc3QNDQx0DQ1NdY0tgJS
  hXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYOilFKvl72D8u/Kn3iFGSQ4m
  JVFerjqNZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvPaCmslCgkWp6akVaZk5wDiASUtw8CiJ8
  MqpAKV5iwsSc4sz0yFSpxgtOabO/refmWM5mJz5te0AsxBLXn5eqpQ4ryVIgwBIQ0ZpHtw4WK
  xeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMy6kMNIUnM68EbusroIOYgA66oaIOclBJIkJ
  KqoFJZjnbrONab9T9ch2kki/d/t80cf3HDb/khQuErxirzjmquMJvUmgez/zvBT6dcVdfHrF8
  XjPDcl5Y6fmbecEWQS0q1mncJZuv+O0IF17fP0Ph2bo1DzTOzHoYvaigtVGxZAkja9Gq3fuCj
  1sYyIU+SVcw/cXtfu1b5tOuCy8ExA7/Svhzj2XFI9tNnxv8DgVLn7e9vcFdI0CuvUYmQkj+3z
  6GSdeSlWPl9zaYapd0rdhTo2auJybuE9rWZdXbeX+f0HmGCLuZFwMsg/bfFjp28HGDRfR8p1A
  hjWCTH67VElwzr0yUqfoVMu+ljzrbhh7L+fvEHO6s3mO8LvuxSsJJhyZGn7eiJlstz714KKXE
  UpyRaKjFXFScCACwL7aVUAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1663641064!32908!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15243 invoked from network); 20 Sep 2022 02:31:04 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:31:04 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5CECB159
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:31:04 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4FFB2157
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:31:04 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:31:03 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyzmq: upgrade 23.2.1 -> 24.0.0
Date: Tue, 20 Sep 2022 10:30:55 +0800
Message-ID: <1663641055-2585-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:31:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98898

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-pyzmq_23.2.1.bb => python3-pyzmq_24.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_23.2.1.bb => python3-pyzmq_24.0.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_24.0.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_24.0.0.bb
index ea6391f3dd..33e3ba6602 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_24.0.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append = " \
     file://club-rpath-out.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "2b381aa867ece7d0a82f30a0c7f3d4387b7cf2e0697e33efaa5bed6c5784abcd"
+SRC_URI[sha256sum] = "13b008bd142c9f6079ad75a30504eef2291502e9eac90e722b16fcf9ce856147"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest
 
-- 
2.25.1


