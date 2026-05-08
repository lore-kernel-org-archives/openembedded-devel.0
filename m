Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F30CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 08:56:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9540.1778230595981937824
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2026 01:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p6oUIgE7;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso10864295e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 01:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778230594; x=1778835394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNgf+OZtcUkBW+iRE7N8BrfKFtYWbTRtaPD8g1RQBCc=;
        b=p6oUIgE7mqdWEWqC5zG4EaglqKCoXFPOsletOFWjLR0dY0JIECCEEeqsr/ACJhy0a6
         lR+385iQDiEMhzr8EfD1dZnLk1VUpl8uzjH76OT5d8WIfmsGONevbIMUcvkz1Toasmem
         fcDUIUGZvNe6pup73gcxUYlTJdivO1+2U2Q3C8H6BoPS3kDRpPemUyLEUAPwP9VLxIT9
         xIBbrRqTAtcLZMJTKmbmWXA4fmJoSJAxSRsrRrXtZ2+HxvMy5uGSp6hP7L3N/qmREIwB
         CFQ1W3IIPIceF3QpMNo5DhoL7grnwwQub05hFn9Ltwmz/iIPB6QY/5LhTWH1yNYeF1UG
         GPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778230594; x=1778835394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNgf+OZtcUkBW+iRE7N8BrfKFtYWbTRtaPD8g1RQBCc=;
        b=cbIhz4pKiOeDsXkKDH9HpO3QRLY3nAD3pTPlITpH6BsBp5BefCjdsJ+1DoGpz7CaUs
         8unOvG4/I5DtXta2QT0NP1CLKNpYpo2mUoxGAce56MiCeb/talKBW6dQpGQEuYrVccj2
         olrpLYRxVxb1LaoCuX6yHQAnDBFdBTEt3VAImy2UxMZQGsjjboniWf/YCfN2Hr0LNUdF
         +JOPbSTV0T/UspL98F02sL/vXIQAz5ZzkqqWdLDwqKdNSABF6AH3z7tZEPQuC6P57QYR
         UxrHzgVuUQxXeEAf91ovVJw+e73spGdB4IRyP1wKI7csHaZKG4QldEp8jVIlCDT41ouI
         p70Q==
X-Gm-Message-State: AOJu0YzsEuSjf/PdFeGPj3urjlov1CuM7v9vYCieMR6KcCsvFZKGZ71S
	uFy86VvEyM+M3xMSsjHJLu+5dpZHvYLDmsLRBK2h1sb8p2WBdmJDN3LnXkC/+g==
X-Gm-Gg: AeBDies6NyJCgG6/x22h4EjngmoN6HgspYqHZC7Aw4pi5JseHF2D21asT4KMOPHXy+B
	k6/dSjmvXGRlqVPTPpuHVOS7Rz6vbgYHTxBzgBKRS2SWvyPjPjuWKXmW2eM73K6I0wnZk2ELIWP
	qcZTkJkYGmn6gK51Rtz6Ow8X1hSL1xPJKaAmLpR8dyyauF73ZGJ/kQj+Gxz1IeyyloY/oBxsbsp
	QQO+UX6k01BTLfqfA7773Z9nwlUNdUsSCP9mlDTU+Jb1Wg4Av1/gnWhqDprxGU1OtyYZ8lNvieg
	lzvirsCMGsF7c7Qzk0MSxWFZsmNKlQukkEJd3RIVbsiGcjfXnVch4u8rCmYdaBFJUTGUwSb+0RX
	NPnGZAf6B8NxKIVuWZTa+yGP5vPuxEMWR0+dShO78X9bnzZV0H4VjNA5tmjcGBV2rCQDbvCi1+d
	7KtncsfDOZj2ZyPznUcpUlFLlA7jqj40i28eN2zGUeWZFpALWkXaSsl2Owsd6M9ISdNGQgglFEm
	3UE3xFRRDBSusZUhT242A==
X-Received: by 2002:a05:600c:15d1:b0:48d:112c:f582 with SMTP id 5b1f17b1804b1-48e51e1e415mr110004425e9.11.1778230593800;
        Fri, 08 May 2026 01:56:33 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ef0024sm25735325e9.14.2026.05.08.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:56:33 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Update for mbedtls4, set daemon version
Date: Fri,  8 May 2026 09:54:12 +0100
Message-ID: <20260508085411.32273-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 08:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126825

Switch to psa_crypto_init() which initialises all crypto subsystems,
this works for both Mbed TLS 3 and 4. Also set the daemon version so
it's correctly reported at runtime.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...-mbedtls-for-compatibility-with-mbed.patch | 57 +++++++++++++++++++
 .../mdns/mdns_2881.100.56.0.1.bb              |  4 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch
new file mode 100644
index 000000000000..a561fd232ff3
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch
@@ -0,0 +1,57 @@
+From f4f5039eb90918b5248bd6266afdad0b33b2d010 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Thu, 30 Apr 2026 08:21:19 +0100
+Subject: [PATCH] mDNSPosix: Rework mbedtls for compatibility with mbedtls4
+
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSPosix/mbedtls.c | 21 +++++----------------
+ 1 file changed, 5 insertions(+), 16 deletions(-)
+
+diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
+index 6726ef9b9145..c4b7fd4edfff 100644
+--- a/mDNSPosix/mbedtls.c
++++ b/mDNSPosix/mbedtls.c
+@@ -29,14 +29,10 @@
+ #include <errno.h>
+ #include <unistd.h>
+ 
++#include <psa/crypto.h>
++
+ #include <mbedtls/error.h>
+-#include <mbedtls/pk.h>
+-#include <mbedtls/ecp.h>
+-#include <mbedtls/ecdsa.h>
+-#include <mbedtls/entropy.h>
+-#include <mbedtls/ctr_drbg.h>
+-#include <mbedtls/sha256.h>
+-#include <mbedtls/base64.h>
++#include <mbedtls/psa_util.h>
+ 
+ #include <mbedtls/x509.h>
+ #include <mbedtls/ssl.h>
+@@ -53,21 +49,14 @@ struct TLSServerContext_struct {
+     mbedtls_ssl_config config;
+ };
+ 
+-// Context that is shared amongs all TLS connections, regardless of which server cert/key is in use.
+-static mbedtls_entropy_context entropy;
+-static mbedtls_ctr_drbg_context ctr_drbg;
+-
+ mDNSBool
+ mDNSPosixTLSInit(void)
+ {
+     int status;
+ 
+-    mbedtls_entropy_init(&entropy);
+-    mbedtls_ctr_drbg_init(&ctr_drbg);
+-
+-    status = mbedtls_ctr_drbg_seed(&ctr_drbg, mbedtls_entropy_func, &entropy, NULL, 0);
++    status = psa_crypto_init();
+     if (status != 0) {
+-        LogRedact(MDNS_LOG_CATEGORY_DEFAULT, MDNS_LOG_ERROR, "Unable to seed RNG: %x", -status);
++        LogRedact(MDNS_LOG_CATEGORY_DEFAULT, MDNS_LOG_ERROR, "PSA crypto init failed: %x", -status);
+         return mDNSfalse;
+     }
+     return mDNStrue;
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
index 10560d795ad3..48e7a8d52d3e 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0001-Fix-build-with-gcc-15.patch \
            file://mdns.service \
            file://0007-mDNSShared-Make-Apple-Wireless-Direct-Link-depend-on.patch \
+           file://0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch \
            "
 BRANCH = "rel/mDNSResponder-2881"
 SRCREV = "ea3902cfeff86a04b4c684753c80e425edbd1a21"
@@ -47,7 +48,8 @@ EXTRA_OEMAKE = "os=linux 'CC=${CCLD}' 'LD=${CCLD}' 'LINKOPTS=${LDFLAGS}' STRIP=:
 
 # MDNS_VERSIONSTR_NODTS disables __DATE__ and __TIME__ in the version string,
 # which are fixed anyway for build reproducibility.
-TARGET_CPPFLAGS += "-DMDNS_VERSIONSTR_NODTS"
+TARGET_CPPFLAGS += "-DmDNSResponderVersion=${PV} \
+                    -DMDNS_VERSIONSTR_NODTS"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 

