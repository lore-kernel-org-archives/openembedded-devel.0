Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2062BC79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:25:00 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31938.1788776699779099777
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bk1H++wW;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d5335cf904so32744275ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776699; x=1789381499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8oUiDUqX1XiMgv3N4W8AISM0vVaqVQQhClNJN+j2S4=;
        b=bk1H++wWfuh6lGxbbxtlrwS0RTW66HX9yu2GQxDcMIeXSKBEPUMVn6BMh8Ev0OtD8d
         HNe2jPrZNi48lzmLMmGiLNGw0NFnmze/EZ4grg///J+H9CdIxOIREjB9tz2mD0yckNj4
         gSCwVQ5zKYQ++TUnXY6rtcwC06WfVQfqiKCj1e17UDOS4MgZxMu2utP43+P3XAe/TnEW
         TFtG4Eooy8+dvDWIu6zDkCoacrmM/2cAxRDrW9uyu0hvdKatociYNBF9VYCGnfm7HBLY
         HpqUyzQi53q+XDtsgSYOA77OSVK3ehNfbr1ODMUtBu4uugsH07hmywn3PDMgA1FINQiZ
         wM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776699; x=1789381499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8oUiDUqX1XiMgv3N4W8AISM0vVaqVQQhClNJN+j2S4=;
        b=OARrgzCz51PE8eFC0IuAYVtXb/owblpsIHYZpSI6F354p+dfwDXv5ZHNYe+B7Lq6D4
         SeIFROBvy9L/538p9+z1lENj3bxOjiSpYpy6ZST9Ybc7Js5pjBwFC4a0B+GSCYoq6piZ
         acDAKkBg6DNMP22QlrNdkXS4Yq3TlJItJHzsfM82DLC8yQURuNU1Y5Kr5/L02TlD342S
         y0oPt0I27YKSKAT48C4qAS6BDPUzH4pTB24yAP6jlh+X6uMLjIQHyECjM5uAusJI16ZQ
         LXPOekoMuus2DZY16GgT5VThiOGm5BTh3GoV+IfXrl7zIKQ32P2vT81upeQB1bdlCdY5
         IzoA==
X-Gm-Message-State: AFuF++kNoKLyiWy83bSJCQ17j9f+mwqEh9YHm6XyuCIkM/pOW2brA28t
	RRcmzaXDmCzrer9dA/PEj6+sQTPl17AlUfKwmKZK2E7gbe8/MLpaNN7Igw6oXg==
X-Gm-Gg: AYBFou2z25dIFZj7GkOMGncdcR6jd1bOuZETcC0hO+TYsqBu12JmxYTmFd2cgSnKK54
	TbGTjl6Y4mVuoi7rIwAf/BHg2eQJiEHOAiX+lBJKzrjDrsZ7QfX1TG+DR5z7H+LWQPEZUMrM937
	ooyJ/kwLaw43Yvzdd8f4CH6h0FWzyh/xOfIK9arIB2x/KZh2UWUak2waM/4P7t//uIM7E7pCMJ1
	SwkRKUYjdF+IcDdDjToUQoiZkNjqRm6XB4hzhkAVUGF9lZIDRBHa5oXj7V5ZOn6gDZ0C2lnOFMF
	txBih4BK664g33KUBI5ky7wV4MEPDAOcM0YeXyMVAb8dOx4L89KdrAJVp548l5aKBZb5/L+43Gm
	ONwqliIXjZB1iEInKvoFNVAdqNskYw3gcMH3H1lF+9gpVjoRTa4u7DeqNOqNW8AQ0ivfmsafH7n
	BmhHrSD/gNHIKG0m8XfmN2WrG8SYL+mG3EvIHT5o7+CL7ZJNqTeMnZnSPjygghXxRBEJhG7XHH
X-Received: by 2002:a17:90b:4a48:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39b260d2d58mr32030094a91.6.1788776699047;
        Mon, 07 Sep 2026 03:24:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 32/33] wolfssl: patch CVE-2026-6731
Date: Mon,  7 Sep 2026 22:23:16 +1200
Message-ID: <20260907102318.2459883-32-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129844

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-6731

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-6731-1.patch       |  39 ++++
 .../wolfssl/files/CVE-2026-6731-2.patch       | 171 ++++++++++++++++++
 .../wolfssl/wolfssl_5.9.1.bb                  |   2 +
 3 files changed, 212 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-2.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-1.patch
new file mode 100644
index 0000000000..c6a1762b27
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-1.patch
@@ -0,0 +1,39 @@
+From df2df57a027066708b498f41ce0b591704b579cc Mon Sep 17 00:00:00 2001
+From: Ruby Martin <ruby@wolfssl.com>
+Date: Tue, 14 Apr 2026 12:39:34 -0600
+Subject: [PATCH] Apply DNS constraints to subject CN when SAN is not
+ available.
+
+(cherry picked from commit e7b7fddacb4cc794e5dfc7693586d87a539f5aad)
+
+CVE: CVE-2026-6731
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/e7b7fddacb4cc794e5dfc7693586d87a539f5aad]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/asn.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/wolfcrypt/src/asn.c b/wolfcrypt/src/asn.c
+index f8db5c457..d12a78850 100644
+--- a/wolfcrypt/src/asn.c
++++ b/wolfcrypt/src/asn.c
+@@ -17665,9 +17665,16 @@ static int ConfirmNameConstraints(Signer* signer, DecodedCert* cert)
+         XMEMSET(&subjectDnsName, 0, sizeof(DNS_entry));
+         switch (nameType) {
+             case ASN_DNS_TYPE:
+-                /* Should it also consider CN in subject? It could use
+-                 * subjectDnsName too */
+                 name = cert->altNames;
++
++                /* When no SAN is present, apply DNS name constraints to the
++                 * Subject CN. */
++                if (cert->subjectCN != NULL && cert->altNames == NULL) {
++                    subjectDnsName.next = NULL;
++                    subjectDnsName.type = ASN_DNS_TYPE;
++                    subjectDnsName.len  = cert->subjectCNLen;
++                    subjectDnsName.name = cert->subjectCN;
++                }
+                 break;
+             case ASN_IP_TYPE:
+                 /* IP addresses are stored in altNames with type ASN_IP_TYPE */
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-2.patch
new file mode 100644
index 0000000000..be5132048e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-2.patch
@@ -0,0 +1,171 @@
+From 9d1ee979f67c8e31a04b73fadac61f4697bcb7c6 Mon Sep 17 00:00:00 2001
+From: Ruby Martin <ruby@wolfssl.com>
+Date: Tue, 14 Apr 2026 12:44:21 -0600
+Subject: [PATCH] test DNS name constraints on CA are applied against Subject
+ CN name when SAN name is unavailable
+
+test correct CN with no SAN available is accepted
+
+(cherry picked from commit 797ba3f03b1a8dc05c7b91a86c2e6698d76bfc8a)
+
+CVE: CVE-2026-6731
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/797ba3f03b1a8dc05c7b91a86c2e6698d76bfc8a]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tests/api/test_certman.c | 121 +++++++++++++++++++++++++++++++++++++++
+ tests/api/test_certman.h |   2 +
+ 2 files changed, 123 insertions(+)
+
+diff --git a/tests/api/test_certman.c b/tests/api/test_certman.c
+index 7405f4bff..c76902af2 100644
+--- a/tests/api/test_certman.c
++++ b/tests/api/test_certman.c
+@@ -1584,6 +1584,127 @@ int test_wolfSSL_CertManagerNameConstraint5(void)
+     return EXPECT_RESULT();
+ }
+ 
++int test_wolfSSL_CertManagerNameConstraint_DNS_CN(void)
++{
++    EXPECT_DECLS;
++#if !defined(NO_FILESYSTEM) && !defined(NO_CERTS) && \
++    !defined(NO_WOLFSSL_CM_VERIFY) && !defined(NO_RSA) && \
++    defined(OPENSSL_EXTRA) && defined(WOLFSSL_CERT_GEN) && \
++    defined(WOLFSSL_CERT_EXT) && defined(WOLFSSL_ALT_NAMES) && \
++    !defined(NO_SHA256)
++    /* Test that DNS name constraints are enforced against the Subject CN
++     * when no SAN extension is present. The CA cert (cert-ext-ncdns.der)
++     * permits only DNS:wolfssl.com and DNS:example.com. A leaf cert with
++     * CN=evil.attacker.com and no SAN should be REJECTED. */
++    WOLFSSL_CERT_MANAGER* cm = NULL;
++    WOLFSSL_EVP_PKEY *priv = NULL;
++    WOLFSSL_X509_NAME* name = NULL;
++    const char* ca_cert = "./certs/test/cert-ext-ncdns.der";
++    const char* server_cert = "./certs/test/server-goodcn.pem";
++
++    byte    *der = NULL;
++    int     derSz;
++    byte    *pt;
++    WOLFSSL_X509 *x509 = NULL;
++    WOLFSSL_X509 *ca = NULL;
++
++    pt = (byte*)server_key_der_2048;
++    ExpectNotNull(priv = wolfSSL_d2i_PrivateKey(EVP_PKEY_RSA, NULL,
++                (const unsigned char**)&pt, sizeof_server_key_der_2048));
++
++    ExpectNotNull(cm = wolfSSL_CertManagerNew());
++    ExpectNotNull(ca = wolfSSL_X509_load_certificate_file(ca_cert,
++                WOLFSSL_FILETYPE_ASN1));
++    ExpectNotNull((der = (byte*)wolfSSL_X509_get_der(ca, &derSz)));
++    ExpectIntEQ(wolfSSL_CertManagerLoadCABuffer(cm, der, derSz,
++                WOLFSSL_FILETYPE_ASN1), WOLFSSL_SUCCESS);
++
++    /* Sanity check: cert with SAN=evil.attacker.com is correctly rejected */
++    ExpectNotNull(x509 = wolfSSL_X509_load_certificate_file(server_cert,
++                WOLFSSL_FILETYPE_PEM));
++    ExpectNotNull(name = wolfSSL_X509_get_subject_name(ca));
++    ExpectIntEQ(wolfSSL_X509_set_issuer_name(x509, name), WOLFSSL_SUCCESS);
++    name = NULL;
++
++    ExpectNotNull(name = X509_NAME_new());
++    ExpectIntEQ(X509_NAME_add_entry_by_txt(name, "countryName", MBSTRING_UTF8,
++                                       (byte*)"US", 2, -1, 0), SSL_SUCCESS);
++    ExpectIntEQ(X509_NAME_add_entry_by_txt(name, "commonName", MBSTRING_UTF8,
++                             (byte*)"evil.attacker.com", 17, -1, 0),
++                SSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_X509_set_subject_name(x509, name), WOLFSSL_SUCCESS);
++    X509_NAME_free(name);
++    name = NULL;
++
++    ExpectIntEQ(wolfSSL_X509_add_altname(x509, "evil.attacker.com",
++                                         ASN_DNS_TYPE), WOLFSSL_SUCCESS);
++    ExpectIntGT(wolfSSL_X509_sign(x509, priv, EVP_sha256()), 0);
++    ExpectNotNull((der = (byte*)wolfSSL_X509_get_der(x509, &derSz)));
++    ExpectIntEQ(wolfSSL_CertManagerVerifyBuffer(cm, der, derSz,
++                WOLFSSL_FILETYPE_ASN1), WC_NO_ERR_TRACE(ASN_NAME_INVALID_E));
++    wolfSSL_X509_free(x509);
++    x509 = NULL;
++
++    /* NOW the actual vulnerability test: cert with CN=evil.attacker.com
++     * but NO SAN. The DNS name constraint should still reject this, since
++     * wolfSSL's hostname verification falls back to CN when no SAN exists. */
++    ExpectNotNull(x509 = wolfSSL_X509_load_certificate_file(server_cert,
++                WOLFSSL_FILETYPE_PEM));
++    ExpectNotNull(name = wolfSSL_X509_get_subject_name(ca));
++    ExpectIntEQ(wolfSSL_X509_set_issuer_name(x509, name), WOLFSSL_SUCCESS);
++    name = NULL;
++
++    ExpectNotNull(name = X509_NAME_new());
++    ExpectIntEQ(X509_NAME_add_entry_by_txt(name, "countryName", MBSTRING_UTF8,
++                                       (byte*)"US", 2, -1, 0), SSL_SUCCESS);
++    ExpectIntEQ(X509_NAME_add_entry_by_txt(name, "commonName", MBSTRING_UTF8,
++                             (byte*)"evil.attacker.com", 17, -1, 0),
++                SSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_X509_set_subject_name(x509, name), WOLFSSL_SUCCESS);
++    X509_NAME_free(name);
++    name = NULL;
++
++    /* Do NOT add any SAN this is the bypass vector */
++    ExpectIntGT(wolfSSL_X509_sign(x509, priv, EVP_sha256()), 0);
++    ExpectNotNull((der = (byte*)wolfSSL_X509_get_der(x509, &derSz)));
++    /* Should be ASN_NAME_INVALID_E because CN violates the constraint */
++    ExpectIntEQ(wolfSSL_CertManagerVerifyBuffer(cm, der, derSz,
++                WOLFSSL_FILETYPE_ASN1), WC_NO_ERR_TRACE(ASN_NAME_INVALID_E));
++    wolfSSL_X509_free(x509);
++    x509 = NULL;
++
++    /* Positive test: CN matches a permitted name (wolfssl.com) and no SAN is
++     * present. The CN fallback should accept this cert. */
++    ExpectNotNull(x509 = wolfSSL_X509_load_certificate_file(server_cert,
++                WOLFSSL_FILETYPE_PEM));
++    ExpectNotNull(name = wolfSSL_X509_get_subject_name(ca));
++    ExpectIntEQ(wolfSSL_X509_set_issuer_name(x509, name), WOLFSSL_SUCCESS);
++    name = NULL;
++
++    ExpectNotNull(name = X509_NAME_new());
++    ExpectIntEQ(X509_NAME_add_entry_by_txt(name, "countryName", MBSTRING_UTF8,
++                                       (byte*)"US", 2, -1, 0), SSL_SUCCESS);
++    ExpectIntEQ(X509_NAME_add_entry_by_txt(name, "commonName", MBSTRING_UTF8,
++                             (byte*)"wolfssl.com", 11, -1, 0),
++                SSL_SUCCESS);
++    ExpectIntEQ(wolfSSL_X509_set_subject_name(x509, name), WOLFSSL_SUCCESS);
++    X509_NAME_free(name);
++    name = NULL;
++
++    /* No SAN added; CN=wolfssl.com matches the permitted DNS constraint. */
++    ExpectIntGT(wolfSSL_X509_sign(x509, priv, EVP_sha256()), 0);
++    ExpectNotNull((der = (byte*)wolfSSL_X509_get_der(x509, &derSz)));
++    ExpectIntEQ(wolfSSL_CertManagerVerifyBuffer(cm, der, derSz,
++                WOLFSSL_FILETYPE_ASN1), WOLFSSL_SUCCESS);
++
++    wolfSSL_CertManagerFree(cm);
++    wolfSSL_X509_free(x509);
++    wolfSSL_X509_free(ca);
++    wolfSSL_EVP_PKEY_free(priv);
++#endif
++    return EXPECT_RESULT();
++}
++
+ int test_wolfSSL_CertManagerCRL(void)
+ {
+     EXPECT_DECLS;
+diff --git a/tests/api/test_certman.h b/tests/api/test_certman.h
+index 3b6afd0fc..60047cfa3 100644
+--- a/tests/api/test_certman.h
++++ b/tests/api/test_certman.h
+@@ -35,6 +35,7 @@ int test_wolfSSL_CertManagerNameConstraint2(void);
+ int test_wolfSSL_CertManagerNameConstraint3(void);
+ int test_wolfSSL_CertManagerNameConstraint4(void);
+ int test_wolfSSL_CertManagerNameConstraint5(void);
++int test_wolfSSL_CertManagerNameConstraint_DNS_CN(void);
+ int test_wolfSSL_CertManagerCRL(void);
+ int test_wolfSSL_CRL_reason_extensions_cleanup(void);
+ int test_wolfSSL_CRL_static_revoked_list(void);
+@@ -57,6 +58,7 @@ int test_wolfSSL_CertManagerRejectMD5Cert(void);
+     TEST_DECL_GROUP("certman", test_wolfSSL_CertManagerNameConstraint3),    \
+     TEST_DECL_GROUP("certman", test_wolfSSL_CertManagerNameConstraint4),    \
+     TEST_DECL_GROUP("certman", test_wolfSSL_CertManagerNameConstraint5),    \
++    TEST_DECL_GROUP("certman", test_wolfSSL_CertManagerNameConstraint_DNS_CN), \
+     TEST_DECL_GROUP("certman", test_wolfSSL_CertManagerCRL),                \
+     TEST_DECL_GROUP("certman", test_wolfSSL_CRL_reason_extensions_cleanup), \
+     TEST_DECL_GROUP("certman", test_wolfSSL_CRL_static_revoked_list),      \
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 26b86c1b2b..ef03d0c9ff 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -34,6 +34,8 @@ SRC_URI = " \
     file://CVE-2026-6412-2.patch \
     file://CVE-2026-6450-1.patch \
     file://CVE-2026-6450-2.patch \
+    file://CVE-2026-6731-1.patch \
+    file://CVE-2026-6731-2.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

