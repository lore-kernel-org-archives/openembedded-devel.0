Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C629CCC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33266.1792043088250421654
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y8j6ROW9;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6d28aa26cso7126975ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043088; x=1792647888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yl091zSqxJ1wyONVqV3/9eoGbFJvQFprUh6CXfXL+Aw=;
        b=Y8j6ROW9X20zuDoeFPDIMO7M7YlBGnUhjDnPn3yAFauDM7ABjL+0i/jcvJxpdlGl9F
         qDgO/FkhNjcYVUdHS1ymRDSdh5Z7vUPLxBQwofCG8xia+CNu1L8ybjVNa10o5x8eRqDx
         kMtGjADSfWb3Faj+USbt/8s6Ne89aGrbOENkjXpR+mVi77WzcmJi91kVvGBthXde9lkd
         b1fgP3fzGiOJ0d6oW3ZuRjdDt6mnbTlN7j+xfC69PIsPFWV+eGat+aXE50kQYbsEBHTq
         1FDx4hJzyi/ujLiPgLStqO0Sby4NdZBvrunFuafnpSRd5iCTrykRlZhs5+2tzW+BFuGW
         8kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043088; x=1792647888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yl091zSqxJ1wyONVqV3/9eoGbFJvQFprUh6CXfXL+Aw=;
        b=JuVsbMxiyt7BhAjQwL3DIRLEvHe1GF+lx3b5Ef4McWtU3HpRDZDwyga7qT6hMnyiOT
         enByna/siTNrIIw7z+KRXsHfSNnIp29e1dyU8gYzQGDZ5N2nJquzX/sMcnESR6rh0P/J
         Fj9ecegArodfgnDmE6EbCLDy69226qpmFG/DQXMVxg3kZtM5zymgBC2yp+QD8xyDrhEA
         2hwtY02jkkhewMm0IV6uVVSJa+WRbvwcddzWrke2iTZBDG7n6fnhKXbZAvh9qSzNNPOP
         kkuT5Z8l+P30rW8s/kNgixYnfnilzTa3PdWpCvBBgTcPkwkSNaT6sPwbpPGGBxSlkv/I
         Xdfg==
X-Gm-Message-State: AFq9FYLG55Een3Nflahuyeg4fgKamaALJLkhFdQ4Hlv0RSkaPNIunPJo
	XdkzbWsDr7W6rpLI/O6Z0y1pOXHocN9Xu1lgQ4d+d2MZ63niTaF2f4hq3if5Kw==
X-Gm-Gg: AYBFou16kVuBfjKllIP52QzFlo7wtugKYJYsTdezwc1DJSlcYzc/If7ZyZTztp2wc+E
	xccPBZf6QatEiKvNrlc0YOqO1HMPfF/wZDbdMIEnEVXvXbshmDvUNJMoELQ9gcfbZPXlBznNgoo
	e/GDqg6KFENmjpc7qKBQ9JXb9IMdJSwp2B223EOf/DS8r2rrJW3jfdkWg9+tZQkB4yZ3k/PU4TR
	0JRjPEbn7W4fcAtil2TGUH4ZwNHuoopbDKgSeej/ccQgmxOJs7FG1+qwqqrazvSmAxcmtYa1pKX
	FdJUomg3oRwBz2cxITH1C5qQCFjBxzRFQvrFv3Fo1Z3OW3T86/VxyBZcTYLu6o0enFfOpha2Jez
	IhsPY/x51RssV0dp32/hSgDRAxCSyctPuulSUcwKw1Vl4JUyI+pJNdckRydrEjlfAN6DGO11gwL
	sHqJ48LMjjrjmll0FoJL39zSkmVbmtjWSVaBxya+WP3gpUbsyZU7PeekYoDgQVgJOLOGo5ZPE5G
	LfjmOzN1unM0K3MwKWXm+E=
X-Received: by 2002:a17:903:950:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2e842dfd193mr149451585ad.50.1792043087395;
        Wed, 14 Oct 2026 22:44:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 55/82] openvpn: patch CVE-2026-84790
Date: Thu, 15 Oct 2026 18:41:43 +1300
Message-ID: <6df0b8c57663e0aee6e405dd7e4624c8e0817dfd.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130975

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1], also mentioned in the release note
https://github.com/OpenVPN/openvpn/releases/tag/v2.7.8

[1]https://security-tracker.debian.org/tracker/CVE-2026-84790

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openvpn/openvpn/CVE-2026-84790.patch      | 361 ++++++++++++++++++
 .../recipes-support/openvpn/openvpn_2.7.7.bb  |   1 +
 2 files changed, 362 insertions(+)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-84790.patch

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-84790.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-84790.patch
new file mode 100644
index 0000000000..b6f70d106d
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-84790.patch
@@ -0,0 +1,361 @@
+From 493c3b382a907ff2d5870cd0d21526bd2e866ebb Mon Sep 17 00:00:00 2001
+From: Max Fillinger <maximilian.fillinger@sentyron.com>
+Date: Thu, 17 Sep 2026 14:46:05 +0200
+Subject: [PATCH] Check for null-bytes in certificate subjects
+
+When using the OpenSSL library, we escaped embedded null-bytes in a
+certificate's subject in x509_get_subject(), but in
+extract_x509_field_ssl(), we copied any null-bytes that are contained in
+the field value. When using the option --verify-x509-name, this could
+lead to an incorrect name being accepted. For example, the common name
+"admin\0impersonator" would be accepted when running with
+--verify-x509-name admin name.
+
+To fix this, this commit makes x509_get_subject() return an error if the
+subject contains an embedded null-byte. This way, OpenVPN won't connect
+with peers that present such certificates.
+
+As a defense-in-depth measure, we also check for null-bytes in
+extract_x509_field_ssl() in case a future version of OpenVPN has a code
+path that avoids x509_get_subject().
+
+With Mbed TLS, the x509_get_subject() function already returned an error
+when there is an embedded null-byte. (As of Mbed TLS 3.5.) Here too, we
+added a check for null-bytes to the function where we extract individual
+fields from the subject.
+
+Also, backend_x509_get_username() is changed so that it returns the
+value of the *last* matching field, to be consistent with the behavior
+of the OpenSSL backend.
+
+This is a partial backport of the commit
+"Check for \0 and RFC 2253 chars in cert subjects" from the master
+branch but skipping the part about escaping RFC 2253 characters to avoid
+user-visible changes in a patch release. We do not consider the
+null-byte check "user-visible" because we don't expect users to put
+null-bytes into the common name.
+
+v2: The previous version of the commit unescaped control characters in
+the subject, so it had user-visible changes after all. This version
+escapes any control characters in the subject.
+
+Discovered and reported by BreachX Zero Day Labs, using Typhon AI Mil v2.
+Contributing Researcher: Vivek Parikh.
+
+CVE: 2026-84790
+Reported-by: Vivek Parikh <vivek.parikh@breachx.ai>
+Github: OpenVPN/openvpn-private-issues#163
+
+Change-Id: Iea1481e94ba1abe18c39d81cd797187c88427571
+Signed-off-by: Max Fillinger <maximilian.fillinger@sentyron.com>
+Acked-by: Steffan Karger <steffan@karger.me>
+Gerrit URL: https://gerrit.openvpn.net/c/openvpn/+/1902
+Message-Id: <20260917124610.14291-1-gert@greenie.muc.de>
+URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg39304.html
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+(cherry picked from commit cf4384eef4676a01bd3ee98fa602f7b2af8079ea)
+
+CVE: CVE-2026-84790
+Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/cf4384eef4676a01bd3ee98fa602f7b2af8079ea]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/openvpn/ssl_verify_mbedtls.c    | 51 ++++++++++------
+ src/openvpn/ssl_verify_openssl.c    | 41 ++++++++++---
+ tests/unit_tests/openvpn/test_ssl.c | 92 ++++++++++++++++++++++++++++-
+ 3 files changed, 155 insertions(+), 29 deletions(-)
+
+diff --git a/src/openvpn/ssl_verify_mbedtls.c b/src/openvpn/ssl_verify_mbedtls.c
+index 66cc66e5..1319c079 100644
+--- a/src/openvpn/ssl_verify_mbedtls.c
++++ b/src/openvpn/ssl_verify_mbedtls.c
+@@ -214,6 +214,24 @@ fieldname_to_oid(const char *fieldname)
+     }
+ }
+ 
++static bool
++asn1_buf_is_cstr_compatible(const mbedtls_asn1_buf *asn1_buf)
++{
++    if (!(asn1_buf->tag == MBEDTLS_ASN1_UTF8_STRING || asn1_buf->tag == MBEDTLS_ASN1_PRINTABLE_STRING
++          || asn1_buf->tag == MBEDTLS_ASN1_IA5_STRING))
++    {
++        return false;
++    }
++    for (size_t i = 0; i < asn1_buf->len; i++)
++    {
++        if (asn1_buf->p[i] == '\0')
++        {
++            return false;
++        }
++    }
++    return true;
++}
++
+ result_t
+ backend_x509_get_username(char *cn, size_t cn_len, char *x509_username_field, mbedtls_x509_crt *cert)
+ {
+@@ -259,16 +277,17 @@ backend_x509_get_username(char *cn, size_t cn_len, char *x509_username_field, mb
+     }
+ 
+     /* Find field_oid in the subject name. */
+-    mbedtls_x509_name *name = &cert->subject;
+-    while (name != NULL)
++    mbedtls_x509_name *name = NULL;
++    mbedtls_x509_name *next = &cert->subject;
++    while (next != NULL)
+     {
+-        if (strlen(field_oid) == name->oid.len
+-            && 0 == memcmp(name->oid.p, field_oid, name->oid.len))
++        if (strlen(field_oid) == next->oid.len
++            && 0 == memcmp(next->oid.p, field_oid, next->oid.len))
+         {
+-            break;
++            name = next;
+         }
+ 
+-        name = name->next;
++        next = next->next;
+     }
+ 
+     /* Not found, return an error if this is the peer's certificate */
+@@ -277,6 +296,11 @@ backend_x509_get_username(char *cn, size_t cn_len, char *x509_username_field, mb
+         goto fail;
+     }
+ 
++    if (!asn1_buf_is_cstr_compatible(&name->val))
++    {
++        goto fail;
++    }
++
+     /* Check that we have room in the buffer, including the terminating '/0' byte. */
+     if (cn_len <= name->val.len)
+     {
+@@ -586,22 +610,11 @@ do_setenv_x509(struct env_set *es, const char *name, char *value, int depth)
+ static char *
+ asn1_buf_to_c_string(const mbedtls_asn1_buf *orig, struct gc_arena *gc)
+ {
+-    size_t i;
+     char *val;
+ 
+-    if (!(orig->tag == MBEDTLS_ASN1_UTF8_STRING || orig->tag == MBEDTLS_ASN1_PRINTABLE_STRING
+-          || orig->tag == MBEDTLS_ASN1_IA5_STRING))
++    if (!asn1_buf_is_cstr_compatible(orig))
+     {
+-        /* Only support C-string compatible types */
+-        return string_alloc("ERROR: unsupported ASN.1 string type", gc);
+-    }
+-
+-    for (i = 0; i < orig->len; ++i)
+-    {
+-        if (orig->p[i] == '\0')
+-        {
+-            return string_alloc("ERROR: embedded null value", gc);
+-        }
++        return string_alloc("ERROR: Unsupported string type or embedded null bytes.", gc);
+     }
+     val = gc_malloc(orig->len + 1, false, gc);
+     memcpy(val, orig->p, orig->len);
+diff --git a/src/openvpn/ssl_verify_openssl.c b/src/openvpn/ssl_verify_openssl.c
+index a30099d0..1f2804ff 100644
+--- a/src/openvpn/ssl_verify_openssl.c
++++ b/src/openvpn/ssl_verify_openssl.c
+@@ -196,12 +196,13 @@ extract_x509_field_ssl(const X509_NAME *x509, const char *field_name, char *out,
+     int lastpos = -1;
+     int tmp = -1;
+     unsigned char *buf = NULL;
++    result_t ret = FAILURE;
+ 
+     ASN1_OBJECT *field_name_obj = OBJ_txt2obj(field_name, 0);
+     if (field_name_obj == NULL)
+     {
+         msg(D_TLS_ERRORS, "Invalid X509 attribute name '%s'", field_name);
+-        return FAILURE;
++        goto exit;
+     }
+ 
+     ASSERT(size > 0);
+@@ -222,28 +223,31 @@ extract_x509_field_ssl(const X509_NAME *x509, const char *field_name, char *out,
+     /* Nothing found */
+     if (lastpos == -1)
+     {
+-        return FAILURE;
++        goto exit;
+     }
+ 
+     const X509_NAME_ENTRY *x509ne = X509_NAME_get_entry(x509, lastpos);
+     if (!x509ne)
+     {
+-        return FAILURE;
++        goto exit;
+     }
+ 
+     const ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(x509ne);
+     if (!asn1)
+     {
+-        return FAILURE;
++        goto exit;
+     }
+-    if (ASN1_STRING_to_UTF8(&buf, asn1) < 0)
++    int length = ASN1_STRING_to_UTF8(&buf, asn1);
++    if (length < 0 || (size_t)length != strlen((char *)buf))
+     {
+-        return FAILURE;
++        goto exit;
+     }
+ 
+     strncpynt(out, (char *)buf, size);
+ 
+-    const result_t ret = (strlen((char *)buf) < size) ? SUCCESS : FAILURE;
++    ret = (strlen((char *)buf) < size) ? SUCCESS : FAILURE;
++
++exit:
+     OPENSSL_free(buf);
+     return ret;
+ }
+@@ -384,15 +388,34 @@ x509_get_subject(X509 *cert, struct gc_arena *gc)
+         goto err;
+     }
+ 
++    /* Get the subject with unescaped control characters so that we can check for null bytes. */
+     X509_NAME_print_ex(subject_bio, X509_get_subject_name(cert), 0,
+-                       XN_FLAG_SEP_CPLUS_SPC | XN_FLAG_FN_SN | ASN1_STRFLGS_UTF8_CONVERT
+-                           | ASN1_STRFLGS_ESC_CTRL);
++                       XN_FLAG_SEP_CPLUS_SPC | XN_FLAG_FN_SN | ASN1_STRFLGS_UTF8_CONVERT);
+ 
+     if (BIO_eof(subject_bio))
+     {
+         goto err;
+     }
+ 
++    BIO_get_mem_ptr(subject_bio, &subject_mem);
++    if (memchr(subject_mem->data, 0, subject_mem->length) != NULL)
++    {
++        msg(M_WARN, "ERROR: Certificate subject contains a '\\0' byte.");
++        goto err;
++    }
++
++    /* Now output the subject with escaped control characters. */
++    if (BIO_reset(subject_bio) != 1)
++    {
++        goto err;
++    }
++    X509_NAME_print_ex(subject_bio, X509_get_subject_name(cert), 0,
++                       XN_FLAG_SEP_CPLUS_SPC | XN_FLAG_FN_SN | ASN1_STRFLGS_UTF8_CONVERT
++                           | ASN1_STRFLGS_ESC_CTRL);
++    if (BIO_eof(subject_bio))
++    {
++        goto err;
++    }
+     BIO_get_mem_ptr(subject_bio, &subject_mem);
+ 
+     subject = gc_malloc(subject_mem->length + 1, false, gc);
+diff --git a/tests/unit_tests/openvpn/test_ssl.c b/tests/unit_tests/openvpn/test_ssl.c
+index 7e7679c5..adfc07a8 100644
+--- a/tests/unit_tests/openvpn/test_ssl.c
++++ b/tests/unit_tests/openvpn/test_ssl.c
+@@ -884,6 +884,94 @@ crypto_test_print_cert_details(void **state)
+     free_certificate(cert);
+ }
+ 
++/* Certificate with two CNs, "foo" and "bar".
++ *
++ * Generated with:
++ * openssl req -x509 -newkey ec -pkeyopt ec_paramgen_curve:secp384r1 -subj "/CN=foo/CN=bar" \
++ * -noenc -out two_cns.crt -keyout two_cns.key
++ */
++static const char *cert_with_two_cns =
++    "-----BEGIN CERTIFICATE-----\n"
++    "MIIByTCCAVCgAwIBAgIUZuvd8Wfnq5jeRc3ohoJ/Vza54wQwCgYIKoZIzj0EAwIw\n"
++    "HDEMMAoGA1UEAwwDZm9vMQwwCgYDVQQDDANiYXIwHhcNMjYwODI4MTU1NjAwWhcN\n"
++    "MjYwOTI3MTU1NjAwWjAcMQwwCgYDVQQDDANmb28xDDAKBgNVBAMMA2JhcjB2MBAG\n"
++    "ByqGSM49AgEGBSuBBAAiA2IABERAfb210NOACy+QVYAu3EXrcGhTJpZDfhpDnE/h\n"
++    "PvPMWGWzqecTYdseArxZc0T/5Xma36IKCjGGsgN9ypZ5oQugQlB/NrVRCJIuHSGA\n"
++    "hGBWFvnUsqdNo765lGwVdBwhY6NTMFEwHQYDVR0OBBYEFPwnD+wK9R81Syk0qyTI\n"
++    "dFT/BNoJMB8GA1UdIwQYMBaAFPwnD+wK9R81Syk0qyTIdFT/BNoJMA8GA1UdEwEB\n"
++    "/wQFMAMBAf8wCgYIKoZIzj0EAwIDZwAwZAIwGxazGb6RRQtXzOWCPLRKId4e+E88\n"
++    "cwoCK3UwzEr8+Ddf54w5cEZC54f5J6AKFUJjAjBpT/JqF41uK57H+8i/16oZkBcm\n"
++    "OyQnlH8W/UzZo3/weTEBTcNW0iuCpIrS6im8pSk=\n"
++    "-----END CERTIFICATE-----\n";
++
++void
++ssl_test_extract_last_matching_field(void **state)
++{
++    /* When there are multiple fields of the same type in the certificate's subject, OpenVPN
++     * should extract the value of the last matching field. This is essentially arbitrary and there
++     * is no correct choice here, but this test exists to make sure that the behavior is consistent
++     * between different backends.
++     */
++    openvpn_x509_cert_t *cert = get_certificate(cert_with_two_cns);
++
++    char username[TLS_USERNAME_LEN + 1] = { 0 };
++    assert_int_equal(backend_x509_get_username(username, sizeof(username), "CN", cert), SUCCESS);
++    assert_string_equal(username, "bar");
++    free_certificate(cert);
++}
++
++/* Certificate with a null-byte embedded in the CN.
++ *
++ * Generated with the following Python script:
++ *
++ * from cryptography import x509
++ * from cryptography.x509.oid import NameOID, ExtensionOID, ExtendedKeyUsageOID
++ * from cryptography.hazmat.primitives import hashes, serialization
++ * from cryptography.hazmat.primitives.asymmetric import ec
++ * import datetime
++ *
++ * private_key = ec.generate_private_key(ec.SECP384R1())
++ * now = datetime.datetime.now(datetime.timezone.utc)
++ * name = "with\x00null"
++ *
++ * cert = (x509.CertificateBuilder()
++ *             .subject_name(x509.Name([x509.NameAttribute(NameOID.COMMON_NAME, name)]))
++ *             .issuer_name(x509.Name([x509.NameAttribute(NameOID.COMMON_NAME, name)]))
++ *             .public_key(private_key.public_key())
++ *             .serial_number(x509.random_serial_number())
++ *             .not_valid_before(now)
++ *             .not_valid_after(now + datetime.timedelta(days=10 * 365))
++ *             .sign(private_key, hashes.SHA256()))
++ *
++ * print(str(cert.public_bytes(serialization.Encoding.PEM), encoding='utf-8'))
++ **/
++static const char *cert_with_null =
++    "-----BEGIN CERTIFICATE-----\n"
++    "MIIBZTCB66ADAgECAhRLWdNRl+C20KKBG4QC9HFPWlOtBzAKBggqhkjOPQQDAjAU\n"
++    "MRIwEAYDVQQDDAl3aXRoAG51bGwwHhcNMjYwODI4MTQzMDA4WhcNMzYwODI1MTQz\n"
++    "MDA4WjAUMRIwEAYDVQQDDAl3aXRoAG51bGwwdjAQBgcqhkjOPQIBBgUrgQQAIgNi\n"
++    "AAT7PE+vJCBiB4CVHBcvJVF9n5n/dGQIn4C8HeYE8M2iXYCIRW5wg6/mlPaeiJY/\n"
++    "Ywh3pa8zhto1+aczbJKTvLgRwXn6N5vNpME1c5iWMzY0WHe1dJyVtoRBvkNvy5+k\n"
++    "GuEwCgYIKoZIzj0EAwIDaQAwZgIxAP2ekdQ8muG8Nv2o3PsBp0CqiaSNByGiP75i\n"
++    "k099bUFvHp/3LSp8Wf4JK2iWzc5h6gIxAINBGg2xjlmMgpXxROKA9qQqaM3d92Mp\n"
++    "EzZyRyPM3PGR83ZPbIaYDq8lCVxVlbYr/Q==\n"
++    "-----END CERTIFICATE-----\n";
++
++void
++ssl_test_reject_null_in_cert_subject(void **state)
++{
++    openvpn_x509_cert_t *cert = get_certificate(cert_with_null);
++    struct gc_arena gc = gc_new();
++
++    /* Trying to get the subject as a whole should fail. */
++    assert_ptr_equal(x509_get_subject(cert, &gc), NULL);
++
++    /* Trying to extract the common name should fail. */
++    char username[TLS_USERNAME_LEN + 1] = { 0 };
++    assert_int_equal(backend_x509_get_username(username, sizeof(username), "CN", cert), FAILURE);
++    gc_free(&gc);
++    free_certificate(cert);
++}
+ 
+ int
+ main(void)
+@@ -908,7 +996,9 @@ main(void)
+         cmocka_unit_test(test_data_channel_roundtrip_bf_cbc),
+         cmocka_unit_test(test_data_channel_known_vectors_epoch),
+         cmocka_unit_test(test_data_channel_known_vectors_shortpktid),
+-        cmocka_unit_test(crypto_test_print_cert_details)
++        cmocka_unit_test(crypto_test_print_cert_details),
++        cmocka_unit_test(ssl_test_extract_last_matching_field),
++        cmocka_unit_test(ssl_test_reject_null_in_cert_subject)
+ 
+     };
+ 
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
index 6338a0c816..f4aa8fce9c 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/OpenVPN/openvpn/releases/download/v${PV}/${BP}.tar
            file://openvpn \
            file://run-ptest \
            file://CVE-2026-88964.patch \
+           file://CVE-2026-84790.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"

