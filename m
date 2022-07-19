Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A187C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:15:47 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.37700.1658211344361913440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pyoGhe24;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211342; i=@fujitsu.com;
	bh=ZXURIr5iQUX6ohLVlkNLB7Kvsi3DMX1oUR3Jb8ox/+8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pyoGhe247FKrIEvdOMiULTI9fpVt4qwQ8LCnZe1eky+mTWhP2o8jgRQZ9SfbYakrG
	 OeZeSmb3EQYkejAIV75D/POHKfYpcgIbPZnLQzgVzt1eHLnBqVFumbEEvHRGSof49f
	 un8hExsSIx8DMClhraW03jqIfVFqIBGCZrHTPiRy2E7fUnj3iRxRl/tYhxTIa3lVy2
	 irEiwxf1mDp36n+FzRxmGOevv9NfDCfy1bZpekSqLIL2XYIaGEtm1rURwpaHJmfQNr
	 L9a9PTzPigWRuBBRoenhF46hbzZqkExUuFST3dO3g0sRy3bIrvFkq1csNEPw4Y4CwN
	 5A7j6de2WUTVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8MxSZfP51q
  SQeMPWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePQ5IUsBTPYK/Y0n2RuYNzJ1sXIxSEk8IRR
  4uv3GUwQznUmieZpt1kgnD2MEk/O7wXKcHKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAmsef9XLAaFgFVidd3r7KB2LwCjhKn/l0CmyMhoCAx5eF7sF5OASeJV9v+sIDYQkA1iw
  8sZ4KoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/
  AyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0FTXUNdIL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIRTihmZdjAu6/upd4hRkoNJSZR3qua1JCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvBc8gXKCRanpqRVpmTnAeIJJS3DwKInwpjkDpXmLCxJzizPTIVKnGI05rl65speZY+bXtg
  PMQix5+XmpUuK8hV5ApQIgpRmleXCDYHF+iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbxX
  IFJ7MvBK4fa+ATmECOmWS0xWQU0oSEVJSDUyJHc1hOcn7F3wXSJ7F+nwSo4RNrSTj69V3l8hx
  Hjt0I/HUahnhhDkPb/2aZvvq7jc5Zx+jEm2JA1cjKhM3Ptzzr6xk/66qY7EOjBbOB0u19D94R
  vGmWFy412Cr87q+eOdT2U+31XknPy0989lxaoaqVZVZivx2r3Bm+0lHuiwld8w8VVhgJv49cn
  PDJLeJmT975CbfWtRe/tO08fjurd+FvydxVXy3Zm21OLXMyvfNru1aAZ4nX0mbrOt6fLSyaWU
  W483NZlZZ271Uu3/7vbszIW7FOz6NzcryeifatRLsOl+8264Zd3dmWxzHs+kWl0q4Pq459HKp
  9SfbHgbRL54HFp0MW5zPupjX+ss2q6lKLMUZiYZazEXFiQCPvEdmbgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1658211342!58418!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1196 invoked from network); 19 Jul 2022 06:15:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:15:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 232B71000C0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:42 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 167581000E9
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:42 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:15:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ndisc6: upgrade 1.0.5 -> 1.0.6
Date: Tue, 19 Jul 2022 14:15:25 +0800
Message-ID: <1658211328-2951-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
References: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:15:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97892

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index f5467794e6..a65ab758ab 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PV = "1.0.5"
-SRCREV = "b706f5f01aa82aa0db678fffd15a1527f330c507"
+PV = "1.0.6"
+SRCREV = "7e314b23329f9c24c4c097b8513673fed7e7158a"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            "
-- 
2.25.1


