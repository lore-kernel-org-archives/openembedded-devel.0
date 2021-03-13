Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.3152.1615664225181495046
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 11:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g1yTtUu0;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id gb6so6799732pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 11:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GssiFZC6RivbxPXGUdu/WpmtOKRMLASA9BZ5CkATJA=;
        b=g1yTtUu0aOVlaC76OAf+ukl5ISH0pPA/8sqN7mclxMmUbrTZMdRWHeQNU2gpby5U0Q
         W/nyPF2tR17ojAxxGZ1NeQEC0cyjpdpURABfV05KvokMJifyAHh3z4ysRi27xoJy+gxV
         KNzXpH3sokNEAUfQn/L+Y/MFtWl4+Q+TCiZgB+J9ZcPh96gtV8cI/S3qTOKD0qF/r0ih
         NVFYh5nZcIxBO2lwaL771q7yMP6rUEwfhfS4RBAITaMcn+bQDynoz0NaR7uYZd83Jmeb
         68DJslwqoxIJ9T5WbJxkHpbDI2/WfOlDIcnNfyyMKQ2P2q8DE/XlXIID2DprcWLWvf1U
         BtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GssiFZC6RivbxPXGUdu/WpmtOKRMLASA9BZ5CkATJA=;
        b=f3fVFoDpUqC+pzl5bbqXMvUoRP3lXdUkz4k8dbCgwVhpbo0aEHrGfwj+NFcQuuTrvs
         zMwzK0Wy/PVBXVCLp4YlJAKnByHsLmMaJT6LGPOqi3EB7fkyy2tdudR42ueY0mhsPps2
         lVO8mcMkBpQ+UJUV6q4kf+VnAGVy8RmESozNYGarWzJLfSH7LFgbvKx/hM6mWQw4E+7N
         njrgut3LggVnMXfcIA2wXeCrDWH2+k0WnfxsH0yPwoOMJerdldpqHdDQfCXSGwguxT6D
         WoM9zlBuOREQLRXRdSJWiuPqybxFelEgH4Yefs93AINh2WQhrodghEbfR+5QeAyQ0UkG
         XtsA==
X-Gm-Message-State: AOAM5328YsHAkXkTv2JZ/twO7zKFsef+5buq5nzEM/662rY6ScKLzLP8
	UW8wZY3ObNKGJ3dYXYz0xiC6ALX9fEZ+Jw==
X-Google-Smtp-Source: ABdhPJwdK+r25UifS5rvlr17vVqfRhcCK8ipw6UJcRaQFDztsdY/JNJwDZACN7GMpAQ+Y3Hmgq1+pw==
X-Received: by 2002:a17:90a:8908:: with SMTP id u8mr4800629pjn.135.1615664224474;
        Sat, 13 Mar 2021 11:37:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id c72sm9135522pfb.165.2021.03.13.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 11:37:04 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mongodb: Fix build on ppc64le
Date: Sat, 13 Mar 2021 11:37:01 -0800
Message-Id: <20210313193701.511004-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mongodb/mongodb/ppc64_ARCH_BITS.patch      | 18 ++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb         |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch
new file mode 100644
index 0000000000..471d5629a1
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch
@@ -0,0 +1,18 @@
+Subject: [PATCH] stacktrace: Define ARCH_BITS for ppc64
+
+src/mongo/util/stacktrace_somap.cpp:89:2: error: #error Unknown target architecture.
+stacktrace_somap.cpp:92:33: error: 'ELFCLASSARCH_BITS' was not declared in this scope
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/mongo/util/stacktrace_somap.cpp
++++ b/src/mongo/util/stacktrace_somap.cpp
+@@ -81,7 +81,7 @@ void addUnameToSoMap(BSONObjBuilder* soM
+ 
+ #if defined(__ELF_NATIVE_CLASS)  // determine ARCH_BITS
+ #define ARCH_BITS __ELF_NATIVE_CLASS
+-#elif defined(__x86_64__) || defined(__aarch64__)
++#elif defined(__x86_64__) || defined(__aarch64__)  || defined(__powerpc64__)
+ #define ARCH_BITS 64
+ #elif defined(__i386__) || defined(__arm__)
+ #define ARCH_BITS 32
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 3214918db8..b78255a049 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0001-stacktrace-Define-ARCH_BITS-for-x86.patch \
            file://0001-include-needed-c-header.patch \
            file://disable_runtime_check.patch \
+           file://ppc64_ARCH_BITS.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.30.2

