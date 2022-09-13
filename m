Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CA2C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:19:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.3068.1663064364431601042
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eFmK2lrX;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064362; i=@fujitsu.com;
	bh=779hIPJxLjJ4OQcuOJLBwG0mFcNI1SWpJDAueKPqI1g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eFmK2lrX/WpikO9Qu9+t2k+NxfIRKZCo493tdi3PHT449RCinaX3xQaXlpEbrJBeK
	 MQ/MlQQViIwkg0FrWLfo+C/8WQkyn7oPz6xa1IZMmV22gVnapysHfa/4LQv9ZY6jyR
	 jeJ8Zl95RjRJA717nkxuz9QTNmxk/1OJwkwbyBubSiOQdxMrIQ0QtUI9TgZYO5YWhe
	 SLM7rEBhKon80mLK6FAp3AwcWC5qcVmSE9lry34JdBdD6T7JoU1NW/mGOZmlp/Asye
	 b6XU2srY4UvYBqRxwfULabBNZqahtX3z/GM6+tuFUTtOvdA22+DaNNeLC9lJKVp2ge
	 t5fC4yuVMlztg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqKsVqZB
  ssHAip8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHowBW2glMcFasuT2VvYHzD3sXIySEk8IRR
  onFFehcjF5B9nUliysIbzBDOAUaJTf/fMYJUsQnoSrz4sZgFxBYR0JdYOnsPM4gtLGAvsbLrN
  9gkFgFViVvP57OC2LwC7hI3Gv8ygdgSAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvgOIcQDWKEr
  Ony0OUV0g0Tj8E1aomcfXcJuYJjHyzkHTPQtK9gJFpFaNVUlFmekZJbmJmjq6hgYGuoaGprrG
  lrqmRXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuck6KXl1qyiREYeinF6iY7GLtX/tQ7xCjJ
  waQkyhvppZAsxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3PgQoJ1iUmp5akZaZA4wDmLQEB4+SC
  C9PMFCat7ggMbc4Mx0idYrRkmPq7H/7mTmWg8mZX9sOMAux5OXnpUqJ8870BmoQAGnIKM2DGw
  eL1UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHklwoCm8GTmlcBtfQV0EBPQQUbW8iAHlSQ
  ipKQamAx1ts1Wb5SLCVitvHmXA/tUdSk+SebXc3MMWF69Eftg9+zMxN2vrgXnRbHp6r6+zprS
  G/j7lX70mu/LuefYrF7Bou3n/DgjoF81IPGEW2x+3Zpp82zCmYRmK2/mj3PvTPR5+XPzGqMkh
  rt2OfXuwfwBCYsVc39vu6l8/lftLv57/nvcNp/Z2V8smtX/4Img6vEkQT1b5uXb3/r0JIfs3p
  70zeJEzN7ZO3XTJ+865BZx5fSjI2vWnNJc+111XZ/dlPv+qZFu1zXvmk1JYT1XlHM9wvi6QSI
  nS9yRR7su/3lU++VSCIPhj6uaFXGLF35qO2R0MaH5xMtnbwV67zt+isuMnJP3N+bC4nrZ9zI9
  15RYijMSDbWYi4oTASsXFD5QAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1663064362!146153!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5206 invoked from network); 13 Sep 2022 10:19:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:19:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D2C43100191
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:21 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C655510018D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:21 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:19:20 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.7 -> 4.3.8
Date: Tue, 13 Sep 2022 18:19:14 +0800
Message-ID: <1663064354-5355-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:19:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98775

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.7.bb => ser2net_4.3.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.7.bb => ser2net_4.3.8.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.7.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.8.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.7.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.8.bb
index 13ce13a0b9..c8108d6024 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.7.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.8.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "542915e240ae8b5c7dcec8d1589e6067818532900d45cfef226cea9f0e671d13"
+SRC_URI[sha256sum] = "e5620975523059a38709bb53c0567600adbbcb8011066a2d2fe1b4db9efe0ba3"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1


