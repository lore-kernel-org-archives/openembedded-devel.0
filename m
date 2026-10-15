Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178D7CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32857.1792043102714118530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G+m+56on;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so4210871a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043102; x=1792647902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PySX8MfFG1SWeTGIfyn2z+EEa0WNcsH5pwKMedREvqM=;
        b=G+m+56onFKt5+Hz2DH3plg8kl24W8RSDauUimZYgCpUUnGYvcoQt2jm2fz8vVeEsox
         O5dWrM5anKqRtASu0FP4ze+yiTKouNmXS6KGAfL7a2L8aktEojcZX4JutVfAzatBJZ5/
         AsOoH841U6a2RM1beogc4JvsYiyZFhdcwsMfOWNBI3RgLqkvnj+beSScnCV0zkkoeQA8
         rN1uBA1x05f/PYm5BCcZdG1VijnDr2X53UrBR7qGBeXDiq+kHR+8IAapXDIvrCHoPsJZ
         xlgHzsJzRgjkv9Kx9+IskN2NNTRwmitp42mLHFD9k8TS2vqSkaXIxNCWwhz1kkT3wZCo
         0fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043102; x=1792647902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PySX8MfFG1SWeTGIfyn2z+EEa0WNcsH5pwKMedREvqM=;
        b=B99kSoLZ0XQA3zcMxqrQUyaX8RbcJIj60pXiO2obkPLC5xOMzJK8+gPoYKnQ4s5i80
         wGzksfuZfCX7KwvmNF3AT1G8PuITrKGGOGUYFRNGY9RQ8sgP3evUnw99lDFekse+GT2V
         QI3hMBD5kwthenCF0JqEIfKsKvSGDnBAoOvQa2nrqEBeHmCv33PsA6gdx3tyYTgXKVON
         Scq5Ath7QRItxSWbe71JVPMJswD81fVxx5KStMClX1Bv0fVBlygF874K/DXW/3R9YuJu
         2eGM2MNrstJ4ukWr8I1c6s0ka+XsvFp0wYO6OTfrs0lymUrJIFIPhdt7DpuJ19B5myMY
         8rjA==
X-Gm-Message-State: AFq9FYKeemF7d45IIudlh+Uih4eVdN4Atr03YwbPt2rtkHsvQchTVEiv
	NhivWZ2kUE/JrjirXXxyDF9jh3/6nSSUdRdgr2JSDAm+qZNVad2aHqoojDmViQ==
X-Gm-Gg: AYBFou1pNp9Q61MUrnIqU5LWwvrk6yXWThy3e8QI9soDB6g/CU3lwIZOd+BnioWw07h
	hClThOS6EkJOzQ1ExcRRsjBMR1UxX/8E7VFPpoMKnqJx31WvW0iNVIFTkW0Qz3OQvV/i0DYiTAF
	09mHDXHlDZwaDMqkrTjvrJZsaFedI/mKSzSPpyjlsgc6IBmndjNpRHBb8EW1TGvb+YCPy4wQrqQ
	qJl9FaB0axqf4eIALFTDAZFg9tdC430t6PRsUiMhC9XbrrYaCXUb/Za6vFF7alea+OGNi/+SX8G
	SYFzrSBLsKPk/BKXEuJMW5fzkn2L9ZQNS0OKn/3FvPpDOjBpsxyqGheV681nkV/u0kffa75PfhH
	N9qaRIrXx0604YmtE9XiyaLTxbM1631W2Elc7QU8sSnhqg5+PZiaQrWdrGQOjVDlZBD8PtibJCs
	XIy1IPxJCPFJgGnhW3l8xpA7uI0AP2KSl4JIgIncdvaHXQpYOu1UM4uxxqEF1ywIAyzdm1OL02T
	Y4gXaEyl6Bw++ZxXT4zZ3k=
X-Received: by 2002:a17:90b:58cb:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ac0e6a4ed3mr8592974a91.0.1792043101860;
        Wed, 14 Oct 2026 22:45:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 62/82] strongswan: patch CVE-2026-78123
Date: Thu, 15 Oct 2026 18:41:50 +1300
Message-ID: <8ccc60a8be38ca62df2984758643fd11b711e6c5.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130982

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78123

[1]https://download.strongswan.org/security/CVE-2026-78123/strongswan-5.0.2-6.0.7_openssl_pkcs7_info_init.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78123).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit aa064e512a7d50e20f8e9c5a5249ee8bb2ee82ea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78123.patch           | 51 +++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch
new file mode 100644
index 0000000000..36e6eb1289
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
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/e59b4c96990635a482d6532f7905143f2541d8b5]
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
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index 117c148865..a7636554a6 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
-SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
+SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
+           file://CVE-2026-78123.patch \
+"
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"
 

