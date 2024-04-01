Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5771ECD1296
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:35:22 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.39025.1711982118010852197
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HnnO8pKk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711982120; x=1743518120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WfhX8ULsiZ0fnPUh6B6ms2nbLrzH/JW0Rn/xA1Jrfy4=;
  b=HnnO8pKkUxMMP5wi+njjdZllCg7rv6/w1lVjucts7V/Tdkxar6+njb16
   wDqptTl8g+p0fXBQ+mkJeIqdXgo7Ej1rzQ8GvC/fzmSy0sULB72h1m8hh
   lWGnphdce90W/xieOJZKL9EFce9f3Q6AXII2NqBPw5RoYjmFLNuF1tMOU
   En1FtaP4oaZiLtZnxQYCLpnMI0cwRUlrtkzqFW9dJ4MZ0BNGzIRsGBY1F
   U0TXlLHzzfNdFanFs4DqNC6vTcJ2x6/HgnjHflGsPn9bKrJTP8ZzFjvq2
   V4iWqI8XvPG7NpUgHrwny7wPR/s5A8H/h7zdOW2pV1eYulOPz3c4dORJ8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154246086"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154246086"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:35:18 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C2999D4800
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B97F7BF3C3
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 59B542009325C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 112071A000A;
	Mon,  1 Apr 2024 22:35:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 07/47] libqmi: upgrade 1.34.0 -> 1.35.2
Date: Mon,  1 Apr 2024 22:34:24 +0800
Message-Id: <1711982104-16711-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
References: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--2.676800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45ipe4ofkluPsp7vF0/kUIbmC7C2rJeUToeh+xVJZnrh8Iy/
	Fg1mRnqLtAdDE/EtBJIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzrHmnSm7dm0NmD9
	VSMB5eMKyfEe0pwM73Q3cwRryefdKBtGvaac4tGfEZqAU9ooMGJEGTkkv9S2/IpzIlwm7SFp9Sm
	76gFcZXiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109707

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libqmi/{libqmi_1.34.0.bb => libqmi_1.35.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.34.0.bb => libqmi_1.35.2.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2.bb
index 94164a0b5..aec90ae63 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 glib-2.0-native"
 
 inherit meson pkgconfig bash-completion gobject-introspection upstream-version-is-even
 
-SRCREV = "3f07d6e5b4677558543b3b4484ea88ad92257e92"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-34"
+SRCREV = "72d92e75a430900c00aeb1a471965d53eb307708"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


