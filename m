Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33654.1794851699068478831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mfEFEnUg;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6021295eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851698; x=1795456498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCaymz36vgKQc9wp1ecwWJZ/CMhWGcoiTFo+5RiVrXU=;
        b=mfEFEnUgqTpUgY2mh+ZdNcwvuwcVpoIwKD3v3/oKYsdKwbvNNqJJ+aOwBpTvMIxhxZ
         d1IEoKEOW+X7/hHV0FdbmYphIMDdpoqbA1OVkgOF4A/bEbCChXcUQkXjiopYHgfHkRoR
         93/YUeBFNiWl9p5sOunVdYKKBau174yoIHGIqw3WGenlDi6nZpkylVhE8rm0gu4s5RF2
         MEABqN3jmesEz08bFhODxwyTbVM0Oq+hKHSSGxPenYQW0TWoBkTx6gIqyXBxnEIksTfz
         Df2lpCPZNELohKkmTYo4KtZdlKUPXXXNgJ8owg6cIcM0H/eZ1/v2ERv0Xsdb/xJGLZQX
         oqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851698; x=1795456498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCaymz36vgKQc9wp1ecwWJZ/CMhWGcoiTFo+5RiVrXU=;
        b=us92SY6PGzBONRPxcStOp3GInwuPDuU4CbN65gv1rrDqcfuHQSP+ZAIfLKwUin9Ocb
         dwr8scQ4jkWZfetRd/aP4sAPA6gpdk8qDmqZuMR3VoLllqIAM7UcEMFPNI71yVvfnxUd
         npo0eNhOtv6V/T++9uAJc9ulucJK/yaVarMEoNBIzMqTD+9nEUeFbLLbU0aUcfbYcdtM
         KXLovznQ5s1idDi8mf/hAaBPKivrrxzu2B3W0tDZaXfYdwlQ13b0LmloByGmet4PW3nb
         YdpCKekgqrbKoeu7RzPFJGC+8fpGFy6JvAqpwYxiUGdkLFH8SeXfdom2rDa1hLV3Emt2
         YiSA==
X-Gm-Message-State: APuU4Z9xvW4MP/v5ucweJoV50lQ5Pb5zdKTgpqNlYnqyUVQyfawy0el0
	KLyMgKMD2+ALCETMV2ixGHWDlMOwdIu6Tx4BGmXnukEBoYSMczkT29t2/JvftRCI
X-Gm-Gg: AZFdTZeSCRNXuDRlrtmG7VdHLtJAUIJSRDhlqoTkTfA8uL9UUG3k6NJPeG502Y23XN5
	IiOXyBp17q5jOJK7Xd37Q9+nSDKt6tPQnZkLuIOhMyxc6zT9B0FloFeqbBP+sBivGjT+PnVFYPN
	zv7blNpmEQfJK/R/A3/nfvWQiruiXuyv6huss/pHVZb8RBFNVJOdBTbiW4gWrF4BWgwxxgd3pJu
	1Ck9ER8HIwfYzR0sKdTFZ+ltqY1i6pm2k47Ka6VdCP2rNUzhNmK/J/x/318cSyjXHgDvVbRj8Yy
	YFb8H6jltsk4hrCGtN6jH8+X1kE+EMFYLTCh3tMljG74lfbvWwaBQ0SJDqjBrnL6bWope5oadL6
	xKUTIYRzvi74GsdHljB+NYNoBUv7ul/Wydp4XY7gBLA0oGr3eTiUtsmJlj9YiotlRcl8hCQMOx0
	Ubw3JHX2igGLvfMJzfFXC5M6SxcmNmEfXObHdJi8L4UUoDqIkAmrn13uVA9OIxbobqyknE8FDk/
	7M7JvP49CVvDW7uTXHoBYs8Thv25ns5qww/20HpDyLI8tMZzUdDwlwFYqgYX/qwx7lqDEGp5kr3
	0EzIQmhL7ltXZgLzaNElzcC7tz+BQI3FVlrprfExbiVGd4C8uAAwlocEQH0WVgTIkaINAi5zBGM
	GadsfiAIt3+i778xTdfs8m4vxEal/u/w2kdJBvyKM0tteBmo0GjgmPo8wjkCsmXsl5QFJfkG1Ao
	kVlBzxw6ppxAEWHgMaOVIztLEyY3iw0C8ePenILJyHU+UIhOBUOH0jKAAkJk9QSpqF/+RzLYL6/
	Tsmik+/2J185akkP3k0mGwBMzmlgQcnptbKTS3uJgt7UIGriiVvnLgfmhHpMkcsmrFQip5k6prD
	k55i
X-Received: by 2002:a05:7300:dd03:b0:351:2958:1740 with SMTP id 5a478bee46e88-379681c67bfmr10577413eec.37.1794851698216;
        Mon, 16 Nov 2026 09:54:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 039/105] python3-grpcio: upgrade 1.84.1 -> 1.85.1
Date: Mon, 16 Nov 2026 09:52:51 -0800
Message-ID: <20261116175359.342679-39-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132495
Content-Type: text/plain; charset="utf-8"

Drop the OpenSSL 4 patch; upstream fixed the same code differently.
Refresh the cross-compilation patch, and backport the abseil fix for
clang rejecting a direct <bmi2intrin.h> include (needed for x86-64-v3)
to the bundled abseil.

Changes:
- Security: fix denial of service in the Health Watch RPC and HPACK
  host/:authority handling (1.85.1); no CVE ID given in the release
  notes. 1.85.0 also updates the gRPC root certificates.
- Add MLKEM1024 key exchange, OpenSSL 4 support and the
  map_host_header_to_authority experiment; remove OpenSSL 1.0.2 support.
- Fix AsyncIO client-streaming memory leak with interceptors, data race
  in PollerCompletionQueue, channelz and CSDS leaks, and
  SyncServicerContext.abort not raising.
- Unpin Cython for source builds.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Fix-OpenSSL-4.0-compatibility.patch  | 140 ------------------
 ...set-include-immintrin.h-instead-of-b.patch |  36 +++++
 ...n-enable-unbundled-cross-compilation.patch |   6 +-
 ...cio_1.84.1.bb => python3-grpcio_1.85.1.bb} |   4 +-
 4 files changed, 40 insertions(+), 146 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-OpenSSL-4.0-compatibility.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.84.1.bb => python3-grpcio_1.85.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-OpenSSL-4.0-compatibility.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-OpenSSL-4.0-compatibility.patch
deleted file mode 100644
index 9baa367d67..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-OpenSSL-4.0-compatibility.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 664032e1cee574e5d3874bbf55466448f537ab1a Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 27 Aug 2026 10:55:42 +0000
-Subject: [PATCH] Fix OpenSSL 4.0 compatibility in bundled grpc
-
-OpenSSL 4.0 returns const pointers from X509 accessor functions
-and makes ASN1_OCTET_STRING opaque. Use auto* for const returns
-and ASN1_STRING accessors for opaque access.
-
-Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
-
-Note: Fixes bundled grpc 1.78.0 C core. Our fix for areas not
-covered by the upstream PR.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- .../transport/tls/grpc_tls_crl_provider.cc      |  2 +-
- src/core/tsi/ssl_transport_security.cc          | 17 ++++++++---------
- src/core/tsi/ssl_transport_security_utils.cc    | 10 +++++-----
- 3 files changed, 14 insertions(+), 15 deletions(-)
-
-diff --git a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
-index 7bd4c5a..22d266e 100644
---- a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
-+++ b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
-@@ -56,7 +56,7 @@ absl::StatusOr<std::string> IssuerFromCrl(X509_CRL* crl) {
-   if (crl == nullptr) {
-     return absl::InvalidArgumentError("crl cannot be null");
-   }
--  X509_NAME* issuer = X509_CRL_get_issuer(crl);
-+  auto* issuer = X509_CRL_get_issuer(crl);
-   if (issuer == nullptr) {
-     return absl::InvalidArgumentError("crl cannot have null issuer");
-   }
-diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_transport_security.cc
-index 6526d3f..ff03697 100644
---- a/src/core/tsi/ssl_transport_security.cc
-+++ b/src/core/tsi/ssl_transport_security.cc
-@@ -1021,9 +1021,9 @@ static int looks_like_ip_address(absl::string_view name) {
- static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
-                                            size_t* utf8_size) {
-   int common_name_index = -1;
--  X509_NAME_ENTRY* common_name_entry = nullptr;
--  ASN1_STRING* common_name_asn1 = nullptr;
--  X509_NAME* subject_name = X509_get_subject_name(cert);
-+  const X509_NAME_ENTRY* common_name_entry = nullptr;
-+  const ASN1_STRING* common_name_asn1 = nullptr;
-+  auto* subject_name = X509_get_subject_name(cert);
-   int utf8_returned_size = 0;
-   if (subject_name == nullptr) {
-     VLOG(2) << "Could not get subject name from certificate.";
-@@ -1081,7 +1081,7 @@ static tsi_result peer_property_from_x509_common_name(
- static tsi_result peer_property_from_x509_subject(X509* cert,
-                                                   tsi_peer_property* property,
-                                                   bool is_verified_root_cert) {
--  X509_NAME* subject_name = X509_get_subject_name(cert);
-+  auto* subject_name = X509_get_subject_name(cert);
-   if (subject_name == nullptr) {
-     GRPC_TRACE_LOG(tsi, INFO) << "Could not get subject name from certificate.";
-     return TSI_NOT_FOUND;
-@@ -1177,16 +1177,16 @@ static tsi_result add_subject_alt_names_properties_to_peer(
-       char ntop_buf[INET6_ADDRSTRLEN];
-       int af;
- 
--      if (subject_alt_name->d.iPAddress->length == 4) {
-+      if (ASN1_STRING_length(subject_alt_name->d.iPAddress) == 4) {
-         af = AF_INET;
--      } else if (subject_alt_name->d.iPAddress->length == 16) {
-+      } else if (ASN1_STRING_length(subject_alt_name->d.iPAddress) == 16) {
-         af = AF_INET6;
-       } else {
-         LOG(ERROR) << "SAN IP Address contained invalid IP";
-         result = TSI_INTERNAL_ERROR;
-         break;
-       }
--      const char* name = inet_ntop(af, subject_alt_name->d.iPAddress->data,
-+      const char* name = inet_ntop(af, ASN1_STRING_get0_data(subject_alt_name->d.iPAddress),
-                                    ntop_buf, INET6_ADDRSTRLEN);
-       if (name == nullptr) {
-         LOG(ERROR) << "Could not get IP string from asn1 octet.";
-@@ -1472,13 +1472,12 @@ static tsi_result x509_store_load_certs(X509_STORE* cert_store,
-       break;  // We're at the end of stream.
-     }
-     if (root_names != nullptr) {
--      root_name = X509_get_subject_name(root);
-+      root_name = X509_NAME_dup(X509_get_subject_name(root));
-       if (root_name == nullptr) {
-         LOG(ERROR) << "Could not get name from root certificate.";
-         result = TSI_INVALID_ARGUMENT;
-         break;
-       }
--      root_name = X509_NAME_dup(root_name);
-       if (root_name == nullptr) {
-         result = TSI_OUT_OF_RESOURCES;
-         break;
-diff --git a/src/core/tsi/ssl_transport_security_utils.cc b/src/core/tsi/ssl_transport_security_utils.cc
-index 8f6607c..93876bb 100644
---- a/src/core/tsi/ssl_transport_security_utils.cc
-+++ b/src/core/tsi/ssl_transport_security_utils.cc
-@@ -282,11 +282,11 @@ bool VerifyCrlCertIssuerNamesMatch(X509_CRL* crl, X509* cert) {
-   if (cert == nullptr || crl == nullptr) {
-     return false;
-   }
--  X509_NAME* cert_issuer_name = X509_get_issuer_name(cert);
-+  auto* cert_issuer_name = X509_get_issuer_name(cert);
-   if (cert_issuer_name == nullptr) {
-     return false;
-   }
--  X509_NAME* crl_issuer_name = X509_CRL_get_issuer(crl);
-+  auto* crl_issuer_name = X509_CRL_get_issuer(crl);
-   if (crl_issuer_name == nullptr) {
-     return false;
-   }
-@@ -317,7 +317,7 @@ absl::StatusOr<std::string> IssuerFromCert(X509* cert) {
-   if (cert == nullptr) {
-     return absl::InvalidArgumentError("cert cannot be null");
-   }
--  X509_NAME* issuer = X509_get_issuer_name(cert);
-+  auto* issuer = X509_get_issuer_name(cert);
-   unsigned char* buf = nullptr;
-   int len = i2d_X509_NAME(issuer, &buf);
-   if (len < 0 || buf == nullptr) {
-@@ -332,7 +332,7 @@ absl::StatusOr<std::string> AkidFromCertificate(X509* cert) {
-   if (cert == nullptr) {
-     return absl::InvalidArgumentError("cert cannot be null.");
-   }
--  ASN1_OCTET_STRING* akid = nullptr;
-+  const ASN1_OCTET_STRING* akid = nullptr;
-   int j = X509_get_ext_by_NID(cert, NID_authority_key_identifier, -1);
-   // Can't have multiple occurrences
-   if (j >= 0) {
-@@ -357,7 +357,7 @@ absl::StatusOr<std::string> AkidFromCrl(X509_CRL* crl) {
-   if (crl == nullptr) {
-     return absl::InvalidArgumentError("Could not get AKID from crl.");
-   }
--  ASN1_OCTET_STRING* akid = nullptr;
-+  const ASN1_OCTET_STRING* akid = nullptr;
-   int j = X509_CRL_get_ext_by_NID(crl, NID_authority_key_identifier, -1);
-   // Can't have multiple occurrences
-   if (j >= 0) {
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
new file mode 100644
index 0000000000..7b31540ead
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jun 2026 00:00:00 +0000
+Subject: [PATCH] abseil: raw_hash_set: include <immintrin.h> instead of <bmi2intrin.h>
+
+Clang refuses a direct include of <bmi2intrin.h> and errors out with:
+
+  error: "Never use <bmi2intrin.h> directly; include <immintrin.h> instead."
+
+This is hit whenever __BMI2__ is defined, e.g. when building with
+-march=x86-64-v3. Mirror upstream and include the umbrella <immintrin.h>
+header guarded by an x86 check, which transitively provides the BMI2
+intrinsics (_bzhi_u32/_bzhi_u64) used in mask().
+
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/d851fdd768b27c02b3fb786fd0987faddd279ece]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/abseil-cpp/absl/container/internal/raw_hash_set.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
++++ b/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
+@@ -225,9 +225,9 @@
+ #include <ranges>  // NOLINT(build/c++20)
+ #endif
+
+-#ifdef __BMI2__
+-#include <bmi2intrin.h>
+-#endif  // __BMI2__
++#if defined(__i386__) || defined(__x86_64__)
++#include <immintrin.h>
++#endif
+
+ namespace absl {
+ ABSL_NAMESPACE_BEGIN
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
index 91d3257eda..0eb688ca28 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
@@ -12,14 +12,12 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  setup.py | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/setup.py b/setup.py
-index 39ca17e..bffa9fb 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -341,25 +341,25 @@ if BUILD_WITH_SYSTEM_OPENSSL:
+@@ -345,25 +345,25 @@
+     CORE_C_FILES = filter(
          lambda x: "third_party/boringssl" not in x, CORE_C_FILES
      )
-     CORE_C_FILES = filter(lambda x: "src/boringssl" not in x, CORE_C_FILES)
 -    SSL_INCLUDE = (os.path.join("/usr", "include", "openssl"),)
 +    SSL_INCLUDE = ()
  
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.84.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.85.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.84.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.85.1.bb
index fc22d4b481..2668771ede 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.84.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.85.1.bb
@@ -11,10 +11,10 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
-           file://0001-Fix-OpenSSL-4.0-compatibility.patch \
            file://abseil-ppc-fixes.patch \
+           file://0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch \
            "
-SRC_URI[sha256sum] = "446e7876b9b991fa124c1d414899fa7cf95f89a3e71237ea0161863dc0b2c09f"
+SRC_URI[sha256sum] = "5f530287d5de5f7f66089ead81de44f6787162944dab3922efa65dfdff108a1d"
 
 RDEPENDS:${PN} = "python3-protobuf python3-typing-extensions"
 
