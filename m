Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546CFC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:12:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.20161.1646057538234011678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h1AsCgK4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057536; i=@fujitsu.com;
	bh=/ygSsrvQ6fcbCDiHZh/eD/jCbLWyZlaIVnLyKVv4TcE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=h1AsCgK4WTwsl0kgIPh9tS7QQlt122r0pHIcw5VKyjqR7Tb/dVjwwmy5pjoHXStTe
	 kz9EY8ULO4QP2jx5kpRVbPcP0Ww3Jco1JwBq64DIUThTFWK23iAuMVL65tJKN7ZdKy
	 wGbTkua1SSfVIZdxD1cTw+AhqSy3c+8pVDDPaiXuJv17l6cKKLIHS18sTZ0WAA7M6Y
	 kY6yT7sgAoewAV4jw4XBxjyg+YCKcjCA6Nuyk5oR0jjAzLBEWVyOHvprjt56DeK/Y5
	 vdBbWPQ7/C0aDrQ7/rFIdXyZbXamRa823Jfhqvdmo6OIJSs4UJCmUupaZ8bf4hP7m9
	 kQrl/MVI0KIZA==
Received: from [100.115.35.140] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 52/BC-14616-048DC126;
 Mon, 28 Feb 2022 14:12:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqOtwQyb
  J4MF3fouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePTm9UsBSfYK2Zt+cXawPidrYuRi0NI4Amj
  xNQn89khnAtMEocXnGLuYuQEck4wSly/UgViswmoSUy/dYMVxBYR0JdYOnsPWA2zgIrEi9897
  CC2sIC9xLqVu9lAbBYBVYmdq5+D1fAKOEl0trYzgdgSAgoSUx6+B4tzCjhL/P18mBFil5PEjs
  vNrBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPaoGaqSVw9t4l5AqPgLCTts5C0L2B
  kWsVolVSUmZ5RkpuYmaNraGCga2hoqmtsqWthpJdYpZuol1qqW55aXKIL5JYX66UWF+sVV+Ym
  56To5aWWbGIEBnFKsXrQDsZvK37qHWKU5GBSEuXl7JJMEuJLyk+pzEgszogvKs1JLT7EKMPBo
  STB23lMJklIsCg1PbUiLTMHGFEwaQkOHiUR3qeXgdK8xQWJucWZ6RCpU4yKUuK8KdeAEgIgiY
  zSPLg2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+w9kCk9mXgnc9FdAi5mAFv8NlgJ
  ZXJKIkJJqYOqYNsNU6BOHIfvKuC1270W35FR63U9r0EietVl9xg+B2y1Bv9uV37ctebRMJfC2
  +aPtBjvtf9s+eGshdW17fMUcldeCiTub+pJF+Ls+ndnUd+Sbw4RVWWv/xSxeePTE0+sP/a/2x
  XwxULhYOGGXkYdh+5LCyLaJ9rNUPrp6Te369zZwY03TY48d3wJqdcsche2cdxZ/Db7818XVfV
  FBb+Bi/8dXzrImhx3eZqle7HjCfKvf25UOjwojBHkEJrkdWMz6S+7ZQcPk1MUFP9UXPgzQm91
  qe8Pqxw8Vpl3KdZXXEn13aG9yYSh5/3lJseae1tKJH69M2Ofx4tBKCaEqt4qeApuji/yP/Ytj
  Pb/76B4lluKMREMt5qLiRACiWz/QXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1646057536!53929!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12736 invoked from network); 28 Feb 2022 14:12:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:12:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CF198100196
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:12:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C1075100187
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:12:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:11:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cukinia: upgrade 0.5.1 -> 0.6.0
Date: Mon, 28 Feb 2022 22:11:44 +0800
Message-ID: <1646057506-36235-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646057506-36235-1-git-send-email-wangmy@fujitsu.com>
References: <1646057506-36235-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:12:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95574

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/cukinia/{cukinia_0.5.1.bb => cukinia_0.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/cukinia/{cukinia_0.5.1.bb => cukinia_0.6.0.bb} (92%)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.5.1.bb b/meta-oe/recipes-test/cukinia/cukinia_0.6.0.bb
similarity index 92%
rename from meta-oe/recipes-test/cukinia/cukinia_0.5.1.bb
rename to meta-oe/recipes-test/cukinia/cukinia_0.6.0.bb
index 34dd8c8686..bc595c80cd 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.5.1.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=master"
 
-SRCREV = "ea934c5393ad99c37bec3c621a364122720cce02"
+SRCREV = "3fd9db9838ef3de20965aa5f7657c363b679a995"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


