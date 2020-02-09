Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4787260CD1
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:24 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id f2so2273125pjq.1
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ElAeI80rqJgCtbJig+3fk3RHMwadqswtkmOT6l1+WFg=;
	b=IZYEL8BVSlA82nQSrexK5VMqO9TK9lyDIYIZSZ7Jb5oRQ+yrMNS2TeEGtzZeNli+yX
	ZaE5X8NAWJITUndDPluN4EDsrygoeQ2wo5etdBPEnQvqg53PqN94xVlqN7a6rf0sGvv0
	VVD55RRRNAoElxmZil1GGuSJAHsrgmrSV2/BsSzD6iRi7g9/Ujyl+u2/K31CKZGNJv+A
	5odTGe4ckBHooQCsBlCS5s54N3HxzRxaoNLWll/6FHHr0gOI1ktWK4wx+m0bVcl7CD5x
	dRGgBmGP/ixqR5hJk0wVqKj/agylfRXmkY/rk84EpCp8jXFkJvMwI5BbkJcFUZfPi36U
	je4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ElAeI80rqJgCtbJig+3fk3RHMwadqswtkmOT6l1+WFg=;
	b=NaIgzdbBxknUBIeTJP6DzFz7tZwC5dhVRffk4ty9VQ009s5W7vZ4sli3PalMoPcUwI
	7yk4cqFx2+6Q4p/8r7g5wV4Izn1Vw/x1nauAnXW5pMw1zDDfk9WgUDUCGrL+JEe6NZyJ
	L2KZghNVZ9OH/jF1ZkPfPdu/FPJiyRxLAo8mGZOl8eUYgyhrKYEJF/AwHxE6FOJMljui
	dfIJ47gA6WcRCgIamW7j4Tn5vS0kKT7Skcq29yXCvucVjGIrsRQTUCLlBbM/k/Nz8ceY
	lWWjr5Sj09GvFuIY4+fsFl0kfBecMhY3U5nNXtKEuQBvKUPN3sceIQTIVW/Qx0ILa4cV
	Fw6g==
X-Gm-Message-State: APjAAAWEflEBKUhsGIfeiIy5QX4gSDfkNN1Z0OPzMy4HYqx+r0wPI269
	hu/H+4R7t9dHSs8EV/91n4yhmI1y
X-Google-Smtp-Source: APXvYqydBRIbBrtah2XLD5SsiMvBFZpiRiy8Op8eWrrgFwsF2gz52sZDh5GwJw1sAiNgZq5hewXUUw==
X-Received: by 2002:a17:902:8d8d:: with SMTP id
	v13mr8848416plo.260.1581265045105; 
	Sun, 09 Feb 2020 08:17:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.24
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:10 -0800
Message-Id: <14acba7937a7bf71dc29e4075ea986e08b97868f.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 02/11] mariadb: fix library LZ4 lookup
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:24 -0000

From: Sumit Garg <sumit.garg@linaro.org>

While cross-compiling mariadb package it tries to link lz4 library
present in the target sysroot and if not found it tries to link host
lz4 library which is incorrect leading to linker errors. So fix that
via restricting lz4 library lookup to target sysroot only.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 .../mariadb/0001-Fix-library-LZ4-lookup.patch | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index e1ae58ae7a..703e172174 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -18,6 +18,7 @@ SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://c11_atomics.patch \
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
+           file://0001-Fix-library-LZ4-lookup.patch \
           "
 SRC_URI[md5sum] = "b3524c0825c3a1c255496daea38304a0"
 SRC_URI[sha256sum] = "69456ca85bf9d96c6d28b4ade2a9f6787d79a602e27ef941f9ba4e0b55dddedc"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
new file mode 100644
index 0000000000..574dfd317a
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
@@ -0,0 +1,30 @@
+From 1d7612b063eb1fc7bf97bc27b13e1de596748aa1 Mon Sep 17 00:00:00 2001
+From: Sumit Garg <sumit.garg@linaro.org>
+Date: Wed, 8 Jan 2020 04:58:30 +0000
+Subject: [PATCH] Fix library LZ4 lookup.
+
+Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
+---
+ cmake/FindLZ4.cmake | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/FindLZ4.cmake b/cmake/FindLZ4.cmake
+index e97dd63e2b0..2f4694e727c 100644
+--- a/cmake/FindLZ4.cmake
++++ b/cmake/FindLZ4.cmake
+@@ -1,5 +1,10 @@
+-find_path(LZ4_INCLUDE_DIR NAMES lz4.h)
+-find_library(LZ4_LIBRARY NAMES lz4)
++find_path(LZ4_INCLUDE_DIR
++  NAMES	lz4.h
++  NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
++
++find_library(LZ4_LIBRARY
++  NAMES lz4
++  NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
+ 
+ include(FindPackageHandleStandardArgs)
+ FIND_PACKAGE_HANDLE_STANDARD_ARGS(
+-- 
+2.17.1
+
-- 
2.17.1


