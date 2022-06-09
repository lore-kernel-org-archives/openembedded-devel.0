Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB84C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:17:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.7555.1654759016832081651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WS91uUij;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654759014; i=@fujitsu.com;
	bh=0DNij5PaXej7jzasqlqcu8rH/aYekmOyECn5Jt0HJ8E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WS91uUijXFB6mHfRGU3i4Ui40g5UGLW8g7c5mgVhQJBrN+8d1QX1YA1dgun/pz6JK
	 MGieIDZP+dRzffwQdajsAvQXjyQMfajuADJvGMiKnyr35gV8TgJEYM5tKl8ezVGzMp
	 g3G+3k0w4c+lXmJ+Jpzu8APf2NKxsckJYWMJvRFrdwXYCJipZB35Ol9dOtEdQrYBzL
	 w9g5G57457j8+3Oa6psPyGELtiAlMOjEo1sAKJwZWl+Cbqg7PpmPg0Bh5X2CyjhgDH
	 qW20AHbAra6dHMKGvCcY2j01eLEhHgJL2U73n9VGKnMWjFFeSlezpcoMHJh2colBr1
	 yjjuxq4tSK6/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8OxWTdt3sI
  kgx+XuSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyHLbMYC/ZyVRzcMYGpgfEKZxcjF4eQwENG
  ie8//zBBOGeZJNY9Xc8O4ZxglJi75StrFyMnB5uAusTjm68ZQWwRAX2JpbP3MIPYzAKqEt0X1
  7CD2MICvhKN1yaDxVkEVCQOdv0A6+UVcJdombiFCcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjJHFixUeo+gqJ14cvQcXVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TSrKTM8oyU3MzNE1NDD
  QNTQ0BdLGQNpCL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzA4U4rTy3Yw
  Xt33S+8QoyQHk5Io77nUhUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHj3zgLKCRalpqdWpGXmA
  CMFJi3BwaMkwnt1DlCat7ggMbc4Mx0idYpRl2Pm17YDzEIsefl5qVLivOvmAhUJgBRllObBjY
  BF7SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxLQabwZOaVwG16BXQEE9ARv64sADmiJBE
  hJdXAtORmvWegzEHtgD4F0eIS7wdFrX5Wd8NmXjCcmRA3T6PjlWLN3L1J5hwbP8zYeIzri03W
  KeHkLdXztISC+mz43jqZX/PSOax4TbPheOGiY9b9T/v7hTZcmcXopVbT8bpMdaWFVtqLWXcb9
  70r/lEj6n9tos30TfKTNkbt/vDf9IVYiJ/GDIe/z1wfTD8gqzlj68KXreYcr7gecv6dEdMol1
  Nf4f86uH3t0e3bbXiDPJQj0kp+BJycq1oVwbfpXcav7eU/rniVWeftrAqKKM9d9ny7nO/fuPQ
  fLnYHvE/eFF31PsDw+vGlJzd0/T09TzhIudomlWHL74YWmS1/fX/uvXPRgYNN2WR38OQXB/Z/
  VmIpzkg01GIuKk4EAJ+sC+RVAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1654759013!207281!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27285 invoked from network); 9 Jun 2022 07:16:54 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:16:54 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8812F8AC
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:16:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6BCC0812
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:16:53 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:16:33 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-hatchling: upgrade 1.3.0 -> 1.3.1
Date: Thu, 9 Jun 2022 15:16:17 +0800
Message-ID: <1654758981-32219-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:17:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97449

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-hatchling_1.3.0.bb => python3-hatchling_1.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-hatchling_1.3.0.bb => python3-hatchling_1.3.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb b/meta-python/recipes-devtools/python/python3-hatchling_1.3.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-hatchling_1.3.1.bb
index a6550a973..1c08bd60f 100644
--- a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hatchling_1.3.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a97f2b0040fdddc5b85e"
+SRC_URI[sha256sum] = "aaa63019c9d666053d9ff318097335e766123844547c52940155c0401c3c142f"
 
 # Until we have a proper tool to invoke PEP517 builds, hatchling can't
 # bootstrap itself automatically.
-- 
2.25.1


