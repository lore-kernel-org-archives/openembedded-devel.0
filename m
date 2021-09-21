Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.2917.1632254902536993936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 13:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18LK8Lts008271
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 13:08:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 21 Sep 2021 13:08:20 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 21 Sep 2021 13:08:20 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][hardknott][PATCH] gd: upgrade 2.3.2 -> 2.3.3
Date: Tue, 21 Sep 2021 16:08:20 -0400
Message-ID: <20210921200820.8490-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...-of-bands-in-reading-tga-header-file.patch | 33 -------------------
 .../gd/{gd_2.3.2.bb => gd_2.3.3.bb}           |  7 ++--
 2 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
 rename meta-oe/recipes-support/gd/{gd_2.3.2.bb => gd_2.3.3.bb} (84%)

diff --git a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
deleted file mode 100644
index 649b9b744..000000000
--- a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
-From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
-Date: Mon, 19 Jul 2021 10:07:13 +0430
-Subject: [PATCH] fix read out-of-bands in reading tga header file
-
-CVE: CVE-2021-38115
-Upstream-Status: Backport [8b111b2b4a4842179be66db68d84dda91a246032]
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- src/gd_tga.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/gd_tga.c b/src/gd_tga.c
-index cae9428..286febb 100644
---- a/src/gd_tga.c
-+++ b/src/gd_tga.c
-@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
- 			return -1;
- 		}
- 
--		gdGetBuf(tga->ident, tga->identsize, ctx);
-+		
-+		if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
-+			gd_error("fail to read header ident");
-+			return -1;
-+		}
- 	}
- 
- 	return 1;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/gd/gd_2.3.2.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
similarity index 84%
rename from meta-oe/recipes-support/gd/gd_2.3.2.bb
rename to meta-oe/recipes-support/gd/gd_2.3.3.bb
index 557b45dc4..e129dc5a9 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.2.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -9,15 +9,14 @@ HOMEPAGE = "http://libgd.github.io/"
 
 SECTION = "libs"
 LICENSE = "GD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8e5bc8627b9494741c905d65238c66b7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ace63adfdac78400fc30fa22ee9c1bb1"
 
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
-SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
-           file://0001-fix-read-out-of-bands-in-reading-tga-header-file.patch \
+SRC_URI = "git://github.com/libgd/libgd.git;nobranch=1\
           "
 
-SRCREV = "2e40f55bfb460fc9d8cbcd290a0c9eb908d5af7e"
+SRCREV = "b5319a41286107b53daa0e08e402aa1819764bdc"
 
 S = "${WORKDIR}/git"
 
-- 
2.33.0

