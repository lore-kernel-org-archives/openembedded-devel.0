Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E63C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:33:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.2583.1658806388350472902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PFk4sx1i;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806386; i=@fujitsu.com;
	bh=eQrwgiOUobF8F0lbwxk8HICU+RAcxm8sLRlNHLg5lxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PFk4sx1irnr5kijFpPXabm+Xk2WgLo255abGui1gFRRknCKHSNBXcEeVoyEu3IPgI
	 rO+N643agzK8qEkCQextoM+6g6TzjDup5gO0dEe2DKTSvihltcrXNsgcUzR9sAgb1X
	 2q/la+nF6y88dfaZuYjLdkSUZZliNa1XuWAKYNn0IX9bXEXZpp2zkmVA9LKLbO4jaY
	 IRsy+y+/MUp7fLJ9h+LawPR1t69PwEBf+7cav5dxAv1HMJBcRnescTqWYx/xt7yJ7g
	 ucYdgAhprH5kRPwcnQGlZMtIw89gm8x6+FdYRgSdNCjpCSS3d6LBCJ+d+4F1OyWA8D
	 hUVrbucbqEzPQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqFuYcD/
  JoOOLhcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFw+UWmggncFXcnz2FvYLzP2cXIxSEk8IRR
  4vaN/UxdjJxAznUmiSdz0iHsPYwSc3/LgdhsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC9hK/Js4j6WLkYODRUBVYtHfVJAwr4CjxJrrtxhBbAkBBYkpD9+DtXIKOEl8PP6ZDWKVo8
  T8h21MEPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsCokZM7axQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hqb6hpamOglVukm6qWW6panFpfoGukllhfrpRYX
  6xVX5ibnpOjlpZZsYgSGcEqx8o4djG2rfuodYpTkYFIS5d3SeS9JiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgTv67j7SUKCRanpqRVpmTnAeIJJS3DwKInwlsYApXmLCxJzizPTIVKnGHU5Zn5tO8
  AsxJKXn5cqJc67AmSGAEhRRmke3AhYbF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMybGg8
  0hSczrwRu0yugI5iAjvikfQfkiJJEhJRUA5OM7onn5j8fPpWdw3Si5shCts0Z0scuMbVn2B70
  C5cWncJ01v7Hsk1lbV22LTtOutbwXJzLLLKj61hWyKYtl9/ONL1QafTjMsfWieWylSELw7x5t
  G9djNwU2n9kw6QXTjHi7MHH3HYzh34uVhaOlzz6dc5KrYqXH6tPXdh18v6GKdbqMWkrtv1p1O
  sJ+bN8S+P2X8qalanLtl95N2P7K56vMQWprxn7Vvi6n9suzZ7JYx21cFX/tW3i0Wf8Ogt/epv
  xh7LZN+3ue307f/qcqbzulQ+T46f/MJKbrrPhypmgfR77FBl/LDrZU1t3V1G4rLV1StaVyQrm
  05LXtL6U41x+69IkszkRFzPEBewWeyopsRRnJBpqMRcVJwIAXR+kiGgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1658806385!160179!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28639 invoked from network); 26 Jul 2022 03:33:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:33:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9CFFB100193
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 905FD100192
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:33:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 7.0.2 -> 7.0.4
Date: Sat, 23 Jul 2022 13:38:20 +0800
Message-ID: <1658554703-9317-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554703-9317-1-git-send-email-wangmy@fujitsu.com>
References: <1658554703-9317-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:33:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97979

Changelog:
==========
Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:
----------------
    (CVE-2022-31144) A specially crafted XAUTOCLAIM command on a stream
    key in a specific state may result with heap overflow, and potentially
    remote code execution. The problem affects Redis versions 7.0.0 or newer.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/redis/{redis_7.0.2.bb => redis_7.0.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.2.bb => redis_7.0.4.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.2.bb b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.2.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.4.bb
index b188278e1c..993ff34b10 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "5e57eafe7d4ac5ecb6a7d64d6b61db775616dbf903293b3fcc660716dbda5eeb"
+SRC_URI[sha256sum] = "f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


