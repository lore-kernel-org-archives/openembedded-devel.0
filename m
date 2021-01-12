Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web08.5939.1610434184444472528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 22:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; 
   d="scan'208";a="103391315"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 14:49:31 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 056184CE602C
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 14:49:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 14:49:28 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] firewalld: upgrade 0.9.1 -> 0.9.2
Date: Tue, 12 Jan 2021 14:49:29 +0800
Message-ID: <1610434169-106180-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 056184CE602C.A3D98
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../firewalld/{firewalld_0.9.1.bb => firewalld_0.9.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.9.1.bb => firewalld_0.9.2.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.1.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.2.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.9.1.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.9.2.bb
index eca926ee42..792c7ad617 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.1.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://firewalld.init \
 "
-SRC_URI[sha256sum] = "7e3db6ed84919dd10add39cc7a28d97b5a9e27a53aeb73abf8af01ef082b74f9"
+SRC_URI[sha256sum] = "f982c72d640b0677d510b73d9b05d377b4615c5ef36a3710c62350b39fb62efe"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native"
-- 
2.25.1



