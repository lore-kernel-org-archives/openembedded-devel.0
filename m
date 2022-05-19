Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2375C43219
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:03:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.4354.1652940226491279661
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F4B3wq4+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940224; i=@fujitsu.com;
	bh=pZvQqITADZ4k8TPaU6wJ4JyL4V5U0VH3KjmRUe7/Ayw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F4B3wq4+jQ582Jcp8Ti0MmjK8UtmAxdzgOWcp9OMiWnC7WJgVIbUCqPBrJDi9aOyP
	 /C+1kAwqDWK5ezsrGkM9hHd6rnzTZ4u5ro5zg115UoghCjvkZrmLuoCiqNDn4e/NIV
	 sP8nGLv/+szW2lVm7EDJsVgw+Rq9h0fC8A1W8vZX0J/QxxxgfKX11JuB5fQXFCUeSs
	 sg1jSIRIbUKTW+O+Kk/Ziy9JKsJWfb90x+lb+9yQ4m2GdBJd8db1JN+jbprz86UKoi
	 ELU+myHBdKDOLd7N45hFasNBXsFVyGwKUsQL9/0EJ1dFAphZHh7XJi/W73RtUjmYVo
	 MZSOjK23NZTEw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqHvgbmu
  SwZctohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bReZuYCy5yVMydtpS1gfEnexcjF4eQwBNG
  iaPT5rBAOBeYJO6/bmOEcE4ySlw5dZi1i5GTg01AXeLxzdeMILaIgL7E0tl7mEFsZgFVie6La
  4BGcXAIC3hJ/NluC2KyAIXn9FSCVPAKuEk83PCaBcSWEFCQmPLwPTNEXFDi5MwnLBBTJCQOvn
  jBDFGjJHFixUcmCLtC4vXhS1BxNYmr5zYxT2Dkn4WkfRaS9gWMTKsYrZKKMtMzSnITM3N0DQ0
  MdA0NTXUNdI0MTfUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5NzUvTyUks2MQJDMqWY4foO
  xol9P/UOMUpyMCmJ8rofaU0S4kvKT6nMSCzOiC8qzUktPsQow8GhJMH7+QZQTrAoNT21Ii0zB
  xgfMGkJDh4lEd6WXUBp3uKCxNzizHSI1ClGRSlx3oQ7QAkBkERGaR5cGywmLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5k0FmcKTmVcCN/0V0GImoMW3lMEWlyQipKQamNz+u54OSMuzYxQ
  8tkLuvMB0v4dnfswQT9p4tLjy6nVFt7xVckrtU7X09jWY/Y3n+bjk89GHrbKxzR6ztVLS+8W4
  ferj3V7WfN1StSLQ96U/25Mfom3KFlvq/sT316SeSNpqu4xl2XLXG34uP/nMlBlVbz+Zq3Bsi
  +WT4D91fgFCr68eVbM4FJBxz3K6W9zBjJLGtnmu+cdS46deuCiZdLlqf6H7F8HqZ0mh4aek8h
  5t9jqycN+6ysa5AkHaZmpnmjzKYtVLPtaovfQJytl9IqQ2WV6g4b5a8+QL5+TP+l5f90rcWlb
  46sZGWastKe6/s7+nNv822LJHanXZegf2py9CHoleb5txR0zjJ1epEktxRqKhFnNRcSIA/+xn
  y0QDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1652940224!20689!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20578 invoked from network); 19 May 2022 06:03:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:03:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C9791100197
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BD4B410018D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:03:21 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pint: upgrade 0.19.1 -> 0.19.2
Date: Thu, 19 May 2022 14:03:03 +0800
Message-ID: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97176

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-pint_0.19.1.bb => python3-pint_0.19.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.19.1.bb => python3-pint_0.19.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb b/meta-python/recipes-devtools/python/python3-pint_0.19.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.19.2.bb
index e1c471e06..06337edb6 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.19.2.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3e5913e4ad125f672f72e19e06a8cb1f6d36a4922b6e5a49e04ff882511f82c8"
+SRC_URI[sha256sum] = "e1d4989ff510b378dad64f91711e7bdabe5ca78d75b06a18569ac454678c4baf"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.25.1


