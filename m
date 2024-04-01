Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A27CD1299
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:35:22 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.38880.1711982116528295747
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HKZ5lIRc;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711982117; x=1743518117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=USkRTuph8CF7O66Pcc3FvdV89USWLG9iQc/xwSRbxM8=;
  b=HKZ5lIRcEiUpCd+JTOACgtXrs0ni4m3X9R2q/SHe+i/UUbR4xbO3Ea3i
   pCzYy2tcIXDi1DEZVUg0kTKEehLLicQXF9RAe6vRWtXmFNwPKoBYqMxTg
   Bth340XJSs8Jsaeurye31d93kZ8ekEAaM1VXG+L79Q2zP9J9TskIE7pU4
   DwI5nki//6sRhTz9mOj1j4uykabFCyWsvPKplBz37fs02Bdmej24qzZaf
   DSVhvISbdF8zpHJm6xidzBK4FA5bgzFxtm6vFibyuHk2FJLkq9JRB9QKw
   eFVQ6NPzR8aIlr2TjjC2/G7nVvT2TBfS0gjh2wzwsXVHZ1lYzQ97/e6MR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133563459"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133563459"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:35:16 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D5E38D3EAC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EAE8D506C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD219E60B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 63C991A000A;
	Mon,  1 Apr 2024 22:35:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 06/47] libmbim: upgrade 1.30.0 -> 1.31.2
Date: Mon,  1 Apr 2024 22:34:23 +0800
Message-Id: <1711982104-16711-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
References: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--2.676800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45ipe4ofkluPsp7vF0/kUIbmC7C2rJeUToeh+xVJZnrh8npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFF8OaeACV7VpSXNrwrLxRJwHPe
	tOGSCa2htcCE07kl9sno3ixYMJyM1YXn7ldd39+YeIJZW10GtairOCfMEWfEZ0meQ1/vZEQOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109706

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmbim/{libmbim_1.30.0.bb => libmbim_1.31.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.30.0.bb => libmbim_1.31.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.31.2.bb
index a22712449..a386e4486 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.2.bb
@@ -11,8 +11,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
 inherit meson pkgconfig bash-completion gobject-introspection upstream-version-is-even
 
-SRCREV = "8415687e4f30ae5e36f407f179c8147f1529725c"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=mbim-1-30"
+SRCREV = "9c0309fcd3142411c921c14f7dd675cac086bab6"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


