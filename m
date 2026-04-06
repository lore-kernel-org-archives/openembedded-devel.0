Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D490AF46C72
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 18:33:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61915.1775500379569611484
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 11:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LaQL41DQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so39984055e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 11:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775500378; x=1776105178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lU6HaW7LUuOwhCyrhOBtwyQbhhTzrybcwmQftZALw4=;
        b=LaQL41DQWeF5kH3HncnmbllmlsFMbTwLZiKtS6VctV2xfuzNLmLHroudLhs9CZRyCg
         nM0t5x1Iedxh/hllEjIpq3e3ERjRABnqbhgw+NriYlr0Wyqo7Ydtg5vZzrtFVn2CLHPK
         sore4U+T6swEBrdGoM27vjuLlKd2r24GGzn3AOHfC1ZEtNOaRD40Wpx558PgncmyfQUj
         MZ+JSZTHCKefxuTW0zAojiglmIufxzgJ8PYlcoH2p4TDQgBvdL1C+d1I11CRY8mCrnYb
         QsYtN+731TVYdIuR0/CIH/My1SYyRk9IW4KPStZrljZVAHQ1bB1KVhcePxLK3MRNVBK2
         gnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775500378; x=1776105178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8lU6HaW7LUuOwhCyrhOBtwyQbhhTzrybcwmQftZALw4=;
        b=ZN5fbJSOob6ZO2YWs2B3pfptxx6v13nOXlv+tupLocSQzkcMhcCX19gbJfQnzuMCYd
         r8cpZ01gOhnyMN2baT/mQu+wphHD02ngRfYGQdIaLHTC1RzAvBTaXmd1bhtANCwqzEOP
         vwhj4k6Z3tOH3e6Q646K5lMRWn6H6nRCwQxwwiDb3Gqo+WEGZYB0Hk0X4zcHtNEd8cFW
         SGW0wQu3QrcWr/Xp7yHjUbUpWct9m+yswakUxnlgOZSxy4bIk0CqBtWszDenL8eS9lom
         9WA5h/tOboPMea+3cGMen3VebrMn6GsSsb0B7rTp+Ad34l8GtUyI15uIiNcs2QHhU60F
         WjWQ==
X-Gm-Message-State: AOJu0Ywbkcxbg9HnlWmjF/yQKSLrP24c3BY9/eVpmwUZ797BefDJLtyz
	jtarEa9zFZJy5UzuIMGLTy8hYrGT6rUqQFplR2Cyb2x0XGwUEvcXJvPiO73dXA==
X-Gm-Gg: AeBDieseD2sChhlj7OFmNi/PhA2i6PmGRZWkzftK5+AzQZxU7xzMpsTwVqLPYFmKJn4
	zA+snpO2HlFCWg6FUpheLdW8dDF5cwWmfBswzZ5HY8xJl5Y9bS57aZ2aeogELia4euPvqTnPJT0
	5rlx2vGN/StCHhRJ2jEz7L250JntDkHjXQLVOo3z3+V4MVoQPGVV/OyPhmMHBQV+uHC/vPejNtb
	XbEmuFK34F7wCpBVKwqqOMRMBzlGHtVerz5/voUivzFipYWBwX3UECKDVO1Swk9GUBxv470ZGtl
	HH8uddPfWAX5uuYroL/HZdI1iyi46ZWOsr8+b3YGfGv5uBKAZ9JK0QghvDxhm/uYe1kddgXZjKO
	Ku4tv88LmNeXOLLk6vfQQkUOHDzvyMk32vf46YyRu3udK/1jYTIzsgmaYqMwSzjH4EHbRJsk6Bu
	oM+E/I3Ib2gHqr5hwRBG4E
X-Received: by 2002:a05:600c:638e:b0:487:575:5e1 with SMTP id 5b1f17b1804b1-488997adbbcmr195798565e9.24.1775500377734;
        Mon, 06 Apr 2026 11:32:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b64f03afsm61164515e9.0.2026.04.06.11.32.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:32:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/3] botan: patch CVE-2026-32883
Date: Mon,  6 Apr 2026 20:32:54 +0200
Message-ID: <20260406183255.3883660-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406183255.3883660-1-skandigraun@gmail.com>
References: <20260406183255.3883660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 18:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126060

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32883

Backport the patch that was identified by Debian[1].
The included test passed successfully (along with the other tests).

[1]: https://security-tracker.debian.org/tracker/CVE-2026-32883

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../botan/botan/CVE-2026-32883.patch          | 171 ++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_3.10.0.bb  |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-32883.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/CVE-2026-32883.patch b/meta-oe/recipes-crypto/botan/botan/CVE-2026-32883.patch
new file mode 100644
index 0000000000..9cace2118e
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/CVE-2026-32883.patch
@@ -0,0 +1,171 @@
+From 38a49aafc8115ddb6275ca6bbb8748b3d7b3064d Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sun, 15 Mar 2026 10:28:52 -0400
+Subject: [PATCH] Fix OCSP response verification
+
+During a refactoring of OCSP (#3067) the check that the OCSP response signature
+is valid was omitted. This allows OCSP responses to be forged.
+
+CVE: CVE-2026-32883
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/acbffadcede18b36eea42beae57e6cae4b4da4a0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/x509/x509path.cpp | 67 +++++++++++++++++++++++----------------
+ src/tests/test_ocsp.cpp   | 47 +++++++++++++++++++++++++++
+ 2 files changed, 87 insertions(+), 27 deletions(-)
+
+diff --git a/src/lib/x509/x509path.cpp b/src/lib/x509/x509path.cpp
+index 4059d32..8212bb2 100644
+--- a/src/lib/x509/x509path.cpp
++++ b/src/lib/x509/x509path.cpp
+@@ -298,6 +298,41 @@ Certificate_Status_Code verify_ocsp_signing_cert(const X509_Certificate& signing
+    return validation_result.result();
+ }
+ 
++std::set<Certificate_Status_Code> evaluate_ocsp_response(const OCSP::Response& ocsp_response,
++                                                         const X509_Certificate& subject,
++                                                         const X509_Certificate& ca,
++                                                         const std::vector<X509_Certificate>& cert_path,
++                                                         const std::vector<Certificate_Store*>& certstores,
++                                                         std::chrono::system_clock::time_point ref_time,
++                                                         const Path_Validation_Restrictions& restrictions) {
++   // Handle softfail conditions (eg. OCSP unavailable)
++   if(auto dummy_status = ocsp_response.dummy_status()) {
++      return {dummy_status.value()};
++   }
++
++   // Find the certificate that signed this OCSP response
++   auto signing_cert = ocsp_response.find_signing_certificate(ca, restrictions.trusted_ocsp_responders());
++   if(!signing_cert) {
++      return {Certificate_Status_Code::OCSP_ISSUER_NOT_FOUND};
++   }
++
++   // Verify the signing certificate is trusted
++   auto cert_status = verify_ocsp_signing_cert(
++      signing_cert.value(), ca, concat(ocsp_response.certificates(), cert_path), certstores, ref_time, restrictions);
++   if(cert_status > Certificate_Status_Code::FIRST_ERROR_STATUS) {
++      return {cert_status, Certificate_Status_Code::OCSP_ISSUER_NOT_TRUSTED};
++   }
++
++   // Verify the cryptographic signature on the OCSP response
++   auto sig_status = ocsp_response.verify_signature(signing_cert.value());
++   if(sig_status != Certificate_Status_Code::OCSP_SIGNATURE_OK) {
++      return {sig_status};
++   }
++
++   // All checks passed, return the certificate's revocation status
++   return {ocsp_response.status_for(ca, subject, ref_time, restrictions.max_ocsp_age())};
++}
++
+ }  // namespace
+ 
+ CertificatePathStatusCodes PKIX::check_ocsp(const std::vector<X509_Certificate>& cert_path,
+@@ -312,38 +347,16 @@ CertificatePathStatusCodes PKIX::check_ocsp(const std::vector<X509_Certificate>&
+    CertificatePathStatusCodes cert_status(cert_path.size() - 1);
+ 
+    for(size_t i = 0; i != cert_path.size() - 1; ++i) {
+-      std::set<Certificate_Status_Code>& status = cert_status.at(i);
+-
+       const X509_Certificate& subject = cert_path.at(i);
+       const X509_Certificate& ca = cert_path.at(i + 1);
+ 
+-      if(i < ocsp_responses.size() && (ocsp_responses.at(i) != std::nullopt) &&
+-         (ocsp_responses.at(i)->status() == OCSP::Response_Status_Code::Successful)) {
++      if(i < ocsp_responses.size() && ocsp_responses.at(i).has_value() &&
++         ocsp_responses.at(i)->status() == OCSP::Response_Status_Code::Successful) {
+          try {
+-            const auto& ocsp_response = ocsp_responses.at(i);
+-
+-            if(auto dummy_status = ocsp_response->dummy_status()) {
+-               // handle softfail conditions
+-               status.insert(dummy_status.value());
+-            } else if(auto signing_cert =
+-                         ocsp_response->find_signing_certificate(ca, restrictions.trusted_ocsp_responders());
+-                      !signing_cert) {
+-               status.insert(Certificate_Status_Code::OCSP_ISSUER_NOT_FOUND);
+-            } else if(auto ocsp_signing_cert_status =
+-                         verify_ocsp_signing_cert(signing_cert.value(),
+-                                                  ca,
+-                                                  concat(ocsp_response->certificates(), cert_path),
+-                                                  certstores,
+-                                                  ref_time,
+-                                                  restrictions);
+-                      ocsp_signing_cert_status > Certificate_Status_Code::FIRST_ERROR_STATUS) {
+-               status.insert(ocsp_signing_cert_status);
+-               status.insert(Certificate_Status_Code::OCSP_ISSUER_NOT_TRUSTED);
+-            } else {
+-               status.insert(ocsp_response->status_for(ca, subject, ref_time, restrictions.max_ocsp_age()));
+-            }
++            cert_status.at(i) = evaluate_ocsp_response(
++               ocsp_responses.at(i).value(), subject, ca, cert_path, certstores, ref_time, restrictions);
+          } catch(Exception&) {
+-            status.insert(Certificate_Status_Code::OCSP_RESPONSE_INVALID);
++            cert_status.at(i).insert(Certificate_Status_Code::OCSP_RESPONSE_INVALID);
+          }
+       }
+    }
+diff --git a/src/tests/test_ocsp.cpp b/src/tests/test_ocsp.cpp
+index 06383cd..54b2c03 100644
+--- a/src/tests/test_ocsp.cpp
++++ b/src/tests/test_ocsp.cpp
+@@ -408,6 +408,52 @@ class OCSP_Tests final : public Test {
+          return result;
+       }
+ 
++      static Test::Result test_forged_ocsp_signature_is_rejected() {
++         Test::Result result("OCSP response with forged signature is rejected by path validation");
++
++         auto ee = load_test_X509_cert("x509/ocsp/randombit.pem");
++         auto ca = load_test_X509_cert("x509/ocsp/letsencrypt.pem");
++         auto trust_root = load_test_X509_cert("x509/ocsp/geotrust.pem");
++
++         const std::vector<Botan::X509_Certificate> cert_path = {ee, ca, trust_root};
++
++         Botan::Certificate_Store_In_Memory certstore;
++         certstore.add_certificate(trust_root);
++
++         const auto valid_time = Botan::calendar_point(2016, 11, 18, 12, 30, 0).to_std_timepoint();
++
++         // Verify the unmodified response is accepted
++         {
++            auto ocsp = load_test_OCSP_resp("x509/ocsp/randombit_ocsp.der");
++            const auto ocsp_status = Botan::PKIX::check_ocsp(
++               cert_path, {ocsp}, {&certstore}, valid_time, Botan::Path_Validation_Restrictions());
++
++            if(result.test_eq("Legitimate: expected result count", ocsp_status.size(), 1) &&
++               result.test_eq("Legitimate: expected status count", ocsp_status[0].size(), 1)) {
++               result.test_eq("Legitimate response is accepted",
++                                   ocsp_status[0].contains(Botan::Certificate_Status_Code::OCSP_RESPONSE_GOOD), true);
++            }
++         }
++
++         // Tamper with the signature and verify check_ocsp rejects it
++         {
++            auto ocsp_bytes = Test::read_binary_data_file("x509/ocsp/randombit_ocsp.der");
++            ocsp_bytes.back() ^= 0x01;
++            Botan::OCSP::Response forged_ocsp(ocsp_bytes.data(), ocsp_bytes.size());
++
++            const auto ocsp_status = Botan::PKIX::check_ocsp(
++               cert_path, {forged_ocsp}, {&certstore}, valid_time, Botan::Path_Validation_Restrictions());
++
++            if(result.test_eq("Forged: expected result count", ocsp_status.size(), 1) &&
++               result.test_eq("Forged: expected status count", ocsp_status[0].size(), 1)) {
++               result.test_eq("Forged signature is rejected",
++                                   ocsp_status[0].contains(Botan::Certificate_Status_Code::OCSP_SIGNATURE_ERROR), true);
++            }
++         }
++
++         return result;
++      }
++
+       static Test::Result test_responder_cert_with_nocheck_extension() {
+          Test::Result result("BDr's OCSP response contains certificate featuring NoCheck extension");
+ 
+@@ -436,6 +482,7 @@ class OCSP_Tests final : public Test {
+          results.push_back(test_response_verification_without_next_update_without_max_age());
+          results.push_back(test_response_verification_softfail());
+          results.push_back(test_response_verification_with_additionally_trusted_responder());
++         results.push_back(test_forged_ocsp_signature_is_rejected());
+          results.push_back(test_responder_cert_with_nocheck_extension());
+ 
+    #if defined(BOTAN_HAS_ONLINE_REVOCATION_CHECKS)
diff --git a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
index 392c1aac94..b613dd2a04 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
@@ -6,6 +6,7 @@ SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://CVE-2026-32877.patch \
+           file://CVE-2026-32883.patch \
            "
 SRC_URI[sha256sum] = "fde194236f6d5434f136ea0a0627f6cc9d26af8b96e9f1e1c7d8c82cd90f4f24"
 

