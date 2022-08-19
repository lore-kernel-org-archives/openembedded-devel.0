Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B92C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 06:41:08 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.248.1660891258413970825
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 23:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VV7Q2odP;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so3983118pjf.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 23:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=H2VSXbA98M8FOB7BQDfV2MoPooHhzTbd9lgaBhJP7zk=;
        b=VV7Q2odP4bSjhj6BpJAh60mIM4Vc3O1Y0sFd4cMmHGRYi3btD9q3AHZANqzV9Ho6kh
         6ULZvPBL8N0AWT0lxLRJEACJMM68tus0tR+6+Vz7aAX7SLw3b8Ao1y9WD3KIzdSNxAms
         zIEy4cSFhGv0R2WeEecDyT9QXZTHI8z2K86JEbq2BZl3E2OgbHRxaRR10JL70ELpxMzE
         5kljkKAGAnA++Y/mr/Ez8qRBoM2RRS+gc55z4d2UFlQ1MWoz2R3oNLVO0JT/ts593dFq
         SJ1u0wVthTCGfTXOex6RNT6iujL8QfgCT3shi+hRaf/1XWG5F1EX9qnU2n3bOtOVNeJZ
         Hxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=H2VSXbA98M8FOB7BQDfV2MoPooHhzTbd9lgaBhJP7zk=;
        b=buIBWCfVfx/O2ggOLnKpx1KnzLtG/N01BabZ7rXvVfrUvF2JlYFvA8+SeZ0pQZmUlq
         hNkMXVObYONAr+TSs+mz2iRIBYWiSfpQh/QjLap06jrqzh1nNL3gT2aj+fVlFFOxb4QF
         7Zx+M549hhG3P3NHUNUG3fmFnzAf1r8qeAPuE2ezzZcocVQNNsQ2/sM0lLJ7cccVSFEm
         EWpdmdWCDJvhb1g7XYyg6HT7zxgI5xeoANxt0XfS+iu3Apb26+MjApthO3e+990+RxQH
         xMPlBX8xh5mpTTuTeT+sq3oLcnktT1iftzfkC+Fe/aYsHIunMVyPwstWhb90CT0yvRc7
         /Q8g==
X-Gm-Message-State: ACgBeo1Wre9Z3dP+3m2/hbuzmuvRj3ZqjkUhpknBaMnMO0SpPFqPw8J/
	rszDH1inQBqwJAf3j7Ux+vuWk6du3/KM+g==
X-Google-Smtp-Source: 
 AA6agR5Qyeirg1Z5KzQHc9AsVprIwHqU6hpAatamFEkzMoyDX6hmsmn7tVsbOhMitGxJtRXOq33uNw==
X-Received: by 2002:a17:902:ef96:b0:172:abb9:657e with SMTP id
 iz22-20020a170902ef9600b00172abb9657emr5954993plb.48.1660891257472;
        Thu, 18 Aug 2022 23:40:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 j125-20020a625583000000b00535fd3290f0sm1111857pfb.113.2022.08.18.23.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 23:40:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] fluentbit: Upgrade to 1.9.7 and fix build on x86
Date: Thu, 18 Aug 2022 23:40:54 -0700
Message-Id: <20220819064054.1471627-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819064054.1471627-1-raj.khem@gmail.com>
References: <20220819064054.1471627-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 06:41:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98323

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-unused-variable-in-mpi_mul_hlp.patch | 42 +++++++++++++++++++
 ...{fluentbit_1.9.6.bb => fluentbit_1.9.7.bb} |  7 +++-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_1.9.6.bb => fluentbit_1.9.7.bb} (92%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch
new file mode 100644
index 0000000000..8a165dc0d2
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch
@@ -0,0 +1,42 @@
+From af6cefba8c2675f58b75f93785337ab23054568c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 18 Aug 2022 23:35:23 -0700
+Subject: [PATCH] Revert Remove unused variable in mpi_mul_hlp()
+
+This reverts
+https://github.com/Mbed-TLS/mbedtls/commit/e7f14a3090e6595eb3c8d821704ad9c90f6d3712
+
+Which helps in compiling the x86 asm code.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/mbedtls-2.28.0/library/bignum.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/mbedtls-2.28.0/library/bignum.c b/lib/mbedtls-2.28.0/library/bignum.c
+index 9c256ae..62e7f76 100644
+--- a/lib/mbedtls-2.28.0/library/bignum.c
++++ b/lib/mbedtls-2.28.0/library/bignum.c
+@@ -1392,7 +1392,7 @@ void mpi_mul_hlp( size_t i,
+                   mbedtls_mpi_uint *d,
+                   mbedtls_mpi_uint b )
+ {
+-    mbedtls_mpi_uint c = 0;
++    mbedtls_mpi_uint c = 0, t = 0;
+ 
+ #if defined(MULADDC_HUIT)
+     for( ; i >= 8; i -= 8 )
+@@ -1443,6 +1443,8 @@ void mpi_mul_hlp( size_t i,
+     }
+ #endif /* MULADDC_HUIT */
+ 
++    t++;
++
+     while( c != 0 )
+     {
+         *d += c; c = ( *d < c ); d++;
+-- 
+2.37.2
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
similarity index 92%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
index a801694f42..a1f879488d 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
@@ -22,13 +22,13 @@ SRC_URI = "https://releases.fluentbit.io/1.9/source-${PV}.tar.gz;subdir=fluent-b
            file://0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch \
            file://0005-stackdriver-Fix-return-type-mismatch.patch \
            file://0006-monkey-Fix-TLS-detection-testcase.patch \
+           file://0001-Revert-Remove-unused-variable-in-mpi_mul_hlp.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Use-posix-strerror_r-with-musl.patch \
            file://0002-chunkio-Link-with-fts-library-with-musl.patch \
            "
-SRC_URI[sha256sum] = "5ef7dd97e10936269fe5f4e5d3ebf16559333066f7d6757ba12464a9d6186570"
-
+SRC_URI[sha256sum] = "8ca2ac081d7eee717483c06608adcb5e3d5373e182ad87dba21a23f8278c6540"
 S = "${WORKDIR}/fluent-bit-${PV}"
 
 DEPENDS = "zlib bison-native flex-native openssl"
@@ -78,6 +78,9 @@ EXTRA_OECMAKE:append:libc-musl = ' -DFLB_JEMALLOC_OPTIONS="--with-jemalloc-prefi
 EXTRA_OECMAKE:append:riscv64 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 EXTRA_OECMAKE:append:riscv32 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 EXTRA_OECMAKE:append:mips = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
+EXTRA_OECMAKE:append:x86 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
+
+CFLAGS:append:x86 = " -DMBEDTLS_HAVE_SSE2"
 
 inherit cmake systemd pkgconfig
 
-- 
2.37.2


