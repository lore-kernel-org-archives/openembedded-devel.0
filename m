Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF1DC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:10:25 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.3762.1675843821883322056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sZwy69Qw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843820; i=@fujitsu.com;
	bh=cuTX4dgBhbWHyS8VQPepItPuaw1Tu6E0aUsEgEllWyg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sZwy69Qwus1Kqa0yUA08TxZQczTz2H24LLMtXzCtCQ4t5o0W9KgrzMKu8Rdr4ekW4
	 6S3ejnmSeQaqbagEuUEoIa/lLMeOw3ccSJpZPJ9LTC3BYlaGdkpgl49hCNI0nnUSKm
	 QTyBjXKpO/pEbrRgBeDWTP5E2Z/zM396lfp4oOz1JWw9HlBJ83tWeETUKZaf46COae
	 2vFaK4VwYnHxEfSIff6JQE7FGTEMQmHMXlbAqM1NEb+keJjx3T5On3/Ik0YsGaKQO/
	 IbW7DkHPeWxuN2CM2PPo/oMINDut25C7hk03XLwUKw181d9cqTzPzb3YLkmYfNF4yi
	 f0sPPo089zPHg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSfd1xON
  kg/vvrSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owHWycwFhzgqPg6byJbA+NL9i5GLg4hgSeM
  Em/ebmaBcG4wSXQ8WskM4exhlPi8/SOQw8nBJiAlceP+fzYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAS+Jd2deMoLYLEDxu4dvM3UxcnDwCjhJnF6tDBKWEFCQmPLwPVgrp4CzxKs3U8BGCgGVtH
  4+BRbnFRCUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRrrpdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGLopxUzvdjAu7/urd4hRkoNJSZTXU+xxshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  ohwoJxgUWp6akVaZg4wjmDSEhw8SiK8kaFAad7igsTc4sx0iNQpRkUpcd6rIH0CIImM0jy4Nl
  jsXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzBsQBjSFJzOvBG76K6DFTECLQ1QfgiwuSUR
  ISTUwXZjt7nPhUYZCYNtErR5HrdSa7etqJK5YMW095ftlzly7XyI8sxiOxzMbGv/4qqbXf+jv
  siPaLvPaMlynHWD3iD9/oyTnZ/T6epH5ry+cebRxQo9s3ya2pqzbB5s+ZSYl3tO+4Mg58eRU/
  /9NgQ+nMljmqv0RarmyhmUm32MFvkfv38nsN35vcf30hPtZcibGL0T2lYks5LBUmJ3xyf+mr/
  c+lSmX26eusNXdvfRSCW/io5O/o+fzvuBacXV688QTy4WKn3byG7+8d/LzUUa3iDRp01j/Jul
  THP2tIWUcPdWLmdM3BT1YMVenrU8iZ2rStv4Nb4uu/v3Yoic5uWNJjsNage0PJ9+9mDoxL6iL
  VYmlOCPRUIu5qDgRABALxlBYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1675843819!175844!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20142 invoked from network); 8 Feb 2023 08:10:19 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:10:19 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8FF3A1000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:19 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 758A81000C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:19 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:10:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 4.1.3 -> 4.1.6
Date: Wed, 8 Feb 2023 16:09:54 +0800
Message-ID: <1675843794-11226-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843794-11226-1-git-send-email-wangmy@fujitsu.com>
References: <1675843794-11226-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100977

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_4.1.3.bb => python3-django_4.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.3.bb => python3-django_4.1.6.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.3.bb b/meta-python/recipes-devtools/python/python3-django_4.1.6.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-django_4.1.6.bb
index 6d800982a..e54398c45 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.1.6.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1"
+SRC_URI[sha256sum] = "bceb0fe1a386781af0788cae4108622756cd05e7775448deec04a71ddf87685d"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.34.1


