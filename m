Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32906C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:55:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.3041.1657180551743479332
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g7wXkhJR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657180550; i=@fujitsu.com;
	bh=O8woYD1BoH8f6axD4BWU+1grlPIB2aphcwePA+8MvAI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=g7wXkhJRBwLsitdiXiNcZg7PGIUu6RBjB+GBBKH1LEAwxtodYKAae8VFiEmqOZXHK
	 ufpICz2UWsC55vAkCIxfNLLYtEhAp1akpWyThrLcUnRsiTjK4rtYK9ZbMfk9i+lGfa
	 927N2G3YajFuS+10T26PR3xsq+p7IcplxtGX7tFxA6j68NRTg+vZqkg8SFmiF2kKcX
	 zMeaE57BxCVmKMcXnjTnlo1Kb+sciMJlBCf1ZNAWbojwVeslAoVxhDzKnOK0D3zAEa
	 hVl4x1Rh6L9BM8ycjGpJAiXF9QzfBECjrqMnPwlhFJFxmzyhWzYCfVHVshULSSIT/U
	 BjhHpKizcRHrA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORpNs68Vi
  SwfVVehYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bTXvWC3xwVHQ+XMzUwLuPoYuTkEBJ4yCjx
  /URkFyMXkH2FSWL9nHeMEM5+Rokd59YygVSxCehKvPixmAXEFhHQl1g6ew8ziC0s4C+x7PVxs
  DiLgIrE3BOXWEFsXgEPiad/J7GB2BICChJTHr5nhogLSpyc+QSsnllAQuLgixdAcQ6gGkWJ2d
  PlIcorJF4fvsQMYatJXD23iXkCI98sJN2zkHQvYGRaxWidVJSZnlGSm5iZo2toYKBraGiqa2y
  ua2hmpJdYpZuol1qqW55aXKIL5JYX66UWF+sVV+Ym56To5aWWbGIEhl5KseqiHYz7V/3UO8Qo
  ycGkJMq7uudYkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJXmlgMAsJFqWmp1akZeYA4wAmLcHBo
  yTCuwSklbe4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rwzJwAVCYAUZZTmwY2AxeQlRlkpYV
  5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8r0Gm8GTmlcBtegV0BBPQEcvyj4AcUZKIkJJqYGrvaJ6
  T+arW0frum8IugZfmr7g0I7fNOKbw6nrQaQemIH79Y2mNV2pm3f/WY7pQZLLHEcGDjQEeSx4z
  5k0LPG2mOmtK6ouYGR9Wz9r5Z86xO9qb56i/PipTZqQjGsggKu1UaK/nrc9++NKqnIOnzlQ/e
  lvyuNP9WoPBUWE+Kd0gfQYnpQPp5Tzl5Vcmnrp06f3MLx9Ydb6vq9JtV1VlWfOi19ggWdDPt/
  Dmo81n+woO12uqSy6Wagl6nvtl0Ysy5Wz7nRGOEovjtds/PZ747k3XonvczIWp++ZOeGUiq5D
  3k31pcImuues06dfv8xc23Hx0YnbTA9Oo363pm+/tuFAzj0/Sz126m/N7xuUZB5RYijMSDbWY
  i4oTAYVyfFxEAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1657180549!28441!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24189 invoked from network); 7 Jul 2022 07:55:49 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:55:49 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6DB821B2
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:55:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 629191B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:55:49 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:55:48 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.8.0 ->
 2.9.0
Date: Thu, 7 Jul 2022 15:55:41 +0800
Message-ID: <1657180541-23960-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:55:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97753

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-google-auth_2.8.0.bb => python3-google-auth_2.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.8.0.bb => python3-google-auth_2.9.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.8.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.9.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.9.0.bb
index 46371d76b..868d70b4c 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.9.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "819b70140d05501739e1387291d39f0de3b4dff3b00ae4aff8e7a05369957f89"
+SRC_URI[sha256sum] = "3b2f9d2f436cc7c3b363d0ac66470f42fede249c3bafcc504e9f0bcbe983cff0"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


