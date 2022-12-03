Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAABDC4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:20:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.101818.1670066429585815207
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ND+X/IqR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066430; i=@fujitsu.com;
	bh=nMCdHJYYZkLYT4q7OiFxrwe49W5zQIX6SvC1zIuWW0U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ND+X/IqRL10TVBklAfbfDAhvpF60VF9wgpVoRKpvI3ka79bGfwEBrdbnTT7wKdqQp
	 BK09JKURAnS9VcubJ118/t6DJsWF/KYxw6nN/O50xOxmVIiW/Yw6P7syur8FiOMk3o
	 8ctphtvMWhQ0s95IyUW/GMJzGBmRy32NfE+TY8e2tymjYeE32JA28fIqQ2SL9SqPZp
	 pkmI5FWpspsLnYdZIn6ORUy1vxN/3NPs31oDWcLwUw0froR/myQQa3wdvEftFSg4vC
	 ro6nEyK/x0JvY5CkVm98FL6zms83aw3+Sly65HrCyyLD8vfm6QC0alX24ZTcy4ia0G
	 Q67vwycnwrjcg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWfevQXe
  yQWOHkMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFoUiNTQQ9nxZUnc1kbGKdxdDFycggJPGSU
  2HzRq4uRC8i+wiSxvO0iC4Szm1HiTe9sVpAqNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQUcJbb+3sIIYrMAxbd1v2UBsXkFnCTO3z0NNkdCQEFiysP3YL2cAs4SXRsXs0Jc4SQxuW
  suVL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkaz4tSistQiXUNjvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pVpyxg/Hfsj96hxglOZiURHmPhXUlC/El5adUZiQWZ8QXleakFh9ilOHgUJLgD
  dTvThYSLEpNT61Iy8wBRhJMWoKDR0mEt0sVKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKX
  FeJZAZAiBFGaV5cCNgUX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvmB7QFJ7MvBK4Ta+
  AjmACOmIjfxfIESWJCCmpBqaUdffsHq4PrukuqOrSnHt5cu7El1uZN58101E98a/gch7XGY4z
  fWd+PY6bb1x2q1Iv1G/1JiuOzdtUDVJNXQNfbjvXcft//UvZ0DtP3L+evT/vme5HhWkbNDiEj
  /4tnBhU28qrU8e5XYXpeu6eg2s527K499nyCO2pvH+5+tTueUpS7ltfNDw++sOk9cd/tv8nU6
  sfGBomStq1PFK+92brrB7LrfwtUzpimuV7ed7O61bO5dvA3XdH/HJ23d64BpWrt54wPHiRoC9
  hv9pCSUlZv9dKfL9tzm2Tm/9LDWU2zfk1r1GEs4in62zNsZYel4zsf7kSTX3d841rHv+Yc8Lb
  Prup9p/RWvddEtPrJiuxFGckGmoxFxUnAgBMFy0JZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1670066429!44665!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19790 invoked from network); 3 Dec 2022 11:20:29 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:20:29 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0B2A5157
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id F2E3B153
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:20:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.2.36 -> 1.2.37
Date: Sat, 3 Dec 2022 19:19:55 +0800
Message-ID: <1670066396-24989-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066396-24989-1-git-send-email-wangmy@fujitsu.com>
References: <1670066396-24989-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99939

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog;
Fixed two regressions from 1.2.36 release: issue #437 and issue #449.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xmlsec1/{xmlsec1_1.2.36.bb => xmlsec1_1.2.37.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.36.bb => xmlsec1_1.2.37.bb} (96%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.36.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
similarity index 96%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.36.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
index 370551b15..bd9c584df 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.36.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://ensure-search-path-non-host.patch \
     "
 
-SRC_URI[sha256sum] = "f0d97e008b211d85808f038326d42e7f5cf46648e176f07406a323e7e8d41c80"
+SRC_URI[sha256sum] = "5f8dfbcb6d1e56bddd0b5ec2e00a3d0ca5342a9f57c24dffde5c796b2be2871c"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.25.1


