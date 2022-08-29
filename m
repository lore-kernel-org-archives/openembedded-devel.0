Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B146ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:32:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.67406.1661754728219944065
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xNA1Ez/p;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661754726; i=@fujitsu.com;
	bh=2XjKXGEgKL5xa5ZczXYLKu5weiHURT/ASR4W/HFK1ak=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xNA1Ez/p+Sm1py6PUPYx7nmaAqVhV30WQ67Q0FuxSsk8YQTWB1iEokcoeXZKIm9/1
	 KXzpaG27vvSqa+6kia/E923MwQn3slKqm1OmIWEaPmZcGBA3hhUVhxXQTgWjM8w+s4
	 3eQvIPU0f6pBbwjvfVAR5uEt3J9AC0t99t2hnceSvfp2LkQICaX2xJt7kOrg3LVzDa
	 GmZylZ92dcSBvj3N7zh8SAeWjKzmhs9stcvsTUc1oOHUAkH84Z+la594q0e18+FhUR
	 hvhHWdIGVbIx/LWAIOC9jGu2yQrKHrNQ61ptVK1AzQbmvlrwdyGtBGTX/CtYldszYc
	 tCmgIfxFGpt9w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqJsay5N
  ssHGblsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvF0S0TBdI6Kv/caGBsYN7B3MXJxCAk8YZSY
  37mICcK5wSRx6PdRqMxeRonDL+4CZTg52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EF
  hawlPi0egYjiM0ioCoxvecIWC+vgKPEntkXwGokBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9
  QoSsy+3MwCYVdK7JnVzwRhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJVUlJmeUZKbmJmja2hgoGt
  oaKprqmtkZKqXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYlCnFrA93MC7u
  +6l3iFGSg0lJlNfEnCdZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv7UignGBRanpqRVpmDjBCY
  NISHDxKIryvHIDSvMUFibnFmekQqVOMuhwzv7YdYBZiycvPS5US590YDVQkAFKUUZoHNwIWrZ
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMKRwFN4cnMK4Hb9AroCCagIx4u4QY5oiQRISX
  VwGRtEL9J4u6qX1WzVz3pymCd1se8X3Hr7L0HlzS8M1PSF3iU/PmajJkwn9bX7qXLnli9qnZ5
  umvuCncG3zVt6b0VBcu4e9KWXjLzSV24Qbns0sbCHqH2pxv77v+81iRyzYuzX0J/XTTX8nX2r
  YHFjUcW6AbEBztuiVf4XpJ4/efS/patl/gF7q3aOe17BnP3qRYFIzG3A22m2ayXsjOyHAQ04w
  +o/1yqILj216dv9x60ip5JK9g93yhy43X3D/xsRz4FaOn9F33PU79orW747IfBqt+C/65Zui8
  0yic7yP+rt95cwy/nTT7VaKpZlvp+6vfuSrGdGXr5u+apdUcPm7zm/3t47juf8k+yLIs2L1Zi
  Kc5INNRiLipOBADqExl9UQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1661754725!333718!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32579 invoked from network); 29 Aug 2022 06:32:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:32:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4BED610019A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:05 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3F6C2100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:32:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] feh: upgrade 3.9 -> 3.9.1
Date: Mon, 29 Aug 2022 14:31:39 +0800
Message-ID: <1661754703-4722-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:32:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98500

Changelog:
=========
* Set libcurl user agent to "feh/3.9.1". Previously, feh did not send a
  user agent.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.9.bb => feh_3.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.9.bb => feh_3.9.1.bb} (89%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.9.bb b/meta-oe/recipes-graphics/feh/feh_3.9.1.bb
similarity index 89%
rename from meta-oe/recipes-graphics/feh/feh_3.9.bb
rename to meta-oe/recipes-graphics/feh/feh_3.9.1.bb
index e4422668f5..d78fe7e17d 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.9.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.9.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "8649962c41d2c7ec4cc3f438eb327638a1820ad5a66df6a9995964601ae6bca0"
+SRC_URI[sha256sum] = "455c92711b588af149b945edc5c145f3e9aa137ed9689dabed49d5e4acac75fa"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.25.1


