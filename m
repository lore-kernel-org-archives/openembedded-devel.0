Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3903.1794729102649085478
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LrEXLeT5;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4585630eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729102; x=1795333902; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVbwbaWIvB05zyAauETUVQVS0Aqymq5PJDtaBApfajc=;
        b=LrEXLeT5fzDWMqEEtLws8BtDj0mElZdzBB1hfv4uZewKBhLpEmvee3FS/JnkF7iTSC
         0PbL8v/i8ptZhecc3A8CbLyXXwcvbUkWGnTAMHCG3jxsxY+jt3qC8/8Hbnq+SnRCeqvR
         tu/OKNW7PB9zBYvzoEWbsbPh3AB5UbDzD2BgnNzbivko8VG+c04LadtsMV3pN71vU5/X
         A09d9iGtcaK1eMRCbEEmDppZTEks7bHNT8e89kvSmYmdY6bbxEA0If3U2+PQabbk3Y2X
         GfNf6MCm1emJ102fv2Lov3HXJCWbfM0vouwz8xNFoJcrVQoEOKYjQsG6puWMNhkI+Fyf
         BIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729102; x=1795333902;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVbwbaWIvB05zyAauETUVQVS0Aqymq5PJDtaBApfajc=;
        b=npCbH7yIaAA0zQQRoY0C8dY8VrrYpyHNtZbEDI77V690XmYajmk/v6T3MUF1UfMWic
         puG+8oaBMBbyZuljIpCMg1mKj+UhbdDrdNAFTFylrc1Gg/C+QR0c27fDT4HBJpWR544V
         Egq4iM/lWyrfFzVw/9MFI6LaTPQU/SNRH5poQrYywh8DRoW9D6tA6zpxzaC/pBFEzRga
         kL9Y0IrCkM3S8CNW4ol8BSyiiNlOKQxtmWY7Rp2qWTv8wiLbI0bT72QbczIpgrRZFy2f
         C0ULgV6xLLJT2DLZfbeVpkV9PER3rB56d2nBmoaJ9NLtfK9N58r99WVAHlMTaTIu0Uur
         GlBg==
X-Gm-Message-State: APuU4Z/qtNBjTsCB+pjRfjFlWyC97l31KBvv+U1cSKMbugy5iS1F5eq+
	b1F2P8aS7dGUR6oK/ht8Ts9AvtRuyeQxAipwr48lwbbVO+CGbMH6P1V6REzalR6y
X-Gm-Gg: AYBFou0uL78lof2rswPGcfzt0D1fEiyBjaBemsMs47+H6F6+i7h4tfXpBfJTirCNTrH
	0psGImA3DfTyHgC8EH80ZuWMYO//2JkAwWFzLq3mRLebO53ye6PbWjIBH11xH911J3i1FyMc7yg
	SWHgLRKTWL6hMsoJz8aFCQ9qL0e5g7MiSlj+7GxzpVEcmY8NqzsXWTBNv6d6JVNvgF+UC/jJURj
	Xl4aj/0MguYjyUCi2on5yfKimcdvI9c3bs0K42TBFaNIo2YA0jGU6YWYSjGDuPL/1exv2wGB4JN
	HI4Z6qiEgX4auWoGOw17n3onE/72avJxArIrq6BRFfY3dkMCfwtPEjU6C7MKVw5MIx8cXsQnsF1
	ykSqOA2rCuu1xtAI0QlW8CT5KSpnMHC9d37w0qWvEmCiGm9lCzXIkveg/OTdGDQPf4Fs3E6bzfp
	ZCHy+OB6IwK9YIHuny+q1m/V0st/FePUHHVmVVApRxOQ87ORAb+JGHfPgBzZ1vYIGta5RhXq/VW
	4wI1vrruzZjOZ3sXLMSp+VA7oaD5+HpotzkJyZ+ABSuIsCMiEQSaNRzbJyzefba3W0b9PRvy02U
	MYDO0wxuEtWEu+X2UjYJQVwVIQ3Fw2yMMX5ylI+GhEYI/SCvNGpMu1+kqgBE4vZnyF7b1AQUNQT
	E4HCD5VBD/b9NEj1xu0ZblRX4SSSRRRxskCyTbFP1obe0FUZLMGKvrwbDIRsh+BtukGukyvlZzK
	4fqrhjwHqv0djaKjKAwcemxnNEP7Jrf28o89PFvk/OluMQ0bX3feye0TRdlOpMrQZCqtjUGk08N
	SfEdbN5JvxB9cMkcsYH0Xs0HaQRDQMSeQgS4eVqI24ftOrtWgKu9tqw7LLqhFGs7WtZRHxuaCml
	etEEkg==
X-Received: by 2002:a05:693c:8115:b0:36a:1008:5815 with SMTP id 5a478bee46e88-37963372d85mr7759238eec.5.1794729101888;
        Sat, 14 Nov 2026 23:51:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 86/96] grpc: upgrade 1.84.2 -> 1.85.2
Date: Sat, 14 Nov 2026 23:49:04 -0800
Message-ID: <20261115074918.2932593-86-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132356
Content-Type: text/plain; charset="utf-8"

Drop the four OpenSSL 4.0 patches; this release builds against
OpenSSL 4.0 without them (the upstream PR was closed in favour of
other fixes).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ls-Fix-OpenSSL-3.0-4.0-compatibility.patch | 85 -------------------
 ...L-4.0-const-and-opaque-compatibility.patch | 61 -------------
 ...sport_security_utils-for-OpenSSL-4.0.patch | 63 --------------
 ...ing-const-qualifiers-for-OpenSSL-4.0.patch | 49 -----------
 .../grpc/{grpc_1.84.2.bb => grpc_1.85.2.bb}   |  8 +-
 5 files changed, 2 insertions(+), 264 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-credentials-Fix-OpenSSL-3.0-4.0-compatibility.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_transport_security_utils-for-OpenSSL-4.0.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.84.2.bb => grpc_1.85.2.bb} (88%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-credentials-Fix-OpenSSL-3.0-4.0-compatibility.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-credentials-Fix-OpenSSL-3.0-4.0-compatibility.patch
deleted file mode 100644
index f062ecce08..0000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-credentials-Fix-OpenSSL-3.0-4.0-compatibility.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From b07ee3b98c30251094692b84d1253e3ca881ff96 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Bj=C3=B6rn=20Svensson?= <bjorn.a.svensson@est.tech>
-Date: Tue, 24 Mar 2026 13:12:07 +0100
-Subject: [PATCH] credentials: Fix OpenSSL 3.0+/4.0 compatibility
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-- Guard openssl/hmac.h include behind OpenSSL < 3.0 version check
-- Replace one-shot HMAC() with EVP_Q_mac() for OpenSSL 3.0+
-- Handle X509_CRL_get_issuer() which returns const in OpenSSL 4.0,
-  with const_cast for i2d_X509_NAME()
-
-Signed-off-by: Björn Svensson <bjorn.a.svensson@est.tech>
-Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- .../credentials/call/external/aws_request_signer.cc | 13 +++++++++++++
- .../transport/tls/grpc_tls_crl_provider.cc          |  4 ++--
- 2 files changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/src/core/credentials/call/external/aws_request_signer.cc b/src/core/credentials/call/external/aws_request_signer.cc
-index f7fb7a25b1d0b..26c70ccc7c174 100644
---- a/src/core/credentials/call/external/aws_request_signer.cc
-+++ b/src/core/credentials/call/external/aws_request_signer.cc
-@@ -18,7 +18,9 @@
- #include <grpc/support/port_platform.h>
- #include <openssl/crypto.h>
- #include <openssl/evp.h>
-+#if OPENSSL_VERSION_NUMBER < 0x30000000L
- #include <openssl/hmac.h>
-+#endif
- #include <openssl/sha.h>
- 
- #include <utility>
-@@ -41,6 +43,7 @@ namespace {
- 
- #if OPENSSL_VERSION_NUMBER >= 0x30000000L
- const char kSha256[] = "SHA256";
-+const char kHmacName[] = "HMAC";
- #endif
- const char kAlgorithm[] = "AWS4-HMAC-SHA256";
- const char kDateFormat[] = "%a, %d %b %E4Y %H:%M:%S %Z";
-@@ -67,12 +70,22 @@ std::string SHA256Hex(const std::string& str) {
- }
- 
- std::string HMAC(const std::string& key, const std::string& msg) {
-+#if OPENSSL_VERSION_NUMBER < 0x30000000L
-   unsigned int len;
-   unsigned char digest[EVP_MAX_MD_SIZE];
-   HMAC(EVP_sha256(), key.c_str(), key.length(),
-        reinterpret_cast<const unsigned char*>(msg.c_str()), msg.length(),
-        digest, &len);
-   return std::string(digest, digest + len);
-+#else
-+  size_t len = 0;
-+  unsigned char digest[EVP_MAX_MD_SIZE];
-+  EVP_Q_mac(nullptr, kHmacName, nullptr, kSha256, nullptr,
-+            reinterpret_cast<const unsigned char*>(key.c_str()), key.length(),
-+            reinterpret_cast<const unsigned char*>(msg.c_str()), msg.length(),
-+            digest, sizeof(digest), &len);
-+  return std::string(digest, digest + len);
-+#endif
- }
- 
- }  // namespace
-diff --git a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
-index 7bd4c5ab0b49f..99ed93d5d2944 100644
---- a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
-+++ b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
-@@ -56,12 +56,12 @@ absl::StatusOr<std::string> IssuerFromCrl(X509_CRL* crl) {
-   if (crl == nullptr) {
-     return absl::InvalidArgumentError("crl cannot be null");
-   }
--  X509_NAME* issuer = X509_CRL_get_issuer(crl);
-+  auto* issuer = X509_CRL_get_issuer(crl);
-   if (issuer == nullptr) {
-     return absl::InvalidArgumentError("crl cannot have null issuer");
-   }
-   unsigned char* buf = nullptr;
--  int len = i2d_X509_NAME(issuer, &buf);
-+  int len = i2d_X509_NAME(const_cast<X509_NAME*>(issuer), &buf);
-   if (len < 0 || buf == nullptr) {
-     return absl::InvalidArgumentError("crl cannot have null issuer");
-   }
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch b/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch
deleted file mode 100644
index bbacffc926..0000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 42693a829197a9120816fa91b9ce55535d798b28 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 26 Aug 2026 19:50:00 +0000
-Subject: [PATCH] tsi: fix OpenSSL 4.0 const and opaque type compatibility
-
-OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
-X509_get_issuer_name(), X509_get0_serialNumber() and makes
-ASN1_OCTET_STRING opaque. Use auto* to deduce correct const type
-and use ASN1_STRING accessors for opaque struct access.
-
-Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
-
-Note: Our fix for areas not covered by the upstream PR.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/core/tsi/ssl_transport_security.cc | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_transport_security.cc
-index 922bb836e14..ee2092acece 100644
---- a/src/core/tsi/ssl_transport_security.cc
-+++ b/src/core/tsi/ssl_transport_security.cc
-@@ -1023,7 +1023,7 @@ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
-   int common_name_index = -1;
-   X509_NAME_ENTRY* common_name_entry = nullptr;
-   ASN1_STRING* common_name_asn1 = nullptr;
--  X509_NAME* subject_name = X509_get_subject_name(cert);
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
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_transport_security_utils-for-OpenSSL-4.0.patch b/meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_transport_security_utils-for-OpenSSL-4.0.patch
deleted file mode 100644
index 56eaa50ad4..0000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_transport_security_utils-for-OpenSSL-4.0.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From d2beead89706a34ade404bfa7bec2f95e9b6225a Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 26 Aug 2026 19:51:01 +0000
-Subject: [PATCH] tsi: fix ssl_transport_security_utils for OpenSSL 4.0
-
-OpenSSL 4.0 returns const pointers from X509_get_issuer_name(),
-X509_CRL_get_issuer(), and makes ASN1_OCTET_STRING opaque. Use
-auto* for X509_NAME and const for ASN1_OCTET_STRING.
-
-Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
-
-Note: Our fix for areas not covered by the upstream PR.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/core/tsi/ssl_transport_security_utils.cc | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/core/tsi/ssl_transport_security_utils.cc b/src/core/tsi/ssl_transport_security_utils.cc
-index 7318bc3f780..2738ffad923 100644
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
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch b/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
deleted file mode 100644
index 16c9f67417..0000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 12710dde230ae1721e1c7119f51490c239513c41 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 27 Aug 2026 09:42:20 +0000
-Subject: [PATCH] tsi: fix remaining const qualifiers for OpenSSL 4.0
-
-OpenSSL 4.0 returns const pointers from X509_NAME_get_entry(),
-X509_NAME_ENTRY_get_data(), and X509_get_subject_name().
-Combine X509_get_subject_name + X509_NAME_dup into single call
-to avoid const-to-non-const assignment.
-
-Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
-
-Note: Our fix for areas not covered by the upstream PR.
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/core/tsi/ssl_transport_security.cc | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_transport_security.cc
-index ee2092acece..23340beda98 100644
---- a/src/core/tsi/ssl_transport_security.cc
-+++ b/src/core/tsi/ssl_transport_security.cc
-@@ -1021,8 +1021,8 @@ static int looks_like_ip_address(absl::string_view name) {
- static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
-                                            size_t* utf8_size) {
-   int common_name_index = -1;
--  X509_NAME_ENTRY* common_name_entry = nullptr;
--  ASN1_STRING* common_name_asn1 = nullptr;
-+  const X509_NAME_ENTRY* common_name_entry = nullptr;
-+  const ASN1_STRING* common_name_asn1 = nullptr;
-   auto* subject_name = X509_get_subject_name(cert);
-   int utf8_returned_size = 0;
-   if (subject_name == nullptr) {
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
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.84.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.85.2.bb
similarity index 88%
rename from meta-oe/recipes-devtools/grpc/grpc_1.84.2.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.85.2.bb
index db0725db3f..ad4198c35e 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.84.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.85.2.bb
@@ -23,14 +23,10 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-SRCREV = "41ee9aad18b902ea75a6ff5505d71dce6082613f"
-BRANCH = "v1.84.x"
+SRCREV = "5a9ca1fb6bf364dfb1f9396cc020219ca7d117b2"
+BRANCH = "v1.85.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
-           file://0001-credentials-Fix-OpenSSL-3.0-4.0-compatibility.patch \
-           file://0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch \
-           file://0003-tsi-fix-ssl_transport_security_utils-for-OpenSSL-4.0.patch \
-           file://0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch \
            "
 
 inherit cmake pkgconfig
