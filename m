Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18936C48BEA
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:00:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.5925.1661302821064817292
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GgKTpm3r;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661302818; i=@fujitsu.com;
	bh=sqKZetzyQz+/1mBu6Do1y17tbklC6YeIzIheHAZXqls=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GgKTpm3rlfzDh/ntR8THB9jAMzayhuy7++fAnv9gxtQ1S2zSALF8dkSfI2fltfo+E
	 ghn65PwLgVhu22GaT76ajh0909BXKydiLlyQJ+ZWVDYkCK0P6jDZCtFAwNrJ7ZRJ4y
	 I0iK7BE7QBCq1RzI7Z/p9r8zOCtFT97q3XANEK79TMZPJsdQRFXRQXKX33+N28TAM/
	 zicdf2tf51v4od7ycz4c6ib1jD5Y1SAZKFhi0Fi4xdFFoA/oaNFi2O424VOl2u3hiN
	 pVqfWM1tOtEqO5RTqwlUUMXBHQ6S+mphrqixi0lQKkLEhum2csQVhFJ+oF7qAxpvhm
	 lPM8Tolq/hfxw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqKtUwZp
  s8LGP3+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzZh9J7dgCXvFm48f2BsYj7B1MXJxCAk8YZS4
  9PI1K4Rzg0ni4e4zUM5eRonWzuVAZZwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdww5iC
  wtYSzRdbWACsVkEVCX6NmwFq+cVcJI4sGElWL2EgILElIfvwWxOAWeJZw+OsHQxcgAtc5K48l
  sbolxQ4uTMJywQ4yUkDr54AdWqKDH7cjMLhF0psWdWPxOErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo21SUWZ6RkluYmaOrqGBga6hoSmQNtY1NDHSS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzklOL0vh2MG/f90jvEKMnBpCTKe02MNVmILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBK9tOVBOsCg1PbUiLTMHGFUwaQkOHiUR3hVpQGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonzrikDKhIAKcoozYMbAYvwS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeS+UAE3hycw
  rgdv0CugIJqAjgnYzgxxRkoiQkmpgYnYzbm++t7Z2rprfbac1CfvZVWUmPo18JPPjVfhBh+kL
  FrDsvt2rwyotqZcZZFa64I87Z2an13KTxYfOnUnu5/+3/6qJy+9Xq9Ze2GFRqxX+WOFR6bo3v
  K+WnXVa6d82dyfrdbF0ybmhn/XNvn0rdHi2/IGgAM+0KSk3bZsLV1+4fSnSZUXz5gdfTgdONb
  +h8y1fx/UNmxh7tb1JT8Rrh6sBMzZaa3N+7bq1UGHl39OtN6PlCiWEZ5aVvz0jtyxc91vdzM1
  HAkOs563yctI9zbCU+0mCu4SXTZEk8+60ve8X3OvWMhHb2b/h44dTC/elrNlkoVsU+qKcefLn
  hYl6K68Ehaiy2s97JpjquqPzlBJLcUaioRZzUXEiAKH741FrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-728.messagelabs.com!1661302817!105313!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22386 invoked from network); 24 Aug 2022 01:00:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 01:00:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A34E1100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:00:17 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8987F100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:00:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 02:00:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.1.8 -> 8.1.9
Date: Wed, 24 Aug 2022 08:59:51 +0800
Message-ID: <1661302793-10559-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661302793-10559-1-git-send-email-wangmy@fujitsu.com>
References: <1661302793-10559-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 01:00:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98405

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.8.bb => php_8.1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.8.bb => php_8.1.9.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.8.bb b/meta-oe/recipes-devtools/php/php_8.1.9.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.8.bb
rename to meta-oe/recipes-devtools/php/php_8.1.9.bb
index c5a424cd22..03756e04d5 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.8.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.9.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "b8815a5a02431453d4261e3598bd1f28516e4c0354f328c12890f257870e4c01"
+SRC_URI[sha256sum] = "9ebb0e2e571db6fd5930428dcb2d19ed3e050338ec1f1347c282cae92fc086ff"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


