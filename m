Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEBAC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:10:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.7286.1663639846952426568
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sfBHUyiB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663639845; i=@fujitsu.com;
	bh=H3DdLoPcg0aFz1TA4EEKc88hNtO/zUhf+Nns9j185rk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sfBHUyiB3jvzpbUnTLDMn9RwtHKORTMddHMkGV4TFnEpP1N3Ra3X52KNdJt+p4FOe
	 96xsIYCS2ARdZyky52FxpvmOPDc+qbW6UkoWmCuX4HOrhjtESPtyIpHZQTisPQaR5C
	 qV4pCNylT1406QbQBPed4B4iX1fO5Zap2/acB3LAVXc41PZSitJTT1TqZZE8bABM2w
	 JZV2eF0kNbPtlr80ToN0hg+24isyiwZREWOPbUOmpX8KRAx+5qiO4Q5Q7nLViy8SQ/
	 rRfJNvIXDmhNrWyKqxmWebypag/PjPEDbq07fZiT+IyUivgBtc5LQ8ZkV8Q7tZf5U7
	 nGQsN0pG2kRVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8OxWVdVUTP
  ZYNU2RouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePcsissBXs4Kj5vfs/cwHiRvYuRk0NI4CGj
  xN6XFV2MXED2FSaJxlXz2SCcPYwSE7bcZQSpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rBJwgKWEs1vrzCB2CwCqhKzv80GinNw8Ao4SUw8mwcSlhBQkJjy8D1YK6+AoMTJmU9YIMZISB
  x88YIZokZRYvblZhYIu0KicfohJghbTeLquU3MExj5ZyFpn4WkfQEj0ypG66SizPSMktzEzBx
  dQwMDXUNDU11jU11DCxO9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzAoEwp
  Vt6xg7Ft1U+9Q4ySHExKorxcdRrJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR47QU1k4UEi1LTU
  yvSMnOAEQKTluDgURLhZZMCSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpz3khxQkQBIUU
  ZpHtwIWLReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMGw4yhSczrwRu0yugI5iAjrihog5
  yREkiQkqqgWmm1Tu/JobL1yy0zzOlTbFrcJ7nM2v/9OVTLMv+RU3JDprFMfHa0VidIw2d09+0
  1gh+4inez3r84lrHD23/2BMSrXdVPuTdeOJdZOt/WeXDyvcjI/6m3tvrrSvbohF4ZU57t06C+
  7X/17ynXLJecvBa/E55BfnfvxQ+zdz/iI9tEo8rU9HDpx9Ndk/+FPVm1pMX11Wj7pYxTgjZaP
  23ZDl/aHaTVXOo7fyS5TKuXzd6VlxWtTV95qz80//Us0Vvr1TxOR3sVbTsW7jedGaU3f/JZd+
  ZNbTklgYserP0sdzbTR61r3em6bZVCefkLXOMPMljM3v5arn+X+ZLuHOuP/606mmwbBdz8ZLa
  7PrXokJKLMUZiYZazEXFiQDs9c2RUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1663639844!772739!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23332 invoked from network); 20 Sep 2022 02:10:45 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:10:45 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B7F62156
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:10:44 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id AB778152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:10:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:10:43 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.29 -> 1.30
Date: Tue, 20 Sep 2022 10:10:31 +0800
Message-ID: <1663639831-26853-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:10:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98869

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.29.bb => iwd_1.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.29.bb => iwd_1.30.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.30.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.30.bb
index eada93b651..1f0bcd4f8e 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.30.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "71533fe3b8f6381f24832198ba11d00f04a361454770c173b3b66bc3cdf272bd"
+SRC_URI[sha256sum] = "9fd13512dc27d83efb8d341f7df98f5488f70131686021fcd0d93fc97af013b8"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


