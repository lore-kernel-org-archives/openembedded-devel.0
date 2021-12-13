Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7217C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 14:46:10 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.11987.1639406768884470973
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 06:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Iibq3WI8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639406767; i=@fujitsu.com;
	bh=RVkXEKyfYlK4k4CpdRedf64fBckYO0Wqj9LZentz+rA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Iibq3WI8lM5TjfvpuUgXEfdrQ3NunZ3Ataj6wEYBpjHElhRwiA3Jffm2R15QJKy+8
	 TQh0Uzqti9fUvGolfhFohnYZG7r1mEFrFaIRs/VARlQhCNfjfr22qL2rLubxDhv75m
	 RAnqXyeRTbJuoBRcamJI9yr+f6y4MnXb4NkVesRuUEvWdK+dfWKeyfJBdPrx8d5GnT
	 DDC3/qNGXQL6fEO4AqI7Wf2Q8Pg431Lu2Y07fr7GwiAME6jdcpOqgra3fo1JYX+Ysv
	 YVdiVVCndaR9M2RuTWSqTp5EQ4iSO2wjtz8/wk6GeY9eWBCGBEjN7iWHGlm2/hkDef
	 4jcoyRsBUZJzw==
Received: from [100.115.71.165] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 62/D6-11258-FAC57B16; Mon, 13 Dec 2021 14:46:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MRorsuZnu
  iweJ7WhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZbWeYCho5Kg6dO8bewLiIvYuRi0NIYCaT
  xLrXj1ggnBOMEmtOdjJ3MXJysAmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8eoG4ODmEBe4npS
  2pAwiwCqhLT3zaBhXkFnCQaJiWBhCUEFCSmPHwP1skp4CzxbU0HmC0EVDL32lRGEJtXQFDi5M
  wnLBDTJSQOvnjBDNGrKDH7cjMLhF0hMWtWG9MERv5ZSFpmIWlZwMi0itE2qSgzPaMkNzEzR9f
  QwEDX0NBU18xS19xEL7FKN1EvtVQ3OTWvpCgRKKuXWF6sl1pcrFdcmZuck6KXl1qyiREYlinF
  rl47GI/0/dQ7xCjJwaQkyhvMuj1RiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvmXCgnGBRanpqR
  VpmDjBGYNISHDxKIrwfIoHSvMUFibnFmekQqVOMilLivN7RQAkBkERGaR5cGywuLzHKSgnzMj
  IwMAjxFKQW5WaWoMq/YhTnYFQS5v0fBTSFJzOvBG76K6DFTECLGSs3gywuSURISTUwdSxRmrh
  d9cOf05+ZTnjKX3gt8vz/zfLl065trbfdyHND83tmS4/qwVO317TNMlbNWqnBrS28rfKc5oU8
  uTsLU0Otww/t+GEnK5/UEtIYLCD8kTNeVp/3y44lX+tr0577Jl20i76QZix2YR3HCtngGcIsr
  jnTGKuedaz/UnjyRmFfTsrRmzzVZqymkV+OXq7dXRK0UpaDuzt1qoD67vWlyd6uWzpPx3kq3D
  EwqZrd+rb4klXs/ovLG7rOrJZ8UCdhJvTrV0PUikSj9bu87bYtUpseWXYuPkmhdi9n0NN/vtM
  der8JRi98/pPN4s2iBVs+7Y16d8ZiR8Xh7ypR60tSd9TdVXluySd4Wf/sOf9rSizFGYmGWsxF
  xYkAMjcDN0YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-532.messagelabs.com!1639406766!8521!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18393 invoked from network); 13 Dec 2021 14:46:06 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 14:46:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BDEk0ol030423
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 14:46:06 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 14:46:02 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libgusb: upgrade 0.3.8 -> 0.3.9
Date: Mon, 13 Dec 2021 22:45:33 +0800
Message-ID: <1639406733-28016-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639406733-28016-1-git-send-email-wangmy@fujitsu.com>
References: <1639406733-28016-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 14:46:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94331

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgusb/{libgusb_0.3.8.bb => libgusb_0.3.9.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.8.bb => libgusb_0.3.9.bb} (89%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.9.bb
similarity index 89%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.3.9.bb
index 51e7349043..3fdb2b7d3d 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.9.bb
@@ -10,5 +10,5 @@ PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d
 PACKAGECONFIG[vapi] = "-Dvapi=true,-Dvapi=false"
 
 SRC_URI = "git://github.com/hughsie/libgusb.git;branch=main;protocol=https"
-SRCREV = "db9edbd8b45662d551194a0985173732f8f557a5"
+SRCREV = "582f33178a986e74543de8ced087865009f8fef0"
 S = "${WORKDIR}/git"
-- 
2.25.1


