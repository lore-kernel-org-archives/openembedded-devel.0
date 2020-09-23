Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.8504.1600848884481550054
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 01:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08N8Ef4e025583
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 01:14:41 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 23 Sep 2020
 01:14:40 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>, <trevor.gamblin@windriver.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH V2] python3-docopt: add version 0.6.2
Date: Wed, 23 Sep 2020 16:14:38 +0800
Message-ID: <20200923081438.32716-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <16375A080EFE1B42.13575@lists.openembedded.org>
References: <16375A080EFE1B42.13575@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain

It is required by python3-pykwalify cli
...
$ pykwalify -h
x86_64-wrlinuxsdk-linux/usr/lib/python3.8/site-packages/pykwalify/cli.py", line 11, in <module>
    from docopt import docopt
ModuleNotFoundError: No module named 'docopt'
...

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-dev on 20200923

Issue: LINUXEXEC-10213

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../recipes-devtools/python/python3-docopt_0.6.2.bb   | 11 +++++++++++
 .../python/python3-pykwalify_1.7.0.bb                 |  1 +
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-docopt_0.6.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 61623ac98..a7c71e37c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -261,6 +261,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pyiface \
     python3-pyjwt \
     python3-pykwalify \
+    python3-docopt \
     python3-pylint \
     python3-pynetlinux \
     python3-pickleshare \
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

