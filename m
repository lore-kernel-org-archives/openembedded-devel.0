Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E1BC32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:36:40 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.29697.1661243797654227830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m4lq6S/q;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661243795; i=@fujitsu.com;
	bh=H74pbe5Ed1mhp2mxDJrhhe7YyR/1DqltwbVwiPFOuFY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=m4lq6S/qN4rEG1iZISiptEck4Ei4pJdR1mglsu6x/xm2ptFiZcMyIz6TX+7SNegAd
	 wvRGhgGTPt9Bl8RVJG2rJJzM9Q1mGUXsTNN+imUpzzp+ZpjtOJxZTknimGN4QtuNHB
	 2ElyYFzSmQY/D+U1qV08laOeOjJPYFegB8nWIBnRlxcABYxZqrVodAHfRsJtFtjhAF
	 5nELo39Kxe3gY51M29wrI9l7H9OENRwkgwREIFIdnd6aDIh60oVpgz+W9cp1XVqo2+
	 +Y4uwaz05F/DtmkSfJQmxAYn94GNEo+T3Agljg3BVA6a3pT7+wZJCLVepJa//IyaKu
	 IFiIfNgkPY1hg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpDt5Iku
  ywe9vvBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ak/+9ZCjZwVDTvW8/ewHiHvYuRk0NI4CGj
  xPTXvl2MXED2VSaJxuvnWSCcvYwSp5ZcZQSpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rBJwgL+EocXfWYDsVkEVCX+/bgFVs8r4CjR2DgbrEZCQEFiysP3YL2cAk4SPRcnskFc4Sjx/M
  FfZoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdqXEnln9TBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGprqmukZGpnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIFBnFLM+nAH4+K+n3qHGCU5mJREeR3qWZKF+JLyUyozEosz4otKc1KLDzHKc
  HAoSfB69APlBItS01Mr0jJzgBEFk5bg4FES4dWfAJTmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn
  5eqpQ4rx5IkQBIUUZpHtwIWHRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMexDkEp7MvBK
  4Ta+AjmACOiJoNzPIESWJCCmpBqbUf97yq+TmC71/erawwPLy7qV3N3EtbpKVjjrfHXxHKelp
  2m5zI9V9vmYNCRJBecxSqy09OqKm1LZkzOmPeB/xvpc/5/yf1aUHF6RI8TlqxF300Fg47+PxJ
  xrGwXW6b8ukXZS8tcUXJOdW6NjY9F5fck/OTq8yrGBruVPk1QcJS+s0PgeFZzreeWMXld/VeS
  FxWs/ltCBHpT81kZuaJnkZvPJ9f0Xde+G0Dd137r/TdA4WLuM9Fl6guf6Umn7ek7nro37IL6i
  ITun7n7eBLezKcj0lh5W3VnKI/O78pVzbtOTTHM8Mfs+lH0yC3tzfuHizRrQ9U74t7+sFNXv5
  Uq9+TlS/+e1BtMztHUVySizFGYmGWsxFxYkAmA2vEGkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1661243795!41373!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10575 invoked from network); 23 Aug 2022 08:36:35 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:36:35 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D6BB41AF
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:36:34 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CB3231A3
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:36:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:36:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220703.0 ->
 5.9.20220821.0
Date: Tue, 23 Aug 2022 16:36:07 +0800
Message-ID: <1661243768-4595-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661243768-4595-1-git-send-email-wangmy@fujitsu.com>
References: <1661243768-4595-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:36:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98379

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220703.0.bb => ctags_5.9.20220821.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220703.0.bb => ctags_5.9.20220821.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220703.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220821.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220703.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220821.0.bb
index fb736db574..31f493506b 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220703.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220821.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "787811b6eac03ab81ccf5b6957432d893eb982cb"
+SRCREV = "40551e21c507c2426a323373f3ff200799150429"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


