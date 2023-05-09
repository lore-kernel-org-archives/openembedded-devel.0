Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5963BC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 08:45:11 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.27058.1683621901823310377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 01:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aRo53l4b;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683621899; i=@fujitsu.com;
	bh=afxlAmV4We3YW5/5LxbKl0u0jbkvluxzLYvLxmG9Aoc=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=aRo53l4bYFj7VYkt+WhQaqLNm4CPR3kuM+TO6UxrphSayk77YR4EdrgcNqKd/cUVi
	 rMz43sFQqVVFEp8txe+eWUWyzqZj0oDf8F2Dr3/Os/CAQdXo+oxGZFlxb2PTEwApy5
	 gZjC1ZHy5IY19BrVpA1VLCAAepkk7txzmbKX4yjtw8ah3y7jpJjJNsDrKP9WxY0laG
	 vPXoi9WDfUs+CiLlhywgXvLcxcQRej5JVx/8j2pD+k5yqIyGzP0xQw3AvCNFGk0YN5
	 +LpaUlZy5zVBGhQg5rmyU49YUPQOps3699MsI8DzPPDGyHBXUkeZfBfJw0XTrCZm00
	 ktKIE3RdmPyxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRWlGSWpSXmKPExsViZ8ORpMvNEZV
  icHWBqMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG4soW14BpnxfRja5gbGC9ydDFycggJbGSU
  2PHcvIuRC8iexiRxo2MLM0iCTUBCYvrek+wgtoiArsTHD3MZQWxmARWJGZOPMIHYwgLBEk/7d
  4PVswioSnxvPAhWwyvgKLHv7BWwuISAgsSUh++hbDWJq+c2MU9g5FrAyLCK0aw4tagstUjXTC
  +pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTI9DHKcXJdjs
  Yv+z8q3eIUZKDSUmUt2tfZIoQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV5n1qgUIcGi1PTUirTM
  HGC4waQlOHiURHhPsACleYsLEnOLM9MhUqcYdTmuXrmyl1mIJS8/L1VKnFeIHahIAKQoozQPb
  gQs9C8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubVAVnFk5lXArfpFdARTEBH+F8OBzmiJB
  EhJdXA1NtQ8323vf/uk3xxWzInd30u+TXj4G7XbJl5exeL9R40//Zv8WEbtR0/A3UmZTlZ1Ul
  asYqHWZadTCualL9LXaa+MpHL855VyVePSfmLuarLOn7+WeV91+VB0YukF3N29Qb0LPPOnnd9
  m9T/xr061/tNclZyiFlEiV/1OSX6WfJLxzG7aXXtPLJ+C2ZM4nq4RWDJV5dFP29+PvE5jdtla
  +ipLS+3TROr3HkurUhFcLVh8As908QHtdH71GUf/1rW8DPpnLsaUzor02V9vaALsRPcJs++8/
  l0xZR81mIxn+Sd2VHyM3evMS6f7fBlzcQOHrNupY9MxVxmafceGXce2iOX12GzaXP8jK3+k4N
  WKbEUZyQaajEXFScCADN87GD4AgAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1683621898!577277!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6822 invoked from network); 9 May 2023 08:44:59 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 May 2023 08:44:59 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BDF801B4;
	Tue,  9 May 2023 09:44:58 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 081171B1;
	Tue,  9 May 2023 09:44:57 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libimobiledevice-glue: SRCREV bump d2ff796..114098d
Date: Tue,  9 May 2023 16:44:47 +0800
Message-Id: <1683621888-1304-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 08:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102493

From: Wang Mingyu <wangmy@fujitsu.com>

Changelogs:
==========
Add a scheduled build every 1st of the month so we always have an artifact
Fix compilation on cygwin
Remove plist-related code in favor of new libplist API
Set minimum required libplist version to 2.3.0
autoconf: Automatically derive version number from latest git tag
Add NEWS for release
Add missing include

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libimobiledevice-glue/libimobiledevice-glue_git.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
index 7e9299c9f3..b63aabdc0c 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libplist"
 
 PV = "1.0.0+git${SRCPV}"
 
-SRCREV = "d2ff7969dcd0a12e4f18f63dab03e6cd03054fcb"
+SRCREV = "114098d30e783fbb3def5c9b49427a86621cfcb1"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


