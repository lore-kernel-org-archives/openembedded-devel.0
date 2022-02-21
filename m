Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA75C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:24:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.10471.1645449868236234080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MDSJJBEY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449866; i=@fujitsu.com;
	bh=xwskJXYBV/D6CZQ4SEkbSCrnnG6kEDh0DGECAb1NYm4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MDSJJBEYbDYeqX8HP5AbhEeZiMtVNWXNbCSCT5VinlXj6yMZd6sF235Ut5veDVdKq
	 T7vcu2+pBxRMEmNOoMQQ8Inuo/F6gDN3t9meQefJ07xNvaIbfQOl6TB+Ypga+JdaWd
	 xjCYaPMMa914fZiQkInLsS/IyH6x1cIBCY4g8TIw7IBjsbuI4qJ8WZwOpROUeC/3AF
	 /SfZC2sT57tzaAWgcwMsNRbNjSWZMsK9V2cZxIEsCvnXjBhgNkVPxCnnvEWKpfUxbs
	 oThHRwD6pMJDIK9UB9X0eK1CtvjCxzHiLQ0ek7R7sJZvOgBEvkyit/vNzgGhi6vZDT
	 10z4cs07KCpeg==
Received: from [100.115.37.210] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id 69/A1-12680-A8293126;
 Mon, 21 Feb 2022 13:24:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSbdrknC
  SwZyNYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXqSbWgsMcFf/WRDQw3mDvYuTiEBJ4wigx
  6/5HVgjnApPEiRs3mCCcE4wSVzfdZ+ti5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBB4tadL2A2i4CqxN3p28DqeQWcJG71dIPFJQQUJKY8fM8MEReUODnzCQvEHAmJgy9eME
  PUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWidVJSZnlGSm5iZo2toYKB
  raGiqa2wBpAz1Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECwzKlWC1/B+Pf
  lT/1DjFKcjApifLWtgsnCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgFe4HygkWpaanVqRl5gBjB
  CYtwcGjJMJb3gyU5i0uSMwtzkyHSJ1iVJQS5xWcCJQQAElklObBtcHi8hKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYd5gkCk8mXklcNNfAS1mAlo8JUsIZHFJIkJKqoFJYDW3tNsulzU9k3x
  Eu3ibV7xxVJNbUydh4zDXKyE1UmGDzO4ifqU7T5oUf7sf+72HOe37/cRuf2sRFi0VQaUlH88a
  c0bU6M47y7r9bR+L50HB95+WG7svV7iZUVjF/fWq/NqFMkFlVgKnIxsdOE8ayrU+d1oQcveW3
  Szu2WobZTz7w3NS96jUc/w+s+z9zt11S3e9YJeorjwt2nxMQP1K3rQFfgo/9nU272kQfFOp9O
  XgjR8HNi/Zc376gXflCfO+l5rF9t3RebbUpDFfNNn7073UG24fby6TMRdlzO37W3nws7067xX
  e18Zz4wyqm9e0R7tIdZ400WVMOz7/08PppiLLnWbYNH9d8yixs0CJpTgj0VCLuag4EQDVfFro
  RgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1645449866!19068!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4322 invoked from network); 21 Feb 2022 13:24:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:24:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F249110044C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E509F10033B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:24:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libgusb: upgrade 0.3.9 -> 0.3.10
Date: Mon, 21 Feb 2022 21:23:53 +0800
Message-ID: <1645449836-23309-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95415

New Features:
 - Add API to change the hotplug poll interval

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgusb/{libgusb_0.3.9.bb => libgusb_0.3.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.9.bb => libgusb_0.3.10.bb} (89%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.9.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
similarity index 89%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.9.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
index 3fdb2b7d3d..a606f175c6 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.9.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
@@ -10,5 +10,5 @@ PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d
 PACKAGECONFIG[vapi] = "-Dvapi=true,-Dvapi=false"
 
 SRC_URI = "git://github.com/hughsie/libgusb.git;branch=main;protocol=https"
-SRCREV = "582f33178a986e74543de8ced087865009f8fef0"
+SRCREV = "332d5b987ffecb824426e88518e05547faf2b520"
 S = "${WORKDIR}/git"
-- 
2.25.1


