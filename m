Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifb-0005A2-Cb
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:34:59 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=haVTh5dWPsrtCUyyzyPhUNT2+KVnaHK/n30UCtGvsMY=;
	b=J1PrIWkea8PmHE+9rUnHw33C6d03JM46rAGLi2aHjZMoozhjYCX3fsrUK0K8r7dOja
	RN1No8qzEEFV94DdPTStxS6HRuTKnyLZ5xWJ+CkozJf8MMEKp7ToSoEWLS5xMxrdIiQK
	8b+Kmpu0mv1YokMPlo2WGY813Zb4apRJy60FQ=
Received: by 10.204.130.65 with SMTP id r1mr9532716bks.312.1317648568650;
	Mon, 03 Oct 2011 06:29:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l15sm13221755bkw.9.2011.10.03.06.29.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:14 +0200
Message-Id: <77916aac94ce6836ab989d4a6e137f0eaca5f1f0.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 16/25] python-cython: add patch to fix build error with some distutils packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2011 13:34:59 -0000

* fails with TypeError: unsupported operand type(s) for +: 'NoneType' and 'str' in setup.py
  when using python-2.6 or python-2.7 (don't know about python-3*)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...pend-docs-to-_Extension.extension.__doc__.patch |   27 ++++++++++++++++++++
 .../python/python-cython_0.15.1.bb                 |    5 +++-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-cython-0.15.1/0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch

diff --git a/meta-oe/recipes-devtools/python/python-cython-0.15.1/0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch b/meta-oe/recipes-devtools/python/python-cython-0.15.1/0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch
new file mode 100644
index 0000000..9b9dd46
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-cython-0.15.1/0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch
@@ -0,0 +1,27 @@
+From bfed128dfe9551a3a40b1ac4269f18ecfeac80a9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 1 Oct 2011 11:46:30 +0200
+Subject: [PATCH] Don't append docs to _Extension.extension.__doc__
+
+* here it fails with TypeError: unsupported operand type(s) for +: 'NoneType' and 'str' in setup.py
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Cython/Distutils/extension.py |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/Cython/Distutils/extension.py b/Cython/Distutils/extension.py
+index a5a6638..e76c1e7 100644
+--- a/Cython/Distutils/extension.py
++++ b/Cython/Distutils/extension.py
+@@ -16,7 +16,6 @@ except ImportError:
+     warnings = None
+ 
+ class Extension(_Extension.Extension):
+-    _Extension.Extension.__doc__ + \
+     """pyrex_include_dirs : [string]
+         list of directories to search for Pyrex header files (.pxd) (in
+         Unix form for portability)
+-- 
+1.7.6.1
+
diff --git a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
index f22a473..3b85601 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
@@ -6,8 +6,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
+PR = "r1"
 
-SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz \
+           file://0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch \
+"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 SRC_URI[md5sum] = "171021b3845c9ca8bd6d8185b3cde664"
-- 
1.7.7



