Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id E6FE97951E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:06:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u24-v6so9818683pfn.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 22:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=78X99agxSlACH3uBg/FhjLlBpjg5Be63hEH368BdioQ=;
	b=ojQoQcKXhW5qt1b93gTOSFVuf8J3I90LBJRwNBO/vwIUFE9Ni6sT6RX71ekJJVKtPp
	eeB5xLMp1ONSRHLbXP7yr/MHzF5MSzRsav2wbtp/dPSwKBcI6XJ6pXRjG9JOrr5vf78s
	dG1vXYoesLIftsvfgT/jxVjjXL1HG97U4tLUa1E5Hc7Xyj0LQj6xw0BvGnnohLqokhvk
	t46NW61MaqCtNOvRIxpTgkXamtwGAqy8o/KJgu0teVKLx6VgUEI6hIbz/9UEvC9zvlyE
	Jy2pYuiFb7b4fts12eUtIBWf1KIU4VO47UpVXhNtwqHPn7Af3+YMowHFPsVNTl16Fihj
	VMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=78X99agxSlACH3uBg/FhjLlBpjg5Be63hEH368BdioQ=;
	b=f/D+cXXySAn9pX8SCwlFtm7fRTQG3NCS6niaMzRymsD3z5LldpNTY8JMA6xdEKSC9w
	4/lNbVc5Ep5m8S2jyJ8OEaviBmfY0SNHuclcEPkIxxJAlVNLJPjKLSWnotPTSbWO5Vx6
	rTGfter1jeAIYW1n6sQKlGS+01gEQughSYIE/hlAljxVpWrF14O/hYrNeCulHjoxqTnf
	ZJEsly6F3BhNeODEdMARszwTRjAy7OOPql09ETiQBLq0I/bvPDpWhVkpIxAqAN23zTob
	w+3e9feM33paEr+lbmPDX+tvW0wljj6cpdrhOf/PIFOWwgk4LaL7Zkr+pi1PYyOtVpPh
	YkFA==
X-Gm-Message-State: APzg51COVGPgAfM3WhOXNvjvd2fbtj0kiEvGu2B6+BgKOL/8+BtAmBYz
	087zg69Jiq/Uaqbg+FU7dQEu0sq6
X-Google-Smtp-Source: ANB0VdalAZvaW/uanVrAwzDbSAxLCdU8BGyD6VnkAR7vlBppiCJxa18+OHDelDdG5EiCVBdT/3lUVA==
X-Received: by 2002:a63:eb0e:: with SMTP id
	t14-v6mr20652473pgh.198.1536556004382; 
	Sun, 09 Sep 2018 22:06:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm18819188pfh.67.2018.09.09.22.06.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 22:06:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 22:06:26 -0700
Message-Id: <20180910050629.16170-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180910050629.16170-1-raj.khem@gmail.com>
References: <20180910050629.16170-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 07/10] wvstreams: Add openssl 1.1.x support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 05:06:44 -0000

* Backport a pull request to support OpenSSL 1.1.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Fix build with openssl 1.1.x

 .../0001-Forward-port-to-OpenSSL-1.1.x.patch  | 557 ++++++++++++++++++
 .../wvdial/wvstreams/05_gcc.diff              |  13 -
 .../wvdial/wvstreams/openssl-buildfix.patch   |  16 +
 .../wvdial/wvstreams_4.6.1.bb                 |   2 +
 4 files changed, 575 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Forward-port-to-OpenSSL-1.1.x.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Forward-port-to-OpenSSL-1.1.x.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Forward-port-to-OpenSSL-1.1.x.patch
new file mode 100644
index 0000000000..19a2e26f2a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Forward-port-to-OpenSSL-1.1.x.patch
@@ -0,0 +1,557 @@
+From 0c35749891bf834c1f3c1c4c330266bd2f4733cc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Sep 2018 10:40:09 -0700
+Subject: [PATCH] Forward port to OpenSSL 1.1.x
+
+* import patch from debian
+https://sources.debian.org/src/wvstreams/4.6.1-14/debian/patches/wvstreams_openssl1.1.patch
+Author: Reiner Herrmann <reiner@reiner-h.de>
+
+Upstream-Status: Submitted [https://github.com/apenwarr/wvstreams/pull/2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ crypto/wvcrl.cc           | 38 +++++++++++++-------------------------
+ crypto/wvdiffiehellman.cc | 30 +++++++++++++++++++-----------
+ crypto/wvdigest.cc        | 16 ++++++++--------
+ crypto/wvocsp.cc          | 35 +++++++++--------------------------
+ crypto/wvx509.cc          | 31 ++++++++++++++++---------------
+ crypto/wvx509mgr.cc       | 27 ++++++++++++++++-----------
+ include/wvdiffiehellman.h |  2 +-
+ include/wvdigest.h        | 14 ++++++--------
+ include/wvtripledes.h     | 10 +++++-----
+ 9 files changed, 93 insertions(+), 110 deletions(-)
+
+diff --git a/crypto/wvcrl.cc b/crypto/wvcrl.cc
+index fa00c76..880ad85 100644
+--- a/crypto/wvcrl.cc
++++ b/crypto/wvcrl.cc
+@@ -357,31 +357,19 @@ bool WvCRL::isrevoked(WvStringParm serial_number) const
+ 	ASN1_INTEGER *serial = serial_to_int(serial_number);
+ 	if (serial)
+ 	{
+-	    X509_REVOKED mayberevoked;
+-	    mayberevoked.serialNumber = serial;
+-	    if (crl->crl->revoked)
+-	    {
+-		int idx = sk_X509_REVOKED_find(crl->crl->revoked, 
+-					       &mayberevoked);
+-		ASN1_INTEGER_free(serial);
+-		if (idx >= 0)
+-                {
+-                    debug("Certificate is revoked.\n");
+-		    return true;
+-                }
+-                else
+-                {
+-                    debug("Certificate is not revoked.\n");
+-		    return false;
+-                }
+-	    }
+-	    else
+-	    {
+-		ASN1_INTEGER_free(serial);
+-		debug("CRL does not have revoked list.\n");
+-                return false;
+-	    }
+-	    
++	    X509_REVOKED *revoked_entry = NULL;
++	    int idx = X509_CRL_get0_by_serial(crl, &revoked_entry, serial);
++	    ASN1_INTEGER_free(serial);
++	    if (idx >= 1 || revoked_entry)
++            {
++                debug("Certificate is revoked.\n");
++	        return true;
++            }
++            else
++            {
++                debug("Certificate is not revoked.\n");
++	        return false;
++            }
+ 	}
+ 	else
+ 	    debug(WvLog::Warning, "Can't convert serial number to ASN1 format. "
+diff --git a/crypto/wvdiffiehellman.cc b/crypto/wvdiffiehellman.cc
+index 7c0bf32..15cd104 100644
+--- a/crypto/wvdiffiehellman.cc
++++ b/crypto/wvdiffiehellman.cc
+@@ -39,24 +39,25 @@ WvDiffieHellman::WvDiffieHellman(const unsigned char *_key, int _keylen,
+ {
+     int problems;
+     int check;
+-    {
++
+ 	info = DH_new();
+-	info->p = BN_bin2bn(_key, _keylen, NULL);
++	BIGNUM *p = BN_bin2bn(_key, _keylen, NULL);
+ // 	info->p->top = 0;
+ // 	info->p->dmax = _keylen * 8 / BN_BITS2;
+ // 	info->p->neg = 0;
+ // 	info->p->flags = 0;
+ 
+-	info->g = BN_new();
+-	BN_set_word(info->g, generator);
++	BIGNUM *g = BN_new();
++	BN_set_word(g, generator);
+ // 	info->g->d = &generator;
+ //  	info->g->top = 0;
+ //  	info->g->dmax = 1;
+ //  	info->g->neg = 0;
+ //  	info->g->flags = 0;
+-    }
+ 
+-    check = BN_mod_word(info->p, 24);
++	DH_set0_pqg(info, p, NULL, g);
++
++    check = BN_mod_word(p, 24);
+     DH_check(info, &problems);
+     if (problems & DH_CHECK_P_NOT_PRIME)
+  	log(WvLog::Error, "Using a composite number for authentication.\n");
+@@ -64,7 +65,7 @@ WvDiffieHellman::WvDiffieHellman(const unsigned char *_key, int _keylen,
+ 	log(WvLog::Error,"Using an unsafe prime number for authentication.\n");
+     if (problems & DH_NOT_SUITABLE_GENERATOR)
+ 	log(WvLog::Error, "Can you just use 2 instead of %s (%s)!!\n",
+-	    BN_bn2hex(info->g), check);
++	    BN_bn2hex(g), check);
+     if (problems & DH_UNABLE_TO_CHECK_GENERATOR)
+ 	log(WvLog::Notice, "Using a strange argument for diffie-hellman.\n");
+     DH_generate_key(info);
+@@ -72,18 +73,23 @@ WvDiffieHellman::WvDiffieHellman(const unsigned char *_key, int _keylen,
+ 
+ int WvDiffieHellman::pub_key_len()
+ {
+-    return BN_num_bytes(info->pub_key);
++    const BIGNUM *pub_key = NULL;
++	DH_get0_key(info, &pub_key, NULL);
++    return BN_num_bytes(pub_key);
+ }
+ 
+ int WvDiffieHellman::get_public_value(WvBuf &outbuf, int len)
+ {
+-    int key_len = BN_num_bytes(info->pub_key);
++	const BIGNUM *pub_key = NULL;
++	DH_get0_key(info, &pub_key, NULL);
++
++    int key_len = BN_num_bytes(pub_key);
+     if (key_len < len)
+ 	len = key_len;
+ 
+     // alloca is stack allocated, don't free it.
+     unsigned char *foo = (unsigned char*)alloca(key_len);
+-    BN_bn2bin(info->pub_key, foo);
++    BN_bn2bin(pub_key, foo);
+     outbuf.put(foo, len);
+ 
+     return len;
+@@ -91,8 +97,10 @@ int WvDiffieHellman::get_public_value(WvBuf &outbuf, int len)
+ 
+ bool WvDiffieHellman::create_secret(WvBuf &inbuf, size_t in_len, WvBuf& outbuf)
+ {
++   const BIGNUM *pub_key = NULL;
++   DH_get0_key(info, &pub_key, NULL);
+     unsigned char *foo = (unsigned char *)alloca(DH_size(info));
+-   log("My public value\n%s\nYour public value\n%s\n",BN_bn2hex(info->pub_key),
++   log("My public value\n%s\nYour public value\n%s\n",BN_bn2hex(pub_key),
+        hexdump_buffer(inbuf.peek(0, in_len), in_len, false));
+     int len = DH_compute_key (foo, BN_bin2bn(inbuf.get(in_len), in_len, NULL), 
+ 			      info);
+diff --git a/crypto/wvdigest.cc b/crypto/wvdigest.cc
+index 150edee..73ebb5d 100644
+--- a/crypto/wvdigest.cc
++++ b/crypto/wvdigest.cc
+@@ -13,10 +13,10 @@
+ 
+ /***** WvEVPMDDigest *****/
+ 
+-WvEVPMDDigest::WvEVPMDDigest(const env_md_st *_evpmd) :
++WvEVPMDDigest::WvEVPMDDigest(const EVP_MD*_evpmd) :
+     evpmd(_evpmd), active(false)
+ {
+-    evpctx = new EVP_MD_CTX;
++    evpctx = EVP_MD_CTX_new();
+     _reset();
+ }
+ 
+@@ -24,7 +24,7 @@ WvEVPMDDigest::WvEVPMDDigest(const env_md_st *_evpmd) :
+ WvEVPMDDigest::~WvEVPMDDigest()
+ {
+     cleanup();
+-    delete evpctx;
++    EVP_MD_CTX_free(evpctx);
+ }
+ 
+ 
+@@ -60,7 +60,7 @@ bool WvEVPMDDigest::_reset()
+     // the typecast is necessary for API compatibility with different
+     // versions of openssl.  None of them *actually* change the contents of
+     // the pointer.
+-    EVP_DigestInit(evpctx, (env_md_st *)evpmd);
++    EVP_DigestInit(evpctx, evpmd);
+     active = true;
+     return true;
+ }
+@@ -79,7 +79,7 @@ void WvEVPMDDigest::cleanup()
+ 
+ size_t WvEVPMDDigest::digestsize() const
+ {
+-    return EVP_MD_size((env_md_st *)evpmd);
++    return EVP_MD_size(evpmd);
+ }
+ 
+ 
+@@ -104,14 +104,14 @@ WvHMACDigest::WvHMACDigest(WvEVPMDDigest *_digest,
+ {
+     key = new unsigned char[keysize];
+     memcpy(key, _key, keysize);
+-    hmacctx = new HMAC_CTX;
++    hmacctx = HMAC_CTX_new();
+     _reset();
+ }
+ 
+ WvHMACDigest::~WvHMACDigest()
+ {
+     cleanup();
+-    delete hmacctx;
++    HMAC_CTX_free(hmacctx);
+     deletev key;
+     delete digest;
+ }
+@@ -145,7 +145,7 @@ bool WvHMACDigest::_finish(WvBuf &outbuf)
+ bool WvHMACDigest::_reset()
+ {
+     cleanup();
+-    HMAC_Init(hmacctx, key, keysize, (env_md_st *)digest->getevpmd());
++    HMAC_Init(hmacctx, key, keysize, digest->getevpmd());
+     active = true;
+     return true;
+ }
+diff --git a/crypto/wvocsp.cc b/crypto/wvocsp.cc
+index ddb2de4..7d5da07 100644
+--- a/crypto/wvocsp.cc
++++ b/crypto/wvocsp.cc
+@@ -118,9 +118,10 @@ bool WvOCSPResp::check_nonce(const WvOCSPReq &req) const
+ 
+ bool WvOCSPResp::signedbycert(const WvX509 &cert) const
+ {
+-    EVP_PKEY *skey = X509_get_pubkey(cert.cert);
+-    int i = OCSP_BASICRESP_verify(bs, skey, 0);
+-    EVP_PKEY_free(skey);
++    STACK_OF(X509) *sk = sk_X509_new_null();
++    sk_X509_push(sk, cert.cert);
++    int i = OCSP_basic_verify(bs, sk, NULL, OCSP_NOVERIFY);
++    sk_X509_free(sk);
+ 
+     if(i > 0)
+         return true;
+@@ -131,33 +132,15 @@ bool WvOCSPResp::signedbycert(const WvX509 &cert) const
+ 
+ WvX509 WvOCSPResp::get_signing_cert() const
+ {
+-    if (!bs || !sk_X509_num(bs->certs))
++    const STACK_OF(X509) *certs = OCSP_resp_get0_certs(bs);
++    if (!bs || !sk_X509_num(certs))
+         return WvX509();
+ 
+-    // note: the following bit of code is taken almost verbatim from
+-    // ocsp_vfy.c in OpenSSL 0.9.8. Copyright and attribution should 
+-    // properly belong to them
+-
+-    OCSP_RESPID *id = bs->tbsResponseData->responderId;
+-
+-    if (id->type == V_OCSP_RESPID_NAME)
+-    {
+-        X509 *x = X509_find_by_subject(bs->certs, id->value.byName);
+-        if (x)
+-            return WvX509(X509_dup(x));
++    X509 *signer = NULL;
++    if (OCSP_resp_get0_signer(bs, &signer, NULL) == 1) {
++        return WvX509(X509_dup(signer));
+     }
+ 
+-    if (id->value.byKey->length != SHA_DIGEST_LENGTH) return NULL;
+-    unsigned char tmphash[SHA_DIGEST_LENGTH];
+-    unsigned char *keyhash = id->value.byKey->data;
+-    for (int i = 0; i < sk_X509_num(bs->certs); i++)
+-    {
+-        X509 *x = sk_X509_value(bs->certs, i);
+-        X509_pubkey_digest(x, EVP_sha1(), tmphash, NULL);
+-        if(!memcmp(keyhash, tmphash, SHA_DIGEST_LENGTH))
+-            return WvX509(X509_dup(x));
+-    }
+-    
+     return WvX509();
+ }
+ 
+diff --git a/crypto/wvx509.cc b/crypto/wvx509.cc
+index e4925ce..984156c 100644
+--- a/crypto/wvx509.cc
++++ b/crypto/wvx509.cc
+@@ -974,7 +974,7 @@ static void add_aia(WvStringParm type, WvString identifier,
+     sk_ACCESS_DESCRIPTION_push(ainfo, acc);
+     acc->method = OBJ_txt2obj(type.cstr(), 0);
+     acc->location->type = GEN_URI;
+-    acc->location->d.ia5 = M_ASN1_IA5STRING_new();
++    acc->location->d.ia5 = ASN1_IA5STRING_new();
+     unsigned char *cident 
+ 	= reinterpret_cast<unsigned char *>(identifier.edit());
+     ASN1_STRING_set(acc->location->d.ia5, cident, identifier.len());
+@@ -1059,7 +1059,7 @@ void WvX509::set_crl_urls(WvStringList &urls)
+         GENERAL_NAMES *uris = GENERAL_NAMES_new();
+         GENERAL_NAME *uri = GENERAL_NAME_new();
+         uri->type = GEN_URI;
+-        uri->d.ia5 = M_ASN1_IA5STRING_new();
++        uri->d.ia5 = ASN1_IA5STRING_new();
+         unsigned char *cident
+ 	    = reinterpret_cast<unsigned char *>(i().edit());    
+         ASN1_STRING_set(uri->d.ia5, cident, i().len());
+@@ -1162,10 +1162,11 @@ WvString WvX509::get_extension(int nid) const
+ #else
+             X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
+ #endif
++            ASN1_OCTET_STRING *ext_data_str = X509_EXTENSION_get_data(ext);
+             if (!method)
+             {
+                 WvDynBuf buf;
+-                buf.put(ext->value->data, ext->value->length);
++                buf.put(ext_data_str->data, ext_data_str->length);
+                 retval = buf.getstr();
+             }
+             else
+@@ -1176,21 +1177,21 @@ WvString WvX509::get_extension(int nid) const
+                 // even though it's const (at least as of version 0.9.8e). 
+                 // gah.
+ #if OPENSSL_VERSION_NUMBER >= 0x0090800fL
+-                const unsigned char * ext_value_data = ext->value->data;
++                const unsigned char * ext_value_data = ext_data_str->data;
+ #else
+                 unsigned char *ext_value_data = ext->value->data;
+ #endif
+                 if (method->it)
+                 {
+                     ext_data = ASN1_item_d2i(NULL, &ext_value_data,
+-                                             ext->value->length, 
++                                             ext_data_str->length, 
+                                              ASN1_ITEM_ptr(method->it));
+                     TRACE("Applied generic conversion!\n");
+                 }
+                 else
+                 {
+                     ext_data = method->d2i(NULL, &ext_value_data,
+-                                           ext->value->length);
++                                           ext_data_str->length);
+                     TRACE("Applied method specific conversion!\n");
+                 }
+                 
+@@ -1325,13 +1326,13 @@ bool WvX509::verify(WvBuf &original, WvStringParm signature) const
+         return false;
+     
+     /* Verify the signature */
+-    EVP_MD_CTX sig_ctx;
+-    EVP_VerifyInit(&sig_ctx, EVP_sha1());
+-    EVP_VerifyUpdate(&sig_ctx, original.peek(0, original.used()),
++    EVP_MD_CTX *sig_ctx = EVP_MD_CTX_new();
++    EVP_VerifyInit(sig_ctx, EVP_sha1());
++    EVP_VerifyUpdate(sig_ctx, original.peek(0, original.used()),
+ 		     original.used());
+-    int sig_err = EVP_VerifyFinal(&sig_ctx, sig_buf, sig_size, pk);
++    int sig_err = EVP_VerifyFinal(sig_ctx, sig_buf, sig_size, pk);
+     EVP_PKEY_free(pk);
+-    EVP_MD_CTX_cleanup(&sig_ctx); // Again, not my fault... 
++    EVP_MD_CTX_free(sig_ctx); // Again, not my fault... 
+     if (sig_err != 1) 
+     {
+         debug("Verify failed!\n");
+@@ -1450,19 +1451,19 @@ void WvX509::set_ski()
+ {
+     CHECK_CERT_EXISTS_SET("ski");
+ 
+-    ASN1_OCTET_STRING *oct = M_ASN1_OCTET_STRING_new();
+-    ASN1_BIT_STRING *pk = cert->cert_info->key->public_key;
++    ASN1_OCTET_STRING *oct = ASN1_OCTET_STRING_new();
++    ASN1_BIT_STRING *pk = X509_get0_pubkey_bitstr(cert);
+     unsigned char pkey_dig[EVP_MAX_MD_SIZE];
+     unsigned int diglen;
+ 
+     EVP_Digest(pk->data, pk->length, pkey_dig, &diglen, EVP_sha1(), NULL);
+ 
+-    M_ASN1_OCTET_STRING_set(oct, pkey_dig, diglen);
++    ASN1_OCTET_STRING_set(oct, pkey_dig, diglen);
+     X509_EXTENSION *ext = X509V3_EXT_i2d(NID_subject_key_identifier, 0, 
+ 					oct);
+     X509_add_ext(cert, ext, -1);
+     X509_EXTENSION_free(ext);
+-    M_ASN1_OCTET_STRING_free(oct);
++    ASN1_OCTET_STRING_free(oct);
+ }
+ 
+ 
+diff --git a/crypto/wvx509mgr.cc b/crypto/wvx509mgr.cc
+index f249eec..156d3a4 100644
+--- a/crypto/wvx509mgr.cc
++++ b/crypto/wvx509mgr.cc
+@@ -350,6 +350,8 @@ bool WvX509Mgr::signcert(WvX509 &unsignedcert) const
+         return false;
+     }
+ 
++    uint32_t ex_flags = X509_get_extension_flags(cert);
++    uint32_t ex_kusage = X509_get_key_usage(cert);
+     if (cert == unsignedcert.cert)
+     {
+ 	debug("Self Signing!\n");
+@@ -362,8 +364,8 @@ bool WvX509Mgr::signcert(WvX509 &unsignedcert) const
+         return false;
+     }
+ #endif
+-    else if (!((cert->ex_flags & EXFLAG_KUSAGE) && 
+-               (cert->ex_kusage & KU_KEY_CERT_SIGN)))
++    else if (!((ex_flags & EXFLAG_KUSAGE) && 
++               (ex_kusage & KU_KEY_CERT_SIGN)))
+     {
+ 	debug("This Certificate is not allowed to sign certificates!\n");
+ 	return false;
+@@ -390,6 +392,8 @@ bool WvX509Mgr::signcert(WvX509 &unsignedcert) const
+ 
+ bool WvX509Mgr::signcrl(WvCRL &crl) const
+ {
++    uint32_t ex_flags = X509_get_extension_flags(cert);
++    uint32_t ex_kusage = X509_get_key_usage(cert);
+     if (!isok() || !crl.isok())
+     {
+         debug(WvLog::Warning, "Asked to sign CRL, but certificate or CRL (or "
+@@ -403,12 +407,12 @@ bool WvX509Mgr::signcrl(WvCRL &crl) const
+               "CRLs!\n");
+         return false;
+     }
+-    else if (!((cert->ex_flags & EXFLAG_KUSAGE) && 
+-	  (cert->ex_kusage & KU_CRL_SIGN)))
++    else if (!((ex_flags & EXFLAG_KUSAGE) && 
++	  (ex_kusage & KU_CRL_SIGN)))
+     {
+ 	debug("Certificate not allowed to sign CRLs! (%s %s)\n", 
+-              (cert->ex_flags & EXFLAG_KUSAGE),
+-	      (cert->ex_kusage & KU_CRL_SIGN));
++              (ex_flags & EXFLAG_KUSAGE),
++	      (ex_kusage & KU_CRL_SIGN));
+ 	return false;
+     }
+ #endif
+@@ -454,7 +458,6 @@ WvString WvX509Mgr::sign(WvBuf &data) const
+ {
+     assert(rsa);
+ 
+-    EVP_MD_CTX sig_ctx;
+     unsigned char sig_buf[4096];
+     
+     EVP_PKEY *pk = EVP_PKEY_new();
+@@ -467,20 +470,22 @@ WvString WvX509Mgr::sign(WvBuf &data) const
+ 	return WvString::null;
+     }
+     
+-    EVP_SignInit(&sig_ctx, EVP_sha1());
+-    EVP_SignUpdate(&sig_ctx, data.peek(0, data.used()), data.used());
++    EVP_MD_CTX *sig_ctx = EVP_MD_CTX_new();
++    EVP_SignInit(sig_ctx, EVP_sha1());
++    EVP_SignUpdate(sig_ctx, data.peek(0, data.used()), data.used());
+     unsigned int sig_len = sizeof(sig_buf);
+-    int sig_err = EVP_SignFinal(&sig_ctx, sig_buf, 
++    int sig_err = EVP_SignFinal(sig_ctx, sig_buf, 
+ 				&sig_len, pk);
+     if (sig_err != 1)
+     {
+ 	debug("Error while signing.\n");
+ 	EVP_PKEY_free(pk);
++	EVP_MD_CTX_free(sig_ctx);
+ 	return WvString::null;
+     }
+ 
+     EVP_PKEY_free(pk);
+-    EVP_MD_CTX_cleanup(&sig_ctx); // this isn't my fault ://
++    EVP_MD_CTX_free(sig_ctx); // this isn't my fault ://
+     WvDynBuf buf;
+     buf.put(sig_buf, sig_len);
+     debug("Signature size: %s\n", buf.used());
+diff --git a/include/wvdiffiehellman.h b/include/wvdiffiehellman.h
+index af75ffa..a2d001f 100644
+--- a/include/wvdiffiehellman.h
++++ b/include/wvdiffiehellman.h
+@@ -27,7 +27,7 @@ public:
+     bool create_secret(WvBuf &inbuf, size_t in_len, WvBuf& outbuf);
+ 
+ protected:
+-    struct dh_st *info;
++    DH *info;
+     BN_ULONG generator;
+ 
+ private:
+diff --git a/include/wvdigest.h b/include/wvdigest.h
+index fdc39bd..f2eed40 100644
+--- a/include/wvdigest.h
++++ b/include/wvdigest.h
+@@ -9,10 +9,8 @@
+ 
+ #include "wvencoder.h"
+ #include <stdint.h>
++#include <openssl/evp.h>
+ 
+-struct env_md_st;
+-struct env_md_ctx_st;
+-struct hmac_ctx_st;
+ 
+ /**
+  * Superclass for all message digests.
+@@ -45,8 +43,8 @@ public:
+ class WvEVPMDDigest : public WvDigest
+ {
+     friend class WvHMACDigest;
+-    const env_md_st *evpmd;
+-    env_md_ctx_st *evpctx;
++    const EVP_MD *evpmd;
++    EVP_MD_CTX *evpctx;
+     bool active;
+ 
+ public:
+@@ -54,13 +52,13 @@ public:
+     virtual size_t digestsize() const;
+ 
+ protected:
+-    WvEVPMDDigest(const env_md_st *_evpmd);
++    WvEVPMDDigest(const EVP_MD *_evpmd);
+     virtual bool _encode(WvBuf &inbuf, WvBuf &outbuf,
+         bool flush); // consumes input
+     virtual bool _finish(WvBuf &outbuf); // outputs digest
+     virtual bool _reset(); // supported: resets digest value
+     
+-    const env_md_st *getevpmd()
++    const EVP_MD *getevpmd()
+         { return evpmd; }
+ 
+ private:
+@@ -104,7 +102,7 @@ class WvHMACDigest : public WvDigest
+     WvEVPMDDigest *digest;
+     unsigned char *key;
+     size_t keysize;
+-    hmac_ctx_st *hmacctx;
++    HMAC_CTX *hmacctx;
+     bool active;
+ 
+ public:
+diff --git a/include/wvtripledes.h b/include/wvtripledes.h
+index 185fe8a..a442e7a 100644
+--- a/include/wvtripledes.h
++++ b/include/wvtripledes.h
+@@ -70,11 +70,11 @@ protected:
+ 
+ private:
+     Mode mode;
+-    des_cblock key;
+-    des_key_schedule deskey1;
+-    des_key_schedule deskey2;
+-    des_key_schedule deskey3;
+-    des_cblock ivec; // initialization vector
++    DES_cblock key;
++    DES_key_schedule deskey1;
++    DES_key_schedule deskey2;
++    DES_key_schedule deskey3;
++    DES_cblock ivec; // initialization vector
+     int ivecoff; // current offset into initvec
+ };
+ 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
index 8e4fd03298..616843d4ae 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
@@ -1,16 +1,3 @@
-Index: wvstreams-4.6.1/crypto/wvx509.cc
-===================================================================
---- wvstreams-4.6.1.orig/crypto/wvx509.cc	2011-05-20 00:02:38.119136584 +0200
-+++ wvstreams-4.6.1/crypto/wvx509.cc	2011-05-20 00:02:26.035136589 +0200
-@@ -1157,7 +1157,7 @@
-         
-         if (ext)
-         {
--            X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
-+            X509V3_EXT_METHOD *method = (X509V3_EXT_METHOD *)X509V3_EXT_get(ext);
-             if (!method)
-             {
-                 WvDynBuf buf;
 Index: wvstreams-4.6.1/ipstreams/wvunixdgsocket.cc
 ===================================================================
 --- wvstreams-4.6.1.orig/ipstreams/wvunixdgsocket.cc	2011-05-20 00:02:38.391136584 +0200
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch
new file mode 100644
index 0000000000..1c7005c2fe
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch
@@ -0,0 +1,16 @@
+Index: wvstreams-4.6.1/crypto/wvx509.cc
+===================================================================
+--- wvstreams-4.6.1.orig/crypto/wvx509.cc
++++ wvstreams-4.6.1/crypto/wvx509.cc
+@@ -1157,7 +1157,11 @@ WvString WvX509::get_extension(int nid)
+         
+         if (ext)
+         {
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++            const X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
++#else
+             X509V3_EXT_METHOD *method = X509V3_EXT_get(ext);
++#endif
+             if (!method)
+             {
+                 WvDynBuf buf;
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index e3d5e7d20b..293949d711 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -21,6 +21,8 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://0005-check-for-libexecinfo-during-configure.patch \
            file://0001-build-fix-parallel-make.patch \
            file://0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch \
+           file://openssl-buildfix.patch \
+           file://0001-Forward-port-to-OpenSSL-1.1.x.patch \
            "
 
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
-- 
2.18.0


