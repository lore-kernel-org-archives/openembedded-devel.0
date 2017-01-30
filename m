Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 88FF8772E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 08:02:30 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v0U82R5e001276
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 30 Jan 2017 09:02:27 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.32])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v0U82RZs031593;
	Mon, 30 Jan 2017 09:02:27 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2017 09:01:59 +0100
Message-Id: <1485763319-26390-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python3-multidict: make repeated builds work even without sphinx
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
X-List-Received-Date: Mon, 30 Jan 2017 08:02:32 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Make clean was implicitly calling sphinx which lead to errors.

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 ...w-calling-make-clean-without-sphinx-build.patch | 34 ++++++++++++++++++++++
 .../python/python3-multidict_2.1.4.bb              |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-multidict/0001-Allow-calling-make-clean-without-sphinx-build.patch

diff --git a/meta-python/recipes-devtools/python/python3-multidict/0001-Allow-calling-make-clean-without-sphinx-build.patch b/meta-python/recipes-devtools/python/python3-multidict/0001-Allow-calling-make-clean-without-sphinx-build.patch
new file mode 100644
index 0000000..d1d7ef5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-multidict/0001-Allow-calling-make-clean-without-sphinx-build.patch
@@ -0,0 +1,34 @@
+From 39e13b4e3f7a1d1dd748e80cee241d511865d4e8 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@nextrem.ch>
+Date: Mon, 16 Jan 2017 21:29:12 +0100
+Subject: [PATCH] Allow calling make clean without sphinx-build
+
+Currently make clean fails without sphinx-build installed
+However sphinx-build is not really necessary to do a clean.
+This trick makes the docs/Makefile use the false binary instead of
+sphinx-build for the check when a clean is done.
+
+Upstream-Status: Submitted https://github.com/aio-libs/multidict/pull/41
+
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8f525f3..6d601e5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -51,8 +51,8 @@ clean:
+ 	rm -rf coverage
+ 	rm -rf build
+ 	rm -rf cover
+-	make -C docs clean
+-	python setup.py clean
++	make -C docs clean SPHINXBUILD=false
++	python3 setup.py clean
+ 	rm -f multidict/_multidict.html
+ 	rm -f multidict/_multidict.c
+ 	rm -f multidict/_multidict.*.so
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb b/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb
index 4a36a3d..62895d2 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_2.1.4.bb
@@ -5,5 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
 inherit pypi setuptools3
 
+SRC_URI += "file://0001-Allow-calling-make-clean-without-sphinx-build.patch"
+
 SRC_URI[md5sum] = "051d92edec87fd98e43ea83f3ce6072d"
 SRC_URI[sha256sum] = "a77aa8c9f68846c3b5db43ff8ed2a7a884dbe845d01f55113a3fba78518c4cd7"
-- 
2.1.4


