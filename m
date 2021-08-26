Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.32122.1629990449882486244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 08:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17QF7SwA013782
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 08:07:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17QF7Rdo019472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 08:07:27 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 26 Aug 2021 08:07:27 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 26 Aug 2021 08:07:26 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][hardknott][PATCH] gd: fix CVE-2021-38115
Date: Thu, 26 Aug 2021 11:07:26 -0400
Message-ID: <20210826150726.33182-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...-of-bands-in-reading-tga-header-file.patch | 33 +++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.3.2.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch

diff --git a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
new file mode 100644
index 000000000..649b9b744
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
@@ -0,0 +1,33 @@
+From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
+From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
+Date: Mon, 19 Jul 2021 10:07:13 +0430
+Subject: [PATCH] fix read out-of-bands in reading tga header file
+
+CVE: CVE-2021-38115
+Upstream-Status: Backport [8b111b2b4a4842179be66db68d84dda91a246032]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/gd_tga.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/gd_tga.c b/src/gd_tga.c
+index cae9428..286febb 100644
+--- a/src/gd_tga.c
++++ b/src/gd_tga.c
+@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
+ 			return -1;
+ 		}
+ 
+-		gdGetBuf(tga->ident, tga->identsize, ctx);
++		
++		if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
++			gd_error("fail to read header ident");
++			return -1;
++		}
+ 	}
+ 
+ 	return 1;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/gd/gd_2.3.2.bb b/meta-oe/recipes-support/gd/gd_2.3.2.bb
index 37896415e..557b45dc4 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.2.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.2.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8e5bc8627b9494741c905d65238c66b7"
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
+           file://0001-fix-read-out-of-bands-in-reading-tga-header-file.patch \
           "
 
 SRCREV = "2e40f55bfb460fc9d8cbcd290a0c9eb908d5af7e"
-- 
2.32.0

