Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A31D29F8E
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.40128.1730874674374261092
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VISBrPXK;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874674; x=1762410674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=c1CtL8OJaVN11h6fOEIT1qd4hXfwoX/KWAh2uZv16i8=;
  b=VISBrPXKlzRQyRDoKWlRcv7gVBM+hy25D8UTuGq61nAYjSwIedFrjZ//
   grP/pNeI494/NxueuPvg0t/HZ7aXwUF8rIuUEyR5BKiFiLnNGEPIslJ1K
   XrgvUQZ2ZYzzXEJeHhpBblcV0sYy7Wr+ILV6754uIPO2kJcT8bgre47Zk
   7e48PnI7C2jajaxniaziBTP1aON3pkcDEdiCwc865PZhk4M5cunc9jkpI
   agozVQMRH68ybkFKzl3nZrHNz1qybTwYuqA/Uz+uTnW6rdkydlCF9ytyC
   V4+Ybxyna4sJpzAJoGkrSvYT8EuE3+vHYFgM4vY6GNuu2vM+kCQafZ3ha
   Q==;
X-CSE-ConnectionGUID: XAtLXKK6RfinsFiJjxvDng==
X-CSE-MsgGUID: O175nReMTgOSihc5xkDUcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167293836"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167293836"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:11 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 163F5C6843
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 516F7D50F5
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D789F6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 865411A000A;
	Wed,  6 Nov 2024 14:31:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/46] libjcat: upgrade 0.2.1 -> 0.2.2
Date: Wed,  6 Nov 2024 14:30:22 +0800
Message-Id: <1730874660-2364-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--0.384200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNlXePXNM4FjOC7C2rJeUTocwHSQ+yXjTDRHq
	kd+AWCOni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFO6GPl/LhJuTTKjn1vhwM0L/D9
	iN08CGTjIjJ1DMhxwDfKh5bVHGcn9HoaufzvLmz9hYccNRdDaLyXqZC08BA59BquWAU15oBex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113693

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 - Add bt-logindex blob kind

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libjcat/{libjcat_0.2.1.bb => libjcat_0.2.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.2.1.bb => libjcat_0.2.2.bb} (95%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.2.bb
similarity index 95%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.2.2.bb
index 7dc88d727..af516a77c 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "869e7cf4511b81897512a3f0adb627218e618112"
+SRCREV = "fc04ad2d4e65e55024a4507e0aaa2659a0a588a3"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
-- 
2.34.1


