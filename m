Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461A3C4332F
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 04:02:14 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.7483.1636516932666312881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 20:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XajuXbL5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636516930; i=@fujitsu.com;
	bh=0y7yyjF4fSol1iyGKFDGxq+X0zYjVyN6qqXXx+H/y6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XajuXbL5F6oIkcESki8laINTLClj7LjFk5MRODkAAFk6Yeq83dVfB072/NC7lbvOv
	 VIL6UdJRrJlygCKHFb3LPee4uWmHPW2478OJqi0muOT4hKGTrLJRWEszl88EWQFRra
	 nMb+IdjrW2FTDXm43BdY8nIAUBvtSOreCokjSsctJ4xUZgEONy2SiE12cVRO82vXjm
	 d+z/9lzAmORKvE8azOxJr/gD7a1yaXS+8Y5SoEOU6ulK+EK79F0ErhWuIuqLQOiAQX
	 lg9SLGKMeoc9EqV/oKLTcsgYYGyLM1TdO16OSrOcsNZ8o0vg1PwrTxoz0gfeO2crs3
	 koLe0bmgB5nLw==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id F6/75-29929-1444B816;
 Wed, 10 Nov 2021 04:02:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqOvo0p1
  oMOumuMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHj2Qr2goU8FXcX/2JqYFzF3cXIxSEk8IRR
  Ytn+9+wQzgUmiRlTPkE5Jxgl3k17CeRwcrAJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw9Yj
  bBAoMTxzatYQGwWAVWJ/W+6mEBsXgEnifu/WhhBbAkBBYkpD98D9XJwcAo4S3y9KwwSFgIqmT
  vpGwtEuaDEyZlPWCDGS0gcfPGCGaJVUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRsukosz0jJLcxMwcXUMDA11DQ2NdQ10jIzO9xCrdRL3UUt3k1LySokSgrF5iebFecWVu
  ck6KXl5qySZGYAinFDI+2sF4+vUHvUOMkhxMSqK8B4S6E4X4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8KY7AeUEi1LTUyvSMnOA8QSTluDgURLhbXYGSvMWFyTmFmemQ6ROMSpKifP6gCQEQBIZpX
  lwbbAYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPeMI9AUnsy8Erjpr4AWMwEtPvilHWR
  xSSJCSqqBKW/C8vdGV/SX73L2DA7bv0lj+/UY44TVkRKfQ6sMdxyPmJGz5pvoJ6GJigVvXuXc
  qYs8LmR0bkvXQmFb1/syfMYah3jPbK2d8Z35bkSnyZOY8vZt6ml+awzD5zftca/Uu7r8ccnEn
  pwbRhb+QXvMNsalfar9ftvt8o3KDTr/PXW+ude6M2TbJsbo7f1Yw3tVsY7DI7rCYqp7jGPo7J
  bdGlukTi9q542QT5icx/VKeZnkxUNC96KqPn04dDp4z6uH3tsWmxySqv1lLXhH/6bAlIZ0q+/
  3AvgenlVh27mT0Xlt8YHVPC/zZKQK14TNv89a1Xb/zudr2p+ExOtcczedOlTUqdx8w4AxVmX1
  MntZJZbijERDLeai4kQAAV0vP1wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-228.messagelabs.com!1636516929!553088!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9821 invoked from network); 10 Nov 2021 04:02:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Nov 2021 04:02:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E0FEC100243
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:02:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BA5B4100237
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:02:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 10 Nov 2021 04:02:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-async-timeout: upgrade 3.0.1 ->
 4.0.0
Date: Wed, 10 Nov 2021 12:01:36 +0800
Message-ID: <1636516897-63008-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636516897-63008-1-git-send-email-wangmy@fujitsu.com>
References: <1636516897-63008-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 04:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93894

License-Update:
 Description of license is replaced by website "http://www.apache.org/licenses/LICENSE-2.0"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...async-timeout_3.0.1.bb => python3-async-timeout_4.0.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-async-timeout_3.0.1.bb => python3-async-timeout_4.0.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-async-timeout_4.0.0.bb
index b8ec02385c..ca61490fac 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.0.bb
@@ -6,10 +6,9 @@ is not suitable. Also it's much faster than asyncio.wait_for() because \
 timeout doesn't create a new task."
 HOMEPAGE = "https://github.com/aio-libs/async-timeout"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fa41f15bb5f23b6d3560c5845eb8d57"
 
-SRC_URI[md5sum] = "305c4fa529f2485c403d0dbe14390175"
-SRC_URI[sha256sum] = "0c3c816a028d47f659d6ff5c745cb2acf1f966da1fe5c19c77a70282b25f4c5f"
+SRC_URI[sha256sum] = "7d87a4e8adba8ededb52e579ce6bc8276985888913620c935094c2276fd83382"
 
 PYPI_PACKAGE = "async-timeout"
 inherit pypi setuptools3
-- 
2.25.1


