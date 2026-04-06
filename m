Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B4EF46C71
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 18:33:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61914.1775500379027121743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 11:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QVPY9N16;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso34864825e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 11:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775500377; x=1776105177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mpjXlg+v/Byr7SQ68oaDBVAZFj+vqDU5USg7N5fXsMk=;
        b=QVPY9N16vMfzXAxXN6va9Yk86RQDbClo+fF6rj1Pnfmu4Yr8Q8Xj1+V02Lz7KHBlS9
         QViLQeqhcUTxFyjxGKZH9C4qaf8CS43U0q/Ju6FLpqO8kLcHMNuR+c+1+LcFAJaK0i2p
         6F6jghLsuGAjyQzjSI4xsfvl2WC8DSs1Es5xmUGhlaB1gpU+FwPImriW2JNQcA4R59hj
         c04cjtFa72FuvTiiD/Xz71Kr4BhIRJoD7b3xFqh+X8jDcAVMIlRw2QBboI483OqiKVCs
         pF5PD9dc/C1wuaF6Vrvzja0z0c3DMBSLdP9EVJnQnYedoCCN5J7/LJUMHNMwq8C9U7NA
         dBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775500377; x=1776105177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpjXlg+v/Byr7SQ68oaDBVAZFj+vqDU5USg7N5fXsMk=;
        b=GYVdGDptkml+a6f75Q5Dkwdq6gdQq6KU3XJRdMwd54oe8huptalOFOx26Thjcu1+Az
         dZqWcfeje/L7urUBjSRKipdxpdq933HeaeSSJIL39KMzXJXe1KTo3dxG7UCcClcurr6x
         mE/hsS2r7av7WVL4PrboYlQy3+bt7SgOBJzsmr5bKvC9OeLZJ6P89gM9DQD+hm3KzwXe
         Ce8P5JiPV2/VsakuZWQF41UC1YQLe5GdsbvIFjD3Y+kDlKuHOv8NRiqSiB40YA0cMlln
         thf9Bs4USCZnkL6KlwPRcI5KS3PrOQtUNzEK+f4YHb/bSgT05dbQZ0XWYesoT6thtX0M
         zNnw==
X-Gm-Message-State: AOJu0YwIuXl14fYrJBbbzPxAzRzkPqecNPeRxYty+2kbGTyOm9qTbvAC
	rQeu0ZiHr/Vun8549KX1gp8UtFauHPfi7DzglzWHtYt3s3oX4yhE2xmA1+RyFQ==
X-Gm-Gg: AeBDietnbuciVK3fog7qbnB6+rEAeSZFNOzXzO7IQL/22mbs9NIu1eVn0WCAe7vRRB/
	eTQ1xqdtmwMww1EwlptsIM+S4K/MpsaiWVxap0f7BlqO3iCI2btPTrFY8gpHm4jHMek0cs7z85R
	zy8SVJfOKEJxTypPjNBXIa0nEmQp3ArJPFqECozEN6vZUfXZWBmf+HLXbn0wtzom5IiMRIYwP8S
	54HeW6zQusP4Kkup4SjVaoq7gSamiCC8aCgesgwBGAlB9svW2vysPgPEtNw1cECV2rFjWkqfUhW
	JMIxMQIMQt3MvQEqLrAtLAFUmoB3pGJrGVGnyWtZUV3NP1NqAP1Jg0WN/8N+lfjdxEoNLgSWLVb
	Ke53oLURVQVIjT6Z3cqSzeyZ0u0+Y6nfJg26mfY7jugIL7SeT+MLH0TlrGaGAdUUrVGVOMmXMdZ
	4f6tOTfVRTJgtc5JpNuPPb
X-Received: by 2002:a05:600c:a104:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-488995d1747mr148058445e9.0.1775500376985;
        Mon, 06 Apr 2026 11:32:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b64f03afsm61164515e9.0.2026.04.06.11.32.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:32:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/3] botan: patch CVE-2026-32877
Date: Mon,  6 Apr 2026 20:32:53 +0200
Message-ID: <20260406183255.3883660-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 18:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126059

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32877

Backport the patch that was identified by Debian[1].
The included test passed successfully (along with the other tests).

[1]: https://security-tracker.debian.org/tracker/CVE-2026-32877

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../botan/botan/CVE-2026-32877.patch          | 158 ++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_3.10.0.bb  |   4 +-
 2 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2026-32877.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/CVE-2026-32877.patch b/meta-oe/recipes-crypto/botan/botan/CVE-2026-32877.patch
new file mode 100644
index 0000000000..871f5c9a1b
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/CVE-2026-32877.patch
@@ -0,0 +1,158 @@
+From a0048a6b97a349a3cb4a5f955d350ab2921719cc Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sun, 15 Mar 2026 11:39:50 -0400
+Subject: [PATCH] In SM2 verify the C3 field is of the required length
+
+Previously the decryption step assumed that C3 was equal in length to the MAC
+output. If C3 is shorter than expected, up to 31 bytes of arbitrary heap data
+would be compared with the computed MAC. This heap over-read would potentially
+result in denial of service.
+
+CVE: CVE-2026-32877
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/f3c31f96f58f1d1d482032d8f4286dc9ebbc6712]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/pubkey/sm2/sm2_enc.cpp        |  7 +++-
+ src/tests/data/pubkey/sm2_invalid.vec | 60 +++++++++++++++++++++++++++
+ src/tests/test_sm2.cpp                | 31 ++++++++++++++
+ 3 files changed, 97 insertions(+), 1 deletion(-)
+ create mode 100644 src/tests/data/pubkey/sm2_invalid.vec
+
+diff --git a/src/lib/pubkey/sm2/sm2_enc.cpp b/src/lib/pubkey/sm2/sm2_enc.cpp
+index 7a1b990..1141089 100644
+--- a/src/lib/pubkey/sm2/sm2_enc.cpp
++++ b/src/lib/pubkey/sm2/sm2_enc.cpp
+@@ -133,6 +133,11 @@ class SM2_Decryption_Operation final : public PK_Ops::Decryption {
+             .end_cons()
+             .verify_end();
+ 
++         // Wrong length so certainly invalid, reject immediately
++         if(C3.size() != m_hash->output_length()) {
++            return secure_vector<uint8_t>();
++         }
++
+          std::vector<uint8_t> recode_ctext;
+          DER_Encoder(recode_ctext)
+             .start_sequence()
+@@ -170,7 +175,7 @@ class SM2_Decryption_Operation final : public PK_Ops::Decryption {
+          m_hash->update(y2_bytes);
+          const auto u = m_hash->final();
+ 
+-         if(!CT::is_equal(u.data(), C3.data(), m_hash->output_length()).as_bool()) {
++         if(!CT::is_equal<uint8_t>(u, C3).as_bool()) {
+             return secure_vector<uint8_t>();
+          }
+ 
+diff --git a/src/tests/data/pubkey/sm2_invalid.vec b/src/tests/data/pubkey/sm2_invalid.vec
+new file mode 100644
+index 0000000..2517510
+--- /dev/null
++++ b/src/tests/data/pubkey/sm2_invalid.vec
+@@ -0,0 +1,60 @@
++
++Key = 8C84F7F069CD09D59543ED980CFEB77E68C7D39B9B73D359EA67C0CDB2A86B6F
++
++
++# Empty
++Ctext =
++
++# Just the SEQUENCE marker
++Ctext = 30
++
++# Truncated
++Ctext = 3072022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF04202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E51
++
++# C3 MAC too short
++Ctext = 3071022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF041F2E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F36826493860409CA311F43DB0E5E516F
++
++# C3 MAC too long
++Ctext = 3073022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF04212E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F368264938696000409CA311F43DB0E5E516F
++
++# C3 and C2 fields swapped
++Ctext = 3072022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF0409CA311F43DB0E5E516F04202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F368264938696
++
++# C3 MAC last bit flipped
++Ctext = 3072022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF04202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386970409CA311F43DB0E5E516F
++
++# C3 MAC first byte inverted
++Ctext = 3072022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF0420D11B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F
++
++# C1 y off by one
++Ctext = 3072022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27D004202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F
++
++# C1 x/y serialization boundary shift
++Ctext = 3073022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E500200022100C055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E2704202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F
++
++# C1 is generator point
++Ctext = 3072022032C4AE2C1F1981195F9904466A39C9948FE30BBFF2660BE1715A4589334C74C7022100BC3736A2F4F6779C59BDCEE36B692153D0A9877CC62A474002DF32E52139F0A004202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F
++
++# C1 is origin (0,0)
++Ctext = 303302010002010004202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F
++
++# C1 x equals field prime
++Ctext = 3072022100FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF04202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F
++
++# C2 last bit flipped
++Ctext = 3072022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF04202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516E
++
++# C2 replaced with empty
++Ctext = 3069022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF04202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960400
++
++# Trailing byte after SEQUENCE
++Ctext = 3072022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF04202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F00
++
++# SEQUENCE with non-minimal long-form length
++Ctext = 308172022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF04202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F
++
++# INTEGER x1 with non-minimal leading zero
++Ctext = 307302220000A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF04202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F
++
++# OCTET STRING C3 with non-minimal long-form length
++Ctext = 3073022100A772DF5FFFDA85C05D9B82233B1E5F7DF7A87788504ABD4F74D265D49E5002C0022055C8A934A29DE58B31A063CDA81F12ABC712FB9ADC8988DA0FBD9FFF304E27CF0481202E1B8A86EF14243EE2E9D74E0D0E7498DFAC2F0EFA8C5883D74F3682649386960409CA311F43DB0E5E516F
+diff --git a/src/tests/test_sm2.cpp b/src/tests/test_sm2.cpp
+index 2ffb14a..c5d2360 100644
+--- a/src/tests/test_sm2.cpp
++++ b/src/tests/test_sm2.cpp
+@@ -9,6 +9,7 @@
+ 
+ #if defined(BOTAN_HAS_SM2)
+    #include "test_pubkey.h"
++   #include <botan/pubkey.h>
+    #include <botan/sm2.h>
+ #endif
+ 
+@@ -108,4 +109,34 @@ BOTAN_REGISTER_TEST("pubkey", "sm2_keygen", SM2_Keygen_Tests);
+ 
+ #endif
+ 
++namespace {
++
++class SM2_Invalid_Ciphertexts : public Text_Based_Test {
++   public:
++      SM2_Invalid_Ciphertexts() : Text_Based_Test("pubkey/sm2_invalid.vec", "Key,Ctext") {}
++
++      bool clear_between_callbacks() const override { return false; }
++
++      Test::Result run_one_test(const std::string& /*header*/, const VarMap& vars) override {
++         Test::Result result("SM2 invalid ciphertext");
++
++         const auto key = vars.get_req_bin("Key");
++         const auto ctext = vars.get_req_bin("Ctext");
++
++         const auto group = Botan::EC_Group::from_name("sm2p256v1");
++         const auto pkey = Botan::SM2_PrivateKey(group, Botan::EC_Scalar::deserialize(group, key).value());
++
++         Botan::PK_Decryptor_EME dec(pkey, rng(), "SM3");
++
++         result.test_throws<Botan::Exception>("Decryption should fail for invalid ciphertext",
++                                              [&] { dec.decrypt(ctext); });
++
++         return result;
++      }
++};
++
++BOTAN_REGISTER_TEST("pubkey", "sm2_invalid_ctext", SM2_Invalid_Ciphertexts);
++
++}  // namespace
++
+ }  // namespace Botan_Tests
diff --git a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
index e079dd73de..392c1aac94 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
@@ -4,7 +4,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://license.txt;md5=3f911cecfc74a2d9f1ead9a07bd92a6e"
 SECTION = "libs"
 
-SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
+SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
+           file://CVE-2026-32877.patch \
+           "
 SRC_URI[sha256sum] = "fde194236f6d5434f136ea0a0627f6cc9d26af8b96e9f1e1c7d8c82cd90f4f24"
 
 S = "${UNPACKDIR}/Botan-${PV}"

