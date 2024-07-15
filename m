Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F13C52D54
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.33827.1721034178749344561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UrP3CduV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034180; x=1752570180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vDFUoykIK37Dysi4e0bRTQHgdoPbBWh3tsT/wh/6OHQ=;
  b=UrP3CduVROFdcY/zxurWLtju9CZV5r6rL2u8RDZR0QPbAHrJt/KPmA3X
   iXuvKizF1j8V43Exnpspvp804wImsKdL95C8mApLZ43lo6sYXJ9ra4JPg
   wlyWm+wFbBNRYqS7uph/KHjBPFHV9uHZjigDcJi5VuLCg0TarKGoAG2IW
   KD8LoBUSnffOFD/Q1QcIs/2HEOr3/l4HjnZcUwttBTapEOCfeH+8paPnl
   9xvlVI/V6ik1XHjXhYJuDyuqAmCgTRef+vyweig5ow9pxOCelZz73KoT2
   TlyWyhnTY5P+dem3BWQWRuofjIzj/yRK+JkVajfIc7iN7fOwQHlJOKi7g
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166935611"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166935611"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 78AD2C68E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AF17ACFAB2
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 141F320071A3B
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B5EFD1A000C;
	Mon, 15 Jul 2024 17:02:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 07/38] ipset: upgrade 7.21 -> 7.22
Date: Mon, 15 Jul 2024 17:02:00 +0800
Message-Id: <1721034151-540-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--1.465100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuH4I6QZJ07kaB8
	tGwEqygaT5Dz/ATzVAaTcsBMukkfRzbcsMCH+ZLFA9lly13c/gFyGvikEsYi8AfxTM57BPHD7P0
	f4RQxQyUi+t+0AiFaYgB/8cibO8IYSk6y+wvyFnQ6N/cDgNNi4SYtwI7rgTGSmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSmcfuxsiY4QFIlPSM92nbOI178408JS7tAStEPY9EHeDAjUl
	bazo6UE9kGiPHliZYFESNC00LiMrFMrjtvdAIvE6DRFQuS/7Fd0hQXgfC09bOx9n1XpDqsJmC9S
	iJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111330

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- ipset: fix json output format for IPSET_OPT_IP
- tests: add namespace test and take into account delayed
  set removal at module remove
- Update autoconfig tools to build cleanly on Debian bookworm

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-filter/ipset/{ipset_7.21.bb => ipset_7.22.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/ipset/{ipset_7.21.bb => ipset_7.22.bb} (88%)

diff --git a/meta-networking/recipes-filter/ipset/ipset_7.21.bb b/meta-networking/recipes-filter/ipset/ipset_7.22.bb
similarity index 88%
rename from meta-networking/recipes-filter/ipset/ipset_7.21.bb
rename to meta-networking/recipes-filter/ipset/ipset_7.22.bb
index c7ebdc1c6..5eaf14241 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.21.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.22.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtool libmnl"
 
 SRC_URI = "http://ftp.netfilter.org/pub/ipset/${BP}.tar.bz2 \
            file://0001-ipset-Define-portable-basename-function.patch"
-SRC_URI[sha256sum] = "e2c6ce4fcf3acb3893ca5d35c86935f80ad76fc5ccae601185842df760e0bc69"
+SRC_URI[sha256sum] = "f6ac5a47c3ef9f4c67fcbdf55e791cbfe38eb0a4aa1baacd12646a140abacdd9"
 
 inherit autotools pkgconfig module-base
 
-- 
2.34.1


