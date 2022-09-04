Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACDFC6FA8E
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:24 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.11501.1662276917489879109
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o7bgeDU5;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id t5so5775466pjs.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GeIQCGzyqfInPia3vQxatgV0RAGnVCR30Ujao3tYJv0=;
        b=o7bgeDU5/tHoJIUpuhRB8MBLRCkCQcH8BIabEFM51v97wd0DL5vSM3moAyWu0tIsPi
         3pG2BrGzT/oK+seS/X6EBV2s/O07to6A5bO30wA9R5WuFyTwYdNvAlKtwPpEhhE8vBeZ
         bPqsqkWFHcT7QUdvaXxflwMPTsVF/wsInKgGQOUsf8lDagdwINoTgf9GZvgPn6qtNAqv
         FZBlKla0yJbHenUAChYdf4OY6CQOSzjvtCzMZHoGCsPMEqPwf6My0448qSeE8zBi6tec
         fN7idq/wn9KPniLrXBGSmkEW0QOJm4xzgHJW1RB2Ef1IVb+OzqDfh4n6szi4j3oNdKtZ
         n7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GeIQCGzyqfInPia3vQxatgV0RAGnVCR30Ujao3tYJv0=;
        b=H2/eWY/dRTzWmp9z18HDst6DdmC9p2T5XkbVkhmrXldqRhbN74dyEHjwoeBHEJGByo
         rLni0FSvmt8D5e/Gy6FTKUPD33Rju5+QaM+faWR0lJtGNbIwUbiBbRYlPMWh3ZKVdveR
         r1Bz5htkM7Zh9uqdTHNcZIDe+3WjLJF60MJY/+NdGgKXtM3Vz6Tczq/QuIqNfi6Wpcp2
         8PwJVe4iW/se8UKcQWVSDQODHw7IKVsAxvPtP+L//Re4yKjMLPCedXa/uVzvw2ffozNl
         U8ERw+hMbpXWQK5BWkw8akBdyxf+Embe+u6MknlDQQdUuSOnXhpndDbRUz6mv/QkaEQ9
         NyEA==
X-Gm-Message-State: ACgBeo3cPUV9wCAuHRGi0htx2wxZwfUROOqPa1f9EQISqzhfBjRo62K0
	WnlWEgBADi5wNVMMXJ9QfX6AlW9KMBLC6w==
X-Google-Smtp-Source: 
 AA6agR53V5cNDvmLeKJwsDXYRVpz7N2GVyR7GHXFCkZy7XHxN1r/KSVAdluvLOILELX7GbWfUsmW9A==
X-Received: by 2002:a17:90b:1a87:b0:1fe:46fd:c1e8 with SMTP id
 ng7-20020a17090b1a8700b001fe46fdc1e8mr13227130pjb.140.1662276916629;
        Sun, 04 Sep 2022 00:35:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 55/63] fluentbit: Drop redundant patch
Date: Sun,  4 Sep 2022 00:34:09 -0700
Message-Id: <20220904073417.3251865-55-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98649

Instead of applying one and then reverting it via another patch, its
better to apply SRC_URI:remove on the original patch for x86 (32bit)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-unused-variable-in-mpi_mul_hlp.patch | 42 -------------------
 .../fluentbit/fluentbit_1.9.7.bb              |  2 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch
deleted file mode 100644
index 8a165dc0d2..0000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From af6cefba8c2675f58b75f93785337ab23054568c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 18 Aug 2022 23:35:23 -0700
-Subject: [PATCH] Revert Remove unused variable in mpi_mul_hlp()
-
-This reverts
-https://github.com/Mbed-TLS/mbedtls/commit/e7f14a3090e6595eb3c8d821704ad9c90f6d3712
-
-Which helps in compiling the x86 asm code.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/mbedtls-2.28.0/library/bignum.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/mbedtls-2.28.0/library/bignum.c b/lib/mbedtls-2.28.0/library/bignum.c
-index 9c256ae..62e7f76 100644
---- a/lib/mbedtls-2.28.0/library/bignum.c
-+++ b/lib/mbedtls-2.28.0/library/bignum.c
-@@ -1392,7 +1392,7 @@ void mpi_mul_hlp( size_t i,
-                   mbedtls_mpi_uint *d,
-                   mbedtls_mpi_uint b )
- {
--    mbedtls_mpi_uint c = 0;
-+    mbedtls_mpi_uint c = 0, t = 0;
- 
- #if defined(MULADDC_HUIT)
-     for( ; i >= 8; i -= 8 )
-@@ -1443,6 +1443,8 @@ void mpi_mul_hlp( size_t i,
-     }
- #endif /* MULADDC_HUIT */
- 
-+    t++;
-+
-     while( c != 0 )
-     {
-         *d += c; c = ( *d < c ); d++;
--- 
-2.37.2
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
index a1f879488d..56ba72bf59 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
@@ -22,8 +22,8 @@ SRC_URI = "https://releases.fluentbit.io/1.9/source-${PV}.tar.gz;subdir=fluent-b
            file://0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch \
            file://0005-stackdriver-Fix-return-type-mismatch.patch \
            file://0006-monkey-Fix-TLS-detection-testcase.patch \
-           file://0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch \
            "
+SRC_URI:remove:x86 = "file://0002-mbedtls-Remove-unused-variable.patch"
 SRC_URI:append:libc-musl = "\
            file://0001-Use-posix-strerror_r-with-musl.patch \
            file://0002-chunkio-Link-with-fts-library-with-musl.patch \
-- 
2.37.3


