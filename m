Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA55C678D4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 12:32:46 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.21697.1677846755789687699
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Mar 2023 04:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kdzhgseu;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso5953101pjr.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 04:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677846755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1u6sa1Ka0HSF8n5xCZMnBJ9bRRrmfTra4RB8cuhRWs=;
        b=kdzhgseuIwO6QhHH2K8UM64NhBTGg9oYKldVDi1NQdA33EgL+pR3A9sm6gz/qOssKS
         mqfGI/xVR6owIV8rVZ3Z8MumJo1vF7SZDbTDk4awDdJol3Nz1Pnv85V4qRHJMiCxAtzr
         cHMsykk51dxHbCdG3lUhOfFPuH6xAe6WC4/4bLbhjUqE63klaZGWkgCC5+x1IR9Lk2bV
         Jf9C1YXxwteBbB7pu7goAm0fDd4N7897W05aRGaCjkPjrn0G2WA5sJqxk80uyhMHkqdi
         bRoWCxW0XsJbtPzAt4GQZZe3AV1QIPsieCEdj1RqLMw7JmFc1JMfqcAWfBs1NPyA+49D
         pxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677846755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1u6sa1Ka0HSF8n5xCZMnBJ9bRRrmfTra4RB8cuhRWs=;
        b=WFL9dUCxYbIoHUgIOQKvquYzVbS6CfOdJR31KP2Y2IasKBh2y20lY3czLhxdxN8aGV
         +xctHc97531e2JXp9XSeeGeI4S53T1CUdretFhm+ecyX3gV98KKO6auEoeC4oQ5hP5Cw
         ER37bw0r+UNDNx4WCBgVbZovs4UhLaBNL3053pyEi6MjKrLeLpk58vizcRBbRyYWYOQ9
         E4XO0+aEywcBw0OyTuHtgG0R55Z8RCd6C0FYXesn113sKZirM7e1oGvq43uSCquYItf3
         iOIsft1e9po/crOO1d1PYNLNL/PYZy9z1VTh7ECsbFhCXNYTckz2dFdqswysyKTZPZz6
         kI5g==
X-Gm-Message-State: AO0yUKUIKvezIP/MMJPY/Swlayan84N+WAs3OTn4otOsENRc+mjfVsgD
	naWxuJfriy+tiiBkL7bmbAP/lZGeLIBIHg==
X-Google-Smtp-Source: AK7set+l+CTocBK7SjyoHJtuvR0l8NM+ANbCAjVAypXIaqZmZvL7IUYNoIaHB8Pio2whm6xKXJLDng==
X-Received: by 2002:a05:6a20:8407:b0:cc:eb3b:56e9 with SMTP id c7-20020a056a20840700b000cceb3b56e9mr2694484pzd.1.1677846754769;
        Fri, 03 Mar 2023 04:32:34 -0800 (PST)
Received: from localhost.localdomain ([27.58.236.238])
        by smtp.gmail.com with ESMTPSA id j37-20020a63fc25000000b00478c48cf73csm1449881pgi.82.2023.03.03.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:32:34 -0800 (PST)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	ppjadhav456@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Poonam Jadhav <Poonam.Jadhav@kpit.com>,
	Omkar Patil <omkarpatil10.93@gmail.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 2/4] nodejs: Fix CVE-2022-35255
Date: Fri,  3 Mar 2023 18:02:13 +0530
Message-Id: <20230303123215.296036-2-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303123215.296036-1-omkarpatil10.93@gmail.com>
References: <20230303123215.296036-1-omkarpatil10.93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 12:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101348

From: Poonam Jadhav <Poonam.Jadhav@kpit.com>

Add patch to fix CVE-2022-35255

Link: https://sources.debian.org/src/nodejs/12.22.12~dfsg-1~deb11u3/debian/patches/cve-2022-35255.patch

Signed-off-by: Poonam Jadhav <Poonam.Jadhav@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 .../nodejs/nodejs/CVE-2022-35255.patch        | 237 ++++++++++++++++++
 .../nodejs/nodejs_12.22.12.bb                 |   1 +
 2 files changed, 238 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-35255.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-35255.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-35255.patch
new file mode 100644
index 000000000..e9c2e7404
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-35255.patch
@@ -0,0 +1,237 @@
+Origin: https://github.com/nodejs/node/commit/0c2a5723beff39d1f62daec96b5389da3d427e79
+Reviewed-by: Aron Xu <aron@debian.org>
+Last-Update: 2022-01-05
+Comment:
+  Although WebCrypto is not implemented in 12.x series, this fix is introducing
+  enhancment to the crypto setup of V8:EntropySource().
+
+commit 0c2a5723beff39d1f62daec96b5389da3d427e79
+Author: Ben Noordhuis <info@bnoordhuis.nl>
+Date:   Sun Sep 11 10:48:34 2022 +0200
+
+    crypto: fix weak randomness in WebCrypto keygen
+    
+    Commit dae283d96f from August 2020 introduced a call to EntropySource()
+    in SecretKeyGenTraits::DoKeyGen() in src/crypto/crypto_keygen.cc. There
+    are two problems with that:
+    
+    1. It does not check the return value, it assumes EntropySource() always
+       succeeds, but it can (and sometimes will) fail.
+    
+    2. The random data returned byEntropySource() may not be
+       cryptographically strong and therefore not suitable as keying
+       material.
+    
+    An example is a freshly booted system or a system without /dev/random or
+    getrandom(2).
+    
+    EntropySource() calls out to openssl's RAND_poll() and RAND_bytes() in a
+    best-effort attempt to obtain random data. OpenSSL has a built-in CSPRNG
+    but that can fail to initialize, in which case it's possible either:
+    
+    1. No random data gets written to the output buffer, i.e., the output is
+       unmodified, or
+    
+    2. Weak random data is written. It's theoretically possible for the
+       output to be fully predictable because the CSPRNG starts from a
+       predictable state.
+    
+    Replace EntropySource() and CheckEntropy() with new function CSPRNG()
+    that enforces checking of the return value. Abort on startup when the
+    entropy pool fails to initialize because that makes it too easy to
+    compromise the security of the process.
+    
+    Refs: https://hackerone.com/bugs?report_id=1690000
+    Refs: https://github.com/nodejs/node/pull/35093
+    
+    Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+    Reviewed-By: Tobias Nießen <tniessen@tnie.de>
+    PR-URL: #346
+    Backport-PR-URL: #351
+    CVE-ID: CVE-2022-35255
+
+CVE: CVE-2022-35255
+Upstream-Status: Backport [https://sources.debian.org/src/nodejs/12.22.12~dfsg-1~deb11u3/debian/patches/cve-2022-35255.patch]
+Comment: No hunks refreshed
+Signed-off-by: Poonam Jadhav <Poonam.Jadhav@kpit.com>
+
+Index: nodejs-12.22.12~dfsg/node.gyp
+===================================================================
+--- nodejs-12.22.12~dfsg.orig/node.gyp
++++ nodejs-12.22.12~dfsg/node.gyp
+@@ -743,6 +743,8 @@
+         'openssl_default_cipher_list%': '',
+       },
+ 
++      'cflags': ['-Werror=unused-result'],
++
+       'defines': [
+         'NODE_ARCH="<(target_arch)"',
+         'NODE_PLATFORM="<(OS)"',
+Index: nodejs-12.22.12~dfsg/src/node_crypto.cc
+===================================================================
+--- nodejs-12.22.12~dfsg.orig/src/node_crypto.cc
++++ nodejs-12.22.12~dfsg/src/node_crypto.cc
+@@ -386,48 +386,14 @@ void ThrowCryptoError(Environment* env,
+   env->isolate()->ThrowException(exception);
+ }
+ 
++MUST_USE_RESULT CSPRNGResult CSPRNG(void* buffer, size_t length) {
++  do {
++    if (1 == RAND_status())
++      if (1 == RAND_bytes(static_cast<unsigned char*>(buffer), length))
++        return {true};
++  } while (1 == RAND_poll());
+ 
+-// Ensure that OpenSSL has enough entropy (at least 256 bits) for its PRNG.
+-// The entropy pool starts out empty and needs to fill up before the PRNG
+-// can be used securely.  Once the pool is filled, it never dries up again;
+-// its contents is stirred and reused when necessary.
+-//
+-// OpenSSL normally fills the pool automatically but not when someone starts
+-// generating random numbers before the pool is full: in that case OpenSSL
+-// keeps lowering the entropy estimate to thwart attackers trying to guess
+-// the initial state of the PRNG.
+-//
+-// When that happens, we will have to wait until enough entropy is available.
+-// That should normally never take longer than a few milliseconds.
+-//
+-// OpenSSL draws from /dev/random and /dev/urandom.  While /dev/random may
+-// block pending "true" randomness, /dev/urandom is a CSPRNG that doesn't
+-// block under normal circumstances.
+-//
+-// The only time when /dev/urandom may conceivably block is right after boot,
+-// when the whole system is still low on entropy.  That's not something we can
+-// do anything about.
+-inline void CheckEntropy() {
+-  for (;;) {
+-    int status = RAND_status();
+-    CHECK_GE(status, 0);  // Cannot fail.
+-    if (status != 0)
+-      break;
+-
+-    // Give up, RAND_poll() not supported.
+-    if (RAND_poll() == 0)
+-      break;
+-  }
+-}
+-
+-
+-bool EntropySource(unsigned char* buffer, size_t length) {
+-  // Ensure that OpenSSL's PRNG is properly seeded.
+-  CheckEntropy();
+-  // RAND_bytes() can return 0 to indicate that the entropy data is not truly
+-  // random. That's okay, it's still better than V8's stock source of entropy,
+-  // which is /dev/urandom on UNIX platforms and the current time on Windows.
+-  return RAND_bytes(buffer, length) != -1;
++  return {false};
+ }
+ 
+ void SecureContext::Initialize(Environment* env, Local<Object> target) {
+@@ -649,9 +615,9 @@ void SecureContext::Init(const FunctionC
+   // OpenSSL 1.1.0 changed the ticket key size, but the OpenSSL 1.0.x size was
+   // exposed in the public API. To retain compatibility, install a callback
+   // which restores the old algorithm.
+-  if (RAND_bytes(sc->ticket_key_name_, sizeof(sc->ticket_key_name_)) <= 0 ||
+-      RAND_bytes(sc->ticket_key_hmac_, sizeof(sc->ticket_key_hmac_)) <= 0 ||
+-      RAND_bytes(sc->ticket_key_aes_, sizeof(sc->ticket_key_aes_)) <= 0) {
++  if (CSPRNG(sc->ticket_key_name_, sizeof(sc->ticket_key_name_)).is_err() ||
++      CSPRNG(sc->ticket_key_hmac_, sizeof(sc->ticket_key_hmac_)).is_err() ||
++      CSPRNG(sc->ticket_key_aes_, sizeof(sc->ticket_key_aes_)).is_err()) {
+     return env->ThrowError("Error generating ticket keys");
+   }
+   SSL_CTX_set_tlsext_ticket_key_cb(sc->ctx_.get(), TicketCompatibilityCallback);
+@@ -1643,7 +1609,7 @@ int SecureContext::TicketCompatibilityCa
+ 
+   if (enc) {
+     memcpy(name, sc->ticket_key_name_, sizeof(sc->ticket_key_name_));
+-    if (RAND_bytes(iv, 16) <= 0 ||
++    if (CSPRNG(iv, 16).is_err() ||
+         EVP_EncryptInit_ex(ectx, EVP_aes_128_cbc(), nullptr,
+                            sc->ticket_key_aes_, iv) <= 0 ||
+         HMAC_Init_ex(hctx, sc->ticket_key_hmac_, sizeof(sc->ticket_key_hmac_),
+@@ -5867,8 +5833,7 @@ struct RandomBytesJob : public CryptoJob
+       : CryptoJob(env), rc(Nothing<int>()) {}
+ 
+   inline void DoThreadPoolWork() override {
+-    CheckEntropy();  // Ensure that OpenSSL's PRNG is properly seeded.
+-    rc = Just(RAND_bytes(data, size));
++    rc = Just(int(CSPRNG(data, size).is_ok()));
+     if (0 == rc.FromJust()) errors.Capture();
+   }
+ 
+@@ -6318,8 +6283,8 @@ class GenerateKeyPairJob : public Crypto
+   }
+ 
+   inline bool GenerateKey() {
+-    // Make sure that the CSPRNG is properly seeded so the results are secure.
+-    CheckEntropy();
++    // Make sure that the CSPRNG is properly seeded.
++    CHECK(CSPRNG(nullptr, 0).is_ok());
+ 
+     // Create the key generation context.
+     EVPKeyCtxPointer ctx = config_->Setup();
+Index: nodejs-12.22.12~dfsg/src/node_crypto.h
+===================================================================
+--- nodejs-12.22.12~dfsg.orig/src/node_crypto.h
++++ nodejs-12.22.12~dfsg/src/node_crypto.h
+@@ -840,7 +840,19 @@ class ECDH final : public BaseObject {
+   const EC_GROUP* group_;
+ };
+ 
+-bool EntropySource(unsigned char* buffer, size_t length);
++struct CSPRNGResult {
++  const bool ok;
++  MUST_USE_RESULT bool is_ok() const { return ok; }
++  MUST_USE_RESULT bool is_err() const { return !ok; }
++};
++
++// Either succeeds with exactly |length| bytes of cryptographically
++// strong pseudo-random data, or fails. This function may block.
++// Don't assume anything about the contents of |buffer| on error.
++// As a special case, |length == 0| can be used to check if the CSPRNG
++// is properly seeded without consuming entropy.
++MUST_USE_RESULT CSPRNGResult CSPRNG(void* buffer, size_t length);
++
+ #ifndef OPENSSL_NO_ENGINE
+ void SetEngine(const v8::FunctionCallbackInfo<v8::Value>& args);
+ #endif  // !OPENSSL_NO_ENGINE
+Index: nodejs-12.22.12~dfsg/src/inspector_io.cc
+===================================================================
+--- nodejs-12.22.12~dfsg.orig/src/inspector_io.cc
++++ nodejs-12.22.12~dfsg/src/inspector_io.cc
+@@ -46,8 +46,7 @@ std::string ScriptPath(uv_loop_t* loop,
+ // Used ver 4 - with numbers
+ std::string GenerateID() {
+   uint16_t buffer[8];
+-  CHECK(crypto::EntropySource(reinterpret_cast<unsigned char*>(buffer),
+-                              sizeof(buffer)));
++  CHECK(crypto::CSPRNG(buffer, sizeof(buffer)).is_ok());
+ 
+   char uuid[256];
+   snprintf(uuid, sizeof(uuid), "%04x%04x-%04x-%04x-%04x-%04x%04x%04x",
+Index: nodejs-12.22.12~dfsg/src/node.cc
+===================================================================
+--- nodejs-12.22.12~dfsg.orig/src/node.cc
++++ nodejs-12.22.12~dfsg/src/node.cc
+@@ -969,9 +969,17 @@ InitializationResult InitializeOncePerPr
+   // the random source is properly initialized first.
+   OPENSSL_init();
+ #endif  // NODE_FIPS_MODE
+-  // V8 on Windows doesn't have a good source of entropy. Seed it from
+-  // OpenSSL's pool.
+-  V8::SetEntropySource(crypto::EntropySource);
++  // Ensure CSPRNG is properly seeded.
++  CHECK(crypto::CSPRNG(nullptr, 0).is_ok());
++
++  V8::SetEntropySource([](unsigned char* buffer, size_t length) {
++    // V8 falls back to very weak entropy when this function fails
++    // and /dev/urandom isn't available. That wouldn't be so bad if
++    // the entropy was only used for Math.random() but it's also used for
++    // hash table and address space layout randomization. Better to abort.
++    CHECK(crypto::CSPRNG(buffer, length).is_ok());
++    return true;
++    });
+ #endif  // HAVE_OPENSSL
+ 
+   per_process::v8_platform.Initialize(
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
index 2258cb108..df9c6010e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://mips-warnings.patch \
            file://0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch \
            file://CVE-2022-32212.patch \
+           file://CVE-2022-35255.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.25.1


