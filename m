Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web08.6543.1611305268178789987
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 00:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,366,1602518400"; 
   d="scan'208";a="103733185"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 16:47:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E10EF4CE602D
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 16:47:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 16:47:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] python3-networkmanager: upgrade 2.1 -> 2.2
Date: Sat, 23 Jan 2021 04:47:44 +0800
Message-ID: <1611348464-4528-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E10EF4CE602D.A2A80
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-networkmanager_2.1.bb => python3-networkmanager_2.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/python-networkmanager/{python3-networkmanager_2.1.bb => python3-networkmanager_2.2.bb} (55%)

diff --git a/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.1.bb b/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.2.bb
similarity index 55%
rename from meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.1.bb
rename to meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.2.bb
index 91a6edd241..d447231fc5 100644
--- a/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.1.bb
+++ b/meta-networking/recipes-connectivity/python-networkmanager/python3-networkmanager_2.2.bb
@@ -2,10 +2,10 @@ SUMMARY = "Easy communication with NetworkManager from Python"
 HOMEPAGE = "https://github.com/seveas/python-networkmanager"
 LICENSE = "Zlib"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=8d8bac174bf8422b151200e6cc78ebe4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9f8a5b5844f027357ab19ef3e3c6a956"
 
-SRC_URI[md5sum] = "f638d854a3639fb37c0e06d1092a771e"
-SRC_URI[sha256sum] = "aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc"
+SRC_URI[md5sum] = "7e05d3ca40a4fa50222ba93cda3d0d02"
+SRC_URI[sha256sum] = "de6eb921d94aba7549f428ed2b3aa482a5d543ecb6965cbaa0fbb555ab31b9d5"
 
 PYPI_PACKAGE = "python-networkmanager"
 inherit pypi setuptools3
-- 
2.25.1



