Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F09C77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 09:59:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.103511.1683539977948144995
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 02:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GyEFVxAa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683539976; i=@fujitsu.com;
	bh=HHJTJ5s3d4P+O0eRjpCZ/ScEdtOnNxyc19dhbLzMZT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=GyEFVxAajwJqKmU/On5B4bDwwhh50wf5quR8aFnwx5kEQ8wkkWEtD+fYTMXDev5Jy
	 a5jUD0SqMAd/zaOQZeInlTHIvEG7ZaPHUVaZuG9n6/T0E5jg6HmSc7Y/L7TbSyHuuz
	 4qquidUQckdlbJ6X49V9BHVZzYjXwqOoq8scbGUn435umAZlfqs7D16pQgt653yAZp
	 ejCpDLoptmireCsHscbqlpYvDibN0feuUXkM2F4QWh4nIX11UZhZdME+VvDy806Nuz
	 7LrmqRwC8nJEbl+qZvxmFp/Ylv/8VSYmgeN38vytLpOoBpio9fA8nN8NV4lUKbGDf0
	 YrcBQrX/d7XaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpMt+IiL
  F4MFyGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePOkVfMBavZKv5s3MnUwHiftYuRk0NIYCOj
  xOoW9y5GLiB7GpPEkQvXGUESbAJqEtNv3QArEhHQlfj4YS5YnFlARWLG5CNMILawgKPElvu7W
  UBsFgFViQV3b4LZvAJOEutevmMGsSUEFCSmPHwPZnMKOEusunyaDWKxk8SmPx/ZIWrUJK6e28
  Q8gZFnASPDKkaz4tSistQiXVO9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3
  iytzknBS9vNSSTYzAkEgpTp66g/Hpzr96hxglOZiURHlND4alCPEl5adUZiQWZ8QXleakFh9i
  lOHgUJLgbdsWkSIkWJSanlqRlpkDDE+YtAQHj5IIr+wRoDRvcUFibnFmOkTqFKOilDjv0mNAC
  QGQREZpHlwbLCYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmrQYZz5OZVwI3/RXQYiagxf
  6Xw0EWlyQipKQamLat1Fnl7f7zhJ+D3+5jDoarWzTSVAvceLgV1bw5V815v/qrkdwdp8JVKRV
  PbG/yh+4VLpR6knHANbR8g9mKUKGfd+9tfKLottl+W+kHjVJDo1W1jWfM79d8v5wTPaX87toD
  mVXZKr/kQx+0aybmB6UEJndZq63/d5Dvyt4NR26LSB+1XnM5er7Pl32ySY/zE00q1/Npz9VWj
  J+yIdqk5HHCnvcGuT+fvE5cI7g9a/ZUmUqh9W+73V0aPbrNVZ78k3zFukm62/vINI8VO+8Kv2
  lSYlYUzjn+PSWA6fXduADLdINvz2fxzLx6YfXLxdpNYYLzk0yib/PvWhQlHHxz057o1EeuzRE
  O53pddr9drcRSnJFoqMVcVJwIAHdBk9IEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1683539975!495249!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16969 invoked from network); 8 May 2023 09:59:35 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 09:59:35 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E59C61D4;
	Mon,  8 May 2023 10:59:34 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1351C1C2;
	Mon,  8 May 2023 10:59:33 +0100 (BST)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] boost-sml: upgrade 1.1.6 -> 1.1.8
Date: Mon,  8 May 2023 17:59:17 +0800
Message-Id: <1683539957-25094-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683539957-25094-1-git-send-email-wangmy@fujitsu.com>
References: <1683539957-25094-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102384

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/boost-sml/boost-sml_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
index c83181cfea..a06122a644 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 DEPENDS += "boost qemu-native"
 
-PV = "1.1.6"
+PV = "1.1.8"
 
 SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master"
-SRCREV = "23e9a24e434cac9922039cbb43ca54ab70bef72c"
+SRCREV = "8eb63a8b77bb662075dd36b316e53f75e605fd0f"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


