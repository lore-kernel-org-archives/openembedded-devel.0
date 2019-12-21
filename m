Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id B29BB60291
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:55 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id y14so6070108pfm.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vM1ojXi/WpAsbJ3KZXIDDjMz4ccY4FMYToLnmdypUGQ=;
	b=dN+0iO87FLHKgrtBGNMdxw/QpoWOJZoEsvFGn1FXko4xnidufR1R6cbftN5Xfxi9o8
	V+jXJn2akbDrsrW9gYblWRt+xs8Htr1bSTwlli2HjkMDj73uFlJgY3NiGXjj41VjPFQU
	mCpCk7q+lJUzhTIrx44P/MSH9NHI5CXxI+8yO0T89H2D5WxoYvFl2pMzLKsvu5iLMW1i
	WA5LoDSI3e737Y2W00G3GPGbEI0iC19Co9yotQh8oCKadB7+5/QSkg6jWqlc+0ZoXAXh
	TMJLMeakCJkPtsRC2n8jxIPdx6Aony3NvT8ikNHJnWW7S85pHAVDwS/r18v4C/jhkLor
	v2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vM1ojXi/WpAsbJ3KZXIDDjMz4ccY4FMYToLnmdypUGQ=;
	b=GxEPDgZ0mbZBSyCEUR4pX5huUH42ERz18TZhxhhyRS5e4vjTc07GVkacf7i6azvq4B
	gwJn2eIs/t5ACIwqduCcXFiq09oJuOXcypSDNSQ4F76lR56pWCREvuLXM7oi923ej75w
	guEDZbibctOlTVQEfmn7gUrbDUw81eC3H5xYbwqS3RvOtkmzagJXQ3q1vZ/h7v4BV2EI
	UQoQV/rrynOdMGTyJsZNkT3ENwhKxRzcMyHcB45sD5TZz9WCSfwDh9H32+mFLWojzl8K
	q1BCN8x64UsG0vN+End6ER25Vl7m2/48A2J/ygeR46IocVeApO9Uzh5is1P3rVaSDApT
	2Q9Q==
X-Gm-Message-State: APjAAAWaT7YagAnLM7sxra6MrID6l5j5OugkWjnE2Gdtz2e2quv9+YRL
	WprHnsiBoBY1nGlQBtFqrrME/HbDk3Y=
X-Google-Smtp-Source: APXvYqxPIs3xme5j2QaHRxV7m+uRW/Jz51709mIgbY7Hpqbk3SzRkvJw/awSzOrmcyFv2JWlBNlCIQ==
X-Received: by 2002:a63:6e0e:: with SMTP id j14mr17409476pgc.361.1576886816260;
	Fri, 20 Dec 2019 16:06:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:25 -0800
Message-Id: <20191221000635.1573390-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 13/23] thrift: Upgrade to 0.13
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:55 -0000
Content-Transfer-Encoding: 8bit

License-Update: Copyright years changed

Fix build for multilib
Use python3 during build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onPaths.cmake-Define-libdir-in-terms.patch | 42 +++++++++++++++++++
 .../{thrift_0.12.0.bb => thrift_0.13.0.bb}    | 13 +++---
 2 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.12.0.bb => thrift_0.13.0.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
new file mode 100644
index 0000000000..485d7a4b0b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
@@ -0,0 +1,42 @@
+From a07e56e1a2e70a9b81eb0a65f345cf45a7a93a81 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 21:56:23 -0800
+Subject: [PATCH] DefineInstallationPaths.cmake: Define libdir in terms of
+ LIB_SUFFIX
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/cmake/DefineInstallationPaths.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/build/cmake/DefineInstallationPaths.cmake
++++ b/build/cmake/DefineInstallationPaths.cmake
+@@ -22,11 +22,11 @@
+ set(BIN_INSTALL_DIR "bin" CACHE PATH "The binary install dir (default: bin)")
+ set(LIB_INSTALL_DIR "lib${LIB_SUFFIX}" CACHE PATH "The library install dir (default: lib${LIB_SUFFIX})")
+ set(INCLUDE_INSTALL_DIR "include" CACHE PATH "The library install dir (default: include)")
+-set(CMAKE_INSTALL_DIR "lib/cmake" CACHE PATH "The subdirectory to install cmake config files (default: cmake)")
+-set(PKGCONFIG_INSTALL_DIR "lib/pkgconfig" CACHE PATH "The subdirectory to install pkgconfig config files (default: lib/pkgconfig)")
++set(CMAKE_INSTALL_DIR "lib${LIB_SUFFIX}/cmake" CACHE PATH "The subdirectory to install cmake config files (default: cmake)")
++set(PKGCONFIG_INSTALL_DIR "lib${LIB_SUFFIX}/pkgconfig" CACHE PATH "The subdirectory to install pkgconfig config files (default: lib/pkgconfig)")
+ set(DOC_INSTALL_DIR "share/doc" CACHE PATH "The subdirectory to install documentation files (default: share/doc)")
+ set(prefix "${CMAKE_INSTALL_PREFIX}")
+ set(exec_prefix "${CMAKE_INSTALL_PREFIX}/bin")
+-set(libdir "${CMAKE_INSTALL_PREFIX}/lib")
++set(libdir "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
+ set(includedir "${CMAKE_INSTALL_PREFIX}/include")
+ set(cmakedir "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DIR}")
+--- a/build/cmake/DefineCMakeDefaults.cmake
++++ b/build/cmake/DefineCMakeDefaults.cmake
+@@ -44,8 +44,8 @@ include(BuildType)
+ # top of the build tree rather than in hard-to-find leaf
+ # directories. This simplifies manual testing and the use of the build
+ # tree rather than installed thrift libraries.
+-set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
+-set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
++set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib${LIB_SUFFIX})
++set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib${LIB_SUFFIX})
+ set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
+ 
+ #
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.12.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.12.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb
index 1c69951bf9..92bcb21bf1 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.12.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb
@@ -4,18 +4,19 @@ HOMEPAGE = "https://thrift.apache.org/"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=394465e125cffc0f133695ed43f14047 \
-                    file://NOTICE;md5=42748ae4646b45fbfa5182807321fb6c"
+                    file://NOTICE;md5=2659b43daca219f99a2f2626ea128f73"
 
 DEPENDS = "thrift-native boost flex-native bison-native openssl"
 
-SRC_URI = "https://www-eu.apache.org/dist/thrift//${PV}/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "3deebbb4d1ca77dd9c9e009a1ea02183"
-SRC_URI[sha256sum] = "c336099532b765a6815173f62df0ed897528a9d551837d627c1f87fadad90428"
+SRC_URI = "https://www-eu.apache.org/dist/thrift//${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
+          "
+SRC_URI[md5sum] = "38a27d391a2b03214b444cb13d5664f1"
+SRC_URI[sha256sum] = "7ad348b88033af46ce49148097afe354d513c1fca7c607b59c33ebb6064b5179"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit pkgconfig cmake pythonnative
+inherit pkgconfig cmake python3native
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
-- 
2.24.1


