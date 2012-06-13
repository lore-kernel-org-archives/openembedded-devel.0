Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SedBo-0007Ne-Rn
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jun 2012 04:20:09 +0200
Received: by dalh21 with SMTP id h21so260597dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2012 19:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6RM1VpyXLalfTFQXn6pGvcg9QK7/scTnSueRpT8eKgI=;
	b=zt6Opx1MWjVETIOhW8RHG/lQ1XxcijP2Qd+bHM9AW20AJnd2n2uKx5jfGtVKDsaRxv
	XGt4f3L0YzA+5Ckdeo0eBapwzpyIt8mo7KZfWASxGkeEVZOThi4N03xhodiTokI5FKGM
	Ylzv6qBcWbIfSCKYBYFmCfH2NOhfYQq4CmEsRKEG3VBg2vKl7fFeNYCLR1jD0/S4KciQ
	ra/BTcphBPpEFuzA88nnYL0teFu6uN0w7XW1zbHd1bKbzrl674Ed3Ic2yALPIgo49QJN
	jwc/Wr29/EVPrbGkx83vN6hMxyC6btK7ZvnPcZCL4cSCSYEUPcSA5QLxq6+wbs9fNX1l
	2vkQ==
Received: by 10.68.237.202 with SMTP id ve10mr1769728pbc.54.1339553372802;
	Tue, 12 Jun 2012 19:09:32 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id qn1sm3979804pbc.9.2012.06.12.19.09.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jun 2012 19:09:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2012 19:09:13 -0700
Message-Id: <1339553354-14747-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339553354-14747-1-git-send-email-raj.khem@gmail.com>
References: <1339553354-14747-1-git-send-email-raj.khem@gmail.com>
Subject: [2011.03-maintenance][PATCH 2/3] qt4-x11-free_4.5.2.bb: Fix build break
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
X-List-Received-Date: Wed, 13 Jun 2012 02:20:09 -0000

It does not compile with gcc 4.3+ without
this patch.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/qt4/qt4-x11-free/openssl-1.0.patch |  172 ++++++++++++++++++++++++++++
 recipes/qt4/qt4-x11-free_4.5.2.bb          |    6 +-
 2 files changed, 176 insertions(+), 2 deletions(-)
 create mode 100644 recipes/qt4/qt4-x11-free/openssl-1.0.patch

diff --git a/recipes/qt4/qt4-x11-free/openssl-1.0.patch b/recipes/qt4/qt4-x11-free/openssl-1.0.patch
new file mode 100644
index 0000000..053b174
--- /dev/null
+++ b/recipes/qt4/qt4-x11-free/openssl-1.0.patch
@@ -0,0 +1,172 @@
+backported from fedora 10
+
+Fixes compile error with openssl-1.x.x
+
+| ssl/qsslsocket_openssl_symbols_p.h:257: error: variable or field 'q_sk_free' declared void
+| ssl/qsslsocket_openssl_symbols_p.h:257: error: 'STACK' was not declared in this scope
+| ssl/qsslsocket_openssl_symbols_p.h:257: error: 'a' was not declared in this scope
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: qt-x11-opensource-src-4.5.2/src/network/ssl/qsslcertificate.cpp
+===================================================================
+--- qt-x11-opensource-src-4.5.2.orig/src/network/ssl/qsslcertificate.cpp
++++ qt-x11-opensource-src-4.5.2/src/network/ssl/qsslcertificate.cpp
+@@ -362,7 +362,7 @@ QMultiMap<QSsl::AlternateNameEntryType,
+     if (!d->x509)
+         return result;
+ 
+-    STACK *altNames = (STACK *)q_X509_get_ext_d2i(d->x509, NID_subject_alt_name, 0, 0);
++    STACK_OF(GENERAL_NAME) *altNames = (STACK_OF(GENERAL_NAME) *)q_X509_get_ext_d2i(d->x509, NID_subject_alt_name, 0, 0);
+ 
+     if (altNames) {
+         for (int i = 0; i < q_sk_GENERAL_NAME_num(altNames); ++i) {
+@@ -383,7 +383,7 @@ QMultiMap<QSsl::AlternateNameEntryType,
+             else if (genName->type == GEN_EMAIL)
+                 result.insert(QSsl::EmailEntry, altName);
+         }
+-        q_sk_free(altNames);
++        q_sk_free((STACK *)altNames);
+     }
+ 
+     return result;
+Index: qt-x11-opensource-src-4.5.2/src/network/ssl/qsslsocket_openssl.cpp
+===================================================================
+--- qt-x11-opensource-src-4.5.2.orig/src/network/ssl/qsslsocket_openssl.cpp
++++ qt-x11-opensource-src-4.5.2/src/network/ssl/qsslsocket_openssl.cpp
+@@ -911,7 +911,7 @@ QSslCipher QSslSocketBackendPrivate::ses
+ {
+     if (!ssl || !ctx)
+         return QSslCipher();
+-    SSL_CIPHER *sessionCipher = q_SSL_get_current_cipher(ssl);
++    SSL_CIPHER *sessionCipher = (SSL_CIPHER *)q_SSL_get_current_cipher(ssl);
+     return sessionCipher ? QSslCipher_from_SSL_CIPHER(sessionCipher) : QSslCipher();
+ }
+ 
+Index: qt-x11-opensource-src-4.5.2/src/network/ssl/qsslsocket_openssl_symbols.cpp
+===================================================================
+--- qt-x11-opensource-src-4.5.2.orig/src/network/ssl/qsslsocket_openssl_symbols.cpp
++++ qt-x11-opensource-src-4.5.2/src/network/ssl/qsslsocket_openssl_symbols.cpp
+@@ -144,10 +144,10 @@ DEFINEFUNC(int, RAND_status, void, DUMMY
+ DEFINEFUNC(void, RSA_free, RSA *a, a, return, DUMMYARG)
+ DEFINEFUNC(void, sk_free, STACK *a, a, return, DUMMYARG)
+ DEFINEFUNC(int, sk_num, STACK *a, a, return -1, return)
+-DEFINEFUNC2(char *, sk_value, STACK *a, a, int b, b, return 0, return)
++DEFINEFUNC2(OSSL_SKVALUE_RTYPE *, sk_value, STACK *a, a, int b, b, return 0, return)
+ DEFINEFUNC(int, SSL_accept, SSL *a, a, return -1, return)
+ DEFINEFUNC(int, SSL_clear, SSL *a, a, return -1, return)
+-DEFINEFUNC3(char *, SSL_CIPHER_description, SSL_CIPHER *a, a, char *b, b, int c, c, return 0, return)
++DEFINEFUNC3(char *, SSL_CIPHER_description, OSSL_MORECONST SSL_CIPHER *a, a, char *b, b, int c, c, return 0, return)
+ DEFINEFUNC(int, SSL_connect, SSL *a, a, return -1, return)
+ #if OPENSSL_VERSION_NUMBER >= 0x00908000L
+ // 0.9.8 broke SC and BC by changing this function's signature.
+@@ -157,7 +157,7 @@ DEFINEFUNC(int, SSL_CTX_check_private_ke
+ #endif
+ DEFINEFUNC4(long, SSL_CTX_ctrl, SSL_CTX *a, a, int b, b, long c, c, void *d, d, return -1, return)
+ DEFINEFUNC(void, SSL_CTX_free, SSL_CTX *a, a, return, DUMMYARG)
+-DEFINEFUNC(SSL_CTX *, SSL_CTX_new, SSL_METHOD *a, a, return 0, return)
++DEFINEFUNC(SSL_CTX *, SSL_CTX_new, OSSL_MORECONST SSL_METHOD *a, a, return 0, return)
+ DEFINEFUNC2(int, SSL_CTX_set_cipher_list, SSL_CTX *a, a, const char *b, b, return -1, return)
+ DEFINEFUNC(int, SSL_CTX_set_default_verify_paths, SSL_CTX *a, a, return -1, return)
+ DEFINEFUNC3(void, SSL_CTX_set_verify, SSL_CTX *a, a, int b, b, int (*c)(int, X509_STORE_CTX *), c, return, DUMMYARG)
+@@ -174,7 +174,7 @@ DEFINEFUNC(STACK_OF(SSL_CIPHER) *, SSL_g
+ #else
+ DEFINEFUNC(STACK_OF(SSL_CIPHER) *, SSL_get_ciphers, SSL *a, a, return 0, return)
+ #endif
+-DEFINEFUNC(SSL_CIPHER *, SSL_get_current_cipher, SSL *a, a, return 0, return)
++DEFINEFUNC(OSSL_MORECONST SSL_CIPHER *, SSL_get_current_cipher, SSL *a, a, return 0, return)
+ DEFINEFUNC2(int, SSL_get_error, SSL *a, a, int b, b, return -1, return)
+ DEFINEFUNC(STACK_OF(X509) *, SSL_get_peer_cert_chain, SSL *a, a, return 0, return)
+ DEFINEFUNC(X509 *, SSL_get_peer_certificate, SSL *a, a, return 0, return)
+@@ -192,14 +192,14 @@ DEFINEFUNC3(void, SSL_set_bio, SSL *a, a
+ DEFINEFUNC(void, SSL_set_accept_state, SSL *a, a, return, DUMMYARG)
+ DEFINEFUNC(void, SSL_set_connect_state, SSL *a, a, return, DUMMYARG)
+ DEFINEFUNC(int, SSL_shutdown, SSL *a, a, return -1, return)
+-DEFINEFUNC(SSL_METHOD *, SSLv2_client_method, DUMMYARG, DUMMYARG, return 0, return)
+-DEFINEFUNC(SSL_METHOD *, SSLv3_client_method, DUMMYARG, DUMMYARG, return 0, return)
+-DEFINEFUNC(SSL_METHOD *, SSLv23_client_method, DUMMYARG, DUMMYARG, return 0, return)
+-DEFINEFUNC(SSL_METHOD *, TLSv1_client_method, DUMMYARG, DUMMYARG, return 0, return)
+-DEFINEFUNC(SSL_METHOD *, SSLv2_server_method, DUMMYARG, DUMMYARG, return 0, return)
+-DEFINEFUNC(SSL_METHOD *, SSLv3_server_method, DUMMYARG, DUMMYARG, return 0, return)
+-DEFINEFUNC(SSL_METHOD *, SSLv23_server_method, DUMMYARG, DUMMYARG, return 0, return)
+-DEFINEFUNC(SSL_METHOD *, TLSv1_server_method, DUMMYARG, DUMMYARG, return 0, return)
++DEFINEFUNC(OSSL_MORECONST SSL_METHOD *, SSLv2_client_method, DUMMYARG, DUMMYARG, return 0, return)
++DEFINEFUNC(OSSL_MORECONST SSL_METHOD *, SSLv3_client_method, DUMMYARG, DUMMYARG, return 0, return)
++DEFINEFUNC(OSSL_MORECONST SSL_METHOD *, SSLv23_client_method, DUMMYARG, DUMMYARG, return 0, return)
++DEFINEFUNC(OSSL_MORECONST SSL_METHOD *, TLSv1_client_method, DUMMYARG, DUMMYARG, return 0, return)
++DEFINEFUNC(OSSL_MORECONST SSL_METHOD *, SSLv2_server_method, DUMMYARG, DUMMYARG, return 0, return)
++DEFINEFUNC(OSSL_MORECONST SSL_METHOD *, SSLv3_server_method, DUMMYARG, DUMMYARG, return 0, return)
++DEFINEFUNC(OSSL_MORECONST SSL_METHOD *, SSLv23_server_method, DUMMYARG, DUMMYARG, return 0, return)
++DEFINEFUNC(OSSL_MORECONST SSL_METHOD *, TLSv1_server_method, DUMMYARG, DUMMYARG, return 0, return)
+ DEFINEFUNC3(int, SSL_write, SSL *a, a, const void *b, b, int c, c, return -1, return)
+ DEFINEFUNC2(int, X509_cmp, X509 *a, a, X509 *b, b, return -1, return)
+ #ifndef SSLEAY_MACROS
+Index: qt-x11-opensource-src-4.5.2/src/network/ssl/qsslsocket_openssl_symbols_p.h
+===================================================================
+--- qt-x11-opensource-src-4.5.2.orig/src/network/ssl/qsslsocket_openssl_symbols_p.h
++++ qt-x11-opensource-src-4.5.2/src/network/ssl/qsslsocket_openssl_symbols_p.h
+@@ -254,12 +254,20 @@ int q_PEM_write_bio_RSA_PUBKEY(BIO *a, R
+ void q_RAND_seed(const void *a, int b);
+ int q_RAND_status();
+ void q_RSA_free(RSA *a);
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++#define STACK _STACK
++#define OSSL_SKVALUE_RTYPE void
++#define OSSL_MORECONST const
++#else
++#define OSSL_SKVALUE_RTYPE char
++#define OSSL_MORECONST
++#endif
+ void q_sk_free(STACK *a);
+ int q_sk_num(STACK *a);
+-char * q_sk_value(STACK *a, int b);
++OSSL_SKVALUE_RTYPE * q_sk_value(STACK *a, int b);
+ int q_SSL_accept(SSL *a);
+ int q_SSL_clear(SSL *a);
+-char *q_SSL_CIPHER_description(SSL_CIPHER *a, char *b, int c);
++char *q_SSL_CIPHER_description(OSSL_MORECONST SSL_CIPHER *a, char *b, int c);
+ int q_SSL_connect(SSL *a);
+ #if OPENSSL_VERSION_NUMBER >= 0x00908000L
+ // 0.9.8 broke SC and BC by changing this function's signature.
+@@ -269,7 +277,7 @@ int q_SSL_CTX_check_private_key(SSL_CTX
+ #endif
+ long q_SSL_CTX_ctrl(SSL_CTX *a, int b, long c, void *d);
+ void q_SSL_CTX_free(SSL_CTX *a);
+-SSL_CTX *q_SSL_CTX_new(SSL_METHOD *a);
++SSL_CTX *q_SSL_CTX_new(OSSL_MORECONST SSL_METHOD *a);
+ int q_SSL_CTX_set_cipher_list(SSL_CTX *a, const char *b);
+ int q_SSL_CTX_set_default_verify_paths(SSL_CTX *a);
+ void q_SSL_CTX_set_verify(SSL_CTX *a, int b, int (*c)(int, X509_STORE_CTX *));
+@@ -286,7 +294,7 @@ STACK_OF(SSL_CIPHER) *q_SSL_get_ciphers(
+ #else
+ STACK_OF(SSL_CIPHER) *q_SSL_get_ciphers(SSL *a);
+ #endif
+-SSL_CIPHER *q_SSL_get_current_cipher(SSL *a);
++OSSL_MORECONST SSL_CIPHER *q_SSL_get_current_cipher(SSL *a);
+ int q_SSL_get_error(SSL *a, int b);
+ STACK_OF(X509) *q_SSL_get_peer_cert_chain(SSL *a);
+ X509 *q_SSL_get_peer_certificate(SSL *a);
+@@ -304,14 +312,14 @@ void q_SSL_set_bio(SSL *a, BIO *b, BIO *
+ void q_SSL_set_accept_state(SSL *a);
+ void q_SSL_set_connect_state(SSL *a);
+ int q_SSL_shutdown(SSL *a);
+-SSL_METHOD *q_SSLv2_client_method();
+-SSL_METHOD *q_SSLv3_client_method();
+-SSL_METHOD *q_SSLv23_client_method();
+-SSL_METHOD *q_TLSv1_client_method();
+-SSL_METHOD *q_SSLv2_server_method();
+-SSL_METHOD *q_SSLv3_server_method();
+-SSL_METHOD *q_SSLv23_server_method();
+-SSL_METHOD *q_TLSv1_server_method();
++OSSL_MORECONST SSL_METHOD *q_SSLv2_client_method();
++OSSL_MORECONST SSL_METHOD *q_SSLv3_client_method();
++OSSL_MORECONST SSL_METHOD *q_SSLv23_client_method();
++OSSL_MORECONST SSL_METHOD *q_TLSv1_client_method();
++OSSL_MORECONST SSL_METHOD *q_SSLv2_server_method();
++OSSL_MORECONST SSL_METHOD *q_SSLv3_server_method();
++OSSL_MORECONST SSL_METHOD *q_SSLv23_server_method();
++OSSL_MORECONST SSL_METHOD *q_TLSv1_server_method();
+ int q_SSL_write(SSL *a, const void *b, int c);
+ int q_X509_cmp(X509 *a, X509 *b);
+ #ifdef SSLEAY_MACROS
diff --git a/recipes/qt4/qt4-x11-free_4.5.2.bb b/recipes/qt4/qt4-x11-free_4.5.2.bb
index b545dea..2cf651f 100644
--- a/recipes/qt4/qt4-x11-free_4.5.2.bb
+++ b/recipes/qt4/qt4-x11-free_4.5.2.bb
@@ -1,8 +1,10 @@
 require qt4-x11-free.inc
 LICENSE = "LGPLv2.1 GPLv3"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
-SRC_URI += "file://hack-out-pg_config.patch"
+SRC_URI += "file://hack-out-pg_config.patch \
+            file://openssl-1.0.patch \
+           "
 
 SRC_URI[md5sum] = "d8bcc070a58db25c228b7729ffad4550"
 SRC_URI[sha256sum] = "4e4c8619335cac14ba0c52d1555fab549a562fb774c1c08dcbd2be9de38120a2"
-- 
1.7.9.5



