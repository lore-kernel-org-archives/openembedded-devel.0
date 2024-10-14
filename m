Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2719BCFC50A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.50502.1728896186301225864
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K/+E8HLW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896187; x=1760432187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5ukAhH0pm8Oq0c0Ip8SjJc5XX0BsxDzSQTuyfk8ov8E=;
  b=K/+E8HLWBcnBsViGQqMCJmUJoduE0j23q0jiTy5rbkOBivk5OXJcwPxT
   5OF4fylPhyPziy+uwUKs22BTykQn/bomSxGyG2sVKaywKhRNTQoIru5Ov
   uaBkaHjT/A/LSF5sJ1dZhOFZL4/PyaOJ2bT8ff55s27jjAPnflL47ekWO
   /WZuxcf7I+SF5x7+7Bxzejmxm+0qtAHTbFb30WraCqMi8NyaYCbuQI9e4
   C8PVf50wRO81gw+6aezhMVSp/uc1OBxNkkZJb+1WHL0KyyMPq3IehAe4C
   oKXvKy11MQbfbSzEpB8oblg5XM9VzrLud/R7GRSgo83Q8oqBfuJIq2bVL
   g==;
X-CSE-ConnectionGUID: Z0q0cFA5TPiTz7U/eIt+YQ==
X-CSE-MsgGUID: bcRMdh6bRd+6YZkYu/vSUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176739249"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176739249"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:25 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3276DC68E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 834D2159BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 120FA6B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B2E081A000A;
	Mon, 14 Oct 2024 16:56:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 52/54] xkbprint: upgrade 1.0.6 -> 1.0.7
Date: Mon, 14 Oct 2024 16:55:13 +0800
Message-Id: <1728896115-2944-52-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--3.666800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrY/8hgefJn7C7N2IdiDgmM4oq
	qJHJHX2WSAhujIM3hn1LAbcoMwjx7zJ7AhPPdzcI/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ6Po
	oNqqZn93i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFLm2+bijzJPu0Mdl4kO1CkknEx
	g/2VvnnGU1bN243f60PU7tMnGhmXFkF6sIkAAH+3Z3fAPJnR1kmzsBQyj/rBXll1iYcgfe5+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112902

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Use C99 struct initializers
- Variable scope reductions
- FindKeysymsByName: avoid NULL pointer dereference
- ClearFontStuff: avoid NULL pointer dereference
- configure: Use AC_SYS_LARGEFILE to enable large file support
- unifdef -Usgi

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xkbprint_1.0.6.bb => xkbprint_1.0.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbprint_1.0.6.bb => xkbprint_1.0.7.bb} (81%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.7.bb
similarity index 81%
rename from meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.7.bb
index e866bed01..9b8c655ac 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.7.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "99cc9404f7b90289ae04944c0d98a208cc8b158492ad6481386e31d4d09aa7b0"
+SRC_URI[sha256sum] = "1c4f49c030329e0defd8c7bc3739e60f2aa1d2aabe0e2d7e63740ab629aa59cc"
 SRC_URI_EXT = "xz"
-- 
2.34.1


