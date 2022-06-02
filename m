Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A75CC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 03:00:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.2354.1654138798413458465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BjDttvqR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654138796; i=@fujitsu.com;
	bh=UL7/IF5zQ3R9dQ3mDgfTEM2uV8Crmyzx1A4wk1h3Sfo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BjDttvqRWfrbvDmhscyjJL5fgQU8P8fYjokeNnlZ9xGDPHf8A2ncFfdiMS1aZSG4c
	 yllXR+XCJQO/D2uOeeE0AJHfry8Wev9KbSjVcAvyEV/RCd9tJM+Fo+eg8NbObrmPoD
	 rgmbWBwtLx5oKgPOVBfEBO2ELrBZ4MqBNeXitxsS7e27S1nfMiErhGmm1KRpXRKoy2
	 jI3/AvNSlWECMTHbNs3vgeJ+nv1P6yk9ZYmPsMwhhkLqfOStSOed+vqh5WDW832STc
	 x6VvD+HydPM8JNJTLlyJSbvDLB1WeZFhIrpHyNpiClUUQquBcRgENLEm6uGInyM2te
	 PD0ejTs3DZ6nQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8ORpLtafUa
  SQe9zWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePI+fesBd85K/7+bmBuYJzL2cXIxSEk8JBR
  4vezrWwQzlkmiX1bDjNDOLsZJVbOvszUxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAiMTNNecYQWwWoPi/D01gvbwCThLzz78Cq5cQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eA
  FVoygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbbpKLM9IyS3MTMHF1DAwN
  dQ0NTIG2ka2hqrJdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KXl1qyiREYnCnFaTN3
  MG7Z90vvEKMkB5OSKO9Ox+lJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4O1VnJAkJFqWmp1akZ
  eYAIwUmLcHBoyTCqyoJlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDjvUjWgIgGQoozSPL
  gRsKi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY96sK0BSezLwSuE2vgI5gAjri2rcpIEe
  UJCKkpBqYAlPZLT+4C858skxvZZHo0yKjD7/MkzXjfKOuFrzP23Tpjp+HfQHD5ogi33lJ3y4U
  B3WVdizYcezv+6I3F9yjlf0+q3vPE1ugI9+t7mJSJmDVs4RRf9LbFykz0uwNoi5Mj7At+Pne7
  F8tv0Pzm20GeoIzj1vP+mrQ3xviztgeczH1ma2qqsvus+UhCy5cy/qTNGXpKVWvmaui1WrVtB
  4FOv+Isz9/ePtvu4h4PtZZgUs2PzMzlJ9/9fMr2yT9yBJtAaWpVXYzjPauyg6LqH4bsFzgiL0
  KQ4tzgH+rZ0hRubAvZ9YhvXetwe9M+3c28lWpSB0vF7Te4JK8ZKvf6TTO+QLXBXhnJwcc3S3a
  ocRSnJFoqMVcVJwIAOSFmzdVAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1654138795!434321!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 573 invoked from network); 2 Jun 2022 02:59:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 02:59:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DF137D79
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 03:59:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C60B0D5E
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 03:59:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 03:59:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-awesomeversion: upgrade 22.5.1 ->
 22.5.2
Date: Thu, 2 Jun 2022 10:59:31 +0800
Message-ID: <1654138771-11088-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 03:00:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97379

Add dependeces: python3-profile python3-logging

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...someversion_22.5.1.bb => python3-awesomeversion_22.5.2.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_22.5.1.bb => python3-awesomeversion_22.5.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.1.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_22.5.1.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_22.5.2.bb
index cdb89698b..c43f9ee54 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.2.bb
@@ -4,6 +4,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "84bcd85ab1bb9a287cfd1b2e5145f888b6e02ef3e3a63a07453f10f2f6e50fe3"
+SRC_URI[sha256sum] = "051f89efd8ba0b157fb516bda5e1dad4d63f87e8f9c0c148930023d984fce62f"
+
+RDEPENDS:${PN} += "python3-profile python3-logging"
 
 inherit pypi setuptools3
-- 
2.25.1


