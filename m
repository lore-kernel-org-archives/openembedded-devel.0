Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D73C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 12:52:25 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.49464.1720011141035630111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 05:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NkzYBhFd;
 spf=pass (domain: mvista.com, ip: 209.85.219.179, mailfrom: vanusuri@mvista.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e0360f890a1so506182276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 05:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720011139; x=1720615939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L785XKr9INcmZTF50hpwx3qHdnIRG1Z/8+cVMU1bN3Y=;
        b=NkzYBhFdl54+pLJl43XzHOJ/7v/r8Y70rghpe/hg/kuYlojyX92o5EHz4KZs6dWzKy
         m2eS0QaTPS9mOpWwIn/M0PRsAwJE9/nhzwQqpah3m8p7iTJqOcP+2h+4qHpKQSovO93U
         w01sh7uuG3NDV9zGktpsj9f51w/8EKaIDg1BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011139; x=1720615939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L785XKr9INcmZTF50hpwx3qHdnIRG1Z/8+cVMU1bN3Y=;
        b=BalmVcTwPcxJZ0pkRJwd8drB9K/0Yq9AXWz/2L/KCRkF3LAdQsq/a00PiTGYWErkB4
         LDISEVOqMtwOUzrABj8iSbDBU/CqODlRz9QWB5Q6j5ykMafxU04/ppDJivQM+fcvI4MO
         NjJYnayGJwdt9vWa5ap3kt3LzCf7NCZpqvGs4hshxU0yVpDFjBxSO3RIhTXeXPls2FJa
         rCXCIhx+ADWxAwU1I15dS4Lo2MksaGjSpINgQ3er8/tKZL4QtbAe8Ik+IT9QFjKSICFU
         xkr+lU+We2D3RuUknXwSOEVZOQcMmKtNmZDrmCfUNySTQ7ekyzhqgY/0oVhfm4ia61iW
         49NA==
X-Gm-Message-State: AOJu0YxqHkrwG/e69DKS0lkVafSSvu0hvurOw+cKkcGE8vrAZx916rhD
	fAPsQIAaDa9V93Wc4FyP06XKkZT8YJ9Mrmh+59T06f5+4J27q9zaYq4RYmqhZiwrRJR+N21zOrz
	iPcE=
X-Google-Smtp-Source: AGHT+IESTDg3MtCuo58wNN1LnJPaRCALc673HkIuPwjfo7dbEsLpcYq5hGVMZTkT9fnXG62OrXXKxA==
X-Received: by 2002:a05:690c:4c8c:b0:630:4fab:a090 with SMTP id 00721157ae682-65181fc8d4cmr8264367b3.22.1720011138730;
        Wed, 03 Jul 2024 05:52:18 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882f:8929:4c8d:df45:ab4:b25c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9a8037d1sm21005317b3.66.2024.07.03.05.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:52:18 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] krb5: Fix for CVE-2024-37370 and CVE-2024-37371
Date: Wed,  3 Jul 2024 18:22:07 +0530
Message-Id: <20240703125207.116056-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 12:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111225

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/krb5/krb5/commit/548da160b52b25a106e9f6077d6a42c2c049586c
&
https://github.com/krb5/krb5/commit/55fbf435edbe2e92dd8101669b1ce7144bc96fef]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../krb5/krb5/CVE-2024-37370_37371-pre1.patch | 168 ++++++
 .../krb5/krb5/CVE-2024-37370_37371.patch      | 538 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |   2 +
 3 files changed, 708 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371-pre1.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371-pre1.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371-pre1.patch
new file mode 100644
index 000000000..36536461a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371-pre1.patch
@@ -0,0 +1,168 @@
+From 548da160b52b25a106e9f6077d6a42c2c049586c Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Tue, 7 Mar 2023 00:19:33 -0500
+Subject: [PATCH] Add a simple DER support header
+
+Upstream-Status: Backport from [https://github.com/krb5/krb5/commit/548da160b52b25a106e9f6077d6a42c2c049586c]
+Comment: to backport fix for CVE-2024-37370 CVE-2024-37371, Add a simple DER support header
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/include/k5-der.h | 149 +++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 149 insertions(+)
+ create mode 100644 src/include/k5-der.h
+
+diff --git a/src/include/k5-der.h b/src/include/k5-der.h
+new file mode 100644
+index 0000000000..b8371d9b4d
+--- /dev/null
++++ b/src/include/k5-der.h
+@@ -0,0 +1,149 @@
++/* -*- mode: c; c-basic-offset: 4; indent-tabs-mode: nil -*- */
++/* include/k5-der.h - Distinguished Encoding Rules (DER) declarations */
++/*
++ * Copyright (C) 2023 by the Massachusetts Institute of Technology.
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ *
++ * * Redistributions of source code must retain the above copyright
++ *   notice, this list of conditions and the following disclaimer.
++ *
++ * * Redistributions in binary form must reproduce the above copyright
++ *   notice, this list of conditions and the following disclaimer in
++ *   the documentation and/or other materials provided with the
++ *   distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
++ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
++ * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
++ * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
++ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
++ * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
++ * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
++ * OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++/*
++ * Most ASN.1 encoding and decoding is done using the table-driven framework in
++ * libkrb5.  When that is not an option, these helpers can be used to encode
++ * and decode simple types.
++ */
++
++#ifndef K5_DER_H
++#define K5_DER_H
++
++#include <stdint.h>
++#include <stdbool.h>
++#include "k5-buf.h"
++#include "k5-input.h"
++
++/* Return the number of bytes needed to encode len as a DER encoding length. */
++static inline size_t
++k5_der_len_len(size_t len)
++{
++    size_t llen;
++
++    if (len < 128)
++        return 1;
++    llen = 1;
++    while (len > 0) {
++        len >>= 8;
++        llen++;
++    }
++    return llen;
++}
++
++/* Return the number of bytes needed to encode a DER value (with identifier
++ * byte and length) for a given contents length. */
++static inline size_t
++k5_der_value_len(size_t contents_len)
++{
++    return 1 + k5_der_len_len(contents_len) + contents_len;
++}
++
++/* Add a DER identifier byte (composed by the caller, including the ASN.1
++ * class, tag, and constructed bit) and length. */
++static inline void
++k5_der_add_taglen(struct k5buf *buf, uint8_t idbyte, size_t len)
++{
++    uint8_t *p;
++    size_t llen = k5_der_len_len(len);
++
++    p = k5_buf_get_space(buf, 1 + llen);
++    if (p == NULL)
++        return;
++    *p++ = idbyte;
++    if (len < 128) {
++        *p = len;
++    } else {
++        *p = 0x80 | (llen - 1);
++        /* Encode the length bytes backwards so the most significant byte is
++         * first. */
++        p += llen;
++        while (len > 0) {
++            *--p = len & 0xFF;
++            len >>= 8;
++        }
++    }
++}
++
++/* Add a DER value (identifier byte, length, and contents). */
++static inline void
++k5_der_add_value(struct k5buf *buf, uint8_t idbyte, const void *contents,
++                 size_t len)
++{
++    k5_der_add_taglen(buf, idbyte, len);
++    k5_buf_add_len(buf, contents, len);
++}
++
++/*
++ * If the next byte in in matches idbyte and the subsequent DER length is
++ * valid, advance in past the value, set *contents_out to the value contents,
++ * and return true.  Otherwise return false.  Only set an error on in if the
++ * next bytes matches idbyte but the ensuing length is invalid.  contents_out
++ * may be aliased to in; it will only be written to on successful decoding of a
++ * value.
++ */
++static inline bool
++k5_der_get_value(struct k5input *in, uint8_t idbyte,
++                 struct k5input *contents_out)
++{
++    uint8_t lenbyte, i;
++    size_t len;
++    const void *bytes;
++
++    /* Do nothing if in is empty or the next byte doesn't match idbyte. */
++    if (in->status || in->len == 0 || *in->ptr != idbyte)
++        return false;
++
++    /* Advance past the identifier byte and decode the length. */
++    (void)k5_input_get_byte(in);
++    lenbyte = k5_input_get_byte(in);
++    if (lenbyte < 128) {
++        len = lenbyte;
++    } else {
++        len = 0;
++        for (i = 0; i < (lenbyte & 0x7F); i++) {
++            if (len > (SIZE_MAX >> 8)) {
++                k5_input_set_status(in, EOVERFLOW);
++                return false;
++            }
++            len = (len << 8) | k5_input_get_byte(in);
++        }
++    }
++
++    bytes = k5_input_get_bytes(in, len);
++    if (bytes == NULL)
++        return false;
++    k5_input_init(contents_out, bytes, len);
++    return true;
++}
++
++#endif /* K5_DER_H */
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371.patch
new file mode 100644
index 000000000..31db93c42
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-37370_37371.patch
@@ -0,0 +1,538 @@
+From 55fbf435edbe2e92dd8101669b1ce7144bc96fef Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Fri, 14 Jun 2024 10:56:12 -0400
+Subject: [PATCH] Fix vulnerabilities in GSS message token handling
+
+In gss_krb5int_unseal_token_v3() and gss_krb5int_unseal_v3_iov(),
+verify the Extra Count field of CFX wrap tokens against the encrypted
+header.  Reported by Jacob Champion.
+
+In gss_krb5int_unseal_token_v3(), check for a decrypted plaintext
+length too short to contain the encrypted header and extra count
+bytes.  Reported by Jacob Champion.
+
+In kg_unseal_iov_token(), separately track the header IOV length and
+complete token length when parsing the token's ASN.1 wrapper.  This
+fix contains modified versions of functions from k5-der.h and
+util_token.c; this duplication will be cleaned up in a future commit.
+
+CVE-2024-37370:
+
+In MIT krb5 release 1.3 and later, an attacker can modify the
+plaintext Extra Count field of a confidential GSS krb5 wrap token,
+causing the unwrapped token to appear truncated to the application.
+
+CVE-2024-37371:
+
+In MIT krb5 release 1.3 and later, an attacker can cause invalid
+memory reads by sending message tokens with invalid length fields.
+
+(cherry picked from commit b0a2f8a5365f2eec3e27d78907de9f9d2c80505a)
+
+ticket: 9128
+version_fixed: 1.21.3
+
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/55fbf435edbe2e92dd8101669b1ce7144bc96fef]
+CVE: CVE-2024-37370 CVE-2024-37371
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/lib/gssapi/krb5/k5sealv3.c    |   5 +
+ src/lib/gssapi/krb5/k5sealv3iov.c |   3 +-
+ src/lib/gssapi/krb5/k5unsealiov.c |  80 +++++++++-
+ src/tests/gssapi/t_invalid.c      | 233 +++++++++++++++++++++++++-----
+ 4 files changed, 275 insertions(+), 46 deletions(-)
+
+diff --git a/src/lib/gssapi/krb5/k5sealv3.c b/src/lib/gssapi/krb5/k5sealv3.c
+index 25d9f27..48fc508 100644
+--- a/src/lib/gssapi/krb5/k5sealv3.c
++++ b/src/lib/gssapi/krb5/k5sealv3.c
+@@ -409,10 +409,15 @@ gss_krb5int_unseal_token_v3(krb5_context *contextptr,
+             /* Don't use bodysize here!  Use the fact that
+                cipher.ciphertext.length has been adjusted to the
+                correct length.  */
++            if (plain.length < 16 + ec) {
++                free(plain.data);
++                goto defective;
++            }
+             althdr = (unsigned char *)plain.data + plain.length - 16;
+             if (load_16_be(althdr) != KG2_TOK_WRAP_MSG
+                 || althdr[2] != ptr[2]
+                 || althdr[3] != ptr[3]
++                || load_16_be(althdr+4) != ec
+                 || memcmp(althdr+8, ptr+8, 8)) {
+                 free(plain.data);
+                 goto defective;
+diff --git a/src/lib/gssapi/krb5/k5sealv3iov.c b/src/lib/gssapi/krb5/k5sealv3iov.c
+index a73edb6..b0b0c0f 100644
+--- a/src/lib/gssapi/krb5/k5sealv3iov.c
++++ b/src/lib/gssapi/krb5/k5sealv3iov.c
+@@ -403,9 +403,10 @@ gss_krb5int_unseal_v3_iov(krb5_context context,
+             if (load_16_be(althdr) != KG2_TOK_WRAP_MSG
+                 || althdr[2] != ptr[2]
+                 || althdr[3] != ptr[3]
++                || load_16_be(althdr + 4) != ec
+                 || memcmp(althdr + 8, ptr + 8, 8) != 0) {
+                 *minor_status = 0;
+-                return GSS_S_BAD_SIG;
++                return GSS_S_DEFECTIVE_TOKEN;
+             }
+         } else {
+             /* Verify checksum: note EC is checksum size here, not padding */
+diff --git a/src/lib/gssapi/krb5/k5unsealiov.c b/src/lib/gssapi/krb5/k5unsealiov.c
+index f15d2db..5cbb896 100644
+--- a/src/lib/gssapi/krb5/k5unsealiov.c
++++ b/src/lib/gssapi/krb5/k5unsealiov.c
+@@ -25,6 +25,7 @@
+  */
+ 
+ #include "k5-int.h"
++#include "k5-der.h"
+ #include "gssapiP_krb5.h"
+ 
+ static OM_uint32
+@@ -295,6 +296,73 @@ cleanup:
+     return retval;
+ }
+ 
++/* Similar to k5_der_get_value(), but output an unchecked content length
++ * instead of a k5input containing the contents. */
++static inline bool
++get_der_tag(struct k5input *in, uint8_t idbyte, size_t *len_out)
++{
++    uint8_t lenbyte, i;
++    size_t len;
++
++    /* Do nothing if in is empty or the next byte doesn't match idbyte. */
++    if (in->status || in->len == 0 || *in->ptr != idbyte)
++        return false;
++
++    /* Advance past the identifier byte and decode the length. */
++    (void)k5_input_get_byte(in);
++    lenbyte = k5_input_get_byte(in);
++    if (lenbyte < 128) {
++        len = lenbyte;
++    } else {
++        len = 0;
++        for (i = 0; i < (lenbyte & 0x7F); i++) {
++            if (len > (SIZE_MAX >> 8)) {
++                k5_input_set_status(in, EOVERFLOW);
++                return false;
++            }
++            len = (len << 8) | k5_input_get_byte(in);
++        }
++    }
++
++    if (in->status)
++        return false;
++
++    *len_out = len;
++    return true;
++}
++
++/*
++ * Similar to g_verify_token_header() without toktype or flags, but do not read
++ * more than *header_len bytes of ASN.1 wrapper, and on output set *header_len
++ * to the remaining number of header bytes.  Verify the outer DER tag's length
++ * against token_len, which may be larger (but not smaller) than *header_len.
++ */
++static gss_int32
++verify_detached_wrapper(const gss_OID_desc *mech, size_t *header_len,
++                        uint8_t **header_in, size_t token_len)
++{
++    struct k5input in, mech_der;
++    gss_OID_desc toid;
++    size_t len;
++
++    k5_input_init(&in, *header_in, *header_len);
++
++    if (get_der_tag(&in, 0x60, &len)) {
++        if (len != token_len - (in.ptr - *header_in))
++            return G_BAD_TOK_HEADER;
++        if (!k5_der_get_value(&in, 0x06, &mech_der))
++            return G_BAD_TOK_HEADER;
++        toid.elements = (uint8_t *)mech_der.ptr;
++        toid.length = mech_der.len;
++        if (!g_OID_equal(&toid, mech))
++            return G_WRONG_MECH;
++    }
++
++    *header_in = (uint8_t *)in.ptr;
++    *header_len = in.len;
++    return 0;
++}
++
+ /*
+  * Caller must provide TOKEN | DATA | PADDING | TRAILER, except
+  * for DCE in which case it can just provide TOKEN | DATA (must
+@@ -315,8 +383,7 @@ kg_unseal_iov_token(OM_uint32 *minor_status,
+     gss_iov_buffer_t header;
+     gss_iov_buffer_t padding;
+     gss_iov_buffer_t trailer;
+-    size_t input_length;
+-    unsigned int bodysize;
++    size_t input_length, hlen;
+     int toktype2;
+ 
+     header = kg_locate_header_iov(iov, iov_count, toktype);
+@@ -346,15 +413,14 @@ kg_unseal_iov_token(OM_uint32 *minor_status,
+             input_length += trailer->buffer.length;
+     }
+ 
+-    code = g_verify_token_header(ctx->mech_used,
+-                                 &bodysize, &ptr, -1,
+-                                 input_length, 0);
++    hlen = header->buffer.length;
++    code = verify_detached_wrapper(ctx->mech_used, &hlen, &ptr, input_length);
+     if (code != 0) {
+         *minor_status = code;
+         return GSS_S_DEFECTIVE_TOKEN;
+     }
+ 
+-    if (bodysize < 2) {
++    if (hlen < 2) {
+         *minor_status = (OM_uint32)G_BAD_TOK_HEADER;
+         return GSS_S_DEFECTIVE_TOKEN;
+     }
+@@ -362,7 +428,7 @@ kg_unseal_iov_token(OM_uint32 *minor_status,
+     toktype2 = load_16_be(ptr);
+ 
+     ptr += 2;
+-    bodysize -= 2;
++    hlen -= 2;
+ 
+     switch (toktype2) {
+     case KG2_TOK_MIC_MSG:
+diff --git a/src/tests/gssapi/t_invalid.c b/src/tests/gssapi/t_invalid.c
+index 2a332a8..e70ace6 100644
+--- a/src/tests/gssapi/t_invalid.c
++++ b/src/tests/gssapi/t_invalid.c
+@@ -36,31 +36,41 @@
+  *
+  * 1. A pre-CFX wrap or MIC token processed with a CFX-only context causes a
+  *    null pointer dereference.  (The token must use SEAL_ALG_NONE or it will
+- *    be rejected.)
++ *    be rejected.)  This vulnerability also applies to IOV unwrap.
+  *
+- * 2. A pre-CFX wrap or MIC token with fewer than 24 bytes after the ASN.1
++ * 2. A CFX wrap token with a different value of EC between the plaintext and
++ *    encrypted copies will be erroneously accepted, which allows a message
++ *    truncation attack.  This vulnerability also applies to IOV unwrap.
++ *
++ * 3. A CFX wrap token with a plaintext length fewer than 16 bytes causes an
++ *    access before the beginning of the input buffer, possibly leading to a
++ *    crash.
++ *
++ * 4. A CFX wrap token with a plaintext EC value greater than the plaintext
++ *    length - 16 causes an integer underflow when computing the result length,
++ *    likely causing a crash.
++ *
++ * 5. An IOV unwrap operation will overrun the header buffer if an ASN.1
++ *    wrapper longer than the header buffer is present.
++ *
++ * 6. A pre-CFX wrap or MIC token with fewer than 24 bytes after the ASN.1
+  *    header causes an input buffer overrun, usually leading to either a segv
+  *    or a GSS_S_DEFECTIVE_TOKEN error due to garbage algorithm, filler, or
+- *    sequence number values.
++ *    sequence number values.  This vulnerability also applies to IOV unwrap.
+  *
+- * 3. A pre-CFX wrap token with fewer than 16 + cksumlen bytes after the ASN.1
++ * 7. A pre-CFX wrap token with fewer than 16 + cksumlen bytes after the ASN.1
+  *    header causes an integer underflow when computing the ciphertext length,
+  *    leading to an allocation error on 32-bit platforms or a segv on 64-bit
+  *    platforms.  A pre-CFX MIC token of this size causes an input buffer
+  *    overrun when comparing the checksum, perhaps leading to a segv.
+  *
+- * 4. A pre-CFX wrap token with fewer than conflen + padlen bytes in the
++ * 8. A pre-CFX wrap token with fewer than conflen + padlen bytes in the
+  *    ciphertext (where padlen is the last byte of the decrypted ciphertext)
+  *    causes an integer underflow when computing the original message length,
+  *    leading to an allocation error.
+  *
+- * 5. In the mechglue, truncated encapsulation in the initial context token can
++ * 9. In the mechglue, truncated encapsulation in the initial context token can
+  *    cause input buffer overruns in gss_accept_sec_context().
+- *
+- * Vulnerabilities #1 and #2 also apply to IOV unwrap, although tokens with
+- * fewer than 16 bytes after the ASN.1 header will be rejected.
+- * Vulnerabilities #2 and #5 can only be robustly detected using a
+- * memory-checking environment such as valgrind.
+  */
+ 
+ #include "k5-int.h"
+@@ -120,17 +130,25 @@ struct test {
+     }
+ };
+ 
+-/* Fake up enough of a CFX GSS context for gss_unwrap, using an AES key. */
++static void *
++ealloc(size_t len)
++{
++    void *ptr = calloc(len, 1);
++
++    if (ptr == NULL)
++        abort();
++    return ptr;
++}
++
++/* Fake up enough of a CFX GSS context for gss_unwrap, using an AES key.
++ * The context takes ownership of subkey. */
+ static gss_ctx_id_t
+-make_fake_cfx_context()
++make_fake_cfx_context(krb5_key subkey)
+ {
+     gss_union_ctx_id_t uctx;
+     krb5_gss_ctx_id_t kgctx;
+-    krb5_keyblock kb;
+ 
+-    kgctx = calloc(1, sizeof(*kgctx));
+-    if (kgctx == NULL)
+-        abort();
++    kgctx = ealloc(sizeof(*kgctx));
+     kgctx->established = 1;
+     kgctx->proto = 1;
+     if (g_seqstate_init(&kgctx->seqstate, 0, 0, 0, 0) != 0)
+@@ -139,15 +157,10 @@ make_fake_cfx_context()
+     kgctx->sealalg = -1;
+     kgctx->signalg = -1;
+ 
+-    kb.enctype = ENCTYPE_AES128_CTS_HMAC_SHA1_96;
+-    kb.length = 16;
+-    kb.contents = (unsigned char *)"1234567887654321";
+-    if (krb5_k_create_key(NULL, &kb, &kgctx->subkey) != 0)
+-        abort();
++    kgctx->subkey = subkey;
++    kgctx->cksumtype = CKSUMTYPE_HMAC_SHA1_96_AES128;
+ 
+-    uctx = calloc(1, sizeof(*uctx));
+-    if (uctx == NULL)
+-        abort();
++    uctx = ealloc(sizeof(*uctx));
+     uctx->mech_type = &mech_krb5;
+     uctx->internal_ctx_id = (gss_ctx_id_t)kgctx;
+     return (gss_ctx_id_t)uctx;
+@@ -163,9 +176,7 @@ make_fake_context(const struct test *test)
+     unsigned char encbuf[8];
+     size_t i;
+ 
+-    kgctx = calloc(1, sizeof(*kgctx));
+-    if (kgctx == NULL)
+-        abort();
++    kgctx = ealloc(sizeof(*kgctx));
+     kgctx->established = 1;
+     if (g_seqstate_init(&kgctx->seqstate, 0, 0, 0, 0) != 0)
+         abort();
+@@ -192,9 +203,7 @@ make_fake_context(const struct test *test)
+     if (krb5_k_create_key(NULL, &kb, &kgctx->enc) != 0)
+         abort();
+ 
+-    uctx = calloc(1, sizeof(*uctx));
+-    if (uctx == NULL)
+-        abort();
++    uctx = ealloc(sizeof(*uctx));
+     uctx->mech_type = &mech_krb5;
+     uctx->internal_ctx_id = (gss_ctx_id_t)kgctx;
+     return (gss_ctx_id_t)uctx;
+@@ -224,9 +233,7 @@ make_token(unsigned char *token, size_t len, gss_buffer_t out)
+ 
+     assert(mech_krb5.length == 9);
+     assert(len + 11 < 128);
+-    wrapped = malloc(len + 13);
+-    if (wrapped == NULL)
+-        abort();
++    wrapped = ealloc(len + 13);
+     wrapped[0] = 0x60;
+     wrapped[1] = len + 11;
+     wrapped[2] = 0x06;
+@@ -237,6 +244,18 @@ make_token(unsigned char *token, size_t len, gss_buffer_t out)
+     out->value = wrapped;
+ }
+ 
++/* Create a 16-byte header for a CFX confidential wrap token to be processed by
++ * the fake CFX context. */
++static void
++write_cfx_header(uint16_t ec, uint8_t *out)
++{
++    memset(out, 0, 16);
++    store_16_be(KG2_TOK_WRAP_MSG, out);
++    out[2] = FLAG_WRAP_CONFIDENTIAL;
++    out[3] = 0xFF;
++    store_16_be(ec, out + 4);
++}
++
+ /* Unwrap a superficially valid RFC 1964 token with a CFX-only context, with
+  * regular and IOV unwrap. */
+ static void
+@@ -268,6 +287,134 @@ test_bogus_1964_token(gss_ctx_id_t ctx)
+     free(in.value);
+ }
+ 
++static void
++test_cfx_altered_ec(gss_ctx_id_t ctx, krb5_key subkey)
++{
++    OM_uint32 major, minor;
++    uint8_t tokbuf[128], plainbuf[24];
++    krb5_data plain;
++    krb5_enc_data cipher;
++    gss_buffer_desc in, out;
++    gss_iov_buffer_desc iov[2];
++
++    /* Construct a header with a plaintext EC value of 3. */
++    write_cfx_header(3, tokbuf);
++
++    /* Encrypt a plaintext and a copy of the header with the EC value 0. */
++    memcpy(plainbuf, "truncate", 8);
++    memcpy(plainbuf + 8, tokbuf, 16);
++    store_16_be(0, plainbuf + 12);
++    plain = make_data(plainbuf, 24);
++    cipher.ciphertext.data = (char *)tokbuf + 16;
++    cipher.ciphertext.length = sizeof(tokbuf) - 16;
++    cipher.enctype = subkey->keyblock.enctype;
++    if (krb5_k_encrypt(NULL, subkey, KG_USAGE_INITIATOR_SEAL, NULL,
++                       &plain, &cipher) != 0)
++        abort();
++
++    /* Verify that the token is rejected by gss_unwrap(). */
++    in.value = tokbuf;
++    in.length = 16 + cipher.ciphertext.length;
++    major = gss_unwrap(&minor, ctx, &in, &out, NULL, NULL);
++    if (major != GSS_S_DEFECTIVE_TOKEN)
++        abort();
++    (void)gss_release_buffer(&minor, &out);
++
++    /* Verify that the token is rejected by gss_unwrap_iov(). */
++    iov[0].type = GSS_IOV_BUFFER_TYPE_STREAM;
++    iov[0].buffer = in;
++    iov[1].type = GSS_IOV_BUFFER_TYPE_DATA;
++    major = gss_unwrap_iov(&minor, ctx, NULL, NULL, iov, 2);
++    if (major != GSS_S_DEFECTIVE_TOKEN)
++        abort();
++}
++
++static void
++test_cfx_short_plaintext(gss_ctx_id_t ctx, krb5_key subkey)
++{
++    OM_uint32 major, minor;
++    uint8_t tokbuf[128], zerobyte = 0;
++    krb5_data plain;
++    krb5_enc_data cipher;
++    gss_buffer_desc in, out;
++
++    write_cfx_header(0, tokbuf);
++
++    /* Encrypt a single byte, with no copy of the header. */
++    plain = make_data(&zerobyte, 1);
++    cipher.ciphertext.data = (char *)tokbuf + 16;
++    cipher.ciphertext.length = sizeof(tokbuf) - 16;
++    cipher.enctype = subkey->keyblock.enctype;
++    if (krb5_k_encrypt(NULL, subkey, KG_USAGE_INITIATOR_SEAL, NULL,
++                       &plain, &cipher) != 0)
++        abort();
++
++    /* Verify that the token is rejected by gss_unwrap(). */
++    in.value = tokbuf;
++    in.length = 16 + cipher.ciphertext.length;
++    major = gss_unwrap(&minor, ctx, &in, &out, NULL, NULL);
++    if (major != GSS_S_DEFECTIVE_TOKEN)
++        abort();
++    (void)gss_release_buffer(&minor, &out);
++}
++
++static void
++test_cfx_large_ec(gss_ctx_id_t ctx, krb5_key subkey)
++{
++    OM_uint32 major, minor;
++    uint8_t tokbuf[128] = { 0 }, plainbuf[20];
++    krb5_data plain;
++    krb5_enc_data cipher;
++    gss_buffer_desc in, out;
++
++    /* Construct a header with an EC value of 5. */
++    write_cfx_header(5, tokbuf);
++
++    /* Encrypt a 4-byte plaintext plus the header. */
++    memcpy(plainbuf, "abcd", 4);
++    memcpy(plainbuf + 4, tokbuf, 16);
++    plain = make_data(plainbuf, 20);
++    cipher.ciphertext.data = (char *)tokbuf + 16;
++    cipher.ciphertext.length = sizeof(tokbuf) - 16;
++    cipher.enctype = subkey->keyblock.enctype;
++    if (krb5_k_encrypt(NULL, subkey, KG_USAGE_INITIATOR_SEAL, NULL,
++                       &plain, &cipher) != 0)
++        abort();
++
++    /* Verify that the token is rejected by gss_unwrap(). */
++    in.value = tokbuf;
++    in.length = 16 + cipher.ciphertext.length;
++    major = gss_unwrap(&minor, ctx, &in, &out, NULL, NULL);
++    if (major != GSS_S_DEFECTIVE_TOKEN)
++        abort();
++    (void)gss_release_buffer(&minor, &out);
++}
++
++static void
++test_iov_large_asn1_wrapper(gss_ctx_id_t ctx)
++{
++    OM_uint32 minor, major;
++    uint8_t databuf[10] = { 0 };
++    gss_iov_buffer_desc iov[2];
++
++    /*
++     * In this IOV array, the header contains a DER tag with a dangling eight
++     * bytes of length field.  The data IOV indicates a total token length
++     * sufficient to contain the length bytes.
++     */
++    iov[0].type = GSS_IOV_BUFFER_TYPE_HEADER;
++    iov[0].buffer.value = ealloc(2);
++    iov[0].buffer.length = 2;
++    memcpy(iov[0].buffer.value, "\x60\x88", 2);
++    iov[1].type = GSS_IOV_BUFFER_TYPE_DATA;
++    iov[1].buffer.value = databuf;
++    iov[1].buffer.length = 10;
++    major = gss_unwrap_iov(&minor, ctx, NULL, NULL, iov, 2);
++    if (major != GSS_S_DEFECTIVE_TOKEN)
++        abort();
++    free(iov[0].buffer.value);
++}
++
+ /* Process wrap and MIC tokens with incomplete headers. */
+ static void
+ test_short_header(gss_ctx_id_t ctx)
+@@ -417,9 +564,7 @@ try_accept(void *value, size_t len)
+     gss_ctx_id_t ctx = GSS_C_NO_CONTEXT;
+ 
+     /* Copy the provided value to make input overruns more obvious. */
+-    in.value = malloc(len);
+-    if (in.value == NULL)
+-        abort();
++    in.value = ealloc(len);
+     memcpy(in.value, value, len);
+     in.length = len;
+     (void)gss_accept_sec_context(&minor, &ctx, GSS_C_NO_CREDENTIAL, &in,
+@@ -454,11 +599,23 @@ test_short_encapsulation()
+ int
+ main(int argc, char **argv)
+ {
++    krb5_keyblock kb;
++    krb5_key cfx_subkey;
+     gss_ctx_id_t ctx;
+     size_t i;
+ 
+-    ctx = make_fake_cfx_context();
++    kb.enctype = ENCTYPE_AES128_CTS_HMAC_SHA1_96;
++    kb.length = 16;
++    kb.contents = (unsigned char *)"1234567887654321";
++    if (krb5_k_create_key(NULL, &kb, &cfx_subkey) != 0)
++        abort();
++
++    ctx = make_fake_cfx_context(cfx_subkey);
+     test_bogus_1964_token(ctx);
++    test_cfx_altered_ec(ctx, cfx_subkey);
++    test_cfx_short_plaintext(ctx, cfx_subkey);
++    test_cfx_large_ec(ctx, cfx_subkey);
++    test_iov_large_asn1_wrapper(ctx);
+     free_fake_context(ctx);
+ 
+     for (i = 0; i < sizeof(tests) / sizeof(*tests); i++) {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index a92066171..ef256179f 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -34,6 +34,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://CVE-2021-37750.patch;striplevel=2 \
            file://CVE-2022-42898.patch;striplevel=2 \
            file://CVE-2023-36054.patch;striplevel=2 \
+           file://CVE-2024-37370_37371-pre1.patch;striplevel=2 \
+           file://CVE-2024-37370_37371.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
 SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
-- 
2.25.1


