Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8992BC52D7D
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 05:16:48 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.91044.1723612599690045667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 22:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WyjzExDk;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d399da0b5so5120407b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 22:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1723612599; x=1724217399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/2i8YHv6o7n3GOB6L+SWNQymXK8bdSmuwTq99PRY9k=;
        b=WyjzExDk9Xrv6dK3Z12EOekHao1hm2q2MVp7DRZpwYPq19FjceEyseUFnTOrR+U+ek
         tb2/eebhu+MapkEqOLIE1qVKfgJbUxZ3YIbxm9lzRa6SBC4lbWnd6fMuJkpVbAf+7Ava
         BJ0kpKX5H/VQ/++18euSRzNmpFuenwW7g5V44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723612599; x=1724217399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/2i8YHv6o7n3GOB6L+SWNQymXK8bdSmuwTq99PRY9k=;
        b=OD2Z3f6ZG4f/EKDRuLBH2LNW+Ygw5UjlORdCi1QnxXgNbgLWuqP/TZfhByxbH8gmhI
         SUIZCTzjWC+cj0V7TP/EjyEDm/K8/3oLoyMccHb7AAJ3Lr8JonWBDQYyQsAXr+WgwfCc
         KsVfNDEbRXJmNblNhSi5G5xfH4ggfgaZ6XaXMEVnWHhfOaqI4495sIkPO1BY/D1gOO0H
         LhfcshLK5EMoGH3/GsbRG5I+nbu8k4gYv8f/GvBH3deih4YwhX2vyS9Lcfe+3TUJU5b3
         1IkHrpKUY7hOrb687PKEwwgwJ61+rErOqcYN/d21wOi1tyS96wMmaxrLCZn1pH9HNX9i
         FksA==
X-Gm-Message-State: AOJu0YySYtPqoCV/qtBGnO9uPnO7Grn4HQG5SpcNblZnKgpdjfnLQfHr
	Nj0Sd1kWyeocwsJGjh4lmUB2ES8Fl07sXZ76pqSoKzJ/6Tw58CpGazvdzmBujbeDQBQLlGQn4hR
	V
X-Google-Smtp-Source: AGHT+IEhOTGe3nhaifJovlbOzPPaVPyAEitdHtCgDPuKiPkvjMXr3Ab9Spsbb+ZOwYwp09yXG3YaQg==
X-Received: by 2002:a05:6a00:181d:b0:70e:9383:e166 with SMTP id d2e1a72fcca58-712673eda81mr2297174b3a.29.1723612598809;
        Tue, 13 Aug 2024 22:16:38 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a7e30bsm6781962b3a.145.2024.08.13.22.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:16:38 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] krb5: fix CVE-2024-26458 and CVE-2024-26461
Date: Wed, 14 Aug 2024 10:46:20 +0530
Message-Id: <20240814051620.5726-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 05:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111797

Upstream-Status: Backport from https://github.com/krb5/krb5/commit/c5f9c816107f70139de11b38aa02db2f1774ee0d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../krb5/CVE-2024-26458_CVE-2024-26461.patch  | 207 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |   1 +
 2 files changed, 208 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch
new file mode 100644
index 0000000000..10e6a92f46
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch
@@ -0,0 +1,207 @@
+From c5f9c816107f70139de11b38aa02db2f1774ee0d Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Tue, 5 Mar 2024 19:53:07 -0500
+Subject: [PATCH] Fix two unlikely memory leaks
+
+In gss_krb5int_make_seal_token_v3(), one of the bounds checks (which
+could probably never be triggered) leaks plain.data.  Fix this leak
+and use current practices for cleanup throughout the function.
+
+In xmt_rmtcallres() (unused within the tree and likely elsewhere),
+store port_ptr into crp->port_ptr as soon as it is allocated;
+otherwise it could leak if the subsequent xdr_u_int32() operation
+fails.
+
+Upstream-Status: Backport [https://github.com/krb5/krb5/commit/c5f9c816107f70139de11b38aa02db2f1774ee0d]
+CVE: CVE-2024-26458 CVE-2024-26461
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/lib/gssapi/krb5/k5sealv3.c | 56 +++++++++++++++-------------------
+ src/lib/rpc/pmap_rmt.c         |  9 +++---
+ 2 files changed, 29 insertions(+), 36 deletions(-)
+
+diff --git a/src/lib/gssapi/krb5/k5sealv3.c b/src/lib/gssapi/krb5/k5sealv3.c
+index 48fc508..606fa6d 100644
+--- a/src/lib/gssapi/krb5/k5sealv3.c
++++ b/src/lib/gssapi/krb5/k5sealv3.c
+@@ -65,7 +65,7 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+                                 int conf_req_flag, int toktype)
+ {
+     size_t bufsize = 16;
+-    unsigned char *outbuf = 0;
++    unsigned char *outbuf = NULL;
+     krb5_error_code err;
+     int key_usage;
+     unsigned char acceptor_flag;
+@@ -75,9 +75,13 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+ #endif
+     size_t ec;
+     unsigned short tok_id;
+-    krb5_checksum sum;
++    krb5_checksum sum = { 0 };
+     krb5_key key;
+     krb5_cksumtype cksumtype;
++    krb5_data plain = empty_data();
++
++    token->value = NULL;
++    token->length = 0;
+ 
+     acceptor_flag = ctx->initiate ? 0 : FLAG_SENDER_IS_ACCEPTOR;
+     key_usage = (toktype == KG_TOK_WRAP_MSG
+@@ -107,14 +111,15 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+ #endif
+ 
+     if (toktype == KG_TOK_WRAP_MSG && conf_req_flag) {
+-        krb5_data plain;
+         krb5_enc_data cipher;
+         size_t ec_max;
+         size_t encrypt_size;
+ 
+         /* 300: Adds some slop.  */
+-        if (SIZE_MAX - 300 < message->length)
+-            return ENOMEM;
++        if (SIZE_MAX - 300 < message->length) {
++            err = ENOMEM;
++            goto cleanup;
++        }
+         ec_max = SIZE_MAX - message->length - 300;
+         if (ec_max > 0xffff)
+             ec_max = 0xffff;
+@@ -126,20 +131,20 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+ #endif
+         err = alloc_data(&plain, message->length + 16 + ec);
+         if (err)
+-            return err;
++            goto cleanup;
+ 
+         /* Get size of ciphertext.  */
+         encrypt_size = krb5_encrypt_size(plain.length, key->keyblock.enctype);
+         if (encrypt_size > SIZE_MAX / 2) {
+             err = ENOMEM;
+-            goto error;
++            goto cleanup;
+         }
+         bufsize = 16 + encrypt_size;
+         /* Allocate space for header plus encrypted data.  */
+         outbuf = gssalloc_malloc(bufsize);
+         if (outbuf == NULL) {
+-            free(plain.data);
+-            return ENOMEM;
++            err = ENOMEM;
++            goto cleanup;
+         }
+ 
+         /* TOK_ID */
+@@ -165,11 +170,8 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+         cipher.ciphertext.length = bufsize - 16;
+         cipher.enctype = key->keyblock.enctype;
+         err = krb5_k_encrypt(context, key, key_usage, 0, &plain, &cipher);
+-        zap(plain.data, plain.length);
+-        free(plain.data);
+-        plain.data = 0;
+         if (err)
+-            goto error;
++            goto cleanup;
+ 
+         /* Now that we know we're returning a valid token....  */
+         ctx->seq_send++;
+@@ -182,7 +184,6 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+         /* If the rotate fails, don't worry about it.  */
+ #endif
+     } else if (toktype == KG_TOK_WRAP_MSG && !conf_req_flag) {
+-        krb5_data plain;
+         size_t cksumsize;
+ 
+         /* Here, message is the application-supplied data; message2 is
+@@ -194,21 +195,19 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+     wrap_with_checksum:
+         err = alloc_data(&plain, message->length + 16);
+         if (err)
+-            return err;
++            goto cleanup;
+ 
+         err = krb5_c_checksum_length(context, cksumtype, &cksumsize);
+         if (err)
+-            goto error;
++            goto cleanup;
+ 
+         assert(cksumsize <= 0xffff);
+ 
+         bufsize = 16 + message2->length + cksumsize;
+         outbuf = gssalloc_malloc(bufsize);
+         if (outbuf == NULL) {
+-            free(plain.data);
+-            plain.data = 0;
+             err = ENOMEM;
+-            goto error;
++            goto cleanup;
+         }
+ 
+         /* TOK_ID */
+@@ -240,23 +239,15 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+         if (message2->length)
+             memcpy(outbuf + 16, message2->value, message2->length);
+ 
+-        sum.contents = outbuf + 16 + message2->length;
+-        sum.length = cksumsize;
+-
+         err = krb5_k_make_checksum(context, cksumtype, key,
+                                    key_usage, &plain, &sum);
+-        zap(plain.data, plain.length);
+-        free(plain.data);
+-        plain.data = 0;
+         if (err) {
+             zap(outbuf,bufsize);
+-            goto error;
++            goto cleanup;
+         }
+         if (sum.length != cksumsize)
+             abort();
+         memcpy(outbuf + 16 + message2->length, sum.contents, cksumsize);
+-        krb5_free_checksum_contents(context, &sum);
+-        sum.contents = 0;
+         /* Now that we know we're actually generating the token...  */
+         ctx->seq_send++;
+ 
+@@ -286,12 +277,13 @@ gss_krb5int_make_seal_token_v3 (krb5_context context,
+ 
+     token->value = outbuf;
+     token->length = bufsize;
+-    return 0;
++    outbuf = NULL;
++    err = 0;
+ 
+-error:
++cleanup:
++    krb5_free_checksum_contents(context, &sum);
++    zapfree(plain.data, plain.length);
+     gssalloc_free(outbuf);
+-    token->value = NULL;
+-    token->length = 0;
+     return err;
+ }
+ 
+diff --git a/src/lib/rpc/pmap_rmt.c b/src/lib/rpc/pmap_rmt.c
+index 8c7e30c..0748af3 100644
+--- a/src/lib/rpc/pmap_rmt.c
++++ b/src/lib/rpc/pmap_rmt.c
+@@ -160,11 +160,12 @@ xdr_rmtcallres(
+ 	caddr_t port_ptr;
+ 
+ 	port_ptr = (caddr_t)(void *)crp->port_ptr;
+-	if (xdr_reference(xdrs, &port_ptr, sizeof (uint32_t),
+-	    xdr_u_int32) && xdr_u_int32(xdrs, &crp->resultslen)) {
+-		crp->port_ptr = (uint32_t *)(void *)port_ptr;
++	if (!xdr_reference(xdrs, &port_ptr, sizeof (uint32_t),
++			   (xdrproc_t)xdr_u_int32))
++		return (FALSE);
++	crp->port_ptr = (uint32_t *)(void *)port_ptr;
++	if (xdr_u_int32(xdrs, &crp->resultslen))
+ 		return ((*(crp->xdr_results))(xdrs, crp->results_ptr));
+-	}
+ 	return (FALSE);
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index ef256179fe..4c86bd94f5 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://CVE-2023-36054.patch;striplevel=2 \
            file://CVE-2024-37370_37371-pre1.patch;striplevel=2 \
            file://CVE-2024-37370_37371.patch;striplevel=2 \
+           file://CVE-2024-26458_CVE-2024-26461.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
 SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
-- 
2.25.1


