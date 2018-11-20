Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id F24766B8AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:38:22 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id v1-v6so1994931plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nYIpz/9ZtLFn9vmqXnooGyWrgpfOm2Zqe07ZeI7zjGo=;
	b=u14Hdsh9M2NKLtA8acXVk8C22M6CTaOOpQqJ3jTZrlC5Cf2PqnFNIcICXFqB6F9/UA
	F3kl1YfAYjjJOfaBNBRb11k7TAnhArAIUlFpXWmN2Q/e3KHpp/1MVV+XpJQ2bd1yGUb3
	uOLW7ptGo0BZqmYvA9P46hO77Z92lh9EL8ZHBNSsXOH0SGpy2RK0BmhKjXkQQknq+E7E
	KK7VO7tH6bCNdLBHeC2rUSDNIuYlvJz4v34Z0ml8C4vCYW2x1mtJ37wyHz6xGASpyMtx
	XqylfYDhmjybCBXRUwSdd9YbYZoNulpHhq+2B3WzCf6POXpWX0jPAblX4tTB78zVgcaE
	br3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nYIpz/9ZtLFn9vmqXnooGyWrgpfOm2Zqe07ZeI7zjGo=;
	b=R4yZpmu5Ih1qEMcFyf0hX6Bnae9eUEH+yATKptTb7XlqkmZuok7304S0lCQJErjrvl
	vIcQfIegWeLrnNS8N0RmArfPydin0TNt+iOy529ZXrWM1U5Mzs6kEyKNC/ixhnw1tGkD
	CugiZ/VbxRiTjFiepgE4Yp5qhd8WO4wY/wtS57FpcGDMjhtsPqL02A2GgWf6JT59TktD
	rqU1nvprKw8S82QdVcvbxf1jRjcPUzrijc8vc0lYEgkN/JlmYhCT9DWVyMbcVAAC/nbO
	xDnIncx75G0FKovpA7sTWghTtm1RWRmWxlnP8wmoaUZvje7B/LhAIX3PCACzPL9kY0EO
	NVEg==
X-Gm-Message-State: AA+aEWaFL3nG9SXCKuwxeFWpcDDi3889AUUI/s8ycnGLHq1C50Smgr38
	gHEyqupavAxOzeH2Id4gLy9ujnCX4F8=
X-Google-Smtp-Source: AFSGD/VE7BZubepZqvUfIw6KHlU+6GX6zLADcAlj8+CWlRm2k2WEOyCcQMlwG4nAepBHBUK6ybqTNw==
X-Received: by 2002:a17:902:7581:: with SMTP id
	j1mr3819670pll.308.1542746303410; 
	Tue, 20 Nov 2018 12:38:23 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	x26sm24325479pfn.50.2018.11.20.12.38.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 12:38:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:38:05 -0800
Message-Id: <20181120203814.11500-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 01/10] openwsman: Upgrade to 2.6.8
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
X-List-Received-Date: Tue, 20 Nov 2018 20:38:23 -0000
Content-Transfer-Encoding: 8bit

- Use python3 native to build instead of general python
- Backport OpenSSL 1.0 API patch
- Add a patch to fix build with curl >= 7.62
- Drop older backports which are already in 2.6.8 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._SSL_CACERT-deprecation-in-curl-7.62.patch |  42 +++++
 .../0001-Port-to-OpenSSL-1.1.0.patch          | 162 ------------------
 .../0001-openSSL-1.1.0-API-fixes.patch        |  77 +++++++++
 ...rsion-number-to-allow-builds-with-ol.patch |  48 ------
 ...{openwsman_2.6.5.bb => openwsman_2.6.8.bb} |  12 +-
 5 files changed, 126 insertions(+), 215 deletions(-)
 create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch
 delete mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0001-Port-to-OpenSSL-1.1.0.patch
 create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0001-openSSL-1.1.0-API-fixes.patch
 delete mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.5.bb => openwsman_2.6.8.bb} (88%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch
new file mode 100644
index 0000000000..4dcd108005
--- /dev/null
+++ b/meta-oe/recipes-extended/openwsman/openwsman/0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch
@@ -0,0 +1,42 @@
+From f2c37fab5dbaffa06c1268ee1309596306c9a4df Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Nov 2018 12:23:47 -0800
+Subject: [PATCH] Adjust for CURLE_SSL_CACERT deprecation in curl >= 7.62
+
+Use CURLE_PEER_FAILED_VERIFICATION instead
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/wsman-curl-client-transport.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/lib/wsman-curl-client-transport.c b/src/lib/wsman-curl-client-transport.c
+index d0a3829b..92727f4f 100644
+--- a/src/lib/wsman-curl-client-transport.c
++++ b/src/lib/wsman-curl-client-transport.c
+@@ -186,16 +186,23 @@ convert_to_last_error(CURLcode r)
+ 		return WS_LASTERR_SSL_CONNECT_ERROR;
+         case CURLE_BAD_FUNCTION_ARGUMENT:
+                 return WS_LASTERR_CURL_BAD_FUNCTION_ARG;
++#if LIBCURL_VERSION_NUM < 0x073E00
+ 	case CURLE_SSL_PEER_CERTIFICATE:
+ 		return WS_LASTERR_SSL_PEER_CERTIFICATE;
++#endif
+ 	case CURLE_SSL_ENGINE_NOTFOUND:
+ 		return WS_LASTERR_SSL_ENGINE_NOTFOUND;
+ 	case CURLE_SSL_ENGINE_SETFAILED:
+ 		return WS_LASTERR_SSL_ENGINE_SETFAILED;
+ 	case CURLE_SSL_CERTPROBLEM:
+ 		return WS_LASTERR_SSL_CERTPROBLEM;
++#if LIBCURL_VERSION_NUM < 0x073E00
+ 	case CURLE_SSL_CACERT:
+ 		return WS_LASTERR_SSL_CACERT;
++#else
++	case CURLE_PEER_FAILED_VERIFICATION:
++		return WS_LASTERR_SSL_PEER_CERTIFICATE;
++#endif
+ #if LIBCURL_VERSION_NUM > 0x70C01
+ 	case CURLE_SSL_ENGINE_INITFAILED:
+ 		return WS_LASTERR_SSL_ENGINE_INITFAILED;
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-Port-to-OpenSSL-1.1.0.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-Port-to-OpenSSL-1.1.0.patch
deleted file mode 100644
index 49afa56f56..0000000000
--- a/meta-oe/recipes-extended/openwsman/openwsman/0001-Port-to-OpenSSL-1.1.0.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From f78643d2388dd0697f83f17880403253a0596d83 Mon Sep 17 00:00:00 2001
-From: Vitezslav Crhonek <vcrhonek@redhat.com>
-Date: Wed, 5 Sep 2018 11:23:46 -0700
-Subject: [PATCH 1/2] Port to OpenSSL 1.1.0
-
-Upstream-Status: Submitted [https://github.com/Openwsman/openwsman/pull/99]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/wsman-curl-client-transport.c |  6 +++-
- src/server/shttpd/io_ssl.c            | 17 ----------
- src/server/shttpd/shttpd.c            | 20 ++++--------
- src/server/shttpd/ssl.h               | 46 ---------------------------
- 4 files changed, 12 insertions(+), 77 deletions(-)
-
-diff --git a/src/lib/wsman-curl-client-transport.c b/src/lib/wsman-curl-client-transport.c
-index cd7f517a..e64ad097 100644
---- a/src/lib/wsman-curl-client-transport.c
-+++ b/src/lib/wsman-curl-client-transport.c
-@@ -241,12 +241,16 @@ write_handler( void *ptr, size_t size, size_t nmemb, void *data)
- static int ssl_certificate_thumbprint_verify_callback(X509_STORE_CTX *ctx, void *arg)
- {
- 	unsigned char *thumbprint = (unsigned char *)arg;
--	X509 *cert = ctx->cert;
- 	EVP_MD                                  *tempDigest;
- 
- 	unsigned char   tempFingerprint[EVP_MAX_MD_SIZE];
- 	unsigned int      tempFingerprintLen;
- 	tempDigest = (EVP_MD*)EVP_sha1( );
-+
-+	X509 *cert = X509_STORE_CTX_get_current_cert(ctx);
-+	if(!cert)
-+		return 0;
-+
- 	if ( X509_digest(cert, tempDigest, tempFingerprint, &tempFingerprintLen ) <= 0)
- 		return 0;
- 	if(!memcmp(tempFingerprint, thumbprint, tempFingerprintLen))
-diff --git a/src/server/shttpd/io_ssl.c b/src/server/shttpd/io_ssl.c
-index 6de0db2a..7ac669e4 100644
---- a/src/server/shttpd/io_ssl.c
-+++ b/src/server/shttpd/io_ssl.c
-@@ -11,23 +11,6 @@
- #include "defs.h"
- 
- #if !defined(NO_SSL)
--struct ssl_func	ssl_sw[] = {
--	{"SSL_free",			{0}},
--	{"SSL_accept",			{0}},
--	{"SSL_connect",			{0}},
--	{"SSL_read",			{0}},
--	{"SSL_write",			{0}},
--	{"SSL_get_error",		{0}},
--	{"SSL_set_fd",			{0}},
--	{"SSL_new",			{0}},
--	{"SSL_CTX_new",			{0}},
--	{"SSLv23_server_method",	{0}},
--	{"SSL_library_init",		{0}},
--	{"SSL_CTX_use_PrivateKey_file",	{0}},
--	{"SSL_CTX_use_certificate_file",{0}},
--	{NULL,				{0}}
--};
--
- void
- _shttpd_ssl_handshake(struct stream *stream)
- {
-diff --git a/src/server/shttpd/shttpd.c b/src/server/shttpd/shttpd.c
-index 5876392e..4c1dbf32 100644
---- a/src/server/shttpd/shttpd.c
-+++ b/src/server/shttpd/shttpd.c
-@@ -1476,20 +1476,14 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
- 	int		retval = FALSE;
- 	EC_KEY*		key;
- 
--	/* Load SSL library dynamically */
--	if ((lib = dlopen(SSL_LIB, RTLD_LAZY)) == NULL) {
--		_shttpd_elog(E_LOG, NULL, "set_ssl: cannot load %s", SSL_LIB);
--		return (FALSE);
--	}
--
--	for (fp = ssl_sw; fp->name != NULL; fp++)
--		if ((fp->ptr.v_void = dlsym(lib, fp->name)) == NULL) {
--			_shttpd_elog(E_LOG, NULL,"set_ssl: cannot find %s", fp->name);
--			return (FALSE);
--		}
--
- 	/* Initialize SSL crap */
-+	debug("Initialize SSL");
-+	SSL_load_error_strings();
-+	#if OPENSSL_VERSION_NUMBER < 0x10100000L
- 	SSL_library_init();
-+	#else
-+	OPENSSL_init_ssl(0, NULL);
-+	#endif
- 
- 	if ((CTX = SSL_CTX_new(SSLv23_server_method())) == NULL)
- 		_shttpd_elog(E_LOG, NULL, "SSL_CTX_new error");
-@@ -1532,7 +1526,7 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
- 			if (strncasecmp(protocols[idx].name, ssl_disabled_protocols, blank_ptr-ssl_disabled_protocols) == 0) {
- 				//_shttpd_elog(E_LOG, NULL, "SSL: disable %s protocol", protocols[idx].name);
- 				debug("SSL: disable %s protocol", protocols[idx].name);
--				SSL_CTX_ctrl(CTX, SSL_CTRL_OPTIONS, protocols[idx].opt, NULL);
-+				SSL_CTX_set_options(CTX, protocols[idx].opt);
- 				break;
- 			}
- 		}
-diff --git a/src/server/shttpd/ssl.h b/src/server/shttpd/ssl.h
-index a863f2c7..8dad0109 100644
---- a/src/server/shttpd/ssl.h
-+++ b/src/server/shttpd/ssl.h
-@@ -12,50 +12,4 @@
- 
- #include <openssl/ssl.h>
- 
--#else
--
--/*
-- * Snatched from OpenSSL includes. I put the prototypes here to be independent
-- * from the OpenSSL source installation. Having this, shttpd + SSL can be
-- * built on any system with binary SSL libraries installed.
-- */
--
--typedef struct ssl_st SSL;
--typedef struct ssl_method_st SSL_METHOD;
--typedef struct ssl_ctx_st SSL_CTX;
--
--#define	SSL_ERROR_WANT_READ	2
--#define	SSL_ERROR_WANT_WRITE	3
--#define	SSL_ERROR_SYSCALL	5
--#define	SSL_FILETYPE_PEM	1
--
- #endif
--
--/*
-- * Dynamically loaded SSL functionality
-- */
--struct ssl_func {
--	const char	*name;		/* SSL function name	*/
--	union variant	ptr;		/* Function pointer	*/
--};
--
--extern struct ssl_func	ssl_sw[];
--
--#define	FUNC(x)	ssl_sw[x].ptr.v_func
--
--#define	SSL_free(x)	(* (void (*)(SSL *)) FUNC(0))(x)
--#define	SSL_accept(x)	(* (int (*)(SSL *)) FUNC(1))(x)
--#define	SSL_connect(x)	(* (int (*)(SSL *)) FUNC(2))(x)
--#define	SSL_read(x,y,z)	(* (int (*)(SSL *, void *, int)) FUNC(3))((x),(y),(z))
--#define	SSL_write(x,y,z) \
--	(* (int (*)(SSL *, const void *,int)) FUNC(4))((x), (y), (z))
--#define	SSL_get_error(x,y)(* (int (*)(SSL *, int)) FUNC(5))((x), (y))
--#define	SSL_set_fd(x,y)	(* (int (*)(SSL *, int)) FUNC(6))((x), (y))
--#define	SSL_new(x)	(* (SSL * (*)(SSL_CTX *)) FUNC(7))(x)
--#define	SSL_CTX_new(x)	(* (SSL_CTX * (*)(SSL_METHOD *)) FUNC(8))(x)
--#define	SSLv23_server_method()	(* (SSL_METHOD * (*)(void)) FUNC(9))()
--#define	SSL_library_init() (* (int (*)(void)) FUNC(10))()
--#define	SSL_CTX_use_PrivateKey_file(x,y,z)	(* (int (*)(SSL_CTX *, \
--		const char *, int)) FUNC(11))((x), (y), (z))
--#define	SSL_CTX_use_certificate_file(x,y,z)	(* (int (*)(SSL_CTX *, \
--		const char *, int)) FUNC(12))((x), (y), (z))
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-openSSL-1.1.0-API-fixes.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-openSSL-1.1.0-API-fixes.patch
new file mode 100644
index 0000000000..8d230ba6d9
--- /dev/null
+++ b/meta-oe/recipes-extended/openwsman/openwsman/0001-openSSL-1.1.0-API-fixes.patch
@@ -0,0 +1,77 @@
+From 634b95157e1823672a2c95fac0cecf079b5967e7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Klaus=20K=C3=A4mpf?= <kkaempf@suse.de>
+Date: Mon, 19 Nov 2018 15:31:27 +0100
+Subject: [PATCH] openSSL 1.1.0 API fixes
+
+---
+ src/server/shttpd/io_ssl.c |  5 +++++
+ src/server/shttpd/shttpd.c | 11 ++++++++++-
+ src/server/shttpd/ssl.h    |  3 +++
+ 3 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/src/server/shttpd/io_ssl.c b/src/server/shttpd/io_ssl.c
+index 6de0db2a..ece610ef 100644
+--- a/src/server/shttpd/io_ssl.c
++++ b/src/server/shttpd/io_ssl.c
+@@ -21,8 +21,13 @@ struct ssl_func	ssl_sw[] = {
+ 	{"SSL_set_fd",			{0}},
+ 	{"SSL_new",			{0}},
+ 	{"SSL_CTX_new",			{0}},
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	{"SSLv23_server_method",	{0}},
+ 	{"SSL_library_init",		{0}},
++#else
++	{"TLS_server_method",	{0}},
++	{"OPENSSL_init_ssl",		{0}},
++#endif
+ 	{"SSL_CTX_use_PrivateKey_file",	{0}},
+ 	{"SSL_CTX_use_certificate_file",{0}},
+ 	{NULL,				{0}}
+diff --git a/src/server/shttpd/shttpd.c b/src/server/shttpd/shttpd.c
+index f0f3fbd8..652aea17 100644
+--- a/src/server/shttpd/shttpd.c
++++ b/src/server/shttpd/shttpd.c
+@@ -1489,9 +1489,14 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
+ 		}
+ 
+ 	/* Initialize SSL crap */
+-	SSL_library_init();
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++	SSL_library_init();
+ 	if ((CTX = SSL_CTX_new(SSLv23_server_method())) == NULL)
++#else
++        OPENSSL_init_ssl();
++	if ((CTX = SSL_CTX_new(TLS_server_method())) == NULL)
++#endif
+ 		_shttpd_elog(E_LOG, NULL, "SSL_CTX_new error");
+ 	else if (SSL_CTX_use_certificate_file(CTX, wsmand_options_get_ssl_cert_file(), SSL_FILETYPE_PEM) != 1)
+ 		_shttpd_elog(E_LOG, NULL, "cannot open certificate file %s", pem);
+@@ -1552,6 +1557,10 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
+           if (rc != 1) {
+             _shttpd_elog(E_LOG, NULL, "Failed to set SSL cipher list \"%s\"", ssl_cipher_list);
+           }
++          else if ((*ssl_cipher_list == 0) || (*ssl_cipher_list == ' ')) {
++            _shttpd_elog(E_LOG, NULL, "Empty 'ssl_cipher_list' defaults to 'TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:TLS_AES_128_GCM_SHA256'.");
++            _shttpd_elog(E_LOG, NULL, "Check openSSL documentation.");
++          }
+         }
+ 	ctx->ssl_ctx = CTX;
+ 
+diff --git a/src/server/shttpd/ssl.h b/src/server/shttpd/ssl.h
+index 2304b70a..89a73c49 100644
+--- a/src/server/shttpd/ssl.h
++++ b/src/server/shttpd/ssl.h
+@@ -56,6 +56,9 @@ extern struct ssl_func	ssl_sw[];
+ #if OPENSSL_VERSION_NUMBER < 0x10100000L
+ #define	SSLv23_server_method()	(* (SSL_METHOD * (*)(void)) FUNC(9))()
+ #define	SSL_library_init() (* (int (*)(void)) FUNC(10))()
++#else
++#define	TLS_server_method()	(* (SSL_METHOD * (*)(void)) FUNC(9))()
++#define	OPENSSL_init_ssl() (* (int (*)(void)) FUNC(10))()
+ #endif
+ #define	SSL_CTX_use_PrivateKey_file(x,y,z)	(* (int (*)(SSL_CTX *, \
+ 		const char *, int)) FUNC(11))((x), (y), (z))
+-- 
+2.19.1
+
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch b/meta-oe/recipes-extended/openwsman/openwsman/0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch
deleted file mode 100644
index 5ae2e0006e..0000000000
--- a/meta-oe/recipes-extended/openwsman/openwsman/0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 75669b077bd54bedbc086c60cbe137e7f4c685b5 Mon Sep 17 00:00:00 2001
-From: Vitezslav Crhonek <vcrhonek@redhat.com>
-Date: Mon, 24 Apr 2017 11:28:39 +0200
-Subject: [PATCH 2/2] Check OpenSSL version number to allow builds with older
- version
-
-Upstream-Status: Submitted [https://github.com/Openwsman/openwsman/pull/99]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/wsman-curl-client-transport.c | 4 ++++
- src/server/shttpd/shttpd.c            | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/src/lib/wsman-curl-client-transport.c b/src/lib/wsman-curl-client-transport.c
-index e64ad097..4fc047e8 100644
---- a/src/lib/wsman-curl-client-transport.c
-+++ b/src/lib/wsman-curl-client-transport.c
-@@ -247,7 +247,11 @@ static int ssl_certificate_thumbprint_verify_callback(X509_STORE_CTX *ctx, void
- 	unsigned int      tempFingerprintLen;
- 	tempDigest = (EVP_MD*)EVP_sha1( );
- 
-+	#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+	X509 *cert = ctx->cert;
-+	#else
- 	X509 *cert = X509_STORE_CTX_get_current_cert(ctx);
-+	#endif
- 	if(!cert)
- 		return 0;
- 
-diff --git a/src/server/shttpd/shttpd.c b/src/server/shttpd/shttpd.c
-index 4c1dbf32..161720c8 100644
---- a/src/server/shttpd/shttpd.c
-+++ b/src/server/shttpd/shttpd.c
-@@ -1526,7 +1526,11 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
- 			if (strncasecmp(protocols[idx].name, ssl_disabled_protocols, blank_ptr-ssl_disabled_protocols) == 0) {
- 				//_shttpd_elog(E_LOG, NULL, "SSL: disable %s protocol", protocols[idx].name);
- 				debug("SSL: disable %s protocol", protocols[idx].name);
-+				#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+				SSL_CTX_ctrl(CTX, SSL_CTRL_OPTIONS, protocols[idx].opt, NULL);
-+				#else
- 				SSL_CTX_set_options(CTX, protocols[idx].opt);
-+				#endif
- 				break;
- 			}
- 		}
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.5.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.8.bb
similarity index 88%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.5.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.8.bb
index 5fba3855c0..f04ff01d96 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.5.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.8.bb
@@ -15,15 +15,15 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "e90e5c96e3006c372bf45e0185e33c9250e67df6"
-PV = "2.6.5"
+# v2.6.8
+SRCREV = "b9cd0b72534854abb6dd834c8c11e02111b4c8d7"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service \
            file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
-           file://0001-Port-to-OpenSSL-1.1.0.patch \
-           file://0002-Check-OpenSSL-version-number-to-allow-builds-with-ol.patch \
+           file://0001-openSSL-1.1.0-API-fixes.patch \
+           file://0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -31,7 +31,7 @@ S = "${WORKDIR}/git"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d4f53d4c6cf73b9d43186ce3be6dd0ba"
 
-inherit systemd cmake pkgconfig pythonnative perlnative
+inherit systemd cmake pkgconfig python3native perlnative
 
 SYSTEMD_SERVICE_${PN} = "openwsmand.service"
 SYSTEMD_AUTO_ENABLE = "disable"
@@ -41,6 +41,8 @@ LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', " -fuse-
 EXTRA_OECMAKE = "-DBUILD_BINDINGS=NO \
                  -DBUILD_LIBCIM=NO \
                  -DBUILD_PERL=YES \
+                 -DBUILD_PYTHON3=YES \
+                 -DBUILD_PYTHON=NO \
                  -DCMAKE_INSTALL_PREFIX=${prefix} \
                  -DLIB=${baselib} \
                 "
-- 
2.19.1


