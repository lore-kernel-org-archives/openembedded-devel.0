Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id B4BFA794A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 15:57:21 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 84-v6so1926612qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qmg9f5B/8+dtbcCY2aouo2MS1FQQMj0+aeIPdhNdBFo=;
	b=et+4riXI2/XS/XAiV9Oc67o5BOj585v0axZcI7/8vPWEMxrguACQ9Vj5JU+9Yqom9U
	QK5SkKwZyk6978Z4CbooJvo3DZs8iXQINBhQ06TTzNK7LniAvQlY7ESfDBdmddvTE5s3
	k886wWlktVo0q8EsTqwYZA6g3F7qp3DtGGBVk2A1gRfxh1V35WwgKDdTsxsKMQ6ShLYy
	t4vR4Z8Bx61ZWKvH71QAHW6jwkv6DncQ/K5p8uZrLYsk7kh+RUC0yMtWAxxJld3Lgiv1
	mLx4RFjJnkqr+wJciBpVo2VySJYdqF2X94ZbmH2uwM5WtTwD4fpocSRGvBcvh7meeT9u
	FvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qmg9f5B/8+dtbcCY2aouo2MS1FQQMj0+aeIPdhNdBFo=;
	b=cuytaaormpwZUS9aKIKgFWngfmk9GninXqgm5UiFj3zPijWw7mSzPFp0z4BAHpXkrk
	QDSEkFVMOmt4vEZ0UBn1p25ah5ydSs4nHM9ZhywGPGcqSZlBrFfMYw140JWA/dqowoO8
	HISImIJJlMAJuszMb19Ce3y+aVwLbgcW/yvaqv2lSKA9VMu5M+FEgwBG8owaCvK3aH0d
	SnBuMUbOVmROZa5LuoI7B2yI3vRrqIMK0JvbmNuSLyewE3ZcBY7xVEcXrBM4UXlQ6sro
	aJE0u0nxkH2uuxgUpu7hWnQ5If2ffoy1+jqhE5LRdicvyy2vpaaBbJVz9beL6pR1FhrS
	SV/Q==
X-Gm-Message-State: ABuFfog5U46yM9VfXsn5JVPaz1kUUYNdWuMTCkSNxwjYD0ulUkXhbO80
	/RReervFExdo6WJ4XK/uvA67JwXYJFr2AAJcVEs=
X-Google-Smtp-Source: ACcGV60hO5S5kXml0FQTl45a92gFxLqemJ8mj3EcyfMWVSdjYm1DEZz4jlg51NWBbsh21OsjO8tH3rnglRQfIqbFc1c=
X-Received: by 2002:a37:9d55:: with SMTP id
	g82-v6mr6062963qke.315.1538063842251; 
	Thu, 27 Sep 2018 08:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180927111805.9919-1-pascal.bach@siemens.com>
In-Reply-To: <20180927111805.9919-1-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Sep 2018 08:56:55 -0700
Message-ID: <CAMKF1spEo3jSZ6jXrpNjK885M6Zwj8PEEO7-PFTYn1f6T0F5Vg@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] thrift: update to 0.11.0
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
X-List-Received-Date: Thu, 27 Sep 2018 15:57:22 -0000
Content-Type: text/plain; charset="UTF-8"

it seems to be doing -isystem thing and confusing the build see

http://errors.yoctoproject.org/Errors/Details/194753/


On Thu, Sep 27, 2018 at 4:24 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>
> Remove the python library feature as it was never installed so nobody should
> miss it.
>
> The CMake patches are no longer needed as most of the underlying issue
> is fixed in OE core.
> The other patches are backports that are already upstream in 0.11.
>
> OpenSSL 1.1 is supported by this version of thrift.
>
> Also add a feature to use boost smart pointers instead of C++ std ones.
> This is enabled by default to keep backwards compatibility with the
> 0.9.3 recipe. However projects depending on thrift might still need to set
> FORCE_BOOST_SMART_PTR within their build CMake project to make sure the correct
> headers are selected.
>
> Further the different libraries are now split into separate packages.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../0001-Forcibly-disable-check-for-Qt5.patch      |  25 -----
>  ...-In-cmake-avoid-use-of-both-quoted-paths-.patch | 108 ---------------------
>  ...31-in-test-cpp-explicitly-use-signed-char.patch |  38 --------
>  ...07-enable-build-with-OpenSSL-1.1.0-series.patch |  41 --------
>  ...-Compile-error-in-TSSLSocket.cpp-with-new.patch |  26 -----
>  ...-C++-library-build-fails-if-OpenSSL-does-.patch |  46 ---------
>  .../thrift/{thrift_0.9.3.bb => thrift_0.11.0.bb}   |  34 +++----
>  7 files changed, 17 insertions(+), 301 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch
>  delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch
>  delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch
>  delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
>  delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
>  delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch
>  rename meta-oe/recipes-connectivity/thrift/{thrift_0.9.3.bb => thrift_0.11.0.bb} (57%)
>
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch
> deleted file mode 100644
> index a77cd284b..000000000
> --- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-Forcibly-disable-check-for-Qt5.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From a5544d8e543436e413379422b702f6f56ac7eb8e Mon Sep 17 00:00:00 2001
> -From: Philip Balister <philip@balister.org>
> -Date: Tue, 12 Apr 2016 17:30:15 -0400
> -Subject: [PATCH] Forcibly disable check for Qt5.
> -
> -Signed-off-by: Philip Balister <philip@balister.org>
> -
> ----
> - build/cmake/DefineOptions.cmake | 3 ---
> - 1 file changed, 3 deletions(-)
> -
> -diff --git a/build/cmake/DefineOptions.cmake b/build/cmake/DefineOptions.cmake
> -index 62e240f..f8b4493 100644
> ---- a/build/cmake/DefineOptions.cmake
> -+++ b/build/cmake/DefineOptions.cmake
> -@@ -52,9 +52,6 @@ CMAKE_DEPENDENT_OPTION(WITH_LIBEVENT "Build with libevent support" ON
> - find_package(Qt4 QUIET COMPONENTS QtCore QtNetwork)
> - CMAKE_DEPENDENT_OPTION(WITH_QT4 "Build with Qt4 support" ON
> -                        "QT4_FOUND" OFF)
> --find_package(Qt5 QUIET COMPONENTS Core Network)
> --CMAKE_DEPENDENT_OPTION(WITH_QT5 "Build with Qt5 support" ON
> --                       "Qt5_FOUND" OFF)
> - if(${WITH_QT4} AND ${WITH_QT5} AND ${CMAKE_MAJOR_VERSION} LESS 3)
> -   # cmake < 3.0.0 causes conflict when building both Qt4 and Qt5
> -   set(WITH_QT4 OFF)
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch
> deleted file mode 100644
> index 182eacc0e..000000000
> --- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -From b8e254a2f4ba49412e541598c72159869a7770f8 Mon Sep 17 00:00:00 2001
> -From: Cody P Schafer <dev@codyps.com>
> -Date: Mon, 16 May 2016 15:21:10 -0400
> -Subject: [PATCH] THRIFT-3828 In cmake avoid use of both quoted paths and
> - SYSTEM with include_directories()
> -
> -This allows us to avoid issues where there are no paths to be added to
> -the include path (include_directories() errors when given an empty
> -string).
> -
> -Specifically, gcc-6 requires that libraries stop passing paths like
> -'/usr/include' (or they will get libstdc++ build errors), so these paths
> -will be empty more often in the future.
> -
> ----
> - lib/cpp/CMakeLists.txt      | 8 ++++----
> - lib/cpp/test/CMakeLists.txt | 2 +-
> - test/cpp/CMakeLists.txt     | 6 +++---
> - tutorial/cpp/CMakeLists.txt | 2 +-
> - 4 files changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/lib/cpp/CMakeLists.txt b/lib/cpp/CMakeLists.txt
> -index 4c7caeb..a716ac3 100755
> ---- a/lib/cpp/CMakeLists.txt
> -+++ b/lib/cpp/CMakeLists.txt
> -@@ -24,7 +24,7 @@ else()
> -   find_package(Boost 1.53.0 REQUIRED)
> - endif()
> -
> --include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
> -+include_directories(${Boost_INCLUDE_DIRS})
> - include_directories(src)
> -
> - # SYSLIBS contains libraries that need to be linked to all lib targets
> -@@ -104,7 +104,7 @@ if(OPENSSL_FOUND AND WITH_OPENSSL)
> -        src/thrift/transport/TSSLSocket.cpp
> -        src/thrift/transport/TSSLServerSocket.cpp
> -     )
> --    include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
> -+    include_directories(${OPENSSL_INCLUDE_DIR})
> -     list(APPEND SYSLIBS "${OPENSSL_LIBRARIES}")
> - endif()
> -
> -@@ -162,7 +162,7 @@ TARGET_LINK_LIBRARIES_THRIFT(thrift ${SYSLIBS})
> -
> - if(WITH_LIBEVENT)
> -     find_package(Libevent REQUIRED)  # Libevent comes with CMake support form upstream
> --    include_directories(SYSTEM ${LIBEVENT_INCLUDE_DIRS})
> -+    include_directories(${LIBEVENT_INCLUDE_DIRS})
> -
> -     ADD_LIBRARY_THRIFT(thriftnb ${thriftcppnb_SOURCES})
> -     TARGET_LINK_LIBRARIES_THRIFT(thriftnb ${SYSLIBS} ${LIBEVENT_LIBRARIES})
> -@@ -171,7 +171,7 @@ endif()
> -
> - if(WITH_ZLIB)
> -     find_package(ZLIB REQUIRED)
> --    include_directories(SYSTEM ${ZLIB_INCLUDE_DIRS})
> -+    include_directories(${ZLIB_INCLUDE_DIRS})
> -
> -     ADD_LIBRARY_THRIFT(thriftz ${thriftcppz_SOURCES})
> -     TARGET_LINK_LIBRARIES_THRIFT(thriftz ${SYSLIBS} ${ZLIB_LIBRARIES})
> -diff --git a/lib/cpp/test/CMakeLists.txt b/lib/cpp/test/CMakeLists.txt
> -index 5de9fc4..c956c38 100644
> ---- a/lib/cpp/test/CMakeLists.txt
> -+++ b/lib/cpp/test/CMakeLists.txt
> -@@ -20,7 +20,7 @@
> - # Find required packages
> - set(Boost_USE_STATIC_LIBS ON) # Force the use of static boost test framework
> - find_package(Boost 1.53.0 REQUIRED COMPONENTS chrono filesystem system thread unit_test_framework)
> --include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
> -+include_directories(${Boost_INCLUDE_DIRS})
> -
> - #Make sure gen-cpp files can be included
> - include_directories("${CMAKE_CURRENT_BINARY_DIR}")
> -diff --git a/test/cpp/CMakeLists.txt b/test/cpp/CMakeLists.txt
> -index 2d75f2e..b1409de 100755
> ---- a/test/cpp/CMakeLists.txt
> -+++ b/test/cpp/CMakeLists.txt
> -@@ -22,13 +22,13 @@ include(ThriftMacros)
> -
> - set(Boost_USE_STATIC_LIBS ON)
> - find_package(Boost 1.53.0 REQUIRED COMPONENTS program_options system filesystem)
> --include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
> -+include_directories(${Boost_INCLUDE_DIRS})
> -
> - find_package(OpenSSL REQUIRED)
> --include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
> -+include_directories(${OPENSSL_INCLUDE_DIR})
> -
> - find_package(Libevent REQUIRED)  # Libevent comes with CMake support from upstream
> --include_directories(SYSTEM ${LIBEVENT_INCLUDE_DIRS})
> -+include_directories(${LIBEVENT_INCLUDE_DIRS})
> -
> - #Make sure gen-cpp files can be included
> - include_directories("${CMAKE_CURRENT_BINARY_DIR}")
> -diff --git a/tutorial/cpp/CMakeLists.txt b/tutorial/cpp/CMakeLists.txt
> -index 2b0c143..5ecae17 100644
> ---- a/tutorial/cpp/CMakeLists.txt
> -+++ b/tutorial/cpp/CMakeLists.txt
> -@@ -18,7 +18,7 @@
> - #
> -
> - find_package(Boost 1.53.0 REQUIRED)
> --include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
> -+include_directories(${Boost_INCLUDE_DIRS})
> -
> - #Make sure gen-cpp files can be included
> - include_directories("${CMAKE_CURRENT_BINARY_DIR}")
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch
> deleted file mode 100644
> index 37715c281..000000000
> --- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 7b05a74432f08ef34d0f8743dd6438ad012e3b5e Mon Sep 17 00:00:00 2001
> -From: Cody P Schafer <dev@codyps.com>
> -Date: Fri, 9 Sep 2016 15:50:26 -0400
> -Subject: [PATCH] THRIFT-3831 in test/cpp explicitly use `signed char`
> -
> -`char`'s signed-ness is implimentation dependent, and in the case where
> -`char` was not signed, we previously recieved errors like
> -
> -    thrift/0.9.3-r0/git/test/cpp/src/TestClient.cpp:404:15: error: narrowing conversion of '-127' from 'int' to 'char' inside { } [-Wnarrowing]
> -
> -(This example from gcc-6 on arm)
> -
> ----
> - test/cpp/src/TestClient.cpp | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/test/cpp/src/TestClient.cpp b/test/cpp/src/TestClient.cpp
> -index 7c425a9..7145ebb 100644
> ---- a/test/cpp/src/TestClient.cpp
> -+++ b/test/cpp/src/TestClient.cpp
> -@@ -381,7 +381,7 @@ int main(int argc, char** argv) {
> -      * BINARY TEST
> -      */
> -     printf("testBinary([-128..127]) = {");
> --    const char bin_data[256]
> -+    const signed char bin_data[256]
> -         = {-128, -127, -126, -125, -124, -123, -122, -121, -120, -119, -118, -117, -116, -115, -114,
> -            -113, -112, -111, -110, -109, -108, -107, -106, -105, -104, -103, -102, -101, -100, -99,
> -            -98,  -97,  -96,  -95,  -94,  -93,  -92,  -91,  -90,  -89,  -88,  -87,  -86,  -85,  -84,
> -@@ -402,7 +402,7 @@ int main(int argc, char** argv) {
> -            127};
> -     try {
> -       string bin_result;
> --      testClient.testBinary(bin_result, string(bin_data, 256));
> -+      testClient.testBinary(bin_result, string(reinterpret_cast<const char *>(bin_data), 256));
> -       if (bin_result.size() != 256) {
> -         printf("}\n*** FAILED ***\n");
> -         printf("invalid length: %lu\n", bin_result.size());
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
> deleted file mode 100644
> index 500cfab62..000000000
> --- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 5f2c7e50b99d72177250c44236c41b99bfc161b5 Mon Sep 17 00:00:00 2001
> -From: Andrej Valek <andrej.valek@siemens.com>
> -Date: Thu, 7 Jun 2018 15:21:06 +0200
> -Subject: [PATCH 4/6] %% original patch:
> - 0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
> -
> ----
> - lib/cpp/src/thrift/transport/TSSLSocket.cpp | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
> -index 98c5326..3da9e45 100644
> ---- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
> -+++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
> -@@ -39,6 +39,7 @@
> - #include <thrift/transport/PlatformSocket.h>
> -
> - #define OPENSSL_VERSION_NO_THREAD_ID 0x10000000L
> -+#define OPENSSL_VERSION_WITH_TLSv1_1_AND_TLSv1_2 0x10100000L
> -
> - using namespace std;
> - using namespace apache::thrift::concurrency;
> -@@ -143,10 +144,15 @@ SSLContext::SSLContext(const SSLProtocol& protocol) {
> -     ctx_ = SSL_CTX_new(SSLv3_method());
> -   } else if (protocol == TLSv1_0) {
> -     ctx_ = SSL_CTX_new(TLSv1_method());
> -+#if (OPENSSL_VERSION_NUMBER >= OPENSSL_VERSION_WITH_TLSv1_1_AND_TLSv1_2)
> -   } else if (protocol == TLSv1_1) {
> -     ctx_ = SSL_CTX_new(TLSv1_1_method());
> -   } else if (protocol == TLSv1_2) {
> -     ctx_ = SSL_CTX_new(TLSv1_2_method());
> -+#else
> -+  //Support for this versions will end on 2016-12-31
> -+  //https://www.openssl.org/about/releasestrat.html
> -+#endif
> -   } else {
> -     /// UNKNOWN PROTOCOL!
> -     throw TSSLException("SSL_CTX_new: Unknown protocol");
> ---
> -2.19.0
> -
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
> deleted file mode 100644
> index f4482b109..000000000
> --- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 81f36e7174097a1f1f3e7f94a97574b2ec68577f Mon Sep 17 00:00:00 2001
> -From: "James E. King, III" <jim.king@simplivity.com>
> -Date: Thu, 29 Sep 2016 15:04:09 -0400
> -Subject: [PATCH] THRIFT-3878: fix interop with newer OpenSSL libraries
> -
> ----
> - lib/cpp/src/thrift/transport/TSSLSocket.cpp | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
> -index 3da9e45..0a3a124 100644
> ---- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
> -+++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
> -@@ -97,7 +97,12 @@ void initializeOpenSSL() {
> -   SSL_library_init();
> -   SSL_load_error_strings();
> -   // static locking
> -+  // newer versions of OpenSSL changed CRYPTO_num_locks - see THRIFT-3878
> -+#ifdef CRYPTO_num_locks
> -+  mutexes = boost::shared_array<Mutex>(new Mutex[CRYPTO_num_locks()]);
> -+#else
> -   mutexes = boost::shared_array<Mutex>(new Mutex[ ::CRYPTO_num_locks()]);
> -+#endif
> -   if (mutexes == NULL) {
> -     throw TTransportException(TTransportException::INTERNAL_ERROR,
> -                               "initializeOpenSSL() failed, "
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch
> deleted file mode 100644
> index dfaa2fbda..000000000
> --- a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 4cd49f470ca983369451d1141acc80fe1115cab4 Mon Sep 17 00:00:00 2001
> -From: Nobuaki Sukegawa <nsuke@apache.org>
> -Date: Sun, 13 Mar 2016 08:55:38 +0900
> -Subject: [PATCH] THRIFT-3736 C++ library build fails if OpenSSL does not
> -
> - surrpot SSLv3
> -
> ----
> - lib/cpp/src/thrift/transport/TSSLSocket.cpp | 2 ++
> - lib/cpp/test/SecurityTest.cpp               | 8 ++++++++
> - 2 files changed, 10 insertions(+)
> -
> -diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
> -index 0a3a124..3e79354 100644
> ---- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
> -+++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
> -@@ -145,8 +145,10 @@ static char uppercase(char c);
> - SSLContext::SSLContext(const SSLProtocol& protocol) {
> -   if (protocol == SSLTLS) {
> -     ctx_ = SSL_CTX_new(SSLv23_method());
> -+#ifndef OPENSSL_NO_SSL3
> -   } else if (protocol == SSLv3) {
> -     ctx_ = SSL_CTX_new(SSLv3_method());
> -+#endif
> -   } else if (protocol == TLSv1_0) {
> -     ctx_ = SSL_CTX_new(TLSv1_method());
> - #if (OPENSSL_VERSION_NUMBER >= OPENSSL_VERSION_WITH_TLSv1_1_AND_TLSv1_2)
> -diff --git a/lib/cpp/test/SecurityTest.cpp b/lib/cpp/test/SecurityTest.cpp
> -index 213efd4..08110e7 100644
> ---- a/lib/cpp/test/SecurityTest.cpp
> -+++ b/lib/cpp/test/SecurityTest.cpp
> -@@ -239,6 +239,14 @@ BOOST_AUTO_TEST_CASE(ssl_security_matrix)
> -                     continue;
> -                 }
> -
> -+#ifdef OPENSSL_NO_SSL3
> -+                if (si == 2 || ci == 2)
> -+                {
> -+                    // Skip all SSLv3 cases - protocol not supported
> -+                    continue;
> -+                }
> -+#endif
> -+
> -                 boost::mutex::scoped_lock lock(mMutex);
> -
> -                 BOOST_TEST_MESSAGE(boost::format("TEST: Server = %1%, Client = %2%")
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.11.0.bb
> similarity index 57%
> rename from meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
> rename to meta-oe/recipes-connectivity/thrift/thrift_0.11.0.bb
> index 7ab74026b..307d3ef20 100644
> --- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.11.0.bb
> @@ -3,22 +3,16 @@ DESCRIPTION =  "A software framework, for scalable cross-language services devel
>  HOMEPAGE = "https://thrift.apache.org/"
>
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e4ed21f679b2aafef26eac82ab0c2cbf \
> -                    file://NOTICE;md5=115f49498b66b494b0472658f2bfe80b"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=394465e125cffc0f133695ed43f14047 \
> +                    file://NOTICE;md5=42748ae4646b45fbfa5182807321fb6c"
>
>  DEPENDS = "thrift-native boost flex-native bison-native openssl"
>
>  SRC_URI = "http://mirror.switch.ch/mirror/apache/dist/thrift/${PV}/${BPN}-${PV}.tar.gz \
> -           file://0001-Forcibly-disable-check-for-Qt5.patch \
> -           file://0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch \
> -           file://0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch \
> -           file://0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch \
> -           file://0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch \
> -           file://0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch \
> -"
> +          "
>
> -SRC_URI[md5sum] = "88d667a8ae870d5adeca8cb7d6795442"
> -SRC_URI[sha256sum] = "b0740a070ac09adde04d43e852ce4c320564a292f26521c46b78e0641564969e"
> +SRC_URI[md5sum] = "0be59730ebce071eceaf6bfdb8d3a20e"
> +SRC_URI[sha256sum] = "c4ad38b6cb4a3498310d405a91fef37b9a8e79a50cd0968148ee2524d2fa60c2"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> @@ -30,6 +24,7 @@ export BUILD_SYS
>  export HOST_SYS
>
>  EXTRA_OECMAKE = " \
> +    -DENABLE_PRECOMPILED_HEADERS=OFF \
>      -DBUILD_LIBRARIES=ON \
>      -DBUILD_COMPILER=ON \
>      -DBUILD_TESTING=OFF \
> @@ -37,17 +32,19 @@ EXTRA_OECMAKE = " \
>      -DBUILD_TUTORIALS=OFF \
>      -DWITH_CPP=ON \
>      -DWITH_JAVA=OFF \
> +    -DWITH_PYTHON=OFF \
>      -DWITH_STATIC_LIB=ON \
>      -DWITH_SHARED_LIB=ON \
>      -DWITH_OPENSSL=ON \
>      -DWITH_QT4=OFF \
>      -DWITH_QT5=OFF \
> +    -DWITH_BOOST_FUNCTIONAL=OFF \
>  "
>
> -PACKAGECONFIG ??= "libevent glib python"
> -PACKAGECONFIG[libevent] = "-DWITH_LIBEVENT=ON,-DWITH_LIBEVENT=OFF,libevent,"
> -PACKAGECONFIG[python] = "-DWITH_PYTHON=ON,-DWITH_PYTHON=OFF,python,"
> -PACKAGECONFIG[glib] = "-DWITH_C_GLIB=ON,-DWITH_C_GLIB=OFF,glib-2.0 ,"
> +PACKAGECONFIG ??= "libevent glib boost-smart-ptr"
> +PACKAGECONFIG[libevent] = "-DWITH_LIBEVENT=ON,-DWITH_LIBEVENT=OFF,libevent"
> +PACKAGECONFIG[glib] = "-DWITH_C_GLIB=ON,-DWITH_C_GLIB=OFF,glib-2.0"
> +PACKAGECONFIG[boost-smart-ptr] = "-DWITH_BOOST_SMART_PTR=ON,-DWITH_BOOST_SMART_PTR=OFF,boost"
>
>  do_install_append () {
>      ln -sf thrift ${D}/${bindir}/thrift-compiler
> @@ -56,8 +53,11 @@ do_install_append () {
>  LEAD_SONAME = "libthrift.so.${PV}"
>
>  # thrift packages
> -PACKAGE_BEFORE_PN = "${PN}-compiler lib${BPN}"
> -FILES_lib${BPN} = "${libdir}/*.so.*"
> +PACKAGE_BEFORE_PN = "${PN}-compiler lib${BPN} lib${BPN}z lib${BPN}nb lib${BPN}-c-glib"
> +FILES_lib${BPN} = "${libdir}/libthrift.so.*"
> +FILES_lib${BPN}z = "${libdir}/libthriftz.so.*"
> +FILES_lib${BPN}nb = "${libdir}/libthriftnb.so.*"
> +FILES_lib${BPN}-c-glib = "${libdir}/libthrift_c_glib.so.*"
>  FILES_${PN}-compiler = "${bindir}/*"
>
>  # The thrift packages just pulls in some default dependencies but is otherwise empty
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

