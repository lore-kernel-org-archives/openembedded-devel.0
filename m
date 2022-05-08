Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B74BC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 08:58:25 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.2571.1652864296837044173
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 01:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Slz6auNJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652864294; i=@fujitsu.com;
	bh=rq2VY+Fe8iGIJvwjRxjo8sYqsO1ZIgUKndJzlUA8/A4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Slz6auNJNm38pNTdQCZ5iaNCkx0s27k1T9tSvUXjrluAY8NB0kNwoSZtqRcj3x1pX
	 7gJ3/MzMdYVURq2WCaom64EioiGTevt6HogNB1szsN4uCjzQBb0jmYr0BUZ284LYqH
	 UV9WVZ5KU2cLy3SghXXSA2blEv26awGjneAh3XIaAJ7Mc4FdBeec4VqHM4BGiFJjLt
	 t3TbClVTCv8xNuIUtLnzcVo/lfh5UNanX5TzXJAxi1aw41M5bI8uRdydRCcJ7rxrtD
	 2975Nl3SOglcpZ8w947q6v/CnXxmjcm1XhIsVyGWXhfXy8IHKVL6MTt2ajZ+4Oo6y8
	 n4+tmZcT6yg0Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqKu6tSX
  J4EeMxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCa8XzhEeaCX+wV1+b3MTUwTmTvYuTiEBJ4wiix
  a0MTlHOBSWLihl1MEM4eRok3/beAHE4ONgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexh
  QXcJZbevAIWZwGKH2q+BBbnFXCS+Np6iRHElhBQkJjy8D1YDaeAs8S0C/vZuhg5gJY5Sdzf6A
  1RLihxcuYTFojxEhIHX7xghmhVlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo3VSUWZ6RkluYmaOrqGBga6hoamusYWukaGRXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuc
  k6KXl1qyiREYxCnFald2MO5Z9VPvEKMkB5OSKK/y6pYkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8JRuBcoJFqempFWmZOcCIgklLcPAoifA+XweU5i0uSMwtzkyHSJ1i1OW4u3DvXmYhlrz8vF
  QpcV69zUBFAiBFGaV5cCNg0X2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBv1BagKTyZeSV
  wm14BHcEEdISIfiPIESWJCCmpBqbonbFfF/ytZ3vOOOfjN9XbBf6lwkEtfnbGbnUR2gtX7rg1
  3V8utnWd5Nuur3MPLWv92CQf59o7P0Cw9XjI9gldFwwPrmQuljrzbGdHwl2W7v1Mlk9dP55aL
  vZw99F1HI7Re7YyLOZh2Z0nbqCX2r9h1d0i84+RgRu/F3Z5Rt3OK74f42egaSGjoqZ3ZVr3Cg
  GTZs4zAtfzbqxikeMPfn5rvZVYz1v/jVli/XtK+VJLVL5ocy02n/jo3KbdjkFyot6TzFPK73t
  GxOctOOinpONw4kHbuydS6SZ7i+fx8nEJtqxerKchfVRqjqrPsZXHW9+6WRerPFvjqDCRO2aS
  9VTG13eXZKqHTcvnjTLlU2Ipzkg01GIuKk4EAFmXqzhpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1652864292!253985!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27946 invoked from network); 18 May 2022 08:58:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 May 2022 08:58:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8884D100194
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 09:58:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 49DD7100198
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 09:58:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 18 May 2022 09:58:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-awesomeversion : add recipe
Date: Sun, 8 May 2022 16:40:21 +0800
Message-ID: <1651999221-25259-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651999221-25259-1-git-send-email-wangmy@fujitsu.com>
References: <1651999221-25259-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 May 2022 08:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97158

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-awesomeversion_22.5.1.bb              | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-awesomeversion_22.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.1.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.1.bb
new file mode 100644
index 000000000..cdb89698b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.1.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "One version package to rule them all, One version package to find them, One version package to bring them all, and in the darkness bind them."
+HOMEPAGE = "https://pypi.org/project/awesomeversion/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
+
+SRC_URI[sha256sum] = "84bcd85ab1bb9a287cfd1b2e5145f888b6e02ef3e3a63a07453f10f2f6e50fe3"
+
+inherit pypi setuptools3
-- 
2.25.1


