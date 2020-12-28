Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.43229.1609139236514762030
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 23:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,454,1599494400"; 
   d="scan'208";a="102981467"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Dec 2020 15:07:09 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9BEAC4CE4BCB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Dec 2020 15:07:03 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Dec 2020 15:07:03 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gperftools: upgrade 2.8 -> 2.8.1
Date: Mon, 28 Dec 2020 15:07:01 +0800
Message-ID: <1609139221-91094-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9BEAC4CE4BCB.A97BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../gperftools/{gperftools_2.8.bb => gperftools_2.8.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gperftools/{gperftools_2.8.bb => gperftools_2.8.1.bb} (97%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.8.bb b/meta-oe/recipes-support/gperftools/gperftools_2.8.1.bb
similarity index 97%
rename from meta-oe/recipes-support/gperftools/gperftools_2.8.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.8.1.bb
index d9b310bce..2a386086f 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.8.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.8.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gperftools/gperftools"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
-SRCREV = "180bfa10d7cb38e8b3784d60943d50e8fcef0dcb"
+SRCREV = "d8eb315fb18f6fb0d6efa923401f166343727bc6"
 SRC_URI = "git://github.com/gperftools/gperftools \
            file://0001-Support-Atomic-ops-on-clang.patch \
            file://0001-fix-build-with-musl-libc.patch \
-- 
2.25.1



