Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A1ECC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:47 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3515.1791885577445991519
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PxZwJzEy;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so3247167a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885577; x=1792490377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PySX8MfFG1SWeTGIfyn2z+EEa0WNcsH5pwKMedREvqM=;
        b=PxZwJzEydsYmKl/9FdUBjee0Cm35el74mn40XdVPq2qpHnL7GdSfG4/d6lwcwJAlk3
         BpFeSdB9RmPxR+bFdf1GyN7bY8b2wcJPDWDsU5rB3cBiLC7smTBNTiO4Y3rsFDBEl7T/
         d4ZZmq+xG+fifsd2vek7EZIJK9yh0PVAd9Br/mqorsNGo/z19ZPkkQoQj9mH4DMxJylZ
         v8bNMMlauyLjtEGFSiSAy4FOp9CCLtvQF1CvlAskrXjAY/D70ftw5EHibe97xjW1RHRN
         hoV8oAcFnaF0qz51VCMw1B2Ia47m3y9hGtbeG/zLJb81+hq8KcN3jAxJ2dlgn7DzPg/V
         Zprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885577; x=1792490377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PySX8MfFG1SWeTGIfyn2z+EEa0WNcsH5pwKMedREvqM=;
        b=cGD8Mfj6+1MI/ronCoke/nE74rpwo5wdllm7TNGuHQoQLvQl+PUc8LdWkPIGaBAOxY
         u6SNkvJLgxdJO6hbtZZA6s2w9LJ9pzSohPnswDCI6k7afzLG23MxmCkSvDQ4eGMTrV5a
         toOlciZHJWJGT3/KeDHbbLiaTj2giMHmm+Vp080X/g6qvfSUggLcMuQHGHl/Ql/6+54m
         d62q4QHcq9qNxsAdcJUJGsetJJYef8O3pMbea9LghfX8T2v3Ytc8rUsRbDIE69gJKbnj
         qkJKNn1L/bGz0fkGQlAoUQstw2JeJwGBWWXjATCT3+AD8aErnl7xbhUBrqo4x7ci9HRU
         ey3Q==
X-Gm-Message-State: AFq9FYLEz+UwgVk0vvBZeBDlPTZbQBHD1Bn0eeFHcAGR29ynH88h5xxK
	DIDKj7WJLDMPhp1u9Fgvv0ODCct3x9p1b4QE1MPVhS77+Yqv0G9F21u08W3NXQ==
X-Gm-Gg: AYBFou11YAZBAfoC2HMrrvqK09PSej0acRDEiOcaUoTNVMQhAuWC89FyJXp5Fh+QJmw
	ByXGQXpladojYiRR97c9+Vi6bLQ7WoAMCwW+FbQ2CIPtZIUZqaB0Fne7R5Uk7XDtOFAVXEI3NaP
	ngnrr2BeGT8tdtqnZBVSA9vb4bNoT1y44d1nJ/ccrdlD430qteVxvYN1VOSJSR7u2R82AZbS2fJ
	hdzmW5U+dWRKBLij8YzWmqzaCSNriE0y1ushVI4kN5hDtyG1WgyAEhCln+0DeJCud7gkS86bm7/
	+YhQdPUvNML9XOvTTX2llU1DoTDZsFCfvpjEuK+gSXtyuBvOdlEEcMjUlauhvG95r+3vmyGMFv5
	n3ft4qRrmNScY1em7rceDug1G0JBl+T6HbTW6dkEcJWMawwKuw+FVvh6+Pf2KqGLLxoELvk1A7D
	4H00qnDxx3Al7UBtHKA6m4fMZqXZ/rEXr4m8kgmyRZp2nIbkdKuw5kI2HwT5uLi+sAIP6T+Jwhw
	q+y6wD7HhHcaAbYdmT2zDNEIPKRy2JPbSnlI+dwo+cdpo9Cpw==
X-Received: by 2002:a17:90b:4b05:b0:3aa:ff19:42b8 with SMTP id 98e67ed59e1d1-3ab3a9aaab6mr11201789a91.27.1791885576805;
        Tue, 13 Oct 2026 02:59:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 10/28] strongswan: patch CVE-2026-78123
Date: Tue, 13 Oct 2026 22:58:45 +1300
Message-ID: <20261013095903.3544906-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130843

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
 

