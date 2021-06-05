Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.7526.1622856612049494581
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 18:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=okF1L3jc;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id g6so8692656pfq.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 18:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k7Fbg7Zi1PAcTDUKAPTgosw6yTOt5i2596XB0dzW7Mk=;
        b=okF1L3jcjlgmY222Y47VrKpAwgEIqRi6LLUDUnheyIQLqsc1NVxuEBRfk4RnSttvq4
         QmvRd7JNeyHjOY3Hla3HluxNY9QYMpW5W6NYXj1kTw/to+8TT6IFSaETbBg3rULruX6/
         +qNktvUulqdqsYPDU6NuppTQ2vq5VtEU06qMI7Yk4mXMqcx6fW2Hu4G9FIHk+tJverfJ
         LreKmzfQ4McdJVgDXybfYO/CusPU9pyKXQLzDvGr9iDV9qYtBsVBss1ogYsCTRU8eAwg
         JOa9C0EY1yKZcD8N92DehA260A5t2pYGwUxGoP5psTG51sotNzqIOJ89PqisHeCrvaBe
         QPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7Fbg7Zi1PAcTDUKAPTgosw6yTOt5i2596XB0dzW7Mk=;
        b=WfrrxRq+CZV4RKqPTA0pl0pbYGfztvZLPqE9MQiOr4r937TfIC0LZDwhh4T2yVJf2U
         S0XmJaBtaQ38jRnD8veu60GR/MJh4ii16rzoEyufdaeVLA2vlKgnS8sObCalHNBjHEMW
         g+Dqg18EDedQDUP3NmkVBmxzPCKIuCXzfu+7tpHAfcTPvp5a5Iy06Gg1TOGY6w1Z/bA8
         EVEb2g6HtNgUGhfHUC6F1J2kyNC8AwneTM9GxxX6bCtYizHdsyKleojmzSuVx2JUdqiu
         BSVSnDAUAb3gvecXCHWNrdBveRrrAEO5UrOw/nSdHnYgMAKD0b6X1lKfGtS/A4VxW2Es
         gu+w==
X-Gm-Message-State: AOAM532er2/boq1jxvn9gJb54NYldvDwXAJqmevFSpGitC7CPQF4tb7Q
	hCqZAkk8jwDzJ2tTPCOqqjDt+qsGN0mzjA==
X-Google-Smtp-Source: ABdhPJzz6XW/CFcnMr7E5+XeUM+HmIBhxtZ8QFxDVa/GnLcqiHv4WL59ae+fs6Z8N/P5dJ4uSGxhuQ==
X-Received: by 2002:aa7:820f:0:b029:2e9:3aea:2e05 with SMTP id k15-20020aa7820f0000b02902e93aea2e05mr7277305pfi.13.1622856611299;
        Fri, 04 Jun 2021 18:30:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id q68sm5767188pjq.45.2021.06.04.18.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 18:30:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] tbb: Fix warnings with clang
Date: Fri,  4 Jun 2021 18:30:04 -0700
Message-Id: <20210605013005.976154-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605013005.976154-1-raj.khem@gmail.com>
References: <20210605013005.976154-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tbb/tbb/0001-arena-Remove-dead-code.patch | 40 +++++++++++++++++++
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-arena-Remove-dead-code.patch

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-arena-Remove-dead-code.patch b/meta-oe/recipes-support/tbb/tbb/0001-arena-Remove-dead-code.patch
new file mode 100644
index 0000000000..8a603ffe30
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-arena-Remove-dead-code.patch
@@ -0,0 +1,40 @@
+From b94a1e3d6b5c733ba24cfa0d35450d8659d48289 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Jun 2021 13:07:28 -0700
+Subject: [PATCH] arena: Remove dead code
+
+Fixes clang warning
+arena.cpp:226:19: error: variable 'drained' set b
+ut not used [-Werror,-Wunused-but-set-variable]
+|     std::intptr_t drained = 0;
+|                   ^
+
+Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/429]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tbb/arena.cpp | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/tbb/arena.cpp b/src/tbb/arena.cpp
+index 4a9c0f8a..c8ed4999 100644
+--- a/src/tbb/arena.cpp
++++ b/src/tbb/arena.cpp
+@@ -232,14 +232,13 @@ void arena::free_arena () {
+     __TBB_ASSERT( !my_global_concurrency_mode, NULL );
+ #endif
+     poison_value( my_guard );
+-    std::intptr_t drained = 0;
+     for ( unsigned i = 0; i < my_num_slots; ++i ) {
+         // __TBB_ASSERT( !my_slots[i].my_scheduler, "arena slot is not empty" );
+         // TODO: understand the assertion and modify
+         // __TBB_ASSERT( my_slots[i].task_pool == EmptyTaskPool, NULL );
+         __TBB_ASSERT( my_slots[i].head == my_slots[i].tail, NULL ); // TODO: replace by is_quiescent_local_task_pool_empty
+         my_slots[i].free_task_pool();
+-        drained += mailbox(i).drain();
++        mailbox(i).drain();
+         my_slots[i].my_default_task_dispatcher->~task_dispatcher();
+     }
+     __TBB_ASSERT(my_fifo_task_stream.empty(), "Not all enqueued tasks were executed");
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index f4c52daf41..0b039a181a 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH
             file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
             file://0001-Disable-use-of-_tpause-instruction.patch \
             file://0001-set_my_tls_end_of_input-Use-an-arbitrary-but-valid-p.patch \
+            file://0001-arena-Remove-dead-code.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.31.1

