Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6836.1794458679284660239
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y7xC8tkj;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso241294b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458679; x=1795063479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOP29ozpki2ZcLEcdAReRlCMfqJh2G7tO+pqYnkedD4=;
        b=Y7xC8tkjeNfIjHEDGTYKZAlJh8POElxV8XVc8S8GL4/k7dz6+nmIzUseFcIIGV4NuZ
         p7I9/iYvKF0FSBzd3UfjYfZDiT2jN25RqfE06jmZ9Uiw5fxddlYhgf+IWQTlR6ijzxwH
         AVnck0Rk3/QknZ1VoMM75ZYo9Vm08zVsaWLGllaIE2U8UfimJUKvx1Jd6M0V5RAMH8Dt
         D+ERoxbdlH2v2vo7hFF6L2qkouX13wGvUlAJ9QgqYPnxuKyxEdKatmPgiFSJZrEuC2OE
         Px0TzdcEQDZjKtgx5N3oUSOsBRqdSnK6YY/qugL0fEdxXGAROZHGO86RpTn8BR6DlQSI
         IJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458679; x=1795063479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOP29ozpki2ZcLEcdAReRlCMfqJh2G7tO+pqYnkedD4=;
        b=B2+ruz268WDJHfVYbtMNEIZ5KAtGSWc/KRBWwImafEqCaSH2Ip7BcGyqdu2dkNcaaD
         AzyqXNm8dMU5IGcKTLbJAm4+q6IHZoPG3aPP1VlDWnz4xp0UfZUD7j8yH9y3UG1wD8eN
         0HBNMYJr3hdBegZenDNRIFEXD6Hf2OHzm0FYqCP1OzDjw93ZGZqu/pXyQSgEy2lPwanZ
         GRxkN/jF9kqwNNZi1I/EB+Y6STeHta1dhBFkGiAYhec+Lu/U5fpqYSa5svLYfbgtrYsH
         PDnJTlGZhZ52PlFzglhcqd85959nw0TVD18uGALQ6maccgVVRaUbRqBi73uKXgNcxGyo
         Rk+w==
X-Gm-Message-State: APuU4Z+h+Kr9Haex/B3KOlL+WEtEvcA3bCPrnshu+QGMckCKvmf591Zo
	vTWNd544EWDPZ3hVSbg/h5NiNRLJjnoOi6+xEvt4YhXecMco9izYaHdJ2L8LLw==
X-Gm-Gg: AYBFou2SUs6wwalH1Tuy70Lg7UWHFuDL3Dl5Vv7bD767dSFpAviLh7cJtB5FaoThygK
	y30mOLLe8idG8DRt9tqGnPePTHJ7aemFV/QuoBRxj37HwRLRR0p89a3XXUMgzSFZcx4SuM46zpK
	r1RVHw56aKB3ykTFGkL60t0apoxjGOsJg17/mlVXUEsw9DgmBO/bbgutnG5HDjp+YG6U9EkdzpA
	72CEfZDFu/lYHQ1oq7XLDuUcK+UF6afy4sYXvxjnPHl9JpR7rsZ0niUXzZXpkVq+fVUANCkjQux
	Mr9ALJvFvczhG9/CsRvXEgp8nA0ch5/vWXmUtR5CNd8oBg/XLzcjT6X0inkf6KEpLZL3m3H/6SP
	DAZSCdgJRf1CuxdqOwkmK1erokIVHSL5UcVlJfQLHnTpWWRzaD+GY/YPXHtWSwNtHWLgM0Hy+7k
	wHsmFn1nGNehLOF+Uyu1HCBj89CbgdLnMYUdHDGh9vOhvshKVq/631dM72+GLZk+zp6Npwa7JTo
	npYDDb1ags5uf/aNCMB3wKJxokW0jvc5RYqPsKDfgQqjjQrPOqR/r3OqPYqTY8U6XzUvGjLZ2nE
	7Qwx2sDoMxxYbDN2295stL8NxiOedlouCzmnkYxTfyr9LGJ9eHhtLdEtJD2VSg==
X-Received: by 2002:a05:6a21:8201:b0:3e2:3de2:5937 with SMTP id adf61e73a8af0-3f63514fe97mr1195617637.44.1794458678459;
        Wed, 11 Nov 2026 20:44:38 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:44:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 2/16] apitrace: patch CVE-2026-126050
Date: Thu, 12 Nov 2026 17:44:12 +1300
Message-ID: <20261112044426.3933391-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132153
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-126050

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../apitrace/apitrace/CVE-2026-126050.patch   | 39 +++++++++++++++++++
 .../apitrace/apitrace_14.0.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/CVE-2026-126050.patch

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/CVE-2026-126050.patch b/meta-oe/recipes-devtools/apitrace/apitrace/CVE-2026-126050.patch
new file mode 100644
index 0000000000..4b0d3b2768
--- /dev/null
+++ b/meta-oe/recipes-devtools/apitrace/apitrace/CVE-2026-126050.patch
@@ -0,0 +1,39 @@
+From a7c7db06b56f22235eeea2da608ef84dd401f3b6 Mon Sep 17 00:00:00 2001
+From: Deus Rex research team <research@deusrex.ai>
+Date: Tue, 10 Nov 2026 13:05:32 +0000
+Subject: [PATCH] trace: Fix heap out-of-bounds write in
+ SnappyFile::flushReadCache().
+
+The Snappy trace reader takes each chunk's compressed length from a
+4-byte field in the file and reads that many bytes into
+m_compressedCache, a heap buffer allocated once with a fixed size of
+snappy::MaxCompressedLength(1 MiB) = 1223370 bytes.  The length is never
+compared with that size, so a .trace file that declares and supplies a
+longer chunk makes the read write past the end of the buffer.
+
+(cherry picked from commit 3890c5a448addfd75ccbe1bd09e3075de6fb3395)
+CVE: CVE-2026-126050.patch
+Upstream-Status: Backport [https://github.com/apitrace/apitrace/commit/3890c5a448addfd75ccbe1bd09e3075de6fb3395]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/trace/trace_file_snappy.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/lib/trace/trace_file_snappy.cpp b/lib/trace/trace_file_snappy.cpp
+index 5b60ec9d..9b0a681d 100644
+--- a/lib/trace/trace_file_snappy.cpp
++++ b/lib/trace/trace_file_snappy.cpp
+@@ -224,6 +224,13 @@ void SnappyFile::flushReadCache(size_t skipLength)
+         return;
+     }
+ 
++    if (compressedLength > snappy::MaxCompressedLength(SNAPPY_CHUNK_SIZE)) {
++        std::cerr << "error: invalid compressed chunk length in trace\n";
++        m_stream.setstate(std::ios_base::failbit);
++        createCache(0);
++        return;
++    }
++
+     m_stream.read((char*)m_compressedCache, compressedLength);
+     if (m_stream.fail()) {
+         std::cerr << "warning: unexpected end of file while reading trace\n";
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
index cb5ee92e04..7c51f45842 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
 SRCREV = "18cfd388ac47a9e00978b34d6c20341f3e2cdb56"
 SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=${PV} \
            file://0001-zstd-disable-the-x86-64-BMI2-assembly-fast-loops.patch \
+           file://CVE-2026-126050.patch \
            "
 
 DEPENDS += "zlib libpng python3-native"
