Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BB3C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:11:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.1779.1666055506106235775
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aX8wFJwp;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055504; i=@fujitsu.com;
	bh=9ncdq3Oi9p8Ar+mzNwbl6rAopIewme0p8TWpspuFIck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aX8wFJwpkaDFSgMyAti/9RdwwARcFhPO6Ohs/AHos7/MlPVPdvxBZ2Z5pfm8xoBXx
	 0h8ObI5k/uroBqAAcTo+c34WP+PHkSLb7lPTa7AfxL+ghFSk7ZjPI8Twj/zuSZLTtu
	 vHhy0eHllUU2MX8PI5OAt3MH4OjXrEt2QhWbLXjJS3oj3DH6DD0VKhz5AN6V+/ipP9
	 pEG8Gpc6+NGjyGZ98TjCRUzMebGNMI4yRdjUp/V2CMJ+0R5XSJso9y8+btqw7pRbYu
	 GDajTVxCU4wf/ubkf8vVNmDCZYxKiqHZUQnx5PnxzkRB3NJ4vSA7NTpV2kEkLivdhL
	 cFcT4q6dI3Kdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORpOv/1zf
  Z4P4sfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWN55y62golcFRcn7mRuYNzP2cXIxSEk8JBR
  YuWBDnYI5wqTxLnNFxghnD2MEsd2dTN1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQJzH/8iEwm0VAVeLjvnNgvbwCjhIPJ71jAbElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3AxVXyExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjWXFqUVlqka6hhV5SUWZ
  6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYDimFKuf3MG4Ydkf
  vUOMkhxMSqK8HTN8k4X4kvJTKjMSizPii0pzUosPMcpwcChJ8Gr9AcoJFqWmp1akZeYAYwMmL
  cHBoyTCG3UGKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKXHeNJAZAiBFGaV5cCNgcXqJUV
  ZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjAvB8gUnsy8ErhNr4COYAI6ImO/F8gRJYkIKakGpnk
  rczmP77Hz+S35X2trlLYiU+dd78Rpu8zvHzRrSQ0vLWgMqg4xnrhvV2bo7hT7hi27zu7MFulx
  tj+3OOPAtM6NIZMVmoQYP/+8n3mHr1afYWdd/o1jTDJTj4RMvCBd3/57/ts81Setptkh5vs3H
  l2sze1ef9aZXVfJyUfcW1DjzeSsI+e/SdWU719xeXWC+Jo5pnu6Cnaef/8jUErx0/wb9alv/H
  4q/Zwy49HbKbPMNKNOej3uyvr0oFLZuV31h6Bt1ZaNivU7MzlEZKvuWQYuOHrsz9cPOpm6y/Y
  GC/xX0+vp3X1orvW8l58yjk13cJghF5GccClVkW3zTcF7rwQXtvydqXJwZX1Zffx5NiWW4oxE
  Qy3mouJEAKg2eZhOAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1666055503!13299!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12828 invoked from network); 18 Oct 2022 01:11:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:11:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7DA841B1
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:11:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 724641AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:11:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:11:41 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.62.0 -> 2.64.0
Date: Tue, 18 Oct 2022 09:11:20 +0800
Message-ID: <1666055483-8143-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99222

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.62.0.bb => python3-google-api-python-client_2.64.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.62.0.bb => python3-google-api-python-client_2.64.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.62.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.64.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.62.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.64.0.bb
index abceda8d02..af83c1704c 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.62.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.64.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8307b85f0b8f84252747326de50eda279220cc1a3966d6b82e94486618275637"
+SRC_URI[sha256sum] = "0dc4c967a5c795e981af01340f1bd22173a986534de968b5456cb208ed6775a6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


