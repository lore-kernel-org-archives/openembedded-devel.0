Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D931C54E69
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:16 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8209.1710827173886204041
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rya5rmq9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827175; x=1742363175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bk1fmiRkN+AMy11Fd5xxr1NGJD/eDiiqdjSBHzvkJwQ=;
  b=rya5rmq9dvzGOjOxFUDJaLkozOy1Wipvv3/Pvd2RXD7lik1x55qwn8d6
   fbqAtSFt8vGAJzPZPlOGvcNsqaXwCU0ee0nRRyw7G/MjvTBNQF6brdl/K
   Mh7q2n6okuAoQNY9ywOfdL92YqR4M+qa8/fUdf0RWcKb8OVF2UTzjq9GP
   wYBZm1/ngs89U7cdWlKkZXM6dtVo5thntve1+nTRcKGPL4Jn8TXJdiO/x
   dAvd6gf0YDlsJCBfCyLYx/g6VP1GzXAFkqwnPrehGKT3l5JPbWNBm/mrw
   F4JRX5L95xbNLCSlXh5kRxk6hJEPt1lHTElXwx9d2TKo8i0475CbeWJ6X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152673978"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152673978"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:12 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 23B492E9CF
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 61692D7B87
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E21612009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 851531A006B;
	Tue, 19 Mar 2024 13:46:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/50] iceauth: upgrade 1.0.9 -> 1.0.10
Date: Tue, 19 Mar 2024 13:44:56 +0800
Message-Id: <1710827139-30056-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.203300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrkos2tunL8DQaVuuTY4OGg/fF
	c/5DgJyiFFgbK/N4lN0m9LdyhUih6ooU9+RAiiVnOyPKih4Rysh2058usyiPi6MQi364g884t9h
	PnlbRrOz7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgFXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJPMm0HHcc3MEnNQucARr+7ATZfquRfIrBQ/FXMDGGYGOQi3
	ApM/u0sYBlihc6i2ip+9MeS1AJ1zqHhIcEAyAs7wriD7r+4g29Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109424

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-gitlab CI: stop requiring Signed-off-by in commits
-configure: Use AC_SYS_LARGEFILE to enable large file support
-Use reallocarray if available, provide local version if not
-Silence -Wanalyzer-out-of-bounds warnings from gcc 13
-Variable scope reductions, as suggested by cppcheck
-unifdef __UNIXOS2__

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{iceauth_1.0.9.bb => iceauth_1.0.10.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{iceauth_1.0.9.bb => iceauth_1.0.10.bb} (79%)

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.9.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.10.bb
similarity index 79%
rename from meta-oe/recipes-graphics/xorg-app/iceauth_1.0.9.bb
rename to meta-oe/recipes-graphics/xorg-app/iceauth_1.0.10.bb
index ea0ef0a7e..7d025de4c 100644
--- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.10.bb
@@ -12,5 +12,5 @@ BBCLASSEXTEND = "native"
 DEPENDS += "libice"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "2cb9dfcb545683af77fb1029bea3fc52dcc8a0666f7b8b2d7373b6ed4c408c05"
+SRC_URI[sha256sum] = "3deefb7da26af9dc799b5628d929d91c9af68c78575639944db3b955f29aa029"
 
-- 
2.34.1


