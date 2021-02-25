Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.5632.1614217607392578324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 17:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 11P1ketq019292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Feb 2021 17:46:41 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 17:46:27 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 24 Feb 2021 17:46:27 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] libgit2: remove the recipe since it moved to oe-core
Date: Wed, 24 Feb 2021 20:46:25 -0500
Message-ID: <20210225014625.397669-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225014625.397669-1-Randy.MacLeod@windriver.com>
References: <20210225014625.397669-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-support/libgit2/libgit2_1.1.0.bb  | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgit2/libgit2_1.1.0.bb

diff --git a/meta-oe/recipes-support/libgit2/libgit2_1.1.0.bb b/meta-oe/recipes-support/libgit2/libgit2_1.1.0.bb
deleted file mode 100644
index 2bbf59ea7..000000000
--- a/meta-oe/recipes-support/libgit2/libgit2_1.1.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "the Git linkable library"
-HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
-
-DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
-
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1"
-SRCREV = "7f4fa178629d559c037a1f72f79f79af9c1ef8ce"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-EXTRA_OECMAKE = "\
-    -DBUILD_CLAR=OFF \
-    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
-    -DLIB_INSTALL_DIR=${libdir} \
-    -DREGEX_BACKEND='pcre2' \
-"
-
-BBCLASSEXTEND = "native"
-- 
2.27.0

