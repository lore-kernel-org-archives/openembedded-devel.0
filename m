Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED52AC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:11:26 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.3919.1667877085527006046
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SIQ69FZq;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667877083; i=@fujitsu.com;
	bh=RiXV+gBHmBrXsZ7O9QyNePMc3BzqPoFewPcK1PvTpi4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SIQ69FZqNvGFC11RJJIzqYsu+NNuEy0j8ERW15YcDU8zipJMDgkcGskPXKEE/A91t
	 62IZkd/JGoH/uHuLJ96iVmTlIU0GgmqsjQpSQZRmMKa0Xan51H99k/6hnw3DFr/a2V
	 wbavDaSzWiwfB6ZOUMxqaLAnLpqhdL7P+bLFNkg8g3fhgOiYkX13rQZSqVZpgvPkJk
	 yG5luV6PDpdu6fVC1XRjB+njgeP11miA0R1aGR5IhUco8kj2P8I6KzmGPdo6rXtGCv
	 2gVhrWrUboNIKJBo4rFjJsn8G+SnHcibfsvQcvO1AUJw292hNo/y2CtAraCvVt/gM6
	 pX3xpqvrvEpmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSffWicx
  kg72vVCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ownd6YwFpzlrlg75wFzA+MZri5GLg4hgSeM
  Ep0/t7BAONeZJC4dOsYI4exnlOh49JOpi5GTg01AQWLh1jOsILaIgL7E0tl7mEFsYYEQie1bD
  4PFWQRUJD52rQSL8wp4SDyZex3MlgDqnfLwPVRcUOLkzCcsIDazgITEwRcvgOIcQDWKErOny0
  OUV0jMmtXGBGGrSVw9t4l5AiPfLCTds5B0L2BkWsVoVpxaVJZapGtoqpdUlJmeUZKbmJmjl1i
  lm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGHQpxQqXdjC+WfZH7xCjJAeTkihv
  lm1mshBfUn5KZUZicUZ8UWlOavEhRhkODiUJXu1jQDnBotT01Iq0zBxgBMCkJTh4lER43x8HS
  vMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpz3EMgMAZCijNI8uBGwaLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZj3EMgqnsy8ErhNr4COYAI6orogDeSIkkSElFQD03Gbyp+/+H/ccZg
  frHNL+WudcEuF48Uc7TXvfP8lMovZ3rr16nemR6X115UHz8gfEjV+vWpKW5zc5wsnJuW4r++U
  qTxWyTKhu2qX2I2d84sWuV2f6qJyxsJt2p0C5/q6H89mehS8T/7vEHigwuj6SdvkL/XPxEzvN
  7P6fvtSwVD+YyOzmUfX2l//fU/VClyPsnQ+f9+p0rtIdrF7z7cXD0sPaznNECswN54lrrqyMn
  2SyKrn3OaJYbYvFf10Ji4KeMWWeZ2jQJFJInx7pk3Omc6G11uU52RPv/l8lbJVqfNu90+Oj+S
  FIrkP75bi6RG0tJx0zHxLqPch66bubrHK9+m/vjYoKG7YmJGde1FJiaU4I9FQi7moOBEAS7pd
  C0EDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1667877082!385448!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4615 invoked from network); 8 Nov 2022 03:11:22 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Nov 2022 03:11:22 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 50CCF1000D2
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:11:22 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 445D51000C1
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:11:22 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 8 Nov 2022 03:11:21 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.4.1 -> 1.4.2
Date: Tue, 8 Nov 2022 11:11:12 +0800
Message-ID: <1667877072-29086-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 03:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99484

Changelog:
==========
  - create_dispatcher is determined by URL ws/wss, NOT by presence of sslopt args, to maintain consistency (#875)
  - Remove redundant key generation line (#864)
  - Updated docs to fix old links and updated CI to include Python 3.11

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...socket-client_1.4.1.bb => python3-websocket-client_1.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.4.1.bb => python3-websocket-client_1.4.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.4.1.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.4.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.4.2.bb
index 39c5921c9..ab88af4bf 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
 
-SRC_URI[sha256sum] = "f9611eb65c8241a67fb373bef040b3cf8ad377a9f6546a12b620b6511e8ea9ef"
+SRC_URI[sha256sum] = "d6e8f90ca8e2dd4e8027c4561adeb9456b54044312dba655e7cae652ceb9ae59"
 
 inherit pypi setuptools3
 
-- 
2.25.1


