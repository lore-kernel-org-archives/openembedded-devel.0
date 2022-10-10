Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7F8C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:43:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.4006.1665391398795519001
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QWzgw4Xz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391396; i=@fujitsu.com;
	bh=ViW2H1posyVvokCvQmOxlOaBVr9YoKVyOirFi6xuS2A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QWzgw4XziJ9LoiNAOdqiy3X7QAiPCvdBnL0tWO/Y0YOtv2vElAQ6OBc2Kk1EbJtZX
	 lHMcgHFEd/ENHDYwzDGC6h4UlXvadTZxkIgckh1E/vuDcKt/qaJOyktNKxtVxXSe5T
	 IC53tIat+Zp+UEILrsBJ+l/dpQ6KWxrc69gckRIU9d9qE8ZtnuE3BblcmwX9mhPl8l
	 D7RIo1x1fVhSsHbRr6GSflNHKwFUc3oLM/FH6Xnt2hPFcDDwACvNmTw5RwILmsF+Wk
	 P7Nd8W59wCkcJHgrGaUAv8NQJoaikWwTQFBXWSIPT04J3JlSrMl7IW3dZTt1/lLSXz
	 mP8nj7Hox5fyw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqKty2zn
  ZoPusrMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH1+FW2gmMcFXO2v2dqYPzE3sXIxSEk8IRR
  Yvb0/UwQznUmiXcvm6EyBxglFnyZxdzFyMnBJqAr8eLHYhYQW0RAX2Lp7D1gcWEBL4l7fb2MI
  DaLgKrEwU2PwGxeAXeJzvvfwGokBBQkpjx8zwwRF5Q4OfMJ2BxmAQmJgy9eAMU5gGoUga6Qhy
  ivkJg1q40JwlaTuHpuE/MERr5ZSLpnIelewMi0itE6qSgzPaMkNzEzR9fQwEDX0NBU19hU19D
  EUi+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzD8UoqVp+5gPL3qp94hRkkO
  JiVRXoNDzslCfEn5KZUZicUZ8UWlOanFhxhlODiUJHif3ADKCRalpqdWpGXmAGMBJi3BwaMkw
  vvgIlCat7ggMbc4Mx0idYrRkmPq7H/7mTmWg8mZX9sOMAux5OXnpUqJ87bfBGoQAGnIKM2DGw
  eL10uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkvXQGawpOZVwK39RXQQUxAB5286gRyUEk
  iQkqqgema1LJdG5KqTE6/XO6y4vUUx7i3dz7L/Xk3gXXl2cqaqilSf7d3zNhtzpzL7bbYcdPu
  czW3zk0+67D2gK381E8i0x7o6XVa71E43Wu8Vsn55b7vyw5wv+DZFl3/ysLC9sV912vaf/bW3
  Zn53m+F5dmLz8WjlArV54bde2/U4Xh44f1FawMz7MJ0CysmMQYwKHmoBVlNF+FZ8WDlseVVYq
  5BExY7+NW8WcCa+MPy8Zl2l+SDD4Pqjx50ql4RfeZog+VmiR3My77zxPXmOP8zet43cU+Ws/G
  Ca48qWr2F7fP7NVYG6/2/FZO9Xqlj/6rPzP11yeviOt0XXNzM1vrnrtFvQybVXa+XlvaI2D3f
  OmWLEktxRqKhFnNRcSIAOzzaGFIDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1665391396!80430!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13532 invoked from network); 10 Oct 2022 08:43:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:43:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 33F2D100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:43:16 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 27C1E100043
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:43:16 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:43:14 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.31.0 -> 5.31.1
Date: Mon, 10 Oct 2022 16:43:06 +0800
Message-ID: <1665391386-2499-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 08:43:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99124

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-web3_5.31.0.bb => python3-web3_5.31.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.31.0.bb => python3-web3_5.31.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.31.0.bb b/meta-python/recipes-devtools/python/python3-web3_5.31.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.31.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.31.1.bb
index 435eb1d065..587d34f000 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.31.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.31.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "ef0ad5c62958fe18202bacfa1f216a57d97a8abdecc68f87946c02b38aaab34e"
+SRC_URI[sha256sum] = "74732fbd4b2e2baff9d0ac61f268b3e7b25b09ca6572d619390a9d782c2289f2"
 
 inherit pypi setuptools3
 
-- 
2.25.1


