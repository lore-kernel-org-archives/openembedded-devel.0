Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52F1D746D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 06:00:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5Q60SKm013740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 23:00:43 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 23:00:17 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:58 +0800
Message-ID: <1529992863-24711-15-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 15/20] python(3)-automat: upgrade 0.6.0 -> 0.7.0
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
X-List-Received-Date: Tue, 26 Jun 2018 06:00:52 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Patch is rebased against latest codes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-automat.inc      |  4 ++--
 .../0001-setup.py-remove-the-dependency-on-m2r.patch        | 13 +++++++------
 .../{python-automat_0.6.0.bb => python-automat_0.7.0.bb}    |  0
 .../{python3-automat_0.6.0.bb => python3-automat_0.7.0.bb}  |  0
 4 files changed, 9 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python-automat_0.6.0.bb => python-automat_0.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-automat_0.6.0.bb => python3-automat_0.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-automat.inc b/meta-python/recipes-devtools/python/python-automat.inc
index 43b9ce9e3..f6cbb35c0 100644
--- a/meta-python/recipes-devtools/python/python-automat.inc
+++ b/meta-python/recipes-devtools/python/python-automat.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-automat:"
 
-SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
-SRC_URI[sha256sum] = "3c1fd04ecf08ac87b4dd3feae409542e9bf7827257097b2b6ed5692f69d6f6a8"
+SRC_URI[md5sum] = "b72d5b7a83c2b1bd6e9ec3614a69f9ea"
+SRC_URI[sha256sum] = "cbd78b83fa2d81fe2a4d23d258e1661dd7493c9a50ee2f1a5b2cac61c1793b0e"
 
 PYPI_PACKAGE = "Automat"
 
diff --git a/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch b/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
index d6def98c9..c29b659bc 100644
--- a/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
+++ b/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
@@ -1,4 +1,4 @@
-From d5ebe479fc8fe11c5c75e7f35484849320349222 Mon Sep 17 00:00:00 2001
+From 33b70266930c9093712173c4e0c419815b55e313 Mon Sep 17 00:00:00 2001
 From: Derek Straka <derek@asterius.io>
 Date: Fri, 22 Dec 2017 09:07:00 -0500
 Subject: [PATCH] setup.py: remove the dependency on m2r
@@ -11,14 +11,15 @@ value in this case
 Upstream-Status: Inappropriate (OE specific)
 
 Signed-off-by: Derek Straka <derek@asterius.io>
+
 ---
  setup.py | 10 ----------
  1 file changed, 10 deletions(-)
 
-Index: Automat-0.6.0/setup.py
-===================================================================
---- Automat-0.6.0.orig/setup.py
-+++ Automat-0.6.0/setup.py
+diff --git a/setup.py b/setup.py
+index d360c64..7b4180a 100644
+--- a/setup.py
++++ b/setup.py
 @@ -4,14 +4,6 @@ Setup file for automat
  
  from setuptools import setup, find_packages
@@ -46,4 +47,4 @@ Index: Automat-0.6.0/setup.py
 -        'm2r',
      ],
      install_requires=[
-         "attrs",
+         "attrs>=16.1.0",
diff --git a/meta-python/recipes-devtools/python/python-automat_0.6.0.bb b/meta-python/recipes-devtools/python/python-automat_0.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-automat_0.6.0.bb
rename to meta-python/recipes-devtools/python/python-automat_0.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb b/meta-python/recipes-devtools/python/python3-automat_0.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-automat_0.7.0.bb
-- 
2.11.0


