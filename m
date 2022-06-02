Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DC1CCA473
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:36:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.1718.1654133814330244122
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rP3O6C8y;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654133812; i=@fujitsu.com;
	bh=ZA8p8hUfoEf4DdHnoKv5un8AH46NDqHzlNeoCbr/6IU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rP3O6C8y7GucSPYqLJA0iWUaLA+ji1mYoOdaFEROkBeYRatR3EHuAs+ZoVkY8+ro3
	 LRcezmVatehWgfUTPGhgn6BcQHzgRupAOiJnqdOgEnpvmOV+KoTd9fsaghEK6R31zs
	 2nm7gH3o6ipvzxvS51gU8617M/S944BUNDm+O6QSdS89WhFkXT6VyHGlh1OfPF9rFb
	 lFAIIb9xMabAxtxJFinAHXX0hAmOhd65ZOY35jtmz7kYj0SbzfD34g859dlr1iy9oL
	 34Dar/yEHN69fSyiA+CYa9jW8z3A64C0Sfqx/JW2dz/fucinJ/+98CPnDjD2qkki2r
	 UXn9HkKILdySg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORqGssMiP
  JYOZUA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNlyyemgnUcFd8uLWVtYLzK3sXIxSEk8IRR
  4unF56wQzgUmiYk7ZrBAOCcYJSb/O87UxcjJwSagLvH45mtGEFtEQF9i6ew9zCA2s4CqRPfFN
  ewgtrCAh0Tb/vMsIDaLgIrE1Js32UBsXgF3iTVLXoDVSAgoSEx5+B6slxOo/sTuR2D1QkA1H9
  79Y4SoF5Q4OfMJC8R8CYmDL14wQ/QqSZxY8ZEJwq6QeH34ElRcTeLquU3MExgFZyFpn4WkfQE
  j0ypG66SizPSMktzEzBxdQwMDXUNDU11jY11Dc0u9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAQE4pVty8g3Hiyp96hxglOZiURHl3Ok5PEuJLyk+pzEgszogvKs1JLT7EK
  MPBoSTB280/I0lIsCg1PbUiLTMHGFUwaQkOHiUR3jxGoDRvcUFibnFmOkTqFKMlx9TZ//Yzcy
  wHkzO/th1gFmLJy89LlRLnrRMCahAAacgozYMbB4v8S4yyUsK8jAwMDEI8BalFuZklqPKvGMU
  5GJWEeSWFgabwZOaVwG19BXQQE9BB175NATmoJBEhJdXA5B//aYHhfjfXrRUR56buWFYSsWCG
  v60OM9NG8WOJcrUtc851nZotuiLK+PpW/S/zaj8qCfw/MXGhhrxuSdqfyiV92zwEGdZarWVqi
  giJSM/M0ZP8fk1ep+fG8oXdz57fP7zGetGTvQ1XW/9mR/ZfzDfb2ad7fOOL6beWsrG9yxL/HT
  x97eH9K7KEK9rOeD0/GmxxoOiFyiE/a74QueuLH2Qr5R3ecFK3xO0k24+/VwptWfy9Zp+v6GH
  YP+s8G5f0W5uyxY3XVMue9il77uf///DWG0Od1KJF/m2lejcnymYsDb520rWvsi5ErqnESMBn
  /3SdvO07vlZoBrnVnfotJJ3vKLJNJ7taT91Ad3myEktxRqKhFnNRcSIAHnlwjHcDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1654133811!92527!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22676 invoked from network); 2 Jun 2022 01:36:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 01:36:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6725E100180
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2CB93100189
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:36:51 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 02:36:39 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mypy: upgrade 0.950 -> 0.960
Date: Thu, 2 Jun 2022 09:36:17 +0800
Message-ID: <1654133778-20912-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654133778-20912-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1654133778-20912-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:36:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97369

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-mypy_0.950.bb => python3-mypy_0.960.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.950.bb => python3-mypy_0.960.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.950.bb b/meta-python/recipes-devtools/python/python3-mypy_0.960.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_0.950.bb
rename to meta-python/recipes-devtools/python/python3-mypy_0.960.bb
index c268adebe..5d99b6468 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.950.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.960.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "mypy"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1b333cfbca1762ff15808a0ef4f71b5d3eed8528b23ea1c3fb50543c867d68de"
+SRC_URI[sha256sum] = "d4fccf04c1acf750babd74252e0f2db6bd2ac3aa8fe960797d9f3ef41cf2bfd4"
 
 BBCLASSEXTEND = "native"
 
-- 
2.25.1


