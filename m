Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1C1F46C69
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 18:33:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61917.1775500380339355505
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 11:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YATP2EBZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so38291435e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 11:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775500379; x=1776105179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dyyrws1LSkMBc1lU0CdNt6tmIgm4zDgih6CzYC9N1h0=;
        b=YATP2EBZg/mmYCMgTexkjsJbr3Kn69v3FDTlEE8RmaIPSeSUkWAiAjzXQErjQTSohS
         Em+LNTpRyjGmc0YfB1RUFM/ro2+4Dw5BBs/3iAPKIvvFerNqkVyJ2TGAqhWt6+5l3A3x
         gSotuS3hxeb7ZZQciRis5cl+EuE9rxUeeoyTuaWzRU4jTssVThQFLnWUQbtCOKakML67
         TNKy8yDkYfZwcw6B9OLUmLeURh5ZmZv00lBRISt4tF6LZud1clMESFUiPTv5gidUoAx7
         +wxPdWYwbF6iLyKa58fxuxmfFzbbhZaVCZQkIfbhKrDL7VEmGfUjTR1UHoo3AdSEzbzM
         yQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775500379; x=1776105179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dyyrws1LSkMBc1lU0CdNt6tmIgm4zDgih6CzYC9N1h0=;
        b=Asdm9hKee4ZvKT7rnv89VTNhsktTH+Vsf9QUXraBC5N6X2XkRS20Qaw6VYUfD4+D5e
         kAHjHyFo7KTl4CiUzNOV34EBg+D3aJgX1b2bMiRbWJpuKLxSvN5nhINMieLvqOCKHwAC
         h9yIK3WQOUskT2nmbQt71XtPppXTsVgyYVxrG0tgreE8gn5VsSw1GdINn1Nd9NzL9AxA
         yJ/JOezYKAJyMiegOd0jtkYlUVbF4EGofEBtidqlzfj5NK2W7034lQKSgWYdhdb5IKbw
         UhNuXr/GUriuAzS459Pbe/J9KuferML/A/AQh4u3QoP1tkwD+1SIclI8pTlw9nR+xW8F
         eHpQ==
X-Gm-Message-State: AOJu0YzQEijCpA/0esGh2E125MvASMxWw4rRVal/Vf98eFh4NOLa34M2
	aNaaGWCQn5oX1o95nK6hNguZO3ZL3WwYPHD9aJ7iYhYOyT7zapFiGz2l5/iI7Q==
X-Gm-Gg: AeBDievkSNg4VCNq2iV0hH2frTaHX8pMz6vRNIPb4UGJPSXqp1RpzDOjM/v3SWUHXhc
	sVS45YCZYw4q+7IvAUcn9vVERu+viv+4/q2iikLVCWoDCOUr5Q4N6mb3tXQs40NzPACl+OGF8V5
	zAwkaBLzhAKGTwc1VaKzDZjYTiB9ZpJ7lI4Z/evFj9djOGmRkr89ykxB4PE2we+lN16fBIBFgUI
	3vM9xMwe/pzA7pH+J8QNYQlKHxqFaFy05Brhi7T2yBQ5wm7PWAHR2rnUDFDMHmlSZUce5qrXfN/
	a3YMDqcaq8R6fSw4LP5rpis/uRGt+y8LvRxIUs5KxgiY9ScdWnbgnXDRDx7rhLadXNtt1bh65dW
	cRb4xTij8a/Ix0KFLMRmZAkUoIeeBxbBHdC4y8vafnZ62/qltSQdOwK0eor60NryfDVjcOAIsGC
	qYyOEtQTR1997KYColkCxI
X-Received: by 2002:a05:600c:3b1e:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-488996cd897mr186572945e9.4.1775500378520;
        Mon, 06 Apr 2026 11:32:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b64f03afsm61164515e9.0.2026.04.06.11.32.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:32:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 3/3] botan: patch CVE-2026-32884
Date: Mon,  6 Apr 2026 20:32:55 +0200
Message-ID: <20260406183255.3883660-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406183255.3883660-1-skandigraun@gmail.com>
References: <20260406183255.3883660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 18:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126061

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32884

The backported patch was selected based on the security.rst[1]
file of the project, that mentions the date of the fix. When
looked through the commits from that date, picked the one that's
description matches the CVE description.

The included test passed successfully (along with the other tests).

[1]: https://github.com/randombit/botan/blob/master/doc/security.rst

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../botan/botan/CVE-2026-32884.patch          | 171 ++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_3.10.0.bb  |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-32884.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/CVE-2026-32884.patch b/meta-oe/recipes-crypto/botan/botan/CVE-2026-32884.patch
new file mode 100644
index 0000000000..f207ee2caa
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/CVE-2026-32884.patch
@@ -0,0 +1,171 @@
+From cbc8b341ea4b38c388e89682b86da107a9fdc38c Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sun, 15 Mar 2026 11:17:22 -0400
+Subject: [PATCH] Fix name constraint DNS check when falling back to CN
+
+When verifying name constraints which restrict the set of allowed DNS names, the
+logic would first check the Subject Alternative Name if available, but if the
+SAN is absent then it would check the CN field of the issued name since that is
+a common fallback for DNS names when the SAN is missing.
+
+However this check failed to properly canonicalize the potential DNS name in the
+CN, allowing a mis-issued cert with a mixed-case CN field and absent SAN to
+bypass any imposed excludedSubtrees rules.
+
+CVE: CVE-2026-32884
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/db8baebd92bded036da6faf8bf3c324b67de9cf4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/x509/name_constraint.cpp              | 16 +++++++---
+ .../Invalid_DNS_Excluded_Mixed_Case_CN.crt    | 19 ++++++++++++
+ .../Root_DNS_Excluded_Mixed_Case_CN.crt       | 19 ++++++++++++
+ src/tests/test_name_constraint.cpp            | 29 +++++++++++++++++++
+ 4 files changed, 79 insertions(+), 4 deletions(-)
+ create mode 100644 src/tests/data/x509/name_constraint/Invalid_DNS_Excluded_Mixed_Case_CN.crt
+ create mode 100644 src/tests/data/x509/name_constraint/Root_DNS_Excluded_Mixed_Case_CN.crt
+
+diff --git a/src/lib/x509/name_constraint.cpp b/src/lib/x509/name_constraint.cpp
+index e767624..8708b95 100644
+--- a/src/lib/x509/name_constraint.cpp
++++ b/src/lib/x509/name_constraint.cpp
+@@ -19,6 +19,14 @@ namespace Botan {
+ 
+ class DER_Encoder;
+ 
++namespace {
++
++std::string canonicalize_dns_name(std::string_view name) {
++   return tolower_string(name);
++}
++
++}  // namespace
++
+ std::string GeneralName::type() const {
+    switch(m_type) {
+       case NameType::Unknown:
+@@ -75,7 +83,7 @@ void GeneralName::decode_from(BER_Decoder& ber) {
+       m_type = NameType::DNS;
+       // Store it in case insensitive form so we don't have to do it
+       // again while matching
+-      m_name.emplace<DNS_IDX>(tolower_string(ASN1::to_string(obj)));
++      m_name.emplace<DNS_IDX>(canonicalize_dns_name(ASN1::to_string(obj)));
+    } else if(obj.is_a(6, ASN1_Class::ContextSpecific)) {
+       m_type = NameType::URI;
+       m_name.emplace<URI_IDX>(ASN1::to_string(obj));
+@@ -174,7 +182,7 @@ GeneralName::MatchResult GeneralName::matches(const X509_Certificate& cert) cons
+          // Check CN instead...
+          for(const std::string& cn : dn.get_attribute("CN")) {
+             if(!string_to_ipv4(cn).has_value()) {
+-               score.add(matches_dns(cn, constraint));
++               score.add(matches_dns(canonicalize_dns_name(cn), constraint));
+             }
+          }
+       }
+@@ -421,7 +429,7 @@ bool NameConstraints::is_permitted(const X509_Certificate& cert, bool reject_unk
+                   return false;
+                }
+             } else {
+-               if(!is_permitted_dns_name(cn)) {
++               if(!is_permitted_dns_name(canonicalize_dns_name(cn))) {
+                   return false;
+                }
+             }
+@@ -540,7 +548,7 @@ bool NameConstraints::is_excluded(const X509_Certificate& cert, bool reject_unkn
+                   return true;
+                }
+             } else {
+-               if(is_excluded_dns_name(cn)) {
++               if(is_excluded_dns_name(canonicalize_dns_name(cn))) {
+                   return true;
+                }
+             }
+diff --git a/src/tests/data/x509/name_constraint/Invalid_DNS_Excluded_Mixed_Case_CN.crt b/src/tests/data/x509/name_constraint/Invalid_DNS_Excluded_Mixed_Case_CN.crt
+new file mode 100644
+index 0000000..fe2c773
+--- /dev/null
++++ b/src/tests/data/x509/name_constraint/Invalid_DNS_Excluded_Mixed_Case_CN.crt
+@@ -0,0 +1,19 @@
++-----BEGIN CERTIFICATE-----
++MIIDCTCCAfGgAwIBAgIUAbjRT6B+WHVf1Wo9JdFHlHegF1cwDQYJKoZIhvcNAQEL
++BQAwFzEVMBMGA1UEAwwMVGVzdCBSb290IENBMB4XDTI2MDMxNTE0NTM1MloXDTI3
++MDMxNTE0NTM1MlowFzEVMBMGA1UEAwwMU3ViLkVWSUwuQ09NMIIBIjANBgkqhkiG
++9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsn1rve+kuZJd2udT4QEnjdws+YRT+lJI+rG/
++4OpljAcxQywCc6oHDY4ouaqOKdhT9+luvqRVSEnH3JfczT/D+wZD+gBOlgUqsmXp
++QasD8HSyHWdjyaLrkZuBGICoUZTh9a7ZOPuIQ2sblxOvBm3klndpSpXJC6sJsWAk
++tyU+5WdNz+ncTC82sFSY0YQLC2QvxckEP6Jxi4I+h9vANtWXCk6CRz/kT4dY3cD4
++VBFtAy+vUVYUZnLi48fEYlMt4rP64OerY7hjw8gE+66rmUQPml4+DAek+xJtL4Sl
++Q0SGytWE9tJb1zzICv4TNvj/+IKmbK4BCu7fVjOd2C64zNFTywIDAQABo00wSzAJ
++BgNVHRMEAjAAMB0GA1UdDgQWBBS6hC1DrVlXAq/GWDYl/UQbP4TmLTAfBgNVHSME
++GDAWgBQPZ2Gp3izLTRAUzQKCKRLbM5OA2DANBgkqhkiG9w0BAQsFAAOCAQEAcWBy
++f9+tJDDj7T7z4QziZnxIfKP7x7uP9wAlYGRpKcbbW6SHAg6DA1V5GBWHendkg1hb
++Nywy7pUFgJ0xlJ7KYr76Ylfa1BTUPT+gExJWvSmsg8WSQ4q3bOMVB1qRxWDv/8KY
++ZOT03KEzLyGL6ia9r/UFw1jibxS26Ff6qCE9EhDLA/4z0D/+9QzdLATuzSn/SLSR
++wtarLaWhCfOSpfRrekYhaSndG45BCKpUd99iWt1HA4LyjZe8/8cxsRkD8klaCalG
++8pRp+PolijzmYsrEXuG22Bq2idgxHTRvw8l4rBQrSdMWuWqqTdIpFIUrXNft0a5f
++d8RmhI6PZlPL43OCxw==
++-----END CERTIFICATE-----
+diff --git a/src/tests/data/x509/name_constraint/Root_DNS_Excluded_Mixed_Case_CN.crt b/src/tests/data/x509/name_constraint/Root_DNS_Excluded_Mixed_Case_CN.crt
+new file mode 100644
+index 0000000..503206f
+--- /dev/null
++++ b/src/tests/data/x509/name_constraint/Root_DNS_Excluded_Mixed_Case_CN.crt
+@@ -0,0 +1,19 @@
++-----BEGIN CERTIFICATE-----
++MIIDGjCCAgKgAwIBAgIUJj5ZhECZYOzt5qWnoN8DMcZzlzgwDQYJKoZIhvcNAQEL
++BQAwFzEVMBMGA1UEAwwMVGVzdCBSb290IENBMB4XDTI2MDMxNTE0NTM1MloXDTM2
++MDMxMjE0NTM1MlowFzEVMBMGA1UEAwwMVGVzdCBSb290IENBMIIBIjANBgkqhkiG
++9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtEqBgRHixpRodBHeqXrcttdKD3tpGG+S67tM
++WT1h+572k6EFIZ9RVfYokH32sNFNz8LNI5FwKKFTf/WaVhMdsqxaMrf/+06UzKdw
++7dKz+Q5uLGrygv6opSVqhojkjLZH78zmEER0Gba4Ac4FGq5pjafA2jtoIMDyQ2SV
++IpOy932WCajQL6IM20yHPQAsr0c0hoFP4RdbJPuiEVPfZv95VjEwwV0zMBFmiICk
++gItEDfiexBHEIvXAGNBModMHaBhUDzHZp0X7gNW/MD2ieiQGoLTyG/t7sKv0J3zV
++LnUpXVIrmHSIkGVfuc5EFOlq6OXZ/J29VjPEnVVeZARDhgyGRQIDAQABo14wXDAP
++BgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQPZ2Gp3izLTRAUzQKCKRLbM5OA2DAO
++BgNVHQ8BAf8EBAMCAQYwGgYDVR0eAQH/BBAwDqEMMAqCCGV2aWwuY29tMA0GCSqG
++SIb3DQEBCwUAA4IBAQA5RLYaZWVxFIKpZRM5ZBk4fDDlAvRl7NVhMeQO3DMyyIzw
++Bp7IIEgH0I6PlL4/02SzSaqUuVVXYyO1LhbgBlFnE1h818zz+jN06i0lUemuXGAo
++wnHBwLW+V/r0JBm4BbnbneCYHUFS07sfR9IjQqV9Futp2WILwieZ7Ib96xGuX96L
++f6pxYEd82rYSXa/K14HvMKXkzC3qe72V+/E1GOPZqzlbZFriYfRUHUOY6P7LjcWl
++3Z+aUQcG8vEHbJjTd+ZZzP2PICjLKgaX1acpBOUR6pelHgcUmuR3z86V/DD8TWsH
++BHDLLBxTje/8fL0PR4qo4r4F+2Cj+hXnY/TFVQ+W
++-----END CERTIFICATE-----
+diff --git a/src/tests/test_name_constraint.cpp b/src/tests/test_name_constraint.cpp
+index 61aff53..5daa343 100644
+--- a/src/tests/test_name_constraint.cpp
++++ b/src/tests/test_name_constraint.cpp
+@@ -69,6 +69,35 @@ class Name_Constraint_Tests final : public Test {
+ 
+ BOTAN_REGISTER_TEST("x509", "x509_path_name_constraint", Name_Constraint_Tests);
+ 
++// Verify that DNS constraints are case-insensitive also when falling back to the CN
++class Name_Constraint_Excluded_CN_Case_Test final : public Test {
++   public:
++      std::vector<Test::Result> run() override {
++         Test::Result result("X509v3 Name Constraints: excluded DNS with mixed-case CN and no SAN");
++
++         const Botan::X509_Certificate root(
++            Test::data_file("x509/name_constraint/Root_DNS_Excluded_Mixed_Case_CN.crt"));
++         const Botan::X509_Certificate leaf(
++            Test::data_file("x509/name_constraint/Invalid_DNS_Excluded_Mixed_Case_CN.crt"));
++
++         Botan::Certificate_Store_In_Memory trusted;
++         trusted.add_certificate(root);
++
++         const Botan::Path_Validation_Restrictions restrictions(false, 80);
++         const auto validation_time = Botan::calendar_point(2026, 6, 1, 0, 0, 0).to_std_timepoint();
++
++         const auto path_result = Botan::x509_path_validate(
++            leaf, restrictions, trusted, "" /* hostname */, Botan::Usage_Type::UNSPECIFIED, validation_time);
++
++         result.test_eq(
++            "validation result", path_result.result_string(), "Certificate does not pass name constraint");
++
++         return {result};
++      }
++};
++
++BOTAN_REGISTER_TEST("x509", "x509_name_constraint_excluded_cn_case", Name_Constraint_Excluded_CN_Case_Test);
++
+ #endif
+ 
+ }  // namespace
diff --git a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
index b613dd2a04..0986a76557 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
@@ -7,6 +7,7 @@ SECTION = "libs"
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://CVE-2026-32877.patch \
            file://CVE-2026-32883.patch \
+           file://CVE-2026-32884.patch \
            "
 SRC_URI[sha256sum] = "fde194236f6d5434f136ea0a0627f6cc9d26af8b96e9f1e1c7d8c82cd90f4f24"
 

