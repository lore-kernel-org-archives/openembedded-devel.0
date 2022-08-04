Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D20DC00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 05:48:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.1617.1659592073743300550
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 22:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BODRZXZ9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659592072; i=@fujitsu.com;
	bh=yWRIVCtz1K0ikbl+gyrGDXbBW6bOEQGVbZ0tiHxU/4c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BODRZXZ9PxD0HYF2BajXo1Qa5qkAleqakNLrrojLWbVEJ/5lx11G5TOHfbSLnSybO
	 RC87QHsnDgswFeTpTtfpSo1zCUZcYSgvRMxWA4eYEXnv50gkNRjV3c6aUwGh/BZP3y
	 J8vTYCb7QVk4b+nRxCyjGVnlAqdh7lvjqULAU1x6QsMp0GnR052tEVtKOeQ0yU474v
	 gWAW/OKnbUJX7lSyMRnS6+sCl+r2JdALuIgxRZ7syfq6CgisPmyJ4/zuPr9sx0Or1o
	 1BLNOXxn5Nzoj3ym2fcHSDi0UE1UIlUDE+O0EOsW+qn4w2WPUIPKf2eNMzh8dHY9uT
	 gMM7mCGLUXHeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpNse+zr
  JYP89PYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePf0jmsBas4Kxa8XsbawHiZo4uRi0NI4CGj
  xJdXN1khnMtMEoc3fYdyTjBKXPz1gK2LkZODTUBd4vHN14wgtoiAvsTS2XuYQWxmAVWJ7otr2
  EFsYQE/iZ+Hj7KC2CwCKhKTd/8Fq+cVcJP4cuo6E4gtIaAgMeXhe7BeTgF3ib5pc1hAbCGgmi
  NdTVD1ghInZz5hgZgvIXHwxQtmiF4liRMrPkLNqZB4ffgSVFxN4uq5TcwTGAVnIWmfhaR9ASP
  TKkarpKLM9IyS3MTMHF1DAwNdQ0NTXWNLXQsjvcQq3US91FLd8tTiEl0gt7xYL7W4WK+4Mjc5
  J0UvL7VkEyMwjFOK1YN2MH5b8VPvEKMkB5OSKG971OskIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8BdFAOcGi1PTUirTMHGBMwaQlOHiURHgfRACleYsLEnOLM9MhUqcYdTlmfm07wCzEkpefly
  olzhsZA1QkAFKUUZoHNwIW35cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNeArmSJzOvBG7
  TK6AjmICO0OF6AXJESSJCSqqBKWzpabm3itPSCl7PXd89dWb7/8pD4rvWOT7a0FZpPe9CUN21
  1le7TF1nJk36qFOmtfB4yiHzmoO3pBg+s2l/O8k8u+TV7PcTPovXqqXZzY1ecjuK87lRzUn7L
  d3q4twlATXmJnNmv67X+rOWcd/S3DuuRmmbZ0vdijNJCZg7QYulME3W5uSCwkXxQj3zZ/55M9
  Nr1essxz65+Tty3Ny25BQuP3/1aaad4jcN1c5yc3Gmh2sOzXU9uOKTszavp+vOVFb2LUGvjaL
  XcvHsn/Nf09487tGZIzfd3usUfY4zrbQ8WRPJujzA6NQOq/97b0er8ocxHpVWn2i7tHy92YUC
  08vCF7ylpO+n8Qk8eqwbpsRSnJFoqMVcVJwIAPtw4M9qAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1659592071!457600!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8561 invoked from network); 4 Aug 2022 05:47:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 05:47:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7A26E1AC
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6F5F07C
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:51 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 06:47:49 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pythonping: upgrade 1.1.1 -> 1.1.2
Date: Thu, 4 Aug 2022 13:48:51 +0800
Message-ID: <1659592133-4137-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659592133-4137-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1659592133-4137-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 05:48:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98127

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-pythonping_1.1.1.bb => python3-pythonping_1.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pythonping_1.1.1.bb => python3-pythonping_1.1.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pythonping_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pythonping_1.1.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pythonping_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pythonping_1.1.2.bb
index 75cef501f3..3fce07b43d 100644
--- a/meta-python/recipes-devtools/python/python3-pythonping_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pythonping_1.1.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=12;endline=12;md5=2d33c00f47720c7e35e1fdb4b9fab027"
 
-SRC_URI[sha256sum] = "0022f6cbe52762e9d596316e3bccb8a3b794355a49c0d788f7228d90f9461cfc"
+SRC_URI[sha256sum] = "7f783688268334fbfdec31b3a3b105a347844bd621de48d63f38e6ecfaf14af2"
 
 inherit pypi setuptools3
 
-- 
2.25.1


