Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.38734.1599227976845643679
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 084DxW4l022032
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 4 Sep 2020 06:59:33 -0700 (PDT)
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Sep 2020 06:59:25 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>
Subject: [meta-python][PATCH] packagegroup-meta-python: fix PACKAGES and default ptest recipe name
Date: Fri, 4 Sep 2020 09:59:24 -0400
Message-ID: <20200904135924.800776-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <tvgamblin@gmail.com>

Remove packagegroup-meta-python3-ptest from PACKAGES in packagegroup-meta-python.bb
to fix QA issue, and change python3-cryptography to python3-cryptography-ptest in
RDEPENDS_packagegroup-meta-python3-ptest to be consistent with how other ptest images
list RDEPENDS.

Signed-off-by: Trevor Gamblin <tvgamblin@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0aea30e33..61623ac98 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -5,7 +5,6 @@ inherit packagegroup
 PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-python3 \
-    packagegroup-meta-python3-ptest \
 '
 
 RDEPENDS_packagegroup-meta-python3 = "\
@@ -454,7 +453,7 @@ RDEPENDS_packagegroup-meta-python3-connectivity = "\
 "
 
 RDEPENDS_packagegroup-meta-python3-ptest = "\
-    python3-cryptography \
+    python3-cryptography-ptest \
     "
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.26.2

