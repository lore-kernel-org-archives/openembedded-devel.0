Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE371C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:22:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.191084.1673940164688866364
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BJpTTnMu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940163; i=@fujitsu.com;
	bh=7F/eAsWlNb4QWDKt1HiZzYq/m3SnshGDpDwV7KwfB0g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BJpTTnMuICum+JJVWvE1ptOj6y/DEELXc/m+RC2h1TEi2SY8EUV3b+UMFGJboVVFm
	 qruv44V4CqP3BmZguuYKPmkqmCrrxM6pHR7Sb1kpoBeIrGLFo3brOmiajsRW3t0fLm
	 ksQB+BwMymTyAUeKXwfmY6tVCfb+IoN/AJZoqaAu7cy9u+Ranx8XyN+ZGPFMAypzkN
	 isWBFQd923Kg8BwgPEzjT/AyHeEUykPNbgXFOJrY+Ew/juDqspJqJbwEafPlRlgYFY
	 ogPs1m4+RoEfDNUvBOF6pJd6/U456KRJMrghEMwncNFeP+aO4L0H8hES73Y+Pe0UXe
	 Kv0qss/rH6XKg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqHvI51i
  ywYaNmhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aBTe1sBT84K3a1vmRrYJzF2cXIxSEk8IRR
  ou3fYTYI5waTxM2D3VDOXkaJlTu3sHQxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAj8WPaWSYQm0VAVeLks1VgcV4BJ4kzszazgtgSAgoSUx6+B+vlFHCWmHH4OVhcCKjm3/
  GXLBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA0t9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzelmOXBDsYdy/7oHWKU5GBSEuU9aXosWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  ykvoJxgUWp6akVaZg4wlmDSEhw8SiK84ZZAad7igsTc4sx0iNQpRkUpcd7D3kAJAZBERmkeXB
  ssfi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZ1BJnCk5lXAjf9FdBiJqDFHiVHQRaXJCK
  kpBqYcvn2zHzsWlKQ1Lr6/Ruxa2m9IRHnPoqcPpHe8dfZ2PS+5SKbrK3uRhPaJwuIrlf/W1JT
  aXYhcnu86M4oVoHvVzo8ptbu3foikXlhNNeiHe0XerrY/254cjLzxtXE1x9+mF+anvs72KC10
  0q3+aH1plf8Cy07z+l3+YswTvn4U3nO3AO+xuv5LLRXWymceS7wxJdfyUQ31GHVWQnmLh33K+
  qX7/QkXph66TG7w/E5jteUN9k1/1usmHgvqFxgR9DF9+t23Zy8ieXuobOGZjZxOz7q5uUf1N/
  7247buyyu/r3p/tM1ZfO26AY9ly+9m5bHm7FC2KL1vM3Hfaots8xEOV89rbpU8m/ZksrEWLOP
  SizFGYmGWsxFxYkAICJd91oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1673940162!383014!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15195 invoked from network); 17 Jan 2023 07:22:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:22:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 46C7D100194
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:42 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3A2DD10018D
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:22:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-future: upgrade 0.18.2 -> 0.18.3
Date: Tue, 17 Jan 2023 15:22:02 +0800
Message-ID: <1673940124-20377-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940124-20377-1-git-send-email-wangmy@fujitsu.com>
References: <1673940124-20377-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100616

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-future_0.18.2.bb => python3-future_0.18.3.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-future_0.18.2.bb => python3-future_0.18.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb b/meta-python/recipes-devtools/python/python3-future_0.18.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-future_0.18.2.bb
rename to meta-python/recipes-devtools/python/python3-future_0.18.3.bb
index 90d1661d4..e4a4b5c19 100644
--- a/meta-python/recipes-devtools/python/python3-future_0.18.2.bb
+++ b/meta-python/recipes-devtools/python/python3-future_0.18.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://python-future.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a253924061f8ecc41ad7a2ba1560e8e7"
 
-SRC_URI[md5sum] = "e4579c836b9c025872efe230f6270349"
-SRC_URI[sha256sum] = "b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d"
+SRC_URI[sha256sum] = "34a17436ed1e96697a86f9de3d15a3b0be01d8bc8de9c1dffd59fb8234ed5307"
 
 PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
 
-- 
2.25.1


