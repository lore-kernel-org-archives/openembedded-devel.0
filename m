Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.9485.1620719294971078214
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 00:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14B7mD9B030580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 00:48:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 11 May 2021 00:48:13 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 11 May 2021 00:48:12 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] nmap: change shebang to python3
Date: Tue, 11 May 2021 15:47:24 +0800
Message-ID: <20210511074724.2790-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

upstream nmap is python2 compatiable now, but this recipe
support python3.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-security/nmap/nmap_7.80.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index c76d2324e..ad5e7248e 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -53,6 +53,9 @@ do_install_append() {
     if [ -f "${D}${bindir}/ndiff" ]; then
        sed -i 's@^#!.*$@#!/usr/bin/env python3@g'   ${D}${bindir}/ndiff
     fi
+    if [ -f "${D}${bindir}/uninstall_ndiff" ]; then
+       sed -i 's@^#!.*$@#!/usr/bin/env python3@g'   ${D}${bindir}/uninstall_ndiff
+    fi
 }
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
-- 
2.17.1

