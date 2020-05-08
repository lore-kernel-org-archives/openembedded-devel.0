Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.562.1588961309417324142
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 11:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 048I7mpl004140
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 May 2020 11:08:19 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 8 May 2020
 11:08:08 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-python][PATCH 2/2] python3-pyhamcrest: add rdep
Date: Fri, 8 May 2020 11:07:41 -0700
Message-ID: <20200508180741.27873-2-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200508180741.27873-1-joe.slater@windriver.com>
References: <20200508180741.27873-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

python3-six.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
index 04aa9b4..ee96a07 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
 SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-six"
-- 
2.7.4

