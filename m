Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44F3C433FE
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:36:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.2727.1653615369657615869
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TkZCYSXr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615368; i=@fujitsu.com;
	bh=awEbaUSaYqnOXxmFnc0GsTxZOdNRZn+u0+JpEabQ/OQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TkZCYSXrpZ96mTRmP0UygeyJtg7kl+vBOTnQ0O90lLOdaB/XZgZJV1uZZLDq9nWoI
	 2cfatGqGspkY6jUq5lFhVxTVm41Q7pFB+nbCmk8aLrPotLUuA8Keg+IHmLUi0oWiwt
	 JLPKw4l+XEHAePsg40UpRVk/jHuOa3QnHfObzC3aCQgNDocRu8zDPIGQ6gHMzwCJ3r
	 w4DccqMCcPxUAzL21X7/1LofJzxtdesIiRGzpqnewzZ1UNOCOVeeiBAF2dvY9nhhJ4
	 gPjeuIlF3j04dMoxGXNqPfJta9RL3jGrdkh8hyTwrmR2wVuAGRjoTU5RiVSpru7vgF
	 JQVgNKwmPa+nw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8ORpMuuPSH
  JoHu2mMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHt7mrmgkdcFX83PmRsYOzl6mLk4hASeMgo
  sXzBbDYI5yyTxMIlOxkhnANAmYXH2bsYOTnYBHQlXvxYzAJiiwjoSyydvYcZxBYWiJNoO9fPB
  GKzCKhKHLj0gRHE5hVwl+ia95kNxJYQUJCY8vA9M0RcUOLkzCdgc5gFJCQOvngBFOcAqlGUmD
  1dHqK8QuL14UvMELaaxNVzm5gnMPLNQtI9C0n3AkamVYzWSUWZ6RkluYmZObqGBga6hoamusa
  WukYGBnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIHhl1KsfmIH49OVP/UO
  MUpyMCmJ8mbe608S4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7R21CkpBgUWp6akVaZg4wFmDSE
  hw8SiK8SjJAad7igsTc4sx0iNQpRkUpcd4rmkAJAZBERmkeXBss/i4xykoJ8zIyMDAI8RSkFu
  VmlqDKv2IU52BUEuZ9CjKFJzOvBG76K6DFTECL83l7QRaXJCKkpBqYxLl8omb7L7JOS7bhKen
  nNfHNvGD/7JTli84vVy4d8fEV/C2ixR6bceGVj1VIvfdz9RdTVdt0Zt4/+e/oM1ZZNzPRzOOl
  smn3/mxx+S6kIVy38gBDA2PMaYUF0UbPJ1zfzHVSf0L8moMzpXVzP76/OXnvMi37imVh6tIH3
  q3pv3uH9dvaJJ42XukAPu+XL5j/5lpv9p7eHO717bFl4dLZLi8CFu+J/Kb66u+J8k963R6KX7
  a6T9mVIGKy181u4b6OpNen32pKPa46uMX7TmWzyRuJeoFbTnMuvoo6+vR/kunG1V1Xg7fs3l9
  osf+x1pVlRUWLODOdT97fVnpRurbcr//PRoOL97wKX9er3r7yTImlOCPRUIu5qDgRANnVVtI6
  AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1653615367!12041!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15448 invoked from network); 27 May 2022 01:36:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:36:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F1A92B55
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E5387B43
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:06 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:35:44 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.45.0 -> 2.48.0
Date: Fri, 27 May 2022 09:35:30 +0800
Message-ID: <1653615330-2338-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:36:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97290

Changelog:
https://github.com/googleapis/google-api-python-client/releases

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.45.0.bb => python3-google-api-python-client_2.48.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.45.0.bb => python3-google-api-python-client_2.48.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.45.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.48.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.45.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.48.0.bb
index 070a5b530..35caae152 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.48.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "375ce07994fdc187b25cc86788048ad30f8d55ff077d5e34cfcd6cbbea697128"
+SRC_URI[sha256sum] = "600c43d7eac6e3536fdcad1d14ba9ee503edf4c7db0bd827e791bbf03b9f1330"
 
 inherit pypi setuptools3
 
-- 
2.25.1


