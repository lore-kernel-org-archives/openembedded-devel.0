Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 724636C614
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 05:01:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so11805026wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 21:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XW+/Ua+J7c2hZGN3+8t/QXxxl42uFdZ5tBNgt3GJMog=;
	b=kRcxRDOkRyT00bH3v6sB7ggOBjSh9mW5qCDVaNrhGvDdp5n0BBTZW2jCVpob2pu5OY
	+pLvxY/uhqyChimFLpHRf88vINrotBWxol6L+RwIj9ACmRcuu47TXWrh+PaWErUThKp6
	tPQdD0l1/Sr39rJPoh83Xpu+weG+tmDRoCB46kMWuWEkf1AZRw6kSq4pWc/drLUEft+C
	fGGv6G3nYrdXOREZGfMulSVUMgpbTXy8BX28dRlutgLJ/vAefAvGmVZLlaZgVsDZCIsx
	QI1xzgUnyKaWMl400EMsNyzNO11XJoU43ETuPSpMxTEiJUxp4oPklpmKtmnu0i+UPAH1
	U7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XW+/Ua+J7c2hZGN3+8t/QXxxl42uFdZ5tBNgt3GJMog=;
	b=VPQ9kxTrVuZxEcWDMbiifsmBz4aP3tP8MMIQlW2yBALKg8mWatBeeIr4mC1nVoiMLp
	y7d9n5aiAUuKQsflcXGYyfBHl1xeP1TyJoJ5U75jNJSKTgjvWnltblUM24FbC5hRm/f0
	EnJRODW8Q3x6riSIcRMKa1n47720gxSN8oStgHgqPzRh9MBN5P5vRK5j93fSKebHYG9T
	EynEeiA1tAD/VmgU4B20eyn9kdI5/Xt0oTqTYn9wnSEjXhdadx0+85KxZraiyT/umzkG
	q3VW819r/H4JTbOWsPsNkwgKFvJeRyJbEJ//l2lPbbaym/y4R6JBM4Hae1hPm3zNBLAK
	RCTg==
X-Gm-Message-State: AA+aEWbjnVlCkG2eg7h7ZXkyZ3teBPrUXuqYYYEFcZHoYzd4vZipqoJc
	mdqP8vwopPgrry3GvTbfDZV5JmGr
X-Google-Smtp-Source: AFSGD/XW/8fLBBzhNc0GG2BjCbGdyp6hyeQCcVXAcuKMjp8AjaePUc6xRfynGhezZL7uog7jlFfhyw==
X-Received: by 2002:a5d:4acb:: with SMTP id y11mr21589314wrs.281.1543208491405;
	Sun, 25 Nov 2018 21:01:31 -0800 (PST)
Received: from localhost.localdomain ([31.159.12.14])
	by smtp.gmail.com with ESMTPSA id
	l3sm43733086wru.36.2018.11.25.21.01.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 21:01:30 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2018 06:01:25 +0100
Message-Id: <20181126050125.17091-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: upgrade to version 2.10.8: drop my two patches, now upstream
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
X-List-Received-Date: Mon, 26 Nov 2018 05:01:31 -0000

---
 .../cpprest/cpprest/950-fix.patch             | 26 -------------
 .../cpprest/cpprest/system-brotli.patch       | 38 -------------------
 .../{cpprest_2.10.7.bb => cpprest_2.10.8.bb}  |  6 +--
 3 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/950-fix.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/system-brotli.patch
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.7.bb => cpprest_2.10.8.bb} (83%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest/950-fix.patch b/meta-oe/recipes-support/cpprest/cpprest/950-fix.patch
deleted file mode 100644
index 3ae46a115..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/950-fix.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Origin: upstream
-Bug: https://github.com/Microsoft/cpprestsdk/issues/950
-Last-Update: 2018-11-04
-
-Index: cpprest/Release/src/utilities/asyncrt_utils.cpp
-===================================================================
---- cpprest.orig/Release/src/utilities/asyncrt_utils.cpp
-+++ cpprest/Release/src/utilities/asyncrt_utils.cpp
-@@ -356,7 +356,7 @@
- inline size_t count_utf8_to_utf16(const std::string& s)
- {
-     const size_t sSize = s.size();
--    auto sData = reinterpret_cast<const UtilCharInternal_t* const>(s.data());
-+    auto const sData = reinterpret_cast<const UtilCharInternal_t*>(s.data());
-     size_t result{ sSize };
- 
-     for (size_t index = 0; index < sSize;)
-@@ -441,7 +441,7 @@
- {
-     // Save repeated heap allocations, use the length of resulting sequence.
-     const size_t srcSize = s.size();
--    auto srcData = reinterpret_cast<const UtilCharInternal_t* const>(s.data());
-+    auto const srcData = reinterpret_cast<const UtilCharInternal_t*>(s.data());
-     utf16string dest(count_utf8_to_utf16(s), L'\0');
-     utf16string::value_type* const destData = &dest[0];
-     size_t destIndex = 0;
diff --git a/meta-oe/recipes-support/cpprest/cpprest/system-brotli.patch b/meta-oe/recipes-support/cpprest/cpprest/system-brotli.patch
deleted file mode 100644
index e6f64772d..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/system-brotli.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Description: Find system brotli
-Author: Gianfranco Costamagna <locutusofborg@debian.org>
-Forwarded: https://github.com/Microsoft/cpprestsdk/pull/952
-Last-Update: 2018-11-05
-
---- cpprest-2.10.7.orig/Release/cmake/cpprest_find_brotli.cmake
-+++ cpprest-2.10.7/Release/cmake/cpprest_find_brotli.cmake
-@@ -3,8 +3,17 @@ function(cpprest_find_brotli)
-     return()
-   endif()
- 
--  find_package(unofficial-brotli REQUIRED)
- 
--  add_library(cpprestsdk_brotli_internal INTERFACE)
--  target_link_libraries(cpprestsdk_brotli_internal INTERFACE unofficial::brotli::brotlienc unofficial::brotli::brotlidec unofficial::brotli::brotlicommon)
-+  find_package(PkgConfig)
-+  pkg_check_modules(BROTLIENC libbrotlienc)
-+  pkg_check_modules(BROTLIDEC libbrotlidec)
-+  if(BROTLIDEC_FOUND AND BROTLIENC_FOUND)
-+	  target_link_libraries(cpprest PRIVATE ${BROTLIDEC_LDFLAGS} ${BROTLIENC_LDFLAGS})
-+  else(BROTLIDEC_FOUND AND BROTLIENC_FOUND)
-+    find_package(unofficial-brotli REQUIRED)
-+    add_library(cpprestsdk_brotli_internal INTERFACE)
-+    target_link_libraries(cpprestsdk_brotli_internal INTERFACE unofficial::brotli::brotlienc unofficial::brotli::brotlidec unofficial::brotli::brotlicommon)
-+    target_link_libraries(cpprest PRIVATE cpprestsdk_brotli_internal)
-+  endif(BROTLIDEC_FOUND AND BROTLIENC_FOUND)
-+
- endfunction()
---- cpprest-2.10.7.orig/Release/src/CMakeLists.txt
-+++ cpprest-2.10.7/Release/src/CMakeLists.txt
-@@ -84,7 +84,6 @@ else()
-     target_compile_definitions(cpprest PRIVATE -DCPPREST_EXCLUDE_BROTLI=1)
-   else()
-     cpprest_find_brotli()
--    target_link_libraries(cpprest PRIVATE cpprestsdk_brotli_internal)
-   endif()
- endif()
- 
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.7.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
similarity index 83%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.7.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
index 5cc6385df..c94038f8f 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.7.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
@@ -11,12 +11,10 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-outside-tests.patch \
            file://disable-test-timeouts.patch \
            file://disable-float-tests.patch \
-           file://950-fix.patch \
-           file://system-brotli.patch \
            "
 
-# tag 2.10.7
-SRCREV= "c4cef129e880a3f9c23a480e8c983793963173bb"
+# tag 2.10.8
+SRCREV= "204a52610234ac5180e80a6883b62c0ad085f51e"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


