Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D0FC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 02:10:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.3458.1658455801765663520
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 19:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RmF6hTdj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658455800; i=@fujitsu.com;
	bh=zi2AwXtU6h9dZP7VLYPrnJUBg0JVL2jexDzXHQc7b6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RmF6hTdjbbljhep1QEmUiE+E84gjUzplhyawMjwvSlOTd0a8/p64QwPqqBunCiSg4
	 XO2xh/TIcTXPVvMyDiaosRpkoI4Lak39u3e9pLdaorRpULRCn2qV2jioK971CKTWCA
	 2WZn6PvSrBXSZMfuYJt0R26GE+7djLxLGgG/tX6NRJIUccPJjANJ8U01qoqIGgAE0l
	 foDoP+UUGS6lnbufJalUW/oDd7IPjgUKV0El4/QcW283fN2S5iNvI7LLeOw9qM/tp5
	 7EA5w0VALP3Zy4z9QQHovRhZSOfnd1KtIOCVPemOZqUJPkKEnxTzC3T8bH5Liw0aoA
	 XilIZ4SAmBYIg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8OxWfc7260
  kg0UbRCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozG1vXMBXc5KhZsyG1gbOfoYuTkEBJ4wCjx
  5axmFyMXkH2ZSeLus6fsEM4eRonTH06xgVSxCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAv0fdyBQuIzSKgKjF12V9GEJtXwEmisfE9WK+EgILElIfvwXo5BZwlbr74xwRxhZPEih
  ONTBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYx2iYVZaZnlOQmZuboGhoY6BoamgJpY10jQzO9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK9
  4src5JwUvbzUkk2MwEBOKU6/sYNx175feocYJTmYlER59026mSTEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgvcK860kIcGi1PTUirTMHGBUwaQlOHiURHgtvgC18hYXJOYWZ6ZDpE4x6nLM/Np2gF
  mIJS8/L1VKnFedFWiGAEhRRmke3AhYhF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzbxgI
  0hSczrwRu0yugI5iAjjA3vwFyREkiQkqqgal17TXFsLOTDvw4WLQis7F/1dJLWswHDpecNPj/
  1/Rl/uylJr/axA7rc76aaCncEbGownXnZNUg68CShe+quZL9k8uOfHaVsJj98LVcXO+t4kNm+
  xnr5p6+5hkmv2uTVovXaeUEbsV3HZYmxT8mnjjsHPF6VSF31ZOwGBHbjABHjV61o0sark49xf
  p4bsH3CXnRh+v9jknv0Gm/uePVbCODqcGVhanciyuFMpX3CLK+Tcq/OyPr8Ub1RI6XKummmyt
  +bbaa6rLZSzjj0EZN0QlO5xNca7ceL9kdb5yosXz30XbBhsWP7TJF2bl+9iuujzlws+mUm63Z
  K1mVdwYsai9E2cqapv4p82P8vHbzbyWW4oxEQy3mouJEAH0rBcdrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-728.messagelabs.com!1658455798!47027!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29650 invoked from network); 22 Jul 2022 02:09:59 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 02:09:59 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BE07D7B
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B1BFA75
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 03:09:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2022.6.2 ->
 2022.7.9
Date: Fri, 22 Jul 2022 10:08:57 +0800
Message-ID: <1658455737-26848-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658455737-26848-1-git-send-email-wangmy@fujitsu.com>
References: <1658455737-26848-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 02:10:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97940

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2022.6.2.bb => python3-regex_2022.7.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.6.2.bb => python3-regex_2022.7.9.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.6.2.bb b/meta-python/recipes-devtools/python/python3-regex_2022.7.9.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.6.2.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.7.9.bb
index 3067c0df3c..3fbe8b0b27 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.7.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f7b43acb2c46fb2cd506965b2d9cf4c5e64c9c612bac26c1187933c7296bf08c"
+SRC_URI[sha256sum] = "601c99ac775b6c89699a48976f3dbb000b47d3ca59362c8abc9582e6d0780d91"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


