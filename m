Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE45C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 05:06:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.4465.1638421577865405140
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 21:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TyfBKhqI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638421576; i=@fujitsu.com;
	bh=GcqIOnwxdX43cjrLTQS8LWvusLJ93vSE+cIqYvOOoyc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TyfBKhqIwtICY96/Q+KpJ9ULssMIXkBs6++40CozCB2O1Um6g5cI2HLyfjERJAM0P
	 gjlJZLZo2yWVisOGwwNR/zAMD8kI0ztgGaPe+oHus/LU/2ddkAvv7sjZXaAEN0g2dZ
	 FfmVhTpk8sxa6c4wpRjAQpeTZkL4N0VEeMEdl6BDDRP16K+rxGJiCPhwDzmWJMzFwb
	 b+a0b+24cO2TqwX7kndyl2CpBFXPUzoZrk19akM/nHPjgi+Ax4s4eIwk0j5nMWToj9
	 n8vxLZC8yqPvvFfGnANpZt2ollzUALc7dW0xRKvtNBt7ISEfqDrd82sU4jeWVWGAN+
	 Pz9+bXdLBNfrA==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 98/50-09145-74458A16;
 Thu, 02 Dec 2021 05:06:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYousesiL
  R4MBBVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP8j7WMBUs4K+ZdnsLUwHiEo4uRi0NIYAaT
  xPSJR5khnN2MEoenvmfvYuTkYBPQlTj3eC2YLSKgL7F09h5mEFtYwFViS/8zMJtFQEVixcEVr
  CA2r4C7xLPvT8BsCQEFiSkP3zNDxAUlTs58wgJiMwtISBx88QIozgFUoygxe7o8RHmFxOvDl5
  gnMPLMQtIxC0nHAkamVYyWSUWZ6RkluYmZObqGBga6hoamusa6FmZ6iVW6iXqppbrlqcUluoZ
  6ieXFeqnFxXrFlbnJOSl6eaklmxiBgZRSzBy2g/FP70+9Q4ySHExKorxOASsShfiS8lMqMxKL
  M+KLSnNSiw8xynBwKEnwPgwEygkWpaanVqRl5gCDGiYtwcGjJMI7PRgozVtckJhbnJkOkTrFq
  CglznsNJCEAksgozYNrg0XSJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvKkgU3gy80rgpr
  8CWswEtPjwrOUgi0sSEVJSDUxWua52t6M+1Qu+t5nccf+h0q0v/+9kr1ndmMEbOP1/wbkC833
  nrjCwPY9Ql/7SKNi5ePaN8w2nt3fttddWKma5+rztzZE1axjX939VU9Q8qrTgOL+h0IdNX3O9
  1xUfuOA+eUfO9HuTtta5MPEZCT1mrXzRcz3uV5b7GncPhclfXn9Ql7zFvubmPEfFyvC5vAoWF
  4PWpt4T+sgwZd0WkScXci5Mq3B0TGHce81ncbyv3Zltbcfz7+/h5ln51fW7SG6Gk8MCeeleV/
  FdjlsvR326+CsqWf1VxeLN/afd2J8V1R83/ZW1NK/Q34r56e736haFMy8tXBD/rWzWRJ38a7r
  Tpze+sb/kmOef7rfIfLGVEktxRqKhFnNRcSIA29DAph8DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1638421575!167064!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10000 invoked from network); 2 Dec 2021 05:06:15 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Dec 2021 05:06:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1B256Fh7032387
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Dec 2021 05:06:15 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 2 Dec 2021 05:06:13 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] python3-ujson: upgrade 4.2.0 -> 4.3.0
Date: Thu, 2 Dec 2021 13:06:06 +0800
Message-ID: <1638421566-2571-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 05:06:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94173

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-ujson_4.2.0.bb => python3-ujson_4.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_4.2.0.bb => python3-ujson_4.3.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb b/meta-python/recipes-devtools/python/python3-ujson_4.3.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_4.3.0.bb
index 3dbfe44faa..7949a636ce 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.3.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[sha256sum] = "fffe509f556861c7343c6cba57ed05fe7bcf4b48a934a5b946ccb45428cf8883"
+SRC_URI[sha256sum] = "baee56eca35cb5fbe02c28bd9c0936be41a96fa5c0812d9d4b7edeb5c3d568a0"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


