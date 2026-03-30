Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E4FFB3D05
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47976.1774867157282715122
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sR9xng/K;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so308795a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867156; x=1775471956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TREZ+GDITMAz5jFv/PAcPbJSZVIMB4gGq8tus5Rtu1I=;
        b=sR9xng/KRoFWp/YodNUUUPGXJCbYd3IaN2aRXkeejUIeWKBTYNwNhVTI1QO25GQJ1q
         nZZcXAHO9zPK3RIcRP8Zokp2iJPiGFp3r71lqGS1dSqGbqqAQP3G/XgdVu0sUeF+lcUJ
         i3qEnQlYh0GRTQry+gzvT/qpympxCCdKZBllaPhzfAqpRKEqVC4p08io1dct1WOi9YAJ
         YXOX9Srv816khjtUukMQRHcx59kz5TRSKBNua6R0B1FQWaGken029iZI3figJr80nOLE
         LJQYPuJgYg82I2/fSUmCvQJI7q/FJPkAPmeq4QEBdTlEHrHoNACS8XIEEbrDPOBwsukl
         th8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867156; x=1775471956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TREZ+GDITMAz5jFv/PAcPbJSZVIMB4gGq8tus5Rtu1I=;
        b=TYrdUfxUcr2dNd8C7GbtvquzQY0la1UQoYK2mtNH/BEAIwek5bl+dV3KyHylfyBn3c
         hwzUzg3e977q2VyQgT5AtvhLocxv1IkM4A7evOqigpo/tGfmpYb6wfijo52tsnny7ehB
         D9zH1hPQldzcIQPc7kRG/rZ6sVWEm+i/PItD2MupuB84sH+ChXOANSkdOLYFwqFMp+Dj
         DvGQEzHhxfuXiWvicu24ovs9/ybCL5rU+RpFGDJoqXVglYqdRErBJHh+LHOieaPnzWU2
         QRHUH3iepzq7HhcrkPWBy2mr32JuQ0cNzrkL3RrXaVJH1uBISDb6cJMkY//VyEuL/dFL
         Zp5Q==
X-Gm-Message-State: AOJu0YzS8gV2lsecai0kFT51RzxAwRJeGjUy56zFOiocMeJrtx69PX/D
	nVUT0xpm9DX0RXjdt4GOocYo6vN3lwQm42Tsj1esOL+WAU0Nkt88f6ScKfk2LQ==
X-Gm-Gg: ATEYQzwvCJO/4HK5Nd+FvCrpRZM0D3DZSK6sDaTnuGCkoodop3UAK4QxM0nzOtRJsE/
	GavDB7rfQ218/Ah3BHHYwi8+TX514wQzpwgGooeJoFBqZsAm7iNgdHO1G/gqpJ/OIj/R6KwGfk9
	TsKP+LaJU14a5SpdNG7BOUupTdkOsr/jtA/ktx2fUEh/mTczDyl2jVM8DaJT5c+FQLz5pcUbrIm
	bl2eTzrH084jFRuqpka5V6H+fWyJEyPQQyHvyJ5hQqDGu5u1ozGVOg/OnR8vnqRdVTnb60z9nM7
	VXZLmqIeacXrrD3KvCYk00gABEMCW2m2w6lrQKWD6t1Z8/lO+LfKYVO5GhvUDaXlPL8UxCqIYLn
	s6QwajCPcNveQb44nb33cc5F0AWwrKdrXa+95NIp+EtY82+wFFC5xHat3EP/kZMa8Op6eanj7CX
	GMwY4B5v90MkmU8oZEoIbGjZrbC0CkVKL0dr0=
X-Received: by 2002:a17:90a:588:b0:35d:9dc8:7191 with SMTP id 98e67ed59e1d1-35d9dc8734dmr3897117a91.14.1774867156508;
        Mon, 30 Mar 2026 03:39:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 5/19] hiawatha: upgrade 11.7 -> 11.8
Date: Mon, 30 Mar 2026 23:38:32 +1300
Message-ID: <20260330103846.3381644-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125848

From: Gyorgy Sarvari <skandigraun@gmail.com>

Drop patches that are included in this release.

Changes:
  * mbed TLS updated to 3.6.4.
  * Small bugfixes.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d92fa873e5616ee7a7b25683ddfdb6849ef72d29)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ..._-nonstring-to-remove-unterminated-s.patch | 43 -------------------
 ...ute__-nonstring-with-macro-MBEDTLS_A.patch | 42 ------------------
 ...BEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch | 33 --------------
 .../{hiawatha_11.7.bb => hiawatha_11.8.bb}    |  5 +--
 4 files changed, 1 insertion(+), 122 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch
 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch
 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_11.7.bb => hiawatha_11.8.bb} (89%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/files/0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch b/meta-webserver/recipes-httpd/hiawatha/files/0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch
deleted file mode 100644
index 5a9c719b6d..0000000000
--- a/meta-webserver/recipes-httpd/hiawatha/files/0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 56b26ede007453a4ee9832076597e82d2a903700 Mon Sep 17 00:00:00 2001
-From: Felix Conway <felix.conway@arm.com>
-Date: Wed, 11 Jun 2025 16:04:06 +0100
-Subject: [PATCH 1/2] Add __attribute__ ((nonstring)) to remove
- unterminated-string-initialization warning
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/pull/10216]
-Signed-off-by: Felix Conway <felix.conway@arm.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- library/ssl_tls13_keys.c | 3 ++-
- library/ssl_tls13_keys.h | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/library/ssl_tls13_keys.c b/library/ssl_tls13_keys.c
-index 739414e..375814c 100644
---- a/library/ssl_tls13_keys.c
-+++ b/library/ssl_tls13_keys.c
-@@ -81,7 +81,8 @@ struct mbedtls_ssl_tls13_labels_struct const mbedtls_ssl_tls13_labels =
-  *            the HkdfLabel structure on success.
-  */
- 
--static const char tls13_label_prefix[6] = "tls13 ";
-+/* We need to tell the compiler that we meant to leave out the null character. */
-+static const char tls13_label_prefix[6] __attribute__ ((nonstring)) = "tls13 ";
- 
- #define SSL_TLS1_3_KEY_SCHEDULE_HKDF_LABEL_LEN(label_len, context_len) \
-     (2                     /* expansion length           */ \
-diff --git a/library/ssl_tls13_keys.h b/library/ssl_tls13_keys.h
-index d3a4c6c..95cde7a 100644
---- a/library/ssl_tls13_keys.h
-+++ b/library/ssl_tls13_keys.h
-@@ -40,8 +40,9 @@
- 
- #if defined(MBEDTLS_SSL_PROTO_TLS1_3)
- 
-+/* We need to tell the compiler that we meant to leave out the null character. */
- #define MBEDTLS_SSL_TLS1_3_LABEL(name, string)       \
--    const unsigned char name    [sizeof(string) - 1];
-+    const unsigned char name    [sizeof(string) - 1] __attribute__ ((nonstring));
- 
- union mbedtls_ssl_tls13_labels_union {
-     MBEDTLS_SSL_TLS1_3_LABEL_LIST
diff --git a/meta-webserver/recipes-httpd/hiawatha/files/0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch b/meta-webserver/recipes-httpd/hiawatha/files/0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch
deleted file mode 100644
index 2f94cee277..0000000000
--- a/meta-webserver/recipes-httpd/hiawatha/files/0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 91ec670d3f6399510995dedbf99dca2e7e9bd2d8 Mon Sep 17 00:00:00 2001
-From: Felix Conway <felix.conway@arm.com>
-Date: Thu, 12 Jun 2025 11:28:56 +0100
-Subject: [PATCH 2/2] Replace __attribute__((nonstring)) with macro
- MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING
-
-This macro applies __attribute__((nonstring)) when using a compiler that supports it
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/pull/10216]
-Signed-off-by: Felix Conway <felix.conway@arm.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- library/ssl_tls13_keys.c | 2 +-
- library/ssl_tls13_keys.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/library/ssl_tls13_keys.c b/library/ssl_tls13_keys.c
-index 375814c..621a7d5 100644
---- a/library/ssl_tls13_keys.c
-+++ b/library/ssl_tls13_keys.c
-@@ -82,7 +82,7 @@ struct mbedtls_ssl_tls13_labels_struct const mbedtls_ssl_tls13_labels =
-  */
- 
- /* We need to tell the compiler that we meant to leave out the null character. */
--static const char tls13_label_prefix[6] __attribute__ ((nonstring)) = "tls13 ";
-+static const char tls13_label_prefix[6] MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING = "tls13 ";
- 
- #define SSL_TLS1_3_KEY_SCHEDULE_HKDF_LABEL_LEN(label_len, context_len) \
-     (2                     /* expansion length           */ \
-diff --git a/library/ssl_tls13_keys.h b/library/ssl_tls13_keys.h
-index 95cde7a..3aa94d7 100644
---- a/library/ssl_tls13_keys.h
-+++ b/library/ssl_tls13_keys.h
-@@ -42,7 +42,7 @@
- 
- /* We need to tell the compiler that we meant to leave out the null character. */
- #define MBEDTLS_SSL_TLS1_3_LABEL(name, string)       \
--    const unsigned char name    [sizeof(string) - 1] __attribute__ ((nonstring));
-+    const unsigned char name    [sizeof(string) - 1] MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING;
- 
- union mbedtls_ssl_tls13_labels_union {
-     MBEDTLS_SSL_TLS1_3_LABEL_LIST
diff --git a/meta-webserver/recipes-httpd/hiawatha/files/define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch b/meta-webserver/recipes-httpd/hiawatha/files/define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch
deleted file mode 100644
index 6e2d9eb5f1..0000000000
--- a/meta-webserver/recipes-httpd/hiawatha/files/define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Replace __attribute__((nonstring)) with macro MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING
-This macro applies __attribute__((nonstring)) when using a compiler that supports it
-
-Upstream-Status: Backport [https://github.com/Mbed-TLS/TF-PSA-Crypto/commit/996f4fa3a2fbe8792ed3efd1bcb3657001f35ae1]
-
-Signed-off-by: Felix Conway <felix.conway@arm.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/library/ssl_tls13_keys.h
-+++ b/library/ssl_tls13_keys.h
-@@ -7,6 +7,22 @@
- #if !defined(MBEDTLS_SSL_TLS1_3_KEYS_H)
- #define MBEDTLS_SSL_TLS1_3_KEYS_H
- 
-+/* GCC >= 15 has a warning 'unterminated-string-initialization' which complains if you initialize
-+ * a string into an array without space for a terminating NULL character. In some places in the
-+ * codebase this behaviour is intended, so we add the macro MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING
-+ * to suppress the warning in these places.
-+ */
-+#if defined(__has_attribute)
-+#if __has_attribute(nonstring)
-+#define MBEDTLS_HAS_ATTRIBUTE_NONSTRING
-+#endif /* __has_attribute(nonstring) */
-+#endif /* __has_attribute */
-+#if defined(MBEDTLS_HAS_ATTRIBUTE_NONSTRING)
-+#define MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING __attribute__((nonstring))
-+#else
-+#define MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING
-+#endif /* MBEDTLS_HAS_ATTRIBUTE_NONSTRING */
-+
- /* This requires MBEDTLS_SSL_TLS1_3_LABEL( idx, name, string ) to be defined at
-  * the point of use. See e.g. the definition of mbedtls_ssl_tls13_labels_union
-  * below. */
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb
similarity index 89%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb
index 4e7e5fa31d..720c292026 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb
@@ -7,14 +7,11 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 SECTION = "net"
 
 SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-${PV}.tar.gz \
-           file://0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch;patchdir=mbedtls \
-           file://0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch;patchdir=mbedtls \
-           file://define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch;patchdir=mbedtls \
            file://hiawatha-init \
            file://hiawatha.service \
           "
 
-SRC_URI[sha256sum] = "8bc180ae3b986d02466f081efeefdb1595d96783f581fded2a9b198752ab7ae1"
+SRC_URI[sha256sum] = "1376763750fb9a88a780bac6aba8707bc2a78f8ee089c62d433e50216a5183bd"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"

