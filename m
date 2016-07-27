Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4BA606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 03:17:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6R3H4IW021185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 20:17:05 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jul 2016 20:17:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jul 2016 11:03:38 +0800
Message-ID: <20160727030338.15620-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160727030338.15620-1-Qi.Chen@windriver.com>
References: <20160727030338.15620-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/3] python3-django: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2016 03:17:05 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../python/python3-django_1.9.7.bb                 | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django_1.9.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_1.9.7.bb b/meta-python/recipes-devtools/python/python3-django_1.9.7.bb
new file mode 100644
index 0000000..7c0db64
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_1.9.7.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A high-level Python Web framework"
+HOMEPAGE = "http://www.djangoproject.com/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
+
+SRC_URI[md5sum] = "7de9ba83bfe01f4b7d45645c1b259c83"
+SRC_URI[sha256sum] = "2b29e81c8c32b3c0d9a0119217416887c480d927ae2630bada2da83078c93bf6"
+
+PYPI_PACKAGE = "Django"
+inherit pypi setuptools3
+
+FILES_${PN} += "${datadir}/django"
+
+BBCLASSEXTEND = "nativesdk"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-importlib \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pip \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
+    "
-- 
2.8.3


