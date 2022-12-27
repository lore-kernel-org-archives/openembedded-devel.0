Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787EDC46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:48:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.153588.1672123687295606152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VtQw0JAX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123685; i=@fujitsu.com;
	bh=hfOXBJ3TcT9z/r1BhZa+zMDIx1n1ZB1CNPFRBkFuClk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VtQw0JAXVNn9jZq+55dBLkqT6smO0nKsv+IfHPm05nedgkASKN6Lnm2vTsaOzaJ2c
	 KAbGNo8AQdpYl4aNX++RF7Zh9kRCSSnxbP8aoII3lsxK7bapULv3x2/VSsxg2V6mje
	 FpFpi1lgPkrIOlQ1pH5CgQ+n7HTP1+D5rllaWP67FrFCTISa/BijqoDVhesjrSSHWT
	 YxSJjn87kyRcMVRgwkj5XypSlDrNOYGpJaL4Fk9d+c8Gy2lK+mKU4Hh2AJwqLHFJpu
	 13FVQSXaq5jUMJQ5mdv/9n5gY39GgbUXRYHWxoxB6hWtnsnDun1U5kvLunY3Xu+KY6
	 lBRORMMaI+3RQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSVdl6qp
  kg6fbRS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owvh/8wFbzmrOj99oC9gfEBRxcjF4eQwBNG
  iaO7P7B2MXICOdeZJH5us4NI7GGUaGp8B5ZgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBRYueDfrB6FgFViYUXjoHV8wo4SSzq7gWrkRBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaN5cWpRWWqRrqGFXlJRZnp
  GSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYDimFKcE7GDctOyP
  3iFGSQ4mJVFeqe5VyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeEsnAeUEi1LTUyvSMnOAsQGTl
  uDgURKBaOUtLkjMLc5Mh0idYlSUEuf9CtInAJLIKM2Da4PF4yVGWSlhXkYGBgYhnoLUotzMEl
  T5V4ziHIxKwrzqION5MvNK4Ka/AlrMBLT4w6GVIItLEhFSUg1My+1iXt/juXjfSX6iG+N35u5
  HttsiknJDHq7il8w0Cdh99ZJb54vrU/3sPxUo5V2WmbJRreRp0bELz2OfqOT1sGZcU3ZuzWq+
  zTPzwfW3+cqnPu/nL9t//vLfX2mRW84XOlbuYBXl+6V3Ic68uO1h9zz5ps6SF1e1tgfd4cj5/
  nPCgc8RIVyOLz/PvNCQfHG3FavBORepNTWX1VZePRzD389prsArsGHbc48HWXwZYtzbmWdf0n
  itEZnHeub+UckXRae19xZr96dny/qYvFBn7D1y9vRjTTfO1t8hDptmzEhRuR8udyzoYBH3L/3
  YRMfdHR+5U0wsn14u/PXP1HLpjAdGTV9rvnLls//ST7dVYinOSDTUYi4qTgQAr8HpPEIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1672123683!344273!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26067 invoked from network); 27 Dec 2022 06:48:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:48:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C5F741000D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B9F061000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:48:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] remmina: upgrade 1.4.28 -> 1.4.29
Date: Tue, 27 Dec 2022 14:47:27 +0800
Message-ID: <1672123650-32043-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100275

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Hiroyuki Tanaka added to README
 Initial macOS support
 X2Go error-message consistency
 Avoid crash when closing, fixes issue #2832
 Update Copyright for 2023
 Aligning local and downstream jsons

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.28.bb => remmina_1.4.29.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.28.bb => remmina_1.4.29.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.28.bb b/meta-oe/recipes-support/remmina/remmina_1.4.29.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.28.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.29.bb
index 2b49cb5b7..a92a3b278 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.28.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.29.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "852ceab35b0feaba07124265d0e2fa8c629b9dc1"
+SRCREV = "fb19eb5f11f206ffb442a9e0c519cb0f2cb3fd8b"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


