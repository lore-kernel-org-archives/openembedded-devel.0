Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web12.2731.1594802156820798645
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 01:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 06F8ZsCt032362
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2020 10:35:54 +0200
Received: from dev.vm6.ccp.siemens.com (sk1d279c.siemens.sk [163.242.52.133])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 06F8Zr99022530;
	Wed, 15 Jul 2020 10:35:53 +0200
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id F026691AD29;
	Wed, 15 Jul 2020 10:35:52 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [oe][meta-python][PATCH] python3-xlsxwriter: add recipe for v1.2.9
Date: Wed, 15 Jul 2020 10:35:45 +0200
Message-Id: <20200715083545.11177-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

Recipe for https://xlsxwriter.readthedocs.io python3 module

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta-python/recipes-devtools/python/python-xlsxwriter.inc   | 13 +++++++++++++
 .../recipes-devtools/python/python3-xlsxwriter_1.2.9.bb     |  5 +++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-xlsxwriter.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb

diff --git a/meta-python/recipes-devtools/python/python-xlsxwriter.inc b/meta-python/recipes-devtools/python/python-xlsxwriter.inc
new file mode 100644
index 000000000..17daf9ee7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xlsxwriter.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Python 2 and 3 compatibility library"
+HOMEPAGE = "https://xlsxwriter.readthedocs.io"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672"
+
+inherit pypi
+
+RDEPENDS_${PN} = "${PYTHON_PN}-io"
+
+PYPI_PACKAGE = "XlsxWriter"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
new file mode 100644
index 000000000..cba856143
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-xlsxwriter.inc
+
+SRC_URI[md5sum] = "20f8b7df7f1705fa2f7ac3f84789d2ca"
+SRC_URI[sha256sum] = "828b3285fc95105f5b1946a6a015b31cf388bd5378fdc6604e4d1b7839df2e77"
-- 
2.11.0

