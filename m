Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C0EC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:21:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.111510.1669616480342856640
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Wk5ZROKO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616478; i=@fujitsu.com;
	bh=3EaIZ/UXrR5mppHmrjs5ANVeQ+mmXEAo14cCoEXv7Ck=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Wk5ZROKOIPEWWd2LqUhkeKmB7Mm60MEMm+BdlU5APYDUpANQA9nLkWeCNAsoVofWJ
	 uk2dIwX663jjgqT3a/FuJHO97Rxi65w/b8NvHPM2UK581C9n5wiqlrRt0BiJq+Qz+M
	 t0b+fHQzxs6EgoM0hEC87qiW8oFd0aRVbGkcxQWjhwOF+9kfTFYukOFRIjxxGZnonA
	 EaKMcrEMGUGwesBurxXmAcz0PVwiDsLATBl0/nwr5HxqxLQSOqQG/RbUzzCenLlGwL
	 ZNWjT29Cau2+SDEY4aH8W9Tz1FizehMyEG5bHYz78pRrVnJX6mOVBuoej4zQUHI5q5
	 H35JV/506FLrg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8OxWTc2uCX
  Z4NMrLYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPPojOMBRu5K7ovzGVtYFzB1cXIxSEk8JBR
  4sPyH8wQzmUmiXtnGhi7GDmBnD2MEn17rUFsNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQWCJSa87wCzWQRUJbYc/Q82h1fASeLCj91gcQkBBYkpD9+D9XIKOEts/zORBWKXk8TrlZ
  1MEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNi1OLylKLdA0N9JKKMtMzSnITM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAsM3pTjl4g7GJ8v+6B1ilORgUhLl/RjYkizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  ncuSE6wKDU9tSItMwcYSzBpCQ4eJRHexfZAad7igsTc4sx0iNQpRmOOq1eu7GXmmPm17QCzEE
  tefl6qlDhvCMgkAZDSjNI8uEGwGL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3MsgUnsy
  8Erh9r4BOYQI6ZZNiE8gpJYkIKakGJqdP0Rov40KuCR1u/WleckLw7G7/3oa9XvUvRZilveeL
  l4Ysu3KfM6RuWqKbW9rNX3ypXYnc3afmnpwkW62/sXHl1hk/G+d4zrH0ncy1UDfx+ZI9hhE3K
  jcsLnM9LPzjW06rs6HMLfNq+dbiiZ3z30Yz/emzFw8+mnxpneDyuYXHmZsvX/Oz/vB4/dZ8uX
  cVVq7NyrKcW6fpvbQR+8ulkOqjwtIXr6cp8SFO6V7+reezFwSfXqi2eWNeUx1TZEvA6vNNm2Y
  qn2OONn35z7zs+efwonI+nwlND9mVa65W/ux0YJC7+2Qui9V0pWdJefGvQrZIpd9SY79hc+G2
  28NT2bkcy+oerF1swiz7xuKcEktxRqKhFnNRcSIAidVk8GwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1669616477!10452!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29708 invoked from network); 28 Nov 2022 06:21:17 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:21:17 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 26FAD150
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:17 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1A8167B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:21:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pybind11-json: upgrade 0.2.11 -> 0.2.13
Date: Mon, 28 Nov 2022 14:20:42 +0800
Message-ID: <1669616444-13316-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616444-13316-1-git-send-email-wangmy@fujitsu.com>
References: <1669616444-13316-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99813

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bug fixes
----------
    Fix large unsigned conversions in from_json

Maintenance
-----------
    Add Python 3.10 to build matrix
    Fix deprecation warning in tests
    Update CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pybind11-json_0.2.11.bb => python3-pybind11-json_0.2.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11-json_0.2.11.bb => python3-pybind11-json_0.2.13.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.11.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.13.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pybind11-json_0.2.11.bb
rename to meta-python/recipes-devtools/python/python3-pybind11-json_0.2.13.bb
index e06579a6c..67bd2a33a 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.13.bb
@@ -2,7 +2,7 @@ SUMMARY = "Using nlohmann::json with pybind11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98"
 
-SRCREV = "0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702"
+SRCREV = "b02a2ad597d224c3faee1f05a56d81d4c4453092"
 SRC_URI = "git://github.com/pybind/pybind11_json;branch=master;protocol=https"
 
 DEPENDS += "nlohmann-json python3-pybind11"
-- 
2.25.1


