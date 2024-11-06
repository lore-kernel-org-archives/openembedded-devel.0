Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC39D3E78C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.40017.1730874669307463858
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VBG1Nxha;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874671; x=1762410671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9uRfP+9sY2PF0MXCPFU685nAXeFp9OZYfRkJBZRztDc=;
  b=VBG1Nxhan/OSkZNSt5fOqGoG5F+MEH+i9Eh/G06VHf6mOByuHOAZEAac
   vQ0wM/GQxkqH0HCqod0fityl6kD2vL9LZxT87QzZ/9/bDezbC+cExiqyy
   MQQNbLupcJmMGI14deYuwxAXMGAWegEllUUBvVQBITUew3WV5V14vKIru
   Rlumv9l4/6/X92r1eK0CoWYchY1uKNXaEL8yAvvyWHUcBA8jHqqCczKdX
   SWoyPWe6p8oWcdxw8i4I4sW2z2n+QEdNaPjmgHjuyIxQiDHRqTjjIOL7W
   xcAHjQ5aQJTqmS8IItENO0awveJ++iyfMAqxH/+yTv7SyjXwwDpQ9w7WH
   g==;
X-CSE-ConnectionGUID: Yn3VNYUTQs+Ek79a0k2Cng==
X-CSE-MsgGUID: sYwsPw5oR/KnhWEnQg4dFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167635983"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167635983"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 17AAAD9224
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A8B5BF49B
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D614020071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 83E521A000A;
	Wed,  6 Nov 2024 14:31:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/46] leptonica: upgrade 1.84.1 -> 1.85.0
Date: Wed,  6 Nov 2024 14:30:19 +0800
Message-Id: <1730874660-2364-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-1.051300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFV0ieHN50/kH6nHbeBu5Lnmd2Wz0X3OaLf67wpKrIJNBe4t
	0yVpGKXkTCIhZaX006HDbV1bIWhh2HxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDVtlN
	iPa5BG1jt1vobvXYHzGAE+3W3LR/gouB25/UZeNbBShXZrDGDELopOtxWamChGSew0FaVrV8jjz
	biJzFrjzsg0vxxpcsIyLmVkJTlglFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113688

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../leptonica/{leptonica_1.84.1.bb => leptonica_1.85.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/leptonica/{leptonica_1.84.1.bb => leptonica_1.85.0.bb} (89%)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.84.1.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/leptonica/leptonica_1.84.1.bb
rename to meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb
index 89a35116c..2e1a3642a 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.84.1.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.85.0.bb
@@ -7,7 +7,7 @@ UPSTREAM_CHECK_URI = "https://github.com/DanBloomberg/leptonica/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
-SRC_URI[sha256sum] = "2b3e1254b1cca381e77c819b59ca99774ff43530209b9aeb511e1d46588a64f6"
+SRC_URI[sha256sum] = "3745ae3bf271a6801a2292eead83ac926e3a9bc1bf622e9cd4dd0f3786e17205"
 
 EXTRA_OECONF += " \
     --without-libwebp \
-- 
2.34.1


