Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DE2C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:19:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.7309.1663640385691649038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f8eVIggS;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640383; i=@fujitsu.com;
	bh=KpzElSnGakSkYbkslxYWBPr/c3Vma3GLgX5l+jt2BNs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=f8eVIggS0chp/+vR6mwNG7oxtdiXZ3LNx1zUu43oD1xdtb9ddpA463nTRU4QdE22A
	 FoFYQSOqGQNEuPd7Edm8Px5n3md2EZaxBwUkWiGSx3H3Z4LAKmFi1NpO+Yf86RJHGg
	 DiPTb7cpuqdYPH/LdjwQk3653xxA6aqXnpWOs1rgmWHyv93oAJObPtnlxvXIBfLrM/
	 VxyTRxYoalZV7Lj3ed+lT9FesRXBWCVUbAcrxils2ltxcefGIjv6dKLcIhcDdvcTe2
	 x3DX0rNCcSySYUBroMvurHIVeNrMuc79jHw2G7HFZxU7MgjyQ77S79vFgk2F4Y4VYT
	 vW9YTWvb61huA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8OxWddeWTP
  ZYOIVZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePYnRvMBQ0cFWvOTWFuYFzJ3sXIxSEk8JBR
  YvnGWywQzhUmiTPtHcwQzh5GiXsnN7N2MXJysAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAgsWHORhYQm0VAVeL9vnVsIDavgJNE18M5TCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8M
  ULZogaRYnZl5tZIOwKicbph6B61SSuntvEPIGRfxaS9llI2hcwMq1itEoqykzPKMlNzMzRNTQ
  w0DU0NNU1NtY1N9FLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMy5RiRa8d
  jK9W/NQ7xCjJwaQkystVp5EsxJeUn1KZkVicEV9UmpNafIhRhoNDSYLXXlAzWUiwKDU9tSItM
  wcYIzBpCQ4eJRFeNimgNG9xQWJucWY6ROoUoy7H2oYDe5mFWPLy81KlxHlTFICKBECKMkrz4E
  bA4vUSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHecDmgKTyZeSVwm14BHcEEdMQNFXWQI0o
  SEVJSDUypGcuW6vjxGsQkK67tyxK1OV10Vizi9evXRw9bM5cY69xmEM6y+LAv6B2HccPnb2/k
  HU8d2sH3+5eGvCerhOEcjrm/ZUwmn/j4vOyTAN+3/Xb7pYV0OF6d+n8wKEvotlbo4adOiTOt5
  zs4/BP4IXc7dMcqO7sIZq0/xls2/pdP4H3uVKJ9fPWnqC0tyTk2ey+vTHzF6cKT9dptkdyj0j
  635Oxr6fPFrnUscTAyTH7kvm7hDCYVgcvPdMMC1+9pmvq0a8GibM31Nj96M3WSl2xjlljH+cK
  hJeLJ94JNi0sa+zcExMsb6OdM/Rf15P8/m4hdE6Xi/94JiMuR3Rax53n9haKtC/1arW/GeIt8
  2KzEUpyRaKjFXFScCADE86sGUgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1663640383!771861!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6456 invoked from network); 20 Sep 2022 02:19:43 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:19:43 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4D982152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:19:43 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 40DB9156
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:19:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:19:41 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xkbutils: upgrade 1.0.4 -> 1.0.5
Date: Tue, 20 Sep 2022 10:19:04 +0800
Message-ID: <1663640344-27320-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:19:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98879

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xkbutils_1.0.4.bb => xkbutils_1.0.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbutils_1.0.4.bb => xkbutils_1.0.5.bb} (80%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb
similarity index 80%
rename from meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb
index 6a05e98e32..a672ba5e5e 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.5.bb
@@ -15,5 +15,5 @@ DEPENDS += "libxaw libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "502b14843f610af977dffc6cbf2102d5"
-SRC_URI[sha256sum] = "d2a18ab90275e8bca028773c44264d2266dab70853db4321bdbc18da75148130"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "f6a4a8e9c54582beb3787b1faa8168caab125c1fee0ca9cfa5b6c9c1df25eea4"
-- 
2.25.1


