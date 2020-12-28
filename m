Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.40888.1609121890332865738
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,453,1599494400"; 
   d="scan'208";a="102972954"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Dec 2020 10:18:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 96BB04CE600B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Dec 2020 10:18:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Dec 2020 10:18:08 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ace: upgrade 6.5.10 -> 6.5.12
Date: Mon, 28 Dec 2020 10:18:06 +0800
Message-ID: <1609121886-5684-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 96BB04CE600B.A32C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/ace/{ace_6.5.10.bb => ace_6.5.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ace/{ace_6.5.10.bb => ace_6.5.12.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.10.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.12.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/ace/ace_6.5.10.bb
rename to meta-oe/recipes-connectivity/ace/ace_6.5.12.bb
index 80ae363dc..086fc9d06 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.10.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.12.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d2c090e9c730fd91677782d8e2091d77"
 
 DEPENDS += "openssl gperf-native"
 
-SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_10/ACE-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_12/ACE-${PV}.tar.bz2 \
            file://ace_config.patch \
            file://no_sysctl.patch \
           "
 
-SRC_URI[sha256sum] = "90de437926928e98e9fd9132c7c3e886ca79f25567adeccbc24a5996f230d8e2"
+SRC_URI[sha256sum] = "ccd94fa45df1e8bb1c901d02c0a64c1626497e5eeda2f057fcf0a1578dae2148"
 
 COMPATIBLE_HOST_libc-musl = "null"
 
-- 
2.25.1



