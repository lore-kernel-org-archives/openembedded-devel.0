Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D72C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:06:47 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.1741.1666055196923600140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p1Q4Q2/I;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055195; i=@fujitsu.com;
	bh=nl11FS09BoGn/600NFlQqAdiPUWpTxxsvs8b2RKPCBo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=p1Q4Q2/Ipjx6xLW6LFek/FHcBgyoBzsJoUTcYP4ZSO13BnrotcrF658ER++8Q3xin
	 EhO0+MwiGV2VwV5nAnxWgGW7Z1iiW8K3ULiHpAGyeNaHZF3/pgkXV/UaBuzsW9lrFy
	 RAdz+XmJHqftB/d3k1QOUl0HNO07omwfohB/RehicR7j3F/IIPJ8TGWAf7dNrq+qhY
	 Hjs061v6M3nJatwcqIFAcpAgP1ylUcyvayhiK9KOcUAyDaUCtlHpDlJnyitcYmG9Av
	 LrC98NxXLcJ8qXt8StyEi6Uj52uXksJ9Wn6tJhhXDb7/VIjgaS7qrIcPZU3e6lMP9P
	 OSa+EBDBKcMkQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8OxWVfqj2+
  ywev5ghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bvg2fYCq6zV/w9PI+tgXEaexcjF4eQwENG
  iVtbF7NCOFeYJK5e/QnkcAI5exglbn+KArHZBNQkpt+6ARYXEdCXWDp7DzOIzSygIvHidw87i
  C0sYCvx9NYGNhCbRUBVYvKnyywgNq+Ao8TND98ZQWwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgix
  fMEDWKErMvN7NA2BUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYxmhanFpWlFula6iUVZaZ
  nlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhmJKMdvvHYznl/3R
  O8QoycGkJMrbMcM3WYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb8cPoJxgUWp6akVaZg4wLmDSE
  hw8SiK8UWeA0rzFBYm5xZnpEKlTjIpS4rynQfoEQBIZpXlwbbBYvMQoKyXMy8jAwCDEU5BalJ
  tZgir/ilGcg1FJmPcAyBSezLwSuOmvgBYzAS3O2O8FsrgkESEl1cDkHH6Aoexgt/jMjReZWTN
  0TrJsy3vc9vjftJ63OUXKNxvm5P//GNh3P1H6l5ez2pHM3pdm/8/0xCxZ03jmqtiNtwy+B6LX
  37vxpjlB99fPNUzrOFfOY1f+HvZBMNnotM4hs5LS+ITtWz507nzPGbv3ivsOFuGmR/wbC1umW
  7U2m297/yZ5fvOakxZXFulzR80+N0Os6179LIXX2dPjdmZM2vDg+M2v+aXq1jXT2VTMrhl2/0
  v2Pb7Canu58qnVa1ML2Jqtyw4E/mv5+VEltUBj367C0GrdjyH3D0z/dTRkyeOtXUdyBNhTVn1
  Q6tn6ccrfWzccV8/YedFO7sDGWvklE+s++069ouxm68ji/tRbWYmlOCPRUIu5qDgRAKETqnBA
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1666055194!581550!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17485 invoked from network); 18 Oct 2022 01:06:34 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:06:34 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E3A7C151
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:33 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D748B142
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:06:32 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] broadcom-bt-firmware: upgrade
Date: Tue, 18 Oct 2022 09:06:12 +0800
Message-ID: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99207

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
index f45ea5e4a9..4b6026ebc0 100644
--- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
+++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
@@ -10,7 +10,7 @@ NO_GENERIC_LICENSE[Firmware-Broadcom-WIDCOMM] = "LICENSE.broadcom_bcm20702"
 
 LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f8a48b619d"
 SRC_URI = "git://github.com/winterheart/broadcom-bt-firmware.git;branch=master;protocol=https"
-SRCREV = "68a7a8a4f2c4bdd3425c23653a3b9b6609e41d0b"
+SRCREV = "a0eb4805dbb232f02f156b9351a23790c1a4cec7"
 
 PE = "1"
 
-- 
2.25.1


