Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082C7C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:36:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.5223.1637033777275862715
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e1WW7Jfh;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637033775; i=@fujitsu.com;
	bh=sjO1uIJ7y3bZlA70fS5wexagUizZ8RURrlg/rRdX+T0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=e1WW7JfhYvbqVQtQGzXrrZk4qVVuD1m9XsYDiYl8Kq70lDPDpvyAcyiUEcHF3oAf5
	 CFvI+/xo0yT+W4VZmvLRDpbgEmHVBNzCYPdOFXLLei1hM/MKjEgAdAKW+0FWXdUY3D
	 GynGbiNPHxIn49VAo80MvLXkaoMDbdH+wZ1G5rkXOQrJhx07gzhMa5aXL5UEF8XLur
	 JnvbBWeYMk2Er6SOIfj08/ukAquNwtQ0awdvj9rDxUjTskJXsCuRkpdnadTbr4zRHG
	 +BXzDij/rsW43s0aY048UpIvITHjCS30Zro8MmbclngeTxzK5hVIrWQx0ur6prwLjI
	 9klnQVX49uyNg==
Received: from [100.115.36.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id D8/ED-01854-E2723916;
 Tue, 16 Nov 2021 03:36:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MxRVdPfXK
  iQc8PaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNU81mmghlcFdtuvmRsYJzH2cXIxSEkMJNJ
  YkrDbuYuRk4g5wSjxOJVISA2m4CaxPRbN1hBbBEBfYmls/eA1TALqEi8+N3DDmILC3hKvN1zH
  izOIqAq8fj0UbB6XgEnicW7L7OA2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL5ghahQlZl9uhq
  qvkJg1q41pAiPvLCQts5C0LGBkWsVonVSUmZ5RkpuYmaNraGCga2hoqmtspGtkYKiXWKWbqJd
  aqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYZCnFCid3MP6+9E3vEKMkB5OSKG/cokmJ
  QnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4H6lMThQSLEpNT61Iy8wBBjxMWoKDR0mEV04RKM1bX
  JCYW5yZDpE6xagoJc77WAQoIQCSyCjNg2uDRdklRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSs
  K881WBpvBk5pXATX8FtJgJaLH9vX6QxSWJCCmpBqZ4zSLGTRcvfD5c8Xp7voZhVsHVGE/zh5m
  5LK6uLA1e/SHLV0g8/jL7QvCjGn2b1Nw2731fxc/uWDNri//mc0cWGBgfvlWTsmHHSleGhnbe
  hg83Grckbag8fn4yq9VCOZawZAt3w6Un11jWP9BT/Vu1x37bndxN32fkJl11WRx88XLf1idaw
  gv3d/Eamdz5/jzt5d9Ji3rjVxy+ySn/Mn7jgjkXvnq8X352imXRRIVTpd9lFthv8vqh0c4rpF
  mYdmmxW4es8YqHu3pZD3O7nmErUGo4HRh8kP+z6M2MqMM3hcITjrttXMCduE/Y2CzI7qqQ/vq
  bDvp7/8zNadnl8qPiRKxFhPy3GN+lQVffzRRVYinOSDTUYi4qTgQAgCxAFy0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1637033774!66429!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24696 invoked from network); 16 Nov 2021 03:36:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 03:36:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AG3a6iP025393
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:36:14 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 03:36:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-absl: upgrade 0.15.0 -> 1.0.0
Date: Tue, 16 Nov 2021 11:35:53 +0800
Message-ID: <1637033756-81253-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 03:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93963

Changed
absl-py no longer supports Python 2.7, 3.4, 3.5. All versions have reached
end-of-life for more than a year now.
New releases will be tagged as vX.Y.Z instead of pypi-vX.Y.Z in the git
repo going forward.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-absl_0.15.0.bb => python3-absl_1.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.15.0.bb => python3-absl_1.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.15.0.bb b/meta-python/recipes-devtools/python/python3-absl_1.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-absl_0.15.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_1.0.0.bb
index f25201dc3f..736e6a9444 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_1.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "72d782fbeafba66ba3e525d46bccac949b9a174dbf66233e50ece09ee688dc81"
+SRC_URI[sha256sum] = "ac511215c01ee9ae47b19716599e8ccfa746f2e18de72bdf641b79b22afa27ea"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.25.1


