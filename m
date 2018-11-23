Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E03D6CA92
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:39:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k198so12416116wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=G9gzBWwSW0L99O/wotLnxNpKc56+QUNmQJ8488oq3EQ=;
	b=0hroUJik7A3hsTgD5/SWl4/vRSldhhvzPz9s5a+qcz4fK1CMpgUyJhkCb724xI9cV0
	s7ou+r1gXnKQxQWqY8YW+WXoNrQJN6zV1XV7XpplEpugnc63vc91+83UrvzL8LILEJ6f
	LremJCpcZUQA/eovbDiJ4uM4PA2TWKcGnOKBYID+y/WtTmyIPpQXkb3HpkZAdehB3KF3
	LlftpYV/TVx9sRtOZh8WzI8HRvBLyS8PavHd3jb0Jo0WU4RDV2F5Gl+LjlYHCW/rlRqJ
	IPEPf/ZFLob2rM9z6yZf9ITCeLa3QpOdM3H5wvH6JpZG/XwzksxRii1nhhtk4y68/TSn
	PvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G9gzBWwSW0L99O/wotLnxNpKc56+QUNmQJ8488oq3EQ=;
	b=DunokWUTW3dd0alH91IUCZv2hv7VfZ2IFaL1bZK5W9c2tL5KiYQHKoYN8r+l2Hi2LI
	T3xKXT0VRSpE/lnJ2V1pxDLL2o4jQcNGzc24BRBhQLdylVxWBn8O0e+fNRU3O/0sp/wl
	GzVNcSTubqjScdY0ky9h6+0YPz9kvI5ntOWM7t5kqGXwSl/5fgrLhBo6HscrVe8ln7Fh
	WPU7rTFWXWqCwSz0XLiRMg175Q8k8z34ccd2+pcPjiIE62s8elcpSYFdBqfqpvTTw68Z
	x7o6mGSv0LaUD0YyrPR81XxU9Hwy9BS2qqw0ESlFtzKEpr61c6rWUEHvpg+oJwsIfz7R
	izNQ==
X-Gm-Message-State: AGRZ1gLchl+eQhZYwt3mYYhV4HxbwLatV1DeH6xkWvCrFsGl8XEsUHxU
	jbeDGtZaSugwZrfsrlOwnShksvlvwnw=
X-Google-Smtp-Source: AFSGD/UlEZY0x+WXT2FZHyYIwsuZ44F8WD8CY9mU8ZumxDyShEmO/4rkshiYwT9GE0W1o1ZF59V/bA==
X-Received: by 2002:a1c:81c6:: with SMTP id c189mr13708779wmd.86.1542987590664;
	Fri, 23 Nov 2018 07:39:50 -0800 (PST)
Received: from debian-brgl.home (lfbn-mar-1-609-89.w90-118.abo.wanadoo.fr.
	[90.118.185.89]) by smtp.gmail.com with ESMTPSA id
	u10sm9983953wrr.33.2018.11.23.07.39.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 07:39:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Nov 2018 16:39:38 +0100
Message-Id: <20181123153941.10186-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123153941.10186-1-brgl@bgdev.pl>
References: <20181123153941.10186-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/6] doxygen: new native package
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
X-List-Received-Date: Fri, 23 Nov 2018 15:39:50 -0000
Content-Transfer-Encoding: 8bit

Doxygen binary is necessary to generate C++ bindings for libsigrok.

We're adding this as a native-only package since it's very unlikely
it would be needed on any target.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../doxygen/doxygen-native_1.8.14.bb          | 15 ++++++++
 .../0001-build-don-t-look-for-Iconv.patch     | 36 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb b/meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb
new file mode 100644
index 000000000..38157085e
--- /dev/null
+++ b/meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Doxygen is the de facto standard tool for generating documentation from annotated C++ sources."
+HOMEPAGE = "http://www.doxygen.org/"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit cmake python3native native
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "ftp://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz \
+           file://0001-build-don-t-look-for-Iconv.patch"
+
+SRC_URI[md5sum] = "41d8821133e8d8104280030553e2b42b"
+SRC_URI[sha256sum] = "d1757e02755ef6f56fd45f1f4398598b920381948d6fcfa58f5ca6aa56f59d4d"
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
new file mode 100644
index 000000000..0eefe0729
--- /dev/null
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
@@ -0,0 +1,36 @@
+From f3a6c05e3a8afdac547c6c8176fa6b57636db65c Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Fri, 23 Nov 2018 11:44:56 +0100
+Subject: [PATCH] build: don't look for Iconv
+
+Drop the find_package() for Iconv. CMake is unable to find iconv.h in
+native build but all modern systems supply it as part of the standard
+C library. We don't need this check in meta-openembedded.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+
+Upstream-status: Inappropriate
+- upstream doxygen must build on many architectures, this change is
+  too intrusive for upstream
+---
+ CMakeLists.txt | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ba105b89..16252247 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -89,10 +89,6 @@ if (sqlite3)
+     find_package(SQLite3 REQUIRED)
+ endif()
+ 
+-find_package(Iconv REQUIRED)
+-include_directories(${ICONV_INCLUDE_DIR})
+-
+-
+ #set(DOXYDOCS ${CMAKE_SOURCE_DIR}/doc CACHE INTERNAL "Path to doxygen docs")
+ set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
+ set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
+-- 
+2.19.1
+
-- 
2.19.1


