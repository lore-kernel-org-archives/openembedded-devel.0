Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63806C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 01:28:16 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.3344.1646098094810881369
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BXAen7Qz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646098093; i=@fujitsu.com;
	bh=wfgNSe7eICYRXHTiNZygCa8HtOR7m3glZ1pACR8acgg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BXAen7QzLX6pRUBDRx62PexLGiBnf2ljWZQAlLPhSJVJGLdov8JQ/KLK1tpfOSWFS
	 JT7m87LnQ6EtY/lT0nWOr+xFmxQ/gIEsPpi9FYvA07GhCAoX1uiqtw4fEZpYMHKsz7
	 klrqK0r0uLAQK+KmvTdLjd/gja/68u4dnmqylN2Az8477egImcjyr6jFb+lCkrFNpv
	 7JqsICXY0V/1SwN+Aq2hNy+LjRQtAWGWfEos486csi+iGY3m+Z9wd+wmN72ZKNy+dP
	 9d56w6NG3z2Nk8IZSY6Wz+crlanefXlIOPxmZsvOihLI+UrtHp1oWFNbWKYphApa4O
	 iuXSdmv9GyQRA==
Received: from [100.115.68.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 CC/3F-13301-CA67D126; Tue, 01 Mar 2022 01:28:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8ORqLumTDb
  JoHO6osXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjG5dT9zwTyOisb2p0wNjAfYuxi5OIQEnjBK
  XNt0gBnCucAk0XTrCguEc4JR4uuT00BlnBxsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1wDV
  MPBISwQIvHzUSmIySKgIjH7SQpIBa+Au8SBlyuYQGwJAQWJKQ/fM0PEBSVOznzCAjFFQuLgix
  fMEDVKEidWfISqr5B4ffgSVFxN4uq5TcwTGPlnIWmfhaR9ASPTKkbbpKLM9IyS3MTMHF1DAwN
  dQ0NTXTNLXXMTvcQq3US91FLd5NS8kqJEoKxeYnmxXmpxsV5xZW5yTopeXmrJJkZgYKYUu3rt
  YDzS91PvEKMkB5OSKO9cT9kkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8aiVAOcGi1PTUirTMH
  GCUwKQlOHiURHhlC4HSvMUFibnFmekQqVOMilLivD2lQAkBkERGaR5cGywyLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5p0LMoUnM68EbvoroMVMQIv/BkuBLC5JREhJNTD1b0owSdh33eJ
  exW/jMw9vnZ5VtlvCaqemfWf6799KfeyHwvfd4/wyr55JxF/TQiB4zgGFwqlPlp/09WU5eu+N
  zgEFly18Rqaxd28+tF6ygXfT+WNvjLNiXFt4kz+yCx2+lRT/9xKzcEJsXVUWW2Le1+eTMoMnH
  M6fE/hTQEY3UGqLz0WtE82lXm+2H2huy4y1lbL8oWarxfbfxXXt16vrj37oXjdj/9+rER9bdF
  r27C6X3HhxaWog4817L091etgwHXt4gUnlG8uSVn0T9bydm1pYcoQXrUvMtu7inHfK+MuEtby
  7JJbtj9q02rn/VF3f5NZKyc37j9W0cco7coiGvWw4uM9M8kbZnoal5u+UWIozEg21mIuKEwGa
  NsLKRwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-532.messagelabs.com!1646098092!16755!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4096 invoked from network); 1 Mar 2022 01:28:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 01:28:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 03399100190
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 01:28:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E375F100184
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 01:28:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 01:27:54 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/2] [oe] [meta-python] [PATCH] python3-lz4: upgrade 3.1.10 ->
 4.0.0
Date: Tue, 1 Mar 2022 09:28:32 +0800
Message-ID: <1646098113-11465-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 01:28:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95614

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-lz4_3.1.10.bb => python3-lz4_4.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_3.1.10.bb => python3-lz4_4.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.1.10.bb b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-lz4_3.1.10.bb
rename to meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
index b557529cc..472e152db 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_3.1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
@@ -8,7 +8,7 @@ DEPENDS += " \
     ${PYTHON_PN}-pkgconfig-native \
 "
 
-SRC_URI[sha256sum] = "439e575ecfa9ecffcbd63cfed99baefbe422ab9645b1e82278024d8a21d9720b"
+SRC_URI[sha256sum] = "57c5dfd3b7dae833b0d2b2c1aafd7f9d0dfcab40683d183d010c67c9fd1beca3"
 
 inherit pypi setuptools3
 
-- 
2.25.1


