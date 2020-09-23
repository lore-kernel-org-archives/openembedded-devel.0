Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.8135.1600847182800258654
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 00:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08N7jaYf005629
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 00:45:52 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 23 Sep 2020
 00:45:33 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>, <trevor.gamblin@windriver.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-docopt: add version 0.6.2
Date: Wed, 23 Sep 2020 15:45:31 +0800
Message-ID: <20200923074531.23290-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

It is required by python3-pykwalify cli
...
$ pykwalify -h
x86_64-wrlinuxsdk-linux/usr/lib/python3.8/site-packages/pykwalify/cli.py", line 11, in <module>
    from docopt import docopt
ModuleNotFoundError: No module named 'docopt'
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python3-docopt_0.6.2.bb   | 11 +++++++++++
 .../python/python3-pykwalify_1.7.0.bb                 |  1 +
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb b/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
new file mode 100644
index 000000000..a2432068c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Pythonic argument parser, that will make you smile"
+HOMEPAGE = "http://docopt.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=09b77fb74986791a3d4a0e746a37d88f"
+
+inherit setuptools3 pypi
+
+SRC_URI[md5sum] = "4bc74561b37fad5d3e7d037f82a4c3b1"
+SRC_URI[sha256sum] = "49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
index 4440723d3..7a30f1f67 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -12,6 +12,7 @@ inherit setuptools3 pypi
 unset _PYTHON_SYSCONFIGDATA_NAME
 
 RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-docopt \
     ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-pyyaml \
 "
-- 
2.18.2

