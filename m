Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D595C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:37:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.4001.1665391012760431736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IrhkBNgj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391011; i=@fujitsu.com;
	bh=tiodqv3HmkpRs3v7o8dT3RpEHGhj0aJAR4yB9qPQhlE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IrhkBNgjSj0PFtOwFLmaf/PfkJEDAtcS4C1QDmkLno0rKl+LWfm9omtjjNqz2S1g6
	 iT/wEPVSBngEGwf+fXsSbAWDnwWHqNW6HKyT1yUxibeSPEmnjhFwbPnf8GQTg+vOFc
	 LyrPLRV3azgO3QNqi/vzyBaenFexBXeg9DkQV/Tk6/W+QJgjHjuZ3Ejpc1A0PNq8J5
	 hNtjUahNjyAza4XOyflX/5jMZZoyA/78G5QKvToTGzA3NogpwV1Gl1fzNILfSfTKR7
	 AX0JXCQVQWxuEwKbOEbtHjXZtg1KjtomINpLGJtNV0NreBcHpxbEN2l8okudDZbcXW
	 cm/5oq3XdyfEw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWXfRTed
  kg6cvxCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owHa3+xFvzhqnjZytbAuJ+zi5GLQ0jgIaPE
  n3mtbBDOZSaJtrap7BDOHkaJNxObmboYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFrCWuHL5AZjNIqAqse/xf7BeXgFHib3fGsFsCQEFiSkP34P1cgo4SXQ0HGMEsYWAav7s28
  MKUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1qw1qpprE1XObmCcwCs5C0j4LSfsCRqZ
  VjFZJRZnpGSW5iZk5uoYGBrqGhqa6hrpGBsZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBQZxSzHh6B+Omvp96hxglOZiURHkNDjknC/El5adUZiQWZ8QXleakFh9ilOHgU
  JLgXX0VKCdYlJqeWpGWmQOMKJi0BAePkgjvg4tAad7igsTc4sx0iNQpRl2OmV/bDjALseTl56
  VKifMuuAFUJABSlFGaBzcCFt2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzXroCNIUnM68
  EbtMroCOYgI44edUJ5IiSRISUVAPTAumtRvKbp03LnCZ6UsFF7EjjDz4Hmc671Up5pWEMKWt2
  seUbP2OyfslQuOGBdSVr794tpdMuR94/XMeQaTSBK0+KwUisNTz34M2Dho/9L0604Z1w3HDiZ
  KkLTFe327SXR1x9eE5z3unTdTFSZ8X/1YXd0V7I3XzvWqur5uSA/lmMEn6PqnazP5A65ptX8O
  hFOveRx3yZscmSUZoPdOyfGp+eZs14hDf9k9/u79EL1mjXeQa33Utyzr4ev+Fkc5xcbvsD/oN
  zGNi9fwjufunYOF9QcFXU/uCdsvIOHMv9Jz88Iq12+V6nhVopa4pKhs0jOTf2JbcsDI+YepWe
  Tkh1kpy6ruS/7fIb2geuvlZiKc5INNRiLipOBACTHBUNaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-587.messagelabs.com!1665391010!179216!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7372 invoked from network); 10 Oct 2022 08:36:50 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:36:50 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 02477152
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:36:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E99387B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:36:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:36:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] links: upgrade 2.27 -> 2.28
Date: Mon, 10 Oct 2022 16:36:29 +0800
Message-ID: <1665390991-7978-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665390991-7978-1-git-send-email-wangmy@fujitsu.com>
References: <1665390991-7978-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 08:37:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99119

Changelog:
===========
- Disable cache when following redirects from consent.google.com
- On Windows, change the default directory to the "Downloads" directory,
  so that downloaded files are placed there
- Compile the 32-bit Windows version without SSE2 instructions
- Fix a display glitch on framebuffer, if the user doesn't have mouse and
  if he presses F5, F6, F7 or F8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/links/{links_2.27.bb => links_2.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/links/{links_2.27.bb => links_2.28.bb} (79%)

diff --git a/meta-oe/recipes-support/links/links_2.27.bb b/meta-oe/recipes-support/links/links_2.28.bb
similarity index 79%
rename from meta-oe/recipes-support/links/links_2.27.bb
rename to meta-oe/recipes-support/links/links_2.28.bb
index 4803353a50..a36393f1c4 100644
--- a/meta-oe/recipes-support/links/links_2.27.bb
+++ b/meta-oe/recipes-support/links/links_2.28.bb
@@ -8,4 +8,4 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-libtiff --without-svgalib --with-fb \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
-SRC_URI[sha256sum] = "d8ddcbfcede7cdde80abeb0a236358f57fa6beb2bcf92e109624e9b896f9ebb4"
+SRC_URI[sha256sum] = "2fd5499b13dee59457c132c167b8495c40deda75389489c6cccb683193f454b4"
-- 
2.25.1


