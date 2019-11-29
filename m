Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 25D1E7F87C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:35:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAT5Z7GU019989
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 21:35:07 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 28 Nov 2019 21:34:48 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Nov 2019 13:34:45 +0800
Message-ID: <1575005686-133171-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] python3-django: upgrade 1.11.14 -> 2.2.7
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
X-List-Received-Date: Fri, 29 Nov 2019 05:35:07 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-python/recipes-devtools/python/python-django.inc         | 3 ---
 meta-python/recipes-devtools/python/python-django_1.11.14.bb  | 3 +++
 meta-python/recipes-devtools/python/python3-django_1.11.14.bb | 2 --
 meta-python/recipes-devtools/python/python3-django_2.2.7.bb   | 9 +++++++++
 4 files changed, 12 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_1.11.14.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.7.bb

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index ee3aee6..63d025d 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -3,9 +3,6 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "38e82b59a1c27bbf98ccf0564ead7426"
-SRC_URI[sha256sum] = "eb9271f0874f53106a2719c0c35ce67631f6cc27cf81a60c6f8c9817b35a3f6e"
-
 PYPI_PACKAGE = "Django"
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.14.bb b/meta-python/recipes-devtools/python/python-django_1.11.14.bb
index d2347cc..efe23dc 100644
--- a/meta-python/recipes-devtools/python/python-django_1.11.14.bb
+++ b/meta-python/recipes-devtools/python/python-django_1.11.14.bb
@@ -1,6 +1,9 @@
 require python-django.inc
 inherit setuptools
 
+SRC_URI[md5sum] = "38e82b59a1c27bbf98ccf0564ead7426"
+SRC_URI[sha256sum] = "eb9271f0874f53106a2719c0c35ce67631f6cc27cf81a60c6f8c9817b35a3f6e"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-subprocess \
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.14.bb b/meta-python/recipes-devtools/python/python3-django_1.11.14.bb
deleted file mode 100644
index e1e38c3..0000000
--- a/meta-python/recipes-devtools/python/python3-django_1.11.14.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-django.inc
-inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.7.bb b/meta-python/recipes-devtools/python/python3-django_2.2.7.bb
new file mode 100644
index 0000000..e56453a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.7.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "b0833024aac4c8240467e4dc91a12e9b"
+SRC_URI[sha256sum] = "16040e1288c6c9f68c6da2fe75ebde83c0a158f6f5d54f4c5177b0c1478c5b86"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
-- 
2.7.4


