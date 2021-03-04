Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web09.3931.1614846537852349158
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 00:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; 
   d="scan'208";a="105152005"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 16:29:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1FAA44CE9E6F
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Mar 2021 16:29:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 16:29:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.1 -> 5.9.2
Date: Thu, 4 Mar 2021 16:28:59 +0800
Message-ID: <1614846539-104620-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1FAA44CE9E6F.A500E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../strongswan/{strongswan_5.9.1.bb => strongswan_5.9.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.1.bb => strongswan_5.9.2.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.1.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb
index 095a93df35..dd50fba3dd 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.2.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "1f4db969d072e120dc12d1c116a0f658"
-SRC_URI[sha256sum] = "a337c9fb63d973b8440827755c784031648bf423b7114a04918b0b00fd42cafb"
+SRC_URI[md5sum] = "8918e6675e1be3784817641f07eadeb8"
+SRC_URI[sha256sum] = "61c72f741edb2c1295a7b7ccce0317a104b3f9d39efd04c52cd05b01b55ab063"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1



