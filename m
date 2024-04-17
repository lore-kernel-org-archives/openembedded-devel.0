Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA379C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:59 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2729.1713318110050927853
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wyv0kwxW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318110; x=1744854110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eTZqEY/KW3Jk0jsZ1h0u1gyhs8TY+Vi4cgkfqhzg6Zw=;
  b=Wyv0kwxW9n0+um4NfBLB3u4iIkcrKw7b8zEzZZVZPfcu7Xk2WP1y7SQP
   tfu50RKSMZ6RBkfuNx4OWoM+QZMZNeCZSeO54I1H9LFSVdhpdacACbUJl
   Mt608sxSt8zBnCqegyjYThoZdmgEN1MuvF56njQJoYxrMw0zp/vwbKTCp
   Sl9mBIRVnZ1XGeWh58kdgbw65DeJexfOeqsNKUO53mkAMziBySHG8RfU7
   nflZEWuP6hNIqddZF3s6EbS5TL6ey8LpqW0UN+CH4p7V0rQPBQN2i18u2
   bsIlu5G33ULRVlKgdNieIN9jaNzABptAmkxSPSVK0TgBVFlGd0OqhJxja
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="156073692"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="156073692"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ABD99D3EBD
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EADEFD21CB
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7586C6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 223771A0002;
	Wed, 17 Apr 2024 09:41:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 45/49] st: upgrade 0.9.1 -> 0.9.2
Date: Wed, 17 Apr 2024 09:40:57 +0800
Message-Id: <1713318061-17128-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-1.259500-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2vMJYD0aRF0Rbtj8w9EqUz13QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQ1KR9+428TZu2tR7/4o/sAdHvpmwKDauHoqtx6Bezt/rRjm2Q0Q+KhkkL
	b3hR0HnTZ1n2Q9AAWWua4SAguzXWGhT4v3AoIEnx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110031

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/suckless/{st_0.9.1.bb => st_0.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/suckless/{st_0.9.1.bb => st_0.9.2.bb} (90%)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.9.1.bb b/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
similarity index 90%
rename from meta-oe/recipes-graphics/suckless/st_0.9.1.bb
rename to meta-oe/recipes-graphics/suckless/st_0.9.2.bb
index 18499cf3a..5e0f2e71c 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.9.1.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.9.2.bb
@@ -7,7 +7,7 @@ inherit pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "16f43b9433ade9d70d6085c31f9fd99f2835eaade31221020f22143035dfc0d2"
+SRC_URI[sha256sum] = "6b215d4f472b21d6232f30f221117a777e24bcfee68955ddefb7426467f9494b"
 
 DEPENDS += "libx11 libxft fontconfig ncurses-native"
 
-- 
2.34.1


