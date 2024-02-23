Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF58C54E4A
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 08:37:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6599.1708677442062686464
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 00:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bIEeeJY0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2783f3eaa2=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N6tdKc017456
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 00:37:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=8qtHm2q9ojdCYBN85uw2ERzbScFCjS+Ra7B6AsTqEUc=; b=
	bIEeeJY0VLsHzRffItheqjwwgIS8pCEn5a/pcj5KrkHx3c6l6Fh7qK/uxuiGHbme
	251nREhPnRFBQFCmbU8Jx8RUGkQHzxS8hHebQXd4c3vF8d8H5YOE1G0/3zO+mSm+
	ETegxBvZX/9qjeBjtwDGZkbkFDi8DR7Ize277ml5ovp21tRuhldlLFQtrVBSWog2
	xrh04/L+Mdt/knjLrJsf2njBhkt9n8kXmTSkbx7NBUaeEQpaRhx4zbNvA9ezYUR6
	j6EHK8IbwdBKRTtw4G6vs1J6dgt8vhO/Skz3/sN5UGpgN68S3lAQZaBynmfdjvQZ
	lX13YSxlK/3VoVo5T/4NwA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20cjxn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 00:37:21 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 00:37:19 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 4/4] nodjes: fix CVE-2023-46809
Date: Fri, 23 Feb 2024 08:36:20 +0000
Message-ID: <20240223083620.182565-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240223083620.182565-1-archana.polampalli@windriver.com>
References: <20240223083620.182565-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: JKp50Mkl3Ntvu3T9qA_8_l6qJQJaGdNX
X-Proofpoint-ORIG-GUID: JKp50Mkl3Ntvu3T9qA_8_l6qJQJaGdNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109007

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2023-46809.patch        | 120 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |   3 +-
 2 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch
new file mode 100644
index 000000000..87550e996
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch
@@ -0,0 +1,120 @@
+From 54cd268059626800dbe1e02a88b28d9538cf5587 Mon Sep 17 00:00:00 2001
+From: Michael Dawson <midawson@redhat.com>
+Date: Thu, 4 Jan 2024 21:32:51 +0000
+Subject: [PATCH 5/5] crypto: disable PKCS#1 padding for privateDecrypt
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
+Refs: https://hackerone.com/bugs?subject=nodejs&report_id=2269177
+Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+
+CVE-ID: CVE-2023-46809
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/54cd268059626800]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/crypto/crypto_cipher.cc          | 26 ++++++++++++++++++
+ test/parallel/test-crypto-rsa-dsa.js | 41 ++++++++++++++++++++--------
+ 2 files changed, 55 insertions(+), 12 deletions(-)
+
+diff --git a/src/crypto/crypto_cipher.cc b/src/crypto/crypto_cipher.cc
+index 10579ce..d1dcc99 100644
+--- a/src/crypto/crypto_cipher.cc
++++ b/src/crypto/crypto_cipher.cc
+@@ -1061,6 +1061,32 @@ void PublicKeyCipher::Cipher(const FunctionCallbackInfo<Value>& args) {
+   uint32_t padding;
+   if (!args[offset + 1]->Uint32Value(env->context()).To(&padding)) return;
+
++  if (EVP_PKEY_cipher == EVP_PKEY_decrypt &&
++      operation == PublicKeyCipher::kPrivate && padding == RSA_PKCS1_PADDING) {
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
++          " this can be reverted with --security-revert=CVE-2024-PEND");
++    }
++  }
++
+   const EVP_MD* digest = nullptr;
+   if (args[offset + 2]->IsString()) {
+     const Utf8Value oaep_str(env->isolate(), args[offset + 2]);
+diff --git a/test/parallel/test-crypto-rsa-dsa.js b/test/parallel/test-crypto-rsa-dsa.js
+index 9afcb38..601f510 100644
+--- a/test/parallel/test-crypto-rsa-dsa.js
++++ b/test/parallel/test-crypto-rsa-dsa.js
+@@ -221,19 +221,36 @@ function test_rsa(padding, encryptOaepHash, decryptOaepHash) {
+     oaepHash: encryptOaepHash
+   }, bufferToEncrypt);
+
+-  let decryptedBuffer = crypto.privateDecrypt({
+-    key: rsaKeyPem,
+-    padding: padding,
+-    oaepHash: decryptOaepHash
+-  }, encryptedBuffer);
+-  assert.deepStrictEqual(decryptedBuffer, input);
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
index 2c1037e7e..8fdadd081 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -30,7 +30,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2024-22019.patch \
            file://CVE-2024-21892-0001.patch \
            file://CVE-2024-21892-0002.patch \
-           file:// CVE-2024-22025.patch \
+           file://CVE-2024-22025.patch \
+           file://CVE-2023-46809.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.40.0


