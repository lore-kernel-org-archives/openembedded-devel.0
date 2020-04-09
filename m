Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.15599.1586456716350878454
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 11:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 039IPF5o018214
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2020 11:25:15 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 9 Apr 2020
 11:24:56 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-gnome][PATCH 1/1] libnma: allow building nor mipsn32
Date: Thu, 9 Apr 2020 11:24:56 -0700
Message-ID: <20200409182456.18002-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

go introspection is not support for mipsn32, so we must not try to build
vapi support.  Using sed allows us to change the meson option, if it is
present, to be set correctly, and is more flexible than a patch would be.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
index 267baff..f0f0064 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
@@ -19,3 +19,10 @@ PACKAGECONFIG[iso_codes] = "-Diso_codes=true,-Diso_codes=false,iso-codes,iso-cod
 PACKAGECONFIG[mobile_broadband_provider_info] = "-Dmobile_broadband_provider_info=true,-Dmobile_broadband_provider_info=false,mobile-broadband-provider-info,mobile-broadband-provider-info"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
+
+# go object introspection is not supported for mipsn32, so we must disable trying
+# to build vapi.
+#
+do_configure_prepend_mipsarchn32 () {
+    sed -i "/^option('vapi/ s!true!false!" ${S}/meson_options.txt
+}
-- 
2.7.4

