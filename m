Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F48FC3F6B0
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:40:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.6221.1659447597204705221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Af5HgMee;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447595; i=@fujitsu.com;
	bh=Ny77NmxvjK40Z35UOhfifAX2kogzF48rIn27yBQ6In8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Af5HgMee4XVivxw0mzKpn8hPrgFLl+2eTyKQimMFaXs725THf1BVm3C+LCHsGlArE
	 fOTDT0KLF8iauxf5uz7z0zIBN09OTW2PG3+cO5Mk4ZufS0TZ5r5ZdYt4RZTQb2Z2Rg
	 e99k7uSYME1sKmrq8lod7GrCIKS5wygTrWDrI+CsrqIgeU1y90f3P67qSKGq6+lIFP
	 tYs8VQ9Z9g1crEKa7s7t8sZ/I9lHdF9TBO9nmpOV8J9XkM3uGz1fOsnQHpfHPuVEKr
	 Ak+9JK7f1IsLQ8rTqaMyCewXDmMsuhMaW4enPW6WZqUezUWEHYjfOIPFzdzVod0JgS
	 iPsSSF4xdncdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpKul+TL
  J4E23qcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFryV/GgnVcFa8/LGFrYNzB2cXIxSEk8JBR
  YteeG2xdjJxAzhUmiYvLvCESuxklTs18xQKSYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAXeLz3BawGhag+Kclr8FqeAWcJBavbmcEsSUEFCSmPHwPFucUcJa41X4CarGTxP1tX9
  gh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVEjNmbGODsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrROKspMzyjJTczM0TU0MNA1NDTVNTbSNbSw1Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzjlGKFvTsYL6/8qXeIUZKDSUmUV07xZZIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd5bqkA5waLU9NSKtMwcYEzBpCU4eJREeN+pAaV5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5
  +XKiXOewukSACkKKM0D24ELL4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmvQcyhSczrwR
  u0yugI5iAjtDhegFyREkiQkqqganhT+nDeSomOXeY2ZawhcqvMMjkMMgr45KZ8vnNVs8L/NIV
  YvMqj7inOEaWM9pqJyvVb1ja9+w4TxsnX2HIPof7DxwuHduYbMDMw6olwr3I+m2bfRdPdsPNV
  t3lrtb6v6fMuLNM6eWau0dW1kwyTNnsb5QjEnP8C3OtaouIaO827QbxQ19djyVbzqkx7Tl99Z
  aHhVDxloQYt5a/HfItZVIvM785eVlyN/PnvEqd778s7IjcYqklcRuZ9dm3ra1Q61KdJZj4YaH
  FGe9qI3f2lCzu4wtXBqk87BDas5NV2GyK3KSYvI27pcvbfn+4PN3FJCThtf7jTItv9v/mSymc
  bGW7/j/j+rOvzh8NbSYosRRnJBpqMRcVJwIAlZbEcGoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-565.messagelabs.com!1659447594!311300!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24125 invoked from network); 2 Aug 2022 13:39:54 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:39:54 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 924801B3
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 873B91B1
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:39:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] htpdate: upgrade 1.3.4 -> 1.3.5
Date: Tue, 2 Aug 2022 21:39:31 +0800
Message-ID: <1659447571-24348-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447571-24348-1-git-send-email-wangmy@fujitsu.com>
References: <1659447571-24348-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:40:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98087

Changelog:
===========
- Feature: set kernel synchronized
  (e.g. timedatectl will report 'System clock synchronized: yes')
- Improved time tuning accuracy/stability

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../htpdate/{htpdate_1.3.4.bb => htpdate_1.3.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.3.4.bb => htpdate_1.3.5.bb} (92%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.3.4.bb b/meta-networking/recipes-support/htpdate/htpdate_1.3.5.bb
similarity index 92%
rename from meta-networking/recipes-support/htpdate/htpdate_1.3.4.bb
rename to meta-networking/recipes-support/htpdate/htpdate_1.3.5.bb
index d25600645e..08255ae846 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.3.4.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.3.5.bb
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=2b6cdb94bd5349646d7e33f9f501eef7"
 
 SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.gz"
-SRC_URI[sha256sum] = "744f9200cfd3b008a5516c5eb6da727af532255a329126a7b8f49a5623985642"
+SRC_URI[sha256sum] = "a8734d4f1d84d0608d045508608f2d29d8b968da269f83120aaac67709b1bd03"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.25.1


