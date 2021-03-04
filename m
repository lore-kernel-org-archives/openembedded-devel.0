Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.4080.1614848234303967487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 00:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; 
   d="scan'208";a="105153845"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 16:57:12 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 635FD4CE9E6B
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Mar 2021 16:57:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 16:56:57 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] qpdf: upgrade 10.0.4 -> 10.2.0
Date: Thu, 4 Mar 2021 16:56:53 +0800
Message-ID: <1614848213-105636-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 635FD4CE9E6B.A86F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_10.0.4.bb => qpdf_10.2.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_10.0.4.bb => qpdf_10.2.0.bb} (86%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.4.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.2.0.bb
similarity index 86%
rename from meta-oe/recipes-printing/qpdf/qpdf_10.0.4.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_10.2.0.bb
index ce11bc070c..4f21575c3e 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.4.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.2.0.bb
@@ -7,8 +7,8 @@ DEPENDS = "libpcre zlib libjpeg-turbo"
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
-SRC_URI[md5sum] = "b4c6a66c45bb946944c2fe14ef02d0e0"
-SRC_URI[sha256sum] = "b191dc4af4ea4630cdc404a4ee95a0f21c12f56ecc4ae045f04425464d7c696e"
+SRC_URI[md5sum] = "c8f4430823603ee3b430b3250015ede5"
+SRC_URI[sha256sum] = "43ef260f4e70672660e1882856d59b9319301c6f170673ab465430a71cffe44c"
 
 inherit autotools-brokensep gettext
 
-- 
2.25.1



