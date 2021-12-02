Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1D2C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 03:42:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.3754.1638416534635692330
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 19:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wgbtaQdH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638416532; i=@fujitsu.com;
	bh=OdSHxvExaYBgk/pqkkYwT1XQluSAV9Mfi0qYwrxeUqg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wgbtaQdHGUMrFXQtcyMbxwNZJiMarnjRSdBcS7JwyJhKpRa3Di8+XJovkSVRNim5Y
	 zP3HPEVqV+RktDQ9D/ps0ZgvbiLdbxWVdrqSvdWOnJai8eh6+fnh9H4OKpsM40gL51
	 xLd8qNLvZgtugTi3VlI31IKdatfO/v9IBwXcI8oSmACuae9k09X32X4Av0K/4CSicZ
	 YGg8xGLsTSNt1w2ic5ATYR6NFl+9xJHPO/qyL0SS0jidRK8SLWcBI6tnZ0zANQsMAv
	 mC8sDEJihul1G7cr5F/B8mUHNWL5EnyVBKpwp2MjxeE+QY05q91kLL/QTiprhOR4Mu
	 pCA3Y9TvPnyAw==
Received: from [100.115.39.55] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id 3B/3B-16121-49048A16;
 Thu, 02 Dec 2021 03:42:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSXeKw4p
  Eg82/WC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy7l4+xF/zmrPi9Zxl7A+Mszi5GLg4hgSeM
  Ek//TWaHcC4wSZxed5URwjnBKLFlz2ogh5ODTUBd4vHN12C2iIC+xNLZe5hBbGYBVYnui2uAu
  jk4hAW8JBavLwMJswioSHw8swashFfATeLuw2tMILaEgILElIfvoeKCEidnPmGBGCMhcfDFC2
  aIGiWJEys+QtVXSLw+fAkqriZx9dwm5gmM/LOQtM9C0r6AkWkVo3VSUWZ6RkluYmaOrqGBga6
  hoamusZGukYGhXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYFimFCuc3MH4
  +9I3vUOMkhxMSqK8r1hWJArxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4J1oC5QTLEpNT61Iy8wBx
  ghMWoKDR0mEtw0kzVtckJhbnJkOkTrFqCglzhtnAZQQAElklObBtcHi8hKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYd619kBTeDLzSuCmvwJazAS0+PCs5SCLSxIRUlINTL668c4dW6/59O7
  b2ct2yvn9rC6vdD+jm1qdvyOuf8mub3ZV275dzuOUQ2Pn0SXvilRPfvO488ZxaaBb2w5pd7bG
  HekRAeUX9F7dX9T1KGeh/i/xO6+uLxW/9L/dau3nE38kl2naS2cYf+/Qq9ez6r1/bmLrWdl74
  VmaMq9bTpjMXzmtxV/jm+2lyZsU1xWVGiWu+/nObpp1Ko/hxh9mXbFzjpkyXD+0Sttq52WNY0
  Z23e7hAu6bnKeLtbc62+4tneNdJtS89mHNIql33J0fp0769S/OW/bPjiqNJ1PltNUrA9epr6n
  Ved2VX/163+PmuUf+xX/kWtnikGum51+usTXKKUSd81f1oZYJyxeVK7EUZyQaajEXFScCABLH
  fUJGAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1638416531!96047!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27912 invoked from network); 2 Dec 2021 03:42:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Dec 2021 03:42:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 74D2B100344
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Dec 2021 03:42:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6890E1000FE
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Dec 2021 03:42:13 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 2 Dec 2021 03:41:58 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 3.12.0 -> 4.0
Date: Thu, 2 Dec 2021 11:41:37 +0800
Message-ID: <1638416497-5910-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 03:42:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94169

From: Xu Huan <xuhuan.fnst@fujitsu.com>

See changelog: https://github.com/mongodb/mongo-python-driver/blob/master/doc/changelog.rst

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pymongo_3.12.0.bb => python3-pymongo_4.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.12.0.bb => python3-pymongo_4.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.12.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.0.bb
index 17975ff5d3..ea057c1804 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b88d1742159bc93a078733f9789f563cef26f5e370eba810476a71aa98e5fbc2"
+SRC_URI[sha256sum] = "6d158eadba3aaab276a3b188b7f467ab0384b68c1d31cfa87335e52addd9dcb6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


