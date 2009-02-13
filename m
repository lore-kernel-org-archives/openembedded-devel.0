Received: from [209.85.218.213] (helo=mail-bw0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LXx09-0001ld-SV
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 13:18:37 +0100
Received: by bwz9 with SMTP id 9so1573215bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 04:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=h8x+jjEnbq0aBsbSaasQ9ZRt1BAr+ZQYrv9n7n5Sf8c=;
	b=VUYbIE0MYxlLJSjMRSrv7u86JeOjNyY7R4P4LVC798OlfzeGlJj9jiEzFcGeB8QD5B
	Saxmnx9Bvobv77HYbIYog4iOVFrAka/05FPYl8KQ8UNWZHw53WBgfioSWYwAk2R7MBMB
	PbgU7JV4yGcBcLbzaQxoFf1mJ6D9UVhDcLTxg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=uzoGShhbYe/3ZASXJnyLF+IqUzbt3Tb8Y5xsiJbwVk1MBvEH8LL4i9blBDSMnAp7HF
	MAq7eeR3LCW/qm0hsLVM8N0Mkt5cMiBk/VJ2s1xgWjBpUxcerovM5C+EdatrtlizZleX
	/sXuzFPWBfViYpqBor+fgbpdaNQEeMWLKDfXw=
Received: by 10.223.103.207 with SMTP id l15mr1514603fao.2.1234527430879;
	Fri, 13 Feb 2009 04:17:10 -0800 (PST)
Received: from ?10.6.26.234? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id g30sm23420855ugd.26.2009.02.13.04.17.09
	(version=SSLv3 cipher=RC4-MD5); Fri, 13 Feb 2009 04:17:10 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2009 14:17:08 +0200
Message-Id: <1234527428.24574.2.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] Fixed ruby 1.8.5 compilation problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2009 12:18:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Backported openssl fix from 1.8.7 for successfull ruby 1.8.5
compilation.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 packages/ruby/files/openssl.patch |  156 +++++++++++++++++++++++++++++++++++++
 packages/ruby/ruby.inc            |    1 +
 2 files changed, 157 insertions(+), 0 deletions(-)
 create mode 100644 packages/ruby/files/openssl.patch

diff --git a/packages/ruby/files/openssl.patch b/packages/ruby/files/openssl.patch
new file mode 100644
index 0000000..9de37ef
--- /dev/null
+++ b/packages/ruby/files/openssl.patch
@@ -0,0 +1,156 @@
+This patch backports changes from ruby 1.8.7 which only includes the
+openssl prototypes for functions that are not in the system openssl
+library.
+
+diff -u ruby-1.8.5.orig/ext/openssl/extconf.rb ruby-1.8.5/ext/openssl/extconf.rb
+--- ruby-1.8.5.orig/ext/openssl/openssl_missing.c	2007-02-13 00:01:19.000000000 +0100
++++ ruby-1.8.5/ext/openssl/openssl_missing.c	2008-05-19 05:00:52.000000000 +0200
+@@ -22,17 +22,15 @@
+ #include "openssl_missing.h"
+ 
+ #if !defined(HAVE_HMAC_CTX_COPY)
+-int
++void
+ HMAC_CTX_copy(HMAC_CTX *out, HMAC_CTX *in)
+ {
+-    if (!out || !in) return 0;
++    if (!out || !in) return;
+     memcpy(out, in, sizeof(HMAC_CTX));
+ 
+-    if (!EVP_MD_CTX_copy(&out->md_ctx, &in->md_ctx)
+-	    || !EVP_MD_CTX_copy(&out->i_ctx, &in->i_ctx)
+-	    || !EVP_MD_CTX_copy(&out->o_ctx, &in->o_ctx))
+-	return 0;
+-    return 1;
++    EVP_MD_CTX_copy(&out->md_ctx, &in->md_ctx);
++    EVP_MD_CTX_copy(&out->i_ctx, &in->i_ctx);
++    EVP_MD_CTX_copy(&out->o_ctx, &in->o_ctx);
+ }
+ #endif /* HAVE_HMAC_CTX_COPY */
+ #endif /* NO_HMAC */
+diff -u ruby-1.8.5.orig/ext/openssl/openssl_missing.h ruby-1.8.5/ext/openssl/openssl_missing.h
+--- ruby-1.8.5.orig/ext/openssl/openssl_missing.h	2008-08-04 06:43:34.000000000 +0200
++++ ruby-1.8.5/ext/openssl/openssl_missing.h	2008-08-04 06:44:17.000000000 +0200
+@@ -60,14 +60,33 @@
+ 	(char *(*)())d2i_PKCS7_RECIP_INFO, (char *)ri)
+ #endif
+ 
++#if !defined(HAVE_EVP_MD_CTX_INIT)
+ void HMAC_CTX_init(HMAC_CTX *ctx);
+-int HMAC_CTX_copy(HMAC_CTX *out, HMAC_CTX *in);
++#endif
++
++#if !defined(HAVE_HMAC_CTX_COPY)
++void HMAC_CTX_copy(HMAC_CTX *out, HMAC_CTX *in);
++#endif
++
++#if !defined(HAVE_HMAC_CTX_CLEANUP)
+ void HMAC_CTX_cleanup(HMAC_CTX *ctx);
++#endif
+ 
++#if !defined(HAVE_EVP_MD_CTX_CREATE)
+ EVP_MD_CTX *EVP_MD_CTX_create(void);
++#endif
++
++#if !defined(HAVE_EVP_MD_CTX_INIT)
+ void EVP_MD_CTX_init(EVP_MD_CTX *ctx);
++#endif
++
++#if !defined(HAVE_EVP_MD_CTX_CLEANUP)
+ int EVP_MD_CTX_cleanup(EVP_MD_CTX *ctx);
++#endif
++
++#if !defined(HAVE_EVP_MD_CTX_DESTROY)
+ void EVP_MD_CTX_destroy(EVP_MD_CTX *ctx);
++#endif
+ 
+ #if !defined(HAVE_EVP_CIPHER_CTX_COPY)
+ int EVP_CIPHER_CTX_copy(EVP_CIPHER_CTX *out, EVP_CIPHER_CTX *in);
+@@ -111,19 +130,54 @@
+ #define OPENSSL_cleanse(p, l) memset(p, 0, l)
+ #endif
+ 
++#if !defined(HAVE_X509_STORE_SET_EX_DATA)
+ void *X509_STORE_get_ex_data(X509_STORE *str, int idx);
+ int X509_STORE_set_ex_data(X509_STORE *str, int idx, void *data);
++#endif
++
++#if !defined(HAVE_X509_CRL_SET_VERSION)
+ int X509_CRL_set_version(X509_CRL *x, long version);
++#endif
++
++#if !defined(HAVE_X509_CRL_SET_ISSUER_NAME)
+ int X509_CRL_set_issuer_name(X509_CRL *x, X509_NAME *name);
++#endif
++
++#if !defined(HAVE_X509_CRL_SORT)
+ int X509_CRL_sort(X509_CRL *c);
++#endif
++
++#if !defined(HAVE_X509_CRL_ADD0_REVOKED)
+ int X509_CRL_add0_revoked(X509_CRL *crl, X509_REVOKED *rev);
++#endif
++
++#if !defined(HAVE_BN_MOD_SQR)
+ int BN_mod_sqr(BIGNUM *r, const BIGNUM *a, const BIGNUM *m, BN_CTX *ctx);
++#endif
++
++#if !defined(HAVE_BN_MOD_ADD)
+ int BN_mod_add(BIGNUM *r, const BIGNUM *a, const BIGNUM *b, const BIGNUM *m, BN_CTX *ctx);
++#endif
++
++#if !defined(HAVE_BN_MOD_SUB)
+ int BN_mod_sub(BIGNUM *r, const BIGNUM *a, const BIGNUM *b, const BIGNUM *m, BN_CTX *ctx);
++#endif
++
++#if !defined(HAVE_BN_RAND_RANGE)
+ int BN_rand_range(BIGNUM *r, BIGNUM *range);
++#endif
++
++#if !defined(HAVE_BN_PSEUDO_RAND_RANGE)
+ int BN_pseudo_rand_range(BIGNUM *r, BIGNUM *range);
++#endif
++
++#if !defined(HAVE_CONF_GET1_DEFAULT_CONFIG_FILE)
+ char *CONF_get1_default_config_file(void);
++#endif
++
++#if !defined(HAVE_PEM_DEF_CALLBACK)
+ int PEM_def_callback(char *buf, int num, int w, void *key);
++#endif
+ 
+ #if defined(__cplusplus)
+ }
+diff -u ruby-1.8.5.orig/ext/openssl/ossl_hmac.c ruby-1.8.5/ext/openssl/ossl_hmac.c
+--- ruby-1.8.5.orig/ext/openssl/ossl_hmac.c	2007-03-12 05:12:32.000000000 +0100
++++ ruby-1.8.5/ext/openssl/ossl_hmac.c	2008-05-19 05:00:52.000000000 +0200
+@@ -81,12 +87,15 @@
+     GetHMAC(self, ctx1);
+     SafeGetHMAC(other, ctx2);
+ 
+-    if (!HMAC_CTX_copy(ctx1, ctx2)) {
+-	ossl_raise(eHMACError, NULL);
+-    }
++    HMAC_CTX_copy(ctx1, ctx2);
+     return self;
+ }
+ 
++/*
++ *  call-seq:
++ *     hmac.update(string) -> self
++ *
++ */
+ static VALUE
+ ossl_hmac_update(VALUE self, VALUE data)
+ {
+@@ -104,9 +113,7 @@
+ {
+     HMAC_CTX final;
+ 
+-    if (!HMAC_CTX_copy(&final, ctx)) {
+-	ossl_raise(eHMACError, NULL);
+-    }
++    HMAC_CTX_copy(&final, ctx);
+     if (!(*buf = OPENSSL_malloc(HMAC_size(&final)))) {
+ 	HMAC_CTX_cleanup(&final);
+ 	OSSL_Debug("Allocating %d mem", HMAC_size(&final));
diff --git a/packages/ruby/ruby.inc b/packages/ruby/ruby.inc
index 9fe8333..978bf4b 100644
--- a/packages/ruby/ruby.inc
+++ b/packages/ruby/ruby.inc
@@ -6,6 +6,7 @@ LICENSE = "GPL"
 
 SRC_URI = "ftp://ftp.ruby-lang.org/pub/ruby/ruby-${PV}.tar.gz \
            file://extmk_run.patch;patch=1 \
+           file://openssl.patch;patch=1 \
            file://disable_wide_getaddrinfo_check.patch;patch=1"
 
 S = "${WORKDIR}/ruby-${PV}"
-- 
1.5.6.3




