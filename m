Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.3513.1618693587509686256
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g5JcWGYI;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id s22so444462pgk.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=u4Q5Eo7zZFR1fsIlOJ8U5G8S/i49CAZJMEcMx2adGiE=;
        b=g5JcWGYIk82IvSbdzyqbNwbKvOwxQLoCJMRsG1Yk6vF+umcyJqhnL1z1WE6ekJKQ6l
         4Xhn2DObG55A6BvWBqL7Gzi8+J0xEnbrXpA6VbdcpSfYNH04M5PTJaYZbc9C11izgpbH
         pc3l0vnQHD3++rRfuH4QSsd4C1aN6OoTNILT3vCYDLGEcOJbzzsh70JLqjamAwL0vkYM
         OEHYjM8kxmGMc29DhIxoU6LGRhY22GWrp0kEUtyhI1rFAiy2FU9oVvj0b5qoyHoIpdz3
         qInYDazAVr4N3Cebgc4dCNNkf5mvERdb0qEcZsD/2ghpqJNzuTOflPRGtjOCQc9HrCcc
         1Ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=u4Q5Eo7zZFR1fsIlOJ8U5G8S/i49CAZJMEcMx2adGiE=;
        b=FDSXQFfEQ94+wBhnKHHJobbxJmJUJ5lq2xOqviI6G4nrFF1ZSPZldkCaq5hN1dm5YY
         fs7cTv0bzG/muO3yiVtdBVPcFIjYqFhwGGVcjzgxro73BIAF+cDGaX+jgJSRrAptFoXF
         eiKTEGl5soj9qJvhsv1gOEnOr1R07gt+vFhmqV0TR8TuoxE4K7rKpb+593VPcQVjxIo+
         XIsEZP99iOHp8/oHxvaOfNhXjwyzmGZGK6ASNbrlv++o3rLcHlKwN2/W7B7eTOfJV/QA
         9W4X84VULRxC5F7m5VHYcg7SS4LmDiXTYbm7lc+r3J1ukTYD8Cfd06cGoDnp5bobL5RE
         R2tg==
X-Gm-Message-State: AOAM532Wb4Bb04WVFhPP8xZr858wK53znTRY9bjJzHVMQGsBvfzn2IKh
	Vjjo8D3Kxvj4fKnDXXp3vuK/3bnwb7+Z/A==
X-Google-Smtp-Source: ABdhPJyHi+1FMyq9vrAFtQpgDNUeemxOpLpip6CH/KRQ1W9HOtPIpgkc47wFURG3B2cgzs2mhEIyhQ==
X-Received: by 2002:a63:556:: with SMTP id 83mr4762868pgf.188.1618693586925;
        Sat, 17 Apr 2021 14:06:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:26 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 24/50] hostapd: fix CVE-2021-30004
Date: Sat, 17 Apr 2021 14:05:33 -0700
Message-Id: <98c5cddf677addcb9aa296a7437b92100a478566.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Stefan Ghinea <stefan.ghinea@windriver.com>

In wpa_supplicant and hostapd 2.9, forging attacks may occur because
AlgorithmIdentifier parameters are mishandled in tls/pkcs1.c and
tls/x509v3.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-30004

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e2bd6a52bf689b77b237eaee3067d2b0b6eee3d5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../hostapd/hostapd/CVE-2021-30004.patch      | 123 ++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
new file mode 100644
index 00000000000..e2540fc26be
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
@@ -0,0 +1,123 @@
+From a0541334a6394f8237a4393b7372693cd7e96f15 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 13 Mar 2021 18:19:31 +0200
+Subject: [PATCH] ASN.1: Validate DigestAlgorithmIdentifier parameters
+
+The supported hash algorithms do not use AlgorithmIdentifier parameters.
+However, there are implementations that include NULL parameters in
+addition to ones that omit the parameters. Previous implementation did
+not check the parameters value at all which supported both these cases,
+but did not reject any other unexpected information.
+
+Use strict validation of digest algorithm parameters and reject any
+unexpected value when validating a signature. This is needed to prevent
+potential forging attacks.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport
+CVE: CVE-2021-30004
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/tls/pkcs1.c  | 21 +++++++++++++++++++++
+ src/tls/x509v3.c | 20 ++++++++++++++++++++
+ 2 files changed, 41 insertions(+)
+
+diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
+index 141ac50..e09db07 100644
+--- a/src/tls/pkcs1.c
++++ b/src/tls/pkcs1.c
+@@ -240,6 +240,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestInfo",
++		    hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -261,6 +263,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -269,6 +273,23 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "PKCS #1: Unexpected digest algorithm parameters");
++		os_free(decrypted);
++		return -1;
++	}
+ 
+ 	if (!asn1_oid_equal(&oid, hash_alg)) {
+ 		char txt[100], txt2[100];
+diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
+index 1bd5aa0..bf2289f 100644
+--- a/src/tls/x509v3.c
++++ b/src/tls/x509v3.c
+@@ -1834,6 +1834,7 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestInfo", hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -1855,6 +1856,8 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -1862,6 +1865,23 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "X509: Unexpected digest algorithm parameters");
++		os_free(data);
++		return -1;
++	}
+ 
+ 	if (x509_sha1_oid(&oid)) {
+ 		if (signature->oid.oid[6] != 5 /* sha-1WithRSAEncryption */) {
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
index 87899f3da20..e5860186857 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://CVE-2019-5061.patch \
     file://CVE-2021-0326.patch \
     file://CVE-2021-27803.patch \
+    file://CVE-2021-30004.patch \
 "
 
 SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
-- 
2.17.1

