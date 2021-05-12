Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.68.1620778029196125354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 17:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AeUQ2t4K;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id t4so11629799plc.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 17:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S6D/q6qRDCZXthAx9GnVhrE/e0b5S79wSqesBnmnKkQ=;
        b=AeUQ2t4KvAalqxP8unrGRqzVEc4drNNdBUkMMhAxY6sQt2M6CU6RtgTDduXbeE0Ccz
         z73kQxG+grt3THyCvv68sd8CgXrJPuRwGoSnMy2ChgyynlY+fSQmKCCD1oDpBTco3c+/
         fYtqD4xkF0Cn9pWf+4sBBRwZxap5u6wxdnIpe7EGpLbI1ImW6B6Cdj0JTlAhMJUtDV0b
         aBNJbiRAecGGjtyRhnmEFuHaev24zrwRtusKzXOol3dmcATbOOngOBlEMij1N49c/ETB
         EOq4HTIUJ7t+Sr2phX9XBZIycoT3tsWqLvfBh/1mpHUclQzMJu+cIAOKg9gCUxt12OfF
         PX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S6D/q6qRDCZXthAx9GnVhrE/e0b5S79wSqesBnmnKkQ=;
        b=EGt89uhjLoRPs21jhWkhqSQC0XEpgrKXRSP41KKJVhohXrtM/l7FOn6tCWQvJEeKLO
         tHu922QUGeXr8DKH37VM/Wc/kvMRUSCZ5Hkh9lg6Qyao6/TM50U93cz+AUalYf107g0n
         Gma5JEtrMasHjjMYEZKnyHgO5iu2OmOik9Hvxfrid0npGsHGRVuxK1K0Cuqyv30Lyh/g
         RcmQBGjpJ3WQ6iNwXJjL6JPicB+VK3ihCo7BEGzPajNIPDLvX2sLdnJ+zj4+6aD5aaLX
         jjEKhFjArOJWEoc+udO63JV8BMn1yb42itO/RwC1KtEArPzrP5yvHNxN1EpERsQp2tJf
         arMw==
X-Gm-Message-State: AOAM531Ew3cbPdI1lyV/55oenXZXjzkRPAF31TjgQ1nOX8TSXZV4rl1u
	3j50j2eX3uaaGTjE5VtKFWJ04M+htq7gkQ==
X-Google-Smtp-Source: ABdhPJwLb6MXrWGPd3KpIFl6JWmp1gptdwuCFujO41NM3lKBbRy9jHZt3qACrHhK1BcfrctJsC+ZxQ==
X-Received: by 2002:a17:902:724c:b029:ef:571f:8894 with SMTP id c12-20020a170902724cb02900ef571f8894mr6697216pll.49.1620778028422;
        Tue, 11 May 2021 17:07:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id n30sm14675966pgd.8.2021.05.11.17.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 17:07:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] tbb: Fix build with GCC 11
Date: Tue, 11 May 2021 17:07:03 -0700
Message-Id: <20210512000704.2889545-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512000704.2889545-1-raj.khem@gmail.com>
References: <20210512000704.2889545-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...f_input-Use-an-arbitrary-but-valid-p.patch | 37 +++++++++++++++++++
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch b/meta-oe/recipes-support/tbb/tbb/0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch
new file mode 100644
index 0000000000..caa68e64c5
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch
@@ -0,0 +1,37 @@
+From a996fd451bbd7be93cff5f466bff7282ae972fe1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 May 2021 10:52:51 -0700
+Subject: [PATCH] set_my_tls_end_of_input: Use an arbitrary but valid pointer
+ as value
+
+Pass a valid pointer to pthread_setspecific to avoid GCC 11 warning.
+Fixes
+
+src/tbb/tls.h:44:46: error: 'int pthread_setspecific(pthread_key_t, const void*)' expecting 1 byte in a region of size 0 [-Werror=stringop-overread]
+|    44 |     void set( T value ) { pthread_setspecific(my_key, (void*)value); }
+|       |                           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
+| compilation terminated due to -Wfatal-errors.
+
+Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/394]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tbb/parallel_pipeline.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/tbb/parallel_pipeline.cpp b/src/tbb/parallel_pipeline.cpp
+index b7655c6b..ca518b5b 100644
+--- a/src/tbb/parallel_pipeline.cpp
++++ b/src/tbb/parallel_pipeline.cpp
+@@ -243,7 +243,8 @@ public:
+         return end_of_input_tls.get() != 0;
+     }
+     void set_my_tls_end_of_input() {
+-        end_of_input_tls.set(1);
++	// Use an arbitrary but valid pointer as value.
++        end_of_input_tls.set(array_size);
+     }
+ };
+ 
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index 771ddd49b8..f4c52daf41 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH
             file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
             file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
             file://0001-Disable-use-of-_tpause-instruction.patch \
+            file://0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.31.1

