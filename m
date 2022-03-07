Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3BEC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:45:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.25447.1646653516784368786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CAg0YA+e;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653515; i=@fujitsu.com;
	bh=GD4+RvnKlIe+Sd0gFAfgD9rhaBZtw4tOjTsDEokYG7w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CAg0YA+ebSuIDzsVWSlh/ARkyVDOQ7e8kJiqcElW6qNvcd9G8lGVR347ihjkZ5y6W
	 lZDLhBQD2L6Wb96UgzVKODTvJWbUD+an+VflCEBROuJq7obzlBS82ijBPbAJwpBKaK
	 gfTW5OlU65fdvXSJ6L1WEwsXJ/3WypC68x8WgfJNAKqwG/PYWDFjHG2VGgIQLH15z3
	 /FYg0As4qkmQ5O8ejRKxwyKcaTYLhe7e0ssdcz/9HiCRqIRestDrd07ikcf+yzWGw6
	 yKkYRfuP5tdHTCjBeB0GprSiMEClWik5jT94Bl3Bgh4tMQ4+XCFZpiUdoTHf54Ii7g
	 hHYCdnzmGTm5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSdfrg2q
  Swbvd2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bP7gtsBSc5KpoW7GJuYPzA3sXIySEk8IRR
  4udSwy5GLiD7ApNEy93jLBCJ44wSj1fygNhsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DN
  khYwEdixYrjQHEODhag+L3tkSBhXgEnia7mF2CtEgIKElMevgdr5RRwluhbfo8VYpWTxNP1za
  wQ9YISJ2c+YYEYLyFx8MULZoheRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2TijLTM0pyEzNzdA0NDHQNDU11jU11DU0s9RKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitz
  k3NS9PJSSzYxAkM4pVh56g7G06t+6h1ilORgUhLlTVmgmiTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgvfTG6CcYFFqempFWmYOMJ5g0hIcPEoivMcvAaV5iwsSc4sz0yFSpxgVpcR5r70DSgiAJD
  JK8+DaYDF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw72aQKTyZeSVw018BLWYCWlxlqwS
  yuCQRISXVwFT/Tev39NRF1/VimYumi8gXafjM3VKwUcFrBv+/zKWtpq57pr2pXleyuWSZUJbE
  fB2n+yJ7Dfjaz755tGXesZWpb3vKvqqERhlGN/G826VczJ7rI+D9J2jRiWa9e7f/6Yt/OJ9m+
  vjJ7SnZzw+7uP7oVu47r3mYy863Rl8hen0Ee/wby2NrMrJWHC2wc4ld0uerGen/kbv2tufVu1
  otnBP360409/lwgON5t8xvfldL9fbgtXqv8g4svSyoNm1n86cEHdu1bXe2TpszNc0iI/smj3a
  Bbu4WS821oTofMiXSpXNehN6xKrp+ZWPEuxlCBk/PGLKaVAa/9V78Pru1LClxX8+D05eey2ev
  jbO5pMRSnJFoqMVcVJwIAGs2ONVcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1646653514!110570!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9423 invoked from network); 7 Mar 2022 11:45:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:45:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 58432100440
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:45:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 48675100352
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:45:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:45:02 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 2.2.26 -> 2.2.27
Date: Mon, 7 Mar 2022 19:44:46 +0800
Message-ID: <1646653487-55825-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653487-55825-1-git-send-email-wangmy@fujitsu.com>
References: <1646653487-55825-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:45:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95834

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-django_2.2.26.bb => python3-django_2.2.27.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.26.bb => python3-django_2.2.27.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.26.bb b/meta-python/recipes-devtools/python/python3-django_2.2.27.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-django_2.2.26.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.27.bb
index 523f0e091..786afab24 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.26.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.27.bb
@@ -5,7 +5,7 @@ UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
 
 inherit setuptools3
 
-SRC_URI[sha256sum] = "dfa537267d52c6243a62b32855a744ca83c37c70600aacffbfd98bc5d6d8518f"
+SRC_URI[sha256sum] = "1ee37046b0bf2b61e83b3a01d067323516ec3b6f2b17cd49b1326dd4ba9dc913"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


