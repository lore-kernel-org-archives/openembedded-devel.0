Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D227FC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:17:38 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.3124.1663064248389523391
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qx+Rbaiv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064246; i=@fujitsu.com;
	bh=46NCjZgWHV5Ds781UZ4AzT0qIgauY1HneQVFMDGhwBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Qx+RbaivP4zZrCdEgz8k61hkEJA3q8O7nQ70WXD1Y7izX/z3zZvsnY5Pf1aI8Oes8
	 Pf5CCzWahCTcsKv5S2TEcyebDN8AqbWj2OKNYD0CtQeSmsRlaaPhk17vh1EMez7EVe
	 7mlEPr7ZpDzB1wUz5o1vamYzbrkJP0vF+666TE+axre/4xjam88H+I1W6Dj9Z/ZCFN
	 SZVREg1922nMNsK3vCnjKeqXuy3RiWkuqEBDKFAOT/Ttt/WEjMuDfqSwgnY4M+2Z12
	 2Nlw2BH7c36GA64g194XJ1c7gvGnd3NNt33jdgLFax12Z7Ejat/uC8CNZyxqrGgJ15
	 mzrp9YFKDRaxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8ORpLstQiH
  ZoPEnu8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFqsnXBSvaK7vNb2BsYT7J1MXJxCAk8ZJTY
  8O8tI4RzhUniad9HVghnD6PE1AkrmLsYOTnYBNQkpt+6wQpiiwjoSyydvQcsziygIvHidw87i
  C0sYCNxb9dHJhCbRUBV4uOSh2A2r4CjxIemeywgtoSAgsSUh+/BejkFnCTWP18IFhcCqlm4ZS
  8zRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmqDkVEo3TDzFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMVomFWWmZ5TkJmbm6BoaGOgaGprqGusaWuglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgSGcEoxs9AOxvV9P/UOMUpyMCmJ8kZ6KSQL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCNDwHKCRalpqdWpGXmAOMJJi3BwaMkwssTDJTmLS5IzC3OTIdInWK05Jg6+99+Zo7lYHLm17
  YDzEIsefl5qVLivDO9gRoEQBoySvPgxsFi/hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6
  JMKApPJl5JXBbXwEdxAR0kJG1PMhBJYkIKakGpvKAV1cCBRs9Jr6Z8n7x9hNG3E5GlgfaGe0e
  Vk+pS+5gvfvjc+enFxNsUn9fqNzG4qaW4iUmvv15ilbVqnuftb/c35i/WvXVl1s9hT7XDaLXq
  4RN3+O31LfJf//d5glL+eRWJRw8PX3+rKqrS3c9MmGse9LapBAZeGKX91GZDKHkeRZihWqs9z
  2vfq8+Mlk+n2m/2S/bSUwbSoK0r11JDRTdeJOjST332BaNqskd+123T14wSbTS80sd28VHv25
  x7p74Yf70Z4W3Jp46etujN6duVuvZepaX97xf1NQwssk9/L9ayCaAI2TbYo6r4gf0s6++f9I+
  W0RCTKlx1cNvfQtkTlwXfCYstaGrIsFrQpsSS3FGoqEWc1FxIgDthTvndAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1663064245!115475!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14515 invoked from network); 13 Sep 2022 10:17:26 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:17:26 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B48B71B2
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:25 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A99FD1AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:17:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.1.9 -> 8.1.10
Date: Tue, 13 Sep 2022 18:17:10 +0800
Message-ID: <1663064233-3236-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064233-3236-1-git-send-email-wangmy@fujitsu.com>
References: <1663064233-3236-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:17:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98769

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.9.bb => php_8.1.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.9.bb => php_8.1.10.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.9.bb b/meta-oe/recipes-devtools/php/php_8.1.10.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.9.bb
rename to meta-oe/recipes-devtools/php/php_8.1.10.bb
index 03756e04d5..9fc39e8686 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.9.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.10.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "9ebb0e2e571db6fd5930428dcb2d19ed3e050338ec1f1347c282cae92fc086ff"
+SRC_URI[sha256sum] = "2de8e0402285f7c56887defe651922308aded58ba60befcf3b77720209e31f10"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


