Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07784CCA47F
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 06:59:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.2737.1657177165585758233
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 23:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F/vA7ghC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177163; i=@fujitsu.com;
	bh=YuUtC3dPGsxMUqVZ8ox67v/aj1x2ZpPgZgdk64kOscc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=F/vA7ghC4ayURDp67hd7RGI7jYsWTTn0pH60ViRGu9jlARamEBSYag/EIX85vRFH+
	 W/Dx/IbTDEozq4PKwFtzvaO+ynv9yhRzuoqQX3j8ggI+I8uO5/64+D4JeYE+c5LAFT
	 eJZQ2WW4lhAaOUg8IRpDuabBD6DhDkQVBrBpFa1W6GUbXe00pl70T+lJpSWXp7wvTT
	 oZmMHG4PwTxA7lL6UDdKH9os/WvbuXaL4xIRlEzUMWDTANgfxJROSc5fTLbFgiGXH6
	 moz5KJ6RbxF/7kq0d/QcTxAntEH/DcqUDOFOzKfvIwuUnbUwQ34Uy3MK9lVEEETfS0
	 gVRP2LllgmkBA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSde75Vi
  SwbdTnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRVe+YCqawV9yc/5+1gfEQWxcjF4eQwBNG
  ie0fbkA515kkZt/tZoFwdjNKdLW8Yu9i5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphAWuJ5+svMHYxcnCwAMV79jmAhHkFnCSWTd0BViIhoCAx5eF7sFZOAWeJg6fusoDYQkA1r5
  f+Y4eoF5Q4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/
  AyLSK0TqpKDM9oyQ3MTNH19DAQNfQ0FTX0lLXwkQvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMIxTipNDdjCe3PdL7xCjJAeTkiivV/2xJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvPxNQDnBotT01Iq0zBxgTMGkJTh4lER4GZuB0rzFBYm5xZnpEKlTjMYcV69c2cvMMf
  Nr2wFmIZa8/LxUKXHeeyClAiClGaV5cINgsX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjB
  vJ8gUnsy8Erh9r4BOYQI6ZVn+EZBTShIRUlINTCVfm27NyJ+xPelr4MMNNxY9d8jO+G7peHRy
  577Lpyd63VuyLX+P1Yc7/C8rDvvtOLzz2fmWr7PXXwv+oWFUbLDEJORSldq+v8o6v3IXRmttO
  bvR7dB0lSs6Zw7JFk2Vtd/YB7QuqPDFBsFJD+5NPmsl9HbhIqEUw7onh4X6GVI+3Dly8JPyjv
  +M0xlmKD3M/yLXpPaca3Wp6+28poB1i018iyNdnLIPKyz0y65ptVhzofWfleB8P7uslSdW22k
  uSk39f1G1N4whIp9tdmKnkmWZcXlArchPQ6lPXK/3nK1r3vuYkUHpQt6m9vRdIseTRP5yvRL/
  aKfg4/PzTsD+v3163xYYMMjdPnBNqO1/gxJLcUaioRZzUXEiAJKxcoNwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1657177162!60927!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1188 invoked from network); 7 Jul 2022 06:59:23 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 06:59:23 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 914D21000CD
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 84C351000C2
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 07:59:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fmt: upgrade 8.1.1 -> 9.0.0
Date: Thu, 7 Jul 2022 14:58:54 +0800
Message-ID: <1657177137-28347-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
References: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 06:59:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97738

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.0.0.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb b/meta-oe/recipes-support/fmt/fmt_9.0.0.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_8.1.1.bb
rename to meta-oe/recipes-support/fmt/fmt_9.0.0.bb
index c53dd3890..fd37a1e0f 100644
--- a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
+++ b/meta-oe/recipes-support/fmt/fmt_9.0.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
+SRCREV = "c4ee726532178e556d923372f29163bd206d7732"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


