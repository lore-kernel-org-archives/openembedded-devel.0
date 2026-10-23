Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8400.1792765972157210331
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 07:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=S5HlEmKh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261023143248e4e78cea4800020776-hollsk@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261023143248e4e78cea4800020776
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 23 Oct 2026 16:32:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TnsqvxCjCKR+hkH40/QDIKbUBR9ThvtJPyq5nwuy8Xk=;
 b=S5HlEmKhKvVsBovvK332bes9A9hr3K+vf6VjPJkh0tPXYe2ZgJeCjH8mgQM1Y5Y282LFZi
 pXKLdYC8gtTvMHc43/AXILaAiLZy/E13J1u7tTlx2U+4HbyzbpIuZoXmK/5dUXbp4P8NwGe+
 0gbEtUhfPUPVYNTuu54+2PEAToe8yjVuUjX2j5QCzJiq/11yUoHSFUKm0a4nH/d4Fs+ndHaN
 DeI5FEj+9DCwKCIPbpWUJxBU0gjep+N1SigypBPJOSPCsUzthyMHtIoEGdYIyWAzSsn2S+kI
 4XfMctcnGFOzsOIqgRKtwZ70OgOACvs3mkGcn8UlMzYYAMrx4Q0Y07yA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/5] grpc: upgrade 1.84.0 -> 1.84.1
Date: Fri, 23 Oct 2026 16:32:25 +0200
Message-ID: <20261023143229.184415-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 14:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131366
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to addresses eMudhra certificates issue.
See https://emudhra.we-have-a-problem.com/

$ git log --oneline v1.84.0..v1.84.1
b0c0c4f882 (HEAD -> v1.84.x, tag: v1.84.1) [Release] Bump version to 1.84.1 (on v1.84.x branch) (#43709)
405e6a1c30 [Backport][v1.84.x][security] Update gRPC repo roots. (#43700)
826616aed4 [Backport][v1.84.x][CI] Various macOS CI reliability fixes (#43701)
49d6985875 [PSM Interop][Backport v1.84.x] Update xDS legacy test scripts for health proto pa… (#43572)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch  | 2 +-
 ...tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch | 6 +++---
 ...tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch | 4 ++--
 .../grpc/{grpc_1.84.0.bb => grpc_1.84.1.bb}                 | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.84.0.bb => grpc_1.84.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
index 594503ae2a..106a56cff3 100644
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
@@ -18,7 +18,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 06e6453b5c..476d7f1576 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -306,6 +306,9 @@ if(UNIX AND NOT HAIKU)
+@@ -353,6 +353,9 @@ if(UNIX AND NOT HAIKU)
        set(_gRPC_ALLTARGETS_LIBRARIES ${_gRPC_ALLTARGETS_LIBRARIES} rt)
      endif()
    endif()
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch b/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch
index 91f9c7e815..bbacffc926 100644
--- a/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch
@@ -21,7 +21,7 @@ diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_transport
 index 922bb836e14..ee2092acece 100644
 --- a/src/core/tsi/ssl_transport_security.cc
 +++ b/src/core/tsi/ssl_transport_security.cc
-@@ -893,7 +893,7 @@ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
+@@ -1023,7 +1023,7 @@ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
    int common_name_index = -1;
    X509_NAME_ENTRY* common_name_entry = nullptr;
    ASN1_STRING* common_name_asn1 = nullptr;
@@ -30,7 +30,7 @@ index 922bb836e14..ee2092acece 100644
    int utf8_returned_size = 0;
    if (subject_name == nullptr) {
      VLOG(2) << "Could not get subject name from certificate.";
-@@ -951,7 +951,7 @@ static tsi_result peer_property_from_x509_common_name(
+@@ -1081,7 +1081,7 @@ static tsi_result peer_property_from_x509_common_name(
  static tsi_result peer_property_from_x509_subject(X509* cert,
                                                    tsi_peer_property* property,
                                                    bool is_verified_root_cert) {
@@ -39,7 +39,7 @@ index 922bb836e14..ee2092acece 100644
    if (subject_name == nullptr) {
      GRPC_TRACE_LOG(tsi, INFO) << "Could not get subject name from certificate.";
      return TSI_NOT_FOUND;
-@@ -1047,16 +1047,16 @@ static tsi_result add_subject_alt_names_properties_to_peer(
+@@ -1177,16 +1177,16 @@ static tsi_result add_subject_alt_names_properties_to_peer(
        char ntop_buf[INET6_ADDRSTRLEN];
        int af;
  
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch b/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
index 956ea64f33..16c9f67417 100644
--- a/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
@@ -21,7 +21,7 @@ diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_transport
 index ee2092acece..23340beda98 100644
 --- a/src/core/tsi/ssl_transport_security.cc
 +++ b/src/core/tsi/ssl_transport_security.cc
-@@ -891,8 +891,8 @@ static int looks_like_ip_address(absl::string_view name) {
+@@ -1021,8 +1021,8 @@ static int looks_like_ip_address(absl::string_view name) {
  static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
                                             size_t* utf8_size) {
    int common_name_index = -1;
@@ -32,7 +32,7 @@ index ee2092acece..23340beda98 100644
    auto* subject_name = X509_get_subject_name(cert);
    int utf8_returned_size = 0;
    if (subject_name == nullptr) {
-@@ -1342,13 +1342,12 @@ static tsi_result x509_store_load_certs(X509_STORE* cert_store,
+@@ -1472,13 +1472,12 @@ static tsi_result x509_store_load_certs(X509_STORE* cert_store,
        break;  // We're at the end of stream.
      }
      if (root_names != nullptr) {
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.84.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.84.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.84.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.84.1.bb
index e38fbb292b..274aeb4ba3 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.84.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.84.1.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-SRCREV = "3252a89f10d8e92997862167ca7d095ecda85973"
+SRCREV = "b0c0c4f8823ba69e7e43aaaf183c30a43e549924"
 BRANCH = "v1.84.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
