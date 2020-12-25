Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.5623.1608860091801315074
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 17:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,446,1599494400"; 
   d="scan'208";a="102919637"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Dec 2020 09:34:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 02B714CE6019
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 09:34:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Dec 2020 09:34:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] python3-ldap: upgrade 3.2.0 -> 3.3.1
Date: Fri, 25 Dec 2020 09:34:46 +0800
Message-ID: <1608860086-71195-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 02B714CE6019.A0E93
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python3-ldap_3.2.0.bb => python3-ldap_3.3.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-devtools/python/{python3-ldap_3.2.0.bb => python3-ldap_3.3.1.bb} (86%)

diff --git a/meta-networking/recipes-devtools/python/python3-ldap_3.2.0.bb b/meta-networking/recipes-devtools/python/python3-ldap_3.3.1.bb
similarity index 86%
rename from meta-networking/recipes-devtools/python/python3-ldap_3.2.0.bb
rename to meta-networking/recipes-devtools/python/python3-ldap_3.3.1.bb
index f46ddbf44..4a2ab3efb 100644
--- a/meta-networking/recipes-devtools/python/python3-ldap_3.2.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-ldap_3.3.1.bb
@@ -15,8 +15,8 @@ PYPI_PACKAGE = "python-ldap"
 inherit pypi setuptools3
 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
-SRC_URI[md5sum] = "fe22522208dc9b06d16eb70f8553eaab"
-SRC_URI[sha256sum] = "7d1c4b15375a533564aad3d3deade789221e450052b21ebb9720fb822eccdb8e"
+SRC_URI[md5sum] = "7608579722c491e42f5f63b3f88a95fb"
+SRC_URI[sha256sum] = "4711cacf013e298754abd70058ccc995758177fb425f1c2d30e71adfc1d00aa5"
 
 do_configure_prepend() {
     sed -i -e 's:^library_dirs =.*::' ${S}/setup.cfg
-- 
2.25.1



