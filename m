Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2EFC04FDE
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:40:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.37750.1670830816179307213
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vMxF/IQY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830814; i=@fujitsu.com;
	bh=/iaHOyT5S6ectS9nbu13qgwdWUHgzjdV1oxjEDBBoBc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vMxF/IQY7j3LA+j5nZYyS9kqAbmWgbgUR5f8/t2gJVV2olZPMADq+ccTc60qR6vT0
	 jBqVCoDb+9LqF/7bp689LiJ6GIrthAHDeRm1ENmsqXsXYnGcdV/RkZhyHdfj1YOYe7
	 rAROAjR9BfoyHYGZlQUoVIBbgg8kIfafyuQx4T2GGSJgqXKZGwWCBiHxB3UXzpIZcx
	 WA3nIqdGAPJUOdHvk5JK9nHSqlmujhdSMECRJQd0S+/TM9TFl7oP3iKKz4AWLUBgIR
	 BnF+R75o0pxX7vIT7gSw9CPfTQtkcUubfIQVRAmP4vEwbkKSYZt/a79C+aAxJLuUuj
	 XXo3t3ijnWXFQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORpHv31rR
  kg+6HhhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b7/N/sBZM4KzZ8/8HSwLiIo4uRi0NI4CGj
  RM/2RSwQzhUmiQcLTrJDOHsYJRbvvQiU4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBO4uT/Q6wgNouAqsS7/Z1gNbwCjhJ/m1+C2RICChJTHr4HszkFnCS2d80FqxcCqlnxch
  8bRL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRvPi1KKy1CJdQ0u9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzAAE4pTo3ewTh32R+9Q4ySHExKoryVV6YlC/El5adUZiQWZ8QXleakFh9ilOHgUJLgP
  XgTKCdYlJqeWpGWmQOMJpi0BAePkgivCjCihHiLCxJzizPTIVKnGC05ps7+t5+ZYzmYnPm17Q
  CzEEtefl6qlDjvWpB5AiANGaV5cONgEX+JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjAvL8h
  ansy8Eritr4AOYgI6KOrlVJCDShIRUlINTPIlWlK5blbZOr8ms/4R6703yTa2b03zT/cjm2Zt
  eSXtfI1F5eiJDRH1gn8+dRUlvDP4UnNba4Gm2aO3c9b+Dnhas6ExY+n7bjeP0L/Flzgff2iXn
  Lgpw25nv67YrRnxnMWMC3omZ08+Pbfb1vsbX5nqn/bsHcpMgW02K+ZFrd7z/aH+ROtpr747+G
  06rLe+itUwc+qZC7eK/T1uXCzh2x4Zm9X39dS+Ce8fXXS3zNwqekX+2sHPi+yuMjKe+Z9nkCF
  0memQ9qqDTA3+l+ev7cgXm5T5dQvr49ialyKZk96EBJzhmvVuw5aPCesWe7b4d0RPO//e4Lhc
  j+5m07dbfzcVPkpMn3c4XcX7PnPolONKLMUZiYZazEXFiQD2GHz2cwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1670830813!139460!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17661 invoked from network); 12 Dec 2022 07:40:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:40:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4460B1AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 38FC01AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:40:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zabbix: upgrade 6.2.5 -> 6.2.6
Date: Mon, 12 Dec 2022 15:39:38 +0800
Message-ID: <1670830778-3178-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830778-3178-1-git-send-email-wangmy@fujitsu.com>
References: <1670830778-3178-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100058

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zabbix/{zabbix_6.2.5.bb => zabbix_6.2.6.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.5.bb => zabbix_6.2.6.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.5.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.6.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.2.5.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.2.6.bb
index df9c20b31..bafde3134 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.5.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.6.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.2/${BPN}-${PV}.tar.gz
     file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "457e129b3cca47f90fcb33b84dd5a215a24bd10fc74c8048f47839f71db7336b"
+SRC_URI[sha256sum] = "ae40c8cd4b24159466a7483e65f85836a8c963a0bc394a3dd890142aaf30ac17"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.25.1


