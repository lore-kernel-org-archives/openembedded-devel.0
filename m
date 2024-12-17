Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D113E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:02:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.77394.1734426116027602074
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OPYxuCbg;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426116; x=1765962116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9nKYYv2RLFFz/MCpygK7uHfUT+R/g5IEeDMtoN5QKg4=;
  b=OPYxuCbgyrFcP+EKH06OKZNACXGlJN57cr9ufqKlqJXqh+boJXAmW0lU
   U6iaZCf/UL6w3c8Nhrfocq+8vWHNeIIXyGnRZJu/Or3X0wnvwN5kI3/Ir
   PsuIXsdOCWXQIbIamsruqebsC69GwF0RK65qt7rCRj30q0mN/kZS+XqgN
   wuZkN82/6j/Leq2oNRRqdQqDEPE0MlWcKyOUb2UHYDD/uukPHtI7LOi83
   DcBlUppvgRq/Vyw1lRY+Kbk9PrKjY+8HAATx8YkeBJwBdwvd34KqiYz5s
   j9zoCPljcJr1iByr8j4bCi6Xv8s9m+cZWjq3H3TNhy7YfAESCzxSYKqLL
   g==;
X-CSE-ConnectionGUID: +ZyeH2TrQO27VHDWMH02hw==
X-CSE-MsgGUID: GrWqj2WFS0S4dWI4q+9gBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="162953824"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="162953824"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C2769E852C
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 94F2FC8BF9
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D8D2347B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E860B1A0073;
	Tue, 17 Dec 2024 17:01:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/17] openjpeg: upgrade 2.5.2 -> 2.5.3
Date: Tue, 17 Dec 2024 17:01:32 +0800
Message-Id: <1734426096-18300-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--0.031900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoB4dxpD5pkr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CC7C2rJeUToQPYDdySm+X36yZ
	xlKUd8EUOKoYooxw2BKwnY0RVRjvrHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5S7A
	WtWSopLuEQTqbGp+B5tXE7CycUYj8glzDlhgfmgw+llRbruFDH2B0yogbVjmbS/hRrSotgyezgK
	pLjlXdMq03H7GpGpIqCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114362

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changelog:
 https://github.com/uclouvain/openjpeg/blob/v2.5.3/NEWS.md

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../openjpeg/{openjpeg_2.5.2.bb => openjpeg_2.5.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.2.bb => openjpeg_2.5.3.bb} (92%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.2.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
similarity index 92%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.2.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
index 45f1b5ef42..231bf84573 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.2.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
@@ -8,7 +8,7 @@ DEPENDS = "libpng tiff lcms zlib"
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
            "
-SRCREV = "39e8c50a2f9bdcf36810ee3d41bcbf1cc78968ae"
+SRCREV = "210a8a5690d0da66f02d49420d7176a21ef409dc"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.43.0


