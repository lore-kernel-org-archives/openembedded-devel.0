Return-Path: <andrej.rode@ettus.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id CE19977E69
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 18:58:37 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id x125so34475254pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=X0cd4y3W9OxTmhck5POt0lcCf2IMma7+2RlMXzqcuaU=;
	b=n8cBJacv92tTDSzXr29z+VZOxm7vJ6pftNlhj+oEds8nCh6KJ5j4T3c/b4Fx4f7YiP
	klNQllxLCrbHrT08OA9SPWG/jAlgP+72XqsNRNeQib5qKaLk+9nhZCKeZH8w+X8eq+Df
	TCxr2qA0sh6t6IVwOSJySwYth+E5nAEo6afMrGVvZ1BzYTy3VkpYI/otXfWyc9PmICXi
	Cm3HCjUBqxG3hsbnRouZPe52giTkS82xfNHUzvzYEvvw4oA49a/I/OLSYh3YmZMOhaP+
	2tC3xWJzjGLekC2WVA01YQjC8Fu/tkoD7Ny/f3SYBwP4Dn0ABDDo0dpptyW4+Jok2HgS
	yjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X0cd4y3W9OxTmhck5POt0lcCf2IMma7+2RlMXzqcuaU=;
	b=DTMouqp0j75EaxpSoOEsAk4KVxe+1PqYVCZfQyCABr4ua6iuVnA0QikMVDRF0k6cOF
	okMr6zKWHsROhdyRDmxd/g3YgCqIAL7hj6wc/p6oc0BWbjmFXOODLh8toW8fPH8U+0CM
	yp9R+R+nIiqWUqCU9cxVF/vmALm3hes6hQoYf1hl2XwS+C/w0561TgCerIYLJlBCRGX0
	5LOsscRKI65jGFM7sfOGbnyvPeSBSWChYNV1owhF4H8cEN7PsosR4W6f+z2vI20afmXE
	mPekQrPt5hsM1pK7rSSpUEjz24DT+wa2OpHtwVeC4gY5RseSOtApXZnNaJQxmxRM6K3X
	yX1g==
X-Gm-Message-State: AN3rC/7oAYPthWsxzQN+90z0D3FNheJhUK5KECjwxLbZBSR2w3c7gRPd
	pXNM8T31lyjXnphZ
X-Received: by 10.99.217.17 with SMTP id r17mr4371879pgg.140.1492109918217;
	Thu, 13 Apr 2017 11:58:38 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	w16sm44074964pgc.44.2017.04.13.11.58.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Apr 2017 11:58:37 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 11:58:12 -0700
Message-Id: <20170413185813.25145-1-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH v3 1/2] python-gsocketpool: add new recipe
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
X-List-Received-Date: Thu, 13 Apr 2017 18:58:39 -0000

Adds recipe for python-gsocketpool as a dependency for python-mprpc

Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
---
 .../files/0001-fix_setup_py.patch                  | 35 ++++++++++++++++++++++
 .../python-gsocketpool/python-gsocketpool_0.1.5.bb | 16 ++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-gsocketpool/files/0001-fix_setup_py.patch
 create mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/files/0001-fix_setup_py.patch b/meta-python/recipes-connectivity/python-gsocketpool/files/0001-fix_setup_py.patch
new file mode 100644
index 0000000..a9135a3
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-gsocketpool/files/0001-fix_setup_py.patch
@@ -0,0 +1,35 @@
+From 2d47a5df58802173bf90d760b1d6f520aeea76fc Mon Sep 17 00:00:00 2001
+From: Andrej Rode <andrej.rode@ettus.com>
+Date: Mon, 10 Apr 2017 16:47:41 -0700
+Subject: [PATCH] setup: remove find_packages since that would install tests as
+ a package as well
+
+Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 6b37016..a1f11a7 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,6 +1,6 @@
+ # -*- coding: utf-8 -*-
+ 
+-from setuptools import setup, find_packages
++from setuptools import setup
+ 
+ setup(
+     name='gsocketpool',
+@@ -9,7 +9,7 @@ setup(
+     author='Studio Ousia',
+     author_email='ikuya@ousia.jp',
+     url='http://github.com/studio-ousia/gsocketpool',
+-    packages=find_packages(),
++    packages=['gsocketpool'],
+     license=open('LICENSE').read(),
+     include_package_data=True,
+     classifiers=(
+-- 
+2.10.2
+
diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
new file mode 100644
index 0000000..f86152c
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A simple connection pool for gevent"
+DESCRIPTION = "creates a pool of connections that can be used with gevent"
+HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
+DEPENDS += "python-gevent"
+RDEPENDS_${PN} += "python-gevent"
+
+SRC_URI_append = " \
+    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
+"
+
+SRC_URI[md5sum] = "04f618864b18d6b06f774994f172ef49"
+SRC_URI[sha256sum] = "b6b73deab9bcbc428d4813697eebe5c3b9c40a971f62e13607b881aa749af9d0"
+
+inherit pypi setuptools
-- 
2.10.2


