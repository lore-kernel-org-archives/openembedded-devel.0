Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5B9C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:29:44 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.7394.1663640975787936521
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UfNae49L;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640974; i=@fujitsu.com;
	bh=OyaZOkRcZVfXo7opgA9NftYxJvdvVFrdV9FaxsPjCSA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UfNae49LYDYPs9177piAz14yCPOSADED8qTHhvuMeL+gH7nbm8pRW6nShmfDYXxzY
	 37GYbQ896aoL1m4e0lGA86bTKnoQmDDlnt3TxcapqbQhOtDCwQSU/MkIIJr8H7PSVJ
	 wENRj0CZBG70zmNYkgjwx6FR5427gbJDRXp1lO25X61ALW9LUhfmItln+lgVxUT/Ey
	 9Dp5/ZqD8guurFi5y54X1CxOtXmND0Rq/8GEIyiCYieJX12Ox3TFibqmILzTqD+dWR
	 qdEzPTN25OJnoXlS1v7cFbcK/se9OjVjHFhX4xIY5grYxMmk5KUon72fo3KdV4Eo7y
	 mCoAEGGo3aPJw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORpNurqpl
  s8P2ipMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtH/+gFTwTKuiinLbRoY93F2MXJxCAk8ZJQ4
  /v8hE4RzhUmi98cBFghnD6PEpM47zF2MnBxsAmoS02/dYAWxRQT0JZbO3gMWZxZQkXjxu4cdx
  BYWCJS4vXs/I4jNIqAqMf/eebB6XgEniZkf9zGB2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyQapx+C6lWTuHpuE/MERv5ZSNpnIWlfwMi0itEqqSgzPaMkNzEzR9fQwED
  X0NBU11jX0NJSL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMChTipmP72Cc
  0vdT7xCjJAeTkigvV51GshBfUn5KZUZicUZ8UWlOavEhRhkODiUJXntBzWQhwaLU9NSKtMwcY
  ITApCU4eJREeOVUgNK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlRLntQQpEgApyijNgxsBi9
  ZLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5OZWBpvBk5pXAbXoFdAQT0BE3VNRBjihJREh
  JNTCJnREpvPjYrW7bvAkxspveZvi2vVCKDEjdJyUslRpRF3Epx0CpvmCJzKHrVbXOIm4R5e4S
  wh/YjZc9+rh4y9pNrqWMdybHC3vP//z6ociZY0qTfV3Xeor7pfKoHf/+tfbnhRuLl/74euQZT
  +6Xr3Nqc/6fjJq/7eL2sGf8f1R213976ZcQmpr36FLn733Rs7i+zM6eqOkV0Mr2o2uT2Ba3lr
  82/DMVt8vf37/kZtD6bl1x48bHe9W42NynaagwfP2nXiH0wuHL6zy9yROZEkyOtz5Q8M6XMDs
  77ZrlZfkzMcdPcdSfvfk21/fhLNUoq8RzP5du+Gz7d1eHi+hy7bvT6heE58usv6DU9InrWPAJ
  JZbijERDLeai4kQAd5tdKlEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1663640973!307049!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19870 invoked from network); 20 Sep 2022 02:29:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:29:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 105521B1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:29:33 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 055C51B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:29:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:29:31 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jsonrpcserver: upgrade 5.0.8 ->
 5.0.9
Date: Tue, 20 Sep 2022 10:28:59 +0800
Message-ID: <1663640939-27864-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:29:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98892

Changelog:
=========
  Remove unncessary package_data from setup.py (#243)
  Use a custom logger when logging exceptions, not root

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-jsonrpcserver_5.0.8.bb => python3-jsonrpcserver_5.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_5.0.8.bb => python3-jsonrpcserver_5.0.9.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.9.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.9.bb
index 88b1d6856e..7e058a757b 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/explodinglabs/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61b63ea9d36f6fb63ddaaaac8265304f"
 
-SRC_URI[sha256sum] = "5150071e4abc9a93f086aa0fd0004dfe0410de66adfaaf513613baa2c2fc00d7"
+SRC_URI[sha256sum] = "a71fb2cfa18541c80935f60987f92755d94d74141248c7438847b96eee5c4482"
 
 inherit pypi setuptools3
 
-- 
2.25.1


