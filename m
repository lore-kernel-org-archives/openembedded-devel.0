Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7973BE7DF04
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:37:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57081.1770050238156143298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 08:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VyRqPFgJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso27940965e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050236; x=1770655036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hslOqK7Ad0YHbOK8qBMW8qjDEzRpaLkggCyDusBd9QU=;
        b=VyRqPFgJ1p9PuD/OIi5j5IwYvWq/zqfDQSObPY1YRU7YKM4Repluzl4sMfEicJkEwB
         +lJEBdWgOeJ5ZGW9k3oR8jHKYltydbi8BIxQt5DI7eXh3LS+qGeawv+im2YIeqSbOFqF
         NBpAGTZDu4oGu9aZ0NeuoP3Z9kRSDTLF7DrybZvqbbrS6y+0At5J5HN1/4Kf8IxM5C4y
         ocoFzZS9xZrvtyYriahv2OoY7yuPRqf16vI4gAVIxBMnUnvtO9Eoi6J2B7Hw2HMXM00w
         UXu0u+/UtOxf18l269iaM1eTo1dsYBfOr/smuWHiEHNqhwBTGlkpPXre04q896USG04z
         CW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050236; x=1770655036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hslOqK7Ad0YHbOK8qBMW8qjDEzRpaLkggCyDusBd9QU=;
        b=dPyDkXd2p/TdvdMierKs2tdDglQtIIc9kIELrj1jeW9QyW5xceHp9jTejRawU8xJxg
         LunKvHABEEiGFwQ2XeJOGpyK7j9YbhZYFg1ig03L+dGr+DL4fOLTlU+00QqkV/wy0LRQ
         Gnuq7TXhL7tjKmuDXcEOqhSkJ07e05t38rfvDfMuuVyZac18HDj7VR2r44h9KK1FWDI4
         7rhHiwTC5nfJl45Z+UbhS/EUqpDjrta96D2L+v4q451tX4oDXCBB6OmzczwD1Pzeo4LM
         zCffgqOteF6DuCZz8w9H3Kr7ZLWEHxX61Ne0HOz+7ndsTcLdjR693jVWWsWLO1QG8Dh0
         k/dA==
X-Gm-Message-State: AOJu0YwpcrC0MfFeDxr/e/cfrOs4OtQtbSsHdsNA8mi4lVSJWiF4Fap3
	+STksCiwF/wNNOKuD/JztE3wnxY5BQDLToHUQog4MdQSdT+pFDBmMpAcdgEEWQ==
X-Gm-Gg: AZuq6aIAPT6IX9iLIv+010J+hiY725jJDv9EmoJiYwHiYBEhcq14eSwhHOtNOjNbVBK
	JfR8vOuvcyZXBZ92eEn4v5ZdnupjdjiJQnpGybj0rSxZ0efGHbgRQS53AXezIvKqWHTQ+D8UvcU
	zifSDjlYVrYZ1yyZIpet5Dmuohn7eur09lyDSK+8OPhogeCXEZQzq667BNF5WKTDE0H79znZ1yF
	9+lwR9kcUuE9Jv/WA0rwL6RdWvVyCUX3FlpNWMr5kYTJmVykPHiIicLxPlnW9TFgJNcmiTVmrya
	yhfD3rShFA7QlSwAx5kXOHFByTOhBrHSu8/v61oWODZ8sf+GvHStzmHDuDez0QtGZs/aczw0WV2
	SZ4ZM2CioLTrmU1kv8SSqt3HzrrQp6fwweJvnp6gcQexzvJQZ6hvd7ICDwlB8d3cKhcsnBqOHMe
	Ls5md1pQTO
X-Received: by 2002:a05:600c:c0cd:b0:471:700:f281 with SMTP id 5b1f17b1804b1-482db623765mr141184105e9.25.1770050236402;
        Mon, 02 Feb 2026 08:37:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm451395e9.13.2026.02.02.08.37.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:37:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 2/9] hiawatha: upgrade 11.7 -> 11.8
Date: Mon,  2 Feb 2026 17:37:07 +0100
Message-ID: <20260202163714.2359370-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202163714.2359370-1-skandigraun@gmail.com>
References: <20260202163714.2359370-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 16:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124063

Drop patches that are included in this release.

Changes:
  * mbed TLS updated to 3.6.4.
  * Small bugfixes.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

