Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C16AC48BD7
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:46:20 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.13473.1700055977402765609
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FSaFHEcQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5a7c011e113so79241217b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 05:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700055976; x=1700660776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FVc64hHjvchIIlOtbDOC2HEzARxeNyf/ksilzyJRXUY=;
        b=FSaFHEcQn5t7wZqGPP5+uQP5/HBmBSDYREkWdwejueQ63riUBONu+spuIuJdGGToUb
         kSjVnDDnnlwF2qrspFMCyN8QcRcbtAWk/aoCSfAlXcNEPmYYiz+k5DX25TYI5IQoL3HI
         qjKc/2BRYaBsGPIIBxreOfYw3nGx4f8WXgEgW8AO7SrE+5Xm3fx+pVE5/5NWmxmNFfHy
         iojSqDLjJeF8TMmltZZGo5sXdg2NTQ/LdZ4W2HKnex7HQuCi22Lg9Fy13gyAGOl8h/0Y
         zAVcNtOI3lPGSGxwKxS7rvh3qcw8p1tBMCUcO/3N7dvS8VoUoZZn6A174kLXOcBur4vH
         LTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700055976; x=1700660776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVc64hHjvchIIlOtbDOC2HEzARxeNyf/ksilzyJRXUY=;
        b=KhltHakAk5B6IfmubvNxvxnnslM+DO+fZ9G6j6QsIZpVTEL39C1s84TJT3x9YUpZ/e
         v/DCSSR9ngOEBFIYE76QAxA42EiCdAETeqU99JaFPPAU0iKpsTo+Y03xlvq6by/fy/v3
         hZGnYyRikyxOuK92aDMa1nJHD1fXRCK0BlB/TRx6/rOoNiTFAMatSu+WSDKqSmqSiOa6
         3eejSbkSGe+83zmjrSOxwVtwnt/59/891gyIr5+xO3WMDLPNUB1kV+84C9MhzMH2YeeU
         M62WE3qFPKkhpYZYD1t7pepNQoRMqI8PAYJGyarWyjFrDT8Ay47k4ioBYSZP3/Fn3vCg
         ZVYQ==
X-Gm-Message-State: AOJu0YxhWp1WFS82OpcoOQuq09WRkMST6GbwJfMu+HcOVPI9mwegCaUl
	3EIxbziIqaP5s84rI8VMF9zRoEhJPWo=
X-Google-Smtp-Source: AGHT+IHAyckEfbSQGMG5oiSLY/gD8cfAzX/BdKXkBQx1FxYcDo8uS61v1UvG/kmEbp33XJG592Di6w==
X-Received: by 2002:a81:a18b:0:b0:5b3:2ebc:30e3 with SMTP id y133-20020a81a18b000000b005b32ebc30e3mr13356896ywg.14.1700055976064;
        Wed, 15 Nov 2023 05:46:16 -0800 (PST)
Received: from keaua.. ([12.110.163.194])
        by smtp.gmail.com with ESMTPSA id x190-20020a0deec7000000b0057d24f8278bsm366569ywe.104.2023.11.15.05.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:46:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH] nlohmann-json: Add ptest support
Date: Wed, 15 Nov 2023 08:46:14 -0500
Message-Id: <20231115134614.17521-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 13:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106761

From: Mingli Yu <mingli.yu@windriver.com>

* Backport 2 patches [1] [2] to fix the build failure under tests dir.

* Fetch the test data during do_fetch phase to avoid internet access
during test as some tests need test data.
 # ./run-ptest
PASS: test-algorithms_cpp11
PASS: test-allocator_cpp11
PASS: test-alt-string_cpp11
PASS: test-assert_macro_cpp11
PASS: test-binary_formats_cpp11
[snip]
PASS: test-unicode5_cpp11
PASS: test-user_defined_input_cpp11
PASS: test-windows_h_cpp11
PASS: test-wstring_cpp11

[1] https://github.com/nlohmann/json/commit/6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee
[2] https://github.com/nlohmann/json/commit/660d0b58565073975d6f5d94365d6cbf150a4cf8

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 013b4d50432a3eba08a9cb54b9edf6b25a6378a8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...tors-define-missing-rebind-type-3895.patch | 61 +++++++++++++++++++
 ...tors2-use-std-ranges-equals-for-rang.patch | 31 ++++++++++
 .../nlohmann-json/files/run-ptest             | 12 ++++
 .../nlohmann-json/nlohmann-json_3.11.2.bb     | 22 ++++++-
 4 files changed, 123 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
 create mode 100755 meta-oe/recipes-devtools/nlohmann-json/files/run-ptest

diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch b/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
new file mode 100644
index 0000000000..d964586c1c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
@@ -0,0 +1,61 @@
+From 6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Wed, 8 Mar 2023 11:31:56 +0000
+Subject: [PATCH] custom allocators: define missing 'rebind' type (#3895)
+
+Upstream-Status: Backport [https://github.com/nlohmann/json/commit/6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/src/unit-allocator.cpp   | 9 +++++++++
+ tests/src/unit-regression2.cpp | 9 +++++++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/tests/src/unit-allocator.cpp b/tests/src/unit-allocator.cpp
+index 76e3b03f..f2e63552 100644
+--- a/tests/src/unit-allocator.cpp
++++ b/tests/src/unit-allocator.cpp
+@@ -20,11 +20,20 @@ struct bad_allocator : std::allocator<T>
+ {
+     using std::allocator<T>::allocator;
+ 
++    bad_allocator() = default;
++    template<class U> bad_allocator(const bad_allocator<U>& /*unused*/) { }
++
+     template<class... Args>
+     void construct(T* /*unused*/, Args&& ... /*unused*/)
+     {
+         throw std::bad_alloc();
+     }
++
++    template <class U>
++    struct rebind
++    {
++        using other = bad_allocator<U>;
++    };
+ };
+ } // namespace
+ 
+diff --git a/tests/src/unit-regression2.cpp b/tests/src/unit-regression2.cpp
+index 2bb9b32e..dbafb436 100644
+--- a/tests/src/unit-regression2.cpp
++++ b/tests/src/unit-regression2.cpp
+@@ -189,6 +189,15 @@ class my_allocator : public std::allocator<T>
+ {
+   public:
+     using std::allocator<T>::allocator;
++
++    my_allocator() = default;
++    template<class U> my_allocator(const my_allocator<U>& /*unused*/) { }
++
++    template <class U>
++    struct rebind
++    {
++        using other = my_allocator<U>;
++    };
+ };
+ 
+ /////////////////////////////////////////////////////////////////////
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch b/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
new file mode 100644
index 0000000000..463912e4b6
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
@@ -0,0 +1,31 @@
+From 660d0b58565073975d6f5d94365d6cbf150a4cf8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Arsen=20Arsenovi=C4=87?= <arsen@aarsen.me>
+Date: Sun, 5 Mar 2023 14:11:22 +0100
+Subject: [PATCH] tests/unit-iterators2: use std::ranges::equals for range
+ comparisons (#3950)
+
+Closes https://github.com/nlohmann/json/issues/3927
+
+Upstream-Status: Backport [https://github.com/nlohmann/json/commit/660d0b58565073975d6f5d94365d6cbf150a4cf8]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/src/unit-iterators2.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/src/unit-iterators2.cpp b/tests/src/unit-iterators2.cpp
+index 27926084..72a5d9dc 100644
+--- a/tests/src/unit-iterators2.cpp
++++ b/tests/src/unit-iterators2.cpp
+@@ -943,7 +943,7 @@ TEST_CASE("iterators 2")
+                 json j_expected{5, 4, 3, 2, 1};
+ 
+                 auto reversed = j | std::views::reverse;
+-                CHECK(reversed == j_expected);
++                CHECK(std::ranges::equal(reversed, j_expected));
+             }
+ 
+             SECTION("transform")
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest b/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
new file mode 100755
index 0000000000..2f00267d50
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd tests
+for atest in test-* ; do
+    rm -rf tests.log
+    ./${atest} > tests.log 2>&1
+    if [ $? = 0 ] ; then
+        echo "PASS: ${atest}"
+    else
+        echo "FAIL: ${atest}"
+    fi
+done
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
index 74e40942a5..694d632cb1 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
@@ -7,22 +7,38 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
 CVE_PRODUCT = "json-for-modern-cpp"
 
 SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
-           "
+           git://github.com/nlohmann/json_test_data.git;destsuffix=git/json_test_data;name=json-test-data;branch=master;protocol=https \
+           file://0001-custom-allocators-define-missing-rebind-type-3895.patch \
+           file://0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch \
+           file://run-ptest \
+"
 
 SRCREV = "bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d"
+SRCREV_json-test-data = "a1375cea09d27cc1c4cadb8d00470375b421ac37"
+
+SRCREV_FORMAT = "json-test-data"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
 
-EXTRA_OECMAKE += "-DJSON_BuildTests=OFF"
+EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DJSON_BuildTests=ON -DJSON_TestDataDirectory=${PTEST_PATH}/json_test_data', '-DJSON_BuildTests=OFF', d)}"
 
 # nlohmann-json is a header only C++ library, so the main package will be empty.
 ALLOW_EMPTY:${PN} = "1"
 RDEPENDS:${PN}-dev = ""
+RDEPENDS:${PN}-ptest = "perl"
 
 BBCLASSEXTEND = "native nativesdk"
 
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -r ${S}/json_test_data/ ${D}${PTEST_PATH}/
+    cp -r ${B}/tests/test-* ${D}${PTEST_PATH}/tests
+}
+
+
 # other packages commonly reference the file directly as "json.hpp"
 # create symlink to allow this usage
 do_install:append() {
-- 
2.34.1


