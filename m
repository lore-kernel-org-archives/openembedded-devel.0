Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374C4C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 13:34:55 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.8990.1676122492599871681
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 05:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Lf+IxQ6y;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676122490; i=@fujitsu.com;
	bh=Ni+ydDSy31kTaJaCBRjpSLqfpzZ38eV4hpdLA1Um6dY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Lf+IxQ6yPYF+rCxrsfebuGr1nZ1k4/t/fI7blq4muTooLUJZ4YQlKKzATtAAX57b7
	 +w8opvG4JisTtg5WunZtyxD0zb4lAr3cZ6jR5+BGdtFAqSM28oFn4m6t4BWjU3hCOR
	 rWY0QpmsuZcYL3D1wPIV0GAtKnxpK/ad0Vgs/+Vug2Hsz4VhxZ7lmGqqM8jqyeJo4X
	 wXR/7CYOkzw8EhA3PHabPRFLEI+kAw5eCXghBSc5vOJ1c2IKBJO3qbusLUIJLBU4HF
	 2TUeEp9m+U4RKZTSuBk5hBKLIzes7rWZVayCYtqmdVtecLlBnpZduGGDjwaF7b9vJO
	 tb2/KRuCydadA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqFs583m
  ywby/5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b3+2lsBbN5KtZ1T2dqYPzP1cXIxSEk8IRR
  ov/TETYI5waTxOED05ghnL2MEh/7FrJ0MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgI/Fgwz9GEJtFQFVi7rQ1YHFeAUeJY9vXMoHYEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJVo//IKy1SSuntvEPIGRfxaS9llI2hcwMq1iNCtOLSpLLdI1NNBLKsp
  MzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzHlGLG5B2MV/v+
  6h1ilORgUhLlXbb5abIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5lE58nCwkWpaanVqRl5gBjA
  yYtwcGjJMLbPR0ozVtckJhbnJkOkTrFqCglznsRpE8AJJFRmgfXBovHS4yyUsK8jAwMDEI8Ba
  lFuZklqPKvGMU5GJWEeadOAZrCk5lXAjf9FdBiJqDFDFJPQRaXJCKkpBqY9szQbTnMNOfag1u
  byz+tyBTVniP5VetHne03sRvbHj3f9MpNbfIaudUni57cNoh+ZNOsb5Ot1DVLI1l0ysJrln1l
  enm3fV4H/1R84NAVJ/D50c/PetsZwqaaSc1fsMdxzolVR+J/HDlhPz1ylSkP18Lnx+1+rBcTm
  y0pOJPnkenrSVL201XVbW4c8fl40qZi+a/C9dp3nszWvX0l3OiIRc3eG1WKD9v3qIpd/rX/3f
  QUxt67H48pi0p+UW6UOGPVscLKfG/4PsVmZePpbGfKOOb5P5+R1qpw6PLny75/px1w7W+afYa
  X9ZVY5qHmzitt/S+VL2/9mbSda98mx5R7B8OrnzwT669dck+TbdOGByuUWIozEg21mIuKEwEx
  4uljQgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1676122489!447475!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23156 invoked from network); 11 Feb 2023 13:34:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Feb 2023 13:34:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8A204100197
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:34:49 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7DC4D100191
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:34:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 11 Feb 2023 13:34:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.3.1 -> 4.4
Date: Sat, 11 Feb 2023 21:34:38 +0800
Message-ID: <1676122479-6002-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  Add codespell to pre-commit config
  Allow venv_install in config file
  Avoid problematic tox 4.0 and 4.1
  Update macos instances on Cirrus CI
  Replace deprecated set-output
  Update CI templates
  Add comments about building sdist in tox.ini and FAQ
  Update Python version in Read The Docs configuration

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyscaffold_4.3.1.bb => python3-pyscaffold_4.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.3.1.bb => python3-pyscaffold_4.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.3.1.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.4.bb
index a19e38770..980b6d965 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.4.bb
@@ -9,7 +9,7 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "50cb1f910163204caec30c7c6bbe70f1a81c377538b8c8340d23abe31f5ca5b4"
+SRC_URI[sha256sum] = "94088d129b61cd9b4b4607c6a466759b1bb2ada36206d5ac20aa319edcc5d701"
 
 inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "PyScaffold"
-- 
2.34.1


