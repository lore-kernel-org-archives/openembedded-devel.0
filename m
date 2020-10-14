Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2799.1602644063408730563
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 19:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,373,1596470400"; 
   d="scan'208";a="100137596"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Oct 2020 10:54:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 19F7449B1116
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 10:54:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Oct 2020 10:54:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] firewalld: upgrade 0.9.0 -> 0.9.1
Date: Wed, 14 Oct 2020 10:54:08 +0800
Message-ID: <1602644048-119604-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 19F7449B1116.AD71B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../firewalld/{firewalld_0.9.0.bb => firewalld_0.9.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.9.0.bb => firewalld_0.9.1.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.1.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.9.1.bb
index a76877652c..eca926ee42 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.0.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://firewalld.init \
 "
-SRC_URI[sha256sum] = "7cfbf8a33f726151e60c07486af0921fa05cbbab097adf90ec1caef37b49d9a0"
+SRC_URI[sha256sum] = "7e3db6ed84919dd10add39cc7a28d97b5a9e27a53aeb73abf8af01ef082b74f9"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native"
-- 
2.25.1



