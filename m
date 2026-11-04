Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2783.1793772340858044911
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 22:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hwYSPSp+;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-353804b591eso612285eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 22:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772340; x=1794377140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxQ7c3hLD5lnsRQ/cSRcHdb3os1R+x5wNzsy80FyaNM=;
        b=hwYSPSp+5sbUSNhjjkGKY7Ount5YR7Cms17chjnWshpRwGzve7/SlO9GuFokFW9Nj3
         1NTQVyNF8sLO35DKvUFyOqj46pEzx9dZgwTQ5RTopwwzOPjmq+ky9NnL5E0y4fbpx+F9
         l9MsRi/VWuJz9RM/gll1sLYnZgu8pCgy48VLFnbOCClIUvUfKoU7BXuVH13rQZ6/ikIF
         01D+AK2kelY3+gD2En4roh+IOpe+1GVp5R1KWxpwbvUITk8DK2bgqg5CmXmQP/uCgJV+
         kTD4oylaeaq5+rN8Hn8J9oIiLoEzOjCUO+59/84ZbHjLZLdMHKibwV92u3OAo+1pyYBM
         cSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772340; x=1794377140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxQ7c3hLD5lnsRQ/cSRcHdb3os1R+x5wNzsy80FyaNM=;
        b=qlxrJtysgaKUoLcCplmbMEcdSZQvfalViPLclWCPHmGHBUu9TJhhJ5Hf93ncsCYsnK
         ws95eacULr50m4pmxwagpItkhdOAYURnQqIFQv59b9wSXCS2KLzMOYIwJfwKlDKNiydJ
         mwo0vOP3DUAfqPXeNPdqsmYR/qK+e+HdzX7pMsUjHt7grYZSQ/cJQEDGwDerXYPgfcm5
         BGlRc92FMXocCeNjt84OF/gFNi8bTBdIBuWitsA0wAcjsRjOBhU/ygVDzCa/TYAt/L0y
         Id5wDbsw9xLPo7xQaE9soSpWYPLIWwFffOt685+FO6XcNY//EzSrC8OvUg2XVd/+N9Gr
         PRxA==
X-Gm-Message-State: APuU4Z/YPG7qd3wTVmRvi2C/EqgCbvZsZJSeMmvsN6tzfdceTgVyVoxy
	GH0YlV8tESzBdgXQr+aa2tGeu2bkwx5ka7dXvh77lv33yoClNJ1Kzl/tTEk2XgaWlicoqA==
X-Gm-Gg: AYBFou1A4EAFWMc/vJVQgp6g9BTHLRfPWge6jOP7JI61QUQAnRDUu44bCnoD/r+LqxU
	QdVLzX33mlK9UgYgeedV6xe5ri8zdaJ83Ub4AVoljAHKcnSCmfe2ITsommSz33TnpRfkRtm+f3F
	jD6Yz/6zZd9l9JA2nqA08sRBH0/20TDAlNsBQ17lTX6xvIBO+v263hutPmawKYqNqcALUVHM/JU
	l/HuCiGcsE1W27U5/2+Q9Bnbs7BDCMktwYCWgDjCgxKQ+fYD8AMnMq7N8EfL1lWPirjt7Giarn6
	sAZ8a6p9Fvgzwzqa0ERUOXMxadNXlom5t3FAtFFEE8PLyHkKLMQOl49m4c5Ju7D6xpJGRMiUFBW
	IRTECfbV1djbfb/5Jv2YDFWH42PhmWW7JEmGjGaBF5/2LGO+03tzxfkQ9uqfQYEFg+/OBgVa5/A
	OXFA6s/CCWxQhfVZE5t1stTqQT2txSmbAISk0M+0zwErN5uxlIV/cbC2Oybq7kkxXAFBZ1M6JOK
	VOrkG6JBxFuVwGlGQPlh1rGh43anmM8uF0Umt9CJjg/HTukDzr+slCJTBNAp+Oo7vIY5wxPTU24
	+unIn+kVbzdbrEEyG9CtB0h42KyMchx9lfKnyT9Qtm+elSPRT6rspOtuv8eiI1HxxfazUUqCPpG
	26nzzTPgQN2xLp1zET+mrdl00xm9i9XLxPkCdsfSvP8IHviVghoqlPwHjv1rrRlDzXQCRTatGtT
	0D6JG0rXrcA+kqc06KcM3Htpq9lNafXux7yZnWctbCa+yRgrA3Bz9GszQgvSbLWOX/01Hys86kc
	V4YRb5jBQPj7ydeBrTafIn6NWSKtDxwQUc0Nh5NFBXjw2wKdwjRvbRMJwsK34MBRvAEMsUEwEmr
	ymBu
X-Received: by 2002:a05:7301:df4a:b0:36c:9af3:2309 with SMTP id 5a478bee46e88-36c9af33150mr3611225eec.0.1793772339916;
        Tue, 03 Nov 2026 22:05:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm5973410eec.3.2026.11.03.22.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:05:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] imx-cst: Fix build with OpenSSL 4.1
Date: Tue,  3 Nov 2026 22:05:34 -0800
Message-ID: <20261104060534.1875273-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104060534.1875273-1-khem.raj@oss.qualcomm.com>
References: <20261104060534.1875273-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 06:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131833
Content-Type: text/plain; charset="utf-8"

OpenSSL 4.1 deprecates ASN1_STRING_length(), which the OpenSSL 4 ASN1
opaque fix uses, and the build uses -Werror:

  openssl_helper.c:1255:21: error: 'ASN1_STRING_length' is deprecated:
  Since OpenSSL 4.1; use ASN1_STRING_get_length() [-Werror,-Wdeprecated-declarations]

Use ASN1_STRING_get_length() when building against OpenSSL 4.1 or newer.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...se-ASN1_STRING_get_length-with-OpenS.patch | 38 +++++++++++++++++++
 .../recipes-support/imx-cst/imx-cst_4.0.1.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0018-openssl_helper-Use-ASN1_STRING_get_length-with-OpenS.patch

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0018-openssl_helper-Use-ASN1_STRING_get_length-with-OpenS.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0018-openssl_helper-Use-ASN1_STRING_get_length-with-OpenS.patch
new file mode 100644
index 0000000000..a293d0eef7
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0018-openssl_helper-Use-ASN1_STRING_get_length-with-OpenS.patch
@@ -0,0 +1,38 @@
+From d4362c9c99f2d80a6c4f25528934e040e333fd85 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 3 Nov 2026 07:13:41 -0800
+Subject: [PATCH] openssl_helper: Use ASN1_STRING_get_length() with OpenSSL 4.1
+
+OpenSSL 4.1 deprecates ASN1_STRING_length() in favour of
+ASN1_STRING_get_length(), which returns size_t. With -Werror the build
+fails with:
+
+  openssl_helper.c:1255:21: error: 'ASN1_STRING_length' is deprecated:
+  Since OpenSSL 4.1; use ASN1_STRING_get_length() [-Werror,-Wdeprecated-declarations]
+
+Use the new accessor when building against OpenSSL 4.1 or newer and keep
+ASN1_STRING_length() for older versions. A serial number is at most 20
+octets, so the cast to int is safe.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/lib/common/openssl_helper.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/lib/common/openssl_helper.c b/src/lib/common/openssl_helper.c
+index 7a6980e..e8961de 100644
+--- a/src/lib/common/openssl_helper.c
++++ b/src/lib/common/openssl_helper.c
+@@ -1252,7 +1252,11 @@ int get_certificate_serial_number_length(X509 *cert)
+
+     /* Get the raw data of the serial number */
+     serial_bytes = ASN1_STRING_get0_data(serial_number);
++#if OPENSSL_VERSION_NUMBER >= 0x40100000L
++    serial_length = (int)ASN1_STRING_get_length(serial_number);
++#else
+     serial_length = ASN1_STRING_length(serial_number);
++#endif
+
+     /* Check if the serial number is negative (MSB of first byte is set) */
+     if (serial_bytes[0] & 0x80)
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
index 3a0f717440..7683ebad52 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "\
     file://0015-fix-openssl-4-engine-api-removal.patch \
     file://0016-fix-openssl-4-const-subject-name.patch \
     file://0017-cst-port-pkcs11-signing-from-engine-to-provider.patch \
+    file://0018-openssl_helper-Use-ASN1_STRING_get_length-with-OpenS.patch \
 "
 SRC_URI[sha256sum] = "fd92a1a9faa10fb81bbf752c7ee1e257f17e1ec4c2964f8a47adf8a3eaa7df41"

