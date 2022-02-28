Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66297C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:14:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.20023.1646057653066418497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gnOyK/oH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057651; i=@fujitsu.com;
	bh=mReKJ3GtRRgzdBmQ3hy4lGt72gdkeIuL0BhIYpAeJms=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gnOyK/oH44+DIwUZVM+cN+D60GQJ4t9rZDs2wIRqaXXgT6YTvuf5jLuhxI7dLBTbO
	 xVPPgy4pNxl1dWMoUvGwctbb77RiPtSDjeBY3h/030JUdcxpmOTeje8y5yMOkvPA4d
	 DL/G6CUXvTw5bw1EC9AUox46IHMMnuAHP0IRw3IBwZ+vNbRUM/q9B3PUTA8Dux6eBl
	 SBk/N0q/Z7pyeQO7cGvFlOx6OiAlItZH4vSV+N2lStukD0Meaz6ItVGvn3vm6nDNQw
	 eQleMMbVkNKwNL/Wb4Kba2T5VpYr5k2X3EkhOgtRuG2sPiNuAKdjWotWkDosmzx1R+
	 hvVQIy+1gXf/g==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id C8/24-12986-3B8DC126;
 Mon, 28 Feb 2022 14:14:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxSXfzDZk
  kg3tRFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxuZHy1kK/nBV7Doyh7WBsZWri5GLQ0jgCaPE
  rCMrWLoYOYGcC0wSG995QiROMEq8vXsBLMEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z3sX
  YwcHMICPhLTViaDhFkEVCWm75gP1sor4CTRdPc5G4gtIaAgMeXhe2aIuKDEyZlPWCDGSEgcfP
  GCGaJGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUM
  DA11DQ1NdU10jI3O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAgEwpZn28
  g3FN30+9Q4ySHExKorycXZJJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4RYEhLiRYlJqeWpGWm
  QOMDpi0BAePkgjv08tAad7igsTc4sx0iNQpRkUpcV5WkD4BkERGaR5cGywiLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5tUAmcKTmVcCN/0V0GImoMV/g6VAFpckIqSkGpikZSLe3560QiF
  bfiEPx3Qmub9VvvMW3/82ZULG9LV5D3m3SCVv/Bn/5rHjJtGgNOmPuTdfdhjOmeR7MD/C6WJn
  btfGgpc/vTxnTJcKF1nvXpwxPznGSG32XK0J7xe/Y9xQueqn6awzy/+JuWpNPp64fOqKyQf+C
  c1mf2qwatlDnvYPBocF/hn/OOt//UnVUnuznJ1mnB0RvHedf1bsXZxctb5ixQyb67e4vq31//
  jI77Jd0Mp3O1PPpS9pm769ovMx6wWdx1c5Xi+QD37BuufrzNifVmVrbC9a2bm0hW1zz75VKzV
  12zcGkRrfU5PbObevXmTcVVu9yC426ETOTlF/QYV1d5Trd0S0bq7d6t+zVomlOCPRUIu5qDgR
  AKdltQdDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1646057650!350!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23181 invoked from network); 28 Feb 2022 14:14:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:14:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7291110044A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:14:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6611C100047
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:14:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:13:49 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH v2] openconnect: upgrade 8.10 -> 8.20
Date: Mon, 28 Feb 2022 22:13:42 +0800
Message-ID: <1646057622-36275-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:14:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95578

COPYING.LGPL:
Two blank lines were deleted.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openconnect/{openconnect_8.10.bb => openconnect_8.20.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/openconnect/{openconnect_8.10.bb => openconnect_8.20.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb
rename to meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
index 7a61f74e31..d204481164 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Open client for Cisco AnyConnect VPN"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
+LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=8c2e1ec1540fb3e0beb68361344cba7e"
 
 SRC_URI = " \
     git://git.infradead.org/users/dwmw2/openconnect.git;branch=master \
 "
-SRCREV = "9d287e40c57233190a51b6434ba7345370e36f38"
+SRCREV = "03a3b9c76a9b6d0a65073b6bebbc1192e3445507"
 
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
 RDEPENDS:${PN} = "bash python3-core vpnc-script"
-- 
2.25.1


