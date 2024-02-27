Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C18C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:37:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10098.1709033854397425498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A9+F7iFE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27871ec9df=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R6TlVC008396
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 03:37:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=AndDVU68rXORjlw3sdrklGF+/+V6I6wZboYSatZh8qU=; b=
	A9+F7iFEYsB3/Ev5sNcafZuGhaC+7y8xWFQbUysWy4Lp1oH22QFGmsknRTsQrzVS
	K/2SBmY2mkqvGo85ikvRQ2pABBcUJ8LLV9j3fS2WjQ+fVcPw9u7DjpOoRBiuO4YZ
	5WMvb52oNFG9c75stKid/hZgAW/rVKI5N5rW9f0x8zK87vCYHNQXu70mgtwo+JwR
	V+CTlioOpCzXNM8S9VDMDFVDIA2/2Y5Lz1CSx2jZItKWlpHuc4mZP2xAknbLvsQ7
	HlH0D5RzE31DGc3JFWhEmnU57o54jDRp5b9TFiYq4uDW0RK/B8WxmSFsZKTlEQH4
	hGxEgBP+8JfISrcKePkuAA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42tkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 03:37:33 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 03:37:31 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH V2 2/2] nodejs: fix CVE-2023-46809
Date: Tue, 27 Feb 2024 11:37:17 +0000
Message-ID: <20240227113717.1068213-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240227113717.1068213-1-archana.polampalli@windriver.com>
References: <20240227113717.1068213-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: D1b20FiouZ8osbwVN3CjLtgKcc0l9tH4
X-Proofpoint-GUID: D1b20FiouZ8osbwVN3CjLtgKcc0l9tH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 11:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109043

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2023-46809.patch        | 625 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |   1 +
 2 files changed, 626 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch
new file mode 100644
index 000000000..991d39fcf
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch
@@ -0,0 +1,625 @@
+From d3d357ab096884f10f5d2f164149727eea875635 Mon Sep 17 00:00:00 2001
+From: Michael Dawson <midawson@redhat.com>
+Date: Thu, 4 Jan 2024 21:32:51 +0000
+Subject: [PATCH] crypto: disable PKCS#1 padding for privateDecrypt
+
+Refs: https://hackerone.com/bugs?subject=nodejs&report_id=2269177
+
+Disable RSA_PKCS1_PADDING for crypto.privateDecrypt() in order
+to protect against the Marvin attack.
+
+Includes a security revert flag that can be used to restore
+support.
+
+Signed-off-by: Michael Dawson <midawson@redhat.com>
+PR-URL: https://github.com/nodejs-private/node-private/pull/525
+Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+
+CVE-ID: CVE-2023-46809
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/d3d357ab096884f1]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/crypto/crypto_cipher.cc                 |  28 ++
+ src/node_revert.h                           |   1 +
+ test/parallel/test-crypto-rsa-dsa-revert.js | 475 ++++++++++++++++++++
+ test/parallel/test-crypto-rsa-dsa.js        |  42 +-
+ 4 files changed, 533 insertions(+), 13 deletions(-)
+ create mode 100644 test/parallel/test-crypto-rsa-dsa-revert.js
+
+diff --git a/src/crypto/crypto_cipher.cc b/src/crypto/crypto_cipher.cc
+index 10579ce..0311c68 100644
+--- a/src/crypto/crypto_cipher.cc
++++ b/src/crypto/crypto_cipher.cc
+@@ -6,6 +6,7 @@
+ #include "node_buffer.h"
+ #include "node_internals.h"
+ #include "node_process-inl.h"
++#include "node_revert.h"
+ #include "v8.h"
+
+ namespace node {
+@@ -1061,6 +1062,33 @@ void PublicKeyCipher::Cipher(const FunctionCallbackInfo<Value>& args) {
+   uint32_t padding;
+   if (!args[offset + 1]->Uint32Value(env->context()).To(&padding)) return;
+
++  if (EVP_PKEY_cipher == EVP_PKEY_decrypt &&
++      operation == PublicKeyCipher::kPrivate && padding == RSA_PKCS1_PADDING &&
++      !IsReverted(SECURITY_REVERT_CVE_2023_46809)) {
++    EVPKeyCtxPointer ctx(EVP_PKEY_CTX_new(pkey.get(), nullptr));
++    CHECK(ctx);
++
++    if (EVP_PKEY_decrypt_init(ctx.get()) <= 0) {
++      return ThrowCryptoError(env, ERR_get_error());
++    }
++
++    int rsa_pkcs1_implicit_rejection =
++        EVP_PKEY_CTX_ctrl_str(ctx.get(), "rsa_pkcs1_implicit_rejection", "1");
++    // From the doc -2 means that the option is not supported.
++    // The default for the option is enabled and if it has been
++    // specifically disabled we want to respect that so we will
++    // not throw an error if the option is supported regardless
++    // of how it is set. The call to set the value
++    // will not affect what is used since a different context is
++    // used in the call if the option is supported
++    if (rsa_pkcs1_implicit_rejection <= 0) {
++      return THROW_ERR_INVALID_ARG_VALUE(
++          env,
++          "RSA_PKCS1_PADDING is no longer supported for private decryption,"
++          " this can be reverted with --security-revert=CVE-2023-46809");
++    }
++  }
++
+   const EVP_MD* digest = nullptr;
+   if (args[offset + 2]->IsString()) {
+     const Utf8Value oaep_str(env->isolate(), args[offset + 2]);
+diff --git a/src/node_revert.h b/src/node_revert.h
+index 83dcb62..bc2a288 100644
+--- a/src/node_revert.h
++++ b/src/node_revert.h
+@@ -18,6 +18,7 @@ namespace node {
+ #define SECURITY_REVERSIONS(XX)                                            \
+   XX(CVE_2021_44531, "CVE-2021-44531", "Cert Verif Bypass via URI SAN")    \
+   XX(CVE_2021_44532, "CVE-2021-44532", "Cert Verif Bypass via Str Inject") \
++  XX(CVE_2023_46809, "CVE-2023-46809", "Marvin attack on PKCS#1 padding") \
+ //  XX(CVE_2016_PEND, "CVE-2016-PEND", "Vulnerability Title")
+
+ enum reversion {
+diff --git a/test/parallel/test-crypto-rsa-dsa-revert.js b/test/parallel/test-crypto-rsa-dsa-revert.js
+new file mode 100644
+index 0000000..84ec8f6
+--- /dev/null
++++ b/test/parallel/test-crypto-rsa-dsa-revert.js
+@@ -0,0 +1,475 @@
++'use strict';
++// Flags: --security-revert=CVE-2023-46809
++const common = require('../common');
++if (!common.hasCrypto)
++  common.skip('missing crypto');
++
++const assert = require('assert');
++const crypto = require('crypto');
++
++const constants = crypto.constants;
++
++const fixtures = require('../common/fixtures');
++
++// Test certificates
++const certPem = fixtures.readKey('rsa_cert.crt');
++const keyPem = fixtures.readKey('rsa_private.pem');
++const rsaKeySize = 2048;
++const rsaPubPem = fixtures.readKey('rsa_public.pem', 'ascii');
++const rsaKeyPem = fixtures.readKey('rsa_private.pem', 'ascii');
++const rsaKeyPemEncrypted = fixtures.readKey('rsa_private_encrypted.pem',
++                                            'ascii');
++const dsaPubPem = fixtures.readKey('dsa_public.pem', 'ascii');
++const dsaKeyPem = fixtures.readKey('dsa_private.pem', 'ascii');
++const dsaKeyPemEncrypted = fixtures.readKey('dsa_private_encrypted.pem',
++                                            'ascii');
++const rsaPkcs8KeyPem = fixtures.readKey('rsa_private_pkcs8.pem');
++const dsaPkcs8KeyPem = fixtures.readKey('dsa_private_pkcs8.pem');
++
++const ec = new TextEncoder();
++
++const openssl1DecryptError = {
++  message: 'error:06065064:digital envelope routines:EVP_DecryptFinal_ex:' +
++    'bad decrypt',
++  code: 'ERR_OSSL_EVP_BAD_DECRYPT',
++  reason: 'bad decrypt',
++  function: 'EVP_DecryptFinal_ex',
++  library: 'digital envelope routines',
++};
++
++const decryptError = common.hasOpenSSL3 ?
++  { message: 'error:1C800064:Provider routines::bad decrypt' } :
++  openssl1DecryptError;
++
++const decryptPrivateKeyError = common.hasOpenSSL3 ? {
++  message: 'error:1C800064:Provider routines::bad decrypt',
++} : openssl1DecryptError;
++
++function getBufferCopy(buf) {
++  return buf.buffer.slice(buf.byteOffset, buf.byteOffset + buf.byteLength);
++}
++
++// Test RSA encryption/decryption
++{
++  const input = 'I AM THE WALRUS';
++  const bufferToEncrypt = Buffer.from(input);
++  const bufferPassword = Buffer.from('password');
++
++  let encryptedBuffer = crypto.publicEncrypt(rsaPubPem, bufferToEncrypt);
++
++  // Test other input types
++  let otherEncrypted;
++  {
++    const ab = getBufferCopy(ec.encode(rsaPubPem));
++    const ab2enc = getBufferCopy(bufferToEncrypt);
++
++    crypto.publicEncrypt(ab, ab2enc);
++    crypto.publicEncrypt(new Uint8Array(ab), new Uint8Array(ab2enc));
++    crypto.publicEncrypt(new DataView(ab), new DataView(ab2enc));
++    otherEncrypted = crypto.publicEncrypt({
++      key: Buffer.from(ab).toString('hex'),
++      encoding: 'hex'
++    }, Buffer.from(ab2enc).toString('hex'));
++  }
++
++  let decryptedBuffer = crypto.privateDecrypt(rsaKeyPem, encryptedBuffer);
++  const otherDecrypted = crypto.privateDecrypt(rsaKeyPem, otherEncrypted);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++  assert.strictEqual(otherDecrypted.toString(), input);
++
++  decryptedBuffer = crypto.privateDecrypt(rsaPkcs8KeyPem, encryptedBuffer);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++
++  let decryptedBufferWithPassword = crypto.privateDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: 'password'
++  }, encryptedBuffer);
++
++  const otherDecryptedBufferWithPassword = crypto.privateDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: ec.encode('password')
++  }, encryptedBuffer);
++
++  assert.strictEqual(
++    otherDecryptedBufferWithPassword.toString(),
++    decryptedBufferWithPassword.toString());
++
++  decryptedBufferWithPassword = crypto.privateDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: 'password'
++  }, encryptedBuffer);
++
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  encryptedBuffer = crypto.publicEncrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: 'password'
++  }, bufferToEncrypt);
++
++  decryptedBufferWithPassword = crypto.privateDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: 'password'
++  }, encryptedBuffer);
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  encryptedBuffer = crypto.privateEncrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, bufferToEncrypt);
++
++  decryptedBufferWithPassword = crypto.publicDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, encryptedBuffer);
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  // Now with explicit RSA_PKCS1_PADDING.
++  encryptedBuffer = crypto.privateEncrypt({
++    padding: crypto.constants.RSA_PKCS1_PADDING,
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, bufferToEncrypt);
++
++  decryptedBufferWithPassword = crypto.publicDecrypt({
++    padding: crypto.constants.RSA_PKCS1_PADDING,
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, encryptedBuffer);
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  // Omitting padding should be okay because RSA_PKCS1_PADDING is the default.
++  decryptedBufferWithPassword = crypto.publicDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, encryptedBuffer);
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  // Now with RSA_NO_PADDING. Plaintext needs to match key size.
++  // OpenSSL 3.x has a rsa_check_padding that will cause an error if
++  // RSA_NO_PADDING is used.
++  if (!common.hasOpenSSL3) {
++    {
++      const plaintext = 'x'.repeat(rsaKeySize / 8);
++      encryptedBuffer = crypto.privateEncrypt({
++        padding: crypto.constants.RSA_NO_PADDING,
++        key: rsaKeyPemEncrypted,
++        passphrase: bufferPassword
++      }, Buffer.from(plaintext));
++
++      decryptedBufferWithPassword = crypto.publicDecrypt({
++        padding: crypto.constants.RSA_NO_PADDING,
++        key: rsaKeyPemEncrypted,
++        passphrase: bufferPassword
++      }, encryptedBuffer);
++      assert.strictEqual(decryptedBufferWithPassword.toString(), plaintext);
++    }
++  }
++
++  encryptedBuffer = crypto.publicEncrypt(certPem, bufferToEncrypt);
++
++  decryptedBuffer = crypto.privateDecrypt(keyPem, encryptedBuffer);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++
++  encryptedBuffer = crypto.publicEncrypt(keyPem, bufferToEncrypt);
++
++  decryptedBuffer = crypto.privateDecrypt(keyPem, encryptedBuffer);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++
++  encryptedBuffer = crypto.privateEncrypt(keyPem, bufferToEncrypt);
++
++  decryptedBuffer = crypto.publicDecrypt(keyPem, encryptedBuffer);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++
++  assert.throws(() => {
++    crypto.privateDecrypt({
++      key: rsaKeyPemEncrypted,
++      passphrase: 'wrong'
++    }, bufferToEncrypt);
++  }, decryptError);
++
++  assert.throws(() => {
++    crypto.publicEncrypt({
++      key: rsaKeyPemEncrypted,
++      passphrase: 'wrong'
++    }, encryptedBuffer);
++  }, decryptError);
++
++  encryptedBuffer = crypto.privateEncrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: Buffer.from('password')
++  }, bufferToEncrypt);
++
++  assert.throws(() => {
++    crypto.publicDecrypt({
++      key: rsaKeyPemEncrypted,
++      passphrase: Buffer.from('wrong')
++    }, encryptedBuffer);
++  }, decryptError);
++}
++
++function test_rsa(padding, encryptOaepHash, decryptOaepHash) {
++  const size = (padding === 'RSA_NO_PADDING') ? rsaKeySize / 8 : 32;
++  const input = Buffer.allocUnsafe(size);
++  for (let i = 0; i < input.length; i++)
++    input[i] = (i * 7 + 11) & 0xff;
++  const bufferToEncrypt = Buffer.from(input);
++
++  padding = constants[padding];
++
++  const encryptedBuffer = crypto.publicEncrypt({
++    key: rsaPubPem,
++    padding: padding,
++    oaepHash: encryptOaepHash
++  }, bufferToEncrypt);
++
++  let decryptedBuffer = crypto.privateDecrypt({
++    key: rsaKeyPem,
++    padding: padding,
++    oaepHash: decryptOaepHash
++  }, encryptedBuffer);
++  assert.deepStrictEqual(decryptedBuffer, input);
++
++  decryptedBuffer = crypto.privateDecrypt({
++    key: rsaPkcs8KeyPem,
++    padding: padding,
++    oaepHash: decryptOaepHash
++  }, encryptedBuffer);
++  assert.deepStrictEqual(decryptedBuffer, input);
++}
++
++test_rsa('RSA_NO_PADDING');
++test_rsa('RSA_PKCS1_PADDING');
++test_rsa('RSA_PKCS1_OAEP_PADDING');
++
++// Test OAEP with different hash functions.
++test_rsa('RSA_PKCS1_OAEP_PADDING', undefined, 'sha1');
++test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha1', undefined);
++test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha256', 'sha256');
++test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha512', 'sha512');
++assert.throws(() => {
++  test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha256', 'sha512');
++}, {
++  code: 'ERR_OSSL_RSA_OAEP_DECODING_ERROR'
++});
++
++// The following RSA-OAEP test cases were created using the WebCrypto API to
++// ensure compatibility when using non-SHA1 hash functions.
++{
++  const { decryptionTests } =
++      JSON.parse(fixtures.readSync('rsa-oaep-test-vectors.js', 'utf8'));
++
++  for (const { ct, oaepHash, oaepLabel } of decryptionTests) {
++    const label = oaepLabel ? Buffer.from(oaepLabel, 'hex') : undefined;
++    const copiedLabel = oaepLabel ? getBufferCopy(label) : undefined;
++
++    const decrypted = crypto.privateDecrypt({
++      key: rsaPkcs8KeyPem,
++      oaepHash,
++      oaepLabel: oaepLabel ? label : undefined
++    }, Buffer.from(ct, 'hex'));
++
++    assert.strictEqual(decrypted.toString('utf8'), 'Hello Node.js');
++
++    const otherDecrypted = crypto.privateDecrypt({
++      key: rsaPkcs8KeyPem,
++      oaepHash,
++      oaepLabel: copiedLabel
++    }, Buffer.from(ct, 'hex'));
++
++    assert.strictEqual(otherDecrypted.toString('utf8'), 'Hello Node.js');
++  }
++}
++
++// Test invalid oaepHash and oaepLabel options.
++for (const fn of [crypto.publicEncrypt, crypto.privateDecrypt]) {
++  assert.throws(() => {
++    fn({
++      key: rsaPubPem,
++      oaepHash: 'Hello world'
++    }, Buffer.alloc(10));
++  }, {
++    code: 'ERR_OSSL_EVP_INVALID_DIGEST'
++  });
++
++  for (const oaepHash of [0, false, null, Symbol(), () => {}]) {
++    assert.throws(() => {
++      fn({
++        key: rsaPubPem,
++        oaepHash
++      }, Buffer.alloc(10));
++    }, {
++      code: 'ERR_INVALID_ARG_TYPE'
++    });
++  }
++
++  for (const oaepLabel of [0, false, null, Symbol(), () => {}, {}]) {
++    assert.throws(() => {
++      fn({
++        key: rsaPubPem,
++        oaepLabel
++      }, Buffer.alloc(10));
++    }, {
++      code: 'ERR_INVALID_ARG_TYPE'
++    });
++  }
++}
++
++// Test RSA key signing/verification
++let rsaSign = crypto.createSign('SHA1');
++let rsaVerify = crypto.createVerify('SHA1');
++assert.ok(rsaSign);
++assert.ok(rsaVerify);
++
++const expectedSignature = fixtures.readKey(
++  'rsa_public_sha1_signature_signedby_rsa_private_pkcs8.sha1',
++  'hex'
++);
++
++rsaSign.update(rsaPubPem);
++let rsaSignature = rsaSign.sign(rsaKeyPem, 'hex');
++assert.strictEqual(rsaSignature, expectedSignature);
++
++rsaVerify.update(rsaPubPem);
++assert.strictEqual(rsaVerify.verify(rsaPubPem, rsaSignature, 'hex'), true);
++
++// Test RSA PKCS#8 key signing/verification
++rsaSign = crypto.createSign('SHA1');
++rsaSign.update(rsaPubPem);
++rsaSignature = rsaSign.sign(rsaPkcs8KeyPem, 'hex');
++assert.strictEqual(rsaSignature, expectedSignature);
++
++rsaVerify = crypto.createVerify('SHA1');
++rsaVerify.update(rsaPubPem);
++assert.strictEqual(rsaVerify.verify(rsaPubPem, rsaSignature, 'hex'), true);
++
++// Test RSA key signing/verification with encrypted key
++rsaSign = crypto.createSign('SHA1');
++rsaSign.update(rsaPubPem);
++const signOptions = { key: rsaKeyPemEncrypted, passphrase: 'password' };
++rsaSignature = rsaSign.sign(signOptions, 'hex');
++assert.strictEqual(rsaSignature, expectedSignature);
++
++rsaVerify = crypto.createVerify('SHA1');
++rsaVerify.update(rsaPubPem);
++assert.strictEqual(rsaVerify.verify(rsaPubPem, rsaSignature, 'hex'), true);
++
++rsaSign = crypto.createSign('SHA1');
++rsaSign.update(rsaPubPem);
++assert.throws(() => {
++  const signOptions = { key: rsaKeyPemEncrypted, passphrase: 'wrong' };
++  rsaSign.sign(signOptions, 'hex');
++}, decryptPrivateKeyError);
++
++//
++// Test RSA signing and verification
++//
++{
++  const privateKey = fixtures.readKey('rsa_private_b.pem');
++  const publicKey = fixtures.readKey('rsa_public_b.pem');
++
++  const input = 'I AM THE WALRUS';
++
++  const signature = fixtures.readKey(
++    'I_AM_THE_WALRUS_sha256_signature_signedby_rsa_private_b.sha256',
++    'hex'
++  );
++
++  const sign = crypto.createSign('SHA256');
++  sign.update(input);
++
++  const output = sign.sign(privateKey, 'hex');
++  assert.strictEqual(output, signature);
++
++  const verify = crypto.createVerify('SHA256');
++  verify.update(input);
++
++  assert.strictEqual(verify.verify(publicKey, signature, 'hex'), true);
++
++  // Test the legacy signature algorithm name.
++  const sign2 = crypto.createSign('RSA-SHA256');
++  sign2.update(input);
++
++  const output2 = sign2.sign(privateKey, 'hex');
++  assert.strictEqual(output2, signature);
++
++  const verify2 = crypto.createVerify('SHA256');
++  verify2.update(input);
++
++  assert.strictEqual(verify2.verify(publicKey, signature, 'hex'), true);
++}
++
++
++//
++// Test DSA signing and verification
++//
++{
++  const input = 'I AM THE WALRUS';
++
++  // DSA signatures vary across runs so there is no static string to verify
++  // against.
++  const sign = crypto.createSign('SHA1');
++  sign.update(input);
++  const signature = sign.sign(dsaKeyPem, 'hex');
++
++  const verify = crypto.createVerify('SHA1');
++  verify.update(input);
++
++  assert.strictEqual(verify.verify(dsaPubPem, signature, 'hex'), true);
++
++  // Test the legacy 'DSS1' name.
++  const sign2 = crypto.createSign('DSS1');
++  sign2.update(input);
++  const signature2 = sign2.sign(dsaKeyPem, 'hex');
++
++  const verify2 = crypto.createVerify('DSS1');
++  verify2.update(input);
++
++  assert.strictEqual(verify2.verify(dsaPubPem, signature2, 'hex'), true);
++}
++
++
++//
++// Test DSA signing and verification with PKCS#8 private key
++//
++{
++  const input = 'I AM THE WALRUS';
++
++  // DSA signatures vary across runs so there is no static string to verify
++  // against.
++  const sign = crypto.createSign('SHA1');
++  sign.update(input);
++  const signature = sign.sign(dsaPkcs8KeyPem, 'hex');
++
++  const verify = crypto.createVerify('SHA1');
++  verify.update(input);
++
++  assert.strictEqual(verify.verify(dsaPubPem, signature, 'hex'), true);
++}
++
++
++//
++// Test DSA signing and verification with encrypted key
++//
++const input = 'I AM THE WALRUS';
++
++{
++  const sign = crypto.createSign('SHA1');
++  sign.update(input);
++  assert.throws(() => {
++    sign.sign({ key: dsaKeyPemEncrypted, passphrase: 'wrong' }, 'hex');
++  }, decryptPrivateKeyError);
++}
++
++{
++  // DSA signatures vary across runs so there is no static string to verify
++  // against.
++  const sign = crypto.createSign('SHA1');
++  sign.update(input);
++  const signOptions = { key: dsaKeyPemEncrypted, passphrase: 'password' };
++  const signature = sign.sign(signOptions, 'hex');
++
++  const verify = crypto.createVerify('SHA1');
++  verify.update(input);
++
++  assert.strictEqual(verify.verify(dsaPubPem, signature, 'hex'), true);
++}
+diff --git a/test/parallel/test-crypto-rsa-dsa.js b/test/parallel/test-crypto-rsa-dsa.js
+index 9afcb38..fd27827 100644
+--- a/test/parallel/test-crypto-rsa-dsa.js
++++ b/test/parallel/test-crypto-rsa-dsa.js
+@@ -220,20 +220,36 @@ function test_rsa(padding, encryptOaepHash, decryptOaepHash) {
+     padding: padding,
+     oaepHash: encryptOaepHash
+   }, bufferToEncrypt);
++  if (padding === constants.RSA_PKCS1_PADDING) {
++    assert.throws(() => {
++      crypto.privateDecrypt({
++        key: rsaKeyPem,
++        padding: padding,
++        oaepHash: decryptOaepHash
++      }, encryptedBuffer);
++    }, { code: 'ERR_INVALID_ARG_VALUE' });
++    assert.throws(() => {
++      crypto.privateDecrypt({
++        key: rsaPkcs8KeyPem,
++        padding: padding,
++        oaepHash: decryptOaepHash
++      }, encryptedBuffer);
++    }, { code: 'ERR_INVALID_ARG_VALUE' });
++  } else {
++    let decryptedBuffer = crypto.privateDecrypt({
++      key: rsaKeyPem,
++      padding: padding,
++      oaepHash: decryptOaepHash
++    }, encryptedBuffer);
++    assert.deepStrictEqual(decryptedBuffer, input);
+
+-  let decryptedBuffer = crypto.privateDecrypt({
+-    key: rsaKeyPem,
+-    padding: padding,
+-    oaepHash: decryptOaepHash
+-  }, encryptedBuffer);
+-  assert.deepStrictEqual(decryptedBuffer, input);
+-
+-  decryptedBuffer = crypto.privateDecrypt({
+-    key: rsaPkcs8KeyPem,
+-    padding: padding,
+-    oaepHash: decryptOaepHash
+-  }, encryptedBuffer);
+-  assert.deepStrictEqual(decryptedBuffer, input);
++    decryptedBuffer = crypto.privateDecrypt({
++      key: rsaPkcs8KeyPem,
++      padding: padding,
++      oaepHash: decryptOaepHash
++    }, encryptedBuffer);
++    assert.deepStrictEqual(decryptedBuffer, input);
++  }
+ }
+
+ test_rsa('RSA_NO_PADDING');
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index b4261eaf8..c03461df4 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2022-25883.patch \
            file://CVE-2024-22019.patch \
            file://CVE-2024-22025.patch \
+           file://CVE-2023-46809.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.40.0


