Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.2827.1587723096376959370
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 03:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,311,1583164800"; 
   d="scan'208";a="90117600"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Apr 2020 18:11:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C40E64BCC8B0
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 18:00:54 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Apr 2020 18:11:33 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 24 Apr 2020 18:11:33 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.2.29 -> 1.2.30
Date: Fri, 24 Apr 2020 11:11:10 -0700
Message-ID: <20200424181111.21063-3-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424181111.21063-1-wangmy@cn.fujitsu.com>
References: <20200424181111.21063-1-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C40E64BCC8B0.A45C4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xmlsec1/{xmlsec1_1.2.29.bb => xmlsec1_1.2.30.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.29.bb => xmlsec1_1.2.30.bb} (93%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
similarity index 93%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
index 8fc611a27..20c7b2d37 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.29.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
@@ -21,8 +21,8 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://run-ptest \
     "
 
-SRC_URI[md5sum] = "4755621ff2a7150e208de6bd7decca10"
-SRC_URI[sha256sum] = "b1d1deba966019930f608d1f2b95c40ca3450f1393bcd3a3c001a8ba1d2839ab"
+SRC_URI[md5sum] = "b66ec21e0a0ac331afb4b1bc5c9ef966"
+SRC_URI[sha256sum] = "2d84360b03042178def1d9ff538acacaed2b3a27411db7b2874f1612ed71abc8"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.17.1



