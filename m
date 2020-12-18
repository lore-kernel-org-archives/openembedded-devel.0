Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.6935.1608279032965848018
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 00:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102708900"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 16:10:30 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C1C04CE600B
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 16:10:30 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 16:10:30 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.07 -> 3.08
Date: Fri, 18 Dec 2020 16:10:12 +0800
Message-ID: <1608279012-111895-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7C1C04CE600B.A67D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{libencode-perl_3.07.bb => libencode-perl_3.08.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.07.bb => libencode-perl_3.08.bb} (95%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.07.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.08.bb
similarity index 95%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.07.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.08.bb
index 4b0c1d873..3f1d35be8 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.07.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.08.bb
@@ -15,8 +15,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "a63fa96cbe236b2f7bb5a5e9fd740837"
-SRC_URI[sha256sum] = "34a4ec9b574b7a6c6132c4ab3ded490fd600bc7ce382124aeda58bb1e112910f"
+SRC_URI[md5sum] = "3889cf6d1b75e486d54f9fd6517a02b4"
+SRC_URI[sha256sum] = "ed063d01d01a140a3a3ec0aeba2f2b4849a35c18ca96ac231a5d7c7d54d17b5b"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1



