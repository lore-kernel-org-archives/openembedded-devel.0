Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC77DC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:16:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.191023.1673939799926380076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GoxPzZBe;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939798; i=@fujitsu.com;
	bh=1rrtLk2W/5SyLIqTCqGK1niJgtBH1AhZAEZuWuXO6Do=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GoxPzZBe3pnaEuqqnuUj6LezXV60AesfaNMXhmmUbM+jGbGNJ23qrbdTxmi63+sEI
	 Xhc+xlZFMxrjHanAi4A/YjOgb1waE78nELF0EtrCBMQj3Z3pteo3r4049mHiV28UJp
	 YLtnjmCaeeByWXT1w6LGTm+/rimazPg0FCWc+5FDxHNSYHCPufxigl2KwCY9vdB0Eo
	 uLRC1QUjMo00Fjlcd0KTueflWEn9m1reRtnimCGinn95os1IvFKAAmb9fZXA8MNJm5
	 UraUiUCy+khqg1/aIE9tca3dV1I6WwNdrasioEoxskaLW0fT1H59yE6hUwvcPFbWvM
	 FgHvR/Fpfwf5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORpBvqfSz
  Z4PAOVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP/1MVsBRs4Kib/4WlgPMTexcjFISTwkFHi
  85w3bBDOVSaJ74vvQGX2MkqcfLoNyOHkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvHrAaY
  QEHidkfrzN1MXJwsAioSrQscQYJ8wo4STze+YUVxJYQUJCY8vA9M0RcUOLkzCcsEGMkJA6+eM
  EMUaMoMftyMwuEXSnR+uEXlK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNZcWpRWWqRroleUlFmekZ
  JbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgKKYUJ9nsYPy79I/e
  IUZJDiYlUd6TpseShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwnvICygkWpaanVqRl5gDjAiYtw
  cGjJMIbbgmU5i0uSMwtzkyHSJ1i1OW4euXKXmYhlrz8vFQpcd5IkBkCIEUZpXlwI2AxeolRVk
  qYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8TD6ApPJl5JXCbXgEdwQR0hEfJUZAjShIRUlINTP0
  +z/J3h1gUTZ9+0dXs8jL1eY+k92lGJ8wpjZnU99XKd73Ngzul2UbBrWyRG9Ly/r8/WLsksOvm
  lnWTvqvu6+k693hfrblj9tqnXmWfGnxf+0/Zo7aAVWrD+3NhErP+7vm4MzSrrmDFsxiN9q+z7
  7DlzFhcn7bglu9z35vnGxXdU89w3Y+3i/I6EevAud2vXuTfLiFWoSlaIXMjzCan+rr+L3ZMz/
  eottVpXHk99YRjA7/Mq+yVcssuvTczXiv6TX39bptEuS8L1Y15vR4nzNx/t3fvi/Vl3rqHTxx
  5dNX6S6OAM4P0htPRF6e/rJmj57fpT2fzy1nKs66eEhB+d+OQ6BXhuo0LtPIkXul0LVViKc5I
  NNRiLipOBACB2y00TAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1673939797!380097!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24677 invoked from network); 17 Jan 2023 07:16:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:16:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1887F1AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:16:37 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0CF7D1AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:16:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:16:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hidapi: upgrade 0.13.0 -> 0.13.1
Date: Tue, 17 Jan 2023 15:16:21 +0800
Message-ID: <1673939785-20072-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100599

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  hidraw: fix invalid read past the UDEV buffer;

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hidapi/{hidapi_0.13.0.bb => hidapi_0.13.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hidapi/{hidapi_0.13.0.bb => hidapi_0.13.1.bb} (90%)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_0.13.0.bb b/meta-oe/recipes-support/hidapi/hidapi_0.13.1.bb
similarity index 90%
rename from meta-oe/recipes-support/hidapi/hidapi_0.13.0.bb
rename to meta-oe/recipes-support/hidapi/hidapi_0.13.1.bb
index 460eda527..2e62612e3 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_0.13.0.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_0.13.1.bb
@@ -12,5 +12,5 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
-SRCREV = "c3a6150d8801f79a59034045275176e9738b13e4"
+SRCREV = "4ebce6b5059b086d05ca7e091ce04a5fd08ac3ac"
 S = "${WORKDIR}/git"
-- 
2.25.1


