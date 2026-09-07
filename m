Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A01C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31936.1788776693797183540
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GkfSLd/z;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2702097a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776693; x=1789381493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Q0AnwnnzA5EhZWeGFmkxu3nw2tc44QV4zSf60KTbJ0=;
        b=GkfSLd/zEOaYJDh435aIAWWXljf/x40fjADsWkbk42V2oxtOqemhXzewWLEZ4wMZNv
         STlCvBnK6oQo/DsKd0Qgbr6MjjV94tYKDPyWvi8D7yWXR0+g47suyiZ7+q4jlfnIvXc+
         jHJ+3VpNCACkhuB8MjIBmi/RlVkbmTZfsJZhyJiAyUK2fT/rJEACybsEGAeXr5g1SO0v
         XA/wCeetP8QEwlO8eGtqRZivCdOvcsQ56hSC7gvJJBh6BRUxfG9ZBr3UyPjuhCxZd6jy
         K95uo9iqfB8D/y3IND6/2Yi03cTITATbwBNkQLJF4IIpsApi+MP7LuTYYkjnBWCW9bTF
         WklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776693; x=1789381493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Q0AnwnnzA5EhZWeGFmkxu3nw2tc44QV4zSf60KTbJ0=;
        b=PxDeDLRd08juTTS2oWwzGdYLL+2vGUmvQMqMLRndJ3nAsLTJXmV5bp9gsvDqWrAvyM
         n/lvlJktBY8DR4BKXUsjtBGuWi3QeT0rIj/rBh5tqd5scD/N2TtDl3g0wJuhrq7vEE/m
         EQhAiy/na9tJ/cKsOCFBgOh2Zxj+ig5W5KotYR/rnQzYisJi69Reo3PKVAjqzeFNwep7
         Dy1Et/6pfRf1gyX0EAvakGC+jy8dz9bHw4bnTcHuWtgwhWjeWUD2noKILvFvPTPdrYbi
         qW25Y/BDn+YwRXqKHtxkxA+q26w4GgpUFDnw3/rImftA5GYRoVb6iAqGiFyz4tLd7eCv
         m9aw==
X-Gm-Message-State: AFuF++ljR0BUCehzlT1jgAe+aAvbIXBnSWsbcEKGx8xLGgDe+H1WjkZR
	khyBnA5B3FS5D7Skd0PWD+T3xra4guQXbxJUz3COJuECWzXcp6aJ1rmVLgIG1j/j
X-Gm-Gg: AYBFou0+StpkLYuFe/mH08fLitUqmExx3J+6qnkKdPoaYXiYJ/G3u0d+Qsq3InFk+8u
	w/gIbwhxWYsXv8RlALxMivlcmKqdfAON1IffBxiedQwKRHtkewBipVZjMs9XM7ECEsDJ/rDD6JC
	prnSa82f4Xk6hKdcTJU4tig516Q8MQ3TJb+D75vXAncRzWt8cJzgl7kG92dxNQ5gUhtJYmGladw
	mG+rE6lHrdTnBY28qzcHTp41yom7Zgysk40N9e90OrfbMXWNcp10AUUpo1doSEWG7I+nLFeTkCw
	TnTlFAEL6K3a74gMFHOeTTAb4hjH3rqmrfn5D0BvReSj4h6g7af1UnG+OGTYJmSikplROKcHCpV
	jrYRpOpGNHpwIi+VDbvsUZKH3n5rT4lg+L79WVnrcrWBG/to+lB5+HkD2gZAZxd/50Hxi6uRNcE
	n/VOHVdojCadcMXSbE8qjK0aPuoXx/arLQqV+53sNH3yIKgfXxoIHwyys40G5PgrzC/vlB7if6
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr36574485a91.24.1788776693031;
        Mon, 07 Sep 2026 03:24:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 30/33] wolfssl: patch CVE-2026-6412
Date: Mon,  7 Sep 2026 22:23:14 +1200
Message-ID: <20260907102318.2459883-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129842

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-6412

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-6412-1.patch       | 159 ++++++++++++++++++
 .../wolfssl/files/CVE-2026-6412-2.patch       |  56 ++++++
 .../wolfssl/wolfssl_5.9.1.bb                  |   2 +
 3 files changed, 217 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-2.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-1.patch
new file mode 100644
index 0000000000..4d1d3b71cb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-1.patch
@@ -0,0 +1,159 @@
+From eda0a3001ebe036da39f8911a347174a759ffce0 Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 14 Apr 2026 12:26:45 -0500
+Subject: [PATCH] Report cert verify failure with MD5
+
+(cherry picked from commit 4a13896b2ea6d6080d41cd32539193713e69935f)
+
+CVE: CVE-2026-6412
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/4a13896b2ea6d6080d41cd32539193713e69935f]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ .wolfssl_known_macro_extras |  1 +
+ tests/api/test_certman.c    | 81 +++++++++++++++++++++++++++++++++++++
+ tests/api/test_certman.h    |  4 +-
+ wolfcrypt/src/asn.c         |  7 ++++
+ 4 files changed, 92 insertions(+), 1 deletion(-)
+
+diff --git a/.wolfssl_known_macro_extras b/.wolfssl_known_macro_extras
+index 3e411ca86..3233644ba 100644
+--- a/.wolfssl_known_macro_extras
++++ b/.wolfssl_known_macro_extras
+@@ -680,6 +680,7 @@ WOLFSSL_ALLOW_CRIT_AIA
+ WOLFSSL_ALLOW_CRIT_AKID
+ WOLFSSL_ALLOW_CRIT_SKID
+ WOLFSSL_ALLOW_MAX_FRAGMENT_ADJUST
++WOLFSSL_ALLOW_MD5_CERT_SIGS
+ WOLFSSL_ALLOW_NO_CN_IN_SAN
+ WOLFSSL_ALLOW_NO_SUITES
+ WOLFSSL_ALLOW_SERVER_SC_EXT
+diff --git a/tests/api/test_certman.c b/tests/api/test_certman.c
+index dfce12334..9f87f4535 100644
+--- a/tests/api/test_certman.c
++++ b/tests/api/test_certman.c
+@@ -2540,3 +2540,84 @@ int test_various_pathlen_chains(void)
+ #endif
+     return EXPECT_RESULT();
+ }
++
++/* Verify that certificates signed with MD5 (md5WithRSAEncryption) are
++ * rejected during chain verification. MD5 must not be acceptable as a
++ * certificate signature hash, even when MD5 is compiled in (e.g. for TLS
++ * 1.0 PRF or HMAC uses). Trust anchors are exempt from this check because
++ * ParseCertRelative skips ConfirmSignature for CA_TYPE. */
++int test_wolfSSL_CertManagerRejectMD5Cert(void)
++{
++    EXPECT_DECLS;
++#if !defined(NO_CERTS) && !defined(NO_RSA) && !defined(NO_MD5) && \
++    !defined(WOLFSSL_ALLOW_MD5_CERT_SIGS) && defined(WOLFSSL_CERT_GEN) && \
++    !defined(NO_WOLFSSL_CM_VERIFY) && !defined(NO_ASN_CRYPT) && \
++    !defined(USE_CERT_BUFFERS_1024)
++    WOLFSSL_CERT_MANAGER* cm = NULL;
++    RsaKey  caKey;
++    WC_RNG  rng;
++    Cert    leaf;
++    byte*   der = NULL;
++    int     derSz = 0;
++    word32  idx = 0;
++    int     caKeyInit = 0;
++    int     rngInit = 0;
++
++    XMEMSET(&caKey, 0, sizeof(caKey));
++    XMEMSET(&rng,   0, sizeof(rng));
++
++    ExpectIntEQ(wc_InitRng(&rng), 0);
++    if (EXPECT_SUCCESS()) rngInit = 1;
++
++    ExpectIntEQ(wc_InitRsaKey_ex(&caKey, HEAP_HINT, testDevId), 0);
++    if (EXPECT_SUCCESS()) caKeyInit = 1;
++    ExpectIntEQ(wc_RsaPrivateKeyDecode(ca_key_der_2048, &idx, &caKey,
++                sizeof_ca_key_der_2048), 0);
++
++    ExpectNotNull(der = (byte*)XMALLOC(FOURK_BUF, HEAP_HINT,
++                DYNAMIC_TYPE_TMP_BUFFER));
++
++    /* Build a leaf certificate whose issuer is the built-in 2048-bit
++     * wolfSSL test CA and sign it with MD5+RSA using the matching CA
++     * private key. */
++    ExpectIntEQ(wc_InitCert(&leaf), 0);
++    leaf.sigType = CTC_MD5wRSA;
++    leaf.isCA    = 0;
++    XSTRNCPY(leaf.subject.country,    "US",              CTC_NAME_SIZE);
++    XSTRNCPY(leaf.subject.state,      "MT",              CTC_NAME_SIZE);
++    XSTRNCPY(leaf.subject.locality,   "Bozeman",         CTC_NAME_SIZE);
++    XSTRNCPY(leaf.subject.org,        "wolfSSL",         CTC_NAME_SIZE);
++    XSTRNCPY(leaf.subject.unit,       "Test",            CTC_NAME_SIZE);
++    XSTRNCPY(leaf.subject.commonName, "md5-leaf",        CTC_NAME_SIZE);
++    XSTRNCPY(leaf.subject.email,      "info@wolfssl.com", CTC_NAME_SIZE);
++
++    ExpectIntEQ(wc_SetIssuerBuffer(&leaf, ca_cert_der_2048,
++                sizeof_ca_cert_der_2048), 0);
++
++    /* wc_MakeCert needs an RSA public key for the subject; reuse caKey
++     * for simplicity (we only care about signature-side verification). */
++    ExpectIntGT((derSz = wc_MakeCert(&leaf, der, FOURK_BUF, &caKey, NULL,
++                &rng)), 0);
++    ExpectIntGT((derSz = wc_SignCert(leaf.bodySz, leaf.sigType, der,
++                FOURK_BUF, &caKey, NULL, &rng)), 0);
++
++    /* Load the SHA-256 signed CA cert as a trust anchor and attempt
++     * to verify the MD5-signed leaf: it must be rejected because
++     * HashForSignature() now returns HASH_TYPE_E for MD5 in verify mode,
++     * which surfaces as ASN_SIG_CONFIRM_E from ConfirmSignature(). */
++    ExpectNotNull(cm = wolfSSL_CertManagerNew());
++    ExpectIntEQ(wolfSSL_CertManagerLoadCABuffer(cm, ca_cert_der_2048,
++                sizeof_ca_cert_der_2048, WOLFSSL_FILETYPE_ASN1),
++                WOLFSSL_SUCCESS);
++
++    ExpectIntEQ(wolfSSL_CertManagerVerifyBuffer(cm, der, derSz,
++                WOLFSSL_FILETYPE_ASN1),
++                WC_NO_ERR_TRACE(HASH_TYPE_E));
++
++    wolfSSL_CertManagerFree(cm);
++    XFREE(der, HEAP_HINT, DYNAMIC_TYPE_TMP_BUFFER);
++    if (caKeyInit) wc_FreeRsaKey(&caKey);
++    if (rngInit)   wc_FreeRng(&rng);
++#endif
++    return EXPECT_RESULT();
++}
+diff --git a/tests/api/test_certman.h b/tests/api/test_certman.h
+index 1588c81ec..a0b5d9548 100644
+--- a/tests/api/test_certman.h
++++ b/tests/api/test_certman.h
+@@ -41,6 +41,7 @@ int test_wolfSSL_CRL_static_revoked_list(void);
+ int test_wolfSSL_CRL_duplicate_extensions(void);
+ int test_wolfSSL_CertManagerCheckOCSPResponse(void);
+ int test_various_pathlen_chains(void);
++int test_wolfSSL_CertManagerRejectMD5Cert(void);
+ 
+ #define TEST_CERTMAN_DECLS                                                  \
+     TEST_DECL_GROUP("certman", test_wolfSSL_CertManagerAPI),                \
+@@ -59,7 +60,8 @@ int test_various_pathlen_chains(void);
+     TEST_DECL_GROUP("certman", test_wolfSSL_CRL_static_revoked_list),      \
+     TEST_DECL_GROUP("certman", test_wolfSSL_CRL_duplicate_extensions),      \
+     TEST_DECL_GROUP("certman", test_wolfSSL_CertManagerCheckOCSPResponse),  \
+-    TEST_DECL_GROUP("certman", test_various_pathlen_chains)
++    TEST_DECL_GROUP("certman", test_various_pathlen_chains),                \
++    TEST_DECL_GROUP("certman", test_wolfSSL_CertManagerRejectMD5Cert)
+ 
+ #endif /* WOLFCRYPT_TEST_CERTMAN_H */
+ 
+diff --git a/wolfcrypt/src/asn.c b/wolfcrypt/src/asn.c
+index fea449863..8d4f40a70 100644
+--- a/wolfcrypt/src/asn.c
++++ b/wolfcrypt/src/asn.c
+@@ -15880,6 +15880,13 @@ static int HashForSignature(const byte* buf, word32 bufSz, word32 sigOID,
+     #endif
+     #ifndef NO_MD5
+         case CTC_MD5wRSA:
++        #ifndef WOLFSSL_ALLOW_MD5_CERT_SIGS
++            if (verify) {
++                ret = HASH_TYPE_E;
++                WOLFSSL_MSG("MD5 not supported for certificate verification");
++                break;
++            }
++        #endif
+             if ((ret = wc_Md5Hash_ex(buf, bufSz, digest, heap, devId)) == 0) {
+                 *typeH    = MD5h;
+                 *digestSz = WC_MD5_DIGEST_SIZE;
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-2.patch
new file mode 100644
index 0000000000..0747e9dd99
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-2.patch
@@ -0,0 +1,56 @@
+From ab4cfd06ce09ca6aa33e06ca12bcfc1186c9f357 Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Tue, 14 Apr 2026 13:39:17 -0500
+Subject: [PATCH] Fix from review
+
+(cherry picked from commit a8ea8a898c45a4199ac196044ac14314dc82d981)
+
+CVE: CVE-2026-6412
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/a8ea8a898c45a4199ac196044ac14314dc82d981]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tests/api/test_certman.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/tests/api/test_certman.c b/tests/api/test_certman.c
+index 9f87f4535..6c5875dc5 100644
+--- a/tests/api/test_certman.c
++++ b/tests/api/test_certman.c
+@@ -2576,6 +2576,9 @@ int test_wolfSSL_CertManagerRejectMD5Cert(void)
+ 
+     ExpectNotNull(der = (byte*)XMALLOC(FOURK_BUF, HEAP_HINT,
+                 DYNAMIC_TYPE_TMP_BUFFER));
++    if (der == NULL) {
++        goto cleanup;
++    }
+ 
+     /* Build a leaf certificate whose issuer is the built-in 2048-bit
+      * wolfSSL test CA and sign it with MD5+RSA using the matching CA
+@@ -2604,16 +2607,19 @@ int test_wolfSSL_CertManagerRejectMD5Cert(void)
+     /* Load the SHA-256 signed CA cert as a trust anchor and attempt
+      * to verify the MD5-signed leaf: it must be rejected because
+      * HashForSignature() now returns HASH_TYPE_E for MD5 in verify mode,
+-     * which surfaces as ASN_SIG_CONFIRM_E from ConfirmSignature(). */
++     * and wolfSSL_CertManagerVerifyBuffer() returns that error. */
+     ExpectNotNull(cm = wolfSSL_CertManagerNew());
+-    ExpectIntEQ(wolfSSL_CertManagerLoadCABuffer(cm, ca_cert_der_2048,
+-                sizeof_ca_cert_der_2048, WOLFSSL_FILETYPE_ASN1),
+-                WOLFSSL_SUCCESS);
++    if (cm != NULL) {
++        ExpectIntEQ(wolfSSL_CertManagerLoadCABuffer(cm, ca_cert_der_2048,
++                    sizeof_ca_cert_der_2048, WOLFSSL_FILETYPE_ASN1),
++                    WOLFSSL_SUCCESS);
+ 
+-    ExpectIntEQ(wolfSSL_CertManagerVerifyBuffer(cm, der, derSz,
+-                WOLFSSL_FILETYPE_ASN1),
+-                WC_NO_ERR_TRACE(HASH_TYPE_E));
++        ExpectIntEQ(wolfSSL_CertManagerVerifyBuffer(cm, der, derSz,
++                    WOLFSSL_FILETYPE_ASN1),
++                    WC_NO_ERR_TRACE(HASH_TYPE_E));
++    }
+ 
++cleanup:
+     wolfSSL_CertManagerFree(cm);
+     XFREE(der, HEAP_HINT, DYNAMIC_TYPE_TMP_BUFFER);
+     if (caKeyInit) wc_FreeRsaKey(&caKey);
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 843d5071b4..4ca330b029 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -30,6 +30,8 @@ SRC_URI = " \
     file://CVE-2026-6094-5.patch \
     file://CVE-2026-6291.patch \
     file://CVE-2026-6325.patch \
+    file://CVE-2026-6412-1.patch \
+    file://CVE-2026-6412-2.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

