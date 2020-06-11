Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2764.1591840943245965180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 19:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: bsarashk@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05B21cxB001175
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Jun 2020 19:01:49 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 10 Jun 2020
 19:01:28 -0700
Received: by ala-lpggp5.wrs.com (Postfix, from userid 16552)	id 40FD520CFD;
 Wed, 10 Jun 2020 19:01:28 -0700 (PDT)
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <zbsarashki@gmail.com>, Babak Sarashki <Babak.SarAshki@windriver.com>
Subject: [meta-python2][warrior][PATCH] python-kombu: add recipe
Date: Wed, 10 Jun 2020 19:01:09 -0700
Message-ID: <20200611020109.17481-1-Babak.SarAshki@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

(From meta-cloud-services commit: a7ed26594c666823ec270a1c37f6eaf82c7dfa17)

Signed-off-by: Babak Sarashki <Babak.SarAshki@windriver.com>
---
 recipes-devtools/python/python-kombu_4.6.6.bb | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-devtools/python/python-kombu_4.6.6.bb

diff --git a/recipes-devtools/python/python-kombu_4.6.6.bb b/recipes-devtools/python/python-kombu_4.6.6.bb
new file mode 100644
index 0000000..72a9d90
--- /dev/null
+++ b/recipes-devtools/python/python-kombu_4.6.6.bb
@@ -0,0 +1,23 @@
+SUMMARY = "The aim of Kombu is to make messaging in Python as easy as possible by providing \
+an idiomatic high-level interface for the AMQ protocol, and also provide proven and tested \
+solutions to common messaging problems."
+
+DESCRIPTION = "A messaging framework for Python"
+BUGTRACKER = "http://github.com/celery/kombu/issues/"
+HOMEPAGE = "http://kombu.readthedocs.org"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
+
+SRC_URI[md5sum] = "5f751ea817b1f6a4293d4e3a01040d4f"
+SRC_URI[sha256sum] = "1760b54b1d15a547c9a26d3598a1c8cdaf2436386ac1f5561934bc8a3cbbbd86"
+
+inherit setuptools pypi
+
+PYPI_PACKAGE = "kombu"
+
+FILES_${PN}-doc += "${datadir}/${SRCNAME}"
+
+RDEPENDS_${PN} = " \
+        python-amqp \
+        "
-- 
2.24.1

