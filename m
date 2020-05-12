Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2785.1589278053392813725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 03:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,383,1583164800"; 
   d="scan'208";a="91948290"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 May 2020 18:07:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0D7A44BCC883
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 18:07:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 18:07:25 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] v4l-utils: upgrade 1.18.0 -> 1.18.1
Date: Wed, 13 May 2020 03:07:44 +0800
Message-ID: <1589310464-100739-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0D7A44BCC883.A7B3D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../v4l2apps/{v4l-utils_1.18.0.bb => v4l-utils_1.18.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.18.0.bb => v4l-utils_1.18.1.bb} (93%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
similarity index 93%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
index 9cc2a8e5b4..193335deaa 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
@@ -24,8 +24,8 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
            file://0007-Do-not-use-getsubopt.patch \
            "
-SRC_URI[md5sum] = "18996bd5e9d83d47055c05de376708cd"
-SRC_URI[sha256sum] = "6cb60d822eeed20486a03cc23e0fc65956fbc1e85e0c1a7477f68bbd9802880d"
+SRC_URI[md5sum] = "ff2dd75970683be9a301ed949b3372b3"
+SRC_URI[sha256sum] = "25fc42253722401f8742f04dc50a444dfa9b75378e7d09b55035bcbb44c5f342"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
-- 
2.17.1



