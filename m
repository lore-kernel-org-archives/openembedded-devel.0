Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web08.4188.1606789103770124678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="101914168"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Dec 2020 10:18:27 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E5E7C4CE6015
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Dec 2020 10:18:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Dec 2020 10:18:23 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xserver-xorg-cvt-native: upgrade 1.20.5 -> 1.20.9
Date: Tue, 1 Dec 2020 10:18:21 +0800
Message-ID: <1606789101-56788-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E5E7C4CE6015.A7E72
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...cvt-native_1.20.5.bb => xserver-xorg-cvt-native_1.20.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xserver-xorg-cvt/{xserver-xorg-cvt-native_1.20.5.bb => xserver-xorg-cvt-native_1.20.9.bb} (88%)

diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.9.bb
similarity index 88%
rename from meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb
rename to meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.9.bb
index 1d75d52d2..b7dcc7089 100644
--- a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.9.bb
@@ -8,8 +8,8 @@ DEPENDS += "pixman-native xorgproto-native libxrandr-native"
 XORG_PN = "xorg-server"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c9fc7e21e11286dbedd22c00df652130"
-SRC_URI[sha256sum] = "a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa5cb614c6d01bac9d"
+SRC_URI[md5sum] = "afcae2f46d47c33863cab7fd9db7279a"
+SRC_URI[sha256sum] = "e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 B = "${WORKDIR}/build"
-- 
2.25.1



