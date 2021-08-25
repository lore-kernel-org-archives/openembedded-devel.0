Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.22991.1629932454264501315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 16:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17PN0qbp032418
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 16:00:53 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17PN0pao026039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 16:00:52 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 25 Aug 2021 16:00:51 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 25 Aug 2021 16:00:51 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gd: fix CVE-2021-38115
Date: Wed, 25 Aug 2021 19:00:51 -0400
Message-ID: <20210825230051.3773-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...-of-bands-in-reading-tga-header-file.patch | 29 +++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.3.2.bb        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch

diff --git a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
new file mode 100644
index 000000000..6152a1184
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
@@ -0,0 +1,29 @@
+From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
+From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
+Date: Mon, 19 Jul 2021 10:07:13 +0430
+Subject: [PATCH] fix read out-of-bands in reading tga header file
+
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
index c9ed029f9..32484ce79 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.2.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.2.bb
@@ -15,6 +15,7 @@ DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
            file://0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch \
+           file://0001-fix-read-out-of-bands-in-reading-tga-header-file.patch \
            "
 
 SRCREV = "2e40f55bfb460fc9d8cbcd290a0c9eb908d5af7e"
-- 
2.32.0

