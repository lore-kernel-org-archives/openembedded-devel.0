Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2B2C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:12:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.20264.1646057538924159909
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=o5EP9KrZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057537; i=@fujitsu.com;
	bh=bMlr4A2v5mtgZI8GLdsIM6QgX5VGBP1WeyW0JrBTNQ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=o5EP9KrZvH1J74rlIbYA+7/0vv54A75HXu7EaeH0yn2MMqh2wxLxt2CsumR1IK27/
	 rFsNMMOCc42jFGfm8njaslSzcLiQ5ZpFq5wj3lK5ud9Ol9zDo8ZRxPQGBF5QTuZljP
	 A8hhUjgPUQImqQRk7IfRU71dbQRmATVDyu9BFzbEFzkPXvOQJpf7/B3MZRB3zVFll5
	 rkHnKopYASrguHh4CdmlvNW6aZ48YICNkG27QzKSpZExGeuz7QgONs1Qhi2JISKQv7
	 hNj1q+A+RggyNVbqcXnimSgMFSPI63ujIkKIZYZJU5fD87MObhBpZards44lkkG7gk
	 byxHAc1GEQQqA==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 4F/A4-21232-048DC126;
 Mon, 28 Feb 2022 14:12:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqOtwQyb
  JYFObjsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHnyXPGgk7eitVXfzI3MJ7k7mLk4hASeMIo
  0bXtOBuEc4FJ4sPFGVDOCUaJCctnM3UxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLGAv8eDGTBYQm0VAVWLzuatgNbwCThJXJ/0DmyMhoCAx5eF7sDingLPE38+HGUFsIaCaHZ
  ebWSHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1Qc1Uk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRKqkoMz2jJDcxM0fX0MBA19DQVNdU18jYWC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzCMU4pZX+5gnN73U+8QoyQHk5IoL2eXZJIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd7OYzJJQoJFqempFWmZOcCYgklLcPAoifA+vQyU5i0uSMwtzkyHSJ1iVJQS5025BpQQAE
  lklObBtcHi+BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5/IFN4MvNK4Ka/AlrMBLT4b7A
  UyOKSRISUVAOTp9zn3aH3BDl3LFc+4XvNO7c/+IdIs+VciZWv2Z7+2hM9q/PT2rKZq4scvZ1M
  RML2S94Pn/rsaOWasK6M74srsydL2F3fZZ+tm3ZZ4uzP9cmfavx3xX+M+lm+V7gw89uahJvzN
  s9a2nnqTNkL+d9TeyV7HFonafBKL64+VtrksMhKc9/208b9lzt2Gwl2m0qtapG/vVlz6SwjBb
  b8528MWo8rsczTYv0250a2wlR+0Rdvlty/dLXhUULGjAXSvlGuu1UyUhZxxMx8bH73axjfgsn
  GvG+Ve+4nnn7dxbBV1EyJ66cYt4JbtcQrluKkTUYrmy/5HGBeZ9AwQdRCPn9p0qXdbDdM86SK
  PvJuPlavxFKckWioxVxUnAgAp85o814DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1646057536!235!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5816 invoked from network); 28 Feb 2022 14:12:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:12:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E4CD91001A2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:12:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D0E0910018E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:12:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:12:03 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.5.0 -> 2.6.0
Date: Mon, 28 Feb 2022 22:11:45 +0800
Message-ID: <1646057506-36235-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646057506-36235-1-git-send-email-wangmy@fujitsu.com>
References: <1646057506-36235-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:12:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95577

Changelog:
=========
Noteworthy changes:
* Backported android FFMPEG build scripts
* Updated android build dependencies

Fixed issues:
* Backported #7303: Fix PDU length for RDPINPUT_PROTOCOL_V300
* Backported #7658: Sanitize optional physical monitor size values
* Backported #7426: Wayland memory corruption
* Backported #7293: Remove unused codec x264
* Backported #7541: Allow resolutions larger 2048x2048
* Backported #7574: FFMPEG 5.0 support
* Backported #7578: FFMPEG 5.0 support
* Backported #7580: Fixed device hotplugging
* Backported #7583: GetUserNameExA: Prefer getpwuid_r over getlogin_r over getlogin
* Backported #7585: Android Mediacodec support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp_2.5.0.bb => freerdp_2.6.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.5.0.bb => freerdp_2.6.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.6.0.bb
index a272cb0991..9b97413409 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.0.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "d50aef95520df4216c638495a6049125c00742cb"
+SRCREV = "8a5c034d547c428c512b0a4b840d3a8a4762f989"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
-- 
2.25.1


