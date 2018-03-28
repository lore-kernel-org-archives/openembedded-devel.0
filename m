Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7237824D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 20:10:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2SKAg4O030138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Mar 2018 13:10:43 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 28 Mar 2018 13:10:41 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Mar 2018 16:10:41 -0400
Message-ID: <1522267841-26264-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-jsonpatch: fix do_install
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
X-List-Received-Date: Wed, 28 Mar 2018 20:10:45 -0000
Content-Type: text/plain

The following error is seen when do_install is run

| UnicodeEncodeError: 'ascii' codec can't encode character u'\xf6' in
| position 16: ordinal not in range(128) ERROR: python setup.py
| install execution failed.

This is reported in the upstream project as part of pull request #81
https://github.com/stefankoegl/python-json-patch/pull/81

Since a release is not yet available with the required fix we must
apply the fix as a patch.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-jsonpatch.inc   |  4 +++
 .../Drop-support-for-EOL-Python-3.3.patch          | 35 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
index e559fb1..85483df 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
@@ -8,5 +8,9 @@ inherit pypi
 SRC_URI[md5sum] = "0b20d819daf120ed3fef3be608f2ce18"
 SRC_URI[sha256sum] = "11f5ffdf543a83047a2f54ac28f8caad7f34724cb1ea26b27547fd974f1a2153"
 
+SRC_URI += " \
+    file://Drop-support-for-EOL-Python-3.3.patch \
+"
+
 RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
 
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch b/meta-python/recipes-devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
new file mode 100644
index 0000000..ccd8e12
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
@@ -0,0 +1,35 @@
+From 71bdeed8b49390ff14fe8f0434fc8a1038d89128 Mon Sep 17 00:00:00 2001
+From: Hugo <hugovk@users.noreply.github.com>
+Date: Tue, 16 Jan 2018 14:22:33 +0200
+Subject: [PATCH 1/4] Drop support for EOL Python 3.3
+
+Upstream-Status: Backport
+
+[MA: remove dev only files from patch]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+
+---
+ setup.py      | 2 +-
+
+diff --git a/setup.py b/setup.py
+index 0776c41..471c433 100644
+--- a/setup.py
++++ b/setup.py
+@@ -58,7 +58,6 @@ CLASSIFIERS = [
+     'Programming Language :: Python :: 2',
+     'Programming Language :: Python :: 2.7',
+     'Programming Language :: Python :: 3',
+-    'Programming Language :: Python :: 3.3',
+     'Programming Language :: Python :: 3.4',
+     'Programming Language :: Python :: 3.5',
+     'Programming Language :: Python :: 3.6',
+@@ -81,5 +80,6 @@ setup(name=PACKAGE,
+       package_data={'': ['requirements.txt']},
+       scripts=['bin/jsondiff', 'bin/jsonpatch'],
+       classifiers=CLASSIFIERS,
++      python_requires='>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*',
+       **OPTIONS
+ )
+-- 
+2.7.4
+
-- 
2.7.4


