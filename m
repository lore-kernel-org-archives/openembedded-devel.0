Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.1630.1597283636990955617
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 18:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oIKjzNcV;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id u20so2009531pfn.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 18:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omTBXThIxa8DMaEc8b+iC7uuLlNJJXVgBhom1C9JdTI=;
        b=oIKjzNcV7Gz/HC2UnutesCZBf2OOGcr3DLPs4flvISINVPCTwy2cobu0kBX68cfc8A
         X0aZfby7BcMtQVmdoQNVbt21PGyDr7crPUJ31wJjm0Hu9jCEakXa2fC8JIyge6SDeacT
         YDGb0x2LTSiM8euRuNC80i3rD+e5+CX9K+J7GaWo7jenjXAE2UawK1BSczRmsYCD8NuK
         /SQ3XyKjCm+5H2utFbxdu0rQXV5MdyvRTtTrHerqvmMBNoGOn68WOxPCbNFiWja9YKT9
         1aQYCGL3uX0y7rLv/e4b5XC7rxMrkoLnb9UvdqdIQVOc2WaLEeV4bAUMZgCFqNr/tZ93
         w/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omTBXThIxa8DMaEc8b+iC7uuLlNJJXVgBhom1C9JdTI=;
        b=hyx3TK69lSV9Pdzq6hW/jxGNA7Q7rcjOdQqy4vbiPT/rDNqUVxM1Xqa4LRZC7M1Otx
         dD23SZzHVH/2KaDNqWFLUVpmPFntXN7VaBA94w4JYCd/+Bnww5Mp8O5yJZjug0LszEa4
         O/fZiuufGhe1OohojhqmmeKPqiuOgVN1QAKUylSJ3jC2nj0w8kW1fDUUWuPNjuSQmsL3
         vQ8wwxJu85sqovJeJkKcALtq+C1hlfiFLKm2WIqLkSPdRaledczhH5H2vvUlY/dfu8Fl
         Zz0CSyZURkl8pzIyBAs1kTZYDZZ2cjObDWDh3kJZH5TTLGsJBNBpMVQq9NO0ySk1Fks0
         qC0Q==
X-Gm-Message-State: AOAM533w7jU9RTdnVbFe4VEYLEIAGCaLrJtgGJN9Mjyft0W55AKmDYR9
	TjKLAd03j4We8sTUxIYElx4JCvLVMho=
X-Google-Smtp-Source: ABdhPJzhn75QXyi/7S73FsJCI+R/EM2VmJ7AfadrTb5uxvhQh9eAbeDS2hhoSopaxlTcA4ApNWrheA==
X-Received: by 2002:a63:3d02:: with SMTP id k2mr1553230pga.302.1597283636051;
        Wed, 12 Aug 2020 18:53:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id o4sm3453578pjs.51.2020.08.12.18.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 18:53:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/4] mimic: Upgrade to 1.3.0.1
Date: Wed, 12 Aug 2020 18:53:50 -0700
Message-Id: <20200813015352.2318764-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813015352.2318764-1-raj.khem@gmail.com>
References: <20200813015352.2318764-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to fix build with -fno-common
Backport a patch to fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mimic/0001-Fix-musl-compatibility.patch   | 30 +++++++++++++++++++
 ...ake-cst_rx_not_indic-as-extern-decla.patch | 29 ++++++++++++++++++
 .../{mimic_1.2.0.2.bb => mimic_1.3.0.1.bb}    | 11 ++++---
 3 files changed, 66 insertions(+), 4 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/mimic/mimic/0001-Fix-musl-compatibility.patch
 create mode 100644 meta-multimedia/recipes-multimedia/mimic/mimic/0001-cmu_indic_lang-Make-cst_rx_not_indic-as-extern-decla.patch
 rename meta-multimedia/recipes-multimedia/mimic/{mimic_1.2.0.2.bb => mimic_1.3.0.1.bb} (67%)

diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic/0001-Fix-musl-compatibility.patch b/meta-multimedia/recipes-multimedia/mimic/mimic/0001-Fix-musl-compatibility.patch
new file mode 100644
index 0000000000..1352fdde64
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic/0001-Fix-musl-compatibility.patch
@@ -0,0 +1,30 @@
+From d7d00ec681dc430192cf2192b3de7b7c30c4753d Mon Sep 17 00:00:00 2001
+From: Bart Ribbers <bribbers@disroot.org>
+Date: Sat, 9 May 2020 11:42:32 +0200
+Subject: [PATCH] Fix musl compatibility
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/MycroftAI/mimic1/commit/5282ff075091c3d1a635fb20f2b8a35a377f4b42.patch]
+---
+ src/hts/hts_engine_API/lib/HTS_misc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/hts/hts_engine_API/lib/HTS_misc.c b/src/hts/hts_engine_API/lib/HTS_misc.c
+index 72306cb..afcaaec 100644
+--- a/src/hts/hts_engine_API/lib/HTS_misc.c
++++ b/src/hts/hts_engine_API/lib/HTS_misc.c
+@@ -247,8 +247,10 @@ size_t HTS_ftell(HTS_File * fp)
+       fgetpos((FILE *) fp->pointer, &pos);
+ #if defined(_WIN32) || defined(__CYGWIN__) || defined(__APPLE__) || defined(__ANDROID__)
+       return (size_t) pos;
+-#else
++#elif defined(__GLIBC__)
+       return (size_t) pos.__pos;
++#else
++      return (size_t) ftell(fp->pointer);
+ #endif                          /* _WIN32 || __CYGWIN__ || __APPLE__ || __ANDROID__ */
+    } else if (fp->type == HTS_DATA) {
+       HTS_Data *d = (HTS_Data *) fp->pointer;
+-- 
+2.28.0
+
diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic/0001-cmu_indic_lang-Make-cst_rx_not_indic-as-extern-decla.patch b/meta-multimedia/recipes-multimedia/mimic/mimic/0001-cmu_indic_lang-Make-cst_rx_not_indic-as-extern-decla.patch
new file mode 100644
index 0000000000..e6bf9eb2be
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic/0001-cmu_indic_lang-Make-cst_rx_not_indic-as-extern-decla.patch
@@ -0,0 +1,29 @@
+From 7d38a72f9ae14a2416f7a78e28152aa33685aec7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 16:47:27 -0700
+Subject: [PATCH] cmu_indic_lang: Make cst_rx_not_indic as extern declaration
+
+Fixes build with gcc-10 which has -fno-common turned on by default
+
+Upstream-Status: Submitted [https://github.com/MycroftAI/mimic1/pull/211]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lang/cmu_indic_lang/cmu_indic_lang.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lang/cmu_indic_lang/cmu_indic_lang.h b/lang/cmu_indic_lang/cmu_indic_lang.h
+index 75ee46c..83e2afa 100644
+--- a/lang/cmu_indic_lang/cmu_indic_lang.h
++++ b/lang/cmu_indic_lang/cmu_indic_lang.h
+@@ -51,7 +51,7 @@ void cmu_indic_lang_init(cst_voice *v);
+ extern const cst_phoneset cmu_indic_phoneset;
+ extern const cst_cart cmu_indic_phrasing_cart; 
+ 
+-const cst_regex * const cst_rx_not_indic;
++extern const cst_regex * const cst_rx_not_indic;
+ 
+ #ifdef __cplusplus
+ } /* extern "C" */
+-- 
+2.28.0
+
diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
similarity index 67%
rename from meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
rename to meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index b313b110cc..0cac2bea53 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -15,12 +15,15 @@ LICENSE = "MIT-X & \
            BellBird & \
            Apache-2.0 \
            "
-LIC_FILES_CHKSUM = "file://COPYING;md5=416ef1ca5167707fe381d7be33664a33"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a2c2c7371b58b9cdeae0dc68846fe9f1"
 
-DEPENDS = "curl-native icu"
+DEPENDS = "curl-native libpcre2"
 
-SRCREV = "67e43bf0fa56008276b878ec3790aa5f32eb2a16"
-SRC_URI = "git://github.com/MycroftAI/mimic.git"
+SRCREV = "adf655da0399530ac1b586590257847eb61be232"
+SRC_URI = "git://github.com/MycroftAI/mimic1.git \
+           file://0001-Fix-musl-compatibility.patch \
+           file://0001-cmu_indic_lang-Make-cst_rx_not_indic-as-extern-decla.patch \
+          "
 
 inherit autotools
 
-- 
2.28.0

