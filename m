Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8403.1792765978684092623
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 07:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ch8iYX/T;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261023143255377a0c1aad00020754-cwyusk@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261023143255377a0c1aad00020754
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 23 Oct 2026 16:32:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kdlEwZXDAIohiZAJYiV/HQJcSCdpG++7NGS1qePDqAo=;
 b=Ch8iYX/TieojcXeYVIScQhzBzSGu4YbhS3N9gvTfPhH6LT56+nCjHvACrcYX2yHuJ4nud2
 pUp9X6r9ebnINl1U/pX25ZM7k/guHkCW4smL28FZRa8FHovuo9Tcn0DwvYdcaFvYGJtQiC6e
 8cdMxqbCZEyXmeV84sIAI5BE9IC7tRp0htir+cSiv7I207bKU36gm/jQxEboGlMt3e8kjweJ
 FheuDrxY1hhsETLRrhSgDdexv8MtpeJ2CVKrfa6w5DRlSXBtVOaCUAxeByhuX8w5ZPjttTAE
 jQI4QJrbX9a7UABX8ysE9zcFeWa/Qpkp9SWLBY8YvEb4kNo4j+Rxt4Hg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 2/5] python3-grpcio: upgrade 1.78.0 -> 1.84.1
Date: Fri, 23 Oct 2026 16:32:26 +0200
Message-ID: <20261023143229.184415-2-peter.marko@siemens.com>
In-Reply-To: <20261023143229.184415-1-peter.marko@siemens.com>
References: <20261023143229.184415-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 14:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131367
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to addresses eMudhra certificates issue.
See https://emudhra.we-have-a-problem.com/

License-Update: clarified which license applies to which file
* https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-Fix-OpenSSL-4.0-compatibility.patch   | 18 +++++++++---------
 ...on-enable-unbundled-cross-compilation.patch |  2 +-
 ...pcio_1.78.0.bb => python3-grpcio_1.84.1.bb} |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.78.0.bb => python3-grpcio_1.84.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-OpenSSL-4.0-compatibility.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-OpenSSL-4.0-compatibility.patch
index 895ceab88c..9baa367d67 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-OpenSSL-4.0-compatibility.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-OpenSSL-4.0-compatibility.patch
@@ -36,7 +36,7 @@ diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_transport
 index 6526d3f..ff03697 100644
 --- a/src/core/tsi/ssl_transport_security.cc
 +++ b/src/core/tsi/ssl_transport_security.cc
-@@ -406,9 +406,9 @@ static int looks_like_ip_address(absl::string_view name) {
+@@ -1021,9 +1021,9 @@ static int looks_like_ip_address(absl::string_view name) {
  static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
                                             size_t* utf8_size) {
    int common_name_index = -1;
@@ -49,7 +49,7 @@ index 6526d3f..ff03697 100644
    int utf8_returned_size = 0;
    if (subject_name == nullptr) {
      VLOG(2) << "Could not get subject name from certificate.";
-@@ -466,7 +466,7 @@ static tsi_result peer_property_from_x509_common_name(
+@@ -1081,7 +1081,7 @@ static tsi_result peer_property_from_x509_common_name(
  static tsi_result peer_property_from_x509_subject(X509* cert,
                                                    tsi_peer_property* property,
                                                    bool is_verified_root_cert) {
@@ -58,7 +58,7 @@ index 6526d3f..ff03697 100644
    if (subject_name == nullptr) {
      GRPC_TRACE_LOG(tsi, INFO) << "Could not get subject name from certificate.";
      return TSI_NOT_FOUND;
-@@ -562,16 +562,16 @@ static tsi_result add_subject_alt_names_properties_to_peer(
+@@ -1177,16 +1177,16 @@ static tsi_result add_subject_alt_names_properties_to_peer(
        char ntop_buf[INET6_ADDRSTRLEN];
        int af;
  
@@ -78,7 +78,7 @@ index 6526d3f..ff03697 100644
                                     ntop_buf, INET6_ADDRSTRLEN);
        if (name == nullptr) {
          LOG(ERROR) << "Could not get IP string from asn1 octet.";
-@@ -855,13 +855,12 @@ static tsi_result x509_store_load_certs(X509_STORE* cert_store,
+@@ -1472,13 +1472,12 @@ static tsi_result x509_store_load_certs(X509_STORE* cert_store,
        break;  // We're at the end of stream.
      }
      if (root_names != nullptr) {
@@ -97,13 +97,13 @@ diff --git a/src/core/tsi/ssl_transport_security_utils.cc b/src/core/tsi/ssl_tra
 index 8f6607c..93876bb 100644
 --- a/src/core/tsi/ssl_transport_security_utils.cc
 +++ b/src/core/tsi/ssl_transport_security_utils.cc
-@@ -281,11 +281,11 @@ bool VerifyCrlCertIssuerNamesMatch(X509_CRL* crl, X509* cert) {
+@@ -282,11 +282,11 @@ bool VerifyCrlCertIssuerNamesMatch(X509_CRL* crl, X509* cert) {
    if (cert == nullptr || crl == nullptr) {
      return false;
    }
 -  X509_NAME* cert_issuer_name = X509_get_issuer_name(cert);
 +  auto* cert_issuer_name = X509_get_issuer_name(cert);
-   if (cert == nullptr) {
+   if (cert_issuer_name == nullptr) {
      return false;
    }
 -  X509_NAME* crl_issuer_name = X509_CRL_get_issuer(crl);
@@ -111,7 +111,7 @@ index 8f6607c..93876bb 100644
    if (crl_issuer_name == nullptr) {
      return false;
    }
-@@ -316,7 +316,7 @@ absl::StatusOr<std::string> IssuerFromCert(X509* cert) {
+@@ -317,7 +317,7 @@ absl::StatusOr<std::string> IssuerFromCert(X509* cert) {
    if (cert == nullptr) {
      return absl::InvalidArgumentError("cert cannot be null");
    }
@@ -120,7 +120,7 @@ index 8f6607c..93876bb 100644
    unsigned char* buf = nullptr;
    int len = i2d_X509_NAME(issuer, &buf);
    if (len < 0 || buf == nullptr) {
-@@ -331,7 +331,7 @@ absl::StatusOr<std::string> AkidFromCertificate(X509* cert) {
+@@ -332,7 +332,7 @@ absl::StatusOr<std::string> AkidFromCertificate(X509* cert) {
    if (cert == nullptr) {
      return absl::InvalidArgumentError("cert cannot be null.");
    }
@@ -129,7 +129,7 @@ index 8f6607c..93876bb 100644
    int j = X509_get_ext_by_NID(cert, NID_authority_key_identifier, -1);
    // Can't have multiple occurrences
    if (j >= 0) {
-@@ -356,7 +356,7 @@ absl::StatusOr<std::string> AkidFromCrl(X509_CRL* crl) {
+@@ -357,7 +357,7 @@ absl::StatusOr<std::string> AkidFromCrl(X509_CRL* crl) {
    if (crl == nullptr) {
      return absl::InvalidArgumentError("Could not get AKID from crl.");
    }
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
index bfc471f3fe..91d3257eda 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
@@ -16,7 +16,7 @@ diff --git a/setup.py b/setup.py
 index 39ca17e..bffa9fb 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -318,25 +318,25 @@ if BUILD_WITH_SYSTEM_OPENSSL:
+@@ -341,25 +341,25 @@ if BUILD_WITH_SYSTEM_OPENSSL:
          lambda x: "third_party/boringssl" not in x, CORE_C_FILES
      )
      CORE_C_FILES = filter(lambda x: "src/boringssl" not in x, CORE_C_FILES)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.84.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.84.1.bb
index 5cd530f1c4..fc22d4b481 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.84.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.grpc.io/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND MPL-2.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906 \
+    file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9 \
     file://third_party/utf8_range/utf8_validity.h;beginline=1;endline=5;md5=db08ddb5817e660489678e7c3653805a \
     file://third_party/xxhash/xxhash.h;beginline=1;endline=34;md5=d41d564db2353fc80a713956d85b1690 \
 "
@@ -14,7 +14,7 @@ SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://0001-Fix-OpenSSL-4.0-compatibility.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "7382b95189546f375c174f53a5fa873cef91c4b8005faa05cc5b3beea9c4f1c5"
+SRC_URI[sha256sum] = "446e7876b9b991fa124c1d414899fa7cf95f89a3e71237ea0161863dc0b2c09f"
 
 RDEPENDS:${PN} = "python3-protobuf python3-typing-extensions"
 
