Return-Path: <sumit.garg@linaro.org>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7851E7FD63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 09:09:22 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k3so1140239pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 01:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=T6kY38LNDLf/obih8BP2l8za5p/MdjtQjRF44p5pVJs=;
	b=NYVzusrXQ1I7qOyuax9nROajsSOAJs+XC34CdENKsbQ3tDl43sZS0dxmQA9hlWpzfF
	rhNpF4/ycAz29liLPOJOLsd1iASBfSOH6OWLOlNRRpucY6GXfIYlueNBMr1WnEhTpAV3
	S+Z6InVJemluvpOtwK/TBnwxIFYtZAhb5CiwllsQla6cNro2rBAPfPcYzo6cD2AhWotF
	aHJJnxBL29BWwtlMHfB/8cPEcMiNSrFCHUS50z4LX/wWOXWyI1TOgQMH4/CowWe7oSnj
	vd3wzQYcXr1USfUn49uSwnKbxCL2nUJAUfPQNCZmt1ijsb0WD8StuefH+FOwI4r4uhp2
	d5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T6kY38LNDLf/obih8BP2l8za5p/MdjtQjRF44p5pVJs=;
	b=o1AQV/fL/ZttqMGi8l/w9MS/hDOkdB50Tik/tMGRBxglIYRJ+3KdgscRxzcibVq7YV
	2WcFxHluEa9YGY/QjzC8WW/XHX/FgcaLVy2obAjFPOYNjNPnUCFFK0F1ANP+VJKaDvSD
	bKSPQQbRR+Wirs53tX5msSmmhR/CoGY/TkejopH26pYozIK07v8LbCg+Ict7jbDwpm7b
	LdSAaGPSf/FUzR56npbo9Jb8EORlPeGTEZvAN8gzLFur4wHbthgX8MwZfwTGikXzmZXf
	VXK9FKBgfYbiJGrOeEswR++t8YDkuUpI7eAIoA0C9P9aMKGf1Dn09s87LYZpW0kdnoUE
	YFpw==
X-Gm-Message-State: APjAAAWj7AATE/9D+q2WFS6gr3Gr3iIJ1P+vsJ9C6CtcMvfl/NGMEmW6
	O+7aA/cycNWP0Zb2f1/TB+g/uK0fjlY=
X-Google-Smtp-Source: APXvYqzTWZGCRUgJ9n+E3tEhQ+Uz+1Qxr7Ebkl6GVR+x2Ca9jkHbWlirzJhBVus/rGAN+b76piYCWw==
X-Received: by 2002:a63:c20c:: with SMTP id b12mr4192396pgd.407.1579597763120; 
	Tue, 21 Jan 2020 01:09:23 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	133sm42216886pfy.14.2020.01.21.01.09.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jan 2020 01:09:22 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 14:39:04 +0530
Message-Id: <1579597744-25270-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Cc: daniel.thompson@linaro.org
Subject: [meta-oe][zeus][PATCH] mariadb: fix library LZ4 lookup
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
X-List-Received-Date: Tue, 21 Jan 2020 09:09:22 -0000

While cross-compiling mariadb package it tries to link lz4 library
present in the target sysroot and if not found it tries to link host
lz4 library which is incorrect leading to linker errors. So fix that
via restricting lz4 library lookup to target sysroot only.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Backport to zeus.

 meta-oe/recipes-dbs/mysql/mariadb.inc              |  1 +
 .../mariadb/0001-Fix-library-LZ4-lookup.patch      | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index e1ae58a..703e172 100644
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
index 0000000..574dfd3
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
2.7.4


