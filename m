Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1866.1795113403385455847
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zn89E+2z;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so122575b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113403; x=1795718203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tca6sgiL2YEvmfXz214MS9KqwakXbQyG9Awt4jLSwyk=;
        b=zn89E+2z9QllVxuA1HD7Sf3PYwGNQpWPjGmRjuh/hJRlVUceJuiTc4dgP9M12voJkr
         RUzwLzEijvAnKvvRYOMdRWVKgjgKrGWO4WS/zYORa6OM12RPURc4/mG9SOyjPfNOz3lR
         J/5Q0iVl9eepIaEQCf2Uwzh9e8zXW85rmhvt/gkITwBoiPkTc4Fv8vp7azzSGTK77IeR
         ggyGeiZAq3jh2kiuMz85wWEqBrARBHUVB+Kj9A/s86pRMoNLLK8D3dN9e/Nz8ztS9+E0
         VaY6srjy/pwPHFPQiDFWd3HfY5JwtYoxE83pb6cSxSC2GsswSQ5SRoaaFkXnBsX2UfQN
         jrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113403; x=1795718203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tca6sgiL2YEvmfXz214MS9KqwakXbQyG9Awt4jLSwyk=;
        b=GgftT+Ah9EVjhdcJiw+EpjQ2V+YmZBIro7p2YBjAHpsnmnQmTwXlysh8qhxP2OSPlZ
         NaS/IodV5aTAYrvZZvCZU9aDuSJQq/JNoZObq/14In2KjRYy5YJWM1OOqI53gQ9RHwuf
         jqnZnrrVXDxDXAxQ5NHbAKOYxFYtahqVw1dZotxKuc6a+lLbROvUyLZ9BCRAdlt88Th8
         0e2cQQGm8TeUGVKMXGCiV1aa0223ZfD6uE6yjUF/Z3cNOYUF/wQQ1SB968QoqeqIY/Y1
         VmK58QEUnkC6ehfkjWx99ulzx1RpQNEJ/bD3Qs/krjDr+Bw0N6V98Tb70c/uyZXb9XJW
         CUCQ==
X-Gm-Message-State: APuU4Z+CqDnMYgsoP/2Xjlj13yiNcVar9VSdwIVKyf1wgmn61D1tbCXJ
	HEy02AxfQS5WUrH9fdhEsfy54w7TbEkzZLEiVjmmH0JPNwTtIOuiigu/ChxCZA==
X-Gm-Gg: AYBFou2DVmvhNXJrNXCWoF9wgXc35DD8M2swNSRyZpM9becj1ZGqvzOdikk53weEQol
	44XpLrk4jatbRTVPV5DVDdiBnFKPRZwQSvZAgEyK+fbuv1svr2kouNWWe8Eo1L7WEUQQaHiMSDX
	W97C4Vmnynr/YicImIzZ/JtDioN9S8LnzNVqQKR7qY7VvqsA2ufFcJnA5VSMc5JVfJXlomxEgso
	069hssVkBC0Xj2m1dl5d9fW6AJOYcibklEDFA8UtHuNwg//Jdtg7KEXlrDeKIbBqpbq7EHeLRAc
	WAECOAmCuLgVxH6RX83EEjK9HiXzQlVWd5/GWc/vEUTD+MzxMYn9+vOWePB9sPGOy3mvFT34rKy
	DIY8Ba7e/TAhIOJu9uo3Qlg/Hq4RpsBnveuZbPepx6HGAh8L5lrSTfUI+1r/hhQVTyiA83ENtVQ
	/4TtBR370EGtm7cpHosF5Z/mcUX+MJ+VziiIG51s5wGCekVQg6wQRP/VL0Q4UG0ZFGKrsHC7ccE
	CFrMCNHGLg7zXzeqA3UTQSIt58fL3vn6aascMGk8xg+lAuyf+T2oCPuKrsGoioRvJ5dvSiflmsz
	MB3lc5XRFsvc/TZe2DK8yJgN7noqlThqxIwLZCkjxXufE7nxYtbh4XqpgyGKwA==
X-Received: by 2002:a05:6a00:88f:b0:882:956c:58e2 with SMTP id d2e1a72fcca58-8c87bdb42edmr510648b3a.17.1795113402701;
        Thu, 19 Nov 2026 10:36:42 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Johannes Schneider <johannes.schneider@leica-geosystems.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 18/64] imx-cst: restore PKCS#11 signing on OpenSSL 4 via the provider
Date: Fri, 20 Nov 2026 07:32:46 +1300
Message-ID: <e41d33e63ac351cf4ffe0c0edb5dfa4561422688.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132708
Content-Type: text/plain; charset="utf-8"

From: Johannes Schneider <johannes.schneider@leica-geosystems.com>

0015-fix-openssl-4-engine-api-removal made CST build against OpenSSL 4 by
stubbing out the removed ENGINE API, but left PKCS#11-backed signing broken:
ENGINE_by_id("pkcs11") returns NULL, so engine_ctx_init() fails. Add a patch
that reimplements the pkcs11 certificate and key loading on OSSL_STORE and the
pkcs11 provider (pkcs11-provider), restoring HSM/token-backed signing on
OpenSSL 4. OpenSSL 3 builds are unaffected.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3de9f29b7f0cf8587e05803169baa0dda016568a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...cs11-signing-from-engine-to-provider.patch | 236 ++++++++++++++++++
 .../recipes-support/imx-cst/imx-cst_4.0.1.bb  |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0017-cst-port-pkcs11-signing-from-engine-to-provider.patch

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0017-cst-port-pkcs11-signing-from-engine-to-provider.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0017-cst-port-pkcs11-signing-from-engine-to-provider.patch
new file mode 100644
index 0000000000..699402a447
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0017-cst-port-pkcs11-signing-from-engine-to-provider.patch
@@ -0,0 +1,236 @@
+From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
+Subject: cst: port pkcs11 signing from the OpenSSL ENGINE to a provider
+
+OpenSSL 4.0 removed the ENGINE API, so CST's pkcs11-backed signing stops
+working: ENGINE_by_id("pkcs11") returns NULL and engine_ctx_init() fails.
+
+Reimplement the pkcs11 certificate and key loading on OSSL_STORE and the
+pkcs11 provider. engine_ctx_init() loads the default and pkcs11 providers --
+default explicitly, because activating any provider stops OpenSSL
+auto-loading default, which would drop the EVP digest and signature algorithms
+the signer needs. ENGINE_load_certificate()/ENGINE_load_key() open the pkcs11
+URI through OSSL_STORE and return the X509 / EVP_PKEY, feeding the existing CMS
+and EVP signing unchanged. The public entry points keep their names and
+signatures; the ENGINE * argument is now vestigial. The PIN travels in the URI
+(pin-value=).
+
+Upstream-Status: Pending
+Assisted-by: Claude:claude-opus-4-8
+Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
+---
+Builds on the engine-stub change already in this recipe's series
+(0015-fix-openssl-4-engine-api-removal), which only makes the file compile and
+noted that pkcs11-backed signing was still unavailable on OpenSSL 4; this
+restores it.
+--- a/src/lib/back_end/engine.c
++++ b/src/lib/back_end/engine.c
+@@ -7,8 +7,9 @@
+ /*
+  * OpenSSL 4.0 removed the ENGINE API.  <openssl/engine.h> still declares
+  * it for source compatibility, and defining OPENSSL_ENGINE_STUBS turns the
+- * declarations into inline no-ops so this file keeps linking.  The pkcs11
+- * engine simply does not exist there, which engine_ctx_init() reports.
++ * declarations into inline no-ops so this file keeps linking.  Signing no
++ * longer uses an engine (see engine_ctx_init); the vestigial ENGINE * only
++ * keeps the public entry points' signatures unchanged.
+  */
+ #define OPENSSL_ENGINE_STUBS
+ 
+@@ -19,6 +20,8 @@
+ #include <openssl/err.h>
+ #include <openssl/x509.h>
+ #include <openssl/evp.h>
++#include <openssl/provider.h>
++#include <openssl/store.h>
+ #include <stdint.h>
+ 
+ #if CST_WITH_PKCS11
+@@ -31,6 +34,76 @@
+ }
+ #endif
+ 
++/* Load default and pkcs11 once; "default" explicitly, or activating pkcs11 stops OpenSSL auto-loading it and the signer loses its EVP algorithms. */
++static int load_providers(void)
++{
++	static int loaded;
++
++	if (loaded)
++		return 1;
++
++	if (!OSSL_PROVIDER_load(NULL, "default")) {
++		fprintf(stderr, "ERROR: cannot load the default OpenSSL provider\n");
++		return 0;
++	}
++	if (!OSSL_PROVIDER_load(NULL, "pkcs11")) {
++		fprintf(stderr, "ERROR: cannot load the pkcs11 OpenSSL provider; "
++			"is pkcs11-provider installed and OPENSSL_MODULES set?\n");
++		return 0;
++	}
++
++	loaded = 1;
++	return 1;
++}
++
++/* Load a certificate and/or key from a PKCS#11 (or any OSSL_STORE) URI; returns 1 only if every requested object was found. */
++static int store_load(const char *uri, X509 **cert_out, EVP_PKEY **key_out)
++{
++	OSSL_STORE_CTX *store = NULL;
++	int ok = 0;
++
++	if (!uri)
++		return 0;
++
++	store = OSSL_STORE_open(uri, NULL, NULL, NULL, NULL);
++	if (!store) {
++		fprintf(stderr, "ERROR: cannot open PKCS#11 store for %s\n", uri);
++		return 0;
++	}
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			/* NULL means EOF or a non-fatal error; break on the error flag, or a bad object spins forever (eof stays 0). */
++			if (OSSL_STORE_error(store))
++				break;
++			continue;
++		}
++
++		switch (OSSL_STORE_INFO_get_type(info)) {
++		case OSSL_STORE_INFO_CERT:
++			if (cert_out && !*cert_out)
++				*cert_out = OSSL_STORE_INFO_get1_CERT(info);
++			break;
++		case OSSL_STORE_INFO_PKEY:
++			if (key_out && !*key_out)
++				*key_out = OSSL_STORE_INFO_get1_PKEY(info);
++			break;
++		default:
++			break;
++		}
++		OSSL_STORE_INFO_free(info);
++
++		if ((!cert_out || *cert_out) && (!key_out || *key_out))
++			break;
++	}
++
++	OSSL_STORE_close(store);
++	ok = (!cert_out || *cert_out) && (!key_out || *key_out);
++	return ok;
++}
++
+ struct engine_ctx *engine_ctx_new(void)
+ {
+     struct engine_ctx *ctx = NULL;
+@@ -41,16 +114,13 @@
+ 
+ int32_t engine_ctx_destroy(struct engine_ctx *ctx)
+ {
+-	if (ctx) {
+-		ENGINE_free(ctx->engine);
++	if (ctx)
+ 		OPENSSL_free(ctx);
+-	}
+ 	return 1;
+ }
+ 
+ int32_t engine_ctx_init(struct engine_ctx *ctx)
+ {
+-    dynamic_fns fns;
+     /* OpenSSL Initialization */
+ #if OPENSSL_VERSION_NUMBER >= 0x10100000
+ 	OPENSSL_init_crypto(OPENSSL_INIT_ADD_ALL_CIPHERS |
+@@ -66,60 +136,46 @@
+ 
+ 	ERR_clear_error();
+ 
+-	ENGINE_load_builtin_engines();
+-
+-	ctx->engine = ENGINE_by_id("pkcs11");
+-
+-	if (!ctx->engine) {
+-		fprintf(stderr, "ERROR: cannot load the pkcs11 OpenSSL engine\n");
+-#if OPENSSL_VERSION_MAJOR >= 4
+-		fprintf(stderr,
+-			"ERROR: OpenSSL 4.0 removed ENGINE support, so PKCS#11 "
+-			"backed signing is unavailable\n");
+-#endif
++	if (!load_providers())
+ 		return 0;
+-	}
+ 
+-#ifdef DEBUG
+-	ENGINE_ctrl_cmd_string(ctx->engine, "VERBOSE", NULL, 0);
+-#endif
+-
+-	if (!ENGINE_init(ctx->engine)) {
+-		ENGINE_free(ctx->engine);
+-		return 0;
+-	}
++	ctx->engine = NULL;
+ 
+ 	return 1;
+ }
+ 
+ int32_t engine_ctx_finish(struct engine_ctx *ctx)
+ {
+-	if (ctx)
+-		ENGINE_finish(ctx->engine);
++	(void)ctx;
+ 	return 1;
+ }
+ 
+ X509 *ENGINE_load_certificate(ENGINE *e, const char *cert_ref)
+ {
+-	struct {
+-		const char *s_slot_cert_id;
+-		X509 *cert;
+-	} params = {0};
++	X509 *cert = NULL;
+ 
+-	params.s_slot_cert_id = cert_ref;
+-	params.cert = NULL;
++	(void)e;
+ 
+-	if (!ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &params, NULL, 1)) {
++	if (!store_load(cert_ref, &cert, NULL)) {
+ 		ERR_print_errors_fp(stderr);
+ 		return NULL;
+ 	}
+ 
+-	return params.cert;
++	return cert;
+ }
+ 
+ EVP_PKEY *ENGINE_load_key(ENGINE *e, const char *key_ref)
+ {
+-	return ENGINE_load_private_key(e, key_ref, 0, 0);
++	EVP_PKEY *key = NULL;
++
++	(void)e;
++
++	if (!store_load(key_ref, NULL, &key)) {
++		ERR_print_errors_fp(stderr);
++		return NULL;
++	}
++
++	return key;
+ }
+ 
+ X509 *engine_read_certificate(const char *cert_ref)
+@@ -161,14 +217,8 @@
+ #endif
+ 
+ out:
+-	if (ctx) {
+-	/*
+-	 * Destroy the context: ctx_finish is not called here since
+-	 * ENGINE_finish cleanups the engine instance. Calling ctx_destroy
+-	 * next will lead to null pointer dereference.
+-	 */
++	if (ctx)
+ 		engine_ctx_destroy(ctx);
+-	}
+ 
+ 	if (error)
+ 		ERR_print_errors_fp(stderr);
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
index ec6838e95d..3a0f717440 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "\
     file://0014-fix-pointer-sign-errors-with-clang.patch \
     file://0015-fix-openssl-4-engine-api-removal.patch \
     file://0016-fix-openssl-4-const-subject-name.patch \
+    file://0017-cst-port-pkcs11-signing-from-engine-to-provider.patch \
 "
 SRC_URI[sha256sum] = "fd92a1a9faa10fb81bbf752c7ee1e257f17e1ec4c2964f8a47adf8a3eaa7df41"
 
