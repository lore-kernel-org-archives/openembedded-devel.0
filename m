Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91F6CCA48A
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:35:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.3215.1658453744265202587
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bTgExUxI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658453742; i=@fujitsu.com;
	bh=uh3iedbpTvjNoNvRx8VwfkFjLz1Ih3DMIvmJIPfqR6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bTgExUxIl0kTn5eAquUxGpLg9hiSkwqrRdXv0gmG8rYmnBdDgIC36JM+PDpgHnYYx
	 70U8rfgjsoTVMp1XzwKcowx8YF/JDP6pP3ClAH9fm8TIiYhEmgTc606DWF8Za3HZVP
	 bcz/oqXF7bhKxab4Wk6utRPNyUxojj9LvSrdNvI0YvuClj2tXr1lAYSPamCxWqdZMS
	 yrAD/X2BmRD9fM/XkXnKlftiEAbeMpqqy56QDi/z5UgegfP7Ccv6v1ZVqD52suLflN
	 pNzi8CSbN7y0yqpHsj2g6NBm9bvsHMgpD5j/p1cn2BA0bC5C9CXUAJw2ycBKHv+LSz
	 b3ra905gxjI3Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpPv2380
  kgyu/2S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxLf/uZC85wVVydN5GxgfEpZxcjF4eQwENG
  idUnXjJCOFeYJDY8amGGcE4ySuztecvaxcjJwSagLvH45mtGEFtEQF9i6ew9zCA2s4CqRPfFN
  ewgtrBAnMSJ/2vA6lmA4vfPHgaL8wq4S8yeeQ7MlhBQkJjy8D1YL6eAh0Tj+/0sXYwcQMvcJX
  Z+EIIoF5Q4OfMJC8R4CYmDL14wQ7QqSZxY8ZEJwq6QeH34ElRcTeLquU3MExgFZyFpn4WkfQE
  j0ypGq6SizPSMktzEzBxdQwMDXUNDU11DXSNDc73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK
  3OScFL281JJNjMAgTilmvLmDsbXvp94hRkkOJiVR3n2TbiYJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuAt+AuUEyxKTU+tSMvMAUYUTFqCg0dJhNfiC1Cat7ggMbc4Mx0idYpRl2Pm17YDzEIsef
  l5qVLivEu+AhUJgBRllObBjYBF9yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzyv4Gm8GT
  mlcBtegV0BBPQEebmN0COKElESEk1MMX3VtvMmniV+dmKjP4/e/ky7P0+C/B/vjr/6gSWhqss
  vYvtxDIUC2/MjJyo9/1CrS1rrObOqcq2Zxee/CfK9er4ejfz/zPWq158s3bGs/12moVPnRr/d
  feuTObjURd6+Ku5WlGzcWrxtSv3zEzWFdnPbri9VGoD+3kbrvpLM98nsF7yjnJ3e1I/sXcxS+
  LxyTcZWH6mmcbaWpt5xOdWfGVZbWltfNs32ro8PZrtufK5FUYPuSV9dkj/dfJ9r9X8/yLrh6n
  zYuIcjf5tKxHadeurrJX6X4XEg0FyFTPFJ+S6/hXMCd9WPPfHBmats9dPXKn8y1j4/ajrtvlB
  8n131Jgmp8vrzGn14Su5emhxshJLcUaioRZzUXEiAEVaZ5NpAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1658453740!44824!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 343 invoked from network); 22 Jul 2022 01:35:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:35:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BDA881B2
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B22501AE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:40 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:35:38 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade
 1.56.3 -> 1.56.4
Date: Fri, 22 Jul 2022 09:35:24 +0800
Message-ID: <1658453726-25988-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658453726-25988-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1658453726-25988-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:35:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97928

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Bug Fixes
---------
    require python 3.7+ (#119) 

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...tos_1.56.3.bb => python3-googleapis-common-protos_1.56.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.56.3.bb => python3-googleapis-common-protos_1.56.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.3.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.3.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.4.bb
index 95823ea487..3f03933e06 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.3.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6f1369b58ed6cf3a4b7054a44ebe8d03b29c309257583a2bbdc064cd1e4a1442"
+SRC_URI[sha256sum] = "c25873c47279387cfdcbdafa36149887901d36202cb645a0e4f29686bf6e4417"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


