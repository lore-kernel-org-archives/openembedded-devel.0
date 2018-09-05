Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7E45F79034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:33 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id b30-v6so1583959pla.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CvFeAWXQj17d3zjCDnp+7uWIzscsBUHToancjiL6tP4=;
	b=LrZy/I7I5/vB6+chVFcrXfOwUzNIiBHCF3y+Lk2JbD08POLzBklzzwGZOTLIdmozd8
	AX5NFDguwyrj7l2BnNiTOMleTMXo72nuQYuAz3hGkj/6K7SLmZrZLJ/t32EdSVmZbLO+
	zhSR24JDpZ4PaCRDhqt9pbJTkDM8j3yHngH+h4IPN9PZiv+RLRn2+sQRKK0W6LehXkTa
	N//6mT6xUvneBS5x6yASDp4QEUxrc9b5BGEI7+nAcF5LA8d778OjESBjKtYe3+Uk+rqV
	NaYfXHOwLmAPIGjWKBi9blZ6Hiws7LvB7rlDwm2Y5CPk17ZdukkOn8ek0L3+J3NUUun2
	ICWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CvFeAWXQj17d3zjCDnp+7uWIzscsBUHToancjiL6tP4=;
	b=TUULaXYcPFrD27tJItheB+TYXbVHNuYr/aC33rE1svWdthzeuyXc+YiVoCSeDpiOuA
	DlOpmWLYlJY429Y8i7itvv5y15VME7B2nD5u7k+fz10DId9CVlb3IXW/kdLRGKNiJMIz
	jEA6NEGTYPolaRIyG7QQkANUOuDxneNxgDqM8zrAzShtdYHm6vrhoBMheUSVXelNm+wg
	zW/nhOY+QVf3kX2gD4Q7p/fLZ2nnXfTgnxmF7nKdAAiBScooapIUWFfwFpRrmaiZyjgC
	Ikl4CpUUVxMsArUnPG5LB4IY2qW3NtGr21raNp0PcAIL5BhEP4H6OyjyPuw2FbRdweay
	R9+Q==
X-Gm-Message-State: APzg51BKtdVNhmT1dMFy0teppC/jzCA6C3Rc67Z9GNHeZ5oanaZQEm1X
	c7k28mSlGBExzNz73Di3LJ+ex+hc
X-Google-Smtp-Source: ANB0VdauYti0lL6SsYP+nVAWkoYYX8Oo9bFgs9SpfBIhRNvqOF+LxOTINUBJ/EZAYqAd5y/oCO5Msg==
X-Received: by 2002:a17:902:82c5:: with SMTP id
	u5-v6mr40421835plz.83.1536181354231; 
	Wed, 05 Sep 2018 14:02:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:15 -0700
Message-Id: <20180905210224.21225-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/12] openwsman: Upgrade to 2.6.5
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:33 -0000

* Backport patches to fix build with OpenSSL 1.1.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Port-to-OpenSSL-1.1.0.patch          | 162 ++++++++++++++++++
 ...rsion-number-to-allow-builds-with-ol.patch |  48 ++++++
 ...{openwsman_2.6.4.bb => openwsman_2.6.5.bb} |   7 +-
 3 files changed, 215 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0001-Port-to-OpenSSL-1.1.0.patch
 create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.4.bb => openwsman_2.6.5.bb} (92%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-Port-to-OpenSSL-1.1.0.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-Port-to-OpenSSL-1.1.0.patch
new file mode 100644
index 0000000000..49afa56f56
--- /dev/null
+++ b/meta-oe/recipes-extended/openwsman/openwsman/0001-Port-to-OpenSSL-1.1.0.patch
@@ -0,0 +1,162 @@
+From f78643d2388dd0697f83f17880403253a0596d83 Mon Sep 17 00:00:00 2001
+From: Vitezslav Crhonek <vcrhonek@redhat.com>
+Date: Wed, 5 Sep 2018 11:23:46 -0700
+Subject: [PATCH 1/2] Port to OpenSSL 1.1.0
+
+Upstream-Status: Submitted [https://github.com/Openwsman/openwsman/pull/99]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/wsman-curl-client-transport.c |  6 +++-
+ src/server/shttpd/io_ssl.c            | 17 ----------
+ src/server/shttpd/shttpd.c            | 20 ++++--------
+ src/server/shttpd/ssl.h               | 46 ---------------------------
+ 4 files changed, 12 insertions(+), 77 deletions(-)
+
+diff --git a/src/lib/wsman-curl-client-transport.c b/src/lib/wsman-curl-client-transport.c
+index cd7f517a..e64ad097 100644
+--- a/src/lib/wsman-curl-client-transport.c
++++ b/src/lib/wsman-curl-client-transport.c
+@@ -241,12 +241,16 @@ write_handler( void *ptr, size_t size, size_t nmemb, void *data)
+ static int ssl_certificate_thumbprint_verify_callback(X509_STORE_CTX *ctx, void *arg)
+ {
+ 	unsigned char *thumbprint = (unsigned char *)arg;
+-	X509 *cert = ctx->cert;
+ 	EVP_MD                                  *tempDigest;
+ 
+ 	unsigned char   tempFingerprint[EVP_MAX_MD_SIZE];
+ 	unsigned int      tempFingerprintLen;
+ 	tempDigest = (EVP_MD*)EVP_sha1( );
++
++	X509 *cert = X509_STORE_CTX_get_current_cert(ctx);
++	if(!cert)
++		return 0;
++
+ 	if ( X509_digest(cert, tempDigest, tempFingerprint, &tempFingerprintLen ) <= 0)
+ 		return 0;
+ 	if(!memcmp(tempFingerprint, thumbprint, tempFingerprintLen))
+diff --git a/src/server/shttpd/io_ssl.c b/src/server/shttpd/io_ssl.c
+index 6de0db2a..7ac669e4 100644
+--- a/src/server/shttpd/io_ssl.c
++++ b/src/server/shttpd/io_ssl.c
+@@ -11,23 +11,6 @@
+ #include "defs.h"
+ 
+ #if !defined(NO_SSL)
+-struct ssl_func	ssl_sw[] = {
+-	{"SSL_free",			{0}},
+-	{"SSL_accept",			{0}},
+-	{"SSL_connect",			{0}},
+-	{"SSL_read",			{0}},
+-	{"SSL_write",			{0}},
+-	{"SSL_get_error",		{0}},
+-	{"SSL_set_fd",			{0}},
+-	{"SSL_new",			{0}},
+-	{"SSL_CTX_new",			{0}},
+-	{"SSLv23_server_method",	{0}},
+-	{"SSL_library_init",		{0}},
+-	{"SSL_CTX_use_PrivateKey_file",	{0}},
+-	{"SSL_CTX_use_certificate_file",{0}},
+-	{NULL,				{0}}
+-};
+-
+ void
+ _shttpd_ssl_handshake(struct stream *stream)
+ {
+diff --git a/src/server/shttpd/shttpd.c b/src/server/shttpd/shttpd.c
+index 5876392e..4c1dbf32 100644
+--- a/src/server/shttpd/shttpd.c
++++ b/src/server/shttpd/shttpd.c
+@@ -1476,20 +1476,14 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
+ 	int		retval = FALSE;
+ 	EC_KEY*		key;
+ 
+-	/* Load SSL library dynamically */
+-	if ((lib = dlopen(SSL_LIB, RTLD_LAZY)) == NULL) {
+-		_shttpd_elog(E_LOG, NULL, "set_ssl: cannot load %s", SSL_LIB);
+-		return (FALSE);
+-	}
+-
+-	for (fp = ssl_sw; fp->name != NULL; fp++)
+-		if ((fp->ptr.v_void = dlsym(lib, fp->name)) == NULL) {
+-			_shttpd_elog(E_LOG, NULL,"set_ssl: cannot find %s", fp->name);
+-			return (FALSE);
+-		}
+-
+ 	/* Initialize SSL crap */
++	debug("Initialize SSL");
++	SSL_load_error_strings();
++	#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	SSL_library_init();
++	#else
++	OPENSSL_init_ssl(0, NULL);
++	#endif
+ 
+ 	if ((CTX = SSL_CTX_new(SSLv23_server_method())) == NULL)
+ 		_shttpd_elog(E_LOG, NULL, "SSL_CTX_new error");
+@@ -1532,7 +1526,7 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
+ 			if (strncasecmp(protocols[idx].name, ssl_disabled_protocols, blank_ptr-ssl_disabled_protocols) == 0) {
+ 				//_shttpd_elog(E_LOG, NULL, "SSL: disable %s protocol", protocols[idx].name);
+ 				debug("SSL: disable %s protocol", protocols[idx].name);
+-				SSL_CTX_ctrl(CTX, SSL_CTRL_OPTIONS, protocols[idx].opt, NULL);
++				SSL_CTX_set_options(CTX, protocols[idx].opt);
+ 				break;
+ 			}
+ 		}
+diff --git a/src/server/shttpd/ssl.h b/src/server/shttpd/ssl.h
+index a863f2c7..8dad0109 100644
+--- a/src/server/shttpd/ssl.h
++++ b/src/server/shttpd/ssl.h
+@@ -12,50 +12,4 @@
+ 
+ #include <openssl/ssl.h>
+ 
+-#else
+-
+-/*
+- * Snatched from OpenSSL includes. I put the prototypes here to be independent
+- * from the OpenSSL source installation. Having this, shttpd + SSL can be
+- * built on any system with binary SSL libraries installed.
+- */
+-
+-typedef struct ssl_st SSL;
+-typedef struct ssl_method_st SSL_METHOD;
+-typedef struct ssl_ctx_st SSL_CTX;
+-
+-#define	SSL_ERROR_WANT_READ	2
+-#define	SSL_ERROR_WANT_WRITE	3
+-#define	SSL_ERROR_SYSCALL	5
+-#define	SSL_FILETYPE_PEM	1
+-
+ #endif
+-
+-/*
+- * Dynamically loaded SSL functionality
+- */
+-struct ssl_func {
+-	const char	*name;		/* SSL function name	*/
+-	union variant	ptr;		/* Function pointer	*/
+-};
+-
+-extern struct ssl_func	ssl_sw[];
+-
+-#define	FUNC(x)	ssl_sw[x].ptr.v_func
+-
+-#define	SSL_free(x)	(* (void (*)(SSL *)) FUNC(0))(x)
+-#define	SSL_accept(x)	(* (int (*)(SSL *)) FUNC(1))(x)
+-#define	SSL_connect(x)	(* (int (*)(SSL *)) FUNC(2))(x)
+-#define	SSL_read(x,y,z)	(* (int (*)(SSL *, void *, int)) FUNC(3))((x),(y),(z))
+-#define	SSL_write(x,y,z) \
+-	(* (int (*)(SSL *, const void *,int)) FUNC(4))((x), (y), (z))
+-#define	SSL_get_error(x,y)(* (int (*)(SSL *, int)) FUNC(5))((x), (y))
+-#define	SSL_set_fd(x,y)	(* (int (*)(SSL *, int)) FUNC(6))((x), (y))
+-#define	SSL_new(x)	(* (SSL * (*)(SSL_CTX *)) FUNC(7))(x)
+-#define	SSL_CTX_new(x)	(* (SSL_CTX * (*)(SSL_METHOD *)) FUNC(8))(x)
+-#define	SSLv23_server_method()	(* (SSL_METHOD * (*)(void)) FUNC(9))()
+-#define	SSL_library_init() (* (int (*)(void)) FUNC(10))()
+-#define	SSL_CTX_use_PrivateKey_file(x,y,z)	(* (int (*)(SSL_CTX *, \
+-		const char *, int)) FUNC(11))((x), (y), (z))
+-#define	SSL_CTX_use_certificate_file(x,y,z)	(* (int (*)(SSL_CTX *, \
+-		const char *, int)) FUNC(12))((x), (y), (z))
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch b/meta-oe/recipes-extended/openwsman/openwsman/0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch
new file mode 100644
index 0000000000..5ae2e0006e
--- /dev/null
+++ b/meta-oe/recipes-extended/openwsman/openwsman/0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch
@@ -0,0 +1,48 @@
+From 75669b077bd54bedbc086c60cbe137e7f4c685b5 Mon Sep 17 00:00:00 2001
+From: Vitezslav Crhonek <vcrhonek@redhat.com>
+Date: Mon, 24 Apr 2017 11:28:39 +0200
+Subject: [PATCH 2/2] Check OpenSSL version number to allow builds with older
+ version
+
+Upstream-Status: Submitted [https://github.com/Openwsman/openwsman/pull/99]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/wsman-curl-client-transport.c | 4 ++++
+ src/server/shttpd/shttpd.c            | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/src/lib/wsman-curl-client-transport.c b/src/lib/wsman-curl-client-transport.c
+index e64ad097..4fc047e8 100644
+--- a/src/lib/wsman-curl-client-transport.c
++++ b/src/lib/wsman-curl-client-transport.c
+@@ -247,7 +247,11 @@ static int ssl_certificate_thumbprint_verify_callback(X509_STORE_CTX *ctx, void
+ 	unsigned int      tempFingerprintLen;
+ 	tempDigest = (EVP_MD*)EVP_sha1( );
+ 
++	#if OPENSSL_VERSION_NUMBER < 0x10100000L
++	X509 *cert = ctx->cert;
++	#else
+ 	X509 *cert = X509_STORE_CTX_get_current_cert(ctx);
++	#endif
+ 	if(!cert)
+ 		return 0;
+ 
+diff --git a/src/server/shttpd/shttpd.c b/src/server/shttpd/shttpd.c
+index 4c1dbf32..161720c8 100644
+--- a/src/server/shttpd/shttpd.c
++++ b/src/server/shttpd/shttpd.c
+@@ -1526,7 +1526,11 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
+ 			if (strncasecmp(protocols[idx].name, ssl_disabled_protocols, blank_ptr-ssl_disabled_protocols) == 0) {
+ 				//_shttpd_elog(E_LOG, NULL, "SSL: disable %s protocol", protocols[idx].name);
+ 				debug("SSL: disable %s protocol", protocols[idx].name);
++				#if OPENSSL_VERSION_NUMBER < 0x10100000L
++				SSL_CTX_ctrl(CTX, SSL_CTRL_OPTIONS, protocols[idx].opt, NULL);
++				#else
+ 				SSL_CTX_set_options(CTX, protocols[idx].opt);
++				#endif
+ 				break;
+ 			}
+ 		}
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.4.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.5.bb
similarity index 92%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.4.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.5.bb
index f46a3bd25c..5fba3855c0 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.4.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.5.bb
@@ -15,13 +15,15 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "4aff7eaf5df948b6ed74cf4f8dd721a397bfb759"
-PV = "2.6.4"
+SRCREV = "e90e5c96e3006c372bf45e0185e33c9250e67df6"
+PV = "2.6.5"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service \
            file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
+           file://0001-Port-to-OpenSSL-1.1.0.patch \
+           file://0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -68,3 +70,4 @@ FILES_${PN}-dbg += "${libdir}/openwsman/plugins/.debug/ \
                    "
 
 INSANE_SKIP_${PN} = "dev-so"
+RDEPENDS_${PN} = "ruby"
-- 
2.18.0


