Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C22ECCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:54 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18384.1777549667267236503
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nszrL9em;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so860135a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549666; x=1778154466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT5Wg1TY9e3zHFr0tQwhss5ZRS11XHn/JgHG1j3H+Y4=;
        b=nszrL9emy982ZMSVYBWpPT3niIN8e6HIo5edIjrm0EpLiFvyj6b7mqV0feCIfP7HSp
         7JMbHw0zsLNEP4l8j3E+rFRxe2iuD0Z2pX25RiYZyXpMEF5w6LD45zkZUixcBfl2aa+c
         8WkWFdtNXb3G8qtdtyYavbqehdc0IFsScuP3eYkwG+ePDFU82bA+AALlilkPwGTw1cU5
         eMMLAnYx8XhNZPZ70Vp99Q/K/ODoHjE/eDpedTjNtEseYhj6509RCmp7/OmJqBF8KZzr
         1ZoIqjjTIzWMj2wBCbJOyGIyC4z1jW/bZQzFrTgnQu75Bmh2C77X39jN8DFls0AGWI6P
         r6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549666; x=1778154466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lT5Wg1TY9e3zHFr0tQwhss5ZRS11XHn/JgHG1j3H+Y4=;
        b=T3Zo7+dBBIm7heIVK9MWAUhRH8stRUGMUFrUMVQIaYSj2KW7K46iv3RbXVsHhOxkcf
         cf9WjQdYe2Paqa4G+IDCc7lnAZng7HhQc/9Cys9H4kkasdYME//II88Y89E1RmCGb2O4
         I4/ktuqIh7AySgO81JYb2fB6uJN9yONuvCRRMU62MwKJ6OoCMX1+9vQKOq/AstgEZg/Y
         jItCuHKjj84ZC5H2v7WYA6AtQU7qb25IWwumHXH6rpZBjpuBWXNlwB0SHyt9cmscSuDL
         v1I/xxxyiMZuBC6kVj1dHkJiS3nTP4gBu0uAlhm1qZyKEgWb/e9qYOdEtE9+87pQY1lU
         DxzA==
X-Gm-Message-State: AOJu0Yz7l1pbXWscVqbmSNiQoEleJkWdJAhdZmGm/yDudtJbN1CQLpCl
	24XXjx6XrimtAYQygMmgaZmMSX6hYp9gvd0eXwxSZ2zbX7oVYLtja2Ewxdla/slk
X-Gm-Gg: AeBDietJtSvYpSOnIkCi4rhU63ZRTcRtsaF+DXqSElQgkYCwxiZNX2aI8Tj28B/2zDc
	7XM6am3cvGpndjHLcl59htxqXh5AK5TJ4orDD+N+nllSldZ+FxZRVTGTmtlYEKQAFqidMreikj9
	fSYkWSapqfkTPoQv4i+LuA4wIIdNdv9lk+xR/TV3bY1nWMAwe5gdZGtcQjyKBMoIWW0K6Y6HsY3
	rdTkuOBKZaRqngZqWoS6HUVwlMHNZ7rArKSft/BUqRkRAPurHrrM/kEiX7NOFN3lyjJ8zqJKQPd
	QS+Dx3fj+9xkJzFAeOmi9rRqaoHEcbMDOMGhRUFWD+cslDu1/CXXtpfO70UiS1ZpixtjT3UqjFF
	mgDlOdSb25OYNjcZQXLEBPgPfdpwn/v9eM4dCc91eIbergJ2+V3VWUKP6V8euW23TVFwsWT0hgo
	LoY3EZ8a/vgBXvWNTO/KmIS46TUqCb/WH52pSaPkFefeKolAQ=
X-Received: by 2002:a17:90b:554b:b0:364:a497:dc4d with SMTP id 98e67ed59e1d1-364c33f27femr2447892a91.24.1777549666420;
        Thu, 30 Apr 2026 04:47:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 17/24] wolfssl: patch CVE-2026-1005
Date: Thu, 30 Apr 2026 23:46:40 +1200
Message-ID: <20260430114649.4184890-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126751

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from the PR[1] mentioned in the nvd[2]

[1]https://github.com/wolfSSL/wolfssl/pull/9571
[2]https://nvd.nist.gov/vuln/detail/CVE-2026-1005

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-1005.patch         | 83 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-1005.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-1005.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-1005.patch
new file mode 100644
index 0000000000..10f2092b26
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-1005.patch
@@ -0,0 +1,83 @@
+From dfd0c1c7e151e8995b037cd3a56c9ee6e5e44b1c Mon Sep 17 00:00:00 2001
+From: Mattia Moffa <mattia@moffa.xyz>
+Date: Mon, 22 Dec 2025 16:13:27 +0100
+Subject: [PATCH] Add missing length check in sniffer for
+ AES-GCM/AES-CCM/ARIA-GCM
+
+(cherry picked from commit ca7899429844e8bd3824fe92a709978b51f750c4)
+
+CVE: CVE-2026-1005
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/ca7899429844e8bd3824fe92a709978b51f750c4]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/sniffer.c | 49 +++++++++++++++++++++++++++++++------------------
+ 1 file changed, 31 insertions(+), 18 deletions(-)
+
+diff --git a/src/sniffer.c b/src/sniffer.c
+index 4d0c8e1ca..a9bf12035 100644
+--- a/src/sniffer.c
++++ b/src/sniffer.c
+@@ -4810,18 +4810,25 @@ static int DecryptDo(WOLFSSL* ssl, byte* plain, const byte* input,
+             XMEMCPY(ssl->decrypt.nonce, ssl->keys.aead_dec_imp_IV, AESGCM_IMP_IV_SZ);
+             XMEMCPY(ssl->decrypt.nonce + AESGCM_IMP_IV_SZ, input, AESGCM_EXP_IV_SZ);
+ 
+-            if ((ret = aes_auth_fn(ssl->decrypt.aes,
+-                        plain,
+-                        input + AESGCM_EXP_IV_SZ,
+-                          sz - AESGCM_EXP_IV_SZ - ssl->specs.aead_mac_size,
+-                        ssl->decrypt.nonce, AESGCM_NONCE_SZ,
+-                        ssl->decrypt.additional, AEAD_AUTH_DATA_SZ,
+-                        NULL, 0)) < 0) {
+-            #ifdef WOLFSSL_ASYNC_CRYPT
+-                if (ret == WC_NO_ERR_TRACE(WC_PENDING_E)) {
+-                    ret = wolfSSL_AsyncPush(ssl, &ssl->decrypt.aes->asyncDev);
++            if (sz < AESGCM_EXP_IV_SZ + ssl->specs.aead_mac_size) {
++                ret = BUFFER_ERROR;
++            }
++
++            if (ret == 0) {
++                ret = aes_auth_fn(ssl->decrypt.aes,
++                       plain,
++                       input + AESGCM_EXP_IV_SZ,
++                       sz - AESGCM_EXP_IV_SZ - ssl->specs.aead_mac_size,
++                       ssl->decrypt.nonce, AESGCM_NONCE_SZ,
++                       ssl->decrypt.additional, AEAD_AUTH_DATA_SZ,
++                       NULL, 0);
++                if (ret < 0) {
++                #ifdef WOLFSSL_ASYNC_CRYPT
++                    if (ret == WC_NO_ERR_TRACE(WC_PENDING_E)) {
++                        ret = wolfSSL_AsyncPush(ssl, &ssl->decrypt.aes->asyncDev);
++                    }
++                #endif
+                 }
+-            #endif
+             }
+         }
+         break;
+@@ -4829,13 +4836,19 @@ static int DecryptDo(WOLFSSL* ssl, byte* plain, const byte* input,
+ 
+     #ifdef HAVE_ARIA
+         case wolfssl_aria_gcm:
+-            ret = wc_AriaDecrypt(ssl->decrypt.aria,
+-                        plain,
+-                        (byte *)input + AESGCM_EXP_IV_SZ,
+-                          sz - AESGCM_EXP_IV_SZ - ssl->specs.aead_mac_size,
+-                        ssl->decrypt.nonce, AESGCM_NONCE_SZ,
+-                        ssl->decrypt.additional, ssl->specs.aead_mac_size,
+-                        NULL, 0);
++            if (sz < AESGCM_EXP_IV_SZ + ssl->specs.aead_mac_size) {
++                ret = BUFFER_ERROR;
++            }
++
++            if (ret == 0) {
++                ret = wc_AriaDecrypt(ssl->decrypt.aria,
++                            plain,
++                            (byte *)input + AESGCM_EXP_IV_SZ,
++                            sz - AESGCM_EXP_IV_SZ - ssl->specs.aead_mac_size,
++                            ssl->decrypt.nonce, AESGCM_NONCE_SZ,
++                            ssl->decrypt.additional, ssl->specs.aead_mac_size,
++                            NULL, 0);
++            }
+             break;
+     #endif
+ 
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 78d17630c7..cb3184a40e 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2025-7394-4.patch \
     file://CVE-2025-7394-5.patch \
     file://CVE-2025-7394-6.patch \
+    file://CVE-2026-1005.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

