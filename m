Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305D5CAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 12:39:00 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.9648.1759667930397102130
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 05:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i1uOPtqe;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7a16441so642447166b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759667929; x=1760272729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jqDJxMaM14Yp41cJzJOHyw8S5AeKwebi090BHHk5WdM=;
        b=i1uOPtqeFAiIujWZB1WRWmDU85QFVJMk6CMVW3IHhbj5TyjHDseC6BcJTtJY/0s0Nx
         KIv9A3Lo8D69kneHMTB6WzxLUYdxYGfl9EYqhwLr9Uxxlto6SDBJAsEDbCEen4+tXBMt
         lvdtlk+DKj1AciXw3zFF2m7DNIABr6Az1JHNain0yBoFI2QkuNkxBanUjshK0LynM9zv
         cEKV6m+0UW6fWtwy3LlkiSLSmGf7dyqYRuku8IwcCByxj4Uu6LhZ0ZTv09ZCguSYIr+a
         p4Lhs3tQfYDFzEK2IVzJJ66e2ZG3HfcO2bEV1sFvcTPESMuWE+mZdRKbeMEcUQDUTGrc
         uBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759667929; x=1760272729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqDJxMaM14Yp41cJzJOHyw8S5AeKwebi090BHHk5WdM=;
        b=YkF4DKN1wmmClO1nFqfp1rV5GjQm0ylW2Lfo3LXdo1zQqP4JmdhGon+CBZUQXpQOxI
         x1h2o8cK/iqk+rRK1UulUq+XoI15f+2nNyo8XhPJUCG1z5zVlB3lx418Ilpe2sGxR/zl
         8y+OBg3kHE0KRcATVdeHMPROIPGdoITQwoUfRTizjDr8FXXNq9A/CNdYYyFu1lJzhJcQ
         qiPLCf1S67Cw/rxbtK3tiQhIOjnmKWvVSAbJGZj0Y8DkuZnAvJHvXoAGUrbTgKTje//j
         ks9ePLhJcloE1fLBwIkAkBpgrAb00qCIua0bIm9eq51AlKJtdw7s8WvN2OylsvTkGr+J
         Xt4A==
X-Gm-Message-State: AOJu0YyITr5/wO/y3ALEnRIZ/fAiJDGCWGWtH9v5WGPiwu55zSU4NsRh
	DI/IKJXbI/8Nw0vT9qxFZqPA8e3O1MjoQVD9Cw63C7RgPzfAX7OUeS6yE6YYcA==
X-Gm-Gg: ASbGncuBa7zCBKqMCZp/BTGrvPxsUN40o1daYU4JTpreT+UYl8+vwN10DRLplNvyjPP
	p7RRL2Bofdew77LWuVOmXC5HYZZhp3ixYVlHFlOu/ZvJNCHKP5l0u+DT4IOW6jH/5Si6msrz219
	XhoPyb79Ka5yfCRF1/hnz0D+mz5pVYT2xRhEQXUd1Rb0Lu9l4Zts3nfmrd1p16foNYHOIBCqPIo
	nLr8f2nNVC12sOgikja8Jpegx1UAfb6vjSh1allaq7T0o/EiCGfOPhpR/O3h7NKPZw/jWAjXdGm
	t1ZEy14oZUo+H1TNYSR0AYJnbO3ZNdfNzEO0qMAAD+MF+tTUp7GGcVbnu+wJe7Fic5bNWZ11Of5
	dgWO8OD1si2zyo2pXPg7Z/WMB9TlHZPGm1U6QiYCslskC
X-Google-Smtp-Source: AGHT+IFp/atTyNyySlaFruP0o51d1tjPhQKxA9b7R0OZ1GRkYoIQrMK6HopC8D5YZIFw+S3kg+G6Xg==
X-Received: by 2002:a17:906:9f85:b0:b40:2873:a61a with SMTP id a640c23a62f3a-b49c1a766ddmr1039361266b.6.1759667928467;
        Sun, 05 Oct 2025 05:38:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b37bsm920315366b.53.2025.10.05.05.38.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 05:38:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] botan: patch CVE-2022-43705
Date: Sun,  5 Oct 2025 14:38:47 +0200
Message-ID: <20251005123847.447828-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 12:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120247

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-43705

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...Store_In_Memory-c-tor-that-takes-a-v.patch |  31 +++++
 ...es-can-sign-their-own-OCSP-responses.patch |  36 ++++++
 ...dation-of-authority-of-delegation-re.patch | 106 ++++++++++++++++++
 .../botan/botan/0004-review-comments.patch    |  28 +++++
 meta-oe/recipes-crypto/botan/botan_2.19.1.bb  |   7 +-
 5 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-add-Certificate_Store_In_Memory-c-tor-that-takes-a-v.patch
 create mode 100644 meta-oe/recipes-crypto/botan/botan/0002-FIX-intermediates-can-sign-their-own-OCSP-responses.patch
 create mode 100644 meta-oe/recipes-crypto/botan/botan/0003-FIX-missing-validation-of-authority-of-delegation-re.patch
 create mode 100644 meta-oe/recipes-crypto/botan/botan/0004-review-comments.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/0001-add-Certificate_Store_In_Memory-c-tor-that-takes-a-v.patch b/meta-oe/recipes-crypto/botan/botan/0001-add-Certificate_Store_In_Memory-c-tor-that-takes-a-v.patch
new file mode 100644
index 0000000000..6917015a6e
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/0001-add-Certificate_Store_In_Memory-c-tor-that-takes-a-v.patch
@@ -0,0 +1,31 @@
+From 6eb071078e35a6a29e3a27fb91d9449b25f1bbcc Mon Sep 17 00:00:00 2001
+From: Rene Meusel <rene.meusel@rohde-schwarz.com>
+Date: Wed, 21 Sep 2022 14:00:26 +0200
+Subject: [PATCH] add Certificate_Store_In_Memory c'tor that takes a vector of
+ certs
+
+CVE: CVE-2022-43705
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/5d8d9fbf75c8b814ea609161bee525d520f5cb57]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/x509/certstor.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/lib/x509/certstor.h b/src/lib/x509/certstor.h
+index 6901589..165c414 100644
+--- a/src/lib/x509/certstor.h
++++ b/src/lib/x509/certstor.h
+@@ -95,6 +95,12 @@ class BOTAN_PUBLIC_API(2,0) Certificate_Store_In_Memory final : public Certifica
+       */
+       explicit Certificate_Store_In_Memory(const X509_Certificate& cert);
+ 
++      /**
++      * Adds given certificate list to the store.
++      */
++      explicit Certificate_Store_In_Memory(std::vector<std::shared_ptr<const X509_Certificate>> certs)
++         : m_certs(std::move(certs)) {}
++
+       /**
+       * Create an empty store.
+       */
diff --git a/meta-oe/recipes-crypto/botan/botan/0002-FIX-intermediates-can-sign-their-own-OCSP-responses.patch b/meta-oe/recipes-crypto/botan/botan/0002-FIX-intermediates-can-sign-their-own-OCSP-responses.patch
new file mode 100644
index 0000000000..f41ee6bd98
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/0002-FIX-intermediates-can-sign-their-own-OCSP-responses.patch
@@ -0,0 +1,36 @@
+From 48947029f72e2091dfbaaa5e3576d98eb7d6c34e Mon Sep 17 00:00:00 2001
+From: Rene Meusel <rene.meusel@rohde-schwarz.com>
+Date: Tue, 20 Sep 2022 17:20:52 +0200
+Subject: [PATCH] FIX: intermediates can sign their own OCSP responses
+
+Before it was possible that intermediates signed their
+own OCSP responses. I.e a compromised intermediate
+certificate allowed the attacker to sign OCSP responses
+for this very certificate.
+
+CVE: CVE-2022-43705
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/1829ef9d89614da1eacdf511356bdf98a970f5f5]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/x509/x509path.cpp | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/x509/x509path.cpp b/src/lib/x509/x509path.cpp
+index b5cdc27..37de6d8 100644
+--- a/src/lib/x509/x509path.cpp
++++ b/src/lib/x509/x509path.cpp
+@@ -234,7 +234,12 @@ PKIX::check_ocsp(const std::vector<std::shared_ptr<const X509_Certificate>>& cer
+          {
+          try
+             {
+-            Certificate_Status_Code ocsp_signature_status = ocsp_responses.at(i)->check_signature(trusted_certstores, cert_path);
++            // When verifying intermediate certificates we need to truncate the
++            // cert_path so that the intermediate under investigation becomes the
++            // last certificate in the chain.
++            auto ocsp_cert_path = cert_path;
++            ocsp_cert_path.erase(ocsp_cert_path.begin(), ocsp_cert_path.begin()+i);
++            Certificate_Status_Code ocsp_signature_status = ocsp_responses.at(i)->check_signature(trusted_certstores, ocsp_cert_path);
+ 
+             if(ocsp_signature_status == Certificate_Status_Code::OCSP_SIGNATURE_OK)
+                {
diff --git a/meta-oe/recipes-crypto/botan/botan/0003-FIX-missing-validation-of-authority-of-delegation-re.patch b/meta-oe/recipes-crypto/botan/botan/0003-FIX-missing-validation-of-authority-of-delegation-re.patch
new file mode 100644
index 0000000000..aab3775a8e
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/0003-FIX-missing-validation-of-authority-of-delegation-re.patch
@@ -0,0 +1,106 @@
+From 3f8c9705168518c9b436c23e6d13796d683e5391 Mon Sep 17 00:00:00 2001
+From: Rene Meusel <rene.meusel@rohde-schwarz.com>
+Date: Wed, 21 Sep 2022 14:14:02 +0200
+Subject: [PATCH] FIX: missing validation of authority of delegation responder
+ cert
+
+When a responder does not sign their responses with the same CA that
+issued the certificate in question, they typically add their
+'delegation certificate' as a stapled certificate path to the response.
+So far, these delegation certificates were not checked for their
+legitimate authority to sign responses for the CA.
+
+CVE: CVE-2022-43705
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/991b0159282781f2d5c06ff42a9ff00ee563e96b]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/x509/ocsp.cpp | 68 ++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 67 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/x509/ocsp.cpp b/src/lib/x509/ocsp.cpp
+index 1ca8232..fc952f6 100644
+--- a/src/lib/x509/ocsp.cpp
++++ b/src/lib/x509/ocsp.cpp
+@@ -241,7 +241,6 @@ Certificate_Status_Code Response::check_signature(const std::vector<Certificate_
+       {
+       for(size_t i = 0; i < m_certs.size(); ++i)
+          {
+-         // Check all CA certificates in the (assumed validated) EE cert path
+          if(!m_signer_name.empty() && m_certs[i].subject_dn() == m_signer_name)
+             {
+             signing_cert = std::make_shared<const X509_Certificate>(m_certs[i]);
+@@ -254,6 +253,73 @@ Certificate_Status_Code Response::check_signature(const std::vector<Certificate_
+             break;
+             }
+          }
++
++      // RFC 6960 4.2.2.2
++      //    OCSP signing delegation SHALL be designated by the inclusion of
++      //    id-kp-OCSPSigning in an extended key usage certificate extension
++      //    included in the OCSP response signer's certificate. This certificate
++      //    MUST be issued directly by the CA that is identified in the request.
++      //
++      //    The CA SHOULD use the same issuing key to issue a delegation
++      //    certificate as that used to sign the certificate being checked for
++      //    revocation.  Systems relying on OCSP responses MUST recognize a
++      //    delegation certificate as being issued by the CA that issued the
++      //    certificate in question only if the delegation certificate and the
++      //    certificate being checked for revocation were signed by the same key.
++      //
++      // I.e. it is safe to assume that the certificate's issuer also signed the
++      // responder's certificate.
++      //
++      // Note: The 'SHOULD' in the second paragraph above allows for backward
++      //       compatibility to RFC 2560 that is "strongly discouraged". This
++      //       implementation explicitly _does not_ implement this backward
++      //       compatibility.
++      if(signing_cert)
++         {
++         const auto issuer =
++            Certificate_Store_In_Memory(ee_cert_path)
++               .find_cert(signing_cert->issuer_dn(), signing_cert->authority_key_id());
++
++         // User did not provide the certificate path to verify the delegation
++         if(!issuer)
++            {
++            return Certificate_Status_Code::OCSP_ISSUER_NOT_FOUND;
++            }
++
++         if(!issuer->is_CA_cert())
++            {
++            return Certificate_Status_Code::OCSP_ISSUER_NOT_FOUND;
++            }
++
++         // Sub-optimal fix for a vulnerability found in Botan 2.19.2 and older.
++         //
++         // This certificate validation is incomplete. Missing checks:
++         //  * validity check against the reference time
++         //  * revocation status check of the responder certificate
++         //  * certificate extension validations
++         //  * ... potentially more
++         //
++         // A more comprehensive validation will be introduced with Botan 3.0
++         try
++            {
++            const auto issuer_pubkey = issuer->load_subject_public_key();
++            const auto sig = signing_cert->verify_signature(*issuer_pubkey);
++
++            if(sig != Certificate_Status_Code::VERIFIED)
++               {
++               return Certificate_Status_Code::OCSP_SIGNATURE_ERROR;
++               }
++
++            if(!signing_cert->has_ex_constraint(OID::from_string("PKIX.OCSPSigning")))
++               {
++               return Certificate_Status_Code::OCSP_RESPONSE_MISSING_KEYUSAGE;
++               }
++            }
++         catch(const Exception& ex)
++            {
++            return Certificate_Status_Code::OCSP_SIGNATURE_ERROR;
++            }
++         }
+       }
+ 
+    if(!signing_cert)
diff --git a/meta-oe/recipes-crypto/botan/botan/0004-review-comments.patch b/meta-oe/recipes-crypto/botan/botan/0004-review-comments.patch
new file mode 100644
index 0000000000..5fed88df9e
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/0004-review-comments.patch
@@ -0,0 +1,28 @@
+From 18e7dc2e81429e1ac4e69cbe0b530bf707d38d94 Mon Sep 17 00:00:00 2001
+From: Rene Meusel <rene.meusel@rohde-schwarz.com>
+Date: Thu, 3 Nov 2022 09:27:20 +0100
+Subject: [PATCH] review comments
+
+CVE: CVE-2022-43705
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/a33689613127f319c0047fb96f092de16e7cb350]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/x509/x509path.cpp    |  3 +--
+ src/tests/test_x509_path.cpp | 12 +++++-------
+ 2 files changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/lib/x509/x509path.cpp b/src/lib/x509/x509path.cpp
+index 37de6d8..6f3159a 100644
+--- a/src/lib/x509/x509path.cpp
++++ b/src/lib/x509/x509path.cpp
+@@ -237,8 +237,7 @@ PKIX::check_ocsp(const std::vector<std::shared_ptr<const X509_Certificate>>& cer
+             // When verifying intermediate certificates we need to truncate the
+             // cert_path so that the intermediate under investigation becomes the
+             // last certificate in the chain.
+-            auto ocsp_cert_path = cert_path;
+-            ocsp_cert_path.erase(ocsp_cert_path.begin(), ocsp_cert_path.begin()+i);
++            std::vector<std::shared_ptr<const X509_Certificate>> ocsp_cert_path(cert_path.begin() + i, cert_path.end());
+             Certificate_Status_Code ocsp_signature_status = ocsp_responses.at(i)->check_signature(trusted_certstores, ocsp_cert_path);
+ 
+             if(ocsp_signature_status == Certificate_Status_Code::OCSP_SIGNATURE_OK)
diff --git a/meta-oe/recipes-crypto/botan/botan_2.19.1.bb b/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
index 4b072fc5dc..6477da4dbf 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
@@ -4,7 +4,12 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://license.txt;md5=f4ce98476c07c34e1793daa036960fad"
 SECTION = "libs"
 
-SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
+SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
+           file://0001-add-Certificate_Store_In_Memory-c-tor-that-takes-a-v.patch \
+           file://0002-FIX-intermediates-can-sign-their-own-OCSP-responses.patch \
+           file://0003-FIX-missing-validation-of-authority-of-delegation-re.patch \
+           file://0004-review-comments.patch \
+           "
 SRC_URI[sha256sum] = "e26e00cfefda64082afdd540d3c537924f645d6a674afed2cd171005deff5560"
 
 S = "${WORKDIR}/Botan-${PV}"

