Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5428.1585792269990544945
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363972"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:51:09 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 5866E50A9999
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 09:40:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:51:08 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl][PATCH] libencode-perl: upgrade 3.02 -> 3.05
Date: Thu, 2 Apr 2020 18:51:05 +0800
Message-ID: <1585824665-15963-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 5866E50A9999.A70E6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{libencode-perl_3.02.bb => libencode-perl_3.05.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.02.bb => libencode-perl_3.05.bb} (95%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.02.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.05.bb
similarity index 95%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.02.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.05.bb
index b32bc023e..62430e91f 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.02.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.05.bb
@@ -15,8 +15,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "4eb07ba6db02d5b982316e1dd05f68bd"
-SRC_URI[sha256sum] = "5865be4951870f62f43722818d076d7724306c75c8f268346b282351cbc820a8"
+SRC_URI[md5sum] = "137aef00bfc3d5cb97096ad985d3153a"
+SRC_URI[sha256sum] = "e0f51e03cd787a3e26026503e806afdc03f3823ae3551c711a9b04ad901a8794"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.17.1



