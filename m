Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858D1C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 09:46:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.47499.1653990369933120979
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 02:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=E7spo7hv;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653990368; i=@fujitsu.com;
	bh=aSmkvwSd+IyVQF6/k9sD65fXNwa8mAkHhErmIEW+5ro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=E7spo7hvE9eyRmTlXNOyqs/sGa7rWM7W8TxwTowKAOYNKU4u/sRXbjP4JwDA/X2sL
	 BMY4FYPO/GqE9+yQBhBPdAnFUGxcLXCDY5Jff5vTITdLJsCQ//rSabetMrPLQVK/bT
	 GRimeZRHsX5eVPpkxdndSYkDhceuayGUwRQYszbzSb8Xzzom9rusIaQjaDyj5fbNkQ
	 +fy+6Bf+WiftYcJCdxzGNTa2TZw4K5yWC90rZ26abXP/vZzZ7MpH2Pqi3XfgLN/pAO
	 966Q0orLU4PuKVkH2fhtHv+sKvF2uF+jUzhFQdiKvX/nWp2OKMxWbKbY9x3rGDbzLm
	 0zZgDl8IpuVXg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSff+46l
  JBt/villcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlTrv9mLrjOWdG+/y5TA+Nfji5GLg4hgSeM
  EovvX2WBcC4wSfyeMpkdwtnDKNF8ciJrFyMnB5uAmsT0WzfAbBEBfYmls/cwg9jMAioSL373s
  IPYwgJOEqf7+sBsFgFViXNPJ7CA2LxA8ceHp4PZEgIKElMevgfr5RRwljg2fQGYLQRU83L1Fq
  h6QYmTM5+wQMyXkDj44gUzRK+ixOzLzVBzKiRmzNjGBmGrSVw9t4l5AqPgLCTts5C0L2BkWsV
  olVSUmZ5RkpuYmaNraGCga2hoqmtsrGtuopdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yT
  opeXWrKJERjGKcWKXjsYX634qXeIUZKDSUmUN/jy1CQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rw1D4BygkWp6akVaZk5wJiCSUtw8CiJ8Lo/BErzFhck5hZnpkOkTjHqcsz82naAWYglLz8vVU
  qcd/I1oCIBkKKM0jy4EbD4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcXZBVPZl4J3KZ
  XQEcwAR1x7dsUkCNKEhFSUg1MCw5auUqEqE1c4SrDEPLe9JTkv/Rpk3hDDtl///tc/9jCCypv
  hE7tF39yschQ8dKHpyvDhbLa3A+9rFD9c0zEK3rqhoP3dO5HTvAqk/Vh1ZZQbtxkY68tk2kr8
  cvcZNs7/ovP3Cc2v4zizXM0i4r7wH7lYJrTstmCbB+tr8kpdXG+rdR+IRsty3tcralp348vyq
  rVC19fcvjq3J60/a3RvR+CZ5on3GkUu28tff+NnhvfsT+STYf7EpMD77MUKj35ebyIp/R+i8J
  6jkm98suCJIrWLTiv8MDg8RPpdJakiaxzuldcn1y26v6c2O43O9zrTA8yT5/QtVC80dvN6/Df
  z1pTfxRNWfX2ymSJeRFpSizFGYmGWsxFxYkArxVAWWoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1653990367!221340!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21008 invoked from network); 31 May 2022 09:46:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 May 2022 09:46:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E77A3100450
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:46:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CBC891000D2
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:46:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 31 May 2022 10:45:46 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libdvdread: upgrade 6.1.2 -> 6.1.3
Date: Tue, 31 May 2022 17:45:20 +0800
Message-ID: <1653990320-31470-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653990320-31470-1-git-send-email-wangmy@fujitsu.com>
References: <1653990320-31470-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 09:46:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97346

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdvdread/{libdvdread_6.1.2.bb => libdvdread_6.1.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_6.1.2.bb => libdvdread_6.1.3.bb} (72%)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.3.bb
similarity index 72%
rename from meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb
rename to meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.3.bb
index 054fe4a48..9090cabb1 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.3.bb
@@ -4,8 +4,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.bz2"
-SRC_URI[md5sum] = "034581479968405ed415c34a50d00224"
-SRC_URI[sha256sum] = "cc190f553758ced7571859e301f802cb4821f164d02bfacfd320c14a4e0da763"
+SRC_URI[sha256sum] = "ce35454997a208cbe50e91232f0e73fb1ac3471965813a13b8730a8f18a15369"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.25.1


