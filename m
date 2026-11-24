Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21735.1795538586234754998
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 08:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bJ5PxJiX;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so3372847f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 08:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538584; x=1796143384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PraKuzT+qstSfs/BjvZp9Nz+Tgtg8hUP5/7KpFl8Tw=;
        b=bJ5PxJiXM2wG/DlFOVsDo72aVxcE7sULpx+GWSyfZ4TLhvR35FleQ9Ic9PR4sCVLbc
         uK1m8flmQHleFf53FlNXXCjA/tOagmDPjlao8xELZT4cp/1Fd7rh/iEBYOaYYWh6EvtI
         xSFWSCjwiYlA1xsOV8JWD18fO2UYxXyd9wbriZJue6XHayju6XH5KcVfik4M5CKwXN4v
         ++NO9jrqoJnyVIM+WtxgQbWATTo29eriLUcT8y1l1BCOBw1h1qFcD9HwSoYAB3YDvVXE
         NNi6Qnxwgj/+ZzO/DZtBU6mdADef5MXSRJ3pWiI2u06egatA0elE8xIkSOTsgD2d5Q+m
         rdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538584; x=1796143384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PraKuzT+qstSfs/BjvZp9Nz+Tgtg8hUP5/7KpFl8Tw=;
        b=DAQOqqdkTAc8C6irUrYIm8EIA4FZocYZcXYAFHqbGHFubqXKCXk0efVNRZ9PjYM1zk
         h8ELc7Ebdbr66OQixBG0fsE++6PAdFBhEj0DP/JVZLme4wJqGzHHSVA6BeW72lPVgLeo
         TyvfjSdpLnFbeO1z+0IAiNkUuNXqnJNkO2ZfncUOYaktkKe+K/gDlejk44jHi9AqZ32K
         2aNq69TBX8+Y9lmFSB4lALqIVXElDz4xD/lee3hBWUgU3IZYIUV0Nx11HbEhz92fLG5/
         VC6bNsyRIYmDgzJqFm1O9PmodR2zAK+TsoH6KsQQlE0ZoVnxLyoVJkgOI8beEUFgOurY
         Btig==
X-Gm-Message-State: APuU4Z9e1mfd/BqkKIgqRVhh9OYvGF53FqUCA4ePROZXNo5S+VgNzTQD
	hiEJGQ0lWEpDocBc/dXcH4aItb2j02Daxg0Vivo/aOJcpnbG31O4QIY+HT4bPg==
X-Gm-Gg: AZFdTZfvWvMBirxmGEwjrsj/b/mTGXjUiWSbGE/eFukiYr86fx9YWVNQOC953w70Xps
	zWyXfbUeuDZC6MbvveUH6OBuX7Cp3Z80tiwNX74x1SVdwpOU4j88swNE+7CZlViolO7zA6DEvnv
	sxYWVcNNxsSUcfGIOUutE5hO+g7KrW1R9Gjn8QEeFI209o0fdFn38K32aihBjAhvKF1TMFqyqDp
	GjvXZV6fCZDSKJI2Zytu7/3sETpVSl0VTsjS3LbsBmf5D3rEM1hJIckvEOiiisEyFoIoOa71lTa
	WfLKxMZoOSOzjzoSCaBqHVdunmvwEaKj0kYj5cWkdc2sIGTbMJBLZ3JEZ2OXOZ4TTgGAuEoR0S4
	z6p0TeiNOW+OHo47PQZx+A8gbQYXJVh4455984xLpJYbRW23nYkIbhvmVlxXo/csdQfwid5Ja02
	lo5HYoZ66oUehRgtZSFy4hQRSaqLWoYEkPBmOBjGopP2SfbtC/7sX6ppu6ytx0mGBwnZcAtFwWt
	4FftaPB+RQUvnjD4a4mkQOhjzEVEldixeEwjEcvtonHiHDe1+0dXLDFiKAkuP7k3I+s3KeRkrF3
	L5hHu1MY+4pgdXVQlGZLUEhk/f1ZIfs82xwAT1hGO0OQtg4D9qcjqNcYGwh0qG4TXNkDMBdfSvZ
	W+XK95zS8LrbFNg==
X-Received: by 2002:a05:6000:438a:b0:48e:127a:c914 with SMTP id ffacd0b85a97d-4aa545e25cdmr39653477f8f.5.1795538584196;
        Tue, 24 Nov 2026 08:43:04 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm27223198f8f.22.2026.11.24.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:03 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 1/2] neatvnc: backport the nettle 4 port and its fixes
Date: Tue, 24 Nov 2026 16:42:42 +0000
Message-ID: <20261124164242.60688-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 16:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132954
Content-Type: text/plain; charset="utf-8"

neatvnc 1.0.4's nettle backend does not build against nettle 4.0, which
oe-core now has. Upstream has ported it, and fixed two crashes the port
introduced: the WebSocket handshake passed the hash size where the hash
type belongs (a SIGSEGV on every connection), and nettle 4 aborts the
Apple Diffie-Hellman login because base16_decode_update() now takes the
output buffer's size. None of this is in a release yet.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../0001-Use-nettle-hogweed-version-4.patch   |  83 +++++++++
 ...pto-Remove-hash-digest-size-argument.patch | 160 ++++++++++++++++++
 ...ake-Fix-crypto_hash_many-argument-mi.patch |  27 +++
 ...ypto-fix-base16-decode-buffer-length.patch |  29 ++++
 .../recipes-graphics/neatvnc/neatvnc_1.0.4.bb |   7 +-
 5 files changed, 305 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-nettle-hogweed-version-4.patch
 create mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0002-crypto-Remove-hash-digest-size-argument.patch
 create mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0003-stream-ws-handshake-Fix-crypto_hash_many-argument-mi.patch
 create mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc/0004-crypto-fix-base16-decode-buffer-length.patch

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-nettle-hogweed-version-4.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-nettle-hogweed-version-4.patch
new file mode 100644
index 000000000000..e5335080aaf9
--- /dev/null
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-nettle-hogweed-version-4.patch
@@ -0,0 +1,83 @@
+From 9056d5fc68c2a84bdbbf089fcbac9e2ba7d093cb Mon Sep 17 00:00:00 2001
+From: Andri Yngvason <andri@yngvason.is>
+Date: Sun, 17 May 2026 09:57:07 +0000
+Subject: [PATCH 1/4] Use nettle & hogweed version 4
+
+Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/5b190f0fd9e6]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ meson.build                | 6 ++++--
+ src/crypto/nettle/cipher.c | 8 ++++----
+ src/crypto/nettle/hash.c   | 2 +-
+ 3 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index cf8d67423f9c..b79606729e94 100644
+--- a/meson.build
++++ b/meson.build
+@@ -61,8 +61,10 @@ libm = cc.find_library('m', required: false)
+ pixman = dependency('pixman-1')
+ libturbojpeg = dependency('libturbojpeg', required: get_option('jpeg'))
+ gnutls = dependency('gnutls', required: get_option('tls'))
+-nettle = dependency('nettle', required: get_option('nettle'))
+-hogweed = dependency('hogweed', required: get_option('nettle'))
++nettle = dependency('nettle', required: get_option('nettle'),
++                    version: ['>=4.0', '<5.0'])
++hogweed = dependency('hogweed', required: get_option('nettle'),
++                     version: ['>=4.0', '<5.0'])
+ gmp = dependency('gmp', required: get_option('nettle'))
+ zlib = dependency('zlib')
+ gbm = dependency('gbm', required: get_option('gbm'))
+diff --git a/src/crypto/nettle/cipher.c b/src/crypto/nettle/cipher.c
+index 0dd2262f09cc..6eb8770f2119 100644
+--- a/src/crypto/nettle/cipher.c
++++ b/src/crypto/nettle/cipher.c
+@@ -119,7 +119,7 @@ static bool crypto_cipher_aes_eax_encrypt(struct crypto_cipher* self,
+ 			(uint8_t*)dst->data + dst->len, src);
+ 	dst->len += src_len;
+ 
+-	nettle_eax_aes128_digest(&self->enc_ctx.aes_eax.ctx, 16, mac);
++	nettle_eax_aes128_digest(&self->enc_ctx.aes_eax.ctx, mac);
+ 
+ 	return true;
+ }
+@@ -131,7 +131,7 @@ static ssize_t crypto_cipher_aes_eax_decrypt(struct crypto_cipher* self,
+ 	crypto_aes_eax_update_nonce(&self->dec_ctx.aes_eax);
+ 	nettle_eax_aes128_update(&self->dec_ctx.aes_eax.ctx, ad_len, ad);
+ 	nettle_eax_aes128_decrypt(&self->dec_ctx.aes_eax.ctx, len, dst, src);
+-	nettle_eax_aes128_digest(&self->dec_ctx.aes_eax.ctx, 16, mac);
++	nettle_eax_aes128_digest(&self->dec_ctx.aes_eax.ctx, mac);
+ 	return len;
+ }
+ 
+@@ -179,7 +179,7 @@ static bool crypto_cipher_aes256_eax_encrypt(struct crypto_cipher* self,
+ 			(uint8_t*)dst->data + dst->len, src);
+ 	dst->len += src_len;
+ 
+-	EAX_DIGEST(&self->enc_ctx.aes256_eax.ctx, aes256_encrypt, 16, mac);
++	EAX_DIGEST(&self->enc_ctx.aes256_eax.ctx, aes256_encrypt, mac);
+ 
+ 	return true;
+ }
+@@ -191,7 +191,7 @@ static ssize_t crypto_cipher_aes256_eax_decrypt(struct crypto_cipher* self,
+ 	crypto_aes256_eax_update_nonce(&self->dec_ctx.aes256_eax);
+ 	EAX_UPDATE(&self->dec_ctx.aes256_eax.ctx, aes256_encrypt, ad_len, ad);
+ 	EAX_DECRYPT(&self->dec_ctx.aes256_eax.ctx, aes256_encrypt, len, dst, src);
+-	EAX_DIGEST(&self->dec_ctx.aes256_eax.ctx, aes256_encrypt, 16, mac);
++	EAX_DIGEST(&self->dec_ctx.aes256_eax.ctx, aes256_encrypt, mac);
+ 	return len;
+ }
+ 
+diff --git a/src/crypto/nettle/hash.c b/src/crypto/nettle/hash.c
+index 71318f4a1c0b..9fbfe5f7c717 100644
+--- a/src/crypto/nettle/hash.c
++++ b/src/crypto/nettle/hash.c
+@@ -21,7 +21,7 @@
+ #include <stdlib.h>
+ #include <nettle/md5.h>
+ #include <nettle/sha1.h>
+-#include <nettle/sha.h>
++#include <nettle/sha2.h>
+ 
+ struct crypto_hash {
+ 	union {
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0002-crypto-Remove-hash-digest-size-argument.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0002-crypto-Remove-hash-digest-size-argument.patch
new file mode 100644
index 000000000000..526b446cf402
--- /dev/null
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc/0002-crypto-Remove-hash-digest-size-argument.patch
@@ -0,0 +1,160 @@
+From 11dc4a4ce000fd3de7699da939195726b147d5de Mon Sep 17 00:00:00 2001
+From: Andri Yngvason <andri@yngvason.is>
+Date: Tue, 19 May 2026 21:23:59 +0000
+Subject: [PATCH 2/4] crypto: Remove hash digest size argument
+
+This has been removed in nettle 4.
+
+Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/f97805deaaea]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ include/crypto.h          |  7 +++----
+ src/auth/apple-dh.c       |  3 +--
+ src/auth/rsa-aes.c        | 16 ++++++++--------
+ src/crypto/nettle/hash.c  | 14 +++++++-------
+ src/stream/ws/handshake.c |  3 +--
+ 5 files changed, 20 insertions(+), 23 deletions(-)
+
+diff --git a/include/crypto.h b/include/crypto.h
+index 9a1aee415f12..1e5886f7b2fe 100644
+--- a/include/crypto.h
++++ b/include/crypto.h
+@@ -88,12 +88,11 @@ void crypto_hash_del(struct crypto_hash* self);
+ 
+ void crypto_hash_append(struct crypto_hash* self, const uint8_t* src,
+ 		size_t len);
+-void crypto_hash_digest(struct crypto_hash* self, uint8_t* dst,
+-		size_t len);
++void crypto_hash_digest(struct crypto_hash* self, uint8_t* dst);
+ 
+-void crypto_hash_one(uint8_t* dst, size_t dst_len, enum crypto_hash_type type,
++void crypto_hash_one(uint8_t* dst, enum crypto_hash_type type,
+ 		const uint8_t* src, size_t src_len);
+-void crypto_hash_many(uint8_t* dst, size_t dst_len, enum crypto_hash_type type,
++void crypto_hash_many(uint8_t* dst, enum crypto_hash_type type,
+ 		const struct crypto_data_entry *src);
+ 
+ // RSA
+diff --git a/src/auth/apple-dh.c b/src/auth/apple-dh.c
+index 43833970892c..238561861155 100644
+--- a/src/auth/apple-dh.c
++++ b/src/auth/apple-dh.c
+@@ -78,8 +78,7 @@ int apple_dh_handle_response(struct nvnc_client* client)
+ 	crypto_key_del(shared_secret);
+ 
+ 	uint8_t hash[16] = {};
+-	crypto_hash_one(hash, sizeof(hash), CRYPTO_HASH_MD5, shared_buf,
+-			sizeof(shared_buf));
++	crypto_hash_one(hash, CRYPTO_HASH_MD5, shared_buf, sizeof(shared_buf));
+ 
+ 	struct crypto_cipher* cipher;
+ 	cipher = crypto_cipher_new(NULL, hash, CRYPTO_CIPHER_AES128_ECB);
+diff --git a/src/auth/rsa-aes.c b/src/auth/rsa-aes.c
+index dea2e7c84e2d..d2f217d4c501 100644
+--- a/src/auth/rsa-aes.c
++++ b/src/auth/rsa-aes.c
+@@ -154,8 +154,8 @@ static int on_rsa_aes_challenge(struct nvnc_client* client)
+ 
+ 	// ClientSessionKey = the first 16 bytes of SHA1(ServerRandom || ClientRandom)
+ 	uint8_t client_session_key[32];
+-	crypto_hash_many(client_session_key, client_rsa_aes_hash_len(client),
+-			client->rsa.hash_type, (const struct crypto_data_entry[]) {
++	crypto_hash_many(client_session_key, client->rsa.hash_type,
++			(const struct crypto_data_entry[]) {
+ 		{ client->rsa.challenge, client->rsa.challenge_len },
+ 		{ client_random, client->rsa.challenge_len },
+ 		{}
+@@ -163,8 +163,8 @@ static int on_rsa_aes_challenge(struct nvnc_client* client)
+ 
+ 	// ServerSessionKey = the first 16 bytes of SHA1(ClientRandom || ServerRandom)
+ 	uint8_t server_session_key[32];
+-	crypto_hash_many(server_session_key, client_rsa_aes_hash_len(client),
+-			client->rsa.hash_type, (const struct crypto_data_entry[]) {
++	crypto_hash_many(server_session_key, client->rsa.hash_type,
++			(const struct crypto_data_entry[]) {
+ 		{ client_random, client->rsa.challenge_len },
+ 		{ client->rsa.challenge, client->rsa.challenge_len },
+ 		{}
+@@ -195,8 +195,8 @@ static int on_rsa_aes_challenge(struct nvnc_client* client)
+ 	uint32_t client_key_len_be = htonl(client_key_len * 8);
+ 
+ 	uint8_t server_hash[32] = {};
+-	crypto_hash_many(server_hash, client_rsa_aes_hash_len(client),
+-			client->rsa.hash_type, (const struct crypto_data_entry[]) {
++	crypto_hash_many(server_hash, client->rsa.hash_type,
++			(const struct crypto_data_entry[]) {
+ 		{ (uint8_t*)&server_key_len_be, 4 },
+ 		{ server_modulus, server_key_len },
+ 		{ server_exponent, server_key_len },
+@@ -249,8 +249,8 @@ static int on_rsa_aes_client_hash(struct nvnc_client* client)
+ 	uint32_t client_key_len_be = htonl(client_key_len * 8);
+ 
+ 	uint8_t client_hash[32] = {};
+-	crypto_hash_many(client_hash, client_rsa_aes_hash_len(client),
+-			client->rsa.hash_type, (const struct crypto_data_entry[]) {
++	crypto_hash_many(client_hash, client->rsa.hash_type,
++			(const struct crypto_data_entry[]) {
+ 		{ (uint8_t*)&client_key_len_be, 4 },
+ 		{ client_modulus, client_key_len },
+ 		{ client_exponent, client_key_len },
+diff --git a/src/crypto/nettle/hash.c b/src/crypto/nettle/hash.c
+index 9fbfe5f7c717..832953305d44 100644
+--- a/src/crypto/nettle/hash.c
++++ b/src/crypto/nettle/hash.c
+@@ -31,7 +31,7 @@ struct crypto_hash {
+ 	} ctx;
+ 
+ 	void (*update)(void* ctx, size_t len, const uint8_t* src);
+-	void (*digest)(void* ctx, size_t len, uint8_t* dst);
++	void (*digest)(void* ctx, uint8_t* dst);
+ };
+ 
+ struct crypto_hash* crypto_hash_new(enum crypto_hash_type type)
+@@ -75,27 +75,27 @@ void crypto_hash_append(struct crypto_hash* self, const uint8_t* src,
+ 	self->update(&self->ctx, len, src);
+ }
+ 
+-void crypto_hash_digest(struct crypto_hash* self, uint8_t* dst, size_t len)
++void crypto_hash_digest(struct crypto_hash* self, uint8_t* dst)
+ {
+-	self->digest(&self->ctx, len, dst);
++	self->digest(&self->ctx, dst);
+ }
+ 
+-void crypto_hash_one(uint8_t* dst, size_t dst_len, enum crypto_hash_type type,
++void crypto_hash_one(uint8_t* dst, enum crypto_hash_type type,
+ 		const uint8_t* src, size_t src_len)
+ {
+ 	struct crypto_hash *hash = crypto_hash_new(type);
+ 	crypto_hash_append(hash, src, src_len);
+-	crypto_hash_digest(hash, dst, dst_len);
++	crypto_hash_digest(hash, dst);
+ 	crypto_hash_del(hash);
+ }
+ 
+-void crypto_hash_many(uint8_t* dst, size_t dst_len, enum crypto_hash_type type,
++void crypto_hash_many(uint8_t* dst, enum crypto_hash_type type,
+ 		const struct crypto_data_entry *src)
+ {
+ 	struct crypto_hash *hash = crypto_hash_new(type);
+ 	for (int i = 0; src[i].data && src[i].len; ++i)
+ 		crypto_hash_append(hash, src[i].data, src[i].len);
+-	crypto_hash_digest(hash, dst, dst_len);
++	crypto_hash_digest(hash, dst);
+ 	crypto_hash_del(hash);
+ }
+ 
+diff --git a/src/stream/ws/handshake.c b/src/stream/ws/handshake.c
+index 80881189236e..aa0db3f9f2c2 100644
+--- a/src/stream/ws/handshake.c
++++ b/src/stream/ws/handshake.c
+@@ -79,8 +79,7 @@ ssize_t ws_handshake(char* output, size_t output_maxlen, const char* input)
+ 		goto failure;
+ 
+ 	uint8_t hash[20];
+-	crypto_hash_many(hash, sizeof(hash), CRYPTO_HASH_SHA1,
+-			(struct crypto_data_entry[]){
++	crypto_hash_many(hash, sizeof(hash), (struct crypto_data_entry[]){
+ 		{ (uint8_t*)challenge, strlen(challenge) },
+ 		{ (uint8_t*)magic_uuid, strlen(magic_uuid) },
+ 		{}
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0003-stream-ws-handshake-Fix-crypto_hash_many-argument-mi.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0003-stream-ws-handshake-Fix-crypto_hash_many-argument-mi.patch
new file mode 100644
index 000000000000..4be9ac9c6d79
--- /dev/null
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc/0003-stream-ws-handshake-Fix-crypto_hash_many-argument-mi.patch
@@ -0,0 +1,27 @@
+From 0c1a96814ac70ae59905cfbb013c3d6e3147b703 Mon Sep 17 00:00:00 2001
+From: Andri Yngvason <andri@yngvason.is>
+Date: Thu, 30 Jul 2026 10:35:25 +0000
+Subject: [PATCH 3/4] stream: ws: handshake: Fix crypto_hash_many argument
+ mixup
+
+This fixes mistake in f97805deaaea489a1c8c851324163a92a3125195.
+
+Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/8e0d226064d0]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/stream/ws/handshake.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/stream/ws/handshake.c b/src/stream/ws/handshake.c
+index aa0db3f9f2c2..9cb6f1c58856 100644
+--- a/src/stream/ws/handshake.c
++++ b/src/stream/ws/handshake.c
+@@ -79,7 +79,7 @@ ssize_t ws_handshake(char* output, size_t output_maxlen, const char* input)
+ 		goto failure;
+ 
+ 	uint8_t hash[20];
+-	crypto_hash_many(hash, sizeof(hash), (struct crypto_data_entry[]){
++	crypto_hash_many(hash, CRYPTO_HASH_SHA1, (struct crypto_data_entry[]){
+ 		{ (uint8_t*)challenge, strlen(challenge) },
+ 		{ (uint8_t*)magic_uuid, strlen(magic_uuid) },
+ 		{}
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0004-crypto-fix-base16-decode-buffer-length.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0004-crypto-fix-base16-decode-buffer-length.patch
new file mode 100644
index 000000000000..b550495b7a71
--- /dev/null
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc/0004-crypto-fix-base16-decode-buffer-length.patch
@@ -0,0 +1,29 @@
+From 556ea1d187a70c08c99d0871c8920e3f7874664f Mon Sep 17 00:00:00 2001
+From: Chad Voegele <chad@voegele.me>
+Date: Thu, 11 Jun 2026 12:41:03 +0000
+Subject: [PATCH 4/4] crypto: fix base16 decode buffer length
+
+Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/8057ec4ad673]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/crypto/nettle/key.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/crypto/nettle/key.c b/src/crypto/nettle/key.c
+index 3b69de259436..45e53187fc22 100644
+--- a/src/crypto/nettle/key.c
++++ b/src/crypto/nettle/key.c
+@@ -91,7 +91,7 @@ static void initialise_p(mpz_t p)
+ 		"15728E5A8AACAA68FFFFFFFFFFFFFFFF";
+ 
+ 	char buf[256];
+-	size_t len = 0;
++	size_t len = sizeof(buf);
+ 	struct base16_decode_ctx ctx;
+ 	nettle_base16_decode_init(&ctx);
+ 	nettle_base16_decode_update(&ctx, &len, (uint8_t*)buf, sizeof(s) - 1, s);
+@@ -174,4 +174,3 @@ struct crypto_key* crypto_derive_shared_secret(
+ 
+ 	return shared;
+ }
+-
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb
index 44e3b156f9b9..c341b21a6405 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb
@@ -4,7 +4,12 @@ HOMEPAGE = "https://github.com/any1/neatvnc"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
-SRC_URI = "git://github.com/any1/neatvnc;branch=v1.0;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/any1/neatvnc;branch=v1.0;protocol=https;tag=v${PV} \
+           file://0001-Use-nettle-hogweed-version-4.patch \
+           file://0002-crypto-Remove-hash-digest-size-argument.patch \
+           file://0003-stream-ws-handshake-Fix-crypto_hash_many-argument-mi.patch \
+           file://0004-crypto-fix-base16-decode-buffer-length.patch \
+           "
 
 SRCREV = "ffce32d6d04e702d5d8055e28e038c7f68a0caf4"
 
