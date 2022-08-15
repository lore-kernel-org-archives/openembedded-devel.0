Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3952C25B0D
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:29:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.13593.1660544954912591357
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Li5t0Drh;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660544953; i=@fujitsu.com;
	bh=MBgKr8I2Iw/GrHamX6PPkdoIvjWYx3qNiXhb6kYsWvE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Li5t0DrhyLk1D3ScDJIf0NBuClzo0kvWH20SSV3CSy4Y9830oKIkfXbRMlfqK0tw9
	 bg5G3cj98EKyjtSk5/9s6np9/6EjuB6siappK4Pe+OvfSWd0kO4gIclu5m8j1vH3ZG
	 vnSPNQCyYQj2j2Rq3FZzcluD426kSXKOqUloxfZeq2EGKYqhWQ/jXzQ9qrrRKfSCtW
	 mgTd3NG519G7Hkupfoi7NEOGCHlfCS+tnoaMyZgGt2vkYk0yAfgO/PxQzE+joj2tyN
	 NGMc0Hh9++F0hmhixHEuU5cKjumZHn2kJYmIxdaCmojlGX7c72IHsIqVoxDPwuVVnO
	 ffqin9CKeZysQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSXfH859
  JBnsnqVhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlLLk1iLvjOXrF7bUgD43z2LkYuDiGBJ4wS
  E7pbWSGc60wSd2ecYIJw9jBKvG5ewtLFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICnxJmeyWA2i4CqxLWdXxlBbF4BR4l566aBxSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmLGNDcJWk7h6bhPzBEb+WUjaZyFpX8DItIrROqkoMz2jJDcxM0fX0MB
  A19DQVNfYVNfQxFIvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwLFOKlafu
  YDy96qfeIUZJDiYlUd5rF38mCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgNXsMlBMsSk1PrUjLz
  AHGCExagoNHSYR3wW2gNG9xQWJucWY6ROoUo6KUOG/dM6CEAEgiozQPrg0Wl5cYZaWEeRkZGB
  iEeApSi3IzS1DlXzGKczAqCfPygkzhycwrgZv+CmgxE9BivbvfQRaXJCKkpBqYZpWef7fhtPS
  LTNYV815FzmDl7XE7+y5g6yUdtQv/J/HpT5quzC8QbGNc03pj1e89HQvOR9zo3Lp407rruuWK
  4b+azwRFF99gmTn7iFOyfbCGp5Df8UM7LdectPPQsymZevmhZsxX3cj593vPlld/rwy83aXzN
  kGDmXOqzoxbNi+Yj318/qbwn/zzr+FeAn51k19HNScsdVua97xO6/x398rD3NFOGhoTgjNvLN
  08q5nr6PdTT4JL9hi23Ezf4bbij9kdu5/z5lk/PN0i/eL86fi5i19PFdWbvcTpzb2vmzfNmPf
  p9nk2br5/Nks5VV79Kexv7C0Jvbbg/2+zmmUq/rM/9Dy06pS159U6vJTxkrMSS3FGoqEWc1Fx
  IgCZpwAwRgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1660544952!59221!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10984 invoked from network); 15 Aug 2022 06:29:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:29:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4CEEA1000C2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 40515100077
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:29:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ipc-run: upgrade 20200505.0 -> 20220807.0
Date: Mon, 15 Aug 2022 14:28:53 +0800
Message-ID: <1660544937-1453-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98239

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{ipc-run_20200505.0.bb => ipc-run_20220807.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{ipc-run_20200505.0.bb => ipc-run_20220807.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb b/meta-oe/recipes-devtools/perl/ipc-run_20220807.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb
rename to meta-oe/recipes-devtools/perl/ipc-run_20220807.0.bb
index 34f3136de9..f597a8dab0 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_20220807.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ebd37caf53781e8b7223e6b99b63f4e"
 DEPENDS = "perl"
 
 SRC_URI = "git://github.com/toddr/IPC-Run.git;branch=master;protocol=https"
-SRCREV = "af435a1635ef9e48a84adc3230099e7ecf20c79d"
+SRCREV = "44b1f2d2021615c88f2f6b1a6cbdd9aebaeb4ad1"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


