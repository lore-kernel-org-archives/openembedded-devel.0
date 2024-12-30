Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FCFE7719A
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.58738.1735543845169649572
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hq2fW06D;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543846; x=1767079846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Faavft4x0i3im1atzmcpILxZqs0zUqmgqasb5Nmj49M=;
  b=hq2fW06D0j1YzcYYpS4W3occsn41kmlptwI7vqKGiG1NKWnkmfZkgISJ
   /DRx2pYB7PEWXI4wFT8NUZuzT+Qa8FD52hIKHLg1GQ9aIHCHYgCkMzlDn
   gG5Rour3QD0XtQafzlCHBI1k+QMxv88fUMaz8Si0deG1Wo0w/rrxq8yzb
   W0YFtGXSzGXWzHO/YwHgB0/pTL/yszRp5Huj2/Qori6kCTz5OYpr5u41K
   7sLERKvfbPL7RjZh2WWUTFLr5B7T/GmsOyJL/dB9H+nmB0zCAqZaTnL7x
   fqAeQ6k84dAlx28i7xRcGvu/wB9A8ybDwWsasgtWMT9vlnSOQ2KPdQzvm
   g==;
X-CSE-ConnectionGUID: GCaZumFDTQ6SB08/qu3utg==
X-CSE-MsgGUID: TJNc6P+lSrSm6kzC39L5tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185304164"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185304164"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E752296741
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6C9DD5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 47A3A6CB1B
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:41 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E7B991A006C;
	Mon, 30 Dec 2024 15:30:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/18] libsdl2-image: upgrade 2.8.3 -> 2.8.4
Date: Mon, 30 Dec 2024 15:30:23 +0800
Message-Id: <1735543836-2512-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-2.941800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4BczecfIkWXJYH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRtr9+Kgn2XgeGME81e9NBDCo8W
	MkQWv6iV3LAytsQR4ewSz8fXAzKym3QfwsVk0UbvqwGfCk7KUs2RcHeCu7J+wB6iPNR5UzBRmPU
	SNlvJqfjiRUf5F/5dw8/wxieZvINRsTppwdNeIYEPfpsA4jN/LGnb9J5+OnhEcHx19Aw4XvIgep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114584

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/{libsdl2-image_2.8.3.bb => libsdl2-image_2.8.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-image_2.8.3.bb => libsdl2-image_2.8.4.bb} (91%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.3.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.4.bb
similarity index 91%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.3.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.4.bb
index 33a42d9728..c73a3c3dc0 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.3.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2f6d9e01c97958aa851954ed5acf82ee"
 DEPENDS = "tiff zlib libpng jpeg libsdl2 libwebp"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4b000f2c238ce380807ee0cb68a0ef005871691ece8646dbf4f425a582b1bb22"
+SRC_URI[sha256sum] = "5a89a01420a192b89dbcc5f5267448181d5dcc81d2f5a1688cb1eac6f557da67"
 
 S = "${WORKDIR}/SDL2_image-${PV}"
 
-- 
2.43.0


