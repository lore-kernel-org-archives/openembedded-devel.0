Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7F5C7EE23
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:23:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.103886.1683541435066457604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xjjeiTrd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541433; i=@fujitsu.com;
	bh=7MMpl7a4GUq6qK1/hArV4qemh4+g9mdISDS4npY1IPQ=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=xjjeiTrd2sCVQzQNRsC++Wg2f0YK7mBeuke1zzgmlyo0HTrksGTKLBWahNEJ5JEEp
	 PGVF/nJO2pr60pZXoB23pwbDJrgmcfXfRoTQsi1NC4MzjTpFteFxU/58DiZV3ILRye
	 tvc7t42hwLGO3/nSn9Pug0BxYDkm/Vzdi9bMpYDR7y2ZiF0EZXasQcECDWx7pIp1NL
	 +oyntevwSuXCh9RmrAbHo+aRZHavCRVfdi2KEPcncQ48orfd5WLQiNB+I7pCr/65qs
	 f+d32pQtzoPqXsvY/GYWPtqaA8UDWprRfGiJWFY3WiEA5CblZsoVzodrwG8sm/v6Oh
	 H97hIBS2vjPJQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRWlGSWpSXmKPExsViZ8ORpLvjbES
  KQfM1a4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePf/OmMBVM5Kxbf/szewLiXo4uRk0NIYCOj
  xLSnmV2MXED2NCaJmy1TGEESbAISEtP3nmQHsUUEdCU+fpgLFmcWUJGYMfkIE4gtLBAkcar3C
  VgNi4CqxMM1W8BqeAWcJI4sOABWIyGgIDHl4XtmCFtN4uq5TcwTGLkWMDKsYjQtTi0qSy3SNd
  VLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECPRwSjETww7
  GRzv/6h1ilORgUhLlNT0YliLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtfldESKkGBRanpqRVpm
  DjDYYNISHDxKIryyR4DSvMUFibnFmekQqVOMilLivHxngBICIImM0jy4NliAX2KUlRLmZWRgY
  BDiKUgtys0sQZV/xSjOwagkzMsAMoUnM68EbvoroMVMQIv9L4eDLC5JREhJNTAVSFW8Ngjvtb
  AOPrdAUrDoLINu8/r9MQnfL29jd97Kp/ciaG5Dc/mXLSrTVpx8ueVOn6oU90LFWB5zG/n46f3
  eK4rfvprBkXTkwiLxRlHvyc3Fq/0q6k6eOPs/bMafLROZ7KRMVHcmTxYx8KpR+fSzLc4/cLbO
  9QO3tdYI25icZb2xdbrg8rDKs8utwx5mblpbtu38si+bvT1ecJyeUrQ08OKMab5/sv4Jzqnj0
  OPUWPTuracu8+NDO6PCWmfJPt39VUJoqbp/au7ETycZIvxvGeg5ic7zqkjsDctK7nN88WqyhE
  nyos1VqWzbQg8xnFyyT8RC3UViuadGqPsRk+/pj0+/c/Hdoa8Z3mvlWqnEUpyRaKjFXFScCAD
  ljRyX6wIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1683541432!505116!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10722 invoked from network); 8 May 2023 10:23:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:23:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9A5E71D5;
	Mon,  8 May 2023 11:23:52 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C10671D2;
	Mon,  8 May 2023 11:23:51 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.170.1 -> 2.4.170.2
Date: Mon,  8 May 2023 18:23:40 +0800
Message-Id: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102422

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pymisp_2.4.170.1.bb => python3-pymisp_2.4.170.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.170.1.bb => python3-pymisp_2.4.170.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.170.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.170.2.bb
index 5fc33d6428..36191d5a64 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "75435df663376d26bf8044b76906ecadba112000"
+SRCREV = "6a777aaf31e39cb01be1958b13355753d52f33de"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


