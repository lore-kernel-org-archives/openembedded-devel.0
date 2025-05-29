Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D437CC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 07:10:24 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.15307.1748502622082064831
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 00:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LN6xe5s1;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7426c44e014so367571b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748502621; x=1749107421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk9wypIy54MNJZH7ENgiDuEUSU8QHQNsIgDm5oud9/o=;
        b=LN6xe5s19UxSe0Ldpc6xBNgbHmJiduXsfkqI5UIz+zSDC3pDLfadRxdmPfXaHoHxG7
         Kp+VyQPWPRMT7uvImohvlf17CYdQNKwrOMOmdrGtTPFfZM23gmLoCfFXd/qlC5gmm2xP
         jeC3FAyO/IRjZqJz7e1HdOm5o9JWbrZkAG29ViIR0TbizTWfVYa3892Rn6MSQ8c0zdfT
         snX5qJE0O2eRjOSZPqchGi+SUqs2igxEKrON1fh3xO4TWora2VZcyD3td2ZqSrd0ggeq
         OXHT5QB3f6IHduCg4idKdzs3bodG//xhuQqHEZh0fuwp61u3isl6FQxjL6rd98kREVWN
         vO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748502621; x=1749107421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vk9wypIy54MNJZH7ENgiDuEUSU8QHQNsIgDm5oud9/o=;
        b=pLTKqA0HDwmYn5SlN7pT4jVLx/ObkftEmTY1QWid2iOp+onsFwO7aufHRYaecH6nly
         0h+6LnT4WWApFvNSYhz4pHGxpkGh7pVb9A16LtxRjO3dsvXIUcJKMHnUUVsu2vOIqD6g
         hD7aTH2ibJZ+U2DwlGFIcXznXMzCz75NAKvYlM9/3Pa1vbszb7TdYbUcyQLAf5MEx/2r
         Pc5tj/yOFRvOIUhovxLKWCCxL51KBze4CmBty5zlH+8eQiWfuWU9EIxfzd7cK6oT6mx9
         muJSL1AnXHgRNAENjYg7RUVXRyPR0Ht5/SsMRX0K1jJ8CkkvkZkOI3NgxEUx/DypATq9
         4t/w==
X-Gm-Message-State: AOJu0YxqvclQgFq7gFqF0CmR68Fl2cUlSrSBY4+TY3BphB9DPQn/Zx8h
	dyP+mxRECPr8btDZGBgdH0hxxTiZB4Ew2alHHfgrpoaXQZBKVIzSbrhY/N1Fsrb5
X-Gm-Gg: ASbGncudZBiAlM5A6WFmNHPlDbAFZIjvOPSvPQ2qQKDvLHMp/vooWD2HQU/iPdHWxSy
	rGpSHb4b2KHnlsJWSEXXBvTEYqcA7t4f6R3e3pMQ8dOt3XRFGKyW1eZjYysXUVOBX6yV9BtUixH
	TI/ms2YoLY2zUtU1l+X60v1tg+NVVoSAWtuurJ6xavQKQB0zb3ed45ZYAYaI1qtqdgOcZ82mtTF
	88CXMIpDlYxff7DQj82wBb6EzY/+JVTRsXDj7AI8Dz95HpH4QfSe1zfdi/YAnVgwLSP3HJ/9y9S
	zX4D4ovmMHcaAoqVZWdzkKfX81sQwP8R+ID6Ob4PPjs=
X-Google-Smtp-Source: AGHT+IGaXIoOyXrK7e6/7nJIP4EsLbw1Y2Fh6zz+lfw/JRWJ+OM1f82hYrrFqGxp96Ze0W/91rMoMw==
X-Received: by 2002:a05:6a00:84f:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-746b3ff1e6fmr6711546b3a.5.1748502620663;
        Thu, 29 May 2025 00:10:20 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff71fbsm693307b3a.165.2025.05.29.00.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 00:10:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH v3] wolfssl: Upgrade to 5.8.0
Date: Thu, 29 May 2025 00:10:17 -0700
Message-ID: <20250529071017.2122558-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 07:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117653

Define relative path for certs
Backport patch to fix ptests

Fixes
WARNING: wolfssl-5.8.0-r0 do_package_qa: QA Issue: File /usr/lib/wolfssl/ptest/test/.libs/unit.test in package wolfssl-ptest contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix buildpaths in test binaries
v3: Fix ptests

 ...t-logging.h-and-wolfcrypt-src-loggin.patch | 791 ++++++++++++++++++
 .../{wolfssl_5.7.2.bb => wolfssl_5.8.0.bb}    |   7 +-
 2 files changed, 797 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/0001-wolfssl-wolfcrypt-logging.h-and-wolfcrypt-src-loggin.patch
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.7.2.bb => wolfssl_5.8.0.bb} (84%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/0001-wolfssl-wolfcrypt-logging.h-and-wolfcrypt-src-loggin.patch b/meta-networking/recipes-connectivity/wolfssl/files/0001-wolfssl-wolfcrypt-logging.h-and-wolfcrypt-src-loggin.patch
new file mode 100644
index 0000000000..f4f149c7e8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/0001-wolfssl-wolfcrypt-logging.h-and-wolfcrypt-src-loggin.patch
@@ -0,0 +1,791 @@
+From 04975ac158e6d33875c2855f74792efb2258bb93 Mon Sep 17 00:00:00 2001
+From: Daniel Pouzzner <douzzer@wolfssl.com>
+Date: Tue, 13 May 2025 20:30:48 -0500
+Subject: [PATCH] wolfssl/wolfcrypt/logging.h and wolfcrypt/src/logging.c: add 
+  WOLFSSL_DEBUG_PRINTF() macro adapted from wolfssl_log(), refactor  
+ wolfssl_log() to use it, and move printf setup includes/prototypes from  
+ logging.c to logging.h;
+
+src/ssl_load.c: add source_name arg and WOLFSSL_DEBUG_CERTIFICATE_LOADS clauses
+  to ProcessBuffer() and ProcessChainBuffer(), and pass reasonable values from
+  callers;
+
+remove expired "Baltimore CyberTrust Root" from certs/external/ca_collection.pem
+  and certs/external/baltimore-cybertrust-root.pem.
+
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/55460a52619626f614e86d528b9a60445562eb34]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ certs/external/baltimore-cybertrust-root.pem |  21 ---
+ certs/external/ca_collection.pem             |  77 ----------
+ src/ssl_load.c                               | 111 +++++++++++----
+ wolfcrypt/src/error.c                        |   4 +-
+ wolfcrypt/src/logging.c                      | 142 ++-----------------
+ wolfssl/internal.h                           |   3 +-
+ wolfssl/wolfcrypt/logging.h                  |  93 +++++++++++-
+ 7 files changed, 190 insertions(+), 261 deletions(-)
+ delete mode 100644 certs/external/baltimore-cybertrust-root.pem
+
+diff --git a/certs/external/baltimore-cybertrust-root.pem b/certs/external/baltimore-cybertrust-root.pem
+deleted file mode 100644
+index 519028c63..000000000
+--- a/certs/external/baltimore-cybertrust-root.pem
++++ /dev/null
+@@ -1,21 +0,0 @@
+------BEGIN CERTIFICATE-----
+-MIIDdzCCAl+gAwIBAgIEAgAAuTANBgkqhkiG9w0BAQUFADBaMQswCQYDVQQGEwJJ
+-RTESMBAGA1UEChMJQmFsdGltb3JlMRMwEQYDVQQLEwpDeWJlclRydXN0MSIwIAYD
+-VQQDExlCYWx0aW1vcmUgQ3liZXJUcnVzdCBSb290MB4XDTAwMDUxMjE4NDYwMFoX
+-DTI1MDUxMjIzNTkwMFowWjELMAkGA1UEBhMCSUUxEjAQBgNVBAoTCUJhbHRpbW9y
+-ZTETMBEGA1UECxMKQ3liZXJUcnVzdDEiMCAGA1UEAxMZQmFsdGltb3JlIEN5YmVy
+-VHJ1c3QgUm9vdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKMEuyKr
+-mD1X6CZymrV51Cni4eiVgLGw41uOKymaZN+hXe2wCQVt2yguzmKiYv60iNoS6zjr
+-IZ3AQSsBUnuId9Mcj8e6uYi1agnnc+gRQKfRzMpijS3ljwumUNKoUMMo6vWrJYeK
+-mpYcqWe4PwzV9/lSEy/CG9VwcPCPwBLKBsua4dnKM3p31vjsufFoREJIE9LAwqSu
+-XmD+tqYF/LTdB1kC1FkYmGP1pWPgkAx9XbIGevOF6uvUA65ehD5f/xXtabz5OTZy
+-dc93Uk3zyZAsuT3lySNTPx8kmCFcB5kpvcY67Oduhjprl3RjM71oGDHweI12v/ye
+-jl0qhqdNkNwnGjkCAwEAAaNFMEMwHQYDVR0OBBYEFOWdWTCCR1jMrPoIVDaGezq1
+-BE3wMBIGA1UdEwEB/wQIMAYBAf8CAQMwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3
+-DQEBBQUAA4IBAQCFDF2O5G9RaEIFoN27TyclhAO992T9Ldcw46QQF+vaKSm2eT92
+-9hkTI7gQCvlYpNRhcL0EYWoSihfVCr3FvDB81ukMJY2GQE/szKN+OMY3EU/t3Wgx
+-jkzSswF07r51XgdIGn9w/xZchMB5hbgF/X++ZRGjD8ACtPhSNzkE1akxehi/oCr0
+-Epn3o0WC4zxe9Z2etciefC7IpJ5OCBRLbf1wbWsaY71k5h+3zvDyny67G7fyUIhz
+-ksLi4xaNmjICq44Y3ekQEe5+NauQrz4wlHrQMz2nZQ/1/I6eYs9HRCwBXbsdtTLS
+-R9I4LtD+gdwyah617jzV/OeBHRnDJELqYzmp
+------END CERTIFICATE-----
+diff --git a/certs/external/ca_collection.pem b/certs/external/ca_collection.pem
+index ddfdf9cee..c76d6c605 100644
+--- a/certs/external/ca_collection.pem
++++ b/certs/external/ca_collection.pem
+@@ -1,80 +1,3 @@
+-Certificate:
+-    Data:
+-        Version: 3 (0x2)
+-        Serial Number: 33554617 (0x20000b9)
+-        Signature Algorithm: sha1WithRSAEncryption
+-        Issuer: C = IE, O = Baltimore, OU = CyberTrust, CN = Baltimore CyberTrust Root
+-        Validity
+-            Not Before: May 12 18:46:00 2000 GMT
+-            Not After : May 12 23:59:00 2025 GMT
+-        Subject: C = IE, O = Baltimore, OU = CyberTrust, CN = Baltimore CyberTrust Root
+-        Subject Public Key Info:
+-            Public Key Algorithm: rsaEncryption
+-                RSA Public-Key: (2048 bit)
+-                Modulus:
+-                    00:a3:04:bb:22:ab:98:3d:57:e8:26:72:9a:b5:79:
+-                    d4:29:e2:e1:e8:95:80:b1:b0:e3:5b:8e:2b:29:9a:
+-                    64:df:a1:5d:ed:b0:09:05:6d:db:28:2e:ce:62:a2:
+-                    62:fe:b4:88:da:12:eb:38:eb:21:9d:c0:41:2b:01:
+-                    52:7b:88:77:d3:1c:8f:c7:ba:b9:88:b5:6a:09:e7:
+-                    73:e8:11:40:a7:d1:cc:ca:62:8d:2d:e5:8f:0b:a6:
+-                    50:d2:a8:50:c3:28:ea:f5:ab:25:87:8a:9a:96:1c:
+-                    a9:67:b8:3f:0c:d5:f7:f9:52:13:2f:c2:1b:d5:70:
+-                    70:f0:8f:c0:12:ca:06:cb:9a:e1:d9:ca:33:7a:77:
+-                    d6:f8:ec:b9:f1:68:44:42:48:13:d2:c0:c2:a4:ae:
+-                    5e:60:fe:b6:a6:05:fc:b4:dd:07:59:02:d4:59:18:
+-                    98:63:f5:a5:63:e0:90:0c:7d:5d:b2:06:7a:f3:85:
+-                    ea:eb:d4:03:ae:5e:84:3e:5f:ff:15:ed:69:bc:f9:
+-                    39:36:72:75:cf:77:52:4d:f3:c9:90:2c:b9:3d:e5:
+-                    c9:23:53:3f:1f:24:98:21:5c:07:99:29:bd:c6:3a:
+-                    ec:e7:6e:86:3a:6b:97:74:63:33:bd:68:18:31:f0:
+-                    78:8d:76:bf:fc:9e:8e:5d:2a:86:a7:4d:90:dc:27:
+-                    1a:39
+-                Exponent: 65537 (0x10001)
+-        X509v3 extensions:
+-            X509v3 Subject Key Identifier: 
+-                E5:9D:59:30:82:47:58:CC:AC:FA:08:54:36:86:7B:3A:B5:04:4D:F0
+-            X509v3 Basic Constraints: critical
+-                CA:TRUE, pathlen:3
+-            X509v3 Key Usage: critical
+-                Certificate Sign, CRL Sign
+-    Signature Algorithm: sha1WithRSAEncryption
+-         85:0c:5d:8e:e4:6f:51:68:42:05:a0:dd:bb:4f:27:25:84:03:
+-         bd:f7:64:fd:2d:d7:30:e3:a4:10:17:eb:da:29:29:b6:79:3f:
+-         76:f6:19:13:23:b8:10:0a:f9:58:a4:d4:61:70:bd:04:61:6a:
+-         12:8a:17:d5:0a:bd:c5:bc:30:7c:d6:e9:0c:25:8d:86:40:4f:
+-         ec:cc:a3:7e:38:c6:37:11:4f:ed:dd:68:31:8e:4c:d2:b3:01:
+-         74:ee:be:75:5e:07:48:1a:7f:70:ff:16:5c:84:c0:79:85:b8:
+-         05:fd:7f:be:65:11:a3:0f:c0:02:b4:f8:52:37:39:04:d5:a9:
+-         31:7a:18:bf:a0:2a:f4:12:99:f7:a3:45:82:e3:3c:5e:f5:9d:
+-         9e:b5:c8:9e:7c:2e:c8:a4:9e:4e:08:14:4b:6d:fd:70:6d:6b:
+-         1a:63:bd:64:e6:1f:b7:ce:f0:f2:9f:2e:bb:1b:b7:f2:50:88:
+-         73:92:c2:e2:e3:16:8d:9a:32:02:ab:8e:18:dd:e9:10:11:ee:
+-         7e:35:ab:90:af:3e:30:94:7a:d0:33:3d:a7:65:0f:f5:fc:8e:
+-         9e:62:cf:47:44:2c:01:5d:bb:1d:b5:32:d2:47:d2:38:2e:d0:
+-         fe:81:dc:32:6a:1e:b5:ee:3c:d5:fc:e7:81:1d:19:c3:24:42:
+-         ea:63:39:a9
+------BEGIN CERTIFICATE-----
+-MIIDdzCCAl+gAwIBAgIEAgAAuTANBgkqhkiG9w0BAQUFADBaMQswCQYDVQQGEwJJ
+-RTESMBAGA1UEChMJQmFsdGltb3JlMRMwEQYDVQQLEwpDeWJlclRydXN0MSIwIAYD
+-VQQDExlCYWx0aW1vcmUgQ3liZXJUcnVzdCBSb290MB4XDTAwMDUxMjE4NDYwMFoX
+-DTI1MDUxMjIzNTkwMFowWjELMAkGA1UEBhMCSUUxEjAQBgNVBAoTCUJhbHRpbW9y
+-ZTETMBEGA1UECxMKQ3liZXJUcnVzdDEiMCAGA1UEAxMZQmFsdGltb3JlIEN5YmVy
+-VHJ1c3QgUm9vdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKMEuyKr
+-mD1X6CZymrV51Cni4eiVgLGw41uOKymaZN+hXe2wCQVt2yguzmKiYv60iNoS6zjr
+-IZ3AQSsBUnuId9Mcj8e6uYi1agnnc+gRQKfRzMpijS3ljwumUNKoUMMo6vWrJYeK
+-mpYcqWe4PwzV9/lSEy/CG9VwcPCPwBLKBsua4dnKM3p31vjsufFoREJIE9LAwqSu
+-XmD+tqYF/LTdB1kC1FkYmGP1pWPgkAx9XbIGevOF6uvUA65ehD5f/xXtabz5OTZy
+-dc93Uk3zyZAsuT3lySNTPx8kmCFcB5kpvcY67Oduhjprl3RjM71oGDHweI12v/ye
+-jl0qhqdNkNwnGjkCAwEAAaNFMEMwHQYDVR0OBBYEFOWdWTCCR1jMrPoIVDaGezq1
+-BE3wMBIGA1UdEwEB/wQIMAYBAf8CAQMwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3
+-DQEBBQUAA4IBAQCFDF2O5G9RaEIFoN27TyclhAO992T9Ldcw46QQF+vaKSm2eT92
+-9hkTI7gQCvlYpNRhcL0EYWoSihfVCr3FvDB81ukMJY2GQE/szKN+OMY3EU/t3Wgx
+-jkzSswF07r51XgdIGn9w/xZchMB5hbgF/X++ZRGjD8ACtPhSNzkE1akxehi/oCr0
+-Epn3o0WC4zxe9Z2etciefC7IpJ5OCBRLbf1wbWsaY71k5h+3zvDyny67G7fyUIhz
+-ksLi4xaNmjICq44Y3ekQEe5+NauQrz4wlHrQMz2nZQ/1/I6eYs9HRCwBXbsdtTLS
+-R9I4LtD+gdwyah617jzV/OeBHRnDJELqYzmp
+------END CERTIFICATE-----
+ Certificate:
+     Data:
+         Version: 3 (0x2)
+diff --git a/src/ssl_load.c b/src/ssl_load.c
+index 24c8af1be..d803b4093 100644
+--- a/src/ssl_load.c
++++ b/src/ssl_load.c
+@@ -2352,11 +2352,13 @@ static int ProcessBufferResetSuites(WOLFSSL_CTX* ctx, WOLFSSL* ssl, int type)
+  * @param [out]     used       Number of bytes consumed.
+  * @param [in[      userChain  Whether this certificate is for user's chain.
+  * @param [in]      verify     How to verify certificate.
++ * @param [in]      source_name Associated filename or other source ID.
+  * @return  1 on success.
+  * @return  Less than 1 on failure.
+  */
+ int ProcessBuffer(WOLFSSL_CTX* ctx, const unsigned char* buff, long sz,
+-    int format, int type, WOLFSSL* ssl, long* used, int userChain, int verify)
++    int format, int type, WOLFSSL* ssl, long* used, int userChain, int verify,
++    const char *source_name)
+ {
+     DerBuffer*    der = NULL;
+     int           ret = 0;
+@@ -2367,6 +2369,11 @@ int ProcessBuffer(WOLFSSL_CTX* ctx, const unsigned char* buff, long sz,
+     EncryptedInfo  info[1];
+ #endif
+     int           algId = 0;
++#ifdef WOLFSSL_DEBUG_CERTIFICATE_LOADS
++    long usedAtStart = used ? *used : 0L;
++#else
++    (void)source_name;
++#endif
+ 
+     WOLFSSL_ENTER("ProcessBuffer");
+ 
+@@ -2444,6 +2451,22 @@ int ProcessBuffer(WOLFSSL_CTX* ctx, const unsigned char* buff, long sz,
+                 CLEAR_ASN_NO_PEM_HEADER_ERROR(pemErr);
+                 ret = 0;
+             }
++#ifdef WOLFSSL_DEBUG_CERTIFICATE_LOADS
++            if (ret < 0) {
++#ifdef NO_ERROR_STRINGS
++                WOLFSSL_DEBUG_PRINTF(
++                    "ERROR: ProcessUserChain: certificate from %s at offset %ld"
++                    " rejected with code %d\n",
++                    source_name, usedAtStart, ret);
++#else
++                WOLFSSL_DEBUG_PRINTF(
++                    "ERROR: ProcessUserChain: certificate from %s at offset %ld"
++                    " rejected with code %d: %s\n",
++                    source_name, usedAtStart, ret,
++                    wolfSSL_ERR_reason_error_string(ret));
++#endif
++            }
++#endif /* WOLFSSL_DEBUG_CERTIFICATE_LOADS */
+         }
+ 
+     #ifdef WOLFSSL_SMALL_STACK
+@@ -2455,6 +2478,22 @@ int ProcessBuffer(WOLFSSL_CTX* ctx, const unsigned char* buff, long sz,
+             /* Process the different types of certificates. */
+             ret = ProcessBufferCertTypes(ctx, ssl, buff, sz, der, format, type,
+                 verify);
++#ifdef WOLFSSL_DEBUG_CERTIFICATE_LOADS
++            if (ret < 0) {
++#ifdef NO_ERROR_STRINGS
++                WOLFSSL_DEBUG_PRINTF(
++                    "ERROR: ProcessBufferCertTypes: certificate from %s at"
++                    " offset %ld rejected with code %d\n",
++                    source_name, usedAtStart, ret);
++#else
++                WOLFSSL_DEBUG_PRINTF(
++                    "ERROR: ProcessBufferCertTypes: certificate from %s at"
++                    " offset %ld rejected with code %d: %s\n",
++                    source_name, usedAtStart, ret,
++                    wolfSSL_ERR_reason_error_string(ret));
++#endif
++            }
++#endif /* WOLFSSL_DEBUG_CERTIFICATE_LOADS */
+         }
+         else {
+             FreeDer(&der);
+@@ -2515,12 +2554,14 @@ static int ProcessChainBufferCRL(WOLFSSL_CTX* ctx, const unsigned char* buff,
+  * @param [in]      sz      Size of data in buffer.
+  * @param [in]      type    Type of data.
+  * @param [in]      verify  How to verify certificate.
++ * @param [in]      source_name   Associated filename or other source ID.
+  * @return  1 on success.
+  * @return  0 on failure.
+  * @return  MEMORY_E when dynamic memory allocation fails.
+  */
+ static int ProcessChainBuffer(WOLFSSL_CTX* ctx, WOLFSSL* ssl,
+-    const unsigned char* buff, long sz, int type, int verify)
++    const unsigned char* buff, long sz, int type, int verify,
++    const char *source_name)
+ {
+     int  ret    = 0;
+     long used   = 0;
+@@ -2529,11 +2570,11 @@ static int ProcessChainBuffer(WOLFSSL_CTX* ctx, WOLFSSL* ssl,
+     WOLFSSL_MSG("Processing CA PEM file");
+     /* Keep processing file while no errors and data to parse. */
+     while ((ret >= 0) && (used < sz)) {
+-        long consumed = 0;
++        long consumed = used;
+ 
+         /* Process the buffer. */
+         ret = ProcessBuffer(ctx, buff + used, sz - used, WOLFSSL_FILETYPE_PEM,
+-            type, ssl, &consumed, 0, verify);
++            type, ssl, &consumed, 0, verify, source_name);
+         /* Memory allocation failure is fatal. */
+         if (ret == WC_NO_ERR_TRACE(MEMORY_E)) {
+             gotOne = 0;
+@@ -2665,6 +2706,12 @@ int ProcessFile(WOLFSSL_CTX* ctx, const char* fname, int format, int type,
+         {
+             /* Not a header that we support. */
+             WOLFSSL_MSG("Failed to detect certificate type");
++#ifdef WOLFSSL_DEBUG_CERTIFICATE_LOADS
++            WOLFSSL_DEBUG_PRINTF(
++                "ERROR: ProcessFile: Failed to detect certificate type"
++                " of \"%s\"\n",
++                fname);
++#endif
+             ret = WOLFSSL_BAD_CERTTYPE;
+         }
+     }
+@@ -2673,7 +2720,7 @@ int ProcessFile(WOLFSSL_CTX* ctx, const char* fname, int format, int type,
+         if (((type == CA_TYPE) || (type == TRUSTED_PEER_TYPE)) &&
+                 (format == WOLFSSL_FILETYPE_PEM)) {
+             ret = ProcessChainBuffer(ctx, ssl, content.buffer, sz, type,
+-                verify);
++                verify, fname);
+         }
+ #ifdef HAVE_CRL
+         else if (type == CRL_TYPE) {
+@@ -2690,18 +2737,18 @@ int ProcessFile(WOLFSSL_CTX* ctx, const char* fname, int format, int type,
+             long consumed = 0;
+ 
+             ret = ProcessBuffer(ctx, content.buffer, sz, format, type, ssl,
+-                &consumed, userChain, verify);
++                &consumed, userChain, verify, fname);
+             if ((ret == 1) && (consumed < sz)) {
+                 ret = ProcessBuffer(ctx, content.buffer + consumed,
+                     sz - consumed, format, ALT_PRIVATEKEY_TYPE, ssl, NULL, 0,
+-                    verify);
++                    verify, fname);
+             }
+         }
+ #endif
+         else {
+             /* Load all other certificate types. */
+             ret = ProcessBuffer(ctx, content.buffer, sz, format, type, ssl,
+-                NULL, userChain, verify);
++                NULL, userChain, verify, fname);
+         }
+     }
+ 
+@@ -3030,7 +3077,8 @@ static int LoadSystemCaCertsWindows(WOLFSSL_CTX* ctx, byte* loaded)
+                     if (ProcessBuffer(ctx, certCtx->pbCertEncoded,
+                           certCtx->cbCertEncoded, WOLFSSL_FILETYPE_ASN1,
+                           CA_TYPE, NULL, NULL, 0,
+-                          GET_VERIFY_SETTING_CTX(ctx)) == 1) {
++                          GET_VERIFY_SETTING_CTX(ctx),
++                          storeNames[i]) == 1) {
+                         /*
+                          * Set "loaded" as long as we've loaded one CA
+                          * cert.
+@@ -3105,7 +3153,8 @@ static int LoadSystemCaCertsMac(WOLFSSL_CTX* ctx, byte* loaded)
+                     if (ProcessBuffer(ctx, CFDataGetBytePtr(der),
+                           CFDataGetLength(der), WOLFSSL_FILETYPE_ASN1,
+                           CA_TYPE, NULL, NULL, 0,
+-                          GET_VERIFY_SETTING_CTX(ctx)) == 1) {
++                          GET_VERIFY_SETTING_CTX(ctx),
++                          "MacOSX trustDomains") == 1) {
+                         /*
+                          * Set "loaded" as long as we've loaded one CA
+                          * cert.
+@@ -3644,7 +3693,8 @@ int wolfSSL_use_certificate(WOLFSSL* ssl, WOLFSSL_X509* x509)
+         /* Get DER encoded certificate data from X509 object. */
+         ret = ProcessBuffer(NULL, x509->derCert->buffer, x509->derCert->length,
+             WOLFSSL_FILETYPE_ASN1, CERT_TYPE, ssl, &idx, 0,
+-            GET_VERIFY_SETTING_SSL(ssl));
++            GET_VERIFY_SETTING_SSL(ssl),
++            "x509 buffer");
+     }
+ 
+     /* Return 1 on success or 0 on failure. */
+@@ -3676,7 +3726,8 @@ int wolfSSL_use_certificate_ASN1(WOLFSSL* ssl, const unsigned char* der,
+         long idx = 0;
+ 
+         ret = ProcessBuffer(NULL, der, derSz, WOLFSSL_FILETYPE_ASN1, CERT_TYPE,
+-            ssl, &idx, 0, GET_VERIFY_SETTING_SSL(ssl));
++            ssl, &idx, 0, GET_VERIFY_SETTING_SSL(ssl),
++            "asn1 buffer");
+     }
+ 
+     /* Return 1 on success or 0 on failure. */
+@@ -3884,12 +3935,13 @@ int wolfSSL_CTX_load_verify_buffer_ex(WOLFSSL_CTX* ctx, const unsigned char* in,
+ 
+     /* When PEM, treat as certificate chain of CA certificates. */
+     if (format == WOLFSSL_FILETYPE_PEM) {
+-        ret = ProcessChainBuffer(ctx, NULL, in, sz, CA_TYPE, verify);
++        ret = ProcessChainBuffer(ctx, NULL, in, sz, CA_TYPE, verify,
++                                 "PEM buffer");
+     }
+     /* When DER, load the CA certificate. */
+     else {
+         ret = ProcessBuffer(ctx, in, sz, format, CA_TYPE, NULL, NULL,
+-            userChain, verify);
++            userChain, verify, "buffer");
+     }
+ #if defined(WOLFSSL_TRUST_PEER_CERT) && defined(OPENSSL_COMPATIBLE_DEFAULTS)
+     if (ret == 1) {
+@@ -3973,12 +4025,12 @@ int wolfSSL_CTX_trust_peer_buffer(WOLFSSL_CTX* ctx, const unsigned char* in,
+         /* When PEM, treat as certificate chain of trusted peer certificates. */
+         if (format == WOLFSSL_FILETYPE_PEM) {
+             ret = ProcessChainBuffer(ctx, NULL, in, sz, TRUSTED_PEER_TYPE,
+-                verify);
++                verify, "peer");
+         }
+         /* When DER, load the trusted peer certificate. */
+         else {
+             ret = ProcessBuffer(ctx, in, sz, format, TRUSTED_PEER_TYPE, NULL,
+-                NULL, 0, verify);
++                NULL, 0, verify, "peer");
+         }
+     }
+ 
+@@ -4004,7 +4056,7 @@ int wolfSSL_CTX_use_certificate_buffer(WOLFSSL_CTX* ctx,
+ 
+     WOLFSSL_ENTER("wolfSSL_CTX_use_certificate_buffer");
+     ret = ProcessBuffer(ctx, in, sz, format, CERT_TYPE, NULL, NULL, 0,
+-        GET_VERIFY_SETTING_CTX(ctx));
++        GET_VERIFY_SETTING_CTX(ctx), "buffer");
+     WOLFSSL_LEAVE("wolfSSL_CTX_use_certificate_buffer", ret);
+ 
+     return ret;
+@@ -4030,7 +4082,7 @@ int wolfSSL_CTX_use_PrivateKey_buffer(WOLFSSL_CTX* ctx, const unsigned char* in,
+     WOLFSSL_ENTER("wolfSSL_CTX_use_PrivateKey_buffer");
+ 
+     ret = ProcessBuffer(ctx, in, sz, format, PRIVATEKEY_TYPE, NULL, &consumed,
+-        0, GET_VERIFY_SETTING_CTX(ctx));
++        0, GET_VERIFY_SETTING_CTX(ctx), "key buffer");
+ #ifdef WOLFSSL_DUAL_ALG_CERTS
+     if ((ret == 1) && (consumed < sz)) {
+         /* When support for dual algorithm certificates is enabled, the
+@@ -4038,7 +4090,8 @@ int wolfSSL_CTX_use_PrivateKey_buffer(WOLFSSL_CTX* ctx, const unsigned char* in,
+          * private key. Hence, we have to parse both of them.
+          */
+         ret = ProcessBuffer(ctx, in + consumed, sz - consumed, format,
+-            ALT_PRIVATEKEY_TYPE, NULL, NULL, 0, GET_VERIFY_SETTING_CTX(ctx));
++            ALT_PRIVATEKEY_TYPE, NULL, NULL, 0, GET_VERIFY_SETTING_CTX(ctx),
++            "key buffer");
+     }
+ #endif
+ 
+@@ -4056,7 +4109,7 @@ int wolfSSL_CTX_use_AltPrivateKey_buffer(WOLFSSL_CTX* ctx,
+ 
+     WOLFSSL_ENTER("wolfSSL_CTX_use_AltPrivateKey_buffer");
+     ret = ProcessBuffer(ctx, in, sz, format, ALT_PRIVATEKEY_TYPE, NULL,
+-        NULL, 0, GET_VERIFY_SETTING_CTX(ctx));
++        NULL, 0, GET_VERIFY_SETTING_CTX(ctx), "alt key buffer");
+     WOLFSSL_LEAVE("wolfSSL_CTX_use_AltPrivateKey_buffer", ret);
+ 
+     return ret;
+@@ -4271,7 +4324,8 @@ static int wolfSSL_CTX_use_certificate_ex(WOLFSSL_CTX* ctx,
+     }
+ 
+     ret = ProcessBuffer(ctx, certData, certDataLen, certFormat,
+-        CERT_TYPE, NULL, NULL, 0, GET_VERIFY_SETTING_CTX(ctx));
++        CERT_TYPE, NULL, NULL, 0, GET_VERIFY_SETTING_CTX(ctx),
++        label ? label : "cert buffer");
+ 
+ exit:
+     XFREE(certData, ctx->heap, DYNAMIC_TYPE_CERT);
+@@ -4333,7 +4387,7 @@ int wolfSSL_CTX_use_certificate_chain_buffer_format(WOLFSSL_CTX* ctx,
+ {
+     WOLFSSL_ENTER("wolfSSL_CTX_use_certificate_chain_buffer_format");
+     return ProcessBuffer(ctx, in, sz, format, CERT_TYPE, NULL, NULL, 1,
+-        GET_VERIFY_SETTING_CTX(ctx));
++        GET_VERIFY_SETTING_CTX(ctx), "cert chain buffer");
+ }
+ 
+ /* Load a PEM encoded certificate chain in a buffer into SSL context.
+@@ -4376,7 +4430,7 @@ int wolfSSL_use_certificate_buffer(WOLFSSL* ssl, const unsigned char* in,
+     }
+     else {
+         ret = ProcessBuffer(ssl->ctx, in, sz, format, CERT_TYPE, ssl, NULL, 0,
+-            GET_VERIFY_SETTING_SSL(ssl));
++            GET_VERIFY_SETTING_SSL(ssl), "cert buffer");
+     }
+ 
+     return ret;
+@@ -4407,7 +4461,7 @@ int wolfSSL_use_PrivateKey_buffer(WOLFSSL* ssl, const unsigned char* in,
+     }
+     else {
+         ret = ProcessBuffer(ssl->ctx, in, sz, format, PRIVATEKEY_TYPE, ssl,
+-            &consumed, 0, GET_VERIFY_SETTING_SSL(ssl));
++            &consumed, 0, GET_VERIFY_SETTING_SSL(ssl), "key buffer");
+     #ifdef WOLFSSL_DUAL_ALG_CERTS
+         if ((ret == 1) && (consumed < sz)) {
+             /* When support for dual algorithm certificates is enabled, the
+@@ -4415,7 +4469,8 @@ int wolfSSL_use_PrivateKey_buffer(WOLFSSL* ssl, const unsigned char* in,
+              * private key. Hence, we have to parse both of them.
+              */
+             ret = ProcessBuffer(ssl->ctx, in + consumed, sz - consumed, format,
+-                ALT_PRIVATEKEY_TYPE, ssl, NULL, 0, GET_VERIFY_SETTING_SSL(ssl));
++                ALT_PRIVATEKEY_TYPE, ssl, NULL, 0, GET_VERIFY_SETTING_SSL(ssl),
++                "key buffer");
+         }
+     #endif
+     }
+@@ -4431,7 +4486,7 @@ int wolfSSL_use_AltPrivateKey_buffer(WOLFSSL* ssl, const unsigned char* in,
+ 
+     WOLFSSL_ENTER("wolfSSL_use_AltPrivateKey_buffer");
+     ret = ProcessBuffer(ssl->ctx, in, sz, format, ALT_PRIVATEKEY_TYPE, ssl,
+-        NULL, 0, GET_VERIFY_SETTING_SSL(ssl));
++        NULL, 0, GET_VERIFY_SETTING_SSL(ssl), "alt key buffer");
+     WOLFSSL_LEAVE("wolfSSL_use_AltPrivateKey_buffer", ret);
+ 
+     return ret;
+@@ -4669,7 +4724,7 @@ int wolfSSL_use_certificate_chain_buffer_format(WOLFSSL* ssl,
+     }
+     else {
+         ret = ProcessBuffer(ssl->ctx, in, sz, format, CERT_TYPE, ssl, NULL, 1,
+-            GET_VERIFY_SETTING_SSL(ssl));
++            GET_VERIFY_SETTING_SSL(ssl), "cert chain buffer");
+     }
+ 
+     return ret;
+@@ -4826,7 +4881,7 @@ long wolfSSL_CTX_add_extra_chain_cert(WOLFSSL_CTX* ctx, WOLFSSL_X509* x509)
+ 
+         /* Process buffer makes first certificate the leaf. */
+         ret = ProcessBuffer(ctx, der, derSz, WOLFSSL_FILETYPE_ASN1, CERT_TYPE,
+-            NULL, NULL, 1, GET_VERIFY_SETTING_CTX(ctx));
++            NULL, NULL, 1, GET_VERIFY_SETTING_CTX(ctx), "extra chain buffer");
+         if (ret != 1) {
+             ret = 0;
+         }
+diff --git a/wolfcrypt/src/error.c b/wolfcrypt/src/error.c
+index af5ba36b4..9ec9484d4 100644
+--- a/wolfcrypt/src/error.c
++++ b/wolfcrypt/src/error.c
+@@ -182,10 +182,10 @@ const char* wc_GetErrorString(int error)
+         return "ASN date error, bad size";
+ 
+     case ASN_BEFORE_DATE_E :
+-        return "ASN date error, current date before";
++        return "ASN date error, current date is before start of validity";
+ 
+     case ASN_AFTER_DATE_E :
+-        return "ASN date error, current date after";
++        return "ASN date error, current date is after expiration";
+ 
+     case ASN_SIG_OID_E :
+         return "ASN signature error, mismatched oid";
+diff --git a/wolfcrypt/src/logging.c b/wolfcrypt/src/logging.c
+index 29b9221df..b80fc3a56 100644
+--- a/wolfcrypt/src/logging.c
++++ b/wolfcrypt/src/logging.c
+@@ -230,42 +230,6 @@ void WOLFSSL_TIME(int count)
+ 
+ #ifdef DEBUG_WOLFSSL
+ 
+-#if defined(ARDUINO)
+-    /* see Arduino wolfssl.h for wolfSSL_Arduino_Serial_Print */
+-#elif defined(FREESCALE_MQX) || defined(FREESCALE_KSDK_MQX)
+-    /* see wc_port.h for fio.h and nio.h includes */
+-#elif defined(WOLFSSL_SGX)
+-    /* Declare sprintf for ocall */
+-    int sprintf(char* buf, const char *fmt, ...);
+-#elif defined(WOLFSSL_DEOS)
+-#elif defined(MICRIUM)
+-    #if (BSP_SER_COMM_EN  == DEF_ENABLED)
+-        #include <bsp_ser.h>
+-    #endif
+-#elif defined(WOLFSSL_USER_LOG)
+-    /* user includes their own headers */
+-#elif defined(WOLFSSL_ESPIDF)
+-    #include "esp_types.h"
+-    #include "esp_log.h"
+-#elif defined(WOLFSSL_TELIT_M2MB)
+-    #include <stdio.h>
+-    #include "m2m_log.h"
+-#elif defined(WOLFSSL_ANDROID_DEBUG)
+-    #include <android/log.h>
+-#elif defined(WOLFSSL_XILINX)
+-    #include "xil_printf.h"
+-#elif defined(WOLFSSL_LINUXKM)
+-    /* the requisite linux/kernel.h is included in wc_port.h, with incompatible warnings masked out. */
+-#elif defined(FUSION_RTOS)
+-    #include <fclstdio.h>
+-    #define fprintf FCL_FPRINTF
+-#else
+-    #include <stdio.h>  /* for default printf stuff */
+-#endif
+-
+-#if defined(THREADX) && !defined(THREADX_NO_DC_PRINTF)
+-    int dc_log_printf(char*, ...);
+-#endif
+ 
+ #ifdef HAVE_STACK_SIZE_VERBOSE
+ #include <wolfssl/wolfcrypt/mem_track.h>
+@@ -281,106 +245,30 @@ static void wolfssl_log(const int logLevel, const char* const file_name,
+     else {
+ #if defined(WOLFSSL_USER_LOG)
+         WOLFSSL_USER_LOG(logMessage);
+-#elif defined(ARDUINO)
+-        wolfSSL_Arduino_Serial_Print(logMessage);
+-#elif defined(WOLFSSL_LOG_PRINTF)
+-        if (file_name != NULL)
+-            printf("[%s L %d] %s\n", file_name, line_number, logMessage);
+-        else
+-            printf("%s\n", logMessage);
+-#elif defined(THREADX) && !defined(THREADX_NO_DC_PRINTF)
+-        if (file_name != NULL)
+-            dc_log_printf("[%s L %d] %s\n", file_name, line_number, logMessage);
+-        else
+-            dc_log_printf("%s\n", logMessage);
+-#elif defined(WOLFSSL_DEOS)
+-        if (file_name != NULL)
+-            printf("[%s L %d] %s\r\n", file_name, line_number, logMessage);
+-        else
+-            printf("%s\r\n", logMessage);
+-#elif defined(MICRIUM)
+-        if (file_name != NULL)
+-            BSP_Ser_Printf("[%s L %d] %s\r\n",
+-                           file_name, line_number, logMessage);
+-        else
+-            BSP_Ser_Printf("%s\r\n", logMessage);
+-#elif defined(WOLFSSL_MDK_ARM)
+-        fflush(stdout) ;
+-        if (file_name != NULL)
+-            printf("[%s L %d] %s\n", file_name, line_number, logMessage);
+-        else
+-            printf("%s\n", logMessage);
+-        fflush(stdout) ;
+-#elif defined(WOLFSSL_UTASKER)
+-        fnDebugMsg((char*)logMessage);
+-        fnDebugMsg("\r\n");
+-#elif defined(MQX_USE_IO_OLD)
+-        if (file_name != NULL)
+-            fprintf(_mqxio_stderr, "[%s L %d] %s\n",
+-                    file_name, line_number, logMessage);
+-        else
+-            fprintf(_mqxio_stderr, "%s\n", logMessage);
+-#elif defined(WOLFSSL_APACHE_MYNEWT)
+-        if (file_name != NULL)
+-            LOG_DEBUG(&mynewt_log, LOG_MODULE_DEFAULT, "[%s L %d] %s\n",
+-                      file_name, line_number, logMessage);
+-        else
+-            LOG_DEBUG(&mynewt_log, LOG_MODULE_DEFAULT, "%s\n", logMessage);
+-#elif defined(WOLFSSL_ESPIDF)
+-        if (file_name != NULL)
+-            ESP_LOGI("wolfssl", "[%s L %d] %s",
+-                     file_name, line_number, logMessage);
+-        else
+-            ESP_LOGI("wolfssl", "%s", logMessage);
+-#elif defined(WOLFSSL_ZEPHYR)
+-        if (file_name != NULL)
+-            printk("[%s L %d] %s\n", file_name, line_number, logMessage);
+-        else
+-            printk("%s\n", logMessage);
+-#elif defined(WOLFSSL_TELIT_M2MB)
+-        if (file_name != NULL)
+-            M2M_LOG_INFO("[%s L %d] %s\n", file_name, line_number, logMessage);
+-        else
+-            M2M_LOG_INFO("%s\n", logMessage);
+-#elif defined(WOLFSSL_ANDROID_DEBUG)
+-        if (file_name != NULL)
+-            __android_log_print(ANDROID_LOG_VERBOSE, "[wolfSSL]", "[%s L %d] %s",
+-                                file_name, line_number, logMessage);
+-        else
+-            __android_log_print(ANDROID_LOG_VERBOSE, "[wolfSSL]", "%s",
+-                                logMessage);
+-#elif defined(WOLFSSL_XILINX)
+-        if (file_name != NULL)
+-            xil_printf("[%s L %d] %s\r\n", file_name, line_number, logMessage);
+-        else
+-            xil_printf("%s\r\n", logMessage);
+-#elif defined(WOLFSSL_LINUXKM)
+-        if (file_name != NULL)
+-            printk("[%s L %d] %s\n", file_name, line_number, logMessage);
+-        else
+-            printk("%s\n", logMessage);
+-#elif defined(WOLFSSL_RENESAS_RA6M4)
+-        if (file_name != NULL)
+-            myprintf("[%s L %d] %s\n", file_name, line_number, logMessage);
+-        else
+-            myprintf("%s\n", logMessage);
+-#elif defined(STACK_SIZE_CHECKPOINT_MSG) && \
+-      defined(HAVE_STACK_SIZE_VERBOSE) && defined(HAVE_STACK_SIZE_VERBOSE_LOG)
+-        STACK_SIZE_CHECKPOINT_MSG(logMessage);
+-#else
++#elif defined(WOLFSSL_DEBUG_PRINTF)
+         if (log_prefix != NULL) {
+             if (file_name != NULL)
+-                fprintf(stderr, "[%s]: [%s L %d] %s\n",
++                WOLFSSL_DEBUG_PRINTF("[%s]: [%s L %d] %s\n",
+                         log_prefix, file_name, line_number, logMessage);
+             else
+-                fprintf(stderr, "[%s]: %s\n", log_prefix, logMessage);
++                WOLFSSL_DEBUG_PRINTF("[%s]: %s\n", log_prefix, logMessage);
+         } else {
+             if (file_name != NULL)
+-                fprintf(stderr, "[%s L %d] %s\n",
++                WOLFSSL_DEBUG_PRINTF("[%s L %d] %s\n",
+                         file_name, line_number, logMessage);
+             else
+-                fprintf(stderr, "%s\n", logMessage);
++                WOLFSSL_DEBUG_PRINTF("%s\n", logMessage);
+         }
++#elif defined(ARDUINO)
++        wolfSSL_Arduino_Serial_Print(logMessage);
++#elif defined(WOLFSSL_UTASKER)
++        fnDebugMsg((char*)logMessage);
++        fnDebugMsg("\r\n");
++#elif defined(STACK_SIZE_CHECKPOINT_MSG) && \
++      defined(HAVE_STACK_SIZE_VERBOSE) && defined(HAVE_STACK_SIZE_VERBOSE_LOG)
++        STACK_SIZE_CHECKPOINT_MSG(logMessage);
++#else
++    #error No log method defined.
+ #endif
+     }
+ }
+diff --git a/wolfssl/internal.h b/wolfssl/internal.h
+index 9cdbdb697..dd191fb1a 100644
+--- a/wolfssl/internal.h
++++ b/wolfssl/internal.h
+@@ -6389,7 +6389,8 @@ WOLFSSL_TEST_VIS   void wolfSSL_ResourceFree(WOLFSSL* ssl);   /* Micrium uses */
+ 
+     WOLFSSL_LOCAL int ProcessBuffer(WOLFSSL_CTX* ctx, const unsigned char* buff,
+                                     long sz, int format, int type, WOLFSSL* ssl,
+-                                    long* used, int userChain, int verify);
++                                    long* used, int userChain, int verify,
++                                    const char *source_name);
+     WOLFSSL_LOCAL int ProcessFile(WOLFSSL_CTX* ctx, const char* fname, int format,
+                                  int type, WOLFSSL* ssl, int userChain,
+                                 WOLFSSL_CRL* crl, int verify);
+diff --git a/wolfssl/wolfcrypt/logging.h b/wolfssl/wolfcrypt/logging.h
+index 49de70147..8b3cf0fd8 100644
+--- a/wolfssl/wolfcrypt/logging.h
++++ b/wolfssl/wolfcrypt/logging.h
+@@ -89,11 +89,6 @@ enum wc_FuncNum {
+ };
+ #endif
+ 
+-#if defined(ARDUINO)
+-/* implemented in Arduino wolfssl.h */
+-extern WOLFSSL_API int wolfSSL_Arduino_Serial_Print(const char* const s);
+-#endif /* ARDUINO */
+-
+ typedef void (*wolfSSL_Logging_cb)(const int logLevel,
+                                    const char *const logMessage);
+ 
+@@ -157,6 +152,10 @@ WOLFSSL_API void wolfSSL_SetLoggingPrefix(const char* prefix);
+     #define WOLFSSL_TIME(n)  WC_DO_NOTHING
+ #endif
+ 
++#if defined(DEBUG_WOLFSSL) && !defined(WOLFSSL_DEBUG_CERTIFICATE_LOADS)
++    #define WOLFSSL_DEBUG_CERTIFICATE_LOADS
++#endif
++
+ #if defined(DEBUG_WOLFSSL) && !defined(WOLFSSL_DEBUG_ERRORS_ONLY)
+     #if defined(_WIN32)
+         #if defined(INTIME_RTOS)
+@@ -268,6 +267,90 @@ WOLFSSL_API void wolfSSL_SetLoggingPrefix(const char* prefix);
+     extern WOLFSSL_API THREAD_LS_T void *StackSizeCheck_stackOffsetPointer;
+ #endif
+ 
++/* Port-specific includes and printf methods: */
++
++#if defined(ARDUINO)
++    /* implemented in Arduino wolfssl.h */
++    extern WOLFSSL_API int wolfSSL_Arduino_Serial_Print(const char* const s);
++#elif defined(FREESCALE_MQX) || defined(FREESCALE_KSDK_MQX)
++    /* see wc_port.h for fio.h and nio.h includes */
++#elif defined(WOLFSSL_SGX)
++    /* Declare sprintf for ocall */
++    int sprintf(char* buf, const char *fmt, ...);
++#elif defined(WOLFSSL_DEOS)
++#elif defined(MICRIUM)
++    #if (BSP_SER_COMM_EN  == DEF_ENABLED)
++        #include <bsp_ser.h>
++    #endif
++#elif defined(WOLFSSL_USER_LOG)
++    /* user includes their own headers */
++#elif defined(WOLFSSL_ESPIDF)
++    #include "esp_types.h"
++    #include "esp_log.h"
++#elif defined(WOLFSSL_TELIT_M2MB)
++    #include <stdio.h>
++    #include "m2m_log.h"
++#elif defined(WOLFSSL_ANDROID_DEBUG)
++    #include <android/log.h>
++#elif defined(WOLFSSL_XILINX)
++    #include "xil_printf.h"
++#elif defined(WOLFSSL_LINUXKM)
++    /* the requisite linux/kernel.h is included in linuxkm_wc_port.h, with
++     * incompatible warnings masked out.
++     */
++#elif defined(FUSION_RTOS)
++    #include <fclstdio.h>
++    #define fprintf FCL_FPRINTF
++#else
++    #include <stdio.h>  /* for default printf stuff */
++#endif
++
++#if defined(THREADX) && !defined(THREADX_NO_DC_PRINTF)
++    int dc_log_printf(char*, ...);
++#endif
++
++#ifdef WOLFSSL_DEBUG_PRINTF
++    /* user-supplied definition */
++#elif defined(ARDUINO)
++    /* ARDUINO only has print and sprintf, no printf. */
++#elif defined(WOLFSSL_LOG_PRINTF) || defined(WOLFSSL_DEOS)
++    #define WOLFSSL_DEBUG_PRINTF(...) printf(__VA_ARGS__)
++#elif defined(THREADX) && !defined(THREADX_NO_DC_PRINTF)
++    #define WOLFSSL_DEBUG_PRINTF(...) dc_log_printf(__VA_ARGS__)
++#elif defined(MICRIUM)
++    #define WOLFSSL_DEBUG_PRINTF(...) BSP_Ser_Printf(__VA_ARGS__)
++#elif defined(WOLFSSL_MDK_ARM)
++    #define WOLFSSL_DEBUG_PRINTF(...) do { \
++            fflush(stdout);                \
++            printf(__VA_ARGS__);           \
++            fflush(stdout);                \
++        } while (0)
++#elif defined(WOLFSSL_UTASKER)
++    /* WOLFSSL_UTASKER only has fnDebugMsg and related primitives, no printf. */
++#elif defined(MQX_USE_IO_OLD)
++    #define WOLFSSL_DEBUG_PRINTF(...) fprintf(_mqxio_stderr, __VAR_ARGS)
++#elif defined(WOLFSSL_APACHE_MYNEWT)
++    #define WOLFSSL_DEBUG_PRINTF(...) LOG_DEBUG(&mynewt_log, \
++        LOG_MODULE_DEFAULT, __VA_ARGS__)
++#elif defined(WOLFSSL_ESPIDF)
++    #define WOLFSSL_DEBUG_PRINTF(...) ESP_LOGI("wolfssl", __VA_ARGS__)
++#elif defined(WOLFSSL_ZEPHYR)
++    #define WOLFSSL_DEBUG_PRINTF(...) printk(__VA_ARGS__)
++#elif defined(WOLFSSL_TELIT_M2MB)
++    #define WOLFSSL_DEBUG_PRINTF(...) M2M_LOG_INFO(__VA_ARGS__)
++#elif defined(WOLFSSL_ANDROID_DEBUG)
++    #define WOLFSSL_DEBUG_PRINTF(...) __android_log_print(ANDROID_LOG_VERBOSE, \
++                                                    "[wolfSSL]", __VA_ARGS__)
++#elif defined(WOLFSSL_XILINX)
++    #define WOLFSSL_DEBUG_PRINTF(...) xil_printf(__VA_ARGS__)
++#elif defined(WOLFSSL_LINUXKM)
++    #define WOLFSSL_DEBUG_PRINTF(...) printk(__VA_ARGS__)
++#elif defined(WOLFSSL_RENESAS_RA6M4)
++    #define WOLFSSL_DEBUG_PRINTF(...) myprintf(__VA_ARGS__)
++#else
++    #define WOLFSSL_DEBUG_PRINTF(...) fprintf(stderr, __VA_ARGS__)
++#endif
++
+ #ifdef __cplusplus
+ }
+ #endif
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
similarity index 84%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index b7ff23e719..b420795cee 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -14,20 +14,25 @@ RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = " \
     git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master \
+    file://0001-wolfssl-wolfcrypt-logging.h-and-wolfcrypt-src-loggin.patch \
     file://run-ptest \
 "
 
-SRCREV = "00e42151ca061463ba6a95adb2290f678cbca472"
+SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"
 
 S = "${WORKDIR}/git"
 
 inherit autotools ptest
 
+EXTRA_OECONF += "--enable-certreq --enable-dtls --enable-opensslextra --enable-certext --enable-certgen"
+
 PACKAGECONFIG ?= "reproducible-build"
 
 PACKAGECONFIG[reproducible-build] = "--enable-reproducible-build,--disable-reproducible-build,"
 BBCLASSEXTEND += "native nativesdk"
 
+CFLAGS += '-fPIC -DCERT_REL_PREFIX=\\"./\\"'
+
 RDEPENDS:${PN}-ptest += " bash"
 
 do_install_ptest() {

