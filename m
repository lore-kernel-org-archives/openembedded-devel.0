Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923F6C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:07:50 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.8966.1678889264978637658
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XSsxn+Ws;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889263; i=@fujitsu.com;
	bh=Lrd+GOpD7Ttz81Tx46ruqq0S6m9ZcisVYpYu5WHFBrY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XSsxn+Ws3d5O3z3aaunYMZIjavRfCZfpzp8h9iir0YW7N0YIl/Ik99pOkdkzi3qfM
	 pfk43XbRkDmW5MNFTnKwvslsm1v3KNzTC9V+Rw17obzOcDMf0MjEu28NP4Ulxf0Wsg
	 vkM4ecE77rNpDqFaH1E8UjPTJYAgVptD0Us4I9EUJjzi1RFwwEul2jLnvdTPRKhim2
	 zNjCgB2vHzcgzpyPDtXtygQfEQo0yEFxSSuIj3Ju9ge+GrZHYb0Ha8kTho4PhkoevV
	 VxDJVPnU2OsURV9SBVZ8PHVCJhbSAzjbE3zpquu45UaBwbiOYilPGq87tG1nzl6HGN
	 L2PIR4U9HKt+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWVfvomC
  KwbPz+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bn/AksBSu4Kh518DQwbuTsYuTiEBJ4yCgx
  d9UPRgjnMpPElR2z2SCcPYwS+98uAnI4OdgEpCRu3P8PZosI6Essnb2HGcRmFlCRePG7hx3EF
  hYIkFj9cCYTiM0ioCrxsG8eWA2vgJPEgxnnGEFsCQEFiSkP3wPFOTg4BZwlGq5Zg4SFgEou32
  1ghygXlDg58wkLxHgJiYMvXjBDtCpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoVpxaVJZapGtkoJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGLopxYx7dzBO7vurd4hRkoNJSZT3zxqBFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  P/OCKYICRalpqdWpGXmAOMIJi3BwaMkwpt6HijNW1yQmFucmQ6ROsWoy3H1ypW9zEIsefl5qV
  LivH9BigRAijJK8+BGwGL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3mUgl/Bk5pXAbXo
  FdAQT0BG88wRAjihJREhJNTBNsxVl2RY6a1XrkVusPC5Wl3asyXT6HW1gm62wxoZ9jV7/id97
  Pqy6NiE67//ma8Yivce/Wb/tFg246Fq7/dh6NbbPCl//C6S0W2m1CIUeOrdF4Xj1/ZPNC+Xkk
  5gFgty2RwS8E3Te9Hq9Aeu5WGGFD7NOmnncmRwRqP9jA6vZd63FOzc/qdbTn+715RLzylc9kS
  Etxw8Uel352PH9wJOVvk+lf6utq7L5+Cj+xMyPvOzVlytqJv57vff4xZT5SRzPo2fr/Tl2M82
  vPOis6FPrwEWmF3aKGF+ui2c5/mMa90PZL0mlcsdSrwWJ34y4JJspZ9m5XVx8MfPUxm1Tpi7o
  OPZJ15xn2oxJt3S8v3yWUGIpzkg01GIuKk4EAB02d9xkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1678889262!70919!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4315 invoked from network); 15 Mar 2023 14:07:42 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:07:42 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5D84F150
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:42 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 512197C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:07:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.168.1 -> 2.4.169
Date: Wed, 15 Mar 2023 22:07:18 +0800
Message-ID: <1678889238-20738-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889238-20738-1-git-send-email-wangmy@fujitsu.com>
References: <1678889238-20738-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101551

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Changes
- Bump changelog.
- Bump version.
- Bump templates.
- Bump deps.

Fix
- Add local key in MISPTag.
- Use pytest for the tests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.168.1.bb => python3-pymisp_2.4.169.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.168.1.bb => python3-pymisp_2.4.169.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.168.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.168.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.169.bb
index 3d55f35c3..a82b26851 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.168.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "5fa99aa55706321767576ea501ce08416d970ace"
+SRCREV = "be755277b85cd6b06a1c2d6bb793f47ac891cc66"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


