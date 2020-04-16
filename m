Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.9750.1587053640245536920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 09:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03GGDxcC003378
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 09:13:59 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 16 Apr 2020
 09:13:40 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-gnome][PATCH 1/1] libnma: allow building for mipsn32
Date: Thu, 16 Apr 2020 09:13:40 -0700
Message-ID: <20200416161340.24384-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

go object introspection is not support for mipsn32, so
disable vapi for that architecture.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
index 267baff..8cb0bbc 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
@@ -18,4 +18,8 @@ PACKAGECONFIG[gcr] = "-Dgcr=true,-Dgcr=false,gcr"
 PACKAGECONFIG[iso_codes] = "-Diso_codes=true,-Diso_codes=false,iso-codes,iso-codes"
 PACKAGECONFIG[mobile_broadband_provider_info] = "-Dmobile_broadband_provider_info=true,-Dmobile_broadband_provider_info=false,mobile-broadband-provider-info,mobile-broadband-provider-info"
 
+# go introspection is not supported for mipsn32, but vapi needs it
+#
+EXTRA_OEMESON_mipsarchn32_append = " -Dvapi=false"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.7.4

