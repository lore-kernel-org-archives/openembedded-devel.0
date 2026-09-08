Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6915C79FAA
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 17:14:08 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.521.1788887641802813768
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 10:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UAow8MUh;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so3275464a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 10:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887641; x=1789492441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GttS1ku4kBhXntFbw4DROiEWrlf7vXBgsu1LnEO07E=;
        b=UAow8MUh1AoOPKMF9xkdjC7egRwVvst/HdMpEL1ipFGr+TXOyORPlKfgoXmjs9ujGh
         Pc52HnswpQNX4tlp4o5ntoJL+FcCGhyWO2NqCDuWqQWvjQrS/cUMSH5+l7QwBpAKvVTD
         S4FhE6WmkeAgSFWwucPgeiNgHXsNWMUrwjumFGRruej7rWd6mmxrFxIIKriF82IngmUP
         yBbGH9tbzT0rqaZVJsnc7KNx4EwOFCiNZKtsQ64adrDzLpcbgmgz0tIvobBl/ErdI00C
         vYcgmfxot0ASOwPxwogphO0aQiqYyWFR+U4eft/EV6E1h1U5e51LLlx/3VDbd5xMtTbv
         2vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887641; x=1789492441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GttS1ku4kBhXntFbw4DROiEWrlf7vXBgsu1LnEO07E=;
        b=an2dT5BZjN2EyvDHSIw/aUJLmeLbc0azS+wc/GrPymcCGCPb4Y9OLhG/a9isVf6+ws
         i/7m5ETOPuPpmJCkzbf73Ak1WV34u5XSiD/PiKgR+lA3UQRZJquYD2GI5BWVRS6xpQA+
         QYlTzNzRFgEQivQ9dGf+A6ttFfNnKMFGnhGGcyICRUoK8rJCwoCcxwaPUKBtIJig9IM7
         Vy2+vr7tMcr7+eTSjeoewt0i9raEeFQkXOzpTD4PNmKXE6D9IB63hGuzTL1XxTH+ZEa/
         MN08qmAOtRGjvRL6ZuMBApOdLYvhgYomDI1ypbAOpoh1/adLfX/d3QIajnG9+gitViEA
         buSw==
X-Gm-Message-State: AFuF++k7Jlrrr75o2yYxSxzY5ikmTV5BZYcODI3+jjfG5CLf4a/ZioPO
	FVxx2S2qshTvDj8gG2MseqqTR4PaIu/Kc0qaUErXxfYMQdd6eUSkUNeUzLJ4Pg==
X-Gm-Gg: AYBFou3Q4i0vbsrVE/hxFyZrul8K4Ydzkd2rWesZ+yuDIPfnYKO4aQnqP/EvOsxDVa4
	VUUAwuhpyzFejp4EAG4q+hzIIbrs64RuGRaHFyyT9I1r5diPZE05RhezKDrrdYDKxYpXS226lb1
	KTAHbMD56RMsAR7GN6kPhrc+V+C3SWFs5ofxOyV78WMN0puMLHljrOGbUnw9IcZmZdERuaSmL9m
	c1wedKlDm+uM8f4J6JX1MaO9HLt2wKmqUfOQgvmOyfdZjTBYtlARj2aPStyQGXHPRGb/44NFEcU
	kTpqvazqHFZKNjnaxn3u/8IMRTn76Pcspb85Dne2PSnQdK/WvgYOmItHHY5hhak9dBxqr/mOgsP
	wRd2FCteBEnDdC8STFzgbYCu7ISWcLFW7QoAgdF11HxajTYfCC6RvMLwDECGgkt19FM/5bcZiIj
	ytaR6ny1qwrJ/VmIvc/QCNrw4UXbdsPdOLq03mypDkCfmcNpQrcP5+GPlzy3C7BP/JI98lKHsat
	DN7gMJGHSKLvgCWmOan5hUyF1K0NrrP/uAooGhrq1EqqmEhyguS7vBka0PTNImy3FqBXtxP/69R
	CigBzgWTdo5a+pM1SnhTu6RNYzJhSYnSVyBXuZ3xM328njfUAglrEKuQU2qwHFWE8Jo0rE4AAIB
	++kQKRQyGslmq0OsJUm/5J7aQ5liUyh7B1Gr/rBK4Xr3WNSmZ90xs4h52
X-Received: by 2002:a17:90b:2c87:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-39b26191cf2mr44668865a91.9.1788887641013;
        Tue, 08 Sep 2026 10:14:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm39566297c88.12.2026.09.08.10.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:14:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/6] microsoft-gsl: upgrade 4.2.2 -> 5.0.0
Date: Tue,  8 Sep 2026 10:13:51 -0700
Message-ID: <20260908171353.701307-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
References: <20260908171353.701307-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 17:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129869

Release notes:
https://github.com/microsoft/GSL/releases/tag/v5.0.0

Switch to the rel/5.0 branch. New in this release is the gsl::dyn_array
container, so the -dev package gains include/gsl/dyn_array.

Fix the build with clang 22. The tests are compiled with -Weverything
-Werror, so every new clang diagnostic becomes a build failure; the newly
added lifetime-safety suggestions produce:

  notnull_tests.cpp:63:19: error: parameter in intra-TU constructor should
    be marked [[clang::lifetimebound]]
    [-Werror,-Wlifetime-safety-intra-tu-constructor-suggestions]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../microsoft-gsl/microsoft-gsl/run-ptest     | 14 +++++++++++--
 ...ft-gsl_4.2.2.bb => microsoft-gsl_5.0.0.bb} | 20 +++++++++++--------
 2 files changed, 24 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_4.2.2.bb => microsoft-gsl_5.0.0.bb} (75%)

diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
index 2d5bdf4ff2..c6ce411029 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
@@ -1,4 +1,14 @@
 #!/bin/sh
 
-gsl_tests && echo "PASS: gsl_tests" || echo "FAIL: gsl_tests"
-gsl_noexcept_tests && echo "PASS: gsl_noexcept_tests" || echo "FAIL: gsl_noexcept_tests"
+# Upstream builds one executable per tests/*.cpp source, so iterate rather
+# than naming them individually.
+cd "$(dirname "$0")" || exit 1
+
+for t in *_tests; do
+    [ -x "./$t" ] || continue
+    if "./$t"; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.2.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_5.0.0.bb
similarity index 75%
rename from meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.2.bb
rename to meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_5.0.0.bb
index 3d795878b2..1521ed1111 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.2.bb
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_5.0.0.bb
@@ -8,10 +8,10 @@ HOMEPAGE = "https://github.com/microsoft/GSL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=363055e71e77071107ba2bb9a54bd9a7"
 
-SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=rel/4.2;tag=v${PV} \
+SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=rel/5.0;tag=v${PV} \
            file://run-ptest \
            "
-SRCREV = "152d6eb989a1ecd23fe9c9cfb2fb8cfc7c0cd0c1"
+SRCREV = "417ef685eafd626db765f0027b7fc5a0057e0770"
 
 inherit cmake pkgconfig ptest
 
@@ -24,18 +24,22 @@ PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest','', d)}"
 PACKAGECONFIG[ptest] = "-DGSL_TEST=ON,-DGSL_TEST=OFF,googletest"
 
 # clang disagrees with https://github.com/google/googletest/pull/3457
-CXXFLAGS:append:toolchain-clang = " -Wno-error=switch-default"
+# The tests are built with -Weverything -Werror, so each clang release turns
+# its new diagnostics into build failures.
+CXXFLAGS:append:toolchain-clang = "\
+    -Wno-error=switch-default \
+    -Wno-unknown-warning-option \
+    -Wno-error=lifetime-safety-intra-tu-suggestions \
+    -Wno-error=lifetime-safety-intra-tu-constructor-suggestions \
+"
 # Disable disabled-macro-expansion warning as error as its seen on musl
 CXXFLAGS:append:toolchain-clang:libc-musl = " -Wno-error=disabled-macro-expansion"
 
 do_install_ptest() {
-    install -d ${D}${bindir}
-    install -m 0755 ${B}/tests/gsl_tests ${D}${bindir}
-    install -m 0755 ${B}/tests/gsl_noexcept_tests ${D}${bindir}
+    install -d ${D}${PTEST_PATH}
+    install -m 0755 ${B}/tests/*_tests ${D}${PTEST_PATH}
 }
 
-FILES:${PN}-ptest = "${bindir}/gsl*_tests"
-
 # there is already other gsl recipe, so recipe name does not match the real component name
 CVE_PRODUCT = "microsoft:gsl"
 

