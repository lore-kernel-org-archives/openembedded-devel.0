Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A388C98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:32 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.723.1790224411280968684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cSMEAzoz;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a0so947378b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224411; x=1790829211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afJiYSoCw8o0Pt+VkzZm3maco/ZyJK/IozJpYEsz8zA=;
        b=cSMEAzozvkw3bQXg3yWQHmGMRBJjubpjx/NtY46VGzMew5HguzqJyHAQvS4tPmFyWM
         GefQqCZkcJ3S1oQx79EigRa33b9rOPd0XE8GSyzylvdalQVP16K5Gv5w4xHCEmohlKR6
         52xhQSAKMfLAMEBeFmAhihwrd6y0o5/ajjIGGNKCUZoBM451yLqvm60I6+COZcYW3XgT
         fphkYA8ynr8gXc2KLaXTJj0p9WJ+NA/xQv433MKra5w5R5tVig8TcbcS4+EReBmr6NWS
         VWHx6Zo0MA641kHfABv26rbrEYN8zNRqh+PBbgbUz8ciyg98ko32M1TehVjGzbV0mukf
         pKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224411; x=1790829211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=afJiYSoCw8o0Pt+VkzZm3maco/ZyJK/IozJpYEsz8zA=;
        b=Qb/4Sjv8X0AYwSBEODU3kljormf+3Lt2vWFdxfQlKMSYSw2ClK2/40SHc/S0d9Eaoc
         1jGDMVp1YY5po3vNKKYQSa+84c/TnIWbfWVH1AebJ2g2qf7ADk2RDaro4f1ZkRW1vvn8
         oxRdNbw/dld87bILd/v4+4qk9/ODm56ifX/HP9dvtnFH1o5KciPPu3FPyrsrSBObBRln
         qtRsih7K8tAPtWgd3VpbJAWuuLsFs5xy1fN3SDZeEHuuSvbzMHyPgFm18YRmCLk0CEyI
         V/MJcsy35ku6EzwHMjIRm0l+12x3gIvg2id1HMiH/Pu8vIAIDX/2T7ePWYj5OGA0TdxC
         38fQ==
X-Gm-Message-State: AFuF++lWB0vvBH2xuZogFmICMfZ/XM8/ui7i76x4ZTSElehbLbT51oj9
	XOROsf5EFnRu0LdxD5xBXLxe+dV7KySQ81+0I8AF8RZySY3ZY0ZnLRRowBLMQw==
X-Gm-Gg: AYBFou0B9jqfrrFMjs3XngqTSag6jrZXj374i8xlpRvlBytPgfjGVXhzIH6ghyighBo
	hrEfCNQvK05mh4YEY8Aiq/w3/Q6mKro54GwOEICMwZxCF6PUKaEIujRGVC2R7VBLp44o9HELm1O
	1ozb6AriOHzpHXssXJHHFAVEjlFDRl3vt318eKOJwBrpEbnS12F2YTxF6Ij7rlroIKZr28rnZZQ
	Ak2Fr69kzNQNP/bTXdT2wWk0tiCWCtJ8YN+6i9N9xL+NemXoF4NUoZlZEbU2XTimSsik5AGL/lX
	xfMqaQMQ3aJoOO2Yns9ZP4KaArC8JplbcbgsxJT2Rs2o36cSploeN+m8Qb2wXgf95h8t7HWgaw5
	vrPT5s74tKrtzgLR2QVGDYj2Rx44/aRj1eo7KNbXS6K5/qP0fee7MkpwUm5ehxSld+QS8zIUuRL
	vjcbofe6LXoCcntspOiQSjWchrgKMgUbrMi7Uzgl0WkZnBmhCYrXjGPioDE1GYmHg+8VxihoraG
	w7I2+/SPYSaDu1v4bHAv7x7rBaesGLjxQ==
X-Received: by 2002:a05:6a20:6a22:b0:3dd:a196:9072 with SMTP id adf61e73a8af0-3de0e94439fmr1190327637.60.1790224410661;
        Wed, 23 Sep 2026 21:33:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 5/24] strongswan: patch CVE-2026-78123
Date: Thu, 24 Sep 2026 16:32:55 +1200
Message-ID: <20260924043315.1663186-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130253

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78123

[1]https://download.strongswan.org/security/CVE-2026-78123/strongswan-5.0.2-6.0.7_openssl_pkcs7_info_init.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78123).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78123.patch           | 51 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch
new file mode 100644
index 0000000000..5a810f0613
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch
@@ -0,0 +1,51 @@
+From 23707d346f1f85dba0419c43658a86a80a24f568 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 1 Jun 2026 17:51:35 +0200
+Subject: [PATCH] openssl: Fix undefined memory access when verifying PKCS#7
+ containers
+
+If the signerInfo or recipientInfo structure doesn't contain
+issuerAndSerialNumber but instead a subjectKeyIdentifier, then the called
+functions will leave the passed name and serial numbers unchanged.  While
+openssl_x509_name2id() prevents a NULL-pointer dereference, it tries to
+DER-encode the object at the passed pointer via i2d_X509_NAME().
+Depending on the stack contents, this likely causes a segmentation fault.
+
+Fixes: 3c820cdc232a ("Implement PKCS#7 decryption using openssl")
+Fixes: c61723c69fb5 ("Implement OpenSSL PKCS#7 signed-data parsing and verification")
+Fixes: CVE-2026-78123
+
+CVE: CVE-2026-78123
+Upstream-Status: Backport [https://github.com/strongiswan/strongswan/commit/e59b4c96990635a482d6532f7905143f2541d8b5]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/plugins/openssl/openssl_pkcs7.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+index d9abcf8..b15c8d7 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
++++ b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+@@ -222,8 +222,8 @@ static auth_cfg_t *verify_signature(CMS_SignerInfo *si,
+ 	auth_cfg_t *auth, *found = NULL;
+ 	identification_t *issuer, *serial;
+ 	chunk_t attrs = chunk_empty, sig, attr;
+-	X509_NAME *name;
+-	ASN1_INTEGER *snr;
++	X509_NAME *name = NULL;
++	ASN1_INTEGER *snr = NULL;
+ 	int i;
+ 
+ 	if (CMS_SignerInfo_get0_signer_id(si, NULL, &name, &snr) != 1)
+@@ -628,8 +628,8 @@ static bool decrypt(private_openssl_pkcs7_t *this,
+ 			identification_t *serial, *issuer;
+ 			private_key_t *private;
+ 			X509_ALGOR *alg;
+-			X509_NAME *name;
+-			ASN1_INTEGER *sn;
++			X509_NAME *name = NULL;
++			ASN1_INTEGER *sn = NULL;
+ 			u_char zero = 0;
+ 			int oid;
+ 
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index d6176f000e..4d9fe14eb2 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -10,6 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-47895.patch \
+           file://CVE-2026-78123.patch \
 "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"

