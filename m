Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.4275.1606789090560210628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="101914110"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Dec 2020 10:18:09 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 65A0E4CE6000
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Dec 2020 10:18:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Dec 2020 10:18:04 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] qpdf: upgrade 10.0.1 -> 10.0.4
Date: Tue, 1 Dec 2020 10:17:57 +0800
Message-ID: <1606789077-56715-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 65A0E4CE6000.A76EE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_10.0.1.bb => qpdf_10.0.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_10.0.1.bb => qpdf_10.0.4.bb} (86%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.4.bb
similarity index 86%
rename from meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_10.0.4.bb
index 5965b8d09..ce11bc070 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.4.bb
@@ -7,8 +7,8 @@ DEPENDS = "libpcre zlib libjpeg-turbo"
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
-SRC_URI[md5sum] = "eb7fb7c6cd5d3036bf4f7a5e3f44d995"
-SRC_URI[sha256sum] = "5d2277c738188b7f4e3f01a6db7f2937ed6df54671f1fba834cd3d7ff865827b"
+SRC_URI[md5sum] = "b4c6a66c45bb946944c2fe14ef02d0e0"
+SRC_URI[sha256sum] = "b191dc4af4ea4630cdc404a4ee95a0f21c12f56ecc4ae045f04425464d7c696e"
 
 inherit autotools-brokensep gettext
 
-- 
2.25.1



