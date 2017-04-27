Return-Path: <andrej.rode@ettus.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 153E577D92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 21:19:50 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id i4so1461704pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=X0cd4y3W9OxTmhck5POt0lcCf2IMma7+2RlMXzqcuaU=;
	b=Z9c3kBAw93oshTYES1/61iNVXCQZ0CNYuhGOP2We7IsJY99Iz7aSU2ZEWQNZ8r1qX+
	de4HR6CJejXqCwcm0fmKMAOvUGqV7QJ3NC1y443mjrq8Te0yXxOfAGmixaHU5kFElD1I
	SchOo80DTqZo+jwIQMjtf3qxE8s2eOjCrR21ln1Y/6feL7BiG0YR9L5TBVVXNrlgDW2e
	yY8IXkIBVKv91sfEADbKopmiXeH7gXGaosp/eQOkoA3ETB9rcZYFDJFomdY8aKqAa6Xw
	ZW0z+R1vgVCeHdxB6k+x1UPr6rxDSbBBeuS3cgJ4f4OmXPffYIY1mQOLWnkycvJiECn6
	05Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X0cd4y3W9OxTmhck5POt0lcCf2IMma7+2RlMXzqcuaU=;
	b=hrhDpxH3M7b00CxZ+iQUDIAzUD9ZaJs3xN58oVxztfHQ7Q5bxCB3lbwTnI/r1oyFS7
	QJJvJ6WKvDSyrpIML0nMqzXovTDXBRfNribt4mJdSQCnQxRDb9Ql4QRjJ/YMUzQPeRTf
	5smi1qfLcR0orUNqrTRu/q/0SkJRzS/mW1zhl63vYiNuef9I36uNJPaMbofyiUOuW+H6
	qzZ9zd0lKO2jvkkskHj1f5fMSHGg6SbF50LXR5VHImOA7p3HhM1mvZ35fCHnIwst2uwQ
	UVrJLUWyWF0d+1c0cfSqcW3XAqDChfGc5yVnpFjROkW2i5WNr49PaMkcwT6uInYBog+X
	Pa1Q==
X-Gm-Message-State: AN3rC/7yKYgsPhhGWVlmmmTL9hY7yIvTPk40dRBQKdZwcuv2wknhUJrX
	LinTQST/DPEC74PT
X-Received: by 10.84.205.70 with SMTP id o6mr10191512plh.63.1493327992021;
	Thu, 27 Apr 2017 14:19:52 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id 65sm7765933pgc.1.2017.04.27.14.19.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Apr 2017 14:19:51 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Apr 2017 14:19:47 -0700
Message-Id: <20170427211948.12255-1-andrej.rode@ettus.com>
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
X-List-Received-Date: Thu, 27 Apr 2017 21:19:51 -0000

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


