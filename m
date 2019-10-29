Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E14347F9CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCL1CrnzPG
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373886;
	bh=MBu2l+E5YDMIjCUQDZ1AcYArOAQrh9czmckG3UaWM+k=;
	h=From:To:Subject:Date:From;
	b=YoRd3A1mZVCZVdwbX/ii5ZlcWLW1t4vX76AftSMwTDvVEv3I0WkTZTcME6w9j+ge1
	sATTLdvKDXFz/EK9EdsAQD2rq5qgpg8ZjfrB0nwgxyUG7souTWPB7o9oone3qE3+5f
	PI5Tz831rmEMGXWy7cOMvsuhfE4nTQO+G4cFVXR2EACZ3rwUG7VC0xNUeaPE5hhlwz
	IO9YPCW1ZiiTrSUdqG91B88wbWqgcqf/9bks/+f8qZOZzwtM3A5p1XxrZVNgt1M718
	n6RYTnUXrhPOBV1UuTy5m8CEL5Du02aWU5/IhRvJ/kJfxrodmL8BgZiIayb6ZpPKBo
	joeXDroMgDuSiGh7YwaNNZnW2WsE2XdgBYnByh/lwmTPNYTxf3yDSLRz5vH+SFO3Oi
	R3mTZqhWFI05+aC8UokHrAoRDMurPhcEjGqkz5etxSwXJF6B/wncGml/qV7iY4aboA
	s5sLEHZnnKR1B2o0dVgHvIq0529UC0AHUwUyv83Pu/AMFaCxN9sYgnf4ZsP+xinflA
	DRH3Guvf2ncHSVRQhusQeOtytkJBnF9JxQ59xgc1OUiHxhE9sC92kEv42QTIPgjs2C
	Dh//J1ui/s/ukeKwTvwNYl62QWdqUGi9pcPMOZfDiuG4AFBH+XyFcqI7I4qhct6JsT
	z7iZd4kOslpyrQaXv1Ybof58=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:18 +0200
Message-Id: <20191029183123.1868-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nodejs: Upgrade 10.16.3 -> 10.17.0
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...pto-reduce-memory-usage-of-SignFinal.patch | 122 ------------------
 .../{nodejs_10.16.3.bb => nodejs_10.17.0.bb}  |   5 +-
 2 files changed, 2 insertions(+), 125 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Crypto-reduce-memory-usage-of-SignFinal.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_10.16.3.bb => nodejs_10.17.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Crypto-reduce-memory-usage-of-SignFinal.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Crypto-reduce-memory-usage-of-SignFinal.patch
deleted file mode 100644
index ed3bac39b..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Crypto-reduce-memory-usage-of-SignFinal.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 20282b1cb0389553421c4c5b14de198c5dfff50b Mon Sep 17 00:00:00 2001
-From: Anna Henningsen <anna@addaleax.net>
-Date: Sat, 20 Oct 2018 05:24:54 +0200
-Subject: [PATCH] src: use more explicit return type in Sign::SignFinal()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Using the non-indexed variant of `std::get<>` broke Travis CI.
-Also, this allows us to be a bit more concise when returning
-from `SignFinal()` due to some error condition.
-
-Refs: https://github.com/nodejs/node/pull/23427
-
-PR-URL: https://github.com/nodejs/node/pull/23779
-Reviewed-By: Joyee Cheung <joyeec9h3@gmail.com>
-Reviewed-By: Tobias Nießen <tniessen@tnie.de>
-Reviewed-By: Refael Ackermann <refack@gmail.com>
-Reviewed-By: Colin Ihrig <cjihrig@gmail.com>
----
- src/node_crypto.cc | 23 +++++++++++------------
- src/node_crypto.h  | 12 +++++++++++-
- 2 files changed, 22 insertions(+), 13 deletions(-)
-
-diff --git a/src/node_crypto.cc b/src/node_crypto.cc
-index bd8d9e032554..ec7d4f2bb5be 100644
---- a/src/node_crypto.cc
-+++ b/src/node_crypto.cc
-@@ -3562,22 +3562,20 @@ static MallocedBuffer<unsigned char> Node_SignFinal(EVPMDPointer&& mdctx,
-   return MallocedBuffer<unsigned char>();
- }
- 
--std::pair<SignBase::Error, MallocedBuffer<unsigned char>> Sign::SignFinal(
-+Sign::SignResult Sign::SignFinal(
-     const char* key_pem,
-     int key_pem_len,
-     const char* passphrase,
-     int padding,
-     int salt_len) {
--  MallocedBuffer<unsigned char> buffer;
--
-   if (!mdctx_)
--    return std::make_pair(kSignNotInitialised, std::move(buffer));
-+    return SignResult(kSignNotInitialised);
- 
-   EVPMDPointer mdctx = std::move(mdctx_);
- 
-   BIOPointer bp(BIO_new_mem_buf(const_cast<char*>(key_pem), key_pem_len));
-   if (!bp)
--    return std::make_pair(kSignPrivateKey, std::move(buffer));
-+    return SignResult(kSignPrivateKey);
- 
-   EVPKeyPointer pkey(PEM_read_bio_PrivateKey(bp.get(),
-                                              nullptr,
-@@ -3588,7 +3586,7 @@ std::pair<SignBase::Error, MallocedBuffer<unsigned char>> Sign::SignFinal(
-   // without `pkey` being set to nullptr;
-   // cf. the test of `test_bad_rsa_privkey.pem` for an example.
-   if (!pkey || 0 != ERR_peek_error())
--    return std::make_pair(kSignPrivateKey, std::move(buffer));
-+    return SignResult(kSignPrivateKey);
- 
- #ifdef NODE_FIPS_MODE
-   /* Validate DSA2 parameters from FIPS 186-4 */
-@@ -3612,9 +3610,10 @@ std::pair<SignBase::Error, MallocedBuffer<unsigned char>> Sign::SignFinal(
-   }
- #endif  // NODE_FIPS_MODE
- 
--  buffer = Node_SignFinal(std::move(mdctx), pkey, padding, salt_len);
-+  MallocedBuffer<unsigned char> buffer =
-+      Node_SignFinal(std::move(mdctx), pkey, padding, salt_len);
-   Error error = buffer.is_empty() ? kSignPrivateKey : kSignOk;
--  return std::make_pair(error, std::move(buffer));
-+  return SignResult(error, std::move(buffer));
- }
- 
- 
-@@ -3639,18 +3638,18 @@ void Sign::SignFinal(const FunctionCallbackInfo<Value>& args) {
- 
-   ClearErrorOnReturn clear_error_on_return;
- 
--  std::pair<Error, MallocedBuffer<unsigned char>> ret = sign->SignFinal(
-+  SignResult ret = sign->SignFinal(
-       buf,
-       buf_len,
-       len >= 2 && !args[1]->IsNull() ? *passphrase : nullptr,
-       padding,
-       salt_len);
- 
--  if (std::get<Error>(ret) != kSignOk)
--    return sign->CheckThrow(std::get<Error>(ret));
-+  if (ret.error != kSignOk)
-+    return sign->CheckThrow(ret.error);
- 
-   MallocedBuffer<unsigned char> sig =
--      std::move(std::get<MallocedBuffer<unsigned char>>(ret));
-+      std::move(ret.signature);
- 
-   Local<Object> rc =
-       Buffer::New(env, reinterpret_cast<char*>(sig.release()), sig.size)
-diff --git a/src/node_crypto.h b/src/node_crypto.h
-index 6fcf737f6c43..0c26c1f6ff1d 100644
---- a/src/node_crypto.h
-+++ b/src/node_crypto.h
-@@ -518,7 +518,17 @@ class Sign : public SignBase {
-  public:
-   static void Initialize(Environment* env, v8::Local<v8::Object> target);
- 
--  std::pair<Error, MallocedBuffer<unsigned char>> SignFinal(
-+  struct SignResult {
-+    Error error;
-+    MallocedBuffer<unsigned char> signature;
-+
-+    explicit SignResult(
-+        Error err,
-+        MallocedBuffer<unsigned char>&& sig = MallocedBuffer<unsigned char>())
-+      : error(err), signature(std::move(sig)) {}
-+  };
-+
-+  SignResult SignFinal(
-       const char* key_pem,
-       int key_pem_len,
-       const char* passphrase,
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index a978eebe4..bc12df307 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -17,7 +17,6 @@ COMPATIBLE_HOST_riscv32 = "null"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
-           file://0003-Crypto-reduce-memory-usage-of-SignFinal.patch \
            file://0004-Make-compatibility-with-gcc-4.8.patch \
            file://0005-Link-atomic-library.patch \
            file://0006-Use-target-ldflags.patch \
@@ -26,8 +25,8 @@ SRC_URI_append_class-target = " \
            file://0002-Using-native-torque.patch \
            "
 
-SRC_URI[md5sum] = "b41275a018e670947c1950b12f050a2f"
-SRC_URI[sha256sum] = "7bf1123d7415964775b8f81fe6ec6dd5c3c08abb42bb71dfe4409dbeeba26bbd"
+SRC_URI[md5sum] = "d5a56d0abf764a91f627f0690cd4b9f3"
+SRC_URI[sha256sum] = "412667d76bd5273c07cb69c215998109fd5bb35c874654f93e6a0132d666c58e"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1


