Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92740CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:42:12 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4490.1791837722330863505
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=KwnFJnAc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261012204158b20903ed3a000207db-5x4a6o@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261012204158b20903ed3a000207db
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 12 Oct 2026 22:41:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qMHjx5Myu4IFiLXEAIs/r1AaUxO8/dcqe5Zgq3klk2w=;
 b=KwnFJnAc2WQGCR3sbinXqAR07XW7et01jqdeZsDCCLgu0/bDCOpP6YIXxd5JnbqL67Ocig
 qBrPuN6w7S/8YDcnP5QjdR+rRDI6veXmV50MjLo2AQ2nl2vPoSq90iRzTbx6cBU1qiyFTqqh
 LjmXpZ/ajcdenA0iSvexgwYAQik+7TYxv25qWLhlrvB/2lSHOfB60xoPijqXIpu/CuYymg/L
 RTNS9sl/LcD5Vl89xBk28Wcuk6Jp+WxeC8fzynHRSEH9ApN3Pb6kapGL+WAWXr/ur+Avqmfx
 XSHK87Px9d4VB/OuRCewJ5htFZlfju0m2TA+iyguSmqni/TtDn7T5fSA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] thrift: upgrade 0.24.0 -> 0.25.0
Date: Mon, 12 Oct 2026 22:41:50 +0200
Message-ID: <20261012204150.1725236-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 20:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130770

From: Peter Marko <peter.marko@siemens.com>

This upgrade includes fix for 61 CVEs.
Refreshed/removed patches via devtool.

Release announcement: [1]
Release notes: [2]

[1] https://lists.apache.org/thread/prryfzdozvt6t02c9k5jf46or3m7ctzy
[2] https://github.com/apache/thrift/blob/v0.25.0/CHANGES.md

License-Update: Added notice for MIT license of a Makefile

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...onPaths.cmake-Define-libdir-in-terms.patch |  37 +++---
 ...SSLSocket-fix-build-with-OpenSSL-4.0.patch | 113 ------------------
 .../{thrift_0.24.0.bb => thrift_0.25.0.bb}    |   5 +-
 3 files changed, 23 insertions(+), 132 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-TSSLSocket-fix-build-with-OpenSSL-4.0.patch
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.24.0.bb => thrift_0.25.0.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
index bbfc6c8069..c79bc458a5 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
+++ b/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
@@ -7,12 +7,30 @@ Subject: [PATCH] DefineInstallationPaths.cmake: Define libdir in terms of
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- build/cmake/DefineInstallationPaths.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ build/cmake/DefineCMakeDefaults.cmake     | 4 ++--
+ build/cmake/DefineInstallationPaths.cmake | 6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
 
+diff --git a/build/cmake/DefineCMakeDefaults.cmake b/build/cmake/DefineCMakeDefaults.cmake
+index 2b0cdbb..6f5022f 100644
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
+diff --git a/build/cmake/DefineInstallationPaths.cmake b/build/cmake/DefineInstallationPaths.cmake
+index 0c3dd09..9e9b77c 100644
 --- a/build/cmake/DefineInstallationPaths.cmake
 +++ b/build/cmake/DefineInstallationPaths.cmake
-@@ -26,11 +26,11 @@ else()
+@@ -28,11 +28,11 @@ else()
      set(LIB_INSTALL_DIR "lib${LIB_SUFFIX}" CACHE PATH "The library install dir (default: lib${LIB_SUFFIX})")
  endif()
  set(INCLUDE_INSTALL_DIR "include" CACHE PATH "The library install dir (default: include)")
@@ -27,16 +45,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +set(libdir "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
  set(includedir "${CMAKE_INSTALL_PREFIX}/include")
  set(cmakedir "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DIR}")
---- a/build/cmake/DefineCMakeDefaults.cmake
-+++ b/build/cmake/DefineCMakeDefaults.cmake
-@@ -44,8 +44,8 @@ include(BuildType)
- # top of the build tree rather than in hard-to-find leaf
- # directories. This simplifies manual testing and the use of the build
- # tree rather than installed thrift libraries.
--set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
--set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
-+set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib${LIB_SUFFIX})
-+set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib${LIB_SUFFIX})
- set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
- 
- #
diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-TSSLSocket-fix-build-with-OpenSSL-4.0.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-TSSLSocket-fix-build-with-OpenSSL-4.0.patch
deleted file mode 100644
index 965f024b6e..0000000000
--- a/meta-oe/recipes-connectivity/thrift/thrift/0001-TSSLSocket-fix-build-with-OpenSSL-4.0.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 27 Aug 2026 11:00:00 +0000
-Subject: [PATCH] Fix build with OpenSSL 4.0
-
-OpenSSL 4.0 removes SSLv3_method(), per-version TLS method functions,
-ERR_remove_state(), ASN1_STRING_data(), and returns const pointers
-from X509 accessor functions.
-
-C++ (TSSLSocket.cpp):
-- Guard SSLv3 and TLS version methods with version check
-- Replace ASN1_STRING_data with ASN1_STRING_get0_data
-- Add const qualifiers for X509_NAME, X509_NAME_ENTRY, ASN1_STRING
-
-C (thrift_ssl_socket.c):
-- Remove ERR_remove_state() calls (no-op since OpenSSL 1.1)
-- Guard SSLv3 and TLS version methods with version check
-
-Upstream-Status: Submitted [https://github.com/apache/thrift/pull/3752]
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
-diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
---- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp	2026-08-27 11:26:40.242005669 +0000
-+++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp	2026-08-27 11:26:40.263005736 +0000
-@@ -182,16 +182,18 @@
- SSLContext::SSLContext(const SSLProtocol& protocol) {
-   if (protocol == SSLTLS) {
-     ctx_ = SSL_CTX_new(SSLv23_method());
--#ifndef OPENSSL_NO_SSL3
-+#if !defined(OPENSSL_NO_SSL3) && OPENSSL_VERSION_NUMBER < 0x40000000L
-   } else if (protocol == SSLv3) {
-     ctx_ = SSL_CTX_new(SSLv3_method());
- #endif
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L
-   } else if (protocol == TLSv1_0) {
-     ctx_ = SSL_CTX_new(TLSv1_method());
-   } else if (protocol == TLSv1_1) {
-     ctx_ = SSL_CTX_new(TLSv1_1_method());
-   } else if (protocol == TLSv1_2) {
-     ctx_ = SSL_CTX_new(TLSv1_2_method());
-+#endif
-   } else {
-     /// UNKNOWN PROTOCOL!
-     throw TSSLException("SSL_CTX_new: Unknown protocol");
-@@ -770,7 +772,7 @@
-       if (name == nullptr) {
-         continue;
-       }
--      char* data = (char*)ASN1_STRING_data(name->d.ia5);
-+      const char* data = (const char*)ASN1_STRING_get0_data(name->d.ia5);
-       int length = ASN1_STRING_length(name->d.ia5);
-       switch (name->type) {
-       case GEN_DNS:
-@@ -796,19 +798,19 @@
-   }
- 
-   // extract commonName
--  X509_NAME* name = X509_get_subject_name(cert);
-+  const X509_NAME* name = X509_get_subject_name(cert);
-   if (name != nullptr) {
--    X509_NAME_ENTRY* entry;
-+    const X509_NAME_ENTRY* entry;
-     unsigned char* utf8;
-     int last = -1;
-     while (decision == AccessManager::SKIP) {
--      last = X509_NAME_get_index_by_NID(name, NID_commonName, last);
-+      last = X509_NAME_get_index_by_NID((X509_NAME *)name, NID_commonName, last);
-       if (last == -1)
-         break;
-       entry = X509_NAME_get_entry(name, last);
-       if (entry == nullptr)
-         continue;
--      ASN1_STRING* common = X509_NAME_ENTRY_get_data(entry);
-+      const ASN1_STRING* common = X509_NAME_ENTRY_get_data(entry);
-       int size = ASN1_STRING_to_UTF8(&utf8, common);
-       if (host.empty()) {
-         host = (server() ? getPeerHost() : getHost());
-diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c b/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
---- a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c	2026-08-27 11:26:40.245005679 +0000
-+++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c	2026-08-27 11:26:52.923045957 +0000
-@@ -285,7 +285,6 @@
-       SSL_shutdown(ssl_socket->ssl);
-       SSL_free(ssl_socket->ssl);
-       ssl_socket->ssl = NULL;
--      ERR_remove_state(0);
-   }
-   return thrift_socket_close(transport, error);
- }
-@@ -710,7 +709,6 @@
-   ERR_free_strings();
-   EVP_cleanup();
-   CRYPTO_cleanup_all_ex_data();
--  ERR_remove_state(0);
- }
- 
- 
-@@ -835,6 +833,7 @@
-     case SSLTLS:
-       context = SSL_CTX_new(SSLv23_method());
-       break;
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L
- #ifndef OPENSSL_NO_SSL3
-     case SSLv3:
-       context = SSL_CTX_new(SSLv3_method());
-@@ -849,6 +848,7 @@
-     case TLSv1_2:
-       context = SSL_CTX_new(TLSv1_2_method());
-       break;
-+#endif /* OPENSSL_VERSION_NUMBER < 0x40000000L */
-     default:
-       g_set_error (error, THRIFT_TRANSPORT_ERROR,
- 		   THRIFT_SSL_SOCKET_ERROR_CIPHER_NOT_AVAILABLE,
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.24.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.25.0.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.24.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.25.0.bb
index aa822d8696..dc7b4c6c02 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.24.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.25.0.bb
@@ -3,16 +3,15 @@ DESCRIPTION =  "A software framework, for scalable cross-language services devel
 HOMEPAGE = "https://thrift.apache.org/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bdfca4cb0874071cc3e42d2ae3b05a77 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=62cd1eea65d163fffe0873a5c410a7ec \
                     file://NOTICE;md5=2659b43daca219f99a2f2626ea128f73"
 
 DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
-           file://0001-TSSLSocket-fix-build-with-OpenSSL-4.0.patch \
            "
-SRC_URI[sha256sum] = "e0fa5839a4c5c1d631b0931cf2c554ebbfa4e2fee3a9fb3ffd4f82ce4396c6e4"
+SRC_URI[sha256sum] = "66da4707214c54c94bac082103dc67adaf9e08925662700f269170a7b534b214"
 
 BBCLASSEXTEND = "native nativesdk"
 

