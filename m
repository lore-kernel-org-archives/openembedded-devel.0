Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.4197.1606789136596495796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="101914219"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Dec 2020 10:18:53 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7E5394CE600C
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Dec 2020 10:18:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Dec 2020 10:18:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libconfig-autoconf-perl: upgrade 0.318 -> 0.319
Date: Tue, 1 Dec 2020 10:18:45 +0800
Message-ID: <1606789125-56872-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7E5394CE600C.A7D01
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...utoconf-perl_0.318.bb => libconfig-autoconf-perl_0.319.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libconfig/{libconfig-autoconf-perl_0.318.bb => libconfig-autoconf-perl_0.319.bb} (91%)

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
similarity index 91%
rename from meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
rename to meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index afd26fa1c..25e01fac0 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -16,8 +16,8 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0bea721ad3996e20324b84b3b924ec71"
-SRC_URI[sha256sum] = "33c930feec3003de251ca222abe8bbeb74610ad07f65fc16f27d74d195eeab34"
+SRC_URI[md5sum] = "eeeab8cc93eef7dd2e2c343ecdf247b7"
+SRC_URI[sha256sum] = "304f66cc2653264c0fe127d21669e86d3d18cd72f2574d8f5131beec31a0a33e"
 RDEPENDS_${PN} += "libcapture-tiny-perl"
 RDEPENDS_${PN} += "perl-module-base"
 RDEPENDS_${PN} += "perl-module-carp"
-- 
2.25.1



