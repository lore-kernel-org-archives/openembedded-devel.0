Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE661C433FE
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:37:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.2709.1653615466539463399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BWSb7PRi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615464; i=@fujitsu.com;
	bh=Aw2yGli1n5cDCZhfgxqRI3KMt44ZTNOXfldy0+BUV6k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BWSb7PRiILgA4FqCxmn/Q8y6/3YI/94at/Elm7EhnQOGxin7rO4/kE9BFoa1oFp6I
	 qhRtU4TS3uwwyCEFkoyH4Z1vNqBhzpN2qjVLOXeWHERJX3cylWCJsBkv5E0TUzGCtC
	 YvrMsJTexrzGStaUgf4ZOMp/eEvfu5WwaXDQ1l4CjiXSjAnQNIE7R+zGFsLxLkK/jy
	 Lv07eA4YQJYBrtmozwjkHf/WZIDHR9ku5zax4/3zW4giopQkdta2OFkRL7WISyJvFB
	 xYBb/4nZKRQbEia5cPpk1UdHpeOtntJBS7mPhylvi3XstMKATly63+WfuBrvPRwSJZ
	 PI6viMqZcx/zQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8OxWTdDe0K
  SwY4TQhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bP7gtsBSs4K252PWZpYLzG0cXIxSEk8JBR
  YvmaRYwQzlkmiScvzrBCOAcYJT58/MPSxcjJwSagK/Hix2IwW0RAX2Lp7D3MILawQJDErqkf2
  EBsFgFVidPrHrKD2LwC7hKtv6YxgdgSAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvgOIcQDWKEr
  Ony0OUV0i8PnyJGcJWk7h6bhPzBEa+WUi6ZyHpXsDItIrROqkoMz2jJDcxM0fX0MBA19DQVNf
  STNfQTC+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMw/FKKEwR2MO7d90vv
  EKMkB5OSKG/mvf4kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8W7QmJAkJFqWmp1akZeYAYwEmL
  cHBoyTCqyQDlOYtLkjMLc5Mh0idYlSUEuf1AekTAElklObBtcHi7xKjrJQwLyMDA4MQT0FqUW
  5mCar8K0ZxDkYlYd6nmkBTeDLzSuCmvwJazAS0OJ+3F2RxSSJCSqqByfJ4TV1G6Hml/uzJEpF
  nU+c0nCg26S1ccsX+wbPTS+1CbKSmnzgkK11p3uB9+37cyymzy590+M7fMm9n0POHHxp7A4p2
  V8n+Cjnnx14RckfZPnpppu8kl5dxDW7JPsG2LLwrn68xY/3Bu//vfLay2E+3TH8W/bS47nj5x
  qlPkUZy6w78msLMqLO37d9CzTVqXavLvi3s/7ri4YGJ7fvqW66fziqVf53wuS4gel5GibbiTd
  nMp3slu37nKHi+vB217d3y0i3C11axck58dPDYte86Sj+s9Ra4h/PLhIrODHzv/87rO/MJg5i
  5Z77+lzz1d1eIqbLTsvvb9j07cN2dm93zy0uFa13H/rJ9+rE5LVyJpTgj0VCLuag4EQBBNn2z
  OgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-732.messagelabs.com!1653615463!17884!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8686 invoked from network); 27 May 2022 01:37:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:37:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A2CAA89C
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:37:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8373F80A
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:37:43 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:37:22 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.46.0 ->
 1.46.3
Date: Fri, 27 May 2022 09:36:59 +0800
Message-ID: <1653615419-2401-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97296

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...n3-grpcio-tools_1.46.0.bb => python3-grpcio-tools_1.46.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.46.0.bb => python3-grpcio-tools_1.46.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.3.bb
index 9569e8ec9..221a05ef1 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.46.3.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
-SRC_URI[sha256sum] = "9295bf9b1e6dd5bcb260d594745fa3d6a089daade28f3a80cb2bc976b5359b7d"
+SRC_URI[sha256sum] = "31fee436ace5b3bd950cc3a8e68d6b84de1d6dc755959db7badc3470cdf22f70"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


