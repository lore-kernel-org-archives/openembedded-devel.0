Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 601417855C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:21:36 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w57DLa21023901
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Jun 2018 15:21:36 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w57DLamG011970;
	Thu, 7 Jun 2018 15:21:36 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0C54395183F;
	Thu,  7 Jun 2018 15:21:36 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jun 2018 15:21:06 +0200
Message-Id: <20180607132109.23396-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180607132109.23396-1-andrej.valek@siemens.com>
References: <20180607132109.23396-1-andrej.valek@siemens.com>
Subject: [meta-oe][PATCH 1/3] thrift: add support for openssl 1.1x
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
X-List-Received-Date: Thu, 07 Jun 2018 13:21:37 -0000

The newest Thrift version has currently no fix for building with gcc>=6.
Rather posting supporting patches.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...07-enable-build-with-OpenSSL-1.1.0-series.patch | 28 ++++++++++++++
 ...-Compile-error-in-TSSLSocket.cpp-with-new.patch | 26 +++++++++++++
 ...-C++-library-build-fails-if-OpenSSL-does-.patch | 45 ++++++++++++++++++++++
 .../recipes-connectivity/thrift/thrift_0.9.3.bb    |  3 ++
 4 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
new file mode 100644
index 000000000..44764359c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch
@@ -0,0 +1,28 @@
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index 68e475d..19132ff 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -39,6 +39,7 @@
+ #include <thrift/transport/PlatformSocket.h>
+ 
+ #define OPENSSL_VERSION_NO_THREAD_ID 0x10000000L
++#define OPENSSL_VERSION_WITH_TLSv1_1_AND_TLSv1_2 0x10100000L
+ 
+ using namespace std;
+ using namespace apache::thrift::concurrency;
+@@ -148,10 +149,15 @@ SSLContext::SSLContext(const SSLProtocol& protocol) {
+     ctx_ = SSL_CTX_new(SSLv3_method());
+   } else if (protocol == TLSv1_0) {
+     ctx_ = SSL_CTX_new(TLSv1_method());
++#if (OPENSSL_VERSION_NUMBER >= OPENSSL_VERSION_WITH_TLSv1_1_AND_TLSv1_2)
+   } else if (protocol == TLSv1_1) {
+     ctx_ = SSL_CTX_new(TLSv1_1_method());
+   } else if (protocol == TLSv1_2) {
+     ctx_ = SSL_CTX_new(TLSv1_2_method());
++#else
++  //Support for this versions will end on 2016-12-31
++  //https://www.openssl.org/about/releasestrat.html
++#endif
+   } else {
+     /// UNKNOWN PROTOCOL!
+     throw TSSLException("SSL_CTX_new: Unknown protocol");
diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
new file mode 100644
index 000000000..8d7105667
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch
@@ -0,0 +1,26 @@
+From cc4f32db13ddc62fbd1e316127c5a60f4080a2d3 Mon Sep 17 00:00:00 2001
+From: "James E. King, III" <jim.king@simplivity.com>
+Date: Thu, 29 Sep 2016 15:04:09 -0400
+Subject: [PATCH] THRIFT-3878: fix interop with newer OpenSSL libraries
+
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index 517151f714..1efb9f7a47 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -108,7 +108,12 @@ void initializeOpenSSL() {
+   SSL_library_init();
+   SSL_load_error_strings();
+   // static locking
++  // newer versions of OpenSSL changed CRYPTO_num_locks - see THRIFT-3878
++#ifdef CRYPTO_num_locks
++  mutexes = boost::shared_array<Mutex>(new Mutex[CRYPTO_num_locks()]);
++#else
+   mutexes = boost::shared_array<Mutex>(new Mutex[ ::CRYPTO_num_locks()]);
++#endif
+   if (mutexes == NULL) {
+     throw TTransportException(TTransportException::INTERNAL_ERROR,
+                               "initializeOpenSSL() failed, "
diff --git a/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch
new file mode 100644
index 000000000..9c18171f1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift-0.9.3/0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch
@@ -0,0 +1,45 @@
+From 53dc6e255bec2e4cd8bae85d14bec1cf28310d3f Mon Sep 17 00:00:00 2001
+From: Nobuaki Sukegawa <nsuke@apache.org>
+Date: Sun, 13 Mar 2016 08:55:38 +0900
+Subject: [PATCH] THRIFT-3736 C++ library build fails if OpenSSL does not
+ surrpot SSLv3
+
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp | 2 ++
+ lib/cpp/test/SecurityTest.cpp               | 8 ++++++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index bd13160260..517151f714 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -151,8 +151,10 @@ static char uppercase(char c);
+ SSLContext::SSLContext(const SSLProtocol& protocol) {
+   if (protocol == SSLTLS) {
+     ctx_ = SSL_CTX_new(SSLv23_method());
++#ifndef OPENSSL_NO_SSL3
+   } else if (protocol == SSLv3) {
+     ctx_ = SSL_CTX_new(SSLv3_method());
++#endif
+   } else if (protocol == TLSv1_0) {
+     ctx_ = SSL_CTX_new(TLSv1_method());
+   } else if (protocol == TLSv1_1) {
+diff --git a/lib/cpp/test/SecurityTest.cpp b/lib/cpp/test/SecurityTest.cpp
+index 9968e2c478..23650d6280 100644
+--- a/lib/cpp/test/SecurityTest.cpp
++++ b/lib/cpp/test/SecurityTest.cpp
+@@ -240,6 +240,14 @@ BOOST_AUTO_TEST_CASE(ssl_security_matrix)
+                     continue;
+                 }
+ 
++#ifdef OPENSSL_NO_SSL3
++                if (si == 2 || ci == 2)
++                {
++                    // Skip all SSLv3 cases - protocol not supported
++                    continue;
++                }
++#endif
++
+                 boost::mutex::scoped_lock lock(mMutex);
+ 
+                 BOOST_TEST_MESSAGE(boost::format("TEST: Server = %1%, Client = %2%")
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
index aa9328371..7ab74026b 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -12,6 +12,9 @@ SRC_URI = "http://mirror.switch.ch/mirror/apache/dist/thrift/${PV}/${BPN}-${PV}.
            file://0001-Forcibly-disable-check-for-Qt5.patch \
            file://0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch \
            file://0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch \
+           file://0004-THRIFT-3207-enable-build-with-OpenSSL-1.1.0-series.patch \
+           file://0005-THRIFT-3878-Compile-error-in-TSSLSocket.cpp-with-new.patch \
+           file://0006-THRIFT-3736-C++-library-build-fails-if-OpenSSL-does-.patch \
 "
 
 SRC_URI[md5sum] = "88d667a8ae870d5adeca8cb7d6795442"
-- 
2.11.0


