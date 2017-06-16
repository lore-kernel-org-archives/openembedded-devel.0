Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id F1767782C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:38:39 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id w1so71913212qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6JisS+tnDEzRw9DIIFAScyStNWC1I5b3rFdCpxmsMkY=;
	b=TJ42BDMVHMaQDuwoHdSmgJQm1qbU8W+aZTM6Iem526aAA4jBUKOcULejqrTZ2xKwlv
	jqKtuI+Ce/RbjgXmXz+Een53/kNXnw1R17nQxgZHgfS25eCLcEe6YAibfESwXRdEoDaa
	qRn2I6hfsdB03DoAZpMhjPMDvR+OTXTJd9AJomQRlsGcYBxOTAWJJ6tL/JlEzOXxtuVA
	F0UQoUQUVqtNynaJn+t3Vs1NcB+x0tuNHlvf+fB1bfZBYlIiVd80YcS9af0cIRgkZ9l2
	fkTEl8RLoKFsnS7y8lqBRSAjOWJrWhmGTFfPsUiEIR57b1Ppo9HcP/KK2IOpQI0uDb4V
	CrGw==
X-Gm-Message-State: AKS2vOxzq8SZf1DVBb06VCAIzQsctZG1AFwlaF7s14I6w4V/dLc1mVPS
	RZn209FPtVhxIVUzip8=
X-Received: by 10.55.77.2 with SMTP id a2mr13275499qkb.156.1497634720817;
	Fri, 16 Jun 2017 10:38:40 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	l46sm2019997qtb.21.2017.06.16.10.38.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:38:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:38:32 -0400
Message-Id: <1497634712-6953-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-gsocketpool: update to version 0.1.6
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
X-List-Received-Date: Fri, 16 Jun 2017 17:38:40 -0000

Remove patch that has been applied upstream in this release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../files/0001-fix_setup_py.patch                  | 35 ----------------------
 .../python-gsocketpool/python-gsocketpool.inc      |  8 ++---
 ...etpool_0.1.5.bb => python-gsocketpool_0.1.6.bb} |  0
 ...tpool_0.1.5.bb => python3-gsocketpool_0.1.6.bb} |  0
 4 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-gsocketpool/files/0001-fix_setup_py.patch
 rename meta-python/recipes-connectivity/python-gsocketpool/{python-gsocketpool_0.1.5.bb => python-gsocketpool_0.1.6.bb} (100%)
 rename meta-python/recipes-connectivity/python-gsocketpool/{python3-gsocketpool_0.1.5.bb => python3-gsocketpool_0.1.6.bb} (100%)

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/files/0001-fix_setup_py.patch b/meta-python/recipes-connectivity/python-gsocketpool/files/0001-fix_setup_py.patch
deleted file mode 100644
index a9135a3..0000000
--- a/meta-python/recipes-connectivity/python-gsocketpool/files/0001-fix_setup_py.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2d47a5df58802173bf90d760b1d6f520aeea76fc Mon Sep 17 00:00:00 2001
-From: Andrej Rode <andrej.rode@ettus.com>
-Date: Mon, 10 Apr 2017 16:47:41 -0700
-Subject: [PATCH] setup: remove find_packages since that would install tests as
- a package as well
-
-Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 6b37016..a1f11a7 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,6 +1,6 @@
- # -*- coding: utf-8 -*-
- 
--from setuptools import setup, find_packages
-+from setuptools import setup
- 
- setup(
-     name='gsocketpool',
-@@ -9,7 +9,7 @@ setup(
-     author='Studio Ousia',
-     author_email='ikuya@ousia.jp',
-     url='http://github.com/studio-ousia/gsocketpool',
--    packages=find_packages(),
-+    packages=['gsocketpool'],
-     license=open('LICENSE').read(),
-     include_package_data=True,
-     classifiers=(
--- 
-2.10.2
-
diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
index 54dd49f..11971dc 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
@@ -6,11 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 DEPENDS += "${PYTHON_PN}-gevent"
 RDEPENDS_${PN} += "${PYTHON_PN}-gevent"
 
-SRC_URI_append = " \
-    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
-"
-
-SRC_URI[md5sum] = "04f618864b18d6b06f774994f172ef49"
-SRC_URI[sha256sum] = "b6b73deab9bcbc428d4813697eebe5c3b9c40a971f62e13607b881aa749af9d0"
+SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
+SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
 
 inherit pypi
diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
rename to meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.6.bb
diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.5.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.5.bb
rename to meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
-- 
2.7.4


