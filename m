Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3513.1591695130914069582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 02:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,491,1583164800"; 
   d="scan'208";a="94160361"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Jun 2020 17:32:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B76AC50A9975
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 17:32:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Jun 2020 17:32:01 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] nghttp2: upgrade 1.40.0 -> 1.41.0
Date: Wed, 10 Jun 2020 02:32:00 +0800
Message-ID: <1591727520-3358-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B76AC50A9975.A76D1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../nghttp2/{nghttp2_1.40.0.bb => nghttp2_1.41.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.40.0.bb => nghttp2_1.41.0.bb} (90%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.41.0.bb
similarity index 90%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.41.0.bb
index 9ed8c5642..29ab0b75a 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.41.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[md5sum] = "8d1a6b96760254e4dd142d7176e8fb7c"
-SRC_URI[sha256sum] = "09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed3bc4cdcee69073"
+SRC_URI[md5sum] = "549db3507a7637b28ca467c7f3e9e023"
+SRC_URI[sha256sum] = "abc25b8dc601f5b3fefe084ce50fcbdc63e3385621bee0cbfa7b57f9ec3e67c2"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
-- 
2.17.1



