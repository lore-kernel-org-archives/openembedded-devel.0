Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3849.1794728982513917120
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KBpcDLqS;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so4144396eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728982; x=1795333782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8mOkRU9Zc4auF7vRUBE6ptGA6IdASB4V8vsv0MIWUk=;
        b=KBpcDLqSlirPCwM/mQfNLtDuyDwiDyv+RKtUrkvK3N6zO4RklS0aoXmX02yBR6MbCp
         a0p3f9Pc6uQq4O/lo9I79jA/r5+f0LxEEJOeIJWIu8suvG4KWO0ebGZ+TBRSXnqRhwNT
         rZrcQGACvSqtLvg7QL/PRwXVry8W1jXXYchnPDrbPA2PgE/oliRVb1uV42FWwQ2H5BO0
         eDLKsyml8aovlOAdWOkTxHZvjEhiOfDXEiQ8mxSQdsr+OALHY1CE9dkRz+X46QdzL21J
         nJ1KqNybYx8Y7Yc7dnSGijdyURgjbCFgA5nppPPgd8JB0xHuZDk3kUA+U2F/orcL+C7S
         4MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728982; x=1795333782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8mOkRU9Zc4auF7vRUBE6ptGA6IdASB4V8vsv0MIWUk=;
        b=Aw6N1Y0Wke6heZoD7jPVvh8BvcWVYZhqLfJTCwUCJqFSwTnUbqzEDkqHni2nUdQBYi
         iPwYOcUc075cMI57VpCwswZmX7KfIz2ZH9uB3TEod1Rt2wY1ZvjZ5G6o4WmbFn5g9sNN
         Onp+TKooRThA28ER2paUBnDvZeQZMEvpv8ruFn+w9NHWllSR/7Tn7cOxhl1/RxBikuxF
         Vn3go1tntshGTk3Ralrb3OFWwojKruyXIRoiyf9LuHtg0RgKjtAaq3ECIUpiQoAG9FZ+
         2emz6ho0ojnWW5DG+Ndru+quHalKaxnNSAk9jJ4bqjwvhfRp78Q9Hqp/05fXBs8/r1dW
         x6Aw==
X-Gm-Message-State: APuU4Z8JACO/YkYsKgNqzxWwadwT2IsiDe3xiFoLJXz9OmDrTTQ3HXTm
	vx5CjA5Zw6wYFFt55O+0USLX4TChPb9HeoBTrx94x5+Hao6wH9llBkgTmwOL3sTM
X-Gm-Gg: AYBFou0XLZkiz1eCw0P6bhKSbeCZBjabahXsIxtwWtegI7Nk7epTOu6sQx9pdCh6mc1
	5xaP7wHRhOxOBINTflO4mEzSrMfbswjZJ9Qst+DCYdXB6Mvx+Az8foZ28NpwkBGjwAeUxREwPIi
	bFVcd4N4XrkuTE9gBTLlL8P+Bj5xwZC6AL9Cif/a32YL/Tw8Cgo3qoem9m/yakypYkseUw9zXtd
	przJD8linrWaGG9xXB4zeAUahxH//AHSHsqxo+x9RZVaB5ifVahLzVpal6a4rYqzEgGlOQTe7mw
	RRsBImJ7IWoADRvCgaMdYKCL+hVQ8feYaVvw6HSAelAyEoOXQ/ux7rYYT9XbolpdvG5rm7LO9f0
	viT2ymQSxq3SO2LQEUhBjXs83P4bvulIhQn+8lMRIelFZDMk9rUj6CDBipxfWpBk4XrMH9wJvw0
	q7oecqQULF2okMeEe2FCGmO5+z4kU4GVdUHVUlEso12OG3zeV1F1HPmfVBCy52jl2oOY3XQZ/pA
	YbgH+hzrSA0ufh++JDTV9CoIOsN6vaVqNlKVkD2m3zdcGSkU+451Umltp9UCNwLoF6aLLzgZ8z+
	KVNWLwQTdidPzgF/2PzsoIEtJw14u1xDEQyQ0vjShfrdAYNbjLjFTTxG1ItLIAlMa1fwudWqhg4
	HFpL6ILM/eHuig7U5oh4WVLAROHY0x8kJ0LP4iliS4eR+eAQ1zhK0ze5zKd91BvSzK02lNXifSD
	TgkBTE1ABx8q9ax3SKaJiXtw4198hHALr1En9H0DZOPKTB++y/rVVCGuQKyDzMElCKhm9tVlTp7
	eEWMfWlt04mfsW1j7g9ZeU/urftv8LYPNQ6Dsefvryd9QJ05ahGZh8sOguHy+muBphf9Ccv4pQk
	UvQB
X-Received: by 2002:a05:7301:7108:b0:376:b957:bfb with SMTP id 5a478bee46e88-3796628d619mr6869002eec.17.1794728981276;
        Sat, 14 Nov 2026 23:49:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/96] krb5: upgrade 1.22.2 -> 1.22.3
Date: Sat, 14 Nov 2026 23:47:50 -0800
Message-ID: <20261115074918.2932593-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132282
Content-Type: text/plain; charset="utf-8"

Security fix release (CVE-2026-111423, CVE-2026-71199,
CVE-2026-107884 and others, see MITKRB5-SA-2026-001).

Drop fix-strchr-conformance-to-C23.patch, included in this release.
Drop 0001-Improve-future-OpenSSL-compatibility.patch and
0002-Remove-OpenSSL-1.0-support.patch; 1.22.3 already constifies the
OpenSSL accessors these were needed for, and rebase
0003-k5tls-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch to the
two locals that are still missing it.

NOTICE gained a BSD-2-Clause notice for the new
src/lib/krb5/krb/t_init_creds_step.c test, which is not installed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Improve-future-OpenSSL-compatibility.patch | 285 --------
 .../0002-Remove-OpenSSL-1.0-support.patch     | 627 ------------------
 ...ing-const-qualifiers-for-OpenSSL-4.0.patch |  41 +-
 .../krb5/fix-strchr-conformance-to-C23.patch  | 191 ------
 .../krb5/{krb5_1.22.2.bb => krb5_1.22.3.bb}   |   7 +-
 5 files changed, 9 insertions(+), 1142 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Improve-future-OpenSSL-compatibility.patch
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0002-Remove-OpenSSL-1.0-support.patch
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/fix-strchr-conformance-to-C23.patch
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.22.2.bb => krb5_1.22.3.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-Improve-future-OpenSSL-compatibility.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-Improve-future-OpenSSL-compatibility.patch
deleted file mode 100644
index 3ae23f0031..0000000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/0001-Improve-future-OpenSSL-compatibility.patch
+++ /dev/null
@@ -1,285 +0,0 @@
-From 5e4e8452328804948d042235bbf58ca457795857 Mon Sep 17 00:00:00 2001
-From: Bob Beck <beck@openssl.org>
-Date: Mon, 16 Feb 2026 15:15:55 -0700
-Subject: [PATCH] Improve future OpenSSL compatibility
-
-Avoid calling deprecated OpenSSL functions when compiling against
-versions of OpenSSL where they are deprecated.  Add
--DOPENSSL_NO_DEPRECATED to the linux-clang-openssl CI build to help
-detect calls to deprecated functions in the future.
-
-Use const pointer variables to hold values retrieved by accessors
-which will return const pointers in OpenSSL 4.0.  Define macros to
-make certain functions accept these const pointers in versions of
-OpenSSL where they don't already do so.
-
-Use accessor functions instead of direct field access for ASN1_STRING
-values, as the type will become opaque in OpenSSL 4.0.
-
-The PKINIT code is written to assume that DHX support was not present
-until OpenSSL 1.1, but it was added in release 1.0.2, causing a
-compilation error against 1.0.2 from a double definition of
-EVP_PKEY_DHX.  Minimally fix the compilation error.  (The custom DHX
-marshalling code to support 1.0.x could be removed, as 1.0.2 is the
-minimum version after commit f5bbfa4821cf590a4748f96d0e016bc0485e95c4,
-but the plan is to remove 1.0.x compatibility shortly.)
-
-Contains work by Frederik Wedel-Heinen
-<frederik.wedel-heinen@dencrypt.dk> and Dimitri John Ledkov
-<dimitri.ledkov@surgut.co.uk>.
-
-[ghudson@mit.edu: combined numerous commits; added compatibility
-macros; rewrote commit message; fixed 1.0.2 compatibility issue]
-Upstream-Status: Backport [https://github.com/krb5/krb5/commit/5e4e84523288]
-
-Note: .github/workflows/build.yml hunk dropped (CI-only, not relevant
-for OE builds).
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- .github/workflows/build.yml                   | 10 ++--
- .../preauth/pkinit/pkinit_crypto_openssl.c    | 54 ++++++++++++++-----
- src/plugins/tls/k5tls/openssl.c               | 26 +++++++--
- 3 files changed, 68 insertions(+), 22 deletions(-)
-
-diff --git a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
-index d1fe18e5ab..aa969aa37c 100644
---- a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
-+++ b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
-@@ -209,13 +209,20 @@ create_identifiers_from_stack(STACK_OF(X509) *sk,
- #define EVP_MD_CTX_new EVP_MD_CTX_create
- #define EVP_MD_CTX_free EVP_MD_CTX_destroy
- #define ASN1_STRING_get0_data ASN1_STRING_data
-+#define X509_STORE_CTX_set0_trusted_stack X509_STORE_CTX_trusted_stack
- 
- /*
-- * 1.1 adds DHX support, which uses the RFC 3279 DomainParameters encoding we
-+ * 1.0.2 adds DHX support, which uses the RFC 3279 DomainParameters encoding we
-  * need for PKINIT.  For 1.0 we must use the original DH type when creating
-  * EVP_PKEY objects.
-  */
-+#ifndef EVP_PKEY_DHX
- #define EVP_PKEY_DHX EVP_PKEY_DH
-+#endif
-+
-+/* Make X509_NAME_print_ex() accept a const name pointer by adding a cast. */
-+#define X509_NAME_print_ex(a, b, c, d)          \
-+    X509_NAME_print_ex(a, (X509_NAME *)b, c, d)
- 
- /* 1.1 makes many handle types opaque and adds accessors.  Add compatibility
-  * versions of the new accessors we use for pre-1.1. */
-@@ -295,6 +302,10 @@ compat_ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
- #define EVP_PKEY_get_bits EVP_PKEY_bits
- #define EVP_PKEY_get_base_id EVP_PKEY_base_id
- 
-+/* Make X509_dup() accept a const pointer by adding a cast. */
-+#define X509_dup(a) X509_dup((X509 *)a)
-+#define i2d_X509_NAME(a, b) i2d_X509_NAME((X509_NAME *)a, b)
-+
- /*
-  * Convert *dh to an EVP_PKEY object, taking ownership of *dh and setting it to
-  * NULL.  On error, return NULL and do not take ownership of or change *dh.
-@@ -318,6 +329,11 @@ dh_to_pkey(DH **dh)
- }
- #endif /* OPENSSL_VERSION_NUMBER < 0x30000000L */
- 
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L
-+/* Make X509V3_EXT_d2i() accept a const pointer by adding a cast. */
-+#define X509V3_EXT_d2i(a) X509V3_EXT_d2i((X509_EXTENSION *)a)
-+#endif
-+
- /* Encode a bignum as an ASN.1 integer in DER. */
- static int
- encode_bn_der(const BIGNUM *bn, uint8_t **der_out, int *len_out)
-@@ -1134,6 +1150,13 @@ oerr_cert(krb5_context context, krb5_error_code code, X509_STORE_CTX *certctx,
-     return oerr(context, code, _("%s (depth %d): %s"), msg, depth, errstr);
- }
- 
-+/* Convert an OpenSSL ASN.1 string value to krb5_data, without copying. */
-+static inline krb5_data
-+asn1string_to_data(ASN1_STRING *s)
-+{
-+    return make_data((char *)ASN1_STRING_get0_data(s), ASN1_STRING_length(s));
-+}
-+
- krb5_error_code
- pkinit_init_plg_crypto(krb5_context context,
-                        pkinit_plg_crypto_context *cryptoctx)
-@@ -1775,7 +1798,7 @@ cms_signeddata_create(krb5_context context,
-             goto cleanup;
-         X509_STORE_CTX_init(certctx, certstore, id_cryptoctx->my_cert,
-                             id_cryptoctx->intermediateCAs);
--        X509_STORE_CTX_trusted_stack(certctx, id_cryptoctx->trustedCAs);
-+        X509_STORE_CTX_set0_trusted_stack(certctx, id_cryptoctx->trustedCAs);
-         if (!X509_verify_cert(certctx)) {
-             retval = oerr_cert(context, 0, certctx,
-                                _("Failed to verify own certificate"));
-@@ -2002,7 +2025,7 @@ cms_signeddata_verify(krb5_context context,
-         unsigned char *d;
-         *is_signed = 0;
-         octets = CMS_get0_content(cms);
--        if (!octets || ((*octets)->type != V_ASN1_OCTET_STRING)) {
-+        if (!octets || (ASN1_STRING_type(*octets) != V_ASN1_OCTET_STRING)) {
-             retval = KRB5KDC_ERR_PREAUTH_FAILED;
-             krb5_set_error_message(context, retval,
-                                    _("Invalid pkinit packet: octet string "
-@@ -2058,7 +2081,8 @@ cms_signeddata_verify(krb5_context context,
-         /* We cannot use CMS_dataInit because there may be no digest */
-         octets = CMS_get0_content(cms);
-         if (octets)
--            out = BIO_new_mem_buf((*octets)->data, (*octets)->length);
-+            out = BIO_new_mem_buf(ASN1_STRING_get0_data(*octets),
-+                                  ASN1_STRING_length(*octets));
-         if (out == NULL)
-             goto cleanup;
-     } else {
-@@ -2118,7 +2142,7 @@ cms_signeddata_verify(krb5_context context,
- 
-         /* add trusted CAs certificates for cert verification */
-         if (idctx->trustedCAs != NULL)
--            X509_STORE_CTX_trusted_stack(cert_ctx, idctx->trustedCAs);
-+            X509_STORE_CTX_set0_trusted_stack(cert_ctx, idctx->trustedCAs);
-         else {
-             pkiDebug("unable to find any trusted CAs\n");
-             goto cleanup;
-@@ -2156,7 +2180,7 @@ cms_signeddata_verify(krb5_context context,
-         i = X509_verify_cert(cert_ctx);
-         if (i <= 0) {
-             int j = X509_STORE_CTX_get_error(cert_ctx);
--            X509 *cert;
-+            const X509 *cert;
- 
-             cert = X509_STORE_CTX_get_current_cert(cert_ctx);
-             reqctx->received_cert = X509_dup(cert);
-@@ -2316,7 +2340,7 @@ crypto_retrieve_X509_sans(krb5_context context,
-     krb5_principal *princs = NULL;
-     char **upns = NULL;
-     unsigned char **dnss = NULL;
--    X509_EXTENSION *ext = NULL;
-+    const X509_EXTENSION *ext = NULL;
-     GENERAL_NAMES *ialt = NULL;
-     GENERAL_NAME *gen = NULL;
- 
-@@ -2379,8 +2403,7 @@ crypto_retrieve_X509_sans(krb5_context context,
-         gen = sk_GENERAL_NAME_value(ialt, i);
-         switch (gen->type) {
-         case GEN_OTHERNAME:
--            name.length = gen->d.otherName->value->value.sequence->length;
--            name.data = (char *)gen->d.otherName->value->value.sequence->data;
-+            name = asn1string_to_data(gen->d.otherName->value->value.sequence);
-             if (princs != NULL &&
-                 OBJ_cmp(plgctx->id_pkinit_san,
-                         gen->d.otherName->type_id) == 0) {
-@@ -2414,12 +2437,13 @@ crypto_retrieve_X509_sans(krb5_context context,
-         case GEN_DNS:
-             if (dnss != NULL) {
-                 /* Prevent abuse of embedded null characters. */
--                if (memchr(gen->d.dNSName->data, '\0', gen->d.dNSName->length))
-+                if (memchr(ASN1_STRING_get0_data(gen->d.dNSName), '\0',
-+                           ASN1_STRING_length(gen->d.dNSName)))
-                     break;
-                 pkiDebug("%s: found dns name = %s\n", __FUNCTION__,
--                         gen->d.dNSName->data);
-+                         ASN1_STRING_get0_data(gen->d.dNSName));
-                 dnss[d] = (unsigned char *)
--                    strdup((char *)gen->d.dNSName->data);
-+                    strdup((char *)ASN1_STRING_get0_data(gen->d.dNSName));
-                 if (dnss[d] == NULL) {
-                     pkiDebug("%s: failed to duplicate dns name\n",
-                              __FUNCTION__);
-@@ -3094,8 +3118,10 @@ int
- pkinit_openssl_init(void)
- {
-     /* Initialize OpenSSL. */
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-     ERR_load_crypto_strings();
-     OpenSSL_add_all_algorithms();
-+#endif
-     return 0;
- }
- 
-@@ -4766,7 +4792,7 @@ crypto_retrieve_X509_key_usage(krb5_context context,
- }
- 
- static krb5_error_code
--rfc2253_name(X509_NAME *name, char **str_out)
-+rfc2253_name(const X509_NAME *name, char **str_out)
- {
-     BIO *b = NULL;
-     char *str;
-@@ -5227,7 +5253,7 @@ create_identifiers_from_stack(STACK_OF(X509) *sk,
-     int i = 0, sk_size = sk_X509_num(sk);
-     krb5_external_principal_identifier **krb5_cas = NULL;
-     X509 *x = NULL;
--    X509_NAME *xn = NULL;
-+    const X509_NAME *xn = NULL;
-     unsigned char *p = NULL;
-     int len = 0;
-     PKCS7_ISSUER_AND_SERIAL *is = NULL;
-diff --git a/src/plugins/tls/k5tls/openssl.c b/src/plugins/tls/k5tls/openssl.c
-index 42d72dc9ec..7763327b7a 100644
---- a/src/plugins/tls/k5tls/openssl.c
-+++ b/src/plugins/tls/k5tls/openssl.c
-@@ -38,6 +38,24 @@
- #include <openssl/x509v3.h>
- #include <dirent.h>
- 
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+/* Make X509_get_subject_name() accept a const pointer by adding a cast. */
-+#define X509_get_subject_name(a) X509_get_subject_name((X509 *)a)
-+
-+/* OpenSSL 1.0 did not have TLS_client_method(); use the best alternative. */
-+#define TLS_client_method() SSLv23_client_method()
-+#endif
-+
-+#if OPENSSL_VERSION_NUMBER < 0x40000000L
-+/*
-+ * OpenSSL 4.0 constifies the result of X509_STORE_CTX_get_current_cert() and
-+ * the input of X509_check_host() and X509_check_ip_asc().  For prior versions,
-+ * make the latter two functions accept const pointers via a cast.
-+ */
-+#define X509_check_host(a, b, c, d, e) X509_check_host((X509 *)a, b, c, d, e)
-+#define X509_check_ip_asc(a, b, c) X509_check_ip_asc((X509 *)a, b, c)
-+#endif
-+
- struct k5_tls_handle_st {
-     SSL *ssl;
-     char *servername;
-@@ -51,9 +69,11 @@ MAKE_INIT_FUNCTION(init_openssl);
- int
- init_openssl(void)
- {
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-     SSL_library_init();
-     SSL_load_error_strings();
-     OpenSSL_add_all_algorithms();
-+#endif
-     ex_context_id = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
-     ex_handle_id = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
-     return 0;
-@@ -72,7 +92,7 @@ flush_errors(krb5_context context)
- }
- 
- static krb5_boolean
--check_cert_name_or_ip(X509 *x, const char *expected_name)
-+check_cert_name_or_ip(const X509 *x, const char *expected_name)
- {
-     struct in_addr in;
-     struct in6_addr in6;
-@@ -89,7 +109,7 @@ check_cert_name_or_ip(X509 *x, const char *expected_name)
- static int
- verify_callback(int preverify_ok, X509_STORE_CTX *store_ctx)
- {
--    X509 *x;
-+    const X509 *x;
-     SSL *ssl;
-     BIO *bio;
-     krb5_context context;
-@@ -246,7 +266,7 @@ setup(krb5_context context, SOCKET fd, const char *servername,
-         return KRB5_PLUGIN_OP_NOTSUPP;
- 
-     /* Do general SSL library setup. */
--    ctx = SSL_CTX_new(SSLv23_client_method());
-+    ctx = SSL_CTX_new(TLS_client_method());
-     if (ctx == NULL)
-         goto error;
- 
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0002-Remove-OpenSSL-1.0-support.patch b/meta-oe/recipes-connectivity/krb5/krb5/0002-Remove-OpenSSL-1.0-support.patch
deleted file mode 100644
index b208c96e54..0000000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/0002-Remove-OpenSSL-1.0-support.patch
+++ /dev/null
@@ -1,627 +0,0 @@
-From 736397a909005913b09c1d84a32255de71aadeca Mon Sep 17 00:00:00 2001
-From: Greg Hudson <ghudson@mit.edu>
-Date: Tue, 10 Mar 2026 23:06:59 -0400
-Subject: [PATCH] Remove OpenSSL 1.0 support
-
-Upstream-Status: Backport [https://github.com/krb5/krb5/commit/f8a47bf037af]
-
-Note: Context adjusted for krb5 1.22.2 (one hunk in
-pkinit_crypto_openssl.c had offset due to earlier patches).
-doc/mitK5features.rst hunk dropped (documentation only, outside src/).
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/configure.ac                              |   4 +-
- .../crypto/openssl/hash_provider/hash_evp.c   |   7 -
- src/lib/crypto/openssl/hmac.c                 |  27 --
- src/lib/crypto/openssl/sha256.c               |   7 -
- .../preauth/pkinit/pkinit_crypto_openssl.c    | 372 +-----------------
- src/plugins/preauth/spake/openssl.c           |   7 -
- src/plugins/tls/k5tls/openssl.c               |  13 -
- 7 files changed, 4 insertions(+), 433 deletions(-)
-
-diff --git a/src/configure.ac b/src/configure.ac
-index 4325fae..9074a9f 100644
---- a/src/configure.ac
-+++ b/src/configure.ac
-@@ -1141,8 +1141,8 @@ enable_pkinit=try)
- if test "$enable_pkinit" = yes || test "$enable_pkinit" = try; then
-   AC_CACHE_CHECK(for a recent enough OpenSSL, k5_cv_openssl_version_okay,
- [AC_COMPILE_IFELSE([AC_LANG_SOURCE([#include <openssl/opensslv.h>
--#if OPENSSL_VERSION_NUMBER < 0x10000000L
--# error openssl is too old, need 1.0.0
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+# error openssl is too old, need 1.1.0
- #endif
- int i = 1;
- ])], k5_cv_openssl_version_okay=yes, k5_cv_openssl_version_okay=no)])
-diff --git a/src/lib/crypto/openssl/hash_provider/hash_evp.c b/src/lib/crypto/openssl/hash_provider/hash_evp.c
-index f2fbffd..2269daa 100644
---- a/src/lib/crypto/openssl/hash_provider/hash_evp.c
-+++ b/src/lib/crypto/openssl/hash_provider/hash_evp.c
-@@ -37,13 +37,6 @@
- 
- #include <openssl/evp.h>
- 
--/* 1.1 standardizes constructor and destructor names, renaming
-- * EVP_MD_CTX_create and EVP_MD_CTX_destroy. */
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
--#define EVP_MD_CTX_new EVP_MD_CTX_create
--#define EVP_MD_CTX_free EVP_MD_CTX_destroy
--#endif
--
- static krb5_error_code
- hash_evp(const EVP_MD *type, const krb5_crypto_iov *data, size_t num_data,
-          krb5_data *output)
-diff --git a/src/lib/crypto/openssl/hmac.c b/src/lib/crypto/openssl/hmac.c
-index 799d700..6e91017 100644
---- a/src/lib/crypto/openssl/hmac.c
-+++ b/src/lib/crypto/openssl/hmac.c
-@@ -63,33 +63,6 @@
- #include <openssl/hmac.h>
- #endif
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
--
--/* OpenSSL 1.1 makes HMAC_CTX opaque, while 1.0 does not have pointer
-- * constructors or destructors. */
--
--#define HMAC_CTX_new compat_hmac_ctx_new
--static HMAC_CTX *
--compat_hmac_ctx_new(void)
--{
--    HMAC_CTX *ctx;
--
--    ctx = calloc(1, sizeof(*ctx));
--    if (ctx != NULL)
--        HMAC_CTX_init(ctx);
--    return ctx;
--}
--
--#define HMAC_CTX_free compat_hmac_ctx_free
--static void
--compat_hmac_ctx_free(HMAC_CTX *ctx)
--{
--    HMAC_CTX_cleanup(ctx);
--    free(ctx);
--}
--
--#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
--
- /*
-  * the HMAC transform looks like:
-  *
-diff --git a/src/lib/crypto/openssl/sha256.c b/src/lib/crypto/openssl/sha256.c
-index 855ebd7..6f2c5d9 100644
---- a/src/lib/crypto/openssl/sha256.c
-+++ b/src/lib/crypto/openssl/sha256.c
-@@ -36,13 +36,6 @@
- 
- #include <openssl/evp.h>
- 
--/* 1.1 standardizes constructor and destructor names, renaming
-- * EVP_MD_CTX_create and EVP_MD_CTX_destroy. */
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
--#define EVP_MD_CTX_new EVP_MD_CTX_create
--#define EVP_MD_CTX_free EVP_MD_CTX_destroy
--#endif
--
- krb5_error_code
- k5_sha256(const krb5_data *in, size_t n, uint8_t out[K5_SHA256_HASHLEN])
- {
-diff --git a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
-index e70106f..2dd34dc 100644
---- a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
-+++ b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
-@@ -201,100 +201,9 @@ static krb5_error_code
- create_identifiers_from_stack(STACK_OF(X509) *sk,
-                               krb5_external_principal_identifier *** ids);
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
--
--/* 1.1 standardizes constructor and destructor names, renaming
-- * EVP_MD_CTX_{create,destroy} and deprecating ASN1_STRING_data. */
--
--#define EVP_MD_CTX_new EVP_MD_CTX_create
--#define EVP_MD_CTX_free EVP_MD_CTX_destroy
--#define ASN1_STRING_get0_data ASN1_STRING_data
--#define X509_STORE_CTX_set0_trusted_stack X509_STORE_CTX_trusted_stack
--
--/*
-- * 1.0.2 adds DHX support, which uses the RFC 3279 DomainParameters encoding we
-- * need for PKINIT.  For 1.0 we must use the original DH type when creating
-- * EVP_PKEY objects.
-- */
--#ifndef EVP_PKEY_DHX
--#define EVP_PKEY_DHX EVP_PKEY_DH
--#endif
--
--/* Make X509_NAME_print_ex() accept a const name pointer by adding a cast. */
--#define X509_NAME_print_ex(a, b, c, d)          \
--    X509_NAME_print_ex(a, (X509_NAME *)b, c, d)
--
--/* 1.1 makes many handle types opaque and adds accessors.  Add compatibility
-- * versions of the new accessors we use for pre-1.1. */
--
--#define OBJ_get0_data(o) ((o)->data)
--#define OBJ_length(o) ((o)->length)
--
--#define DH_set0_key compat_dh_set0_key
--static int
--compat_dh_set0_key(DH *dh, BIGNUM *pub, BIGNUM *priv)
--{
--    if (pub != NULL) {
--        BN_clear_free(dh->pub_key);
--        dh->pub_key = pub;
--    }
--    if (priv != NULL) {
--        BN_clear_free(dh->priv_key);
--        dh->priv_key = priv;
--    }
--    return 1;
--}
--
--#define DH_get0_key compat_dh_get0_key
--static void compat_dh_get0_key(const DH *dh, const BIGNUM **pub,
--                               const BIGNUM **priv)
--{
--    if (pub != NULL)
--        *pub = dh->pub_key;
--    if (priv != NULL)
--        *priv = dh->priv_key;
--}
--
--#define EVP_PKEY_get0_DH compat_get0_DH
--static DH *
--compat_get0_DH(const EVP_PKEY *pkey)
--{
--    if (pkey->type != EVP_PKEY_DH)
--        return NULL;
--    return pkey->pkey.dh;
--
--}
--
--#define EVP_PKEY_get0_EC_KEY compat_get0_EC
--static EC_KEY *
--compat_get0_EC(const EVP_PKEY *pkey)
--{
--    if (pkey->type != EVP_PKEY_EC)
--        return NULL;
--    return pkey->pkey.ec;
--}
--
--#define ECDSA_SIG_set0 compat_ECDSA_SIG_set0
--static int
--compat_ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
--{
--    sig->r = r;
--    sig->s = s;
--    return 1;
--}
--
--/* Return true if the cert c includes a key usage which doesn't include u.
-- * Define using direct member access for pre-1.1. */
--#define ku_reject(c, u)                                                 \
--    (((c)->ex_flags & EXFLAG_KUSAGE) && !((c)->ex_kusage & (u)))
--
--#else /* OPENSSL_VERSION_NUMBER >= 0x10100000L */
--
- /* Return true if the cert x includes a key usage which doesn't include u. */
- #define ku_reject(c, u) (!(X509_get_key_usage(c) & (u)))
- 
--#endif
--
- #if OPENSSL_VERSION_NUMBER < 0x30000000L
- /* OpenSSL 3.0 changes several preferred function names. */
- #define EVP_PKEY_parameters_eq EVP_PKEY_cmp_parameters
-@@ -371,8 +280,6 @@ decode_bn_der(const uint8_t *der, size_t len)
-     return bn;
- }
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
--
- #if OPENSSL_VERSION_NUMBER >= 0x30000000L
- static EVP_PKEY *
- decode_params(const krb5_data *params_der, const char *type)
-@@ -442,195 +349,6 @@ decode_spki(const krb5_data *spki)
-     return d2i_PUBKEY(NULL, &inptr, spki->length);
- }
- 
--#else /* OPENSSL_VERSION_NUMBER < 0x10100000L */
--
--/*
-- * OpenSSL 1.0 has no DHX support, so we need a custom decoder for RFC 3279
-- * DomainParameters, and we need to use X509_PUBKEY values to marshal
-- * SubjectPublicKeyInfo.
-- */
--
--typedef struct {
--    ASN1_BIT_STRING *seed;
--    BIGNUM *counter;
--} int_dhvparams;
--
--typedef struct {
--    BIGNUM *p;
--    BIGNUM *q;
--    BIGNUM *g;
--    BIGNUM *j;
--    int_dhvparams *vparams;
--} int_dhxparams;
--
--ASN1_SEQUENCE(int_dhvparams) = {
--    ASN1_SIMPLE(int_dhvparams, seed, ASN1_BIT_STRING),
--    ASN1_SIMPLE(int_dhvparams, counter, BIGNUM)
--} ASN1_SEQUENCE_END(int_dhvparams);
--
--ASN1_SEQUENCE(int_dhxparams) = {
--    ASN1_SIMPLE(int_dhxparams, p, BIGNUM),
--    ASN1_SIMPLE(int_dhxparams, g, BIGNUM),
--    ASN1_SIMPLE(int_dhxparams, q, BIGNUM),
--    ASN1_OPT(int_dhxparams, j, BIGNUM),
--    ASN1_OPT(int_dhxparams, vparams, int_dhvparams)
--} ASN1_SEQUENCE_END(int_dhxparams);
--
--static EVP_PKEY *
--decode_dh_params(const krb5_data *params_der)
--{
--    int_dhxparams *params;
--    DH *dh;
--    EVP_PKEY *pkey;
--    const uint8_t *p;
--
--    dh = DH_new();
--    if (dh == NULL)
--        return NULL;
--
--    p = (uint8_t *)params_der->data;
--    params = (int_dhxparams *)ASN1_item_d2i(NULL, &p, params_der->length,
--                                            ASN1_ITEM_rptr(int_dhxparams));
--    if (params == NULL) {
--        DH_free(dh);
--        return NULL;
--    }
--
--    /* Steal p, q, and g from dhparams for dh.  Ignore j and vparams. */
--    dh->p = params->p;
--    dh->q = params->q;
--    dh->g = params->g;
--    params->p = params->q = params->g = NULL;
--    ASN1_item_free((ASN1_VALUE *)params, ASN1_ITEM_rptr(int_dhxparams));
--    pkey = dh_to_pkey(&dh);
--    DH_free(dh);
--    return pkey;
--}
--
--static krb5_error_code
--encode_spki(EVP_PKEY *pkey, krb5_data *spki_out)
--{
--    krb5_error_code ret = ENOMEM;
--    const DH *dh;
--    uint8_t *param_der = NULL, *pubkey_der = NULL, *outptr;
--    int param_der_len, pubkey_der_len, len;
--    X509_PUBKEY pubkey;
--    int_dhxparams dhxparams;
--    X509_ALGOR algor;
--    ASN1_OBJECT algorithm;
--    ASN1_TYPE parameter;
--    ASN1_STRING param_str, pubkey_str;
--
--    if (EVP_PKEY_base_id(pkey) != EVP_PKEY_DH) {
--        /* Only DH keys require special encoding. */
--        len = i2d_PUBKEY(pkey, NULL);
--        ret = alloc_data(spki_out, len);
--        if (ret)
--            goto cleanup;
--        outptr = (uint8_t *)spki_out->data;
--        (void)i2d_PUBKEY(pkey, &outptr);
--        return 0;
--    }
--
--    dh = EVP_PKEY_get0_DH(pkey);
--    if (dh == NULL)
--        goto cleanup;
--
--    dhxparams.p = dh->p;
--    dhxparams.q = dh->q;
--    dhxparams.g = dh->g;
--    dhxparams.j = NULL;
--    dhxparams.vparams = NULL;
--    param_der_len = ASN1_item_i2d((ASN1_VALUE *)&dhxparams, &param_der,
--                                  ASN1_ITEM_rptr(int_dhxparams));
--    if (param_der_len < 0)
--        goto cleanup;
--    param_str.length = param_der_len;
--    param_str.type = V_ASN1_SEQUENCE;
--    param_str.data = param_der;
--    param_str.flags = 0;
--    parameter.type = V_ASN1_SEQUENCE;
--    parameter.value.sequence = &param_str;
--
--    memset(&algorithm, 0, sizeof(algorithm));
--    algorithm.data = (uint8_t *)dh_oid.data;
--    algorithm.length = dh_oid.length;
--
--    algor.algorithm = &algorithm;
--    algor.parameter = &parameter;
--
--    if (!encode_bn_der(dh->pub_key, &pubkey_der, &pubkey_der_len))
--        goto cleanup;
--    pubkey_str.length = pubkey_der_len;
--    pubkey_str.type = V_ASN1_BIT_STRING;
--    pubkey_str.data = pubkey_der;
--    pubkey_str.flags = ASN1_STRING_FLAG_BITS_LEFT;
--
--    pubkey.algor = &algor;
--    pubkey.public_key = &pubkey_str;
--    len = i2d_X509_PUBKEY(&pubkey, NULL);
--    if (len < 0)
--        goto cleanup;
--    ret = alloc_data(spki_out, len);
--    if (ret)
--        goto cleanup;
--    outptr = (uint8_t *)spki_out->data;
--    i2d_X509_PUBKEY(&pubkey, &outptr);
--
--cleanup:
--    OPENSSL_free(param_der);
--    free(pubkey_der);
--    return ret;
--}
--
--static EVP_PKEY *
--decode_spki(const krb5_data *spki)
--{
--    X509_PUBKEY *pubkey = NULL;
--    const uint8_t *inptr;
--    DH *dh;
--    EVP_PKEY *pkey = NULL, *pkey_ret = NULL;
--    const ASN1_STRING *params;
--    const ASN1_BIT_STRING *public_key;
--    krb5_data d;
--
--    inptr = (uint8_t *)spki->data;
--    pubkey = d2i_X509_PUBKEY(NULL, &inptr, spki->length);
--    if (pubkey == NULL)
--        goto cleanup;
--
--    if (OBJ_cmp(pubkey->algor->algorithm, OBJ_nid2obj(NID_dhKeyAgreement))) {
--        /* This is not a DH key, so we don't need special decoding. */
--        X509_PUBKEY_free(pubkey);
--        inptr = (uint8_t *)spki->data;
--        return d2i_PUBKEY(NULL, &inptr, spki->length);
--    }
--
--    if (pubkey->algor->parameter->type != V_ASN1_SEQUENCE)
--        goto cleanup;
--    params = pubkey->algor->parameter->value.sequence;
--    d = make_data(params->data, params->length);
--    pkey = decode_dh_params(&d);
--    if (pkey == NULL)
--        goto cleanup;
--    dh = EVP_PKEY_get0_DH(pkey);
--    if (dh == NULL)
--        goto cleanup;
--    public_key = pubkey->public_key;
--    dh->pub_key = decode_bn_der(public_key->data, public_key->length);
--    if (dh->pub_key == NULL)
--        goto cleanup;
--
--    pkey_ret = pkey;
--    pkey = NULL;
--
--cleanup:
--    X509_PUBKEY_free(pubkey);
--    EVP_PKEY_free(pkey);
--    return pkey_ret;
--}
--
--#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
- 
- #if OPENSSL_VERSION_NUMBER >= 0x30000000L
- 
-@@ -673,7 +391,7 @@ set_padded_derivation(EVP_PKEY_CTX *ctx)
- {
-     EVP_PKEY_CTX_set_dh_pad(ctx, 1);
- }
--#elif OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#else
- static void
- set_padded_derivation(EVP_PKEY_CTX *ctx)
- {
-@@ -681,12 +399,6 @@ set_padded_derivation(EVP_PKEY_CTX *ctx)
-     EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DHX, EVP_PKEY_OP_DERIVE,
-                       EVP_PKEY_CTRL_DH_PAD, 1, NULL);
- }
--#else
--static void
--set_padded_derivation(EVP_PKEY_CTX *ctx)
--{
--    /* There's no support for padded derivation in 1.0. */
--}
- #endif
- 
- static int
-@@ -809,29 +521,6 @@ dh_pubkey_der(EVP_PKEY *pkey, uint8_t **pubkey_out, unsigned int *len_out)
- }
- #endif
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
--/* OpenSSL 1.1 and later will copy the q parameter when generating keys. */
--static int
--copy_q_openssl10(EVP_PKEY *src, EVP_PKEY *dest)
--{
--    return 1;
--}
--#else
--/* OpenSSL 1.0 won't copy the q parameter, so we have to do it. */
--static int
--copy_q_openssl10(EVP_PKEY *src, EVP_PKEY *dest)
--{
--    DH *dhsrc = EVP_PKEY_get0_DH(src), *dhdest = EVP_PKEY_get0_DH(dest);
--
--    if (dhsrc == NULL || dhsrc->q == NULL || dhdest == NULL)
--        return 0;
--    if (dhdest->q != NULL)
--        return 1;
--    dhdest->q = BN_dup(dhsrc->q);
--    return dhdest->q != NULL;
--}
--#endif
--
- static EVP_PKEY *
- generate_dh_pkey(EVP_PKEY *params)
- {
-@@ -845,11 +534,6 @@ generate_dh_pkey(EVP_PKEY *params)
-         goto cleanup;
-     if (EVP_PKEY_keygen(ctx, &pkey) <= 0)
-         goto cleanup;
--    if (EVP_PKEY_get_base_id(pkey) == EVP_PKEY_DH &&
--        !copy_q_openssl10(params, pkey)) {
--        EVP_PKEY_free(pkey);
--        pkey = NULL;
--    }
- 
- cleanup:
-     EVP_PKEY_CTX_free(ctx);
-@@ -900,33 +584,6 @@ cleanup:
- 
- #else /* OPENSSL_VERSION_NUMBER < 0x30000000L */
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
--static DH *
--dup_dh_params(DH *src)
--{
--    return DHparams_dup(src);
--}
--#else
--/* DHparams_dup() won't copy q in OpenSSL 1.0. */
--static DH *
--dup_dh_params(DH *src)
--{
--    DH *dh;
--
--    dh = DH_new();
--    if (dh == NULL)
--        return NULL;
--    dh->p = BN_dup(src->p);
--    dh->q = BN_dup(src->q);
--    dh->g = BN_dup(src->g);
--    if (dh->p == NULL || dh->q == NULL || dh->g == NULL) {
--        DH_free(dh);
--        return NULL;
--    }
--    return dh;
--}
--#endif
--
- static EVP_PKEY *
- compose_dh_pkey(EVP_PKEY *params, const uint8_t *pubkey_der, size_t der_len)
- {
-@@ -966,7 +623,7 @@ compose_dh_pkey(EVP_PKEY *params, const uint8_t *pubkey_der, size_t der_len)
-         dhparams = EVP_PKEY_get0_DH(params);
-         if (dhparams == NULL)
-             goto cleanup;
--        dh = dup_dh_params(dhparams);
-+        dh = DHparams_dup(dhparams);
-         if (dh == NULL)
-             goto cleanup;
-         if (!DH_set0_key(dh, pubkey_bn, NULL))
-@@ -1083,8 +740,6 @@ static struct pkcs11_errstrings {
- };
- #endif
- 
--MAKE_INIT_FUNCTION(pkinit_openssl_init);
--
- static krb5_error_code oerr(krb5_context context, krb5_error_code code,
-                             const char *fmt, ...)
- #if !defined(__cplusplus) && (__GNUC__ > 2)
-@@ -1164,8 +819,6 @@ pkinit_init_plg_crypto(krb5_context context,
-     krb5_error_code retval = ENOMEM;
-     pkinit_plg_crypto_context ctx = NULL;
- 
--    (void)CALL_INIT_FUNCTION(pkinit_openssl_init);
--
-     ctx = malloc(sizeof(*ctx));
-     if (ctx == NULL)
-         goto out;
-@@ -3114,17 +2767,6 @@ cleanup:
-     return retval;
- }
- 
--int
--pkinit_openssl_init(void)
--{
--    /* Initialize OpenSSL. */
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
--    ERR_load_crypto_strings();
--    OpenSSL_add_all_algorithms();
--#endif
--    return 0;
--}
--
- static krb5_error_code
- pkinit_create_sequence_of_principal_identifiers(
-     krb5_context context,
-@@ -5834,13 +5476,3 @@ crypto_verify_checksums(krb5_context context, krb5_data *body,
- 
-     return 0;
- }
--
--#ifdef _WIN32
--BOOL WINAPI
--DllMain(HANDLE hModule, DWORD fdwReason, LPVOID lpvReserved)
--{
--    if (fdwReason == DLL_PROCESS_ATTACH)
--        pkinit_openssl_init__auxinit();
--    return TRUE;
--}
--#endif /* _WIN32 */
-diff --git a/src/plugins/preauth/spake/openssl.c b/src/plugins/preauth/spake/openssl.c
-index f2e4b53..fbaa65e 100644
---- a/src/plugins/preauth/spake/openssl.c
-+++ b/src/plugins/preauth/spake/openssl.c
-@@ -41,13 +41,6 @@
- #include <openssl/obj_mac.h>
- #include <openssl/evp.h>
- 
--/* OpenSSL 1.1 standardizes constructor and destructor names, renaming
-- * EVP_MD_CTX_create and EVP_MD_CTX_destroy. */
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
--#define EVP_MD_CTX_new EVP_MD_CTX_create
--#define EVP_MD_CTX_free EVP_MD_CTX_destroy
--#endif
--
- struct groupdata_st {
-     const groupdef *gdef;
-     EC_GROUP *group;
-diff --git a/src/plugins/tls/k5tls/openssl.c b/src/plugins/tls/k5tls/openssl.c
-index cc8fc70..bbfa37f 100644
---- a/src/plugins/tls/k5tls/openssl.c
-+++ b/src/plugins/tls/k5tls/openssl.c
-@@ -38,14 +38,6 @@
- #include <openssl/x509v3.h>
- #include <dirent.h>
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
--/* Make X509_get_subject_name() accept a const pointer by adding a cast. */
--#define X509_get_subject_name(a) X509_get_subject_name((X509 *)a)
--
--/* OpenSSL 1.0 did not have TLS_client_method(); use the best alternative. */
--#define TLS_client_method() SSLv23_client_method()
--#endif
--
- #if OPENSSL_VERSION_NUMBER < 0x40000000L
- /*
-  * OpenSSL 4.0 constifies the result of X509_STORE_CTX_get_current_cert() and
-@@ -69,11 +61,6 @@ MAKE_INIT_FUNCTION(init_openssl);
- int
- init_openssl(void)
- {
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
--    SSL_library_init();
--    SSL_load_error_strings();
--    OpenSSL_add_all_algorithms();
--#endif
-     ex_context_id = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
-     ex_handle_id = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
-     return 0;
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0003-k5tls-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch b/meta-oe/recipes-connectivity/krb5/krb5/0003-k5tls-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
index 261c8387b5..557827cb5e 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5/0003-k5tls-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0003-k5tls-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
@@ -14,20 +14,14 @@ Note: Upstream fixed this by removing OpenSSL 1.0 support entirely
 these additional const qualifiers.
 
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- plugins/tls/k5tls/openssl.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/src/plugins/tls/k5tls/openssl.c b/src/plugins/tls/k5tls/openssl.c
-index bbfa37f..6efe613 100644
+Rebased to 1.22.3, which already constifies the function parameters.
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
 --- a/src/plugins/tls/k5tls/openssl.c
 +++ b/src/plugins/tls/k5tls/openssl.c
-@@ -146,10 +146,10 @@ domain_match(const char *presented, size_t plen, const char *expected)
- 
- /* Fetch the list of subjectAltNames from a certificate. */
- static GENERAL_NAMES *
--get_cert_sans(X509 *x)
-+get_cert_sans(const X509 *x)
+@@ -162,7 +162,7 @@
+ get_cert_sans(const X509 *x)
  {
      int ext;
 -    X509_EXTENSION *san_ext;
@@ -35,33 +29,12 @@ index bbfa37f..6efe613 100644
  
      ext = X509_get_ext_by_NID(x, NID_subject_alt_name, -1);
      if (ext < 0)
-@@ -163,9 +163,9 @@ get_cert_sans(X509 *x)
- /* Fetch a CN value from the subjct name field, returning its length, or -1 if
-  * there is no subject name or it contains no CN value. */
+@@ -178,7 +178,7 @@
  static int
--get_cert_cn(X509 *x, char *buf, size_t bufsize)
-+get_cert_cn(const X509 *x, char *buf, size_t bufsize)
+ get_cert_cn(const X509 *x, char *buf, size_t bufsize)
  {
 -    X509_NAME *name;
 +    const X509_NAME *name;
  
      name = X509_get_subject_name(x);
      if (name == NULL)
-@@ -175,7 +175,7 @@ get_cert_cn(X509 *x, char *buf, size_t bufsize)
- 
- /* Return true if text matches any of the addresses we can recover from x. */
- static krb5_boolean
--check_cert_address(X509 *x, const char *text)
-+check_cert_address(const X509 *x, const char *text)
- {
-     char buf[1024];
-     GENERAL_NAMES *sans;
-@@ -234,7 +234,7 @@ check_cert_address(X509 *x, const char *text)
- 
- /* Return true if expected matches any of the names we can recover from x. */
- static krb5_boolean
--check_cert_servername(X509 *x, const char *expected)
-+check_cert_servername(const X509 *x, const char *expected)
- {
-     char buf[1024];
-     GENERAL_NAMES *sans;
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/fix-strchr-conformance-to-C23.patch b/meta-oe/recipes-connectivity/krb5/krb5/fix-strchr-conformance-to-C23.patch
deleted file mode 100644
index 0cc50d2fdb..0000000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/fix-strchr-conformance-to-C23.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-From cf3fcbb7ad5f3ffd78eb7dd4ecbc96c98ad15208 Mon Sep 17 00:00:00 2001
-From: Alexander Bokovoy <abokovoy@redhat.com>
-Date: Wed, 10 Dec 2025 10:42:02 +0200
-Subject: [PATCH] Fix strchr() conformance to C23
-
-C23 7.28.5.1 specifies search functions such as strchr() as generic,
-returning const char * if the first argument is of type const char *.
-Fix uses of strchr() to conform to this change.
-
-[jrische@redhat.com: altered changes to avoid casts; fixed an
-additional case]
-[ghudson@mit.edu: condensed some declarations; rewrote commit message]
-
-ticket: 9191 (new)
-
-Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
-Upstream-Status: Backport [https://github.com/krb5/krb5/commit/ad4dcf1856dadc4b352b5c8ff08e51c7290fb41f]
----
- src/lib/krb5/ccache/ccbase.c                      |  4 ++--
- src/lib/krb5/os/expand_path.c                     |  3 ++-
- src/lib/krb5/os/locate_kdc.c                      | 15 +++++++--------
- src/plugins/preauth/pkinit/pkinit_crypto.h        |  2 +-
- src/preauth/pkinit/pkinit_crypto_openssl.c        |  6 +++---
- src/plugins/preauth/pkinit/pkinit_identity.c      |  2 +-
- src/plugins/preauth/pkinit/pkinit_matching.c      |  2 +-
- src/tests/responder.c                             |  3 +--
- 8 files changed, 18 insertions(+), 19 deletions(-)
-
-diff --git a/src/lib/krb5/ccache/ccbase.c b/src/lib/krb5/ccache/ccbase.c
-index 696b681..30a0a41 100644
---- a/src/lib/krb5/ccache/ccbase.c
-+++ b/src/lib/krb5/ccache/ccbase.c
-@@ -201,8 +201,8 @@ krb5_cc_register(krb5_context context, const krb5_cc_ops *ops,
- krb5_error_code KRB5_CALLCONV
- krb5_cc_resolve (krb5_context context, const char *name, krb5_ccache *cache)
- {
--    char *pfx, *cp;
--    const char *resid;
-+    char *pfx;
-+    const char *cp, *resid;
-     unsigned int pfxlen;
-     krb5_error_code err;
-     const krb5_cc_ops *ops;
-diff --git a/src/lib/krb5/os/expand_path.c b/src/lib/krb5/os/expand_path.c
-index 5cbccf0..6569b88 100644
---- a/src/lib/krb5/os/expand_path.c
-+++ b/src/lib/krb5/os/expand_path.c
-@@ -454,7 +454,8 @@ k5_expand_path_tokens_extra(krb5_context context, const char *path_in,
- {
-     krb5_error_code ret;
-     struct k5buf buf;
--    char *tok_begin, *tok_end, *tok_val, **extra_tokens = NULL, *path;
-+    const char *tok_begin, *tok_end;
-+    char *tok_val, **extra_tokens = NULL, *path;
-     const char *path_left;
-     size_t nargs = 0, i;
-     va_list ap;
-diff --git a/src/lib/krb5/os/locate_kdc.c b/src/lib/krb5/os/locate_kdc.c
-index d1df04a..6559465 100644
---- a/src/lib/krb5/os/locate_kdc.c
-+++ b/src/lib/krb5/os/locate_kdc.c
-@@ -214,8 +214,8 @@ oom:
- }
- 
- static void
--parse_uri_if_https(const char *host_or_uri, k5_transport *transport,
--                   const char **host, const char **uri_path)
-+parse_uri_if_https(char *host_or_uri, k5_transport *transport,
-+                   char **host, const char **uri_path)
- {
-     char *cp;
- 
-@@ -257,8 +257,7 @@ locate_srv_conf_1(krb5_context context, const krb5_data *realm,
-                   k5_transport transport, int udpport)
- {
-     const char *realm_srv_names[4];
--    char **hostlist = NULL, *realmstr = NULL, *host = NULL;
--    const char *hostspec;
-+    char **hostlist = NULL, *realmstr = NULL, *host = NULL, *hostspec;
-     krb5_error_code code;
-     size_t i;
-     int default_port;
-@@ -587,8 +586,8 @@ prof_locate_server(krb5_context context, const krb5_data *realm,
-  * Return a NULL *host_out if there are any problems parsing the URI.
-  */
- static void
--parse_uri_fields(const char *uri, k5_transport *transport_out,
--                 const char **host_out, int *primary_out)
-+parse_uri_fields(char *uri, k5_transport *transport_out,
-+                 char **host_out, int *primary_out)
- 
- {
-     k5_transport transport;
-@@ -656,8 +655,8 @@ locate_uri(krb5_context context, const krb5_data *realm,
-     krb5_error_code ret;
-     k5_transport transport, host_trans;
-     struct srv_dns_entry *answers, *entry;
--    char *host, *sitename;
--    const char *host_field, *path;
-+    char *host, *sitename, *host_field;
-+    const char *path;
-     int port, def_port, primary;
- 
-     ret = get_sitename(context, realm, &sitename);
-diff --git a/src/plugins/preauth/pkinit/pkinit_crypto.h b/src/plugins/preauth/pkinit/pkinit_crypto.h
-index 57bb3cb..be2d02c 100644
---- a/src/plugins/preauth/pkinit/pkinit_crypto.h
-+++ b/src/plugins/preauth/pkinit/pkinit_crypto.h
-@@ -440,7 +440,7 @@ krb5_error_code crypto_load_cas_and_crls
- 		    defines the storage type (file, directory, etc) */
- 	int catype,					/* IN
- 		    defines the ca type (anchor, intermediate, crls) */
--	char *id);					/* IN
-+	const char *id);				/* IN
- 		    defines the location (filename, directory name, etc) */
- 
- /*
-diff --git a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
-index f222dbd..0a731a8 100644
---- a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
-+++ b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
-@@ -4999,7 +4999,7 @@ load_cas_and_crls(krb5_context context,
-                   pkinit_req_crypto_context req_cryptoctx,
-                   pkinit_identity_crypto_context id_cryptoctx,
-                   int catype,
--                  char *filename)
-+                  const char *filename)
- {
-     STACK_OF(X509_INFO) *sk = NULL;
-     STACK_OF(X509) *ca_certs = NULL;
-@@ -5157,7 +5157,7 @@ load_cas_and_crls_dir(krb5_context context,
-                       pkinit_req_crypto_context req_cryptoctx,
-                       pkinit_identity_crypto_context id_cryptoctx,
-                       int catype,
--                      char *dirname)
-+                      const char *dirname)
- {
-     krb5_error_code retval = EINVAL;
-     char **fnames = NULL, *filename;
-@@ -5201,7 +5201,7 @@ crypto_load_cas_and_crls(krb5_context context,
-                          pkinit_identity_crypto_context id_cryptoctx,
-                          int idtype,
-                          int catype,
--                         char *id)
-+                         const char *id)
- {
-     switch (idtype) {
-     case IDTYPE_FILE:
-diff --git a/src/plugins/preauth/pkinit/pkinit_identity.c b/src/plugins/preauth/pkinit/pkinit_identity.c
-index 0dcfcfc..ad65f23 100644
---- a/src/plugins/preauth/pkinit/pkinit_identity.c
-+++ b/src/plugins/preauth/pkinit/pkinit_identity.c
-@@ -473,7 +473,7 @@ process_option_ca_crl(krb5_context context,
-                       const char *value,
-                       int catype)
- {
--    char *residual;
-+    const char *residual;
-     unsigned int typelen;
-     int idtype;
- 
-diff --git a/src/plugins/preauth/pkinit/pkinit_matching.c b/src/plugins/preauth/pkinit/pkinit_matching.c
-index 0ea072c..b3c8df1 100644
---- a/src/plugins/preauth/pkinit/pkinit_matching.c
-+++ b/src/plugins/preauth/pkinit/pkinit_matching.c
-@@ -262,7 +262,7 @@ parse_rule_component(krb5_context context,
-     char err_buf[128];
-     int ret;
-     struct keyword_desc *kw, *nextkw;
--    char *nk;
-+    const char *nk;
-     int found_next_kw = 0;
-     char *value = NULL;
-     size_t len;
-diff --git a/src/tests/responder.c b/src/tests/responder.c
-index 82f870e..4221a20 100644
---- a/src/tests/responder.c
-+++ b/src/tests/responder.c
-@@ -282,8 +282,7 @@ responder(krb5_context ctx, void *rawdata, krb5_responder_context rctx)
-     /* Provide a particular response for an OTP challenge. */
-     if (data->otp_answer != NULL) {
-         if (krb5_responder_otp_get_challenge(ctx, rctx, &ochl) == 0) {
--            key = strchr(data->otp_answer, '=');
--            if (key != NULL) {
-+            if (strchr(data->otp_answer, '=') != NULL) {
-                 /* Make a copy of the answer that we can chop up. */
-                 key = strdup(data->otp_answer);
-                 if (key == NULL)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.22.3.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.22.3.bb
index 7666ec5671..8fa9ac0859 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.22.3.bb
@@ -14,18 +14,15 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=c1deab93872560046ba4411e77050d24"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=c6db3fa5ceaf04e691eece16e60a9ef2"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d pkgconfig
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
-           file://fix-strchr-conformance-to-C23.patch;striplevel=2 \
            file://crosscompile_nm.patch \
            file://0001-configure.ac-replace-K5_AC_INIT-with-explicit-AC_INI.patch;striplevel=2 \
-           file://0001-Improve-future-OpenSSL-compatibility.patch;striplevel=2 \
-           file://0002-Remove-OpenSSL-1.0-support.patch;striplevel=2 \
            file://0003-k5tls-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch;striplevel=2 \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \
@@ -35,7 +32,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-admin-server.service \
 "
 
-SRC_URI[sha256sum] = "3243ffbc8ea4d4ac22ddc7dd2a1dc54c57874c40648b60ff97009763554eaf13"
+SRC_URI[sha256sum] = "fe90af8441ad9fa9b064b8e53077cefb782a96f8a68276b031dc54af1789ff0b"
 
 CVE_PRODUCT = "kerberos"
 CVE_VERSION = "5-${PV}"
