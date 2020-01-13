Return-Path: <sumit.garg@linaro.org>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9AA7FC93
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 15:34:16 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id d5so4300545pjz.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 07:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=SBOJtA4ecAVM5rqONH5boyNW8WjmaUTIK5taycT25XM=;
	b=yss3HRm3GuL0BBgYFe3OqXyQO/hRuMWPqdf0PECoq45ldzl6pVSoBCcthYP5yj72Yl
	+8rOuoAPHBDxAfkVK1WKF3/WBglt/mgckzob1BduHeENzeR9u093x/H0HblUBlm4sbil
	4zWc6HRNWxNw01Bfy/+oyaofLEqrUC54wltt3JSBQo/17qqFBR90yMILGCApQzAcGaI3
	Z/9ZsBINkDyvIJ6EWKldsiYsUyZsrr3YL1XG95kY7ru3i4iLWYWK2bDzHMYNFTqPpIxy
	FNwfAK3ujstMeqOJw2GZ+IdOPNzQ1UT+BJ3ZNcI6RepfX2HNvPc5V4QoGT+NmLYWOq7r
	W61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SBOJtA4ecAVM5rqONH5boyNW8WjmaUTIK5taycT25XM=;
	b=SVgRzC5RvUlcCiapuKuVDV+8b4p98TaSV7pPQPmHzwkxTMtnxRwzI5SbLAQ9bcrtpl
	B01QpV2gPJRe3b/fMcKjplloJbcmpERAXXd2xQSnuvkLdtnsTHvfdSEuSoyvgDC7UyWm
	5IoEXILTjq26816XwekkzJn7epFGOr4dUMEMlHrUF2PEnNJXbc3mpCP7G8eaTVNdwWQb
	GiKkLr60L7nyIkiRyn/mzVqAbc2yen1vaawmAd3OvnCJ9Yubr2e7oV2AWo05J8Fs1Ybi
	rNVxdDTTRmrZ603hG78UpMpgYhQ1GEFdJT/JgG6qvV3YqzZxThvoPPPUcC+JPVxhpW2a
	K7yQ==
X-Gm-Message-State: APjAAAUA7sj6lCV+heKU9hjr4IH42INP9VxGeai6CshWUPUeBB/RB1VF
	I87i+gOTRURYyUYc80a+muu0tn5YsOY=
X-Google-Smtp-Source: APXvYqzUygkBH7CLOvA6Dy6tAqKy+Zvv0bNug4HPFfoQ1dRPzqyPIdiw6KqEVd/HSdYZC1c4CosmYQ==
X-Received: by 2002:a17:90b:3004:: with SMTP id
	hg4mr23054085pjb.52.1578929656901; 
	Mon, 13 Jan 2020 07:34:16 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	d14sm15665211pfq.117.2020.01.13.07.34.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jan 2020 07:34:16 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 21:03:53 +0530
Message-Id: <1578929633-22220-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Cc: daniel.thompson@linaro.org
Subject: [meta-oe][PATCH] mariadb: fix library LZ4 lookup
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
X-List-Received-Date: Mon, 13 Jan 2020 15:34:16 -0000

While cross-compiling mariadb package it tries to link lz4 library
present in the target sysroot and if not found it tries to link host
lz4 library which is incorrect leading to linker errors. So fix that
via restricting lz4 library lookup to target sysroot only.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc              |  1 +
 .../mariadb/0001-Fix-library-LZ4-lookup.patch      | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 1c1b8a0..23de69d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
            file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \
+           file://0001-Fix-library-LZ4-lookup.patch \
           "
 SRC_URI[md5sum] = "d0de881ab8ead46928cafb7d558535c1"
 SRC_URI[sha256sum] = "4c076232b99433b09eb3c6d62f607192b3474d022703699b8f6aef4e79de3fb9"
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


