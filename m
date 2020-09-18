Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.8049.1600416155742510901
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 01:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08I81vhm002568
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 18 Sep 2020 01:02:07 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 01:01:28 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>, <trevor.gamblin@windriver.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-argcomplete: add recipe 1.12.0
Date: Fri, 18 Sep 2020 16:01:26 +0800
Message-ID: <20200918080126.34608-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Tab complete all the things!

Argcomplete provides easy, extensible command line tab completion of
arguments for your Python script.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python3-argcomplete_1.12.0.bb       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
new file mode 100644
index 000000000..dd749dd9e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Argcomplete provides easy, extensible command line tab completion of arguments for your Python script."
+HOMEPAGE = "https://github.com/kislyuk/argcomplete"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SRC_URI[md5sum] = "47e2a3db821f57165be8f3d3ec1e5259"
+SRC_URI[sha256sum] = "2fbe5ed09fd2c1d727d4199feca96569a5b50d44c71b16da9c742201f7cc295c"
+
+PYPI_PACKAGE = "argcomplete"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-core \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.18.2

