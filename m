Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.9888.1620721145378309951
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 01:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14B8J3en031360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 01:19:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 11 May 2021 01:19:03 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 11 May 2021 01:19:02 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V2] nmap: change shebang to python3
Date: Tue, 11 May 2021 16:18:14 +0800
Message-ID: <20210511081814.30395-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

upstream nmap is python2 compatiable now, but this recipe
supports python3.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-security/nmap/nmap_7.80.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index c76d2324e..17bc40911 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -50,9 +50,11 @@ do_configure() {
 }
 
 do_install_append() {
-    if [ -f "${D}${bindir}/ndiff" ]; then
-       sed -i 's@^#!.*$@#!/usr/bin/env python3@g'   ${D}${bindir}/ndiff
-    fi
+    for f in ndiff uninstall_ndiff; do
+        if [ -f ${D}${bindir}/$f ]; then
+            sed -i 's@^#!.*$@#!/usr/bin/env python3@g' ${D}${bindir}/$f
+        fi
+    done
 }
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
-- 
2.17.1

