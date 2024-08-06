Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D544C52D72
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2882.1722934016964852790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=on+aMnBK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cov+mb5q4rgSia8ne3aIett+tDrob9JQ5qS3Raqxn6I=;
  b=on+aMnBKShT43E6hTnoKFpQCwqKfId8DgtZ9c4IQoJhyrGMNvnjU9Pqf
   dL5ajVmUdHM+nM+KDYPETCN6EqnFSHJjXrNiADfPSm/H11hlj6RZZ4vkS
   dImfV2YojgYxFUyQfUCaATc3PoJCYrfpL75uAxY8wW2avplybGHHeqtMI
   oT2VM1eRtwz4ZT/BJYy5n5oBS4WTCYBQB2Ec4VjdBPSyxoOLxYl6viPg3
   lEGXuYU5j6YemOsVp/pw1q+JL4mVVgDfSTi5mdQM/sGcjTxvt2LbgXhrS
   3mhWjgea3nBsVKD9FawbKTzF1iM6UEqeqfymX0Cp0mkZ3SiTYDwsXjojv
   w==;
X-CSE-ConnectionGUID: +l1WgvzcRsqIbwHhHSY7Pg==
X-CSE-MsgGUID: 67u2zzFITDScP7hXcHL6Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="149361397"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="149361397"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 76064D64C6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C6510D7465
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A9C020050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 15BA31A0002;
	Tue,  6 Aug 2024 16:46:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/60] gmime: upgrade 3.2.13 -> 3.2.15
Date: Tue,  6 Aug 2024 16:45:42 +0800
Message-Id: <1722933994-32549-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--2.651200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJcQ/FXybE45nH0SatXLU386nHbeBu5Lnkc0o6rNiKBitW0pkpPR1Da4nP
	T8jZv1NHi8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFK1l0jVQREmLVDnWTaJZJlXNJY
	Didu9eMcMpEJf6cqLFYRjnMjUHWed+9BY8tSuwUZaKRGDFvEX9bVZN2CV8jIkEhl8rSYMMH+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111527

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gmime/{gmime_3.2.13.bb => gmime_3.2.15.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gmime/{gmime_3.2.13.bb => gmime_3.2.15.bb} (89%)

diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb
similarity index 89%
rename from meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
rename to meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb
index fcc845417..c49859afc 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.13.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb
@@ -11,7 +11,7 @@ inherit gnomebase gobject-introspection vala gtk-doc
 SRC_URI = "https://github.com/jstedfast/${BPN}/releases/download/${PV}/${BP}.tar.xz \
     file://iconv-detect.h \
 "
-SRC_URI[sha256sum] = "2e10a54d4821daf8b16c019ad5d567e0fb8e766f8ffe5fec3d4c6a37373d6406"
+SRC_URI[sha256sum] = "84cd2a481a27970ec39b5c95f72db026722904a2ccf3fdbd57b280cf2d02b5c4"
 
 UPSTREAM_CHECK_URI = "https://github.com/jstedfast/gmime/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


