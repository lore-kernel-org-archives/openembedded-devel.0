Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104D2C4332F
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:34:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.9439.1665275671218179225
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yMEC3DtA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275669; i=@fujitsu.com;
	bh=Qef7Qpss2GvUzQbvKcwuPZrhDkKcDSbJwyaLX1aECOw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yMEC3DtAWNNQeiq21TanfMsBXs16U3S4eiUQprBtJgy/xrcDJvcWWC9HkWegqqp5B
	 4rFcR1xSacnYVNdeSc9OZjvHMZdvp2KPn+XpwziN8pj0vyxmV302KbZ8Ux0JyvzEI+
	 dmdj89Jh9Iuc2ZE2ff7beG9llwxOIKUwhG4yda/fQac8WPHrlJ5RjH9ENSqArrOVZG
	 XnTMdKFqREjZNjgNNGcV37A5DKN1gjNOGmJovI0tJwCu6N7e6Q34yHsGtwI5mfJ1WC
	 lTtruOwx3lwfh0A/9hzTDk8Z8bWviPmZtCud3miA8Uxsz1ocj4UiroYGWBUlKs6+MM
	 WUWRLrZAyyNnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWVdE3Cn
  ZYPJqU4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNr1zS2gkdcFVPmTGJpYHzL2cXIxSEk8IBR
  4v/CT2wQzmUmif3NC1i6GDmBnN2MEkenlIDYbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwvYSUx5eAKshgUovuTHESYQm1fASWJ6Qy8jiC0hoABU8x6sl1PAWaLz6TSgOAfQLieJ38
  v9IcoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hpb6BoZGuklVukm6qWW6panFpfoArnlxXqpxcV6xZW5
  yTkpenmpJZsYgUGcUqx2ZQfjnlU/9Q4xSnIwKYnyPt3qkCzEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgteJ3SlZSLAoNT21Ii0zBxhRMGkJDh4lEd6wf47JQrzFBYm5xZnpEKlTjLocM7+2HWAWYs
  nLz0uVEueNFQaaIQBSlFGaBzcCFt2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzfhAAmsK
  TmVcCt+kV0BFMQEdYPbQDOaIkESEl1cCUvr5sxvrlM3aqllbKbW40WZi1i+uj6YNLAkrbfvmE
  LmfgvPPzyZ2bd5+0raoVeRn/NLhC5FO2CNPi9mnWp5z2ld5lN1EJat0dcIX7foZJX8Yv/7Zbs
  x/e2ukw4Uvo8tMveiLWxq9xvlJhtm1qI9PXmPAXrpP/zJtlWKo7V7kvPTWr2WaBQnZW2+X7mq
  +WRCnu9bJ6nZfHLCKv2bvlRX6X1nTlbVNjtBV4pvkderrMy9uUMTX0y06VkBsvLR4f/ce3LJF
  ttYvAnozN7xiv/ZN473zATXUPU2FA02+XLUGJJybYiiWo3n+8/JHs4QPzubfMMCxLezvhs1te
  qKxV8ozreUsSZbU3x0z22B67pH+iEktxRqKhFnNRcSIAqCgTkWkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1665275668!75847!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15397 invoked from network); 9 Oct 2022 00:34:28 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:34:28 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 973D473
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:34:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8AAF67B
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:34:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:34:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lirc: upgrade 0.10.1 -> 0.10.2
Date: Sun, 9 Oct 2022 08:33:26 +0800
Message-ID: <1665275606-29112-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665275606-29112-1-git-send-email-wangmy@fujitsu.com>
References: <1665275606-29112-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:34:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99103

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lirc/{lirc_0.10.1.bb => lirc_0.10.2.bb}                    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/{lirc_0.10.1.bb => lirc_0.10.2.bb} (97%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
similarity index 97%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index 467e10b658..234d347af7 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -21,8 +21,7 @@ SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
     file://lirc_options.conf \
     file://lirc.tmpfiles \
 "
-SRC_URI[md5sum] = "86c3f8e4efaba10571addb8313d1e040"
-SRC_URI[sha256sum] = "8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2"
+SRC_URI[sha256sum] = "3d44ec8274881cf262f160805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a"
 
 SYSTEMD_PACKAGES = "lirc lirc-exec"
 SYSTEMD_SERVICE:${PN} = "lircd.service lircmd.service lircd-setup.service lircd-uinput.service"
-- 
2.25.1


