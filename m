Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05354CCA47A
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 04:35:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.2377.1655181337889705496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 21:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GS0491r5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655181335; i=@fujitsu.com;
	bh=wXDMfk/Xmx3UJ0rZx1Zlp1KEwqz3nQNtGxgbiOev7xk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GS0491r5xakFDsifMpsMTs1bRLKgDi8YOVizlo9ruMn0j5ZZKRC26LLfKrVv/+vaU
	 H7/c18h9MnQb6LMtnUpRe2dVKOGYWhXRS+l83SRzAt2csI+aku82Xmem8SahCSjr8K
	 mDXrb/9XaWuxy4LOadVVkVYfug/wcDYOFNj8jND1y5dR/J4u89C9p60ZbXQOCycYMG
	 UK5qi3SYKGuhY1T8i+phefQZ6mYIrIcMRh3fl/YgVrb392OQ4pWLJkRC8yYmsznsKA
	 EjE/U61P2G0M9SYklZUrbdkOqkbnnFq9PQOX5Jv4B/dhYf4931u31cSbfnL8ZmqxhJ
	 mXq6uErPXbg1Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqCsusCL
  J4Hcrl8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHs7EOWgtfsFf0PLrI1MHaxdzFycQgJPGGU
  2Pp2HWsXIyeQc4FJ4sRqZojEHkaJy4u3sIAk2ATUJKbfugFWJCKgL7F09h5mEJtZQEXixe8ed
  hBbWMBaYsXys0wgNouAqsTy2+2MIDavgJPE+k8TwWokBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdIzJixjQ3CVpO4em4T8wRG/llI2mchaV/AyLSK0SqpKDM9oyQ3MTNH19D
  AQNfQ0FTX2FjX3EQvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwKFOKFb12
  ML5a8VPvEKMkB5OSKO+l3cuThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwtnCuSBISLEpNT61Iy
  8wBRghMWoKDR0mEd/E/oFbe4oLE3OLMdIjUKUZdjplf2w4wC7Hk5eelSonzqvMDzRAAKcoozY
  MbAYvWS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeb/zAU3hycwrgdv0CugIJqAjNp5cAnJ
  ESSJCSqqBKVQ55n7vPMOlUyPMVJL/xVxnM9N7/Dj5+NzKwgb22ier/6zb+DFk1d/H71ra2T99
  mPj6uqX9lt9/dQo5Wr/2fMtu29Dbs9qEuWhdMmdRYvSMNMmahICZS+TMryb6KLmZJR/ZabFty
  r4zzGYrfefdXcciu7zqwKKfz8XUufe93NFb/fH4t3KPrnedThMO8rivusWhsjlGaVfcpC8hu2
  UbNc/bPe2ab3T+j+8Dlkk7J7CWqtm5hO3KcM2Oe/0ixeiBjrWFgia/3cbObOZ611Xbf1XwrOK
  03OK98+j/+ryqm4e9Lz559vZB//tnV79tmv5iLmds7BwOZmn7pUsK5aI+NGcd+tFVHS7+Yq5Q
  nmi2phJLcUaioRZzUXEiAPpn0YhRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-565.messagelabs.com!1655181334!68404!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14379 invoked from network); 14 Jun 2022 04:35:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Jun 2022 04:35:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B98B610018F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AC859100184
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 14 Jun 2022 05:35:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.1.6 -> 8.1.7
Date: Tue, 14 Jun 2022 12:35:03 +0800
Message-ID: <1655181307-30868-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 04:35:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97499

Changelog:
==========
https://www.php.net/ChangeLog-8.php#8.1.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.6.bb => php_8.1.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.6.bb => php_8.1.7.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.6.bb b/meta-oe/recipes-devtools/php/php_8.1.7.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.6.bb
rename to meta-oe/recipes-devtools/php/php_8.1.7.bb
index 96af595a4..e9e8eccf3 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.7.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "7b353304b7407554f70d3e101a226a1fc22decae5c4c42ed270c4e389bfa1b66"
+SRC_URI[sha256sum] = "b816753eb005511e695d90945c27093c3236cc73db1262656d9fadd73ead7e9d"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


