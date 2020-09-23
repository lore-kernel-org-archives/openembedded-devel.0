Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.7574.1600845157885083565
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 00:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08N7CZR1002708
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 00:12:36 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Wed, 23 Sep 2020
 00:12:16 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>, <trevor.gamblin@windriver.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-dateutil/python3-pykwalify: add nativesdk support
Date: Wed, 23 Sep 2020 15:12:14 +0800
Message-ID: <20200923071214.39852-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Call pykwalify module in SDK

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
index fb7db162c..5326924e6 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
@@ -22,4 +22,4 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-stringold \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
index 5d029bd76..4440723d3 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -16,4 +16,4 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-pyyaml \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

