Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B62346C1D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYf38lDzKM
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489318;
	bh=poYX0BWJUow/eg9tYj+c/5MY3ztj8/0kykgHUpMqBW8=;
	h=From:To:Subject:Date:From;
	b=LHsyL22GPp/PmOzdVUXx6aHr6lAreyByuBFBv8t8pDjso/EMDr1NbxsN99Jk+Z8FI
	Mz5nIXM7SORm+OH9rleYcdxSB4Rphzo/lLS/OKXf8ntF0o9ciF+2ApkMrZXfUjoht/
	X/+uyH+IsOWn2gU2lNxv2S+RgqXAOceSjFlxE3ji6kqkys0nZLT2a7pOoYeSNeOpY6
	5WV9EfYBMxX/O9JQYzMMnkppQJCJPPokwnMnx0IoVlTgxO8xNfooEq6fQCWVje7eCh
	dBkF2t38brbheS0GUXIBGhbKAkxs8l1xPkaphjVWCszDqe5yRlj86lXrPSOa/oF/5k
	svEj1K5QZno0TxgXjk7DZWWuwX6imQ1JmI8fu/zPN0EUyqy/e1C8BgtL7aa09u489l
	EW2Pr9qn/fL2gvBmpb4zP7Lg0RqXjAKhPdirypLzgilE6o49y5DtFS37+v132f6AMN
	ZHtjYlabr5lButuKvkz1lD1qBuokwSQw0phjRkazSnfN6MDH/J1TrRyJL3Fogq3YEg
	26P0Susgjumqd/m61l6ZZczPYihfSzgWudy/O26q1kx1+f1+WmMWoBRlQdSH2JiREa
	QqobfbEmTXR8A130czvYiEtO4E5qI266IAOJRq9JzJ7xUEIkangbImcDSJtQJ/bPZQ
	MK7Fhj2MByCdLzF0LEOGqkqs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:03 +0300
Message-Id: <20190510115515.19491-7-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] openwsman: Upgrade 2.6.8 -> 2.6.9
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
X-List-Received-Date: Fri, 10 May 2019 11:55:18 -0000

Remove patches applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ..._SSL_CACERT-deprecation-in-curl-7.62.patch | 42 ----------
 .../0001-openSSL-1.1.0-API-fixes.patch        | 77 -------------------
 ...{openwsman_2.6.8.bb => openwsman_2.6.9.bb} |  6 +-
 3 files changed, 2 insertions(+), 123 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch
 delete mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0001-openSSL-1.1.0-API-fixes.patch
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.8.bb => openwsman_2.6.9.bb} (93%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch
deleted file mode 100644
index 4dcd10800..000000000
--- a/meta-oe/recipes-extended/openwsman/openwsman/0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f2c37fab5dbaffa06c1268ee1309596306c9a4df Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 20 Nov 2018 12:23:47 -0800
-Subject: [PATCH] Adjust for CURLE_SSL_CACERT deprecation in curl >= 7.62
-
-Use CURLE_PEER_FAILED_VERIFICATION instead
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/wsman-curl-client-transport.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/lib/wsman-curl-client-transport.c b/src/lib/wsman-curl-client-transport.c
-index d0a3829b..92727f4f 100644
---- a/src/lib/wsman-curl-client-transport.c
-+++ b/src/lib/wsman-curl-client-transport.c
-@@ -186,16 +186,23 @@ convert_to_last_error(CURLcode r)
- 		return WS_LASTERR_SSL_CONNECT_ERROR;
-         case CURLE_BAD_FUNCTION_ARGUMENT:
-                 return WS_LASTERR_CURL_BAD_FUNCTION_ARG;
-+#if LIBCURL_VERSION_NUM < 0x073E00
- 	case CURLE_SSL_PEER_CERTIFICATE:
- 		return WS_LASTERR_SSL_PEER_CERTIFICATE;
-+#endif
- 	case CURLE_SSL_ENGINE_NOTFOUND:
- 		return WS_LASTERR_SSL_ENGINE_NOTFOUND;
- 	case CURLE_SSL_ENGINE_SETFAILED:
- 		return WS_LASTERR_SSL_ENGINE_SETFAILED;
- 	case CURLE_SSL_CERTPROBLEM:
- 		return WS_LASTERR_SSL_CERTPROBLEM;
-+#if LIBCURL_VERSION_NUM < 0x073E00
- 	case CURLE_SSL_CACERT:
- 		return WS_LASTERR_SSL_CACERT;
-+#else
-+	case CURLE_PEER_FAILED_VERIFICATION:
-+		return WS_LASTERR_SSL_PEER_CERTIFICATE;
-+#endif
- #if LIBCURL_VERSION_NUM > 0x70C01
- 	case CURLE_SSL_ENGINE_INITFAILED:
- 		return WS_LASTERR_SSL_ENGINE_INITFAILED;
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-openSSL-1.1.0-API-fixes.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-openSSL-1.1.0-API-fixes.patch
deleted file mode 100644
index 8d230ba6d..000000000
--- a/meta-oe/recipes-extended/openwsman/openwsman/0001-openSSL-1.1.0-API-fixes.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 634b95157e1823672a2c95fac0cecf079b5967e7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Klaus=20K=C3=A4mpf?= <kkaempf@suse.de>
-Date: Mon, 19 Nov 2018 15:31:27 +0100
-Subject: [PATCH] openSSL 1.1.0 API fixes
-
----
- src/server/shttpd/io_ssl.c |  5 +++++
- src/server/shttpd/shttpd.c | 11 ++++++++++-
- src/server/shttpd/ssl.h    |  3 +++
- 3 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/src/server/shttpd/io_ssl.c b/src/server/shttpd/io_ssl.c
-index 6de0db2a..ece610ef 100644
---- a/src/server/shttpd/io_ssl.c
-+++ b/src/server/shttpd/io_ssl.c
-@@ -21,8 +21,13 @@ struct ssl_func	ssl_sw[] = {
- 	{"SSL_set_fd",			{0}},
- 	{"SSL_new",			{0}},
- 	{"SSL_CTX_new",			{0}},
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
- 	{"SSLv23_server_method",	{0}},
- 	{"SSL_library_init",		{0}},
-+#else
-+	{"TLS_server_method",	{0}},
-+	{"OPENSSL_init_ssl",		{0}},
-+#endif
- 	{"SSL_CTX_use_PrivateKey_file",	{0}},
- 	{"SSL_CTX_use_certificate_file",{0}},
- 	{NULL,				{0}}
-diff --git a/src/server/shttpd/shttpd.c b/src/server/shttpd/shttpd.c
-index f0f3fbd8..652aea17 100644
---- a/src/server/shttpd/shttpd.c
-+++ b/src/server/shttpd/shttpd.c
-@@ -1489,9 +1489,14 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
- 		}
- 
- 	/* Initialize SSL crap */
--	SSL_library_init();
- 
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+	SSL_library_init();
- 	if ((CTX = SSL_CTX_new(SSLv23_server_method())) == NULL)
-+#else
-+        OPENSSL_init_ssl();
-+	if ((CTX = SSL_CTX_new(TLS_server_method())) == NULL)
-+#endif
- 		_shttpd_elog(E_LOG, NULL, "SSL_CTX_new error");
- 	else if (SSL_CTX_use_certificate_file(CTX, wsmand_options_get_ssl_cert_file(), SSL_FILETYPE_PEM) != 1)
- 		_shttpd_elog(E_LOG, NULL, "cannot open certificate file %s", pem);
-@@ -1552,6 +1557,10 @@ set_ssl(struct shttpd_ctx *ctx, const char *pem)
-           if (rc != 1) {
-             _shttpd_elog(E_LOG, NULL, "Failed to set SSL cipher list \"%s\"", ssl_cipher_list);
-           }
-+          else if ((*ssl_cipher_list == 0) || (*ssl_cipher_list == ' ')) {
-+            _shttpd_elog(E_LOG, NULL, "Empty 'ssl_cipher_list' defaults to 'TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:TLS_AES_128_GCM_SHA256'.");
-+            _shttpd_elog(E_LOG, NULL, "Check openSSL documentation.");
-+          }
-         }
- 	ctx->ssl_ctx = CTX;
- 
-diff --git a/src/server/shttpd/ssl.h b/src/server/shttpd/ssl.h
-index 2304b70a..89a73c49 100644
---- a/src/server/shttpd/ssl.h
-+++ b/src/server/shttpd/ssl.h
-@@ -56,6 +56,9 @@ extern struct ssl_func	ssl_sw[];
- #if OPENSSL_VERSION_NUMBER < 0x10100000L
- #define	SSLv23_server_method()	(* (SSL_METHOD * (*)(void)) FUNC(9))()
- #define	SSL_library_init() (* (int (*)(void)) FUNC(10))()
-+#else
-+#define	TLS_server_method()	(* (SSL_METHOD * (*)(void)) FUNC(9))()
-+#define	OPENSSL_init_ssl() (* (int (*)(void)) FUNC(10))()
- #endif
- #define	SSL_CTX_use_PrivateKey_file(x,y,z)	(* (int (*)(SSL_CTX *, \
- 		const char *, int)) FUNC(11))((x), (y), (z))
--- 
-2.19.1
-
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.8.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb
similarity index 93%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.8.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb
index f04ff01d9..e5bb0765f 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.8.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.9.bb
@@ -15,15 +15,13 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-# v2.6.8
-SRCREV = "b9cd0b72534854abb6dd834c8c11e02111b4c8d7"
+# v2.6.9
+SRCREV = "5efb1545dbac7e6d1e0a992f3e84ca12cea1c18e"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service \
            file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
-           file://0001-openSSL-1.1.0-API-fixes.patch \
-           file://0001-Adjust-for-CURLE_SSL_CACERT-deprecation-in-curl-7.62.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


