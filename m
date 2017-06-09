Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D82B71AE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:28:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v596Sn8L008901
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Jun 2017 23:28:49 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 23:28:48 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jun 2017 14:28:45 +0800
Message-ID: <cc34fff5575af9a5cf541f9bbefe0d8baa20a30c.1496989437.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496989437.git.jackie.huang@windriver.com>
References: <cover.1496989437.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python3-django-south: add new recipe
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
X-List-Received-Date: Fri, 09 Jun 2017 06:28:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* move the common portions into .inc
* add new recipe for python3-django-south

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-django-south.inc   | 17 +++++++++++++++++
 .../python/python-django-south_1.0.2.bb               | 19 ++-----------------
 .../python/python3-django-south_1.0.2.bb              |  2 ++
 3 files changed, 21 insertions(+), 17 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-django-south.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-django-south.inc b/meta-python/recipes-devtools/python/python-django-south.inc
new file mode 100644
index 000000000..ce904b694
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-django-south.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Migrations for Django"
+DESCRIPTION = "South is an intelligent database migrations library for the Django web framework. It is database-independent and DVCS-friendly, as well as a whole host of other features."
+HOMEPAGE = "http://south.aeracode.org/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c23101d5febac696b27e"
+
+SRC_URI[md5sum] = "c76a9758b2011bc3b6c39f881bba2f66"
+SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
+
+PYPI_PACKAGE = "South"
+inherit pypi
+
+BBCLASSEXTEND = "nativesdk"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-django \
+    "
diff --git a/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb b/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
index 3a2775807..357b766a3 100644
--- a/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
@@ -1,17 +1,2 @@
-SUMMARY = "Migrations for Django"
-DESCRIPTION = "South is an intelligent database migrations library for the Django web framework. It is database-independent and DVCS-friendly, as well as a whole host of other features."
-HOMEPAGE = "http://south.aeracode.org/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c23101d5febac696b27e"
-
-SRC_URI[md5sum] = "c76a9758b2011bc3b6c39f881bba2f66"
-SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
-
-PYPI_PACKAGE = "South"
-inherit pypi setuptools
-
-BBCLASSEXTEND = "nativesdk"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-django \
-    "
+require python-django-south.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
new file mode 100644
index 000000000..10519111f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-south_1.0.2.bb
@@ -0,0 +1,2 @@
+require python-django-south.inc
+inherit setuptools3
-- 
2.11.0


