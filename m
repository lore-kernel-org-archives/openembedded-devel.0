Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 534487991E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 22:08:02 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w14-v6so3204878plp.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 15:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v6/eATZqgskk00PeUwkdgPOVu62feRWnpgZnS9STQss=;
	b=HiBg70D5wFvv1cvxwrPVasS6SMyCmk41m0VVfait4v2+1lwP7bVBfkf1NF0Zjsmbtu
	7rxOVq4Ej+i2AGQ4U6QKyHfDOAFw9V/LOV0PuxWzs5+zVviUJEjfBYdRZ+xP6WmdK4MX
	wG9d5yN2rYa8b7VuuCtcIWGn+wiw2GcjqtgSnVKd2b7JOy6OOAgmw4p9mB0xVLLT7ZlO
	eZ0KKjjbr/6bXlxPZXDICJ04cGvc+AzXTsBohEbTzRavDxLTPVH4mMcFU7kmZsqjx+VH
	JidL9RQE6/hovUOjK36gQBB+hJzwzxj/Rz7awvQk/OcFdqA30glb/RPm7Vao2XLnSSJ/
	k8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v6/eATZqgskk00PeUwkdgPOVu62feRWnpgZnS9STQss=;
	b=fZ2McsszPaiN7ryuGOq1ZWsCb3T+Db8bWvqmxFMjBSypqeCpLWas9m39NpprihrXsl
	EfQidiUQaaLLq8T4nL8f/hf1px5Em7fquo0R6cF/VgqdCk4YyI+BWlc+OjqEsLsRoyJO
	KNvx6iY2Eb0NKvu8jJgYn5qb69P+g98yRGrjA31w4iFaxnRGdlBnN2qnxKrQRUKVAmoh
	QY+0bRKOMOkHTR41eYzH7ZPKSaoLAcxEw/IMDA9D/AVb3KztKNZ4SWmf2vbG4sfMmLeG
	uQ2OXNxafMcCD5sAhz/ELfUF7R8L1Yg8aCLVrWzKCqk7qmCyjE21kMNiFjBG8+QWWLNj
	XBNQ==
X-Gm-Message-State: APzg51BfnX4+ov4FIqn31208v5W3MtLTXFu71ALGjjWnAePM/FcAomCK
	ZXs1HIlnIF63GnWXv/fY/9DfPy0s
X-Google-Smtp-Source: ANB0VdZDOVrqUkXhA+XPG2hjhVt8PjO6Mnc0yB9hIM+c9Y+jRkAFrZxtFLVU+PlrnpwZXaCD3atGow==
X-Received: by 2002:a17:902:b7c3:: with SMTP id
	v3-v6mr9116465plz.238.1536876482822; 
	Thu, 13 Sep 2018 15:08:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm6645417pfp.6.2018.09.13.15.08.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Sep 2018 15:08:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Sep 2018 15:07:54 -0700
Message-Id: <20180913220754.38856-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] thrift: Refresh patches
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
X-List-Received-Date: Thu, 13 Sep 2018 22:08:02 -0000
Content-Transfer-Encoding: 8bit

Make devtool happy patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Forcibly-disable-check-for-Qt5.patch   |  6 ++----
 ...-cmake-avoid-use-of-both-quoted-paths-.patch |  8 +++-----
 ...in-test-cpp-explicitly-use-signed-char.patch | 14 ++++++--------
 ...enable-build-with-OpenSSL-1.1.0-series.patch | 17 +++++++++++++++--
 ...mpile-error-in-TSSLSocket.cpp-with-new.patch |  6 +++---
 ...+-library-build-fails-if-OpenSSL-does-.patch | 13 +++++++------
 6 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch
index fcc2f08214..a77cd284b4 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch
@@ -1,9 +1,10 @@
-From b3da0d8677b7e8467367a303c18551c56ed20e15 Mon Sep 17 00:00:00 2001
+From a5544d8e543436e413379422b702f6f56ac7eb8e Mon Sep 17 00:00:00 2001
 From: Philip Balister <philip@balister.org>
 Date: Tue, 12 Apr 2016 17:30:15 -0400
 Subject: [PATCH] Forcibly disable check for Qt5.
 
 Signed-off-by: Philip Balister <philip@balister.org>
+
 ---
  build/cmake/DefineOptions.cmake | 3 ---
  1 file changed, 3 deletions(-)
@@ -22,6 +23,3 @@ index 62e240f..f8b4493 100644
  if(${WITH_QT4} AND ${WITH_QT5} AND ${CMAKE_MAJOR_VERSION} LESS 3)
    # cmake < 3.0.0 causes conflict when building both Qt4 and Qt5
    set(WITH_QT4 OFF)
--- 
-2.5.5
-
diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch
index 7cc8d17393..182eacc0ef 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch
@@ -1,7 +1,7 @@
-From bc577820ad25795543b31f123e309cdaebc7d6c6 Mon Sep 17 00:00:00 2001
+From b8e254a2f4ba49412e541598c72159869a7770f8 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Mon, 16 May 2016 15:21:10 -0400
-Subject: [PATCH 1/2] THRIFT-3828 In cmake avoid use of both quoted paths and
+Subject: [PATCH] THRIFT-3828 In cmake avoid use of both quoted paths and
  SYSTEM with include_directories()
 
 This allows us to avoid issues where there are no paths to be added to
@@ -11,6 +11,7 @@ string).
 Specifically, gcc-6 requires that libraries stop passing paths like
 '/usr/include' (or they will get libstdc++ build errors), so these paths
 will be empty more often in the future.
+
 ---
  lib/cpp/CMakeLists.txt      | 8 ++++----
  lib/cpp/test/CMakeLists.txt | 2 +-
@@ -105,6 +106,3 @@ index 2b0c143..5ecae17 100644
  
  #Make sure gen-cpp files can be included
  include_directories("${CMAKE_CURRENT_BINARY_DIR}")
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch
index f13adbb6bc..37715c281b 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch
@@ -1,7 +1,7 @@
-From f6cad0580e5391c37af7f60adddb71bf1a403dc4 Mon Sep 17 00:00:00 2001
+From 7b05a74432f08ef34d0f8743dd6438ad012e3b5e Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Fri, 9 Sep 2016 15:50:26 -0400
-Subject: [PATCH 2/2] THRIFT-3831 in test/cpp explicitly use `signed char`
+Subject: [PATCH] THRIFT-3831 in test/cpp explicitly use `signed char`
 
 `char`'s signed-ness is implimentation dependent, and in the case where
 `char` was not signed, we previously recieved errors like
@@ -9,15 +9,16 @@ Subject: [PATCH 2/2] THRIFT-3831 in test/cpp explicitly use `signed char`
     thrift/0.9.3-r0/git/test/cpp/src/TestClient.cpp:404:15: error: narrowing conversion of '-127' from 'int' to 'char' inside { } [-Wnarrowing]
 
 (This example from gcc-6 on arm)
+
 ---
  test/cpp/src/TestClient.cpp | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/test/cpp/src/TestClient.cpp b/test/cpp/src/TestClient.cpp
-index e709899..4a961f8 100644
+index 7c425a9..7145ebb 100644
 --- a/test/cpp/src/TestClient.cpp
 +++ b/test/cpp/src/TestClient.cpp
-@@ -383,7 +383,7 @@ int main(int argc, char** argv) {
+@@ -381,7 +381,7 @@ int main(int argc, char** argv) {
       * BINARY TEST
       */
      printf("testBinary([-128..127]) = {");
@@ -26,7 +27,7 @@ index e709899..4a961f8 100644
          = {-128, -127, -126, -125, -124, -123, -122, -121, -120, -119, -118, -117, -116, -115, -114,
             -113, -112, -111, -110, -109, -108, -107, -106, -105, -104, -103, -102, -101, -100, -99,
             -98,  -97,  -96,  -95,  -94,  -93,  -92,  -91,  -90,  -89,  -88,  -87,  -86,  -85,  -84,
-@@ -404,7 +404,7 @@ int main(int argc, char** argv) {
+@@ -402,7 +402,7 @@ int main(int argc, char** argv) {
             127};
      try {
        string bin_result;
@@ -35,6 +36,3 @@ index e709899..4a961f8 100644
        if (bin_result.size() != 256) {
          printf("}\n*** FAILED ***\n");
          printf("invalid length: %lu\n", bin_result.size());
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
index 44764359ce..500cfab622 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
@@ -1,5 +1,15 @@
+From 5f2c7e50b99d72177250c44236c41b99bfc161b5 Mon Sep 17 00:00:00 2001
+From: Andrej Valek <andrej.valek@siemens.com>
+Date: Thu, 7 Jun 2018 15:21:06 +0200
+Subject: [PATCH 4/6] %% original patch:
+ 0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
+
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
 diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
-index 68e475d..19132ff 100644
+index 98c5326..3da9e45 100644
 --- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
 +++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
 @@ -39,6 +39,7 @@
@@ -10,7 +20,7 @@ index 68e475d..19132ff 100644
  
  using namespace std;
  using namespace apache::thrift::concurrency;
-@@ -148,10 +149,15 @@ SSLContext::SSLContext(const SSLProtocol& protocol) {
+@@ -143,10 +144,15 @@ SSLContext::SSLContext(const SSLProtocol& protocol) {
      ctx_ = SSL_CTX_new(SSLv3_method());
    } else if (protocol == TLSv1_0) {
      ctx_ = SSL_CTX_new(TLSv1_method());
@@ -26,3 +36,6 @@ index 68e475d..19132ff 100644
    } else {
      /// UNKNOWN PROTOCOL!
      throw TSSLException("SSL_CTX_new: Unknown protocol");
+-- 
+2.19.0
+
diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
index 8d71056675..f4482b109b 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
@@ -1,4 +1,4 @@
-From cc4f32db13ddc62fbd1e316127c5a60f4080a2d3 Mon Sep 17 00:00:00 2001
+From 81f36e7174097a1f1f3e7f94a97574b2ec68577f Mon Sep 17 00:00:00 2001
 From: "James E. King, III" <jim.king@simplivity.com>
 Date: Thu, 29 Sep 2016 15:04:09 -0400
 Subject: [PATCH] THRIFT-3878: fix interop with newer OpenSSL libraries
@@ -8,10 +8,10 @@ Subject: [PATCH] THRIFT-3878: fix interop with newer OpenSSL libraries
  1 file changed, 5 insertions(+)
 
 diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
-index 517151f714..1efb9f7a47 100644
+index 3da9e45..0a3a124 100644
 --- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
 +++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
-@@ -108,7 +108,12 @@ void initializeOpenSSL() {
+@@ -97,7 +97,12 @@ void initializeOpenSSL() {
    SSL_library_init();
    SSL_load_error_strings();
    // static locking
diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch
index 9c18171f1e..dfaa2fbda8 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch
@@ -1,7 +1,8 @@
-From 53dc6e255bec2e4cd8bae85d14bec1cf28310d3f Mon Sep 17 00:00:00 2001
+From 4cd49f470ca983369451d1141acc80fe1115cab4 Mon Sep 17 00:00:00 2001
 From: Nobuaki Sukegawa <nsuke@apache.org>
 Date: Sun, 13 Mar 2016 08:55:38 +0900
 Subject: [PATCH] THRIFT-3736 C++ library build fails if OpenSSL does not
+
  surrpot SSLv3
 
 ---
@@ -10,10 +11,10 @@ Subject: [PATCH] THRIFT-3736 C++ library build fails if OpenSSL does not
  2 files changed, 10 insertions(+)
 
 diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
-index bd13160260..517151f714 100644
+index 0a3a124..3e79354 100644
 --- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
 +++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
-@@ -151,8 +151,10 @@ static char uppercase(char c);
+@@ -145,8 +145,10 @@ static char uppercase(char c);
  SSLContext::SSLContext(const SSLProtocol& protocol) {
    if (protocol == SSLTLS) {
      ctx_ = SSL_CTX_new(SSLv23_method());
@@ -23,12 +24,12 @@ index bd13160260..517151f714 100644
 +#endif
    } else if (protocol == TLSv1_0) {
      ctx_ = SSL_CTX_new(TLSv1_method());
-   } else if (protocol == TLSv1_1) {
+ #if (OPENSSL_VERSION_NUMBER >= OPENSSL_VERSION_WITH_TLSv1_1_AND_TLSv1_2)
 diff --git a/lib/cpp/test/SecurityTest.cpp b/lib/cpp/test/SecurityTest.cpp
-index 9968e2c478..23650d6280 100644
+index 213efd4..08110e7 100644
 --- a/lib/cpp/test/SecurityTest.cpp
 +++ b/lib/cpp/test/SecurityTest.cpp
-@@ -240,6 +240,14 @@ BOOST_AUTO_TEST_CASE(ssl_security_matrix)
+@@ -239,6 +239,14 @@ BOOST_AUTO_TEST_CASE(ssl_security_matrix)
                      continue;
                  }
  
-- 
2.19.0


