Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A75CD1298
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.39353.1711983090546859826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pCz76FmU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983092; x=1743519092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WfhX8ULsiZ0fnPUh6B6ms2nbLrzH/JW0Rn/xA1Jrfy4=;
  b=pCz76FmUI7SEzpv3UkbvC1eq/D0bCxJKRECJRw/YLIWf+PjqiXQffZc+
   59yP4TXkdvKjhMHBD4La8CmK7kH+DP9b58XLyNSjYOC/Z0wFltWdEqa2d
   TXUnShVBgJUt3wbiNxRVnmliuy+GFjv6XA4v7pOGh0LSeGb02VMps/vmF
   AG024vxM4r3GhkCSaQ/VglPJrwX7phWEO4mLI3yOzBCZywBN7cOu93GvJ
   upKv+Wu+/qetbOkBLm18uz7xxxbryFDtTkpmJSTrJhmTKQZQVV/0nm4WJ
   ALBFaWAzMxmvCjUikvYxUuINVLfVILkRQeLkjmonfrkIK/lMzX1l6IpcU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="156148771"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="156148771"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AB465A3442
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id ED9EFD5006
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8721D20093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3C7FC1A000A;
	Mon,  1 Apr 2024 22:51:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/47 v2] libqmi: upgrade 1.34.0 -> 1.35.2
Date: Mon,  1 Apr 2024 22:50:39 +0800
Message-Id: <1711983079-16849-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109724

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


