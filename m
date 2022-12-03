Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EF1C352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:16:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.101762.1670066204067958732
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p88xm6E3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066202; i=@fujitsu.com;
	bh=Rz3oOn83A3aWcKDihfmrAg6oed9mp/iDOpMURyTL6W0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=p88xm6E35AFpVVoxQY6hdkKy4ZrPNKDi6bgazcHvQASO6b3cWQ5vepO9Kb0nPCaeE
	 umfPGyoyAGBZut8TnOJb34iugZEjK7ZzroT74tXslRjI3z7Sf0G+lTDURozTsMgPcj
	 XhyZxFvOCKp6Xu10aiH2HmTql8N1FSRqu5WKoJMSFVfEprFtsfPQ2aUNXes1op3ZLn
	 4DQs00W6yl4PxtVbTXMS5mG/DLh/tlCyXztkr+e3+X9jLSSnJ1qARbyhF90slcgfUz
	 OkfrRq0M8SiEEiSnEkCH+MRje5A+kkKxGbR4uWPyDes8rN/vnVHp7Gn6FhB68Da9BO
	 RXL4tS2O3S/Vw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxSVfSoDv
  Z4OB1A4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPTxL3MBU2cFce3/GVqYFzM0cXIySEk8IRR
  YsE2wS5GLiD7OpPEin07mCGc3YwSTbsms4JUsQlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgLbF/83KwehaQ+Ot/QPUcHLwCThL7PieChCUEFCSmPHwP1sorIChxcuYTFogxEhIHX7
  xghqhRlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0bQ4tagstUjXRC+pKDM
  9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBBTitl8djD+W/pH
  7xCjJAeTkijvsbCuZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvIH63clCgkWp6akVaZk5wKiAS
  Utw8CiJ8HapAqV5iwsSc4sz0yFSpxgVpcR5N+kBJQRAEhmleXBtsEi8xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmYVwxkCk9mXgnc9FdAi5mAFm/k7wJZXJKIkJJqYNIrnnX76QbbinmJakL
  mMst47/4W+W/1/7ylV2Hy4x7vDVyd250Wpd18osYasK3bSGbNy4RbfLc5Zxi9zjAucDk4qzZK
  e4KOtFh39Kfl2hb37PRrbSIyruzLvuZWt90n4p/Fp51M5RO2bs/8N//to7DAtANdR37pXt3c9
  NNh9WyvH/c3Fku/ClsctaVam+FGYNCPm3fcbycXyXtcNplaH/oi+Y60vuMn9rxreRcPFDFMb0
  7ojCqZdNmbdcZfE9Vqoc0tXj32wv/t1/AscFysmqq/J55D8I7DLxN9xvgdfmFli3OfluuHqmu
  9+ez6+s2Bc0WPfgh/qyzhSJh8xSghc/vi60uTD0yr9Xu2i3O+rhJLcUaioRZzUXEiAOKCzzI/
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1670066201!272748!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13398 invoked from network); 3 Dec 2022 11:16:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:16:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6EC7B1000D7
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 622F51000C1
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:16:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:16:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.6.0 -> 8.7.0
Date: Sat, 3 Dec 2022 19:16:12 +0800
Message-ID: <1670066176-24685-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99926

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.6.0.bb => python3-ipython_8.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.6.0.bb => python3-ipython_8.7.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.6.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.7.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.6.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.7.0.bb
index 74fe986c9..b5bb99b1b 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.7.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "7c959e3dedbf7ed81f9b9d8833df252c430610e2a4a6464ec13cd20975ce20a5"
+SRC_URI[sha256sum] = "882899fe78d5417a0aa07f995db298fa28b58faeba2112d2e3a4c95fe14bb738"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1


