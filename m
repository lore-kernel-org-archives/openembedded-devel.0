Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEC9C4727C
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.7080.1649903584550035594
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IBy1c/3V;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649903582; i=@fujitsu.com;
	bh=nYPfkCN80FeZqcUdFLdqwtF+iz66wvvOEMgvRgh9jww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IBy1c/3VvnCu6Ue90n9fZ4puIjlBF5JEKX45OZLdCbmI3XeZMjTiW1kOPO71/1lfI
	 tOO/SbgMCRLLewLjM7u2ox3R98wgFQI32jRLy5ockcUeKDD8GgDTBBPjWmZnVCrRpj
	 lCgng4S/3PYcohMrQXNQimLta1EF51j3KDeEmZQeqsJ+zi1L3it9cG2hel17Xv6AHS
	 U51hB/K7mNG+MwjjIILNpjxcZdN4LFUG36iFJ0inRZQ8k6Z0mRB7wyPoWXVKd0UBnj
	 Z52KMMck46wDYmvcvK7wXQjghGIRk/QGtWytfTqnhtajbLuRwAmJACcwaqFiOb6efQ
	 nbuKv+qZrZp1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8MxSfdue3i
  SwbJrphYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bb+mWMBRs5K86/WcrcwLiXo4uRi0NI4Amj
  xMYf8xghnAtMEqfPdjBDOHsYJVY8bGftYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBJYvLLXWA2i4CqxN9F89hAbF6g+PK3HxlBbAkBBYkpD98D9XJwcAo4SzzYnAESFgIq+b
  jhBCtEuaDEyZlPWCDGS0gcfPGCGaJVUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdQ10jQ3O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAIE4pZry5g7G176feIUZJDiYlUd4sw/AkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8Xq1AOcGi1PTUirTMHGBEwaQlOHiURHibaoDSvMUFibnFmekQqVOMxhxXr1zZy8xxA0
  QKseTl56VKifN+bgMqFQApzSjNgxsEi/RLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5p4J
  M4cnMK4Hb9wroFCagU76tCgU5pSQRISXVwJS6MOj+7sfBfy78mdHSNrvaXcRCzbAs2zjtw30P
  2aIejZfBh9e+2u3UZZHscW/xp57y4krXr89DSniKj7tO5Vv2mOfVq0N1PRveXNqkxXL/dM0EP
  dECcxbnNOuLMjtT5Jy++2rVfNdVLfh3wmxNDmfR/bmMKoa7z+tujvmy89UUp4tic67Zm713eP
  Zgl4r+yh2pC4V72lS1jy1c91pu6WSP4A0FHhsKrrdG/lxo3PtasqTs0zoez9P2/geWadyy/XJ
  d7lnnkVN6bNfdGSKqEhg/rNr0q/jf8k/a/Ab3PA5Xs554cVTW4OcCixcrpBX47d83CPgfyfno
  4XP9SMTE+NrtJf1bs3S1VbPvFz488EuJpTgj0VCLuag4EQA0FhykbwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1649903581!86047!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13052 invoked from network); 14 Apr 2022 02:33:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 02:33:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6F1A1100470
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:33:01 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 62318100467
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:33:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 03:32:43 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pcsc-tools: upgrade 1.5.8 -> 1.6.0
Date: Thu, 14 Apr 2022 10:32:29 +0800
Message-ID: <1649903550-17752-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649903550-17752-1-git-send-email-wangmy@fujitsu.com>
References: <1649903550-17752-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96637

Changelog:
=========
- 48 new ATRs
- pcsc_scan:
   drastically reduce the number of SCardGetStatusChange() calls
   faster spinning animation
   handle Ctrl-C on macOS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-tools/{pcsc-tools_1.5.8.bb => pcsc-tools_1.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.5.8.bb => pcsc-tools_1.6.0.bb} (89%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.8.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.0.bb
similarity index 89%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.8.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.0.bb
index 1600bbf94a..c9e7eae279 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.8.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master"
 
-SRCREV = "53923ef8e98062c478f99e3bfcc8eb4654996c27"
+SRCREV = "c6e9fa746d00e08fc71c57c79e305669ff2e3106"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


