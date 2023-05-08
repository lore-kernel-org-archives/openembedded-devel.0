Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D234C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:02:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.103480.1683540174048079027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QPw/QH2O;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540172; i=@fujitsu.com;
	bh=egsB3Oh6/prTjeM1jGr6FJk4UsY2f8ESqBE66Jfkv2M=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=QPw/QH2ON+DsNn98oJ+dIkOlxJmTRm2r2gdrQIQ9s3TqPi74D9cz7EoQJd9SKIeQy
	 eFjm8gWliPhACeyZrfW5kPavh2gSnratXnQw/TaNEU7EyPderucotI3bKjzz/Al9EX
	 MjkNB2wPc2TtfEV5TizzHU78zKIGcVbzxBBOVr7YTxPir/8fgXqTsXoDPn6vsoTRKQ
	 V/knT5WntrKRcio88CiBdwqsf3DB+JfkR2kuNV9XKFJcrCVK9eNGGlQ4elDTihgeEX
	 LpOcd1ca+ErQLoEy8ix4sI3bqmCAsv4tIu/425sk1eeKwG5g2INre7+H4Vm9FUcIL8
	 WOPrErXRSzBWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRWlGSWpSXmKPExsViZ8ORpHvmRES
  Kwe7JrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8brmetYCm5wVMy4O4GxgfE/excjF4eQwEZG
  ibtL90M505gk/m14ytrFyMnBJiAhMX3vSXYQW0RAV+Ljh7mMIDazgIrEjMlHmEBsYQF/iZPvL
  rGB2CwCqhIfOreC9fIKOEk0/njFAmJLCChITHn4nhnCVpO4em4T8wRGrgWMDKsYTYtTi8pSi3
  TN9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECfZxSrNS
  zg/Hfzr96hxglOZiURHlND4alCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgbdsWkSIkWJSanlqR
  lpkDDDeYtAQHj5IIr+wRoDRvcUFibnFmOkTqFKOilDhv6XGghABIIqM0D64NFuKXGGWlhHkZG
  RgYhHgKUotyM0tQ5V8xinMwKgnzVoOM58nMK4Gb/gpoMRPQYv/L4SCLSxIRUlINTEIf7knf8n
  j3r1U8TGT9s21XWzbmz9qgsmK/0ZEPv98+nLRog+lJzmdBezzmhSiZf89acLVLWj+puKKs3Vb
  db9+7Z00109/tt5fPDt8v8qy15ujLZ7NrZWZfPjbjyNXc67eqWjoWvo5VXTsjSbexd5HB4WKl
  EtErSWsSQ7ZE/16rurTu3EaWF9M7N8nseKieIiE1UWCT4zzffnZnc2kF5o1/Z0Rcb+H5aedXt
  1nuooDremvRNjEbP/kNwcd4VcI+H3hi8UZsViqHgGTGnLxfJ2tnO+5YzPtm4u3HOQE7pt18/N
  rlS6thYXXpzH13nkQG3RWS7ip62rBUtlPxwWz+T8wfXO4cnXgpnXtDT3q6uYsSS3FGoqEWc1F
  xIgCvPC+w7AIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1683540171!318588!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32065 invoked from network); 8 May 2023 10:02:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:02:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C3B451D4;
	Mon,  8 May 2023 11:02:51 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E949C1C2;
	Mon,  8 May 2023 11:02:50 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230416.0 -> 6.0.20230430.0
Date: Mon,  8 May 2023 18:02:38 +0800
Message-Id: <1683540162-25172-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102385

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230416.0.bb => ctags_6.0.20230430.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230416.0.bb => ctags_6.0.20230430.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230416.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230430.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230416.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230430.0.bb
index cc82d9953f..9ed34de694 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230416.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230430.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "5ba7dfcc55471e599375281f52ad2bebdc527c62"
+SRCREV = "39a017244892394f65a51cdb2ec37a3e29f43a0a"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


