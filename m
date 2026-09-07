Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7F5C79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:49 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31931.1788776684425673340
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DxW/yT3W;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f0167e59a3so2285115a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776683; x=1789381483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sh5dHMOiqpi5SSfO8YOnCXhGP3wDVWtZr3JBczcmXm0=;
        b=DxW/yT3WGpQ1c8P3mQOweULM3psK7qXte6dwxNoch1B6qO1/3+ORid7RAX43HXQooR
         HlMWNgEImtPQlDF4baIbzX3uhlHKbR4Mdp3Jz0e9aoXrqGoa1iTuqnX2dtoRwuGhTqcO
         E1v6i6tyk3KLOw+G3k0dcbSVfKiwDEY5xAhJIkuv7vdbiAPhztQPMAILS1Hf2vVAcB7G
         pcpRzr1dzg6JdYnu7U4cYapDFp0XoZ6A3lheIJXGMIYrtMvrOhO83CbHV5tNZ+t0Fdp+
         WkRqq+Jm+Qw1FYO8lRtATnUBaBJJoOnUc0QTyCk1Vahp3avnFHyjGAfHmqB5ZcqAywE3
         hagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776683; x=1789381483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sh5dHMOiqpi5SSfO8YOnCXhGP3wDVWtZr3JBczcmXm0=;
        b=RrmV8Iix41HSWznE5711m81PLaMirFXW3f3UHd+xEAFeZDgex6P2BD+4fYg+9JIqFH
         qp8LH1OBjy46IDXqwvouRK00Eub7SrOee1m5WhzbvWKhyuSMaukZJ0zcZVmFISmybf1D
         p8ymxN9aSZJj8RHhzWgFioI5u9vYr2VSxmhsO/8iVKJ+EPbAEvUJ1d5dRIrRQm63epnz
         kgUu8Yq05/IIgt6+0dkO/7sXXaGyfgzxLryHcr4uQfebjoLbHTlRi66iZCcrz7GThoSF
         WyO3AvSYfvSiY2oUKsONUKLKaJ2tF1zi/tJHs0NCCfSCj6HtkKkb7VUzDrUX3EboPUHZ
         ttrA==
X-Gm-Message-State: AFuF++l+SrGinMz2fgUJj9NnsK9fSwGGLTpPtXd+PpUSrreAGCSzmIQa
	/UyIo0buQD1ROFCrAYC98HLq9vFAHb+PrBjgspwHXmReikvJWEbdKKdybw7X9dmo
X-Gm-Gg: AYBFou2yNw/SF3s4Y0PQ4vPZie9NDUibCy29wmVynGlWxdwJr48WknVwexRV1P45Zur
	/As/WLnj8KoQ2vPjpjUZGURvXiyL5jlFkE3SYbxR6BS8IGICD1mtAKYKUUogsUlVVF9JFJA3JN8
	aAUH+ydoIwyOTLFS8CNsN2yzGnc9DfgdMf63J7pZz2s6QL9j8eDgpLgzJu84RYsN/HRSNSiJ4ar
	vsXLAKn1n2nwtYwDfKLFVBdqn8VZ0JGwHC5OT/qYXEXNsDrE1AWAnxPYn6ekv7SQWW6twv+PuDn
	eikAGGYrfu+XoaacoTqAkcGpCAsZ3dVBsMAf4kAhe+xikL5I5c4xipsvbG2Oo/P8BWWZOOAXbuG
	6W45gH5PQM6aZNRYUNxRw3+ZQu+scyleozz6KJsghXCbr3iYMeUHiHziTa/d1RlJloICF81SGkH
	hFe93MiFXI9EHgUu93x2r0JMhosBCn8BLvlizrQdOWbJ99KdDc0zY5NVt4CBaMlQzX/6sHS5Tp
X-Received: by 2002:a05:6820:4b94:b0:6b7:8396:f3de with SMTP id 006d021491bc7-6b78396f966mr9379044eaf.64.1788776683362;
        Mon, 07 Sep 2026 03:24:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 27/33] wolfssl: patch CVE-2026-6094
Date: Mon,  7 Sep 2026 22:23:11 +1200
Message-ID: <20260907102318.2459883-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129839

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details
https://nvd.nist.gov/vuln/detail/cve-2026-6094

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-6094-1.patch       | 32 ++++++++
 .../wolfssl/files/CVE-2026-6094-2.patch       | 35 +++++++++
 .../wolfssl/files/CVE-2026-6094-3.patch       | 39 ++++++++++
 .../wolfssl/files/CVE-2026-6094-4.patch       | 36 +++++++++
 .../wolfssl/files/CVE-2026-6094-5.patch       | 73 +++++++++++++++++++
 .../wolfssl/wolfssl_5.9.1.bb                  |  5 ++
 6 files changed, 220 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-4.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-5.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-1.patch
new file mode 100644
index 0000000000..c9a7c1867e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-1.patch
@@ -0,0 +1,32 @@
+From f162b7679bafacd5b9866d72400b1115f8fbc7b7 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Fri, 3 Apr 2026 16:05:44 -0700
+Subject: [PATCH] Ensure esd->signedAttribsCount contains the correct count in
+ case some are skipped by using the current idx rather than the total array
+ size.
+
+Thanks to Zou Dikai for the report.
+
+(cherry picked from commit 7f218574c4d30a8aa8c520c7023c3d017fc13b86)
+
+CVE: CVE-2026-6094
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/7f218574c4d30a8aa8c520c7023c3d017fc13b86]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/pkcs7.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wolfcrypt/src/pkcs7.c b/wolfcrypt/src/pkcs7.c
+index 3f6649d0a..67803f84d 100644
+--- a/wolfcrypt/src/pkcs7.c
++++ b/wolfcrypt/src/pkcs7.c
+@@ -2253,7 +2253,7 @@ static int wc_PKCS7_BuildSignedAttributes(wc_PKCS7* pkcs7, ESD* esd,
+             idx++;
+         }
+ 
+-        esd->signedAttribsCount += cannedAttribsCount;
++        esd->signedAttribsCount += idx;
+         esd->signedAttribsSz += (word32)EncodeAttributes(
+             &esd->signedAttribs[atrIdx], (int)idx, cannedAttribs,
+             (int)cannedAttribsCount);
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-2.patch
new file mode 100644
index 0000000000..8df72e6f5b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-2.patch
@@ -0,0 +1,35 @@
+From 6d7fe2926a18982278c53b4ec413fe7b2349a019 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Fri, 3 Apr 2026 16:06:35 -0700
+Subject: [PATCH] In wc_PKCS7_DecodeEnvelopedData, confirm
+ encryptedContentTotalSz does not exceed the total message size before using
+ it in the non-streaming case.
+
+Thanks to Zou Dikai for the report.
+
+(cherry picked from commit 1397268aa12e2cf3f80c3acfa9b6036b809c08ef)
+
+CVE: CVE-2026-6094
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/1397268aa12e2cf3f80c3acfa9b6036b809c08ef]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/pkcs7.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/wolfcrypt/src/pkcs7.c b/wolfcrypt/src/pkcs7.c
+index 67803f84d..43bcf3ee4 100644
+--- a/wolfcrypt/src/pkcs7.c
++++ b/wolfcrypt/src/pkcs7.c
+@@ -13231,6 +13231,11 @@ int wc_PKCS7_DecodeEnvelopedData(wc_PKCS7* pkcs7, byte* in,
+                 }
+                 wc_PKCS7_DecryptContentFree(pkcs7, encOID, pkcs7->heap);
+             } else {
++                if ((idx + (word32)encryptedContentTotalSz) > pkiMsgSz) {
++                    ret = BUFFER_E;
++                    break;
++                }
++
+                 pkcs7->cachedEncryptedContentSz =
+                     (word32)encryptedContentTotalSz;
+                 pkcs7->totalEncryptedContentSz =
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-3.patch
new file mode 100644
index 0000000000..6e0d902c85
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-3.patch
@@ -0,0 +1,39 @@
+From c7f7a8ef00e6a7a33a623543507f8fa089f6037b Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Fri, 3 Apr 2026 16:56:04 -0700
+Subject: [PATCH] Code review feedback
+
+(cherry picked from commit ebdcc03b718cd7175355097b1a3831a0eb4875b2)
+
+CVE: CVE-2026-6094
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/ebdcc03b718cd7175355097b1a3831a0eb4875b2]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/pkcs7.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/wolfcrypt/src/pkcs7.c b/wolfcrypt/src/pkcs7.c
+index 43bcf3ee4..50d33bdb8 100644
+--- a/wolfcrypt/src/pkcs7.c
++++ b/wolfcrypt/src/pkcs7.c
+@@ -2256,7 +2256,7 @@ static int wc_PKCS7_BuildSignedAttributes(wc_PKCS7* pkcs7, ESD* esd,
+         esd->signedAttribsCount += idx;
+         esd->signedAttribsSz += (word32)EncodeAttributes(
+             &esd->signedAttribs[atrIdx], (int)idx, cannedAttribs,
+-            (int)cannedAttribsCount);
++            (int)idx);
+         atrIdx += idx;
+     } else {
+         esd->signedAttribsCount = 0;
+@@ -13231,7 +13231,9 @@ int wc_PKCS7_DecodeEnvelopedData(wc_PKCS7* pkcs7, byte* in,
+                 }
+                 wc_PKCS7_DecryptContentFree(pkcs7, encOID, pkcs7->heap);
+             } else {
+-                if ((idx + (word32)encryptedContentTotalSz) > pkiMsgSz) {
++                word32 tmpSum;
++                if (!WC_SAFE_SUM_WORD32(idx, (word32)encryptedContentTotalSz, tmpSum) ||
++                    tmpSum > pkiMsgSz) {
+                     ret = BUFFER_E;
+                     break;
+                 }
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-4.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-4.patch
new file mode 100644
index 0000000000..3c49028ec4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-4.patch
@@ -0,0 +1,36 @@
+From a9015491db03d415f766f47c139841249adce843 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Mon, 6 Apr 2026 11:58:12 -0700
+Subject: [PATCH] Fix unused variable error
+
+(cherry picked from commit 3e04475875a4942652fdf6794a01fdfd65801fdc)
+
+CVE: CVE-2026-6094
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/3e04475875a4942652fdf6794a01fdfd65801fdc]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/pkcs7.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/wolfcrypt/src/pkcs7.c b/wolfcrypt/src/pkcs7.c
+index 50d33bdb8..2cde73846 100644
+--- a/wolfcrypt/src/pkcs7.c
++++ b/wolfcrypt/src/pkcs7.c
+@@ -2197,7 +2197,6 @@ static int wc_PKCS7_BuildSignedAttributes(wc_PKCS7* pkcs7, ESD* esd,
+ #endif
+     word32 idx    = 0;
+     word32 atrIdx = 0;
+-    word32 cannedAttribsCount;
+ 
+     if (pkcs7 == NULL || esd == NULL || contentType == NULL ||
+         contentTypeOid == NULL || messageDigestOid == NULL ||
+@@ -2220,8 +2219,6 @@ static int wc_PKCS7_BuildSignedAttributes(wc_PKCS7* pkcs7, ESD* esd,
+             return timeSz;
+     #endif
+ 
+-        cannedAttribsCount = sizeof(cannedAttribs)/sizeof(PKCS7Attrib);
+-
+         XMEMSET(&cannedAttribs[idx], 0, sizeof(cannedAttribs[idx]));
+ 
+         if ((pkcs7->defaultSignedAttribs & WOLFSSL_CONTENT_TYPE_ATTRIBUTE) ||
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-5.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-5.patch
new file mode 100644
index 0000000000..a0dcd8ce72
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-5.patch
@@ -0,0 +1,73 @@
+From c27fbdecfd2f4a31acdc73229a5bc631184265f1 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Mon, 6 Apr 2026 16:41:32 -0700
+Subject: [PATCH] Add additional checks for encryptedContentSz exceeding
+ pkiMsgSz.
+
+(cherry picked from commit b3c2877a146e0c75715368ca5dfe2387bfc2cadf)
+
+CVE: CVE-2026-6094
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/b3c2877a146e0c75715368ca5dfe2387bfc2cadf]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/pkcs7.c | 38 ++++++++++++++++++++++++++------------
+ 1 file changed, 26 insertions(+), 12 deletions(-)
+
+diff --git a/wolfcrypt/src/pkcs7.c b/wolfcrypt/src/pkcs7.c
+index 2cde73846..8df3a2430 100644
+--- a/wolfcrypt/src/pkcs7.c
++++ b/wolfcrypt/src/pkcs7.c
+@@ -14380,9 +14380,17 @@ int wc_PKCS7_DecodeAuthEnvelopedData(wc_PKCS7* pkcs7, byte* in,
+             }
+ 
+             if (ret == 0) {
+-                XMEMCPY(encryptedContent, &pkiMsg[idx],
++                word32 tmpSum;
++                if (!WC_SAFE_SUM_WORD32(idx, (word32)encryptedContentSz,
++                                        tmpSum) ||
++                    tmpSum > pkiMsgSz) {
++                    ret = BUFFER_E;
++                    break;
++                } else {
++                    XMEMCPY(encryptedContent, &pkiMsg[idx],
+                                                     (word32)encryptedContentSz);
+-                idx += (word32)encryptedContentSz;
++                    idx += (word32)encryptedContentSz;
++                }
+             }
+         #ifndef NO_PKCS7_STREAM
+             pkcs7->stream->bufferPt = encryptedContent;
+@@ -15316,16 +15324,22 @@ int wc_PKCS7_DecodeEncryptedData(wc_PKCS7* pkcs7, byte* in, word32 inSz,
+             }
+ 
+             if (ret == 0) {
+-                XMEMCPY(encryptedContent, &pkiMsg[idx],
+-                    (unsigned int)encryptedContentSz);
+-                idx += (word32)encryptedContentSz;
+-
+-                /* decrypt encryptedContent */
+-                ret = wc_PKCS7_DecryptContent(pkcs7, encOID,
+-                              pkcs7->encryptionKey, pkcs7->encryptionKeySz,
+-                              tmpIv, expBlockSz, NULL, 0, NULL, 0,
+-                              encryptedContent, encryptedContentSz,
+-                              encryptedContent, pkcs7->devId, pkcs7->heap);
++                word32 tmpSum;
++                if (!WC_SAFE_SUM_WORD32(idx, (word32)encryptedContentSz, tmpSum) ||
++                    tmpSum > pkiMsgSz) {
++                    ret = BUFFER_E;
++                } else {
++                    XMEMCPY(encryptedContent, &pkiMsg[idx],
++                        (unsigned int)encryptedContentSz);
++                    idx += (word32)encryptedContentSz;
++
++                    /* decrypt encryptedContent */
++                    ret = wc_PKCS7_DecryptContent(pkcs7, encOID,
++                                pkcs7->encryptionKey, pkcs7->encryptionKeySz,
++                                tmpIv, expBlockSz, NULL, 0, NULL, 0,
++                                encryptedContent, encryptedContentSz,
++                                encryptedContent, pkcs7->devId, pkcs7->heap);
++                }
+                 if (ret != 0) {
+                     XFREE(encryptedContent, pkcs7->heap, DYNAMIC_TYPE_PKCS7);
+                 }
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index ce3839e9a2..8802202114 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -23,6 +23,11 @@ SRC_URI = " \
     file://CVE-2026-6091-2.patch \
     file://CVE-2026-6091-3.patch \
     file://CVE-2026-6092.patch \
+    file://CVE-2026-6094-1.patch \
+    file://CVE-2026-6094-2.patch \
+    file://CVE-2026-6094-3.patch \
+    file://CVE-2026-6094-4.patch \
+    file://CVE-2026-6094-5.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

