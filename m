Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4843.1603432770277313629
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 22:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100435464"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 13:59:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7DA8B48990D3
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2020 13:59:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 13:59:27 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libmtp: upgrade 1.1.17 -> 1.1.18
Date: Fri, 23 Oct 2020 13:59:25 +0800
Message-ID: <1603432765-100298-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7DA8B48990D3.A1EC3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libmtp/{libmtp_1.1.17.bb => libmtp_1.1.18.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmtp/{libmtp_1.1.17.bb => libmtp_1.1.18.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.17.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.18.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libmtp/libmtp_1.1.17.bb
rename to meta-oe/recipes-connectivity/libmtp/libmtp_1.1.18.bb
index 54decbccfd..423bfd6890 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.17.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.18.bb
@@ -21,8 +21,8 @@ DEPENDS_append_class-target = " ${BPN}-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 SRC_URI_append_class-target = " file://0001-Use-native-mtp-hotplug.patch"
 
-SRC_URI[md5sum] = "81aea5d3139e5189c2e055ed2c98cd91"
-SRC_URI[sha256sum] = "f8a34cf52d9f9b9cb8c7f26b12da347d4af7eb904c13189602e4c6b62d1a79dc"
+SRC_URI[md5sum] = "7915496daa3f4ea3e095f0161f83d4d4"
+SRC_URI[sha256sum] = "7280fe50c044c818a06667f45eabca884deab3193caa8682e0b581e847a281f0"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.25.1



