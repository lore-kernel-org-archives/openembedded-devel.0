Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6834.1608279000259749360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 00:10:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102708864"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 16:09:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4BC164CE601D
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 16:09:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 16:09:57 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xserver-xorg-cvt-native: upgrade 1.20.9 -> 1.20.10
Date: Fri, 18 Dec 2020 16:09:59 +0800
Message-ID: <1608278999-111811-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4BC164CE601D.AA527
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...vt-native_1.20.9.bb => xserver-xorg-cvt-native_1.20.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xserver-xorg-cvt/{xserver-xorg-cvt-native_1.20.9.bb => xserver-xorg-cvt-native_1.20.10.bb} (88%)

diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.9.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
similarity index 88%
rename from meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.9.bb
rename to meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
index b7dcc7089..170e0bf78 100644
--- a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.9.bb
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
@@ -8,8 +8,8 @@ DEPENDS += "pixman-native xorgproto-native libxrandr-native"
 XORG_PN = "xorg-server"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "afcae2f46d47c33863cab7fd9db7279a"
-SRC_URI[sha256sum] = "e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571"
+SRC_URI[md5sum] = "8cf8bd1f33e3736bc8dd279b20a32399"
+SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 B = "${WORKDIR}/build"
-- 
2.25.1



