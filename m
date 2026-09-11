Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2969FC88E59
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:18:06 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40463.1789136283944218892
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hYQl8KMP;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b3d66515so1186773a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136283; x=1789741083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CchNCWZVOc4A5MX2udR8ApATB7R1znAEX5S8RR7BQi8=;
        b=hYQl8KMPkQBPlT15G5sTDvSAxzV8r9DqzLTsmUSwsSKjB2c02Y6fDYNP4dxjSvJzxl
         CwOWSR+yHZDAtqz3Sa/fbT+L5y2etCamOGOBa1Aap3MakYpYi7sAfB9bJLk5/mjirMzy
         aU2Xc76VCa7fddJSWy/0CHu8BrgjdXo0ruk3+gFS10Okh5Fqwwlym5WoUSwY2C4ZyV2k
         DvUMMY/R5Oc6SjPbzmwmj4PFRYX3djr057CWljczAERxTPX2w4Jo8V9k2GnQd0G4xSTZ
         SnIHkdUkZ4GQOEZ4OCnyB7oLeml1jSNJmpTNsEpuRrpSfjNkl2aHWUjYnXkrWg9zOTW4
         8NJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136283; x=1789741083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CchNCWZVOc4A5MX2udR8ApATB7R1znAEX5S8RR7BQi8=;
        b=PZajvZkHfkpllTe5KplwmldvMOFb5ZqChqahTTRPSyJCq3SsMkx8V4h5mZeTxnHz7G
         q5XrcAFK/EjRHau9t42I8lR1XLEFMvj3qJALm2KBgWvSG7VSMrHMcx8I2aOilcEwYZBz
         nvgeboMu5iKDS7EJPwouQdbVt96rQLhknyAn8jQBbwGMsrjxrsHADUTvhe29v/ixe2eN
         pTXRu/Ym92QOw6QoRu+XmuL8B+eLolQ1ERVwGrYmypEl8qpQKLqOUig+Id5mtwseUcwV
         /Ad3QlFzB2fRYY3IlCxws5E4YncDCSh9Zl2v2eOUD0Q19cNUw9uDngqpWBtDlGf36uKF
         iEAA==
X-Gm-Message-State: AFuF++n72XU7JG20uru0Ut+dZmpYvuiJAdERU+pLqUd116JG4pEg9i+M
	QlQZMuDx3bkCz9nFxNBX2Q/RaQALD6JxnTZXZpnQHG9gTKxR61kp8qPVaaq7ug==
X-Gm-Gg: AYBFou0uwfNhSJPytxSRY4s3iRWGZTwNx1D/hte+kaozfaP9JD1U2Vlpn/Rir9kEXV1
	cLNzXRjKNN36JN0b24L53QgeWxp1w01Lm4xyVyAo9tvleggQe1zQlsQ4kubSOdUgVs+Ppnrx/XY
	+3p9fEckFViGyOIIWif0Ua7twtzlOMhX37MsDJyAU+YDtkfSqNexi011KcUbDZWcJ9xpvaJc6Z+
	bIb4oe0bgVXRI0PtFxa41mdCnsrbUG3VVifGSDzScI/idvoGEX8a3U0rdVheJGDzoaqqlpGf1yn
	uATkIqj9PZkaWegRRkylH+4BP0VuY95snul4qdElScLr69wb0Yr27TuGZ62feztA6BV0Zhkw4FQ
	IyXPosZwjLjbBTTgiEhmfTN3fNQV/0I5fJdN9hhbF1B8z7tNP93h6tXLSSmmYNsRtG4I3r04uls
	zFE+HDe2oAgJXUczXwflzAL7zcBci9FztvA3h6nbuJJ6QpCTqmvH5JUq9ETG1b9gEwmaRkfzC2I
	iHqHdgRRsXjyWvpTrdkra6hWaUQyi3QDQa3LQecwzUAtaysSFRJYRNUm5ifDEK6Sj6hr96heSTV
	TjyRQ4Gy4xe+07kBRURcWKft8+vZ58rxcyfd7sBLrtCTJRli70loXzinDF6uv9EoPXWbzgUu+rp
	iazaFJz0sN6I2Z2KvzLBxfDzTNvkLeC/1m6LxvEgGYlNSMmlT+by7FSrF
X-Received: by 2002:a17:90b:280e:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39d9beba6ffmr7361836a91.8.1789136283189;
        Fri, 11 Sep 2026 07:18:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7840791eec.28.2026.09.11.07.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:18:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] wvstreams: fix build with OpenSSL 4
Date: Fri, 11 Sep 2026 07:17:53 -0700
Message-ID: <20260911141756.2275517-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
References: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 14:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129968

OpenSSL 4.0 breaks the X.509 code in two ways: struct asn1_string_st is
opaque, so ASN1_INTEGER / ASN1_OCTET_STRING / ASN1_BIT_STRING / ASN1_TIME
can no longer be dereferenced, and X509_get_ext(),
X509_EXTENSION_get_data(), X509_get0_pubkey_bitstr(),
X509_get_subject_name(), X509_get_issuer_name() and
X509_REQ_get_subject_name() all gained const.

Switch to the ASN1_STRING_get0_data() / ASN1_STRING_length() /
ASN1_STRING_type() accessors, available since OpenSSL 1.1.0, and
propagate const to the locals that only read through those pointers.

Three call sites needed a mutable X509_NAME: they fetched the existing
name, edited it in place and installed it again. The getters have no
mutable counterpart, so duplicate with X509_NAME_dup(), edit the copy and
free it once the setter has taken its own copy, preserving the previous
behaviour of merging into the existing DN.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-crypto-build-against-OpenSSL-4.patch | 265 ++++++++++++++++++
 .../wvdial/wvstreams_4.6.1.bb                 |   1 +
 2 files changed, 266 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0001-crypto-build-against-OpenSSL-4.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-crypto-build-against-OpenSSL-4.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-crypto-build-against-OpenSSL-4.patch
new file mode 100644
index 0000000000..e3146dfa41
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-crypto-build-against-OpenSSL-4.patch
@@ -0,0 +1,265 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Sep 2026 01:30:00 +0000
+Subject: [PATCH] crypto: build against OpenSSL 4
+
+OpenSSL 4.0 brings two changes that wvstreams' X.509 code trips over:
+
+ - struct asn1_string_st is opaque, so ASN1_INTEGER / ASN1_OCTET_STRING /
+   ASN1_BIT_STRING / ASN1_TIME can no longer be dereferenced;
+ - several getters gained const: X509_get_ext(), X509_EXTENSION_get_data(),
+   X509_get0_pubkey_bitstr(), X509_get_subject_name(),
+   X509_get_issuer_name() and X509_REQ_get_subject_name().
+
+Use the ASN1_STRING_get0_data() / ASN1_STRING_length() / ASN1_STRING_type()
+accessors, which have existed since OpenSSL 1.1.0, and propagate const to
+the locals that only ever read through those pointers.
+
+Three call sites did rely on getting a mutable X509_NAME back: they fetched
+the certificate's (or request's) existing name, edited it in place through
+set_name_entry() and then installed it again.  There is no mutable
+counterpart to those getters, so duplicate the name with X509_NAME_dup(),
+edit the copy, and free it after the setter has taken its own copy.  That
+keeps the previous behaviour of merging into the existing DN rather than
+starting from an empty one.
+
+WvX509::set_subject(X509_NAME *) becomes set_subject(const X509_NAME *) so
+that wvx509mgr.cc can keep passing X509_REQ_get_subject_name() straight in;
+the implementation only forwards to X509_set_subject_name(), which takes a
+const pointer.
+
+set_aki() and WvCRL's constructor used one X509_EXTENSION * for both the
+borrowed extension returned by X509_get_ext() and the freshly built one they
+own and free, which no longer type checks now that the former is const. Give
+the owned extension its own variable.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/include/wvx509.h
++++ b/include/wvx509.h
+@@ -161,7 +161,7 @@
+      */
+     WvString get_subject() const;
+     void set_subject(WvStringParm name);
+-    void set_subject(X509_NAME *name);
++    void set_subject(const X509_NAME *name);
+ 
+     /**
+      * get and set the serialNumber field of the certificate
+--- a/crypto/wvcrl.cc
++++ b/crypto/wvcrl.cc
+@@ -56,7 +56,7 @@
+ 
+     // most of this copied from wvx509.cc, sigh
+     ASN1_OCTET_STRING *ikeyid = NULL;
+-    X509_EXTENSION *ext;
++    const X509_EXTENSION *ext;
+     int i = X509_get_ext_by_NID(ca.cert, NID_subject_key_identifier, -1);
+     if ((i >= 0) && (ext = X509_get_ext(ca.cert, i)))
+         ikeyid = static_cast<ASN1_OCTET_STRING *>(X509V3_EXT_d2i(ext));
+@@ -67,9 +67,10 @@
+         akeyid->issuer = NULL;
+         akeyid->serial = NULL;
+         akeyid->keyid = ikeyid;
+-        ext = X509V3_EXT_i2d(NID_authority_key_identifier, 0, akeyid);
+-        X509_CRL_add_ext(crl, ext, -1);
+-        X509_EXTENSION_free(ext); 
++        X509_EXTENSION *akiext =
++            X509V3_EXT_i2d(NID_authority_key_identifier, 0, akeyid);
++        X509_CRL_add_ext(crl, akiext, -1);
++        X509_EXTENSION_free(akiext);
+         AUTHORITY_KEYID_free(akeyid);
+     }
+ 
+@@ -169,7 +170,8 @@
+                              &i, NULL));
+     if (aki)
+     {
+-        char *tmp = hex_to_string(aki->keyid->data, aki->keyid->length); 
++        char *tmp = hex_to_string(ASN1_STRING_get0_data(aki->keyid),
++                                  ASN1_STRING_length(aki->keyid));
+         WvString str(tmp);
+         
+         OPENSSL_free(tmp);
+--- a/crypto/wvx509.cc
++++ b/crypto/wvx509.cc
+@@ -306,11 +306,12 @@
+ 
+     X509_REQ_set_pubkey(certreq, pk);
+ 
+-    name = X509_REQ_get_subject_name(certreq);
++    name = X509_NAME_dup(X509_REQ_get_subject_name(certreq));
+ 
+     debug("Creating Certificate request for %s\n", subject);
+     set_name_entry(name, subject);
+     X509_REQ_set_subject_name(certreq, name);
++    X509_NAME_free(name);
+     char *sub_name = X509_NAME_oneline(X509_REQ_get_subject_name(certreq), 
+ 				       0, 0);
+     debug("SubjectDN: %s\n", sub_name);
+@@ -606,9 +607,10 @@
+ {
+     CHECK_CERT_EXISTS_SET("issuer");
+ 
+-    X509_NAME *name = X509_get_issuer_name(cert);
++    X509_NAME *name = X509_NAME_dup(X509_get_issuer_name(cert));
+     set_name_entry(name, issuer);
+     X509_set_issuer_name(cert, name);
++    X509_NAME_free(name);
+ }
+ 
+ 
+@@ -616,7 +618,7 @@
+ {
+     CHECK_CERT_EXISTS_SET("issuer");
+ 
+-    X509_NAME *casubj = X509_get_subject_name(cacert.cert);
++    const X509_NAME *casubj = X509_get_subject_name(cacert.cert);
+     X509_set_issuer_name(cert, casubj);
+ }
+ 
+@@ -636,13 +638,14 @@
+ {    
+     CHECK_CERT_EXISTS_SET("subject");
+ 
+-    X509_NAME *name = X509_get_subject_name(cert);
++    X509_NAME *name = X509_NAME_dup(X509_get_subject_name(cert));
+     set_name_entry(name, subject);
+     X509_set_subject_name(cert, name);
++    X509_NAME_free(name);
+ }
+ 
+ 
+-void WvX509::set_subject(X509_NAME *name)
++void WvX509::set_subject(const X509_NAME *name)
+ {
+     CHECK_CERT_EXISTS_SET("subject");
+ 
+@@ -799,7 +802,8 @@
+         ca = constraints->ca;
+         if (constraints->pathlen)
+         {
+-            if ((constraints->pathlen->type == V_ASN1_NEG_INTEGER) || !ca)
++            if ((ASN1_STRING_type(constraints->pathlen) ==
++                 V_ASN1_NEG_INTEGER) || !ca)
+             {
+                 debug("Path length type not valid when getting basic "
+                       "constraints.\n");
+@@ -1153,7 +1157,7 @@
+     int index = X509_get_ext_by_NID(cert, nid, -1);
+     if (index >= 0)
+     {
+-        X509_EXTENSION *ext = X509_get_ext(cert, index);
++        const X509_EXTENSION *ext = X509_get_ext(cert, index);
+         
+         if (ext)
+         {
+@@ -1162,11 +1166,13 @@
+ #else
+             X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
+ #endif
+-            ASN1_OCTET_STRING *ext_data_str = X509_EXTENSION_get_data(ext);
++            const ASN1_OCTET_STRING *ext_data_str =
++                X509_EXTENSION_get_data(ext);
+             if (!method)
+             {
+                 WvDynBuf buf;
+-                buf.put(ext_data_str->data, ext_data_str->length);
++                buf.put(ASN1_STRING_get0_data(ext_data_str),
++                        ASN1_STRING_length(ext_data_str));
+                 retval = buf.getstr();
+             }
+             else
+@@ -1177,21 +1183,22 @@
+                 // even though it's const (at least as of version 0.9.8e). 
+                 // gah.
+ #if OPENSSL_VERSION_NUMBER >= 0x0090800fL
+-                const unsigned char * ext_value_data = ext_data_str->data;
++                const unsigned char * ext_value_data =
++                    ASN1_STRING_get0_data(ext_data_str);
+ #else
+                 unsigned char *ext_value_data = ext->value->data;
+ #endif
+                 if (method->it)
+                 {
+                     ext_data = ASN1_item_d2i(NULL, &ext_value_data,
+-                                             ext_data_str->length, 
++                                             ASN1_STRING_length(ext_data_str),
+                                              ASN1_ITEM_ptr(method->it));
+                     TRACE("Applied generic conversion!\n");
+                 }
+                 else
+                 {
+                     ext_data = method->d2i(NULL, &ext_value_data,
+-                                           ext_data_str->length);
++                                           ASN1_STRING_length(ext_data_str));
+                     TRACE("Applied method specific conversion!\n");
+                 }
+                 
+@@ -1343,7 +1350,7 @@
+ }
+ 
+ 
+-static time_t ASN1_TIME_to_time_t(ASN1_TIME *t)
++static time_t ASN1_TIME_to_time_t(const ASN1_TIME *t)
+ {
+     struct tm newtime;
+     char *p = NULL;
+@@ -1351,7 +1358,7 @@
+     memset(&d,'\0',sizeof(d));    
+     memset(&newtime,'\0',sizeof newtime);
+     
+-    if (t->type == V_ASN1_GENERALIZEDTIME) 
++    if (ASN1_STRING_type(t) == V_ASN1_GENERALIZEDTIME) 
+     {
+          // For time values >= 2050, OpenSSL uses
+          // ASN1_GENERALIZEDTIME - which we'll worry about
+@@ -1359,7 +1366,7 @@
+ 	return 0;
+     }
+ 
+-    p = (char *)t->data;
++    p = (char *)ASN1_STRING_get0_data(t);
+     sscanf(p,"%2s%2s%2s%2s%2s%2sZ", d, &d[3], &d[6], &d[9], &d[12], &d[15]);
+     
+     int year = strtol(d, (char **)NULL, 10);
+@@ -1452,11 +1459,12 @@
+     CHECK_CERT_EXISTS_SET("ski");
+ 
+     ASN1_OCTET_STRING *oct = ASN1_OCTET_STRING_new();
+-    ASN1_BIT_STRING *pk = X509_get0_pubkey_bitstr(cert);
++    const ASN1_BIT_STRING *pk = X509_get0_pubkey_bitstr(cert);
+     unsigned char pkey_dig[EVP_MAX_MD_SIZE];
+     unsigned int diglen;
+ 
+-    EVP_Digest(pk->data, pk->length, pkey_dig, &diglen, EVP_sha1(), NULL);
++    EVP_Digest(ASN1_STRING_get0_data(pk), ASN1_STRING_length(pk), pkey_dig,
++               &diglen, EVP_sha1(), NULL);
+ 
+     ASN1_OCTET_STRING_set(oct, pkey_dig, diglen);
+     X509_EXTENSION *ext = X509V3_EXT_i2d(NID_subject_key_identifier, 0, 
+@@ -1474,7 +1482,7 @@
+     // can't set a meaningful AKI for subordinate certification without the 
+     // parent having an SKI
+     ASN1_OCTET_STRING *ikeyid = NULL;
+-    X509_EXTENSION *ext;
++    const X509_EXTENSION *ext;
+     int i = X509_get_ext_by_NID(cacert.cert, NID_subject_key_identifier, -1);
+     if ((i >= 0) && (ext = X509_get_ext(cacert.cert, i)))
+         ikeyid = static_cast<ASN1_OCTET_STRING *>(X509V3_EXT_d2i(ext));
+@@ -1486,9 +1494,10 @@
+     akeyid->issuer = NULL;
+     akeyid->serial = NULL;
+     akeyid->keyid = ikeyid;
+-    ext = X509V3_EXT_i2d(NID_authority_key_identifier, 0, akeyid);
+-    X509_add_ext(cert, ext, -1);
+-    X509_EXTENSION_free(ext); 
++    X509_EXTENSION *akiext =
++        X509V3_EXT_i2d(NID_authority_key_identifier, 0, akeyid);
++    X509_add_ext(cert, akiext, -1);
++    X509_EXTENSION_free(akiext);
+     AUTHORITY_KEYID_free(akeyid);
+ }
+ 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 8302e4cce1..27e6e33224 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.
            file://openssl-buildfix.patch \
            file://0001-Forward-port-to-OpenSSL-1.1.x.patch \
            file://0001-Fix-narrowing-conversion-error.patch \
+           file://0001-crypto-build-against-OpenSSL-4.patch \
            "
 
 SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"

