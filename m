Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5F271AE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:28:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v596Spdc016057
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Jun 2017 23:28:51 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 23:28:50 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jun 2017 14:28:46 +0800
Message-ID: <3b9036df0f5ec0a22e109c51316de5e7d716e397.1496989437.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496989437.git.jackie.huang@windriver.com>
References: <cover.1496989437.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/2] python3-django: add python3 recipe and update to 1.11.2
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
X-List-Received-Date: Fri, 09 Jun 2017 06:28:50 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* move the mommon portions into .inc
* update to version 1.11.2
* add new recipe for python3-django

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-django_1.10.5.bb => python-django.inc}           | 6 +++---
 meta-python/recipes-devtools/python/python-django_1.11.2.bb         | 2 ++
 meta-python/recipes-devtools/python/python3-django_1.11.2.bb        | 2 ++
 3 files changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django_1.10.5.bb => python-django.inc} (75%)
 create mode 100644 meta-python/recipes-devtools/python/python-django_1.11.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_1.11.2.bb

diff --git a/meta-python/recipes-devtools/python/python-django_1.10.5.bb b/meta-python/recipes-devtools/python/python-django.inc
similarity index 75%
rename from meta-python/recipes-devtools/python/python-django_1.10.5.bb
rename to meta-python/recipes-devtools/python/python-django.inc
index 11242df7f..d83e7d25a 100644
--- a/meta-python/recipes-devtools/python/python-django_1.10.5.bb
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -3,11 +3,11 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "3fce02f1e6461fec21f1f15ea7489924"
-SRC_URI[sha256sum] = "0db89374b691b9c8b057632a6cd64b18d08db2f4d63b4d4af6024267ab965f8b"
+SRC_URI[md5sum] = "f089f1f86d25f2b78f6cf36478d4edd1"
+SRC_URI[sha256sum] = "3c5b070482df4f9e5750539dc1824d353729ee423fd410c579b8cd3dea5b0617"
 
 PYPI_PACKAGE = "Django"
-inherit pypi setuptools
+inherit pypi
 
 FILES_${PN} += "${datadir}/django"
 
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.2.bb b/meta-python/recipes-devtools/python/python-django_1.11.2.bb
new file mode 100644
index 000000000..ccd7714e9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-django_1.11.2.bb
@@ -0,0 +1,2 @@
+require python-django.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.2.bb b/meta-python/recipes-devtools/python/python3-django_1.11.2.bb
new file mode 100644
index 000000000..e1e38c322
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_1.11.2.bb
@@ -0,0 +1,2 @@
+require python-django.inc
+inherit setuptools3
-- 
2.11.0


