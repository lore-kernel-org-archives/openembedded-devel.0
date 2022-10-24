Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D98C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:51:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.16325.1666594300991520454
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S+049YgK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594299; i=@fujitsu.com;
	bh=OLyWOMnxtuLSIIPIJioNy1/vDRajE2L9r+rMJrhZMu8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=S+049YgKiX5N/aRDScmZ37CHwNQBGfBmuXMFPXKAk/6HS+2ag8Cp9OHYKmd0c58PS
	 fMAe6MLCH9NRuRjLbOR2Qjl5GfRsu+PfqQVKc+YmQTMHCwp0SBxFvaS/OhlKGQPbsA
	 XabABVfgyxtQNWDbEpw2FNtCv8MvmNOJk4f05jyZUME8Zud78eHBWiJm9jvvc3HMGb
	 t2FtYtjEH3HPdkxl7T3U4htCmkPFDB8bypdz8arw+Clzwe7WhARKwiOd3Ik7r07EJh
	 EYOzWbO3IPTK+jK8Foz2aEw4zSAts4pJDT1VcJK63159XfgMWQ4mPEkPQmwSBz7GxC
	 fnojuJHs8LTvQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8OxWfeXaVi
  yQet9fYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaOzu4W94A9HxaLPuxgbGP+ydzFycQgJPGSU
  WHZ6KhOEc4VJYuaBU6wQzgFGiakT7rN0MXJysAkoSCzceoYVxBYR0JdYOnsPM4gtLGAu8fP2V
  iYQm0VAVaLl+1R2EJtXwF1izqnfYHEJoN4pD98zQ8QFJU7OfAI2k1lAQuLgixdAcQ6gGkWJ2d
  PlIcorJGbNaoNqVZO4em4T8wRGvllIumch6V7AyLSK0bw4tagstUjXyEAvqSgzPaMkNzEzRy+
  xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMw7FKKkxJ3MPYt+6N3iFGSg0lJ
  lJdBPCxZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvjRZQTrAoNT21Ii0zBxgDMGkJDh4lEd5ZR
  kBp3uKCxNzizHSI1ClGe46rV67sZeaYOvvffmaO5WBy5te2A8xCLHn5ealS4rxqJkBtAiBtGa
  V5cENhMXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvHzABCPFk5pXA7X4FdBYT0FmXVgS
  BnFWSiJCSamCKCtvt+cZVKi545alF8xbcS1LPmSOotUVDOMFr768t2n5LPPuvXijL+GufUvhk
  14rL15ee+V0/5WaAyBf1qdnhsVEbWrmLHU/nNl97NJvTwvP11Pv7Mw88P7Nrw86prDLtr+rmB
  Jf+iAvhEJVbn3v86pVuORWPgoIdM6Q9eqMsvjfenldXu/jW6lX8fLmpX/mZa5xDIp9PuR14iK
  vw0An/UIP1zpw9kjFWHxY9OiG1hGU+8+/cTzKq3OEbUz7F8E5uD5x+aX+meTT7k+YTBad7vrD
  dNRRk1XNdGeHM+OLngijhqEXOYZOadxmzRc6O71iqM6W1u6ZJccX3y2zLjZc4+ReuDat+6/pt
  YYllpJcSS3FGoqEWc1FxIgAh2h3bVAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1666594298!224782!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5022 invoked from network); 24 Oct 2022 06:51:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:51:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 46DF9142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:51:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3A2C2152
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:51:38 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:51:36 +0100
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] tio: upgrade 2.1 -> 2.2
Date: Mon, 24 Oct 2022 14:51:28 +0800
Message-ID: <1666594288-2994-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99278

Changelog:
===========
 * Add shell completion of sub-configuration names
   Does not work with sub configuration names that contains one or more
   white spaces.
 * Beautify help
 * Fix error message
 * Simplify configfile implementation

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-support/tio/{tio_2.1.bb => tio_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tio/{tio_2.1.bb => tio_2.2.bb} (91%)

diff --git a/meta-oe/recipes-support/tio/tio_2.1.bb b/meta-oe/recipes-support/tio/tio_2.2.bb
similarity index 91%
rename from meta-oe/recipes-support/tio/tio_2.1.bb
rename to meta-oe/recipes-support/tio/tio_2.2.bb
index 1c36bd522c..8bfebc7776 100644
--- a/meta-oe/recipes-support/tio/tio_2.1.bb
+++ b/meta-oe/recipes-support/tio/tio_2.2.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;nobranch=1"
-SRCREV = "14fc77ffc13a4c60a98f0bb7e0f431e9ed7cf1fd"
+SRCREV = "eaab692d4d6be1ef41c0f6950977cf9054520cb7"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


