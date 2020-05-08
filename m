Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.541.1588961300040552421
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 11:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 048I7mph004140
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 May 2020 11:08:08 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 8 May 2020
 11:07:41 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-python][PATCH 1/2] python-pretty-table: add rdep's
Date: Fri, 8 May 2020 11:07:40 -0700
Message-ID: <20200508180741.27873-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

python(3)-math and python(3)-html.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-python/recipes-devtools/python/python-prettytable.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-prettytable.inc b/meta-python/recipes-devtools/python/python-prettytable.inc
index 09384da..c77a491 100644
--- a/meta-python/recipes-devtools/python/python-prettytable.inc
+++ b/meta-python/recipes-devtools/python/python-prettytable.inc
@@ -29,6 +29,11 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-math \
+	${PYTHON_PN}-html \
+"
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.7.4

