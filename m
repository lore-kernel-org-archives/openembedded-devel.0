Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8127.1602668038655281998
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 02:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,374,1596470400"; 
   d="scan'208";a="100151214"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Oct 2020 17:33:57 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 09E6448990FB
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 17:33:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Oct 2020 17:33:55 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libmbim: upgrade 1.24.2 -> 1.24.4
Date: Wed, 14 Oct 2020 17:33:54 +0800
Message-ID: <1602668034-125046-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 09E6448990FB.A1DFD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libmbim/{libmbim_1.24.2.bb => libmbim_1.24.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.24.2.bb => libmbim_1.24.4.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.2.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.4.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.24.2.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.24.4.bb
index c7a04b6642..148b3ca8da 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.2.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.4.bb
@@ -13,5 +13,5 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6c2b490af87773c8446f37536e7411ac"
-SRC_URI[sha256sum] = "32198c099987849c5f442d1cbf4b6e43e645cbdbe9cfdc197b19ddd63c6981e4"
+SRC_URI[md5sum] = "4b4b12ab7153d7c999289b5dfc2d25db"
+SRC_URI[sha256sum] = "dd488ee6176243a6adb27a5872897336272ea7bea33a3ad501ba268e5a58b285"
-- 
2.25.1



