Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.12363.1619098416185220587
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 06:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l1GApBqj;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id y1so7889841plg.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Wup6rkEFk9icxiQbpHTlsPwhMRX0gLAptruufliWm0M=;
        b=l1GApBqjtD6zBOWG/NEHqIaDZFiIQVInbtfODbvu/fsIJsupvmlW4F3PknFZ2lruVI
         4dH/wZuOzQXcUb1tVyqeq/zWWNtP5wn1GmRZkPddri2vS8QrpC9M5QkkelUYQqrO4+T5
         H7sX+DUz9p/Dp5RVGo0a/K0Yk8pRUfmeWv4NmyGST1zp0pw7jRgLHZryY02rYJklMiSI
         j0+ys2QLX+wWAHoQkO2Yo+yZRl7/ZnXQgyd+JvWXVK3uCMRHWIOdkIDpg4Oyh9IfHbf6
         ztmmxLpuNqzwyPWKCRXcIRbRczq1oLYBLehfYaggGembYGex5g4lgCT8LFvPiq8QcEgB
         QILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Wup6rkEFk9icxiQbpHTlsPwhMRX0gLAptruufliWm0M=;
        b=Shfoa5OrbGzz/1wtmu7wLC8zVB33RmPrKyL31RK77wnC3BP7h++joZmOlpLeOFtiML
         SWebVfRYeq6n6NHZIQ7Uk5SZ5aUcKaoSVZdF2U6vLYykLClV4/wkjTcHVh1Cfs38QS3j
         99P+LagBkhVU090P33tRvrZYysyONJMziMPQyg8xzZnX5D/QeNE/KLDY+jbiwd71JdXE
         m6xNBHb7t7fm0SlFJ7DNtGyrogkSDVBxByXSPeU8XF1hPOVwbfPBiSgOCIsEvRkuNOTf
         lrKACNJY4bsDKI2F1Vd5IJvaRoCvbZK4et5J60g4IfjfL+uO+50wZAVbm2rEKNFcRkA7
         s46A==
X-Gm-Message-State: AOAM530NMe6qYQmTJgzRCHt8SYH/gbezkKvpQMPy9n94AzIHtDldjgi5
	pD4ePFApoFsS1aoht0u1BDhImJzUi07t7A==
X-Google-Smtp-Source: ABdhPJyXEhQtaaAotUxaf7+ILgIX+6DTBDOeYyNLiIHFT3yOx+RCeuaLGwu+BwEUZgP7jQM3vcEnGQ==
X-Received: by 2002:a17:90a:66cb:: with SMTP id z11mr4156829pjl.15.1619098415396;
        Thu, 22 Apr 2021 06:33:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id gd1sm2376182pjb.49.2021.04.22.06.33.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 06:33:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 1/4] hostapd: fix CVE-2021-30004
Date: Thu, 22 Apr 2021 06:33:17 -0700
Message-Id: <730de4763a508234d09c755c838cdc4c8dd49493.1619098298.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619098298.git.akuster808@gmail.com>
References: <cover.1619098298.git.akuster808@gmail.com>

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
(cherry picked from commit 98c5cddf677addcb9aa296a7437b92100a478566)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../hostapd/hostapd/CVE-2021-30004.patch      | 123 ++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
new file mode 100644
index 0000000000..e2540fc26b
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
index 87899f3da2..e586018685 100644
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

