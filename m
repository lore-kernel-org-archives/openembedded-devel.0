Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5786.1610434234247797295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 22:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; 
   d="scan'208";a="103391361"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 14:50:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7876A4CE6031
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 14:50:31 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 14:50:30 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] mdns: upgrade 1096.40.7 -> 1310.40.42
Date: Tue, 12 Jan 2021 14:50:33 +0800
Message-ID: <1610434233-106275-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7876A4CE6031.A2CD8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
0001-mdns-include-stddef.h-for-NULL.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../mdns/files/0001-mdns-include-stddef.h-for-NULL.patch      | 2 +-
 .../mdns/{mdns_1096.40.7.bb => mdns_1310.40.42.bb}            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_1096.40.7.bb => mdns_1310.40.42.bb} (96%)

diff --git a/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch b/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
index 3e9be7d6a5..c57ce8fa53 100644
--- a/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
+++ b/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
@@ -34,7 +34,7 @@ index 2fbea04..d4b9af5 100755
 +#include <stddef.h> /* for NULL */
  #include "DNSCommon.h"                  // Defines general DNS utility routines
  #include "uDNS.h"                       // Defines entry points into unicast-specific routines
- #include "nsec.h"
+
 -- 
 2.20.1
 
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
similarity index 96%
rename from meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
rename to meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
index 086b408692..445ed87e4c 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
@@ -22,8 +22,8 @@ SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${P
            file://0010-Handle-errors-from-socket-calls.patch;patchdir=.. \
            file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch;patchdir=.. \
            "
-SRC_URI[md5sum] = "ac766013bbcb323e9db4c80805b2552a"
-SRC_URI[sha256sum] = "b86f4816b4145915198e7c5bf0bc56dbbfd960e9a4518bb6486baa40cdcca7e6"
+SRC_URI[md5sum] = "dfcfd4d7f29a56ec99e7df1d21db5e7b"
+SRC_URI[sha256sum] = "bea29e1616cd56ccb8f88c0fad2bcdc4031f4deb2d899c793e2f27a8384f0b34"
 
 CVE_PRODUCT = "apple:mdnsresponder"
 
-- 
2.25.1



