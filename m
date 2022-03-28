Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1ABC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:40:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.9037.1648460447030872174
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GFthMKyX;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648460445; i=@fujitsu.com;
	bh=z37WQ0mMb/UrZIfZmg6h3ZDwdNCAJfS+jbu2MQwF06U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GFthMKyXrNMHEd/KGVioF/O5ntAOBE/T58YoiaH88Ml89+JwMrZQkLBHYe5OAmcyA
	 L2wx2YxF7toZsB7+8wFuG6vxbwpR/C5eD3J1zNpbgl7VIp0mvp0fmNuQDLONDpp7Ku
	 XZBoTK2et7wvpTEtsHOD3nzWATsJnE2S0gyXw6H0M7UYB94Oq74aWam/s4KEH6T+s9
	 6TUMITPl/miLDAk4UmC0OEZ4uvJ7/rRlY4OooyqFtLF59aD9HY7gr5g2cCaxhesq5Q
	 E7mwEcVURZnwIH4sIRkZG4VQPhljMPelBlibb9x9GvLJRfxu6w7hrCmoiZp92f6mW7
	 hrUnwaDftKpCw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqDunyTH
  JYM4mI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaOxpYOp4B57xenbug2M/9m6GLk4hASeMEq8
  u36WqYuRE8i5wCSx83oQRGIPo8Th/xfZQBJsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC9hK7L/ewQhiswioSiy9t4QFxOYVcJLYf2AVWL2EgILElIfvwWxOAWeJ7gdv2CEWO0kcPn
  GXFaJeUOLkzCcsEPMlJA6+eAHVqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaN1UlFmekZJbmJmjq6hgYGuoaGprrGFrpGhkV5ilW6iXmqpbnlqcYkukFterJdaXKxXXJmb
  nJOil5dasokRGMQpxWpXdjDuWfVT7xCjJAeTkiivUaZjkhBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3ooGoJxgUWp6akVaZg4womDSEhw8SiK8E2qA0rzFBYm5xZnpEKlTjIpS4rxrG4ESAiCJjN
  I8uDZYFF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxrBjKFJzOvBG76K6DFTECL176zBVl
  ckoiQkmpgMuVuTDgp9WvpMrlfvG2aPH3z5VdZnVN0V87t0ZdPUo7wcX3x/tuu637ZO7y446/K
  aLLPvaW7S6B1anRCUeOPwyqfmY4dYOvp7Kz7KO4cHfx5ymtvRgdF+euTdi7f2SpdrpSY/ef1p
  Lnct989myVeZOvT/WMJV0HdbR+J+aFX7n35J7Lxyc0j16sUJKb9yW/ndi44cET6fERhgV9O6B
  Ef+20OotsTUlceip7yPclnasN+3Y4yf54nyR0vOfd1vgut+/V24ovJ11KzNr9tte0P7+B8+2+
  xwssr71oEni8LmavVfm3WOdZ7ZoEBq6sj0sUnbHvI05a14LfPB8FfS5atvsy99qtOMOPjN+Fn
  K59uVWIpzkg01GIuKk4EANM3v1ZdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1648460444!37663!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14690 invoked from network); 28 Mar 2022 09:40:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:40:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 48FBC100192
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1B7AC100183
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:40:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libqb: upgrade 2.0.4 -> 2.0.6
Date: Mon, 28 Mar 2022 17:39:41 +0800
Message-ID: <1648460382-15591-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460382-15591-1-git-send-email-wangmy@fujitsu.com>
References: <1648460382-15591-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 09:40:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96230

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/libqb/{libqb_2.0.4.bb => libqb_2.0.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libqb/{libqb_2.0.4.bb => libqb_2.0.6.bb} (93%)

diff --git a/meta-oe/recipes-extended/libqb/libqb_2.0.4.bb b/meta-oe/recipes-extended/libqb/libqb_2.0.6.bb
similarity index 93%
rename from meta-oe/recipes-extended/libqb/libqb_2.0.4.bb
rename to meta-oe/recipes-extended/libqb/libqb_2.0.6.bb
index eb818e5651..ce3606d777 100644
--- a/meta-oe/recipes-extended/libqb/libqb_2.0.4.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_2.0.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
 inherit autotools pkgconfig
 
-SRCREV = "a2691b96188033b5ad5c08871982048ae1f4f4e8"
+SRCREV = "758044bed5f615c90818aa5431d00303288888e5"
 SRC_URI = "git://github.com/ClusterLabs/${BPN}.git;branch=main;protocol=https \
           "
 S = "${WORKDIR}/git"
-- 
2.25.1


