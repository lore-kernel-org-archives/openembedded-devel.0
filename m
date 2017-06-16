Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id DA2C778545
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:41:26 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id c10so76871716qtd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C7e+BnSArN+CLLCqaghdJtqUB7jUpCyVL0FX26s+Nhc=;
	b=RFpNi0epPvo2xwCYlQV5JIjgBifJjdN4yhl6Pyd0I7lRpUVmjryH2AOYEMQWl0lH90
	pSQUv6SvdofTJ5zYlN0TSIEitnT+JygGjZdQ9G+ZQWuQNlzcFreU3MYDBQ2RlDDXj2fc
	z1iKuD44dGxAwGftfX/RFQMmJMAiEEW146hK5QXycjeC4YGn2NdC0+3A/VXQn05jQiE8
	y1AnIXz1lIXl8nv42STiEMQPVlFsUzSWRWP6eHeoK8w1nLuPbxES3YpAERBR9HGOjsKP
	LmT8WBJKITTfjtxrq+hWtBWNM/9AE/tUwVoUken5F9gm8ImS6hVEavOjxyOTSQlZEDuF
	kPGA==
X-Gm-Message-State: AKS2vOzIkcTkf6eRCCbhMpLSkKK2pGGLIC6wdEvHZ0KoxSZaDiKK0qli
	moeGsTSUH3CgMmKrXf4=
X-Received: by 10.55.154.142 with SMTP id c136mr15014859qke.123.1497642087396; 
	Fri, 16 Jun 2017 12:41:27 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	p52sm2241512qtb.69.2017.06.16.12.41.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 12:41:26 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:41:19 -0400
Message-Id: <1497642079-10527-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-mprpc: update to version 0.1.14
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
X-List-Received-Date: Fri, 16 Jun 2017 19:41:28 -0000

Remove patch incorporated in upstream release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-mprpc/files/0001-fix_setup_py.patch     | 34 ----------------------
 .../python-mprpc/python-mprpc.inc                  |  8 ++---
 ...thon-mprpc_0.1.13.bb => python-mprpc_0.1.14.bb} |  0
 ...on3-mprpc_0.1.13.bb => python3-mprpc_0.1.14.bb} |  0
 4 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
 rename meta-python/recipes-connectivity/python-mprpc/{python-mprpc_0.1.13.bb => python-mprpc_0.1.14.bb} (100%)
 rename meta-python/recipes-connectivity/python-mprpc/{python3-mprpc_0.1.13.bb => python3-mprpc_0.1.14.bb} (100%)

diff --git a/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch b/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
deleted file mode 100644
index f5df9b9..0000000
--- a/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From bda99eab9036d46e7bb06b446d11cab0b1dd8093 Mon Sep 17 00:00:00 2001
-From: Andrej Rode <andrej.rode@ettus.com>
-Date: Mon, 10 Apr 2017 16:49:50 -0700
-Subject: [PATCH] setup: remove find_packages and only install mprpc
-
-Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 5001d0c..4c0ba75 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,6 +1,6 @@
- # -*- coding: utf-8 -*-
- 
--from setuptools import setup, Extension, find_packages
-+from setuptools import setup, Extension
- 
- setup(
-     name='mprpc',
-@@ -10,7 +10,7 @@ setup(
-     author='Studio Ousia',
-     author_email='ikuya@ousia.jp',
-     url='http://github.com/studio-ousia/mprpc',
--    packages=find_packages(),
-+    packages=['mprpc'],
-     ext_modules=[
-         Extension('mprpc.client', ['mprpc/client.c']),
-         Extension('mprpc.server', ['mprpc/server.c'])
--- 
-2.10.2
-
diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
index 3a1c0be..b9535fc 100644
--- a/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
+++ b/meta-python/recipes-connectivity/python-mprpc/python-mprpc.inc
@@ -7,11 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 DEPENDS += "${PYTHON_PN}-gevent"
 RDEPENDS_${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
 
-SRC_URI_append = " \
-    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
-"
-
-SRC_URI[md5sum] = "449e6239eb5ff07b9cceb86e1ab0c2ee"
-SRC_URI[sha256sum] = "5881cc7fbb8de814e2b4aa5958bfe147c5c301e46749190f0e6abf373cf56d82"
+SRC_URI[md5sum] = "66e6cf367ea71cfed8938a27e9c183c3"
+SRC_URI[sha256sum] = "5ccada6526d48ac4d95a7bbdc093586663841560337032a503f57ccfae69d7bf"
 
 inherit pypi
diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.14.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
rename to meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.14.bb
diff --git a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.13.bb b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.14.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.13.bb
rename to meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.14.bb
-- 
2.7.4


