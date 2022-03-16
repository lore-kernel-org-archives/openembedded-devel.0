Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F575C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:36:59 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.22553.1647419814157566179
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Dy27F2wJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419812; i=@fujitsu.com;
	bh=ZcQ5pdzLT3hDjTd/nSqpmwMj2LSt36M3oIGz0nYI3A8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Dy27F2wJlSISwcbbsbC9Gg6NPr/2lib/XQmb3lZ33ZAYFKpkbTyYUr4Q1i5F7+Wwi
	 kfocX5PYdT7eUwR7umW6mSDd8lQ5sKVDEKv1GdOLGdiuRb0iOQR/ryqwHNWzAsKlfI
	 +SC1E0IRx7ArJEkOGYYJm5HYEJ225GR99QIPwPT6gSZkKpIs5EXSOZAY29RLjb0uEo
	 pH1MURpdMeHJTzvNhUrO0P/ErWQr1powvOnx8AqE/IFh+YjNFJEo4dasOpk25grOeZ
	 YzHJ9LmYwgqRN/mrfwC1DTnmPdtq/7sgr0WU9bHfFBxSrtiOD0yM4JdbE5YSXMDLX1
	 uh9zWxqehtv+g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqLtkoWG
  SwZtvbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8avHbfYC9q4Kta9+MvSwLiUs4uRi0NI4Amj
  xJHexawQzgUmiTsXexghnBOMEm8WLGPpYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAU2Jj61mwOIuAqsS7L7uB6jk4eAWcJL7d0wAJSwgoSEx5+J4ZJMwp4Cwx/XgFSFgIqO
  LyqX6wTl4BQYmTM5+wQEyXkDj44gUzRKuixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgt
  J+wJGplWMVklFmekZJbmJmTm6hgYGuoaGprpA0tREL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMIRTihlm7WCc1fdT7xCjJAeTkijv+ZmGSUJ8SfkplRmJxRnxRaU5qcWHG
  GU4OJQkeG8vAMoJFqWmp1akZeYA4wkmLcHBoyTCexMkzVtckJhbnJkOkTrFqCglzsswByghAJ
  LIKM2Da4PF8CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrw2M4Cm8GTmlcBNfwW0mAlo8Tx
  pPZDFJYkIKakGpoad25sWLUisS3HNlGmyDnJa0bz1pbI62zHdgy0F2u7XY14pCMyf9HCe96Ld
  5+76Ke29EvlpB9tcm/fPu6rXdp7bE7AtbdrmbauLWuPsTfaYiu14V8NT49vx7rX+0/JXakkTb
  gTsybvK6VeXt9Hmy2urdusgG9Vkk+iSFW6ftM/tmbg9Zfq0lDd9W7w4cqvVX/lWf0oSPm6ntH
  QRv1PumxfRDQsvPopXLrxx2+azet270LuBQjm1CTNMFwUH/dt76qzRnbnLDYz2Fr7+xTjv8vo
  XEZ97J5bx9E/z1CrZd2LDjGXzAlhM69/37u6Y8/puFM8Hd5fbIfMXL5j+teqqsqtndXCmRe1M
  qcuuFf+FJJVYijMSDbWYi4oTAbXQqUJcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1647419811!16630!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10659 invoked from network); 16 Mar 2022 08:36:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:36:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 86FF71001A9
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:36:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 58D21100197
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:36:51 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:36:38 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cppy: upgrade 1.1.0 ->  1.2.0
Date: Wed, 16 Mar 2022 16:36:18 +0800
Message-ID: <1647419779-81651-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647419779-81651-1-git-send-email-wangmy@fujitsu.com>
References: <1647419779-81651-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:36:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96016

add dependence : python3-setuptools python3-distutils

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cppy_1.1.0.bb => python3-cppy_1.2.0.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cppy_1.1.0.bb => python3-cppy_1.2.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb b/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
index 79ddbed7c2..f86f571938 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
@@ -3,8 +3,9 @@ HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
 
-SRC_URI[md5sum] = "2110891d75aa12551deebba1603428c6"
-SRC_URI[sha256sum] = "4eda6f1952054a270f32dc11df7c5e24b259a09fddf7bfaa5f33df9fb4a29642"
+SRC_URI[sha256sum] = "95e8862e4f826c3f2a6b7b658333b162f80cbe9f943aa0d0a7a6b2ef850aeffc"
+
+RDEPENDS:${PN} += "python3-setuptools python3-distutils"
 
 inherit pypi setuptools3
 
-- 
2.25.1


