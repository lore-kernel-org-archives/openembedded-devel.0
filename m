Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892CEC10F31
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:36:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.37614.1670830579621356595
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I49TwaE3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830577; i=@fujitsu.com;
	bh=CF1sRAaCIXlKhuJrtARtjo6tadcJB6kuqRZvmSog2BI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I49TwaE35hd3OQNmVGsfSVaKu+56ZAqt5etjXa+0I8YIX5G8P/4KmQkY1x4UED1m+
	 3gSzdS5AIjTh5mw/FsOx1a+jVBhj9PH20DjtW4X5tdd8arKMszkrE8X5O1AeTCuzhY
	 B4po1N8t7bKOENOijhvJR1fOOhdy7F8qCunG4/bF/Zt88Fi+KQZcFwURJ+rl2AV4NS
	 kVCbM+1Q17JM1ivpLNWgkSrduivP4EuZEZUjMCs2UumNGRmV0/mi+aim6C2ygCj5TQ
	 SIsmbnAF4eWAeB8WsT2bueXEIb2KGPoVVDyNZCVlC8/aepIl3j29Qx5QIbS0JgOsPs
	 HrxOpd77gBSkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxSffjzWn
  JBt/PiVhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkrju9gKzjLVbFt0VnWBsYTnF2MXBxCAk8Y
  JQ6c7GaGcK4zSUxu64By9jBKPNtwiqmLkZODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972
  EFsYYFAiZaVk1lBbBYBVYmzF++D9fIKOEpMPLcXrF5CQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  VUjaLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYxmxalFZalFuoaGeklFmek
  ZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiB4ZhSzDB9B+PPZX/0
  DjFKcjApifJWXpmWLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd8M1oJxgUWp6akVaZg4wNmDSE
  hw8SiK8biCtvMUFibnFmekQqVOMuhzN/38fYBZiycvPS5US52W/AVQkAFKUUZoHNwIWp5cYZa
  WEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPaXAeawpOZVwK36RXQEUxAR0S9nApyREkiQkqqgSm
  Th6uq2mORJn+C34GGRyFX6/bsdHqxrPmm1bSJzrWVl9fs7ODVC3/scoGtdYa27vdFq8vdHs4u
  jJ0jIrBlKUPdtam51/xeacmEOigzOy9nWmK1dmfNX3ZvwfK+ZRx9Kkmmn6b/OajVdld1dus+2
  93uHGYOv+uPrOZYESdn2DVp5T5u7oNyDQt3XOGLYdd+sFPV5d2WN6EnH1TlsM6uPMk1p/XZGc
  ZrQboSk88E24eFeD38cU78zYSVboksS9dvOb2jxfkv+wEVs9nyn000jv1ndGRKmNbScq/vfm+
  OyxOLqqMuvQ7maqE3rhqf0Lto/V33/ecLi15/8u16tObIto6c2jgJx46uqs8TktcGf1ZiKc5I
  NNRiLipOBAA1BntfTgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1670830577!294158!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5095 invoked from network); 12 Dec 2022 07:36:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:36:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E7A0E1000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DB2DE1000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:36:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evolution-data-server: update 3.46.1 -> 3.46.2
Date: Mon, 12 Dec 2022 15:35:44 +0800
Message-ID: <1670830548-3059-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100040

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
I#431 - e-xml-utils: Enable parse of huge XML files
I#432 - Fix possible NULL-dereference in e_cal_backend_file_modify_objects()
I#435 - ECalComponentAttendee: Default CUTYPE is INDIVIDUAL
I#437 - IMAP: Excessive memory usage on folder summary download
I#438 - Trust Prompt: Add issuer's certificate fingerprint
I#439 - Fails to add task with X-EVOLUTION-GTASKS-POSITION into Google Task list

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index e3c09f211..86f01ab37 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "c55e72cff4190b42e63dd6eabc6dce48a1a1f79040531f1af6d51c1efa4aa6eb"
-PV = "3.46.1"
+SRC_URI[archive.sha256sum] = "f9bd52008b7e535d816920cfcec70a0e5562bde28af71f996e203ff6a86e46e0"
+PV = "3.46.2"
-- 
2.25.1


