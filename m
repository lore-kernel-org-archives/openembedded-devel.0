Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0CC6ABDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:18:15 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so7455843wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TTYFIHiLxgh9mZ8BjjELKnZid+w7koDT2P2y7UWZY4U=;
	b=uM2WysnXO8nC/sWli48maivys/hIauPDMUcGD5EKL89pC7eirWWbXET7rZaY687SEM
	i6itMOZFyC+8z9TKILIzM4v7J0gnjLoiigS3mnZKpaX8DSu5D7Bih6HSRhbZJEmfSfFX
	rstX4a2TbTuiP1UcF7pqoUJcooBtd6cmE3srm9MaqUBxNOgF2ctMLc8WrSxOY1jICPYf
	TgA/UzUJI+K8VHHE5n1Fe20nX+qwl8wALlu6jbXHj0WFP4l1m1PjUqYypo8gM25ELjxt
	slixUInYm+YpHQGoXPqjRhmv+IPyJbuRpGMnH2HrMfpHWEDjqs5d959wcAx1ozlrAGGh
	MPZA==
X-Received: by 10.180.186.8 with SMTP id fg8mr3245191wic.39.1401873496819;
	Wed, 04 Jun 2014 02:18:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gu2sm25917811wib.14.2014.06.04.02.18.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:18:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 11:18:20 +0200
Message-Id: <1401873504-32120-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401873504-32120-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/7] python-cython: upgrade to 0.20.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jun 2014 09:18:17 -0000

* 0.19+ version is required by newer python-efl-0.10.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...pend-docs-to-_Extension.extension.__doc__.patch | 27 ----------------------
 ...on-cython_0.15.1.bb => python-cython_0.20.1.bb} |  9 +++-----
 2 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-cython-0.15.1/0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch
 rename meta-oe/recipes-devtools/python/{python-cython_0.15.1.bb => python-cython_0.20.1.bb} (68%)

diff --git a/meta-oe/recipes-devtools/python/python-cython-0.15.1/0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch b/meta-oe/recipes-devtools/python/python-cython-0.15.1/0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch
deleted file mode 100644
index 9b9dd46..0000000
--- a/meta-oe/recipes-devtools/python/python-cython-0.15.1/0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bfed128dfe9551a3a40b1ac4269f18ecfeac80a9 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 1 Oct 2011 11:46:30 +0200
-Subject: [PATCH] Don't append docs to _Extension.extension.__doc__
-
-* here it fails with TypeError: unsupported operand type(s) for +: 'NoneType' and 'str' in setup.py
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Cython/Distutils/extension.py |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/Cython/Distutils/extension.py b/Cython/Distutils/extension.py
-index a5a6638..e76c1e7 100644
---- a/Cython/Distutils/extension.py
-+++ b/Cython/Distutils/extension.py
-@@ -16,7 +16,6 @@ except ImportError:
-     warnings = None
- 
- class Extension(_Extension.Extension):
--    _Extension.Extension.__doc__ + \
-     """pyrex_include_dirs : [string]
-         list of directories to search for Pyrex header files (.pxd) (in
-         Unix form for portability)
--- 
-1.7.6.1
-
diff --git a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb b/meta-oe/recipes-devtools/python/python-cython_0.20.1.bb
similarity index 68%
rename from meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
rename to meta-oe/recipes-devtools/python/python-cython_0.20.1.bb
index 0bf057a..6c7507b 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.20.1.bb
@@ -6,14 +6,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
-PR = "r3"
 
-SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz \
-           file://0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch \
-"
+SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "171021b3845c9ca8bd6d8185b3cde664"
-SRC_URI[sha256sum] = "248123f2f02f2701a28d9452132ac835533b396a273cda9d361cb65c26067edc"
+SRC_URI[md5sum] = "52431696c64e618036537c4d9aa79d99"
+SRC_URI[sha256sum] = "31a563744a21d7b10355f25a3bca96b37ec5d32bdecfc75e93d65a5f7e62766c"
 
 inherit distutils
-- 
2.0.0


