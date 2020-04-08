Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4080.1586311007066711298
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88653148"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:56:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 6415749DF145
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2020 09:46:23 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:56:46 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:56:52 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-networking][PATCH] mdns: upgrade 878.260.1 -> 878.270.2
Date: Wed, 8 Apr 2020 02:04:04 -0700
Message-ID: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6415749DF145.A0882
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../mdns/{mdns_878.260.1.bb => mdns_878.270.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_878.260.1.bb => mdns_878.270.2.bb} (96%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb b/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
similarity index 96%
rename from meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb
rename to meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
index a5991bf73..0f8dc92df 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_878.260.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_878.270.2.bb
@@ -23,8 +23,8 @@ SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${P
            file://0010-Handle-errors-from-socket-calls.patch;patchdir=.. \
            file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch;patchdir=.. \
            "
-SRC_URI[md5sum] = "aeb92d838a4aa2402ef128ed501484eb"
-SRC_URI[sha256sum] = "3cc71582e8eee469c2de8ecae1d769e7f32b3468dfb7f2ca77f1dee1f30a7d1e"
+SRC_URI[md5sum] = "4e139a8e1133349006b0436291c9e29b"
+SRC_URI[sha256sum] = "2cef0ee9900504c5277fb81de0a28e6c0835fe482ebecf1067c6864f5c4eda74"
 
 PARALLEL_MAKE = ""
 
-- 
2.17.1



