Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F826C5474A
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8718.1724833538730307556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fc18uUK/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833541; x=1756369541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BwZb0z+atDVrlFvLFWDDS9AQzh5ZeMM6zAfPPjRQChk=;
  b=fc18uUK/sMVlRnYM9Ld3r+k9Ir0PIiLaziOTYerC0WgQn4a4PZJh9+mY
   MrFIyZM1W2ZPuMkHw8n5cM5xh3Ts5Jw7VDJjZ/Lx65L1gmwb3EW47q2Fl
   SB9N3aBPX/sWTetGiiSBLbcy73U8fCphodoX1Mqy2sCye5mFe2VLh3zag
   UN7SvDOAZ/KbAsfaYf7BLKhUfKdFcQaStWlMaFpLtixTJebsA6FKDJ4qT
   VU+7wvviLyixmlwnYhiBYaAVDGZXAtBjq0nosD4F0IKh/2jd3b7zYJhps
   DjhMpF6/0oB60bYvhZm5FnjQ56jMPJ4HTZj+zWhj5NQAEFak6zNk6xBDm
   Q==;
X-CSE-ConnectionGUID: L11iXA3DTrSgMWHb/uQhgA==
X-CSE-MsgGUID: PHLLoUwmRBGgmJ7eSshneg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913173"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913173"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:39 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 88FC5C9322
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA3B5F30C
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6701420079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0F5631A0002;
	Wed, 28 Aug 2024 16:25:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/46] fwupd: upgrade 1.9.22 -> 1.9.24
Date: Wed, 28 Aug 2024 16:24:42 +0800
Message-Id: <1724833525-2162-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--10.757600-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyjY8EXdBUdHyMO
	uGtF4L1EuH0SzH4JWPZ+WcygkXcYpTyDV8RhnfzbvsqgbJ/olIOycrvYxo9KpwResZ2uR6Xu7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0D2WXLXdz+AfioIsi7Sa0gdcdCrrMF5JTOb4
	onyN9S3cY+qr/xXRlltz9kIuTkBq6vvxILmKK/HBRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07V9vM
	TaVNFNzIKoBlnI8yGMb1ffABXGZklU1q3q2TUEi5sIj7tJYClE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111987

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Bugfix:
---------
- Add support for capsule on disk for Dell systems
- Do not re-use the connection cache to fix Redfish BMC restart
- Exclude known recovery partitions when choosing an ESP volume
- Fix the VLI usb3 private flag registration

Add suppoert:
-------------
- More Mediatek scaler devices
- Parade USB hubs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-bsp/fwupd/{fwupd_1.9.22.bb => fwupd_1.9.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.9.22.bb => fwupd_1.9.24.bb} (98%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.24.bb
similarity index 98%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_1.9.24.bb
index d9059daa5..8b66084b7 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.24.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native python3-jinja2-na
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "13fe8f3c0feb25234bb0013c16440f1e7905ec1f24e89dfebb4d5c6fadaf5ae1"
+SRC_URI[sha256sum] = "12f560b35dbed981fde8cf774c6d1f2e658a157d3a63d6c439bf418dbcc44b4c"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


