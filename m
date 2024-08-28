Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A1DC54752
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8717.1724833537519712513
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fl4Bs0X7;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833537; x=1756369537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bNyFyNFBkZYba0mTbMjHH0LiQr/sWU31H6PFjs96CKo=;
  b=Fl4Bs0X7U1pmnTm01fSbARpJMxFoj2kGxlPHoc/tH5Jjb+/PtoGV4OWD
   mD2oO9G/xOnsi0l0xMaTG5TjigC8imuRPChnrvilKqt/67aPX9xTIq/Jx
   FFSdWIEjeLf85PlHlcmSZ9ocdZGX9l11M5m3Z82Zv3Kf6rA5Gc31QPQaA
   Vt5muXyFooWBWHwgz1eL2c9s2okMrMKjwc2J70Qqlz7K9CrMD4lPqmuhN
   s5wm6QLQRlnZiNJTDHYo3Zy87k8jS3k+yf85WZ/TrpzA861x+amY0GgTK
   Usee96T3N/pqNCuThhasdMjDUMw2XVD3U0st4oB6OgAMmOQwsIABIHsy0
   g==;
X-CSE-ConnectionGUID: l9kLwjt/RVmAuDNFsCFNHQ==
X-CSE-MsgGUID: inH7zZzHQ6KEJz3w+mVBZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="150902376"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="150902376"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3662FD7AC5
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 72999E49CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 07A396BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A50A81A0002;
	Wed, 28 Aug 2024 16:25:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/46] hwdata: upgrade 0.384 -> 0.385
Date: Wed, 28 Aug 2024 16:24:43 +0800
Message-Id: <1724833525-2162-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-0.501200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmIOYgThO+DmX+DLvvVL3eB4tw+xHnsmQjMQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFOSOg6XWXM2PF73NMtdbCZ/dQl
	XllvvmEAda+LVpiS3iOE9FxQjVpyl0SdHK95e4UsoJcJ9P++OXWq1ftiEIbqNIUjtWVyr+/ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111981

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.384.bb => hwdata_0.385.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.384.bb => hwdata_0.385.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.384.bb b/meta-oe/recipes-support/hwdata/hwdata_0.385.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.384.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.385.bb
index 16d2bd090..bc0373d14 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.384.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.385.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "30da6d148d996a5fbc43a9e27f5b325558b600bd"
+SRCREV = "a038a430d5861df6f0429171746639d4fd21b624"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


