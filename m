Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1D7C52D1E
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.33786.1721034178267353362
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bnll3/FU;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034178; x=1752570178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IEbc2d5PfsTOTLLzY2GRBnMSJ8F5YvbggHFeWfZ9ei8=;
  b=bnll3/FUJB1wK/EUEmWdgSeJ/j7VfEKNupsh/jWFuA1laXYsL2AZQ6tb
   QrA67vgYd4FH1fsddB2s4EKTFCx0IJGiclX8l2sgcnhsuFQrR5fCrR+hp
   PhNlfGuFumGExiJG8C7E4+T94nhrfICG2N6mclM0Yb/KPhHrLTfGQn+pL
   gHYvpC68a7uIOHx1QqofZAlouVnuuBBs1wH193sqgPt4+Inw4lqZD1CDl
   etND1kyhqAQURHODlJA559Lw7ldKDoDuTg+UOGHgicWt0kbWwt4l64Kb2
   GF5xo9g230mE7okilfaQ5RKOT6OqUBGMoBtG4049mhxdMmhw6wlysrM5d
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="145800154"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="145800154"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 00AC1D5A47
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F261D5042
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CDEC6BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DD2D1A000A;
	Mon, 15 Jul 2024 17:02:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/38] libass: upgrade 0.17.2 -> 0.17.3
Date: Mon, 15 Jul 2024 17:02:01 +0800
Message-Id: <1721034151-540-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--1.161900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvhJ0c9eVIVcHWC
	d6QvVzbeCqIlUwwPgexKtne3LfonHUPbYPqd/GaJuLt50vtxBA5a4WbtOovh4Y+FcgdQoKJ3vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBCE2NlBjIjctE8mz+ry/JSsGH
	K/YO0c/+LzNWBegCW2wgn7iDBesS0nRE+fI6etkpUpUMmuA6mulJscFS8C9FT+Fxd1rORfviR+/
	DdJKkv75PqyAZc5sMa2CsiWQ2hth1Jb6nxy/xG35O1D3nL0F5zClsSulfut+Uu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111331

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix 0.17.2 regression in the fontconfig fontprovider
  leading to undesirable widths being chosen from large typographic families
* Fix configure generated with slibtool-provided autoconf macros
* Fix "make check" for shared-only builds
* Constify some API parameters in a backwards-compatible manner
* Add new ass_malloc and ass_free API functions
* Tweak default optimization flags
* Speed up parsing of events with very long override blocks
* Improve handling of HarfBuzz-related failures

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libass/{libass_0.17.2.bb => libass_0.17.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libass/{libass_0.17.2.bb => libass_0.17.3.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.17.2.bb b/meta-oe/recipes-multimedia/libass/libass_0.17.3.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/libass/libass_0.17.2.bb
rename to meta-oe/recipes-multimedia/libass/libass_0.17.3.bb
index e239d028e..3dd678f05 100644
--- a/meta-oe/recipes-multimedia/libass/libass_0.17.2.bb
+++ b/meta-oe/recipes-multimedia/libass/libass_0.17.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 DEPENDS = "fontconfig freetype fribidi harfbuzz"
 
 SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=master"
-SRCREV = "cbb48cc4f2f076300004b8b06a86bec55281d0c2"
+SRCREV = "e46aedea0a0d17da4c4ef49d84b94a7994664ab5"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.34.1


