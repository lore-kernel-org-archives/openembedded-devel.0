Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D99C46CD2
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 07:33:42 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.44451.1704526420082497415
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 23:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I3EWsTRV;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cce6c719caso2398891fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 23:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704526418; x=1705131218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uMrYRaSRy327TxhqEHzcWSGjEW6/QEekWa3vsLJ+14=;
        b=I3EWsTRVJmshxfmT5WWokVrqy1lzKMZPfzRtDd8Bms1oIfeQndN3qWoRpDxHCYDUOb
         4O1uamKcBJ850kr0xfMys4BpyxQ/DsAss/T3lOwmrOE/WnqWGRBxjeqljZCTg1/HTAjm
         clrZJ6z+YbP9CJ7F6YjF7I9OWCvVsVGANlurhgp3SkiX6B1FrJY6aYMy+F8pv8q9gIbn
         LtiDuvaZ/TDQxl5QiCqiW4R+SbUFBxTKf2XvhzKcSX+AQBvoKz6DIW8oyvNCJbhzUwLC
         aasQ6I8tYnAwtfU7zi+PXdZmiOA+bLqgGAgUI/Wow2NMMCGWM8aG29SDpGnFroxmC0dp
         ldTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704526418; x=1705131218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uMrYRaSRy327TxhqEHzcWSGjEW6/QEekWa3vsLJ+14=;
        b=ZrhUBTppixcUk1uGJ6qiarnGQOothZY+kA9bthlhzxrRNiE5XioXYK1v09EVfNlBDQ
         X6/KaQsAZx+puUWGjNeEbru3exRnGagkqxUb7PK/6eEDX+NlWrZbNm/4yrH5xYKsvIRP
         1cl+rOfCpXxNaPT3lKr2j2wIG2wkHY+0luGpaZIjoqMXkw6tMjlqQV4rGg1lJVbEI8fn
         7OpaEcWQB7x8Zk/eLBD+K9BIrmmqbFI4NyPw+8ysjjumhGkx4glKmb2ubFZ7xdHo0Doy
         7bdfG04xa3n5ZvU4tSCwXTzmzfS6XOgLRUpoTQO4fcIMELHGhKyEZGAlgHGhJOKK+dAr
         rGKg==
X-Gm-Message-State: AOJu0YwqBiEYIYpeZuNDPL9Qek6qEzYXf0Eyk6bd80gz29KzZr8SsI79
	Xyjla0RI7kCMk2K7/QJlEnFp/cKW3Dl7Dg==
X-Google-Smtp-Source: AGHT+IHMRmSQDwCQcOutjJCXLJjPYEeKnJoF9ysiaWb/2iIZrYHlFQWN679DWR30p2gSldjZXLSsdw==
X-Received: by 2002:a2e:9e15:0:b0:2cc:7174:48fb with SMTP id e21-20020a2e9e15000000b002cc717448fbmr203794ljk.40.1704526417555;
        Fri, 05 Jan 2024 23:33:37 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.25])
        by smtp.gmail.com with ESMTPSA id z11-20020aa7d40b000000b00556cd818dd2sm1820754edq.70.2024.01.05.23.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 23:33:36 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] opensc: upgrade 0.23.0 -> 0.24.0
Date: Sat,  6 Jan 2024 10:33:30 +0300
Message-Id: <20240106073330.292908-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108061

* All patches dropped because fixed in the new version.

0001-pkcs11-tool-Fix-private-key-import.patch -> https://github.com/OpenSC/OpenSC/blob/0.24.0/src/tools/pkcs11-tool.c#L3710
0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch -> https://github.com/OpenSC/OpenSC/blob/0.24.0/src/tools/pkcs11-tool.c#L3686
CVE-2023-2977.patch -> https://github.com/OpenSC/OpenSC/commit/81944d1529202bd28359bede57c0a15deb65ba8a

* Fix -> ERROR: opensc-0.24.0-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package opensc contains symlink .so '/usr/lib/onepin-opensc-pkcs11.so' [dev-so]

Changelog:

* CVE-2023-40660: Fix Potential PIN bypass (#2806, frankmorgner/OpenSCToken#50, #2807)
* CVE-2023-40661: Important dynamic analyzers reports
* CVE-2023-4535: Out-of-bounds read in MyEID driver handling encryption using symmetric keys (f1993dc4)
* Fix compatibility of EAC with OpenSSL 3.0 (#2674)
* Enable `use_file_cache` by default (#2501)
* Use custom libctx with OpenSSL >= 3.0 (#2712, #2715)
* Fix record-based files (#2604)
* Fix several race conditions (#2735)
* Run tests under Valgrind (#2756)
* Test signing of data bigger than 512 bytes (#2789)
* Update to OpenPACE 1.1.3 (#2796)
* Implement logout for some of the card drivers (#2807)
* Fix wrong popup position of opensc-notify (#2901)
* Fixed various issues reported by OSS-Fuzz and Coverity regarding card drivers, PKCS#11 and PKCS#15 init
* Check card presence state in `C_GetSessionInfo` (#2740)
* Remove `onepin-opensc-pkcs11` module (#2681)
* Do not use colons in the token info label (#2760)
* Present profile objects in all slots with the CKA_TOKEN attribute to resolve issues with NSS (#2928, #2924)
* Use secure memory for PUK (#2906)
* Don't logout to preserve concurrent access from different processes (#2907)
* Add more examples to manual page (#2936)
* Present profile objects in all virtual slots (#2928)
* Provide CKA_TOKEN attribute for profile objects (#2924)
* Improve --slot parameter documentation (#2951)
* Honor cache offsets when writing file cache (#2858)
* Prevent needless amount of PIN prompts from pkcs15init layer (#2916)
* Propagate CKA_EXTRACTABLE and SC_PKCS15_PRKEY_ACCESS_SENSITIVE from and back to PKCS#11 (#2936)
* Fix for private keys that do not need a PIN (#2722)
* Unbreak decipher when the first null byte of PKCS#1.5 padding is missing (#2939)
* Fix RSA key import with OpenSSL 3.0 (#2656)
* Add support for attribute filtering when listing objects (#2687)
* Add support for `--private` flag when writing certificates (#2768)
* Add support for non-AEAD ciphers to the test mode (#2780)
* Show CKA_SIGN attribute for secret keys (#2862)
* Do not attempt to read CKA_ALWAYS_AUTHENTICATE on secret keys (#2864, #2913)
* Show Sign/VerifyRecover attributes (#2888)
* Add option to import generic keys (#2955)
* Generate 2k RSA keys by default (b53fc5cd)
* Disable autostart on Linux by default (#2680)
* Add support for IDPrime MD 830, 930 and 940 (#2666)
* Add support for SafeNet eToken 5110 token (#2812)
* Process index even without keyrefmap and use correct label for second PIN (#2878)
* Add support for Gemalto IDPrime 940C (#2941)
* Change of PIN requires verification of the PIN (#2759)
* Fix incorrect CMAC computation for subkeys (#2759, issue #2734)
* Use true random number for mutual authentication for SM (#2766)
* Add verification of data coming from the token in the secure messaging mode (#2772)
* Avoid success when using unsupported digest and fix data length for RAW ECDSA signatures (#2845)
* Fix select data command (#2753, issue #2752)
* Unbreak ed/curve25519 support (#2892)
* Add support for Slovenian eID card (eOI) (#2646)
* Add support for IDEMIA (Oberthur) tokens (#2483)
* Add support for Swissbit iShield FIDO2 Authenticator (#2671)
* Implement PIV secure messaging (#2053)
* Add support for Slovak eID cards (#2672)
* Support ECDSA with off-card hashing (#2642)
* Fix WRAP operation when using T0 (#2695)
* Identify changes on the card and enable `use_file_cache` (#2798)
* Workaround for unwrapping using 2K RSA key (#2921)
* Add support for `opensc-tool --serial` (#2675)
* Fix unwrapping of 4096 keys with handling reader limits (#2682)
* Indicate supported hashes and MGF1s (#2827)

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...1-pkcs11-tool-Fix-private-key-import.patch | 33 ------------
 ...g-more-information-on-OpenSSL-errors.patch | 54 -------------------
 .../opensc/files/CVE-2023-2977.patch          | 54 -------------------
 .../{opensc_0.23.0.bb => opensc_0.24.0.bb}    |  6 +--
 4 files changed, 2 insertions(+), 145 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opensc/files/0001-pkcs11-tool-Fix-private-key-import.patch
 delete mode 100644 meta-oe/recipes-support/opensc/files/0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch
 delete mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
 rename meta-oe/recipes-support/opensc/{opensc_0.23.0.bb => opensc_0.24.0.bb} (85%)

diff --git a/meta-oe/recipes-support/opensc/files/0001-pkcs11-tool-Fix-private-key-import.patch b/meta-oe/recipes-support/opensc/files/0001-pkcs11-tool-Fix-private-key-import.patch
deleted file mode 100644
index e270a8e2e..000000000
--- a/meta-oe/recipes-support/opensc/files/0001-pkcs11-tool-Fix-private-key-import.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6f868bbcd9e65447f459f74381c09d1e315a32f6 Mon Sep 17 00:00:00 2001
-From: Jakub Jelen <jjelen@redhat.com>
-Date: Thu, 1 Dec 2022 20:08:53 +0100
-Subject: [PATCH 1/2] pkcs11-tool: Fix private key import
-
-Upstream-Status: Backport
----
- src/tools/pkcs11-tool.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
-index aae205fe2cd6..cfee8526d5b0 100644
---- a/src/tools/pkcs11-tool.c
-+++ b/src/tools/pkcs11-tool.c
-@@ -3669,13 +3669,13 @@ parse_rsa_pkey(EVP_PKEY *pkey, int private, struct rsakey_info *rsa)
- 		RSA_get0_factors(r, &r_p, &r_q);
- 		RSA_get0_crt_params(r, &r_dmp1, &r_dmq1, &r_iqmp);
- #else
--		if (EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_FACTOR1, &r_d) != 1 ||
-+		if (EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_D, &r_d) != 1 ||
- 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_FACTOR1, &r_p) != 1 ||
- 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_FACTOR2, &r_q) != 1 ||
- 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT1, &r_dmp1) != 1 ||
- 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT2, &r_dmq1) != 1 ||
--			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT3, &r_iqmp) != 1) {
- 			util_fatal("OpenSSL error during RSA private key parsing");
-+			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_COEFFICIENT1, &r_iqmp) != 1) {
- 		}
- #endif
- 		RSA_GET_BN(rsa, private_exponent, r_d);
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-support/opensc/files/0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch b/meta-oe/recipes-support/opensc/files/0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch
deleted file mode 100644
index 880a13ac6..000000000
--- a/meta-oe/recipes-support/opensc/files/0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4b5702409e7feea8cb410254285c120c57c10e1b Mon Sep 17 00:00:00 2001
-From: Jakub Jelen <jjelen@redhat.com>
-Date: Thu, 1 Dec 2022 20:11:41 +0100
-Subject: [PATCH 2/2] pkcs11-tool: Log more information on OpenSSL errors
-
-Upstream-Status: Backport
----
- src/tools/pkcs11-tool.c | 15 ++++++---------
- 1 file changed, 6 insertions(+), 9 deletions(-)
-
-diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
-index cfee8526d5b0..f2e6b1dd91cd 100644
---- a/src/tools/pkcs11-tool.c
-+++ b/src/tools/pkcs11-tool.c
-@@ -3641,10 +3641,8 @@ parse_rsa_pkey(EVP_PKEY *pkey, int private, struct rsakey_info *rsa)
- 	const BIGNUM *r_dmp1, *r_dmq1, *r_iqmp;
- 	r = EVP_PKEY_get1_RSA(pkey);
- 	if (!r) {
--		if (private)
--			util_fatal("OpenSSL error during RSA private key parsing");
--		else
--			util_fatal("OpenSSL error during RSA public key parsing");
-+		util_fatal("OpenSSL error during RSA %s key parsing: %s", private ? "private" : "public",
-+			ERR_error_string(ERR_peek_last_error(), NULL));
- 	}
- 
- 	RSA_get0_key(r, &r_n, &r_e, NULL);
-@@ -3654,10 +3652,8 @@ parse_rsa_pkey(EVP_PKEY *pkey, int private, struct rsakey_info *rsa)
- 	BIGNUM *r_dmp1 = NULL, *r_dmq1 = NULL, *r_iqmp = NULL;
- 	if (EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_N, &r_n) != 1 ||
- 		EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_E, &r_e) != 1) {
--		if (private)
--			util_fatal("OpenSSL error during RSA private key parsing");
--		else
--			util_fatal("OpenSSL error during RSA public key parsing");
-+		util_fatal("OpenSSL error during RSA %s key parsing: %s", private ? "private" : "public",
-+			ERR_error_string(ERR_peek_last_error(), NULL));
- 	 }
- #endif
- 	RSA_GET_BN(rsa, modulus, r_n);
-@@ -3674,8 +3670,9 @@ parse_rsa_pkey(EVP_PKEY *pkey, int private, struct rsakey_info *rsa)
- 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_FACTOR2, &r_q) != 1 ||
- 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT1, &r_dmp1) != 1 ||
- 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_EXPONENT2, &r_dmq1) != 1 ||
--			util_fatal("OpenSSL error during RSA private key parsing");
- 			EVP_PKEY_get_bn_param(pkey, OSSL_PKEY_PARAM_RSA_COEFFICIENT1, &r_iqmp) != 1) {
-+			util_fatal("OpenSSL error during RSA private key parsing: %s",
-+				ERR_error_string(ERR_peek_last_error(), NULL));
- 		}
- #endif
- 		RSA_GET_BN(rsa, private_exponent, r_d);
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
deleted file mode 100644
index 165fc316b..000000000
--- a/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-CVE: CVE-2023-2977
-Upstream-Status: Backport [ https://github.com/OpenSC/OpenSC/commit/81944d1529202bd28359bede57c0a15deb65ba8a ]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
-
-
-From 81944d1529202bd28359bede57c0a15deb65ba8a Mon Sep 17 00:00:00 2001
-From: fullwaywang <fullwaywang@tencent.com>
-Date: Mon, 29 May 2023 10:38:48 +0800
-Subject: [PATCH] pkcs15init: correct left length calculation to fix buffer
- overrun bug. Fixes #2785
-
----
- src/pkcs15init/pkcs15-cardos.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/pkcs15init/pkcs15-cardos.c b/src/pkcs15init/pkcs15-cardos.c
-index 9715cf390f..f41f73c349 100644
---- a/src/pkcs15init/pkcs15-cardos.c
-+++ b/src/pkcs15init/pkcs15-cardos.c
-@@ -872,7 +872,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
- 	sc_apdu_t apdu;
-         u8        rbuf[SC_MAX_APDU_BUFFER_SIZE];
-         int       r;
--	const u8  *p = rbuf, *q;
-+	const u8  *p = rbuf, *q, *pp;
- 	size_t    len, tlen = 0, ilen = 0;
- 
- 	sc_format_apdu(card, &apdu, SC_APDU_CASE_2_SHORT, 0xca, 0x01, 0x88);
-@@ -888,13 +888,13 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
- 		return 0;
- 
- 	while (len != 0) {
--		p = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
--		if (p == NULL)
-+		pp = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
-+		if (pp == NULL)
- 			return 0;
- 		if (card->type == SC_CARD_TYPE_CARDOS_M4_3)	{
- 			/* the verifyRC package on CardOS 4.3B use Manufacturer ID 0x01	*/
- 			/* and Package Number 0x07					*/
--			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x01, &ilen);
-+			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x01, &ilen);
- 			if (q == NULL || ilen != 4)
- 				return 0;
- 			if (q[0] == 0x07)
-@@ -902,7 +902,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
- 		} else if (card->type == SC_CARD_TYPE_CARDOS_M4_4)	{
- 			/* the verifyRC package on CardOS 4.4 use Manufacturer ID 0x03	*/
- 			/* and Package Number 0x02					*/
--			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x03, &ilen);
-+			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x03, &ilen);
- 			if (q == NULL || ilen != 4)
- 				return 0;
- 			if (q[0] == 0x02)
diff --git a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb b/meta-oe/recipes-support/opensc/opensc_0.24.0.bb
similarity index 85%
rename from meta-oe/recipes-support/opensc/opensc_0.23.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.24.0.bb
index b3fc1f045..fd64cf9e8 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.24.0.bb
@@ -12,11 +12,8 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 
 #v0.21.0
-SRCREV = "5497519ea6b4af596628f8f8f2f904bacaa3148f"
+SRCREV = "f15d0c5295f3247ae56bf976cf411fec4b47b6ec"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
-           file://0001-pkcs11-tool-Fix-private-key-import.patch \
-           file://0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch \
-           file://CVE-2023-2977.patch \
           "
 DEPENDS = "virtual/libiconv openssl"
 
@@ -44,6 +41,7 @@ FILES:${PN} += "\
     ${libdir}/pkcs11-spy.so \
 "
 FILES:${PN}-dev += "\
+    ${libdir}/onepin-opensc-pkcs11.so \
     ${libdir}/pkcs11/opensc-pkcs11.so \
     ${libdir}/pkcs11/onepin-opensc-pkcs11.so \
     ${libdir}/pkcs11/pkcs11-spy.so \
-- 
2.25.1


