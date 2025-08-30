Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62670CA1003
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 18:43:27 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.15748.1756579399375456836
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Aug 2025 11:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CzrFtHA5;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-770530175b2so2428619b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579398; x=1757184198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L42UOUDDvIsCSgZwmbXSCqfWATuXut8OKsLhul6TxdI=;
        b=CzrFtHA5fBjtrjk3eM83TrGfp5HQcyAl5O0pZqSc1KSBlIefvyLSo4OUfdDKVrABR6
         zZ+CR8toqxhNZHJ7Rd+eK28Vtjww1hryFev/HCNF9ZmsD28SN3MC965TRnmruPq9NuGx
         YJghm5fNyYy4/VScmRuTXRWOIoCgj1d4WN8pFdKRScC0PyBLMmFdw1mown5xOEnaqX+n
         a38wuTJZWglOOGuF4W8oR76wmr4JErXbMpUK61G4ibPCGu1kmhXIu+ryW4i52YcvIQlc
         VqSNeKU9r4xY5pz4Td89j9XZ2AT26vsEDlQ5yMs+1am+JXEyfrTK5uPOxAbE1gXTE4Cf
         7FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579398; x=1757184198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L42UOUDDvIsCSgZwmbXSCqfWATuXut8OKsLhul6TxdI=;
        b=dUcgLOaYSg1IumSWZywfXfhD85zdwYF4Lf/6E2oA/cs0W4AAiLTmK49Li1ntx14xjG
         L9QnHBPI7PXIiA/9u9gVXgrKJl7Nraj8yG8sWkSlx88JyzmUWNXWtIue6VHbKixoC8xm
         gytjI5RaBNJZEdh95gOoCxCgfbYFahR4931A9MnL58f0T1f+y7b2MWYHN0W5TaE6wFVG
         /Yu3WjAgPWDa90q9goVQb/zqoTmuMuget/meITEk1Nod+tuKj+5Vm66GR0+SjGwvI/uO
         anDPLKLPrN/PVeUjStHNpTrTP7b1hXsAWEFE9xIh3/6+6JsFHDmiZp+p4XXk6IDkeie0
         5fUA==
X-Gm-Message-State: AOJu0Yx/EnBQ/8Y1YGm2IJvuAFEOK0dAqHLB8r+lWkuq8zWZ7pdwoOGS
	GPjM4UM6jkbO9kTK3/iRZDexZu4piAjMDs1y4cTIAXsj4UI0H3toEBc+2ERb52c2
X-Gm-Gg: ASbGncsd3q+30eJi08V4S0mCThu9zKGPA4m9GY6Hms4MkHbRgMoEZr2/AFJNp7ScOfN
	VlxqiXNo+XdWXNq8ZDO9BjRXrd/QK+gCztlcIvO2HEyPuAblWXwrlVMDCjJtoQAkmNUD5eV4B1D
	P0kmvoGYRdXwOopQkA55GmcIVJuFIjET6D/5Zx+7E5ybHOXVm0tPgF1N5GyAaLw+lZkNh0HyZle
	0BAQBaV9D0XrR933a/hKrVneLTSDOVuCV5dJExniZncReaVD3qY15W//L0w51PSBizaPVp8V6cd
	+9ER1Pn+Y2JiRuOHhqe+w05OIInij2bsIK+nwWzhHjboUiCJTvOgDhLEW23bQm+Pse0iPpl9BY4
	kZItZYWNRmouISQo+ZpPdoguyn7yNP6/uXgH9uTBNNjMYJJJJ8lXGIn/moyV/zsBcdCU9FTdWXQ
	q58W/FTpnY6IKiMZCg7SUgmqYYx2YF1l00cHhXoA6iSBppsfL1Hr4=
X-Google-Smtp-Source: AGHT+IFqdWZ3mtGTCEGPqzYk/eBuS8xWpS5N21bRrwv+SK5g8JNeVQwAw2pD2hpzoHRcXi9XoW6N3g==
X-Received: by 2002:a05:6a20:9187:b0:243:78a:826e with SMTP id adf61e73a8af0-243d6f8a456mr4378690637.52.1756579398379;
        Sat, 30 Aug 2025 11:43:18 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d9330b73sm6462091a91.4.2025.08.30.11.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 5/8] hiawatha: Fix bundled mbedtls with clang-21
Date: Sat, 30 Aug 2025 11:43:06 -0700
Message-ID: <20250830184311.1018374-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830184311.1018374-1-raj.khem@gmail.com>
References: <20250830184311.1018374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 18:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119146

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._-nonstring-to-remove-unterminated-s.patch | 43 +++++++++++++++++++
 ...ute__-nonstring-with-macro-MBEDTLS_A.patch | 42 ++++++++++++++++++
 ...BEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch | 33 ++++++++++++++
 .../recipes-httpd/hiawatha/hiawatha_11.7.bb   |  6 ++-
 4 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/files/define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch

diff --git a/meta-webserver/recipes-httpd/hiawatha/files/0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch b/meta-webserver/recipes-httpd/hiawatha/files/0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch
new file mode 100644
index 0000000000..5a9c719b6d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/files/0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch
@@ -0,0 +1,43 @@
+From 56b26ede007453a4ee9832076597e82d2a903700 Mon Sep 17 00:00:00 2001
+From: Felix Conway <felix.conway@arm.com>
+Date: Wed, 11 Jun 2025 16:04:06 +0100
+Subject: [PATCH 1/2] Add __attribute__ ((nonstring)) to remove
+ unterminated-string-initialization warning
+
+Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/pull/10216]
+Signed-off-by: Felix Conway <felix.conway@arm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ library/ssl_tls13_keys.c | 3 ++-
+ library/ssl_tls13_keys.h | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/library/ssl_tls13_keys.c b/library/ssl_tls13_keys.c
+index 739414e..375814c 100644
+--- a/library/ssl_tls13_keys.c
++++ b/library/ssl_tls13_keys.c
+@@ -81,7 +81,8 @@ struct mbedtls_ssl_tls13_labels_struct const mbedtls_ssl_tls13_labels =
+  *            the HkdfLabel structure on success.
+  */
+ 
+-static const char tls13_label_prefix[6] = "tls13 ";
++/* We need to tell the compiler that we meant to leave out the null character. */
++static const char tls13_label_prefix[6] __attribute__ ((nonstring)) = "tls13 ";
+ 
+ #define SSL_TLS1_3_KEY_SCHEDULE_HKDF_LABEL_LEN(label_len, context_len) \
+     (2                     /* expansion length           */ \
+diff --git a/library/ssl_tls13_keys.h b/library/ssl_tls13_keys.h
+index d3a4c6c..95cde7a 100644
+--- a/library/ssl_tls13_keys.h
++++ b/library/ssl_tls13_keys.h
+@@ -40,8 +40,9 @@
+ 
+ #if defined(MBEDTLS_SSL_PROTO_TLS1_3)
+ 
++/* We need to tell the compiler that we meant to leave out the null character. */
+ #define MBEDTLS_SSL_TLS1_3_LABEL(name, string)       \
+-    const unsigned char name    [sizeof(string) - 1];
++    const unsigned char name    [sizeof(string) - 1] __attribute__ ((nonstring));
+ 
+ union mbedtls_ssl_tls13_labels_union {
+     MBEDTLS_SSL_TLS1_3_LABEL_LIST
diff --git a/meta-webserver/recipes-httpd/hiawatha/files/0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch b/meta-webserver/recipes-httpd/hiawatha/files/0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch
new file mode 100644
index 0000000000..2f94cee277
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/files/0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch
@@ -0,0 +1,42 @@
+From 91ec670d3f6399510995dedbf99dca2e7e9bd2d8 Mon Sep 17 00:00:00 2001
+From: Felix Conway <felix.conway@arm.com>
+Date: Thu, 12 Jun 2025 11:28:56 +0100
+Subject: [PATCH 2/2] Replace __attribute__((nonstring)) with macro
+ MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING
+
+This macro applies __attribute__((nonstring)) when using a compiler that supports it
+
+Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/pull/10216]
+Signed-off-by: Felix Conway <felix.conway@arm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ library/ssl_tls13_keys.c | 2 +-
+ library/ssl_tls13_keys.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/library/ssl_tls13_keys.c b/library/ssl_tls13_keys.c
+index 375814c..621a7d5 100644
+--- a/library/ssl_tls13_keys.c
++++ b/library/ssl_tls13_keys.c
+@@ -82,7 +82,7 @@ struct mbedtls_ssl_tls13_labels_struct const mbedtls_ssl_tls13_labels =
+  */
+ 
+ /* We need to tell the compiler that we meant to leave out the null character. */
+-static const char tls13_label_prefix[6] __attribute__ ((nonstring)) = "tls13 ";
++static const char tls13_label_prefix[6] MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING = "tls13 ";
+ 
+ #define SSL_TLS1_3_KEY_SCHEDULE_HKDF_LABEL_LEN(label_len, context_len) \
+     (2                     /* expansion length           */ \
+diff --git a/library/ssl_tls13_keys.h b/library/ssl_tls13_keys.h
+index 95cde7a..3aa94d7 100644
+--- a/library/ssl_tls13_keys.h
++++ b/library/ssl_tls13_keys.h
+@@ -42,7 +42,7 @@
+ 
+ /* We need to tell the compiler that we meant to leave out the null character. */
+ #define MBEDTLS_SSL_TLS1_3_LABEL(name, string)       \
+-    const unsigned char name    [sizeof(string) - 1] __attribute__ ((nonstring));
++    const unsigned char name    [sizeof(string) - 1] MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING;
+ 
+ union mbedtls_ssl_tls13_labels_union {
+     MBEDTLS_SSL_TLS1_3_LABEL_LIST
diff --git a/meta-webserver/recipes-httpd/hiawatha/files/define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch b/meta-webserver/recipes-httpd/hiawatha/files/define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch
new file mode 100644
index 0000000000..6e2d9eb5f1
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/files/define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch
@@ -0,0 +1,33 @@
+Replace __attribute__((nonstring)) with macro MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING
+This macro applies __attribute__((nonstring)) when using a compiler that supports it
+
+Upstream-Status: Backport [https://github.com/Mbed-TLS/TF-PSA-Crypto/commit/996f4fa3a2fbe8792ed3efd1bcb3657001f35ae1]
+
+Signed-off-by: Felix Conway <felix.conway@arm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/library/ssl_tls13_keys.h
++++ b/library/ssl_tls13_keys.h
+@@ -7,6 +7,22 @@
+ #if !defined(MBEDTLS_SSL_TLS1_3_KEYS_H)
+ #define MBEDTLS_SSL_TLS1_3_KEYS_H
+ 
++/* GCC >= 15 has a warning 'unterminated-string-initialization' which complains if you initialize
++ * a string into an array without space for a terminating NULL character. In some places in the
++ * codebase this behaviour is intended, so we add the macro MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING
++ * to suppress the warning in these places.
++ */
++#if defined(__has_attribute)
++#if __has_attribute(nonstring)
++#define MBEDTLS_HAS_ATTRIBUTE_NONSTRING
++#endif /* __has_attribute(nonstring) */
++#endif /* __has_attribute */
++#if defined(MBEDTLS_HAS_ATTRIBUTE_NONSTRING)
++#define MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING __attribute__((nonstring))
++#else
++#define MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING
++#endif /* MBEDTLS_HAS_ATTRIBUTE_NONSTRING */
++
+ /* This requires MBEDTLS_SSL_TLS1_3_LABEL( idx, name, string ) to be defined at
+  * the point of use. See e.g. the definition of mbedtls_ssl_tls13_labels_union
+  * below. */
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
index fac1498b3b..4e7e5fa31d 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
@@ -7,8 +7,12 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 SECTION = "net"
 
 SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-${PV}.tar.gz \
+           file://0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch;patchdir=mbedtls \
+           file://0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch;patchdir=mbedtls \
+           file://define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch;patchdir=mbedtls \
            file://hiawatha-init \
-           file://hiawatha.service "
+           file://hiawatha.service \
+          "
 
 SRC_URI[sha256sum] = "8bc180ae3b986d02466f081efeefdb1595d96783f581fded2a9b198752ab7ae1"
 

