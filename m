Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAF2C352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:20:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.101818.1670066429585815207
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CbdCEMp1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066428; i=@fujitsu.com;
	bh=AZdM5HcMzsYOp02vlYioKqI8tYJ6GytgDoZXQN3E8yo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CbdCEMp1vRnKY0gA8QunLo8pS+95J4hYgyRf/Xua0ES/ArZDB/1lBRvUYkBvfmlOw
	 Z1XxKB1CqAeupS5zR17WOpk5ZyQreql8ohiznISnKa6RizonGNoxpwNuPm/irqvERL
	 HeeGBqGEmIRnODEFMCGpVf3qeFBwwwWiia8XAB8teY9QDuRzIAONFQwPyZs2XsMgDt
	 9BQ5Gt+N8AexTHiaT3/1pOckvxvpMa1rPCGexsQUqP+SVJqOnaHLzGOOY34XdQN81I
	 FY+byDBCaZaCrv2y0C8M4v33Duuj1GDz0wTGIhChOuEZh5ym80mEgUVJhnJ7WC12sW
	 GLwVOHRLtmhqQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqPvboDv
  ZYO4TVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPV79ksBQf4KpZ3n2duYLzP08XIxSEk8IRR
  4vWmdhYI5zqTRPe7Z+wQzm5GidOLb7F1MXJysAlISdy4/x/MFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAhcaK9mRXEZgGKb91+CCzOK+AkseDgZDBbQkBBYsrD92C9nALOEl0bF4PVCwHVTO6ayw
  JRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/AyLS
  K0bQ4tagstUjXRC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1
  ZBMjMHhTilU9dzD+WfpH7xCjJAeTkijvsbCuZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvIH63
  clCgkWp6akVaZk5wEiCSUtw8CiJ8HapAqV5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKiXOqw
  QyQwCkKKM0D24ELKovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmFdMDmsKTmVcCt+kV0BF
  MQEds5O8COaIkESEl1cAkdFPr0ocZd+TdHVn72BetdZopcXxZ/p8qjrLtYSbh98yEdgLTlebx
  c1bfsr7csPzodjTp4sWJDIIrz97I47zB1flkoRv3GU/Zxecszi3h/Hm/yEZNLsvUYx3T5+LzK
  +8pvb50gvfg427NAwtnthk5i3yKYtu6w+P382rfh//TPvHsd/ha8UfS5rMmq3iy0JbHvz/m62
  W1nH8m8PN5l9Axoc3Zz3Zr/7684bWyj7UrV+k2i6Ocv8I/M+1dc+JXUHwXw5rfKvciJjlevW9
  zbHfAzVKXyMADs/8+VljTIFSWEMw8z+NVjKJhcXriie2MKfOLPzjrnl9+ceWRy5sWd7/fxumi
  ufD5nRnGZ2PMH+wUVGIpzkg01GIuKk4EADw/ad5lAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1670066426!65265!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8256 invoked from network); 3 Dec 2022 11:20:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:20:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C9C5210018D
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BE062100182
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:20:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] smcroute: upgrade 2.5.5 -> 2.5.6
Date: Sat, 3 Dec 2022 19:19:54 +0800
Message-ID: <1670066396-24989-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066396-24989-1-git-send-email-wangmy@fujitsu.com>
References: <1670066396-24989-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99938

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add smcroutectl batch support, issue #189. Based on the IPC support added in issue #185
- Fix #178: invalid systemd daemon type Simple/Notify vs simple/notify
- Fix #179: typo in wildcard routes section of README
- Fix #180: minor typo in file and directory names in documentation
- Fix #183: casting in IPC code hides error handling of recv()
- Fix #186: NULL pointer dereference in utimensat() replacement function.
  Found accidentally by Alexey Smirnov. Only triggered on systems that don't
  have a native utimensat() in their C-library, or if you try to build
  SMCRoute without using its own build system ...
- Fix #187: strange behavior joining/leaving the same group
- Fix #192: typo in README

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smcroute/{smcroute_2.5.5.bb => smcroute_2.5.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/smcroute/{smcroute_2.5.5.bb => smcroute_2.5.6.bb} (90%)

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.5.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.6.bb
similarity index 90%
rename from meta-networking/recipes-support/smcroute/smcroute_2.5.5.bb
rename to meta-networking/recipes-support/smcroute/smcroute_2.5.6.bb
index b0b96bed8..09752825c 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.5.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.6.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "9ca7441add4427a91fe90c34ae4a178ed9a50553"
+SRCREV = "999bdd724a1f963ac8bfd0598ffdd2a3d651646e"
 SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


