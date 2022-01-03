Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020D6C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 05:17:44 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.23760.1641187058506132347
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jan 2022 21:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SG/N2EUf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641187056; i=@fujitsu.com;
	bh=PzhFaM3LhlyVhCKeHHzZ4PD+5tabebkgMzFtu+HnKHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SG/N2EUffsPuo/gtMsba1i6vQ/Ueyuo89ADdfsse+bocYgocCsKSCSNRgkQAc72IP
	 wNynIHRn3lO8xsott4psUIPDwkieOYKkeR+9lC2BckgBpFAEBnLfM7K9nWZFb7bAra
	 5M5pF7YkdvKfaXgzUTwChMlkHYIOWo334Xhmpouq19W69l1vM5uI6oMg3DmramAQ7m
	 q3R9UxKOkYXRML5D10SLg64iC/URrdMm3bgImENQacdlw/7M7BeBpE7WEN/kk/jbOq
	 BbUptpfAhsGmyX0W9vkUAp8Wz4KYG7CkqYiGIIAJRTMnsZ9wNiyfkaFDQiEef+PSCl
	 OUs1uz7DBzYCg==
Received: from [100.115.64.186] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 B1/61-06990-0F682D16; Mon, 03 Jan 2022 05:17:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxRfd926V
  Eg6vtNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bTK32MBX0cFY9vbGdrYFzP3sXIxSEkMINJ
  4vSCz4wQznFGiSsNi5m6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhZwl5g2/
  SsLiM0CFD/46TdQPQcHr4CTxPLJmSBhCQEFiSkP3zODhDkFnCWerE4CCQsBVXR0NIB18goISp
  yc+YQFYrqExMEXL5ghWhUlZl9uZoGwKyRmzWpjmsDIPwtJyywkLQsYmVYx2iYVZaZnlOQmZub
  oGhoY6BoamuqaWeqam+glVukm6qWW6ian5pUUJQJl9RLLi/VSi4v1iitzk3NS9PJSSzYxAsMy
  pdjVawfjkb6feocYJTmYlER5K5UuJgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4D3SdClRSLAoN
  T21Ii0zBxgjMGkJDh4lEd4trUBp3uKCxNzizHSI1ClGRSlx3mqQhABIIqM0D64NFpeXGGWlhH
  kZGRgYhHgKUotyM0tQ5V8xinMwKgnztoJM4cnMK4Gb/gpoMRPQYl6t8yCLSxIRUlINTFmX957
  8cHRR5XRZKUHXkxk8UuoG3+2P1Cz133X50MVNevOZv0o+WtXMn2bQst1yaXCAUpZzT9PNlHTp
  E+LPLsR3BB/hMJE2y55k63/QdJn1jfU8QY6q/c5TVT5MVpu1MuX9411HP0/7oJS8OohrfcU2v
  19Td5p2+91Jau21K1jitWVO8wmhj9bNZtsZFutxJEyt6NDs/cIwP+LGx7nLDxx+kxLWY5keuG
  LZa7drNwUcJedmxKgfu53r53HSXK0hOlz0vuhV36Q9+cHvHtZMDssr+rDB8+C96gm7Dp/ceeT
  WDm2/GZmb6uveK9wSvxTP9Gk+oykwmXlk1x6f6iMaJKobo3fw0ZTQ4uCi8HcSSizFGYmGWsxF
  xYkA2SG1iEYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-528.messagelabs.com!1641187055!163125!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15593 invoked from network); 3 Jan 2022 05:17:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 05:17:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2035HUkn025039
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Jan 2022 05:17:35 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 05:17:31 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 5.0.0 -> 5.1.0
Date: Mon, 3 Jan 2022 13:17:15 +0800
Message-ID: <1641187036-41392-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641187036-41392-1-git-send-email-wangmy@fujitsu.com>
References: <1641187036-41392-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jan 2022 05:17:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94644

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.0.0.bb => wolfssl_5.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.0.0.bb => wolfssl_5.1.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.0.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.1.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.0.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.1.0.bb
index ba4c774fa..7b43b0678 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.0.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.1.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "7e01af012157bc20c840011a018619915380f05c"
+SRCREV = "2b670c026debc8e70621eb5c75b60931c9aa0bc5"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


