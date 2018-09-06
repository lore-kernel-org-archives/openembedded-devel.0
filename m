Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD69796C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:29 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id v66-v6so5551320pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6K92l1t+r6c0JFqJTYkSvxqJ5IH5fq+VOX5WQMF2+dk=;
	b=RoBTHytZ/AYOx00o0xobVGmHx1vF2ul4sj99H8ELqg51N++AJ/aoT+WTlVvJ9F5IFk
	YaU7J+d0pfgHCWiea+nKtKVWuZWqYZ8juiVYUk1u5QPznkHF7pPv6ElNaE/YZfkApNRP
	m2r9PyloXqG0m/EdlmJ2x3mRG+1sTgBeChv1fK4zrLQwIsiPiYj+Snhp21xYwe9KBr3N
	eZWsJCfHWvb5p46Yt0PwiSkIUNTLvrDcxjv46TTINjggIP5nfs8lejnqeTWHJGJMUtu1
	lby2k38ULFoL4Jcfl32xxCsKrSX5E5gceqyX4/yLuKv7vGCojICRMizlf/Pu1gHvLbPr
	TmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6K92l1t+r6c0JFqJTYkSvxqJ5IH5fq+VOX5WQMF2+dk=;
	b=jjdnLYZZd2vQGjlSqcCrEfmz1TRWSmroVOD1H47lYZcLKUIBCUBM7tlojZXYx2EQbr
	l0tAuOVSX1fkCRK2IHdooQdcmdhg79Q/1ge+qlQebI/ClvbKYrXK/oyymAn1RskSetwX
	lBNJqL3eVtj5US1qTzlRbihPuvt3QTC+McFoZRnQyq53k1OUKn3dkGlKEWWfdtYfFR3H
	jRQBeyOOc+0jWgCqV0OrQPFWVuF08ONa455BtJhDGmBI1cvgkUDJPJ4u3AXmtBCEL9HD
	YO0v4Z7Ixc9QmFDZZ0IRUi52E+yYHKSWr4eL4jjy9aiH12utFj1QNHYwRiO4D44Od1R5
	fydg==
X-Gm-Message-State: APzg51ArUwQMi47t+Yhz1N9di1Ce401fTpkmK822ONfTrKAxIKrkUIe2
	SNwP8W7IvULDFkFcX1puAhRLp7/X
X-Google-Smtp-Source: ANB0Vda2o5G09rx+XxAHBzAWqHGMfzxMQmDMtZ1+Z/TSmOks4RWWJMY58bEHZH1/WlBn+v2AYHr4uA==
X-Received: by 2002:a62:7f0c:: with SMTP id
	a12-v6mr3928239pfd.257.1536254549658; 
	Thu, 06 Sep 2018 10:22:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:02 -0700
Message-Id: <20180906172210.42551-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/17] poco: Fix cross compilation
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:29 -0000

Backport a pull request to fix build error seen during cross compiling

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tall-non-existing-Encodings-testsuit.patch | 31 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.9.0.bb    |  5 +--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch

diff --git a/meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch b/meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch
new file mode 100644
index 0000000000..f4a358f47f
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch
@@ -0,0 +1,31 @@
+From fa079dfc5e1d22ea35762bf4c5b09999bdc5e731 Mon Sep 17 00:00:00 2001
+From: Jochen Sprickerhof <git@jochen.sprickerhof.de>
+Date: Wed, 22 Aug 2018 21:42:09 +0200
+Subject: [PATCH] Don't try to install non existing Encodings/testsuite/data
+
+Upstream-Status: Backport [https://github.com/pocoproject/poco/pull/2437]
+---
+ Encodings/testsuite/CMakeLists.txt | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/Encodings/testsuite/CMakeLists.txt b/Encodings/testsuite/CMakeLists.txt
+index 7508e5522..79495ae02 100644
+--- a/Encodings/testsuite/CMakeLists.txt
++++ b/Encodings/testsuite/CMakeLists.txt
+@@ -19,12 +19,9 @@ POCO_SOURCES_AUTO_PLAT( TEST_SRCS WINCE
+ add_executable( ${TESTUNIT} ${TEST_SRCS} )
+ if(ANDROID)
+ 	add_test(NAME ${LIBNAME} WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
+-			COMMAND ${CMAKE_COMMAND} -DANDROID_NDK=${ANDROID_NDK} "-DTEST_FILES=${CMAKE_CURRENT_SOURCE_DIR}/data;" -DLIBRARY_DIR=${CMAKE_BINARY_DIR}/lib -DUNITTEST=${CMAKE_BINARY_DIR}/bin/${TESTUNIT} -DTEST_PARAMETER=-all -P ${CMAKE_SOURCE_DIR}/cmake/ExecuteOnAndroid.cmake)
++			COMMAND ${CMAKE_COMMAND} -DANDROID_NDK=${ANDROID_NDK} -DLIBRARY_DIR=${CMAKE_BINARY_DIR}/lib -DUNITTEST=${CMAKE_BINARY_DIR}/bin/Encodings-testrunner -DTEST_PARAMETER=-all -P ${CMAKE_SOURCE_DIR}/cmake/ExecuteOnAndroid.cmake)
+ else()
+ 	add_test(NAME ${LIBNAME} WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} COMMAND ${TESTUNIT} -all)
+-	# The test is run in the build directory. So the test data is copied there too
+-	add_custom_command(TARGET ${TESTUNIT} POST_BUILD
+-				   COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/data ${CMAKE_CURRENT_BINARY_DIR}/data )
+ endif()
+ #set_target_properties( ${TESTUNIT} PROPERTIES COMPILE_FLAGS ${RELEASE_CXX_FLAGS} )
+ target_link_libraries( ${TESTUNIT}  PocoEncodings PocoFoundation CppUnit )
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-support/poco/poco_1.9.0.bb b/meta-oe/recipes-support/poco/poco_1.9.0.bb
index a4f8a05188..258cc4994f 100644
--- a/meta-oe/recipes-support/poco/poco_1.9.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.9.0.bb
@@ -9,10 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 DEPENDS = "libpcre zlib"
 
 SRC_URI = " \
-    git://github.com/pocoproject/poco.git \
+    git://github.com/pocoproject/poco.git;branch=poco-${PV} \
+    file://0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch \
     file://run-ptest \
    "
-SRCREV = "94966785a8f9ad0191dffd075ebd67826e6e4b6d"
+SRCREV = "daf00da73ab917e4d4581e3aa00c0ee61e0cc58b"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


